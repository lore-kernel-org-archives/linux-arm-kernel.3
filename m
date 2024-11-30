Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1512D73604
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OSHwRqHVpOIG2JrOXS69Jq4ftU8zIW/MyIo0a+5/w9E=; b=LCRQgKD1GIPWhOfnzv1HIGhcx7
	CBJOdlohw8H1tOcFmQ+npgee3ms9E0pGchMj20jlxHXljxD+EBBmg/y5ZVIbxm+C9g8uPH243W/bI
	bjVaBWNQGv+r57v8XQ7TlMfkp30ItDij9kOTNrR35Pg59HMDU9Cv7HOYopDndsZD1RvxL/DkSqR5C
	jiyLMAc+m8EiphpyXzR9HwuyzIxsCKRDIX0fMmRiGb59cRizhRinUbgUBHdvcWw5gHLkfTvCGApIy
	axo9FBR3F69NTYULIDhVHTq4qU+nFhIPg2olJBpSmh3tv9NiGzRxfZ1sVAVjDbL7eaCKRMgD485po
	kI6quetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHO0M-000000026tu-2QGO;
	Sat, 30 Nov 2024 13:59:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHNzN-000000026p1-2Pmq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 13:58:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso24945335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 05:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732975103; x=1733579903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OSHwRqHVpOIG2JrOXS69Jq4ftU8zIW/MyIo0a+5/w9E=;
        b=H/LZFoLBRgWu7XjuSWz/wgRhOH8g7gHMd2y1s/KJtGSmwGH7US7JsTzUxupaGlbKNQ
         qnIfGQeXJxD+K3HqIzVBwWXmzH6MWq/JuB8ILzEMJXjjXRMv7vA8U1g7xAZwSbGD1WHb
         lxNsdplEqnNdR/kSJuly02MIUuGGsJHRQaetkg1RDa+t+7a0OryT8Eh8Vry0v1L0NmAs
         WmSSCh2uUpXnmFjO/DJNtMTeWNNBTLf9aekkIYmzDmeGWrKYRgMoxu3Om+L4mBoq97fq
         UNRP6RRnTyiNBQ3hHQE3KnD+d/EAXUkzIxVWP9UF/tKMZ+DLfdsZIfB1IpENACwHjqRl
         tBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732975103; x=1733579903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSHwRqHVpOIG2JrOXS69Jq4ftU8zIW/MyIo0a+5/w9E=;
        b=Yb3K68zVAq3w6ctK9l/hWN6W3FltjxGXSxi+TjUsq+vNMYK4qmCLnCs85Q3WpilIqm
         p/LSh2jq8+Y19MUzccDOYuNR/knLVJbwyYqfVgJJWDMCClBapmPW2jDnmX5OvFXoSKBp
         zM5K3Zxr3kkq0sy7Hgrs+SEL2wfz6klUEcrvVjmxsW+9gF4z8p6UWzN/loed9/Zl2u4C
         I5HsNdodKFWtdfRnKB6SzDGy1Gj/ukuiiDtgnHBykX/Aq0FogdE5/LbWtDWxXZNp+WJw
         jVeTk1RSWOUd9Eaog8ZveJgQ83jEPABk5rkokLXJ50lHWc0tsyOKzgpaALnKTzyS7fuT
         20gQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7pRcBwaDTBa8Z04NrA6xcv3E5F22SYwvKw1vn15MitxjYxK83Xshqb4ysVdILUrrLNX0F+wocv2Q+0xtMRphs@lists.infradead.org
X-Gm-Message-State: AOJu0YzXhtTcs0ctuLUi+vEBsXZESBbDMp54b9ampnlqUmjvPZQ12DXo
	GVNkeXQTvectGuhhvLNuBsJDFdLT6OSQ1eR8ccIVgxDr4SJAZxwAFAzDbRASsHk=
X-Gm-Gg: ASbGnct+wAMWSux4e4VcK1JL6QMEVkjsdH/ErYkRRjRz8eXX0znU1NryMIO2ctVmwfs
	vpTI0IO/oDFe2Fsyl8Skhb6px4TmLcq3PZkYXFvR0T+ZkMLZNCT9vwMB5ovnqXW9JniEcqSPWU8
	axNhcyiDQQcW+nNUm50SafNAs1Tf75meDe0qreluIVB7PKf07N7oQVClbE/AQZMOuN7wrvmQiPd
	OqbGDFox4j6cwiM9QNYWV4h3PCYAUFblbe2aUMYEJXYMACVOWg7wvA=
X-Google-Smtp-Source: AGHT+IHHBe7d5htoj70/kfSxdm+kZQjM0tjaIphEphbFBlZoaGAn1iAgRxGbS4k2FdQNlTMpb9szHA==
X-Received: by 2002:a05:600c:1e2a:b0:434:a8ef:442f with SMTP id 5b1f17b1804b1-434a9e0b47amr130603305e9.32.1732975102930;
        Sat, 30 Nov 2024 05:58:22 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2db59sm7209061f8f.11.2024.11.30.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 05:58:21 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] devfreq: Switch back to struct platform_driver::remove()
