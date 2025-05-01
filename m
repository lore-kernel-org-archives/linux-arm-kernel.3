Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE8CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 11:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDixLVJkJSr18pzCi3I0mc9yi7XCZ3dvASfzpKmBjGA=; b=HYjEa0SJ6r3fG4Q0usFiXKGn7J
	xbpRuxY3TZztTLRroxMgGelokZVXdvZTAd6HSDLRNHKGE1VcGfEu8KbymPAw9uzKVLKIdrmgQJrsD
	M3Bpfy2TXb7PRbVgJiMWW1Iz38FolRXbxZwwjPSbisg4/BYpYvD1aDXeDKLnJInCuLE15dn0Dakuv
	sLIFwoO/czmtxqb+FhZPh5ycvaJIWDBpxSO39r3Cgx1GwMdxaQ17+XFStXOoFXo5t+Vy6WxYgDYBr
	C57jYd83r8EYqpf5Ac+wo9BRWqGM9+V5ZtbUJH0dL8PASkmSFTCAxpLyCT1iRKS+CLR00FYbjKFM+
	dWPcQFow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARnZ-0000000FFp2-3HYM;
	Thu, 01 May 2025 11:09:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARiG-0000000FFKJ-3fcv;
	Thu, 01 May 2025 11:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rDixLVJkJSr18pzCi3I0mc9yi7XCZ3dvASfzpKmBjGA=; b=1caFzCaEIheOlZdhkSdrPr/m/L
	dOyj2gNULahSxTBEWMVYwOnUOlZhUY7mH4bFy6Maw4wC+VvIBvKFYdes6SDWkgM1OgzKYDs9GfGpM
	O4IDJ2lJAWd+I8qU0gXouPgNw36xGfPHAC6XEFyvMhFZeHu0aO14gD0GyhrmiIeYh74kemsNT1Ia/
	0tZz8In13dEW5at2YezKMRL2b//83IBEYlMUyqHRgTXSQLJXzoahcKIstDAfn8FZYlh2f/nkTyCYr
	78oqLz7jpYWpAh8GzMt8zgToj/idx5JjenvQQbCfEKlS/ZI39q2kVmY0GhKb8r7VwP1w2kxvq4V6q
	s99JoitA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uARhj-000890-IR; Thu, 01 May 2025 13:03:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: add CONFIG_OF dependency
Date: Thu,  1 May 2025 13:03:44 +0200
Message-ID: <174609741908.389921.4591931319484146397.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250423164422.2793634-1-arnd@kernel.org>
References: <20250423164422.2793634-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_040420_912280_1215E305 
X-CRM114-Status: UNSURE (   9.56  )
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


On Wed, 23 Apr 2025 18:44:16 +0200, Arnd Bergmann wrote:
> DRM_DISPLAY_DP_AUX_BUS cannot be selected when CONFIG_OF is disabled:
> 
> WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_AUX_BUS
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>   Selected by [y]:
>   - DRM_ROCKCHIP [=y] && HAS_IOMEM [=y] && DRM [=y] && ROCKCHIP_IOMMU [=y] && ROCKCHIP_ANALOGIX_DP [=y]
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: add CONFIG_OF dependency
      commit: 4f1a965d592a0ca7d4ee2125f54d19ba8292295a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

