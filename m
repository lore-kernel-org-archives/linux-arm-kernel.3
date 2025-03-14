Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CF3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAukMS2ILtKbLjHuzHoi/DZCiYfIo1pFD0EalJoHSOU=; b=pyxavJv1djNC2tXLJ58lS5qh75
	xbqFoHDa30G/UvwJCUot0aabCB0GmZF095k++3flLu2Y8uOJc+iv966lrwJmnUDojhRwLpNkbD42T
	wAUPj5gjskR8CRuTJaRvW6DZPMLtnJ9tKGBxcRxlrktfmHbTwJYnY0wC0oluysafL/Rs45uBPypxT
	F1Ds1Uh4EWMzc3yVCbw7rjbleDtwmOgWHtgEgCCEQj8y4s/57b4WfyDUrsCtmXHaD5BT30acWt6yK
	4VRkWBp/27dWoBFCSKun7ac3aufju39bP5CGjNw1roixiBYsB0mc7wkXHchK6xprZzO1XeAI5pRDU
	aQzmjogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9fy-0000000F0mP-2vDJ;
	Fri, 14 Mar 2025 18:22:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9PZ-0000000EygS-3tqs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D11C5C4B29;
	Fri, 14 Mar 2025 18:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BDFC4CEE3;
	Fri, 14 Mar 2025 18:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741975532;
	bh=lhEsW5DulyDSp0JArffKcqrIScwbmbvbf0ZjrL1HpS8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gzeTk1PCeOr6rPGhDbklSh+BDQerfNde0ttF/29dB0QzvQXCnn998ZRW02qHJTf5C
	 2Dp5kPrBi+P7sNsz1LWOzMKJNWEBvTt1JGAnqdFqujlhDf1a4C1VUDWCK7y8UZuh5g
	 V2CCeB04bQlWY69deQ1X+2heBphAGne3remu2rcmLCfDuoGvqy+4uUvkj5DYqNuGw6
	 oUqnDOTKy6xlvV1VM8WTTJpZP0I+uOsEbzK343Y0y0j6+4JJiTxFazz1fWIwjQA93b
	 /yBSGrPOXHFnIuESpBNdwRDh9o7Ds3tyG5Ofc7yXqHzWHtNqmGSfP6S0H6Ez3mAgcd
	 SYJyZ0Bdw7npQ==
Message-ID: <50d94c0223e60881c014bddd55382692@kernel.org>
Date: Fri, 14 Mar 2025 18:05:30 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 04/11] drm/bridge: get/put the bridge reference in
 drm_bridge_attach/detach()
In-Reply-To: <20250314-drm-bridge-refcount-v7-4-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-4-152571f8c694@bootlin.com>
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
X-CRM114-CacheID: sfid-20250314_110534_029221_D7A12417 
X-CRM114-Status: UNSURE (   5.39  )
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

On Fri, 14 Mar 2025 11:31:17 +0100, Luca Ceresoli wrote:
> drm_bridge_attach() adds the bridge to the encoder chain, so take a
> reference for that. Vice versa in drm_bridge_detach().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

