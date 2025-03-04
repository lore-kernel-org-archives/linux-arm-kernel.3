Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057C6C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pu83Mb40jejkNbJKC2LIx4LiblmoRe/j7LFnThEkjwI=; b=FUxlPVUhYtsk+b4o+rXV/KQUHv
	0gVIE/7+zxwx3GOy+Yv9yaWpo4RbiYTr0Q/4fHatlQAJ2KUPe8PdV00+T4FYVUlHUblmdqLQfI1Ck
	RDOvpX62pMLDW1PitaD9qPEsMlVzaBbSPkODir3SPpYiqCvN2xeheO5iYy7O+QqkLUZ9mTs/DNo1+
	mZ1IVL11BaFsihN+KzI6t25w8T5LMP/z42OI2//hjtTfw8rSBFGt9CHQqM8gfGPrWiG4aoh4/Q0v5
	hpnXTvk4khEUVMB0A2QkM8v/dVXufbd/9zq4pl33f8kru6rc31GsgHJb1VTxxuEn5fQCDfyyUBWXD
	ONsJER0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSoB-00000004ssA-0AB9;
	Tue, 04 Mar 2025 13:59:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRdd-00000004fqp-1GGI;
	Tue, 04 Mar 2025 12:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Pu83Mb40jejkNbJKC2LIx4LiblmoRe/j7LFnThEkjwI=; b=alw6DETQckRTX6x5yzyqCZGAtw
	xutdjeey1EdrIAPe7clsn6m3TkcERsyoV34D7JZPUXNyjH1MQnbLdMBvIHpUpQhstvKYa+DA/Ak8B
	UR426//s+1PaxuglwwVtNKIjGdqmPaECqhzW0EqAaTPrKLlaO2vy3LYVf3CWl7NddNQgpEnvyfhY1
	r90kNSu54aPsaJZKtJ7/zVIk4g/1crhNaNh4fNkzoh33FB4+AbXxGVSNswi/6zHZzGzB1kllq+EhE
	jCsKHhVvVlAq7yadddewH7twf3gdM80aV6jNv2vKSFy8bK4KBIB/aIloNYqgV2L6Uf5Ez+RMKcoap
	q09asTsg==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpRdS-0003B0-MR; Tue, 04 Mar 2025 13:44:34 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v3 3/3] drm/rockchip: lvds: lower log severity for missing pinctrl settings
Date: Tue,  4 Mar 2025 13:44:18 +0100
Message-ID: <20250304124418.111061-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250304124418.111061-1-heiko@sntech.de>
References: <20250304124418.111061-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_044445_388395_08F98F22 
X-CRM114-Status: GOOD (  14.23  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

While missing lvds pinctrl is unexpected and is reported, we nevertheless
don't fail setting up the device and instead continue without explicit
pinctrl handling. So lower the log-level from error to warning to reflect
that.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index bfebe42a0331..a673779de3d2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -464,14 +464,14 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
 
 	lvds->pins->p = devm_pinctrl_get(lvds->dev);
 	if (IS_ERR(lvds->pins->p)) {
-		dev_err(lvds->dev, "no pinctrl handle\n");
+		dev_warn(lvds->dev, "no pinctrl handle\n");
 		devm_kfree(lvds->dev, lvds->pins);
 		lvds->pins = NULL;
 	} else {
 		lvds->pins->default_state =
 			pinctrl_lookup_state(lvds->pins->p, "lcdc");
 		if (IS_ERR(lvds->pins->default_state)) {
-			dev_err(lvds->dev, "no default pinctrl state\n");
+			dev_warn(lvds->dev, "no default pinctrl state\n");
 			devm_kfree(lvds->dev, lvds->pins);
 			lvds->pins = NULL;
 		}
-- 
2.47.2


