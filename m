Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ED7C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOx/QjhnUzr5iZf43d5r89IsS2FOdAlXvdjY2fxKvfY=; b=NOCfg3cA2AniQDK4pwvzTGD4ZI
	wryz4KvC6eXbzkijubTGas+0XlQ9hfs5ym/KErMElcQqcTDhhJ8LkGUI1emqEehUMQ7R1GE7k6XWP
	539oAp/9E75HF8BZPHZeMXEA8cU/h0FxURDdgS8PUHrgSiLPDs8nY5k6PMuhDaIRWgJMnJ2AQISL2
	XTBwICJ66+i7h+YBBXfDndflyttUg7CJiIzO43lEFmCbFtBrPw5qjzagMh72ZLy/ibxQEtRc81W3t
	Vg3XPP4d97IrtopRPl4RrFCRF/IxG0YbaOxzrfpt7ItZPBTZVIAtTiiRaHo0XTdPMNCyNGnTvym2A
	WgSXz3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyl2-00000004BQx-08kW;
	Mon, 17 Feb 2025 10:53:50 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyCQ-000000045OT-47PF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:18:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ab771575040so1025074266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787481; x=1740392281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOx/QjhnUzr5iZf43d5r89IsS2FOdAlXvdjY2fxKvfY=;
        b=e7FbuWG4UTw11fo6MtapgCjHDkH3FcNfuzrl9IJzG/iq/X04gfyDFRhKK36ToOO0M9
         jbN9aMIJb6o9iwT69F5Iu2Ovwu7JZLtWBlqzCJ+8eQP6fwc4djfeKNvYlR2WDYf3PBBl
         MrVqhYtTZW0Xa3wcqg43ix3f0qk3WvjJ9kEDfdL3ComuQ+4zh8RiStnzjrjskUKutAP7
         gjrchPfg3eQo1fw8VABNQ9ucTbnJx5p81f16tdUoU0EPXTIqyiXC8nBcvR5cRqITS6yr
         QNgrQ6SH1j81bCgwcbZU9LKMsJ54zmkBe8HyhRtjtvLdVVjiPnVmQlYcI3ZjOwIiWdyx
         iR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787481; x=1740392281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOx/QjhnUzr5iZf43d5r89IsS2FOdAlXvdjY2fxKvfY=;
        b=D/ndrsinXOlaqTQMK1Bt8zicM5+DH1Vq8Iw/xT9FbvtXmuVYfBPJV/RK/J3SKRX8Ys
         q5odW0uN5wqQUJXrhpSCfcG9TZUeJNEet+z6bd0Ni7/NInQR4dDdThVilmU6an/3DJ51
         0sUVXpqc+rXgk2DrDB7UQ2bWFvklwj+BhHB45t5dnl4Jv2+GHM28yaOS/q7vgvLglGUr
         EG/3tBzNXwh/jzSzH9EE5Tff4Yp80pJmTLmtQNRAWsdkp/USoYRqR6tTbi4EEItwwBnU
         Asw5OM3WMf/i4HAuJA7aCYYE1wg7LVG11OVJA6v0nGY22MbnNAaT1u6cJed5DrYn3Yek
         Xbjg==
X-Forwarded-Encrypted: i=1; AJvYcCUrh732Vd7iY2yoT6spdWx9s523jDrTETo+PrXsCHcdJuuaFo01mw8FaLxp6JjMLaI/23Co/ZPS+PrF17X58itA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7qLdg4QyDnJQqzMqyo2kgjhHJV4s1WE+BAiDR2JQb1Tl+LW8c
	hdBN5MzNYsvDU4SzYDTATXhmQJzvb8ewyUW1ue8we2QcVv8x6p9sgiW421dG/ac=
X-Gm-Gg: ASbGncthdc9ZrKpILkPCZpgcBnRLcV3diXmahHd7wu+/iyrwYtO5Pwvhnkv6wK0FX5s
	qNQI1VQ/Vl/a8XnuCrtMDZ9FRe+mH+CC+DoDBCidfUTmx58by8OnqkNhGylPe/BKrziUOKEmpRP
	s2IqugZtlbZUfqXMIbkWUdIDQTGNV7sWmQSoyueVkj70Kl9/DREvNAkgW4VkwwE1aZMdwPPDOD8
	Ecl7NzmYPoh5BhZ9qk6NtMVzzEFyhtICSh+3wZg8IaNYsaN9shhreZ+dxWE2Xpn/l6vcrgVFv9h
	xFEwarL7yK8KXwGasPZeRFNt
X-Google-Smtp-Source: AGHT+IEyhYoBsYp2nsZUxaNrWoEJIkJcEzeW3uR5U89aJyr/W0mS2FbZhC0xUYWaFE0athJ0Fx91Xg==
X-Received: by 2002:a17:906:4fd0:b0:ab6:fe30:f49e with SMTP id a640c23a62f3a-abb70cd5108mr714909166b.28.1739787481314;
        Mon, 17 Feb 2025 02:18:01 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:18:01 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 10/10] rng: qcom_rng: EXAMPLE: registering dev structure
Date: Mon, 17 Feb 2025 12:17:06 +0200
Message-ID: <20250217101706.2104498-11-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021803_019169_B87E3EA6 
X-CRM114-Status: GOOD (  12.73  )
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

Proof of concept on how devcd register core area works.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/crypto/qcom-rng.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index 0685ba122e8a..a1509609f50c 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -7,6 +7,7 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/crypto.h>
+#include <linux/devcoredump.h>
 #include <linux/hw_random.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -32,11 +33,13 @@
 #define QCOM_TRNG_QUALITY	1024
 
 struct qcom_rng {
+	char start[10];
 	struct mutex lock;
 	void __iomem *base;
 	struct clk *clk;
 	struct hwrng hwrng;
 	struct qcom_rng_match_data *match_data;
+	char end[10];
 };
 
 struct qcom_rng_ctx {
@@ -192,6 +195,10 @@ static int qcom_rng_probe(struct platform_device *pdev)
 	if (IS_ERR(rng->base))
 		return PTR_ERR(rng->base);
 
+	/* Setting some markers to easily recognize them afterwards */
+	strcpy(rng->start, "MD_RNG_ST");
+	strcpy(rng->end, "MD_RNG_en");
+
 	rng->clk = devm_clk_get_optional(&pdev->dev, "core");
 	if (IS_ERR(rng->clk))
 		return PTR_ERR(rng->clk);
@@ -218,6 +225,8 @@ static int qcom_rng_probe(struct platform_device *pdev)
 		}
 	}
 
+	devcd_register_core_area(&pdev->dev, rng, sizeof(*rng));
+
 	return ret;
 fail:
 	crypto_unregister_rng(&qcom_rng_alg);
@@ -228,6 +237,8 @@ static void qcom_rng_remove(struct platform_device *pdev)
 {
 	crypto_unregister_rng(&qcom_rng_alg);
 
+	devcd_unregister_core_area(&pdev->dev, qcom_rng_dev,
+				   sizeof(*qcom_rng_dev));
 	qcom_rng_dev = NULL;
 }
 
-- 
2.43.0


