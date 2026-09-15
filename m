Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5125BC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vA9NWFMPC9pCLE/rtR1qK/Zvon8swdWRLmKM7jQZ0lo=; b=qbFbWKfxh3bSIKTLaCpSi5imGl
	JyYJCDKnTD0UlB4xX8HuvN+9kEGJn7kO4KUjym0HctUWMUEy7p8WeIqBcHhlj3JhYvHpdqk4lv2rG
	qMbWeEukqNws2XMcExH3vBrUDQrWSNohtO8Dg92CYkVJcAk0O5V3nhv2ccqnDQpDjYljPG+HK9PVl
	Vk2oa7lkDDf0zHM+IdSih1c6PCS0XaoDYr0QccWWUfxSvXoa1CuBqAcRsbQ4xWkfp5kHN4cRrgvUN
	RC7dAtAyHrChXxL3MT/K8WCQTUq8/KWm6QluB4FQtREqyJwcw8xXYdtD0o8yxPy/dFcydyLWMZRSl
	SqlTKmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QUI-00000005vlM-1ZOE;
	Tue, 15 Sep 2026 10:34:06 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QU5-00000005vgI-2B0Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:33:56 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29d33431c8so19964766b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468432; x=1790073232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vA9NWFMPC9pCLE/rtR1qK/Zvon8swdWRLmKM7jQZ0lo=;
        b=QQ8CErgFjwJqMdMNdK0H36F4kNLv2c8Fcb46WURWTMGpTJik9wp2+5crfwxuOx0bvm
         UguUis57BXmCSpXslHP6swuXfFimcmbkcxTtCQDm43mU7cquRRMOJfbuBCnNrH5h8Bzw
         CI1gP4gvUF9hdNqscDLDyLBBfMhIjh6DL4aW3AfYvnLysQLCs7FXrDurHrugqfB+tjMW
         Q3XgsmJQcb+I4N5AXkGm/lH1e0MxvP9iAbqHI8TpoHzz21TphA9lR37KMnQYSDLWUUdu
         j+T1+zXvqCIu2jmHD8Smg+39dnSPmnp3TvBNHPLMDarEMDCnI/kJ6YbVADBgiyeayOai
         ZXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468432; x=1790073232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vA9NWFMPC9pCLE/rtR1qK/Zvon8swdWRLmKM7jQZ0lo=;
        b=eiaqOf3jNN9EQInm/xmdtxgYDqDLCaEu82ffmkOEgqe1folIaYmUyD+Um9fHZUaZgH
         Pa1nfNIf50pHgrUMKPPQ7g64tBTa4YlfLZB+OGoHj9EvXkldX8yiAwU9X9M5cbouvKeE
         VRyqzMG/EoEAZeTWAR9o4/yIs5wEN60v+LrOQ+048nHVKulkHUZFzmt/cx+z3id202fY
         Lt5ApoVS73Pxw+r0dSPoyig8icUttYr23xcqvgcUtRmGJC3npVqRg5tVCkWpQbQ6n6Un
         Q8DR3n5wHe1Xl4g8MUtsvQI0Wvjg4UMx+FX2RMiRkJYz+xWBdXELo363pulPWJ8Ab/Rf
         i6pA==
X-Forwarded-Encrypted: i=1; AKwUvByYMTXiJRW5Qj1EeNKLjjBvMLvIWI67Zs1COXeipr5HjT0xECfp9/mt8HgOJK1MYCWwgpWWqdZ0Xp/fr1ZdY0eW@lists.infradead.org
X-Gm-Message-State: AFuF++nL8lFUs85Mclpg9NhH4x9AoFp3uVnD0ReQhOEdgd7G4Jnz+kit
	gK6istMAoo0uj7Uhy9YH5zWLsWZhuYPaiLVIrE7hC502/J/N+c9QBS38
X-Gm-Gg: AYBFou0b8SJ13Oc6zHTgrf/Z2o4ab+iqdZ96pITktBisBi0OBSPDxHZWFBBkPdS4JYM
	uyUxjz/FUvkhBhiFV9mRE4KZY3d/vDkaiO3seMOfDe1q5cMIVWXgyikaKvY1/plr2OF0mzQH1AR
	A0mZzEwA+4SQMRAY98FLQ3UcAJ0U1ZFfnxKvAHh3u4ZKHc+g3L+HPD5Li+uLW8AdxY1tgJD5B3C
	Wxg9ySYTEBU0GsvqjQwwq9qvCslpnxxyj5espi2yLMSh2m1vNzSh0E8wufYf1NSudrPG5aeaoPC
	W/Az0wneVZt7BeWH1KTu3nugeJaxNd5c/orH0JnL+O5wYcfZFExMkRuwHNPr2RpMo6zlE6mw6zw
	ESPz0H0pey7iDjEGXN7T4aXBIQRozNnjWCdNfhgJkATNvdeQ2m1F8Y780IwjQ9CmvO/Agxx2qB9
	tzISNwGiZEUqvFl4qVHUxksproaooHcpf5DnSMggP9evF3bpIqYBFMPaKOtE10InUisTU/q3obw
	OasaJzxCdxDcqsneBo0d78zUKsjlbIYpZ37w7Gf9w+V0HgpDYQOmnu+DQkKwyzJSgI9XL1VnRZR
	anWQdH9WR91HMuN52F0Ofjq1w3f/OfaE1eepTufxUVw37ndvZ7/jRwLWjVmnqOiuiYVWPEC4DbU
	teYNusNRyhL1FODb2s1SLZX0CgG2ybo5Nj/uWrRuWeBSAu0YVmXMOky2tfKA7GRMfj1hP8FAt32
	0nOoc4YG0Lr7Tm8pGpvOhtm+kyOp07/H2zLkk73A2kQ37K7LCBf3h9G5jE9noDYwgVakf+8T5+F
	sFc0vb8mODejro9
X-Received: by 2002:a17:906:7307:b0:c29:5a76:72be with SMTP id a640c23a62f3a-c29d78fed36mr38938066b.24.1789468431681;
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (219.40.147.34.bc.googleusercontent.com. [34.147.40.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm566041866b.6.2026.09.15.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] clk: imx: scu: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 10:33:45 +0000
Message-ID: <20260915103345.1334-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915103345.1334-1-joshua.crofts1@gmail.com>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_033355_132368_DA78FA0B 
X-CRM114-Status: GOOD (  11.97  )
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

imx_clk_scu_probe() disables PM runtime on failure, but doesn't call the
pm_runtime_dont_use_autosuspend() function, causing potential resource
leaks.

Add the missing function calls.

Found using Coccinelle.

Fixes: 18a50f82cd2f ("clk: imx: scu: Do not enable runtime PM for CPU clks")
Fixes: 78edeb080330 ("clk: imx: scu: add runtime pm support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/clk/imx/clk-scu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 44220e9c5c2a..18f73e679331 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -525,6 +525,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 		if (ret) {
 			pm_genpd_remove_device(dev);
 			pm_runtime_disable(dev);
+			pm_runtime_dont_use_autosuspend(dev);
 			return ret;
 		}
 	}
@@ -533,6 +534,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 			   clk->rsrc, clk->clk_type);
 	if (IS_ERR(hw)) {
 		pm_runtime_disable(dev);
+		pm_runtime_dont_use_autosuspend(dev);
 		return PTR_ERR(hw);
 	}
 
-- 
2.47.3


