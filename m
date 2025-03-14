Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2EAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5MpDNP2y9e4Tc7GPbEUai4ECqd+Wa+YufmrM72PJYc=; b=Fiv+ILWpkX0EQBh+adK3+zoH4w
	xD8MIy+87SDNKu2OqLgW9VbjSkgWjcDQ1BBfP5qzRZpLLilSsnB+dhbfe9S0C5b1H+U2oZfoy5iWj
	GQiQL25gZcxgWyHkXPYkaGuqZJ3QoQfukhlaxHznB6gBQzCAcVJQiBqVfxBqRMPZGS1sl1kVu6He2
	xpFIOLFuEhue1DPH9AvM5/NNGkqSLsZZiEo77Xbs5mfohmbKOrWs2k98PoFWujPk4Rs8vHpXCPD5m
	sK3kG5vwZddzAi4i1jstS6zS85nfIHifVvyFzWUlqqn2/Y6SThSN0G3tC8aUyTs8TCXeGLdc9XZYL
	IwjG89MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9oC-0000000F1bo-13Z5;
	Fri, 14 Mar 2025 18:31:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9Wm-0000000EzdM-1MVu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A78CE5C5443;
	Fri, 14 Mar 2025 18:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A112C4CEE3;
	Fri, 14 Mar 2025 18:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741975979;
	bh=j5F5voyqMDf/Acb+Qij3yNPtv2PhlZR0mqxo0ZOIE8g=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=p9hk6SIOYoS2epV0wJxk40iVLBI/2s1h2Vw9v3hso51YWQnMQOVnWh8snIwvEOLeN
	 QMrxmUvXFWSNXOt4+QtFsOjAp7w6B9qrI/IA+TGqPobkBPN/+YI8K2Y3aMLudmUXpz
	 nKHB7WvV48iMPitNP6aq0BYneYwVkShT8WQmTcLAaAU37wtzDO9nwwpS/LXn44D4GY
	 bZpUNiMp/oTrZH5H7O2RMa12mZUFRKuZyNGerFmtAsQiYxx+rotnCqNSmW5G7capiI
	 GRixaeMfk64vPGV9H8O+K8WJ6abRCVb2zrXqqUO93oQEV1Or3i6EgK6CnlaUGU6khC
	 AsgBYYTQzGxWw==
Message-ID: <0cea0c073dfc52c20f583d64b51d7951@kernel.org>
Date: Fri, 14 Mar 2025 18:12:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 09/11] drm/probe-helper: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
In-Reply-To: <20250314-drm-bridge-refcount-v7-9-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-9-152571f8c694@bootlin.com>
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
X-CRM114-CacheID: sfid-20250314_111300_419339_C3A87F89 
X-CRM114-Status: UNSURE (   5.80  )
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

On Fri, 14 Mar 2025 11:31:22 +0100, Luca Ceresoli wrote:
> The bridge returned by drm_bridge_chain_get_first_bridge() is
> refcounted. Put it when done.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

