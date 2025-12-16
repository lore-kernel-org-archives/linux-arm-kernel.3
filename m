Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A0CD5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5uPWZ6Lr7MAkxFBOMnsx96OvBhWnoiy7PCuAKeiZdc=; b=Aw2i12oYa0xd9U2PvjpKxSvr/m
	DJyqMZeAZjMbQLhrE7J5rQ4Z6Ak8C5xO2FHDkYQk65uFb0H7nn7BhrXQtaFSRF3yMa2CNFPDXmUMh
	m1IXwceA/297H0q/+15D4WQaWU1+wYWIaQqdYuCWn+DcvoaRsRc3Vs4qbQ57ATixGgHxho264luZc
	R+9O3e9WJX8dBscPc5jtcaAFJ23aM+GWCBqUAtHfwew1LFRtqFaNnFgGS4QJViepBHGOcWeqa65HK
	W6t5MTBJmr744MOwGtofu0qnR4wrf/q/+nCaSdpJZeN6KhaI+PWAV98x58qIjUt65VVTGTeZujhqU
	Hin3sbGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVO8S-00000004jvF-11Xw;
	Tue, 16 Dec 2025 06:02:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVO8Q-00000004jue-0Whv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:02:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0BD241A93;
	Tue, 16 Dec 2025 06:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEEFC4CEF1;
	Tue, 16 Dec 2025 06:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765864929;
	bh=j71nItXmXIKCMM0R/7gVdAjrN/hym8eo9wF8FkHlOKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nlHjHtgynkgV7LwOiUcoq4tcA9aP4YrgO9FDJeRd+QaSWa4zpVEqAN56DLQO/fai0
	 bLfdD78xt/30clGZh4ZKqkpvRfHOKnVIrDGr8HlC/R/bHzvv/w5mOharibF4o4dvmU
	 KqMNnoOM1tMC7mw6i+rGRj0UAYB2imyNbdwvmzdrkOyMoYYMZpPf13Kenm1K/dGN3o
	 oDg6Qny37EApIATiSdGbHfrQ94TAPXOnCnANH2obidFYg5EkmS5EHEtXAVjoeHcGBu
	 uE13tagbHdDHKhbDPbQJBEMY3rR2edzZniy81p/3oqHJOe+/Rk9Ew42QdXjGOhjhea
	 jkTT76695s2PQ==
Date: Tue, 16 Dec 2025 07:02:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Miguel Gazquez <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 02/20] dt-bindings: display: tilcdc: Mark panel
 binding as deprecated
Message-ID: <20251216-outrageous-dark-bloodhound-0dccfc@quoll>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-2-f48bac3cd33e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251211-feature_tilcdc-v2-2-f48bac3cd33e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_220210_188021_61E37B99 
X-CRM114-Status: UNSURE (   8.33  )
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

On Thu, Dec 11, 2025 at 05:38:46PM +0100, Kory Maincent (TI.com) wrote:
> Mark the ti,tilcdc,panel binding as deprecated in the documentation.
> This legacy binding should no longer be used for new designs. Users
> should migrate to the standard DRM panel bindings instead.
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


