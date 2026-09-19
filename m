Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B054DC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 17:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wqtGKu4ehtoV9DVHcDQz0i0Wul1TLpZRrMxi7IKUvp4=; b=PHPALrHkP4xxJKIQ6U0WYcFv4T
	jjxiwQxm51fzO8lTqQUeUG3k0DC36XPQkEO5+1dSBBRr7pEIpCiLC6dHcjOvNocE436DbGJEm6p1v
	uy+38e70BXKBUTSM7alQbPbu3StX67Sx5BOG/hx2tinmrBqVyBj2LfqeSTZ82h+wBQspgZ3tqNj2E
	q6MykZUrIWP9nlAD6aKtrcNAQYWvNsFOAwp2NiOIpiSCbfQrTLsb6UyYWeQ27VgPPW4T4ovIQqGh6
	0dnvno55nNVFq+gbL4v9PYJSEzKO3IhvkxQvaH7TG6lJYgBkyHoCcrg8Vx/gn2z1T32hPzywIpZ/u
	RmmwRrEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7z5C-0000000GYa4-2jWP;
	Sat, 19 Sep 2026 17:42:38 +0000
Received: from mail-pj2-x06.google.com ([2607:f8b0:4864:39::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7z59-0000000GYZS-1eOF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 17:42:37 +0000
Received: by mail-pj2-x06.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1289527a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789839754; x=1790444554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wqtGKu4ehtoV9DVHcDQz0i0Wul1TLpZRrMxi7IKUvp4=;
        b=JpRq/3PbIUuWmhgdTjrQceLQqpoX+xL4kp3ZXdNI4E4/BdjeNbYPunvApHHp4NE/je
         gdwlC1CX78OO7ZFj+f2N5E/faDuC7L70QePTjJQbVX7iihgFV/zirVXTgAMfPUqXjFAG
         yF9Jd0fswd7QiHeA/uYVQ0FnD8LTy/k0Wpgqn1mtbW/OCd0K8hHsZt7vqRO7quVkm89X
         B4+ErQNAp54onoKfKRh2qBikPbzq/mALFtCiKj3v4SpL0LW6mooLeHicQGamZLsZiEVh
         Qkqs9ch1CZi/pau4ANlj0NcSrkVOqgVnKCJmPDFxeJlyCmHLVNInLSYRPm+vM3uLS8Xt
         RDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789839754; x=1790444554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqtGKu4ehtoV9DVHcDQz0i0Wul1TLpZRrMxi7IKUvp4=;
        b=dGH+5EHsXZKju5wkObRLwfbDgYGofyatpsjSQB7TUCZTsoRrCoeT8xAmgNCSryjw2e
         UznXC0D9nRLrCk41l9O3BrnaeX5RwRqzY7R86VcbmA81RkZN5OOO1pLry/dfyeLt6s0F
         LM/NiJ175ER2aQV6fhYOzy3+fbEaa2iZd9Safg2bGEevpuAkkQ7uly3xJDYZh3Sp6WWO
         hNmZvUw1j1BrPPuOsThxCNOdTbN4Jcmy0TQScbiWTRz4YV0OUrS5iAzhHgqUrNYabW+Y
         v//PB5uCMVHChffUkVkvtrXJ+iMw6cknj4Y/juhzMPmExrkPjrJQY4/tCmpnS21QWGQg
         Cnzw==
X-Forwarded-Encrypted: i=1; AKwUvBxQDby+P58yJG1ynkDtFnjdUmrvr1snBbgM/WD7Y3px45Uk2Ek5zPC57tRdmiUtuRQl8xY/tbPPTgQYVAwXdJFd@lists.infradead.org
X-Gm-Message-State: AFuF++k4HusGuyAMlDRjGQzAzPLugW65HWtEW4JYvLfOcnREL7mFGQny
	tZih54NAoq1DiXxDpSM/yYY2WwDRmav2r0NTO7QbDpQcBCUT7/ympRZ4sc+zV77eNXY1jg==
X-Gm-Gg: AYBFou33GA/7yfj6j4yCogxuHfCcGwAQdPyewe+XDckJRrKmoxf2yPTQtAMCFmBE8KB
	qlQ3hQs36HT7IUVM25Nf0DqQNwt9vFOdi21gc17H33XkWXQFr4v0j3GeFmtNWLI72gyfByU/fDS
	rUMuLKviKFzVUcaLvYMMuHwenL1spUaiY/qv4klDA4n2QL8MJNKsgxCjHnG7wF01CeLEV34kaby
	7l9jbdjFLudHzuVKCr/EuZkytW8NpRQGoPL41PRaDCtcKAs+bGAFOTbjSQ2bUJEYTwqWj1vasMY
	rMOg3bokDY35v7QqPKYe0TkNbpMk3svMY/pDS0vtsKraNdIYquxm9gXYNTJiBwfR+t+v42xqqRd
	KJOnbzonQDR8gSSELY6JRoHn5R3UaQshDfA1+CwMc0P7Ll1f9Ior9D6zA/0lWXzrN6VYaJAO+9U
	wPKfVtBhHNBGWmfP+F3wiqjlPPVcOt7tYuGU1rK7r7nwVRblkH+kM3udlt/CVHoHNTu6vkRBXwN
	M06b0+X
X-Received: by 2002:a17:90b:384d:b0:39e:6c6a:656d with SMTP id 98e67ed59e1d1-39e6c6a6757mr4257438a91.48.1789839754436;
        Sat, 19 Sep 2026 10:42:34 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6f1835adsm5144018a91.6.2026.09.19.10.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 10:42:32 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails
Date: Sun, 20 Sep 2026 01:42:23 +0800
Message-ID: <20260919174223.2356964-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_104235_430789_53B9D4E6 
X-CRM114-Status: GOOD (  10.73  )
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

gmac_clk_enable() enables the bulk clocks first and then the optional
PHY clock. If clk_prepare_enable() on the PHY clock fails, the function
returns without rolling back the bulk clocks, and bsp_priv->clk_enabled
stays false, so the later gmac_clk_enable(bsp_priv, false) becomes a
no-op and the bulk clock references are leaked.

Add the missing clk_bulk_disable_unprepare() on that failure path.

Fixes: ea449f7fa0bf ("net: ethernet: stmmac: dwmac-rk: rework optional clock handling")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 8d7042e689261..f3a98bd9d6ead 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1163,7 +1163,10 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 
 			ret = clk_prepare_enable(bsp_priv->clk_phy);
 			if (ret)
+				clk_bulk_disable_unprepare(bsp_priv->num_clks,
+							   bsp_priv->clks);
 				return ret;
+			}
 
 			rk_configure_io_clksel(bsp_priv);
 			rk_ungate_rmii_clock(bsp_priv);
-- 
2.47.3


