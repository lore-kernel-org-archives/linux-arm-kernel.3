Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10FCE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSWM4xAa3F4ckNNT2rCjA6WUCAPjzPoqRakDwXZXtqg=; b=1mBPRWvo7XkEKk7Qh5a/msDE2a
	DfAAmeMa9Kc3hm/iWsCVayVVgSAg1XCQrkK4ma12wCWz3wuc+nDN4Dd1Pgkukw2xJPTMERTAzsU4b
	+mx3oA+XjxL4sORYuahdViD2sxTWa4oR0wUHnA02i/O16+NBHTHcc4oVYbxh7BjaxrxwHK/+Mdxk5
	XMtZWrOlvhY4mqsH2FJUevqQwFPe08+ySzxWFrObQ21Q+gxvHAQzDgmbdKRpirPYiqaoHIZMUOiEV
	sKRagSYNl0RRAT0cI1mInb0/tjGyUEltx2YEzt7Y2jLPzCOOPKNZ341PIPtaXoxl9Ayzw2imKSbYJ
	NGfcrsPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgVc-00000001GUn-026s;
	Sat, 11 Jan 2025 18:46:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgS0-00000001FcS-17Zk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 18:43:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361e82e3c3so4372915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 10:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620990; x=1737225790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSWM4xAa3F4ckNNT2rCjA6WUCAPjzPoqRakDwXZXtqg=;
        b=Ha+ga19gnmB4gqNy3eki8K6uQFZcJIw5/SJGWk/WOxekaHPHid18vlQ1xXhO/o2bG/
         PwhHf4IvWIoqJ2GRhfbkLGZzuVM8Eth4yW165a4JaoXerAaTjRctsBCL6CWPj2AuCo+a
         tIqLwIW5tA3/rHR9FJr81I6WJ4hC+9H/M5/ZoDgIrH+T3XZoHy2sTxGL/g4bArHETWj/
         Tvv5FPzdB5czQn4WPNR055NsyvwPLCaSNhtViXFToMaIJCfR8vC0ivUBkqFQUVTQwL4c
         I9VtifI7od48nuDW77Weog9aa4RHSiCDuIarsi+4ifCC+XB7Cc6hvYGCdg9OSq5itD1r
         9Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620990; x=1737225790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSWM4xAa3F4ckNNT2rCjA6WUCAPjzPoqRakDwXZXtqg=;
        b=nc2jHIDiZviYdY/+4YlxZHTI8s1N5dC0M2Y7XPufkI6nRIzAkTp7GN/LH4+fwLMZi1
         ALXetOZYslD9NSEAIjYvWHHx0AvLkAAr7t+KavMA4zrW77BbA+YX/m8UVrbladTkQBSb
         UTu1d9wkY0dS5zgqGVZQn1jJbFGI5A3AiQUgvMli8DKXDq4fS1tPZlPLczvoK6iMbSW4
         NJZy00++dBi+7Y+DqG8aW98vy97o/KFTZim8lN1J5trDJR1LKWoM/+m80azPvU1ynDZR
         QBGGPuDYB6euLlOTfOfOdL/Z6a25ebHe3LE1/2Le96GLGonrWm0Uc6JNfDDmtyTMBKj7
         eT8A==
X-Forwarded-Encrypted: i=1; AJvYcCXUGonzahQRVjFNXzr42EpjCinNjApKhPTy3XjLXCQZgGYr15pE+51THXwI6a7zcof6B3G51TpEkV/XQk2DuqEF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4wJM20/vgcv4GfFXu3eEwQwHyU4lDi3VjQvft/e+I6ZAzJ0su
	nJfofsjyDW0vXr7F7PWOhGF5u8O7QK2aBPFkRKghgK8vr8wf/reZMIQZ06C3L2b0OrBfQ/Lxn8q
	r
X-Gm-Gg: ASbGncusQCK6uXLPHs3N8GPAihP8lKJ4NnbWpPDatZhfQWXoiNfE8h2PeMPWgkmvxeE
	5h1wUfybtVjBC/2SG7SeplDsg5asPxBDtTSw5F+vdFtKltCJ2+c6CDcovJOpzm9xWlNismJffFA
	/4faIeNBHRXo9MVaZcm1qd1L9xMbnVRihFpWA83YTA6FEjV+pqmbws+CPcVHxJ0YqNiyudNiVhV
	NwSW5YDWxCZlhIJXUXoDnMe/3nyPdoJTGPojEbuCow0KoM1EAxYgULfgmcHsNNs7e88I3L7
