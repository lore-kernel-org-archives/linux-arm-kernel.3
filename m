Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D214C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jppauUUDGp2cJoxy9fVvh98awH4wD724Y64Qn64BGrw=; b=q14bzANIgcLFzpMkioGhZ5qrDk
	aTaRnyZv8ey3RDuu+vgKGOP/dUfgXMTQgMkhrKqAJRR3Gohiichoa9nNjjS8RZF9WlxWWBqdDBR0t
	Bu4XCi7NBg1ya2cMJzdTBhJ4/TYUVQzCB60wFqqSxaf6eUfWz6E0hN8P9p2n+e5V7pNeVvyh/nFcT
	7++ZsmfAAG+xt7OTu7zi1Ywv6dIKBNnxhRXP2tHDmAvmGgrdYFx15hjBsaTxqeDgx1WoEd+barwtk
	pkb0LVhQbRAKUpJKRoPdIsFvQ/d0ErECd0A70m+phaGL9IY9d2MEQZm5+puhfe38mVUHHr0BpGI/Y
	if4cC72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQfJ-000000082zh-0LbS;
	Wed, 09 Jul 2025 09:00:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPFg-00000007oa2-1KSq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A16E043B13;
	Wed,  9 Jul 2025 07:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E28AC4CEF0;
	Wed,  9 Jul 2025 07:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752046199;
	bh=mesKawbAqGOsh7bohcTkyaAxH/esyPJDz/sQbVjit0Y=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=rzZlOOemBNXpeusjY0UrbQO/c5QAsb36WqTetr2iL0Lq5uA907BSKf/xcgxFM7IQC
	 qjjtpQXn9/ADEjnNHaI2wg4Jfq6ZTxV6OfJoCt7p/RxaW+l1dI06C5QLbsPKC0ndQG
	 +9zEKOZ7vWzLKfeIaQdxNbdnsQ/7HtVfJHeDAiALy5Av8twX67E9sQ/QHpRDCHJZ0B
	 Nz+8MdUoS8Uo/SLI4mmzOKRD4BcEig5HmCif7zKeIjdIVNYdW7nJZ66OzFaNAa4c6H
	 soTFho4+NP36L2+ZjY4LVanxNLtaC8dNojW+m5v2/y17Fq+kcWZJvdmHYRGj2Dhx1/
	 5aHrlnkxlDoFQ==
Message-ID: <346bd17a09abc913bcb2565137aa93fc@kernel.org>
Date: Wed, 09 Jul 2025 07:29:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 3/5] drm/mxsfb: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
In-Reply-To: <20250708-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v9-3-db1ba3df7f58@bootlin.com>
References: <20250708-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v9-3-db1ba3df7f58@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Vasut" <marex@denx.de>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_003000_382429_694437E6 
X-CRM114-Status: UNSURE (   6.98  )
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

On Tue, 8 Jul 2025 17:48:20 +0200, Luca Ceresoli wrote:
> The bridge returned by drm_bridge_chain_get_first_bridge() is
> refcounted. Put it when done. Use a scope-based free action to catch all
> the code paths.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

