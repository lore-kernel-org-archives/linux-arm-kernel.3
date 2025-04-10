Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2018C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 03:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m+KZZSikQDIaAJ5we61TNgyebN6cWkAPQY8BkFWR6dQ=; b=OEM2Qi5qG1DsZUZT+XtdPg15l0
	l1KD2+W7IExBkakS5FKB7+PoCUpR7gCnZiTGB3LeIWOZdH/f5RigaSKuIqXhr3RQEcjWb6V6P8ANG
	wTVBtXflYfkbtyyMl/J37kW/xGiJk5Ov+DDPjRL+P/uG6CzIbpt4Kub6+e4lQAuK99Klr5qGCPa9h
	8DC9saEx/PZqdvyb0RWSQgbeL0C6Y5JydT8scRd98HR3NBY6gAm1SySZk+SpWgkvu6m4ku5YhjnBp
	pHzKvGnp23hv/tzlDlR8T6hKRqHfUv2dHKZoexLiNUBkrvZ3cxE5kW4DlVRQF91NiREGNAvjpt72i
	5aKtI3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2iFS-0000000962a-3eIt;
	Thu, 10 Apr 2025 03:06:38 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2iDg-000000095qm-1C77
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 03:04:49 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-73972a54919so236618b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 20:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744254287; x=1744859087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+KZZSikQDIaAJ5we61TNgyebN6cWkAPQY8BkFWR6dQ=;
        b=VfwtC6qcHKarzPK4OHMEwrxmnmxuIYZvzfCT8TstqSj6+xEdBbEUwfvmOSqpnPPL+u
         VZAvltF8YgP+N4WqBic4Ha0hHuIbGlQDHTUxopzMdDPASCYlexq/QnbmosnAjdybl56f
         pYnoylssdMnrgcEP6L9tNe5BOmK8tyq3LB6KDz3MjbJ1Req5kYrdhJef3/A5+rpaQgav
         zkt+34s+lXRosnCDqQa11pssTgJQKvCeodK1R5qK8hfSa8YKN+HNFQjosoRz8G4F2pdw
         rTtmp7po2Cln1J6FdQHf2TmbcCcd3LyVHDpsYPsLbvohH+dWvUvaSPTp2nA1x1DoIpdW
         pFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744254287; x=1744859087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+KZZSikQDIaAJ5we61TNgyebN6cWkAPQY8BkFWR6dQ=;
        b=daQ2jtx66vKFnsC7NAKiYJya/VBACFxkEWSBEHr/jEfdsSHNM/Jm+fiOK/wjp/5wcX
         G+93hk9+Z/gha6/3eCDkywVuNX1r8AlkSPAdFzLBt1nYbkHUen2sN7ZnI6+k402EO2mj
         fovBdD10gZo67A25gEwL4prqROicmOXjj5OWeOVP/plgF/st3dE5tBxOfISPAmNxf8Fe
         +60KFKsv9T8rgWeF9uIWi4FeDXUWRv1tKVMVFqEZQRTplqaLFBqcJAmmXh3uoJ5E1E+z
         NYIMS8nVpfCS9ept0OWmTED3CQYIGkHxYpS0KTMFF+s8tPg4f39lmutCrSbObZDk6Dkh
         NNTw==
X-Gm-Message-State: AOJu0YzL/iPtVHk0eQ7YQZSO2wC5ALzn4XaYRqhPwixDZP1YWJUci5Ge
	7GadSjiG4ToBmSk0wNLZFLqY6a23kc7EhufEJJzlPjChu7uCA9mL
X-Gm-Gg: ASbGncvWNoIuQWXjA09+L6QDXJATwMFeGAhrR4pV3HYcsffAraC+sP+S2hG/xEIu0Ox
	vNFFBZpiUwLT3gugQ4VymJInwQLJtxWwsgWbIyv9rmYucVpEakO9kxE4ZMp6RigwmDAWeX/ji54
	3UA1ztRxT0J0JAbcvlsgr6beerzYo/vsvSyw8cj39OUdxaBFcgGcL+wh+t00h43F6C5q//qJtiD
	RgfsqN709HNtkJzJLF7IeX1hJdXIOQnk0XhZV3MSqfD5N6UUCo53xPwQPaFg+cpVvBKm0agMb4B
	QcojnSX4cIle9HxexFcMA5QA9sw3rAxfuHZ5KtJ2OLjOrznd3PjavTR3/pvNcFsHKCgKAuFd63q
	yvg==