Date: Sat, 30 Nov 2024 14:58:11 +0100
Message-ID: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4431; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=uZqTpKr93naOghYTr0iK9IfYdelZY2f/4l+5kxDMpfQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnSxn2/gYVC8rkX/fl3aGkXakkNgP43aHdtARV8 OWxfSCpITGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0sZ9gAKCRCPgPtYfRL+ TtpSB/4zIRpdyNmt2fGjIAeqqboAJR/YHNuFmvrjp8Drq7BhxBmFEjklrLsdnM1D8xJ5bFpqfMt 3g3BmsnnVn5Ievf+Rgcjdad0fazJd8PkmhOKtpmlxhQBHOGgdt3gIMLDcreOU0uSgchS/gRERs6 OQW82e3EqDHrAE6Vc+3Qi61FU/ZlMF1nqYl1+99RsW8bvRLfXVqfnDpu8ICue/NpESiicBfveka TqbEyaEcVjC3oB+UloPneKYxzreyyW/95x403cjGd3zjLiW0e/ZY3NfQI/fj6v+QVkJWdTBa697 6PLuqyWiHcdrpQA+5R1YdF54B/MbB273AjfAkpjaeAGRTtZx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_055825_884319_AB22B982 
X-CRM114-Status: GOOD (  20.48  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/devfreq to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

While touching these drivers, make the alignment of the touched
initializers consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is based on Friday's next, feel free to drop changes that result in
a conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

This is merge window material.

Best regards
Uwe

 drivers/devfreq/event/exynos-nocp.c | 6 +++---
 drivers/devfreq/event/exynos-ppmu.c | 6 +++---
 drivers/devfreq/mtk-cci-devfreq.c   | 4 ++--
 drivers/devfreq/rk3399_dmc.c        | 8 ++++----
 drivers/devfreq/sun8i-a33-mbus.c    | 2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/devfreq/event/exynos-nocp.c b/drivers/devfreq/event/exynos-nocp.c
index 5edc522f715c..9480a92fc265 100644
--- a/drivers/devfreq/event/exynos-nocp.c
+++ b/drivers/devfreq/event/exynos-nocp.c
@@ -283,10 +283,10 @@ static void exynos_nocp_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver exynos_nocp_driver = {
-	.probe	= exynos_nocp_probe,
-	.remove_new = exynos_nocp_remove,
+	.probe = exynos_nocp_probe,
+	.remove = exynos_nocp_remove,
 	.driver = {
-		.name	= "exynos-nocp",
+		.name = "exynos-nocp",
 		.of_match_table = exynos_nocp_id_match,
 	},
 };
diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/exynos-ppmu.c
index 7002df20a49e..a738e6145612 100644
--- a/drivers/devfreq/event/exynos-ppmu.c
+++ b/drivers/devfreq/event/exynos-ppmu.c
@@ -700,10 +700,10 @@ static void exynos_ppmu_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver exynos_ppmu_driver = {
-	.probe	= exynos_ppmu_probe,
-	.remove_new = exynos_ppmu_remove,
+	.probe = exynos_ppmu_probe,
+	.remove = exynos_ppmu_remove,
 	.driver = {
-		.name	= "exynos-ppmu",
+		.name = "exynos-ppmu",
 		.of_match_table = exynos_ppmu_id_match,
 	},
 };
diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 7ad5225b0381..3938878b2279 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -429,8 +429,8 @@ static const struct of_device_id mtk_ccifreq_machines[] = {
 MODULE_DEVICE_TABLE(of, mtk_ccifreq_machines);
 
 static struct platform_driver mtk_ccifreq_platdrv = {
-	.probe	= mtk_ccifreq_probe,
-	.remove_new = mtk_ccifreq_remove,
+	.probe = mtk_ccifreq_probe,
+	.remove = mtk_ccifreq_remove,
 	.driver = {
 		.name = "mtk-ccifreq",
 		.of_match_table = mtk_ccifreq_machines,
diff --git a/drivers/devfreq/rk3399_dmc.c b/drivers/devfreq/rk3399_dmc.c
index d405cee92c25..158e4bbd08cc 100644
--- a/drivers/devfreq/rk3399_dmc.c
+++ b/drivers/devfreq/rk3399_dmc.c
@@ -473,11 +473,11 @@ static const struct of_device_id rk3399dmc_devfreq_of_match[] = {
 MODULE_DEVICE_TABLE(of, rk3399dmc_devfreq_of_match);
 
 static struct platform_driver rk3399_dmcfreq_driver = {
-	.probe	= rk3399_dmcfreq_probe,
-	.remove_new = rk3399_dmcfreq_remove,
+	.probe = rk3399_dmcfreq_probe,
+	.remove = rk3399_dmcfreq_remove,
 	.driver = {
-		.name	= "rk3399-dmc-freq",
-		.pm	= &rk3399_dmcfreq_pm,
+		.name = "rk3399-dmc-freq",
+		.pm = &rk3399_dmcfreq_pm,
 		.of_match_table = rk3399dmc_devfreq_of_match,
 	},
 };
diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-mbus.c
index bcf654f4ff96..a405bab1a63e 100644
--- a/drivers/devfreq/sun8i-a33-mbus.c
+++ b/drivers/devfreq/sun8i-a33-mbus.c
@@ -495,7 +495,7 @@ static SIMPLE_DEV_PM_OPS(sun8i_a33_mbus_pm_ops,
 
 static struct platform_driver sun8i_a33_mbus_driver = {
 	.probe	= sun8i_a33_mbus_probe,
-	.remove_new = sun8i_a33_mbus_remove,
+	.remove	= sun8i_a33_mbus_remove,
 	.driver	= {
 		.name		= "sun8i-a33-mbus",
 		.of_match_table	= sun8i_a33_mbus_of_match,

base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
-- 
2.45.2


