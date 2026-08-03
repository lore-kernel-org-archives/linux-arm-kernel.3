Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262C7C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wn8DGKA5kSavmCRKRx9MyxFXC5hjjcK6hiv7Zc2G8KI=; b=PasaseNoA8SclXR4Z7vsmjBbGd
	thFIryu68ANNsdihgWDR5lwGqo76jFDFpkxxkQsGFIPIv5sCcKupv/lgnI6L7+Cs9ZazM9A3A1kW0
	DjtzuosPkLkut6R3OfXASBXy+C12lwGLfzwmPMdh0nsAJAMuxoxcTQYqlZIF5CjGKgYHOzKEMVHvd
	O7rSpFjMVDghfPyEgBMhjV5lj21Oh21o3Oj5Uz3iD5qCRc0q9Gl/eE4POQfHsJPEh/NA+Nk457mns
	DEk5UIrevf9zzfW+C3NfMl5ozMVi5QFRkh6yaN+FTmpRufCD4BILKiXh2DPNF9hE5U93xrpZirtaB
	aWLzu3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUQ-0000000HK9z-3T4n;
	Mon, 03 Aug 2026 14:18:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUN-0000000HK5n-2nP2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:01 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so47106105ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766679; x=1786371479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wn8DGKA5kSavmCRKRx9MyxFXC5hjjcK6hiv7Zc2G8KI=;
        b=jArC3qbx2Bol8W7T+tA/q9/UXdr5QnE/801mdLIeDC5nX1k91JlmRUrEiI8GnUFzbD
         +L+eMWxaRyxTRj0eEalRZkD3x0ARxCFWxWvqbSmeg3C7MMA3hYkmAKZnVDaUkxYK/yKY
         dOcrCgmTYXPmqf8d/1ewUifNlns8z5eDgniTrJJIlc8Ib98zzENwy/KocGalrwf7PFqQ
         Th0QRbgQlZ12WiVQ6Zx85/X9I+8aL4U57iazW9tH6SUVdCRVMrX8gJW2feArnWIUhy2A
         BtQGvvHeVfCavT0b3sAYiWeSGI0zF2iTF0bBjVcREI6qUNtTpo7cLSvpcsfxrsWI5x00
         IIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766679; x=1786371479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wn8DGKA5kSavmCRKRx9MyxFXC5hjjcK6hiv7Zc2G8KI=;
        b=kwdRVUAbWE5pH0fzHyT0VdBN4Vk1qo1dTMFAhhFNE5JG/ys4m1cPkGT1+Uv4B5PHIn
         wVl4rctrsRqvZsASX4C2PSkygpImsGx3Vw7QY/lLMl6KNgCBRk4ObiZ61oBrbdE+xwxq
         1a2UpwfuCkf9Yq6E1kKlTZ/dzD08p6oRBrY6zwIhmd+79LVoN8lyhzve2dY8mcF+k6PT
         E+IdNLaso+Lgz7Rq8kQjCyOUd7HOTqc+EgWODfZxWYjENVu+gnY2oYqq4vw/LtzDiokv
         VuO5n6Mf0phXBRlx7XdNdRjFF11rnSzNlmcDaKapucvVcuaZDY6v5fbBLiC3LlqGzJrc
         FNGw==
X-Forwarded-Encrypted: i=1; AHgh+RoGo6mJlvWiN3NWQgrz3OzKlacQUtJwOODLUM7rXtBsrPz4M/UIhEshqMI/U5nMZf/+znB+984CdsNoFgwc1/2T@lists.infradead.org
X-Gm-Message-State: AOJu0YwpjY6R7TzI6xCLPPUEgH/zKDny9Sgy4SGBcUtQcmbJitv5518Q
	HEnF4aKBn65rA8pRpw/ZmoTESh1InvRAk8E6aE0+MMEuPVwvWIGk7jKd
