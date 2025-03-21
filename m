Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FF0C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TC3r2kF6h1DguPsHjjEeqn2dDugjdFWL1T8eZNZFK7U=; b=L/75Puy8GMafZ0jjQCr6vsSDWS
	oCAHVGoIELdE/F2Sjiw98+0bhK1mgAT5+TRtV772rNHpVRk3M9jm5Eo3nGZvewL81BX/3Ym3II2SI
	GCPx4z9wbddBj6azPtTpg5PK77lbAXaNjbSLdbz+ATtAIaStRYoGbuZ/et43j9nBjZDS0XPaMWqaA
	KiEM72o8zXyWiCQIBMuU/TPNJLJ1+QwQMApsuiyj2BYlpcIWRhkkpBSOAHlsEB4f4OjusA9S4p0GU
	wzPDn6ndgBK/mMHuQb5Kf+d6FhbE3bfPfsoVCr1SfiFCIGg0fsF29sLaTibzs11MbJ8yj47yrDTsF
	PTkYy8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZjW-0000000EXdh-20Fj;
	Fri, 21 Mar 2025 10:36:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZ5f-0000000ERkK-0Hzw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 09:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 626BD5C6D92;
	Fri, 21 Mar 2025 09:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F7FC4CEE3;
	Fri, 21 Mar 2025 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742550898;
	bh=TC3r2kF6h1DguPsHjjEeqn2dDugjdFWL1T8eZNZFK7U=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=G92hIB2X8Wwiys82uVSEu8Uj+jPevWW5gsMb3/Ub2Aj+nRnnmXcl2CCx9MQi6BPJj
	 mVImTQqhYbsPkD8BIiI647oQtRIjVeHMufD3xer3lpfyCgJvyOyvoA/LP1Z8Gc/730
	 abkxD1wnAEeW/wtqcCXh6SBggwAU2VRmsIZnWlbDrR3IeIyg6H887iljJ0ETRiHCpq
	 0b7ce4aBeogQ+Qu1l+s9eel6AM6qEmh+MiJdXqDZEkYNfBhHZXy+ePNgEogfq8WGUQ
	 SAAXeQIazO4EvxYj7Ac0E9uVNt8MSooPVFDswe5s8iP+dyQ3zVCYVUAUfxqscGyowc
	 1HawfIyP4nC1Q==
Message-ID: <400466cd3c229ea6c6cb25e2a58cee27@kernel.org>
Date: Fri, 21 Mar 2025 09:54:55 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 2/5] drm/bridge: add support for refcounting
In-Reply-To: <20250320-drm-bridge-refcount-v8-2-b3ddaa9f1368@bootlin.com>
References: <20250320-drm-bridge-refcount-v8-2-b3ddaa9f1368@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_025459_162945_C690DE6D 
X-CRM114-Status: UNSURE (   6.68  )
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

On Thu, 20 Mar 2025 16:42:11 +0100, Luca Ceresoli wrote:
> DRM bridges are currently considered as a fixed element of a DRM card, and
> thus their lifetime is assumed to extend for as long as the card
> exists. New use cases, such as hot-pluggable hardware with video bridges,
> require DRM bridges to be added to and removed from a DRM card without
> tearing the card down. This is possible for connectors already (used by DP
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

