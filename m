Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74721C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdg784aOYYW6jefVm0E8zeOFLKl9s2OwGEMLMn6YbuM=; b=03j41Wi5AmuYpq3OavWzxxoxio
	dP7VZ/5IvzOYVEK8z1NCgKkVYRi8SW1huxT09S12fcmS0HIK2yOQkC9z3xpObGLYdnqoutUWRumYo
	+qdYuOKu+pww9fsZwsoPuTHC64WPki/tTCBXpRUmxhre8m30J4lYJibSalUdCjpR0erdtOsDmFb5+
	iQxpP6ZhlhvZl75Rgsq/wF2qlVLm75kjgoBgkq3SpbCTbLO6WKJvLhVcVKwYjWLJ1XRvhewbdIHA1
	/RLflF5YAHjsuCfRxAGrm/+QQj0N5/zj7uljACSOLolRdv5r3GZaktcSl19E58J3Pc+wSM672FKPG
	Uy0HJXdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9eL-0000000F0ZC-0C2e;
	Fri, 14 Mar 2025 18:20:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9P0-0000000EyZ8-2o0L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:04:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE3CCA4781A;
	Fri, 14 Mar 2025 17:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D258BC4CEE5;
	Fri, 14 Mar 2025 18:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741975497;
	bh=LHJM4OU3kl+/G82P3FTZUg4E77KcnwgPswr6Flbh2rM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=nYPb+g6H7LYrbum7aeROxiYnk8fie4nu5F72GWC6DsqJdMDyU3nPz9+7gWsXus3ee
	 MeQy+KYrAW4fvRe6QGQZwzQivZeF4GHmXZD7xliFgBFa97c18NhkYGfWvfqCvogNrY
	 iD+m2/Yb8ki4IbQWPiMKW1GqFp5YRXdlUWbUwsOwmfUs5VL7uKutAJsCEvuFjSMpB/
	 evvxcBfpCZrvdviy1gsOn/h0ldaiEtEl5qUYIM59+RbhL8E1RUtdub+IP8mQ+Id58r
	 4MRlBQb6/tmg8O8NMwrAtg1yM1d6mSNKRB8ljvt2dJqhLd4YMAwk5EB1kjNLdjq2Sr
	 0bRogUFvyBX1w==
Message-ID: <4199151804db21307707fc7e023d10d7@kernel.org>
Date: Fri, 14 Mar 2025 18:04:54 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 03/11] drm/bridge: get/put the bridge reference in
 drm_bridge_add/remove()
In-Reply-To: <20250314-drm-bridge-refcount-v7-3-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-3-152571f8c694@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Fabio
 Estevam" <festevam@gmail.com>, =?utf-8?b?SGVydsOpIENvZGluYQ==?= <herve.codina@bootlin.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_110458_772864_04B1E2E3 
X-CRM114-Status: UNSURE (   5.09  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 14 Mar 2025 11:31:16 +0100, Luca Ceresoli wrote:
> drm_bridge_add() adds the bridge to the global bridge_list, so take a
> reference for that. Vice versa in drm_bridge_remove().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