X-Gm-Gg: AR+sD12GejXXV0sx5hK08SAjGDWAO7+WgP6VaUdzwPQWnxDFekgwO+PVEK8vqhTVV+P
	Q1gccHkcaIKi9oZTr7EItJiPw0tSuVU+Arrim8ib+uHSQk22ZnHB2Xr+En78FMcmBmknXs9hG1V
	XNyFSq5QlUdTMafumTwB1UIBmEtMrZhAJWB4/CaVVoL316G3+YCH5jL/Sq+Bz+O7x/v2Xf3PCfS
	NMmaRIItpTWDl3vccVKGHQnszIZw38mLXhkRAQ6heJl3fsfGGQsShISa/6P6PXYKuRa8C5Ae00g
	3+nP2m9N4yWEP3qY0l1ooQid7LVeuCAtvRCzVSEp542iG54ydwFBZjxI/VClQjMo1Xc7YstINjS
	rhT61xfWfS1dhArmpWp4ZPxgv0EBTxjRmxY/JtRgIEjiBdZWbUU0dfMzpkhYe2k/LFWGhvD2i68
	ApE8XH+D5gx6aFC+LQQsL1jjzW/PZlPQxx9SCyAOoLFqE+Ih6cwrAIwKDzIQ2eKd0QN66jnhUkF
	ZQNt6Vs4O7870bJpNtMTEQkYwS/o2MN
X-Received: by 2002:a17:90b:590d:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38fbc4d0204mr9749689a91.23.1785766678572;
        Mon, 03 Aug 2026 07:17:58 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:58 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 07/32] clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
Date: Mon,  3 Aug 2026 23:16:34 +0900
Message-ID: <20260803141659.559129-8-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071759_958476_B6AE05B7 
X-CRM114-Status: GOOD (  13.56  )
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

Add MODULE_DEVICE_TABLE() to the MT6735 clock drivers (imgsys, mfgcfg,
vdecsys, vencsys) to export the Device Tree matching tables.
This is required so that the clock drivers can be automatically loaded
when built as modules.

Fixes: 0bd9b1211f74 ("clk: mediatek: Add drivers for MT6735 syscon clock and reset controllers")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6735-imgsys.c  | 1 +
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c  | 1 +
 drivers/clk/mediatek/clk-mt6735-vdecsys.c | 1 +
 drivers/clk/mediatek/clk-mt6735-vencsys.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6735-imgsys.c b/drivers/clk/mediatek/clk-mt6735-imgsys.c
index c564f8f72432..813241d526cf 100644
--- a/drivers/clk/mediatek/clk-mt6735-imgsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-imgsys.c
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_mt6735_imgsys[] = {
 	{ .compatible = "mediatek,mt6735-imgsys", .data = &imgsys_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_imgsys);
 
 static struct platform_driver clk_mt6735_imgsys = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
index 1f5aedddf209..8a18ee244a4d 100644
--- a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
@@ -45,6 +45,7 @@ static const struct of_device_id of_match_mt6735_mfgcfg[] = {
 	{ .compatible = "mediatek,mt6735-mfgcfg", .data = &mfgcfg_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_mfgcfg);
 
 static struct platform_driver clk_mt6735_mfgcfg = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6735-vdecsys.c b/drivers/clk/mediatek/clk-mt6735-vdecsys.c
index 8817085fc1db..d53ebf92e878 100644
--- a/drivers/clk/mediatek/clk-mt6735-vdecsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-vdecsys.c
@@ -63,6 +63,7 @@ static const struct of_device_id of_match_mt6735_vdecsys[] = {
 	{ .compatible = "mediatek,mt6735-vdecsys", .data = &vdecsys_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_vdecsys);
 
 static struct platform_driver clk_mt6735_vdecsys = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6735-vencsys.c b/drivers/clk/mediatek/clk-mt6735-vencsys.c
index 8dec7f98492a..64ba9da9fd42 100644
--- a/drivers/clk/mediatek/clk-mt6735-vencsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-vencsys.c
@@ -37,6 +37,7 @@ static const struct of_device_id of_match_mt6735_vencsys[] = {
 	{ .compatible = "mediatek,mt6735-vencsys", .data = &vencsys_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_vencsys);
 
 static struct platform_driver clk_mt6735_vencsys = {
 	.probe = mtk_clk_simple_probe,
-- 
2.55.0