X-Google-Smtp-Source: AGHT+IECs0vQ4xGmYsqqwraczYKPphscfapxLBfYSJTZ3A0WZWrloSMYovDfByM3Hw1oG9LXyt8FmA==
X-Received: by 2002:a05:600c:4f14:b0:42c:aeee:e604 with SMTP id 5b1f17b1804b1-436e27170d3mr54335455e9.8.1736620990615;
        Sat, 11 Jan 2025 10:43:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 11 Jan 2025 19:42:50 +0100
Subject: [PATCH 2/5] remoteproc: omap: Simplify returning syscon PTR_ERR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-2-73ed6fafa1e3@linaro.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fWYltI4xM/KDDIH8KFL0uiLtzD8nY+Kjalail67u2Hc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngruymH5IcFgYiymLuIIna6pft0HBEyMUVO7El
 2ttiACWVGKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7sgAKCRDBN2bmhouD
 17gFD/4+1JVyb2aRlgR8NEL4n+4O90KtSJz4kqJMdeGGUNV1Ohj6Y6AWtKMEdSq3NfQnBom2HPS
 EkgOJdgGC7D2Qa6O8SUtSNRRTsQapl131iDg0fldAlnhyCi5N+N0oSvtjc9GMJrlfDhVJaBl61s
 PmL2+vk9b7x5TX6MHlbuG100rClHpr8jFoP020URdpbfwZ18pGVaNyKT/wxANBeSLYX2cGtF6bf
 gBjBeNdd0oGAdbkDEL5m/kyxtibo4AZj50NRR5Un73S/dqn+aCBde7ittIXnoJkpGkq1Q58QPaS
 CaD8KQk4fxXAE/r/c7mxCH3ERV5cpRdUKnVK3Lo+IZ6+w9iuOr8J4ZZwLweWkNFhAbfzg8bSYJP
 8RFEYWmMD9VblWeBzD/V5lwGVSDzDTPeVqozSpgTK64mcaobtM98ae01pTkT8/FKq6cl+/SPTns
 OtmneVgj4clWsAhQ6UXeOdVvt04Rxow3XOijZqtGFebZJ9wfzMz4PbdV9NLf3ovkOK0VVh/lAGK
 ZVXL8HSLEBgZpUl/giEQ6qL7tG0VsM85oKamuZk4YO3ozmcALAVOjuTxrEPT99uaNMn6lYT3z3J
 ZE85re7iAH/ozV4uGtU6fAfTiSaLuUMVhNlBh+GDdIh9z/rv7pok8bR71II7/7Ym6g3u6PwaiVn
 j1//l9IGlqsOGxw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_104312_309941_14A60A8D 
X-CRM114-Status: GOOD (  11.42  )
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

No need to store PTR_ERR into temporary, local 'ret' variable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/omap_remoteproc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 3260dd512491e8920fc881b6a7c0d9b6f725e7f5..5f463937cbbff2c9ed5b22bed42454a0ae290f0f 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1137,7 +1137,6 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
 	struct device_node *np = pdev->dev.of_node;
 	struct omap_rproc *oproc = rproc->priv;
 	const struct omap_rproc_dev_data *data;
-	int ret;
 
 	data = of_device_get_match_data(&pdev->dev);
 	if (!data)
@@ -1153,10 +1152,8 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
 
 	oproc->boot_data->syscon =
 			syscon_regmap_lookup_by_phandle(np, "ti,bootreg");
-	if (IS_ERR(oproc->boot_data->syscon)) {
-		ret = PTR_ERR(oproc->boot_data->syscon);
-		return ret;
-	}
+	if (IS_ERR(oproc->boot_data->syscon))
+		return PTR_ERR(oproc->boot_data->syscon);
 
 	if (of_property_read_u32_index(np, "ti,bootreg", 1,
 				       &oproc->boot_data->boot_reg)) {

-- 
2.43.0