X-Google-Smtp-Source: AGHT+IHgtIqi32EvJvsz1zRRwYdM5Cbekj5LQFgEfYxdtthuDwvKdqfhaj0lrnhCh2dKYSmGj4BGsA==
X-Received: by 2002:a05:6a20:9f92:b0:1f5:97c3:419c with SMTP id adf61e73a8af0-2016cc9a977mr935469637.6.1744254286836;
        Wed, 09 Apr 2025 20:04:46 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a322115dsm1997405a12.69.2025.04.09.20.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:04:46 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] ASoC: imx-card: Add NULL check in ap806_syscon_common_probe()
Date: Thu, 10 Apr 2025 11:04:38 +0800
Message-Id: <20250410030438.53232-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_200448_321577_B1F0741A 
X-CRM114-Status: GOOD (  12.13  )
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

devm_kasprintf() in ap_cp_unique_name() returns NULL when memory
allocation fails. Currently, ap806_syscon_common_probe() does not check
for this case, which results in a NULL pointer dereference.

Add NULL check after ap_cp_unique_name() to prevent this issue.

Fixes: baf4c10f8878 ("clk: mvebu: ap806: Fix clock name for the cluster")
Fixes: 33c0259092c8 ("clk: mvebu: add helper file for Armada AP and CP clocks")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/clk/mvebu/ap806-system-controller.c | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index 948bd1e71aea..1461922752e3 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -173,6 +173,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 
 	/* CPU clocks depend on the Sample At Reset configuration */
 	name = ap_cp_unique_name(dev, syscon_node, "pll-cluster-0");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail0;
+	}
 	ap806_clks[0] = clk_register_fixed_rate(dev, name, NULL,
 						0, cpuclk_freq);
 	if (IS_ERR(ap806_clks[0])) {
@@ -181,6 +185,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 	}
 
 	name = ap_cp_unique_name(dev, syscon_node, "pll-cluster-1");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail1;
+	}
 	ap806_clks[1] = clk_register_fixed_rate(dev, name, NULL, 0,
 						cpuclk_freq);
 	if (IS_ERR(ap806_clks[1])) {
@@ -190,6 +198,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 
 	/* Fixed clock is always 1200 Mhz */
 	fixedclk_name = ap_cp_unique_name(dev, syscon_node, "fixed");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail2;
+	}
 	ap806_clks[2] = clk_register_fixed_rate(dev, fixedclk_name, NULL,
 						0, 1200 * 1000 * 1000);
 	if (IS_ERR(ap806_clks[2])) {
@@ -199,6 +211,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 
 	/* MSS Clock is fixed clock divided by 6 */
 	name = ap_cp_unique_name(dev, syscon_node, "mss");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail3;
+	}
 	ap806_clks[3] = clk_register_fixed_factor(NULL, name, fixedclk_name,
 						  0, 1, 6);
 	if (IS_ERR(ap806_clks[3])) {
@@ -208,6 +224,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 
 	/* SDIO(/eMMC) Clock is fixed clock divided by 3 */
 	name = ap_cp_unique_name(dev, syscon_node, "sdio");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail4;
+	}
 	ap806_clks[4] = clk_register_fixed_factor(NULL, name,
 						  fixedclk_name,
 						  0, 1, 3);
@@ -218,6 +238,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 
 	/* AP-DCLK(HCLK) Clock is DDR clock divided by 2 */
 	name = ap_cp_unique_name(dev, syscon_node, "ap-dclk");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail5;
+	}
 	ap806_clks[5] = clk_register_fixed_rate(dev, name, NULL, 0, dclk_freq);
 	if (IS_ERR(ap806_clks[5])) {
 		ret = PTR_ERR(ap806_clks[5]);
-- 
2.34.1


