Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1374CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VURWIkfuPan7bcStL9p1ueaB35kinp1F/svGb9kGJc=; b=hPNX738giP/WDUPEEDOEEV9qtk
	sD0HRVxqYthGp/IagtG4YMuvSRWq4yPa6vIMOLY1DXzeFKHVyc5wfiOZuRbB+SCdsUGAzx2i0ffMh
	6T53vfBn5XRootflmPdjISahtU+OLkhxiGm0UKKbHtSAHkTsIA66rCc1Lh8kvrBLxLq7DJHQXwcqT
	DyiJK3WSYjDvktvcy0yVW7Yi9aZ4jN9nUIoUnM5q2Jz5qSsXvflLVo1HCaUWZOYYGqkQAiRztUnqj
	o7+Dy/StHgNGU9d7iC2EAct7iX/MmAB2JGsBNpE3lI+IXKP1koaNGtgeiUvd47c7clgEjZmYi36nT
	7ELwdFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgUY-00000001V06-3G0i;
	Mon, 08 Sep 2025 18:21:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbg7-0000000HIQP-2vUO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:13:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45de221da9cso7556245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757337182; x=1757941982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VURWIkfuPan7bcStL9p1ueaB35kinp1F/svGb9kGJc=;
        b=uDRJ0baJVHrXiX0FNpL7M5ftsxJBd7mM17BdZU14UWuSofdnbR/+B4q6hja30GlpF3
         Kf/lHSUOSiP2x1wG+LgmOJVhF785X/3WMLqR+zxfhpXKCX7pE+kfvCR18C2U2I93Jbj+
         ydL/fTjqy0X/nEYmMTzUQDQ+C/YbCaSZtJ4cT83zoAFCg1Dc5SfmzR9pkzLh/ldHmSf0
         74LqPZ6rl9Zb7QrAiiri40V3Z1U6rv5Ge85x4JWr1DUFvwUHkajpTy2vKTpBdndyviAJ
         wqOkDX12GmYIgmi6QOiWoft3URvah9LP8jCLFyRPNWMAQZ0cmftoQubEorKoD3azvVh+
         FuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337182; x=1757941982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VURWIkfuPan7bcStL9p1ueaB35kinp1F/svGb9kGJc=;
        b=ufyBBMnMsKqmdppnKcYLOuLJd4m6aInLBwGRcAYeg56VeweUwVbJIlpu+EDqLH5vAP
         E55S3jqVDTz70/I/M2oaItoN0g7VBWmOiGCpyaTofC3yLNdJcV8DyRkUd1UaBjHQLnAR
         HToSnzzyN1ALZSy1w/fqFnjeC7gvVmYxWOzSfo0q8LhRBUayiXPvwQcC6a1k6vh1bQ9B
         owBOyDAs+/2auqznH3IetBbU52D1+rezOmX8mkiVLef6YdXZ6/S2clLjXq2qczXc+NPc
         0LcntVRIJkODsRdm9aCXK6kLVlZy4ALsFX+ONQ2jkHimU4YEHWcEcQyt2++v1U3esP/5
         jaYg==
X-Forwarded-Encrypted: i=1; AJvYcCXqHDO2y7vJFbP/4Vo9gbSKDCkyqIrNf/P0E1qmJ4qEeYWUmkL0MYP4bcOfKiUEXuSPyLChRNzPg/8yLoKKjKE2@lists.infradead.org
X-Gm-Message-State: AOJu0YxcAfj0BRtcFiDURmjG2gNtJDxxbcvXcyuBR8nNxPgcXfM8Iysn
	r2k5Yp5jd+vJ0UTZoTY6rirMp6hExteWDFnDNC93ZktAzGqrDlg/S06zXsNgaK/gOYs=
X-Gm-Gg: ASbGnctM/kJiyQyMDRaQiY/iAnfuoyyaUWYpj0OPYHceVw35vPkEJGLHyDWyCb6K9l7
	d9dAGI6c0PHfRNKXHBpklJEVg5897lfH3Kx0klUrf/C5gkM9BncDbx2QRxi5vXkBxS+ngri3CxH
	3hGjOwsl40lszMxyQ68GBzQfYlrQJHaSGkzjoJqjjSk45GTTpbsIXggFvAetz4OGbGkcNfZq6l1
	X9sTuBlJ+QVbJK/57+o9Hk0D+iNiZ/Wqpf1wJwSUKKh8BjVrJ9Ht9suoynE0azCJnfF9RZTt1W7
	VE6AoglTVyYHMbELAK7iIxCHPCXsMog5xmSDfZrDoSuHeGhczE4TzoanngxuMW4Vi27I7xp77HF
	fM/96VMqYHoOx2SRnA3wVjRsaB11YWrlRr1JgDqMG9eOx5wRpL/yyDRt7JUGsMEGiTnzbjbBbHg
	zjcQ==
X-Google-Smtp-Source: AGHT+IF7+1AW9gZi8VQR2eAfB1khonQITj9xmbUIJb5Ssirri3fDS6+tN+4m3PJu5jGzW1eTe1Ha4w==
X-Received: by 2002:a05:6000:2681:b0:3e4:74dc:a3bb with SMTP id ffacd0b85a97d-3e64bde9298mr7276281f8f.40.1757337181458;
        Mon, 08 Sep 2025 06:13:01 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm41650181f8f.43.2025.09.08.06.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:13:01 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 08 Sep 2025 13:12:44 +0000
Subject: [PATCH v4 3/5] firmware: exynos-acpm: register ACPM clocks pdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-acpm-clk-v4-3-633350c0c0b1@linaro.org>
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
In-Reply-To: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757337178; l=2606;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=pOrwHMUpTRHTOWnb5cnnDdzeM4ESkRCjGNVfFG9Nc7M=;
 b=UTpAb+oSnFVBaTobsje5fgi9yvKDrERYAhJexCt3pEL95FZ5z5dw1g464Yv1noAWgt1hsVIOP
 AMaQN6NW/q8D2uKwG/IM/JHV9cOncEqoKaD8YigxQkmL3ikjGunTHUd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_061303_739646_A1B2E6BD 
X-CRM114-Status: GOOD (  17.19  )
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

Register by hand a platform device for the ACPM clocks.
The ACPM clocks are not modeled as a DT child of ACPM because:
1/ they don't have their own resources.
2/ they are not a block that can be reused. The clock identifying
   data is reduced (clock ID, clock name and mailbox channel ID)
   and may differ from a SoC to another.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 9fa0335ccf5db32892fdf09e8d4b0a885a8f8fb5..0cb269c7046015d4c5fe5731ba0d61d48dcaeee1 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -177,9 +177,11 @@ struct acpm_info {
 /**
  * struct acpm_match_data - of_device_id data.
  * @initdata_base:	offset in SRAM where the channels configuration resides.
+ * @acpm_clk_dev_name:	base name for the ACPM clocks device that we're registering.
  */
 struct acpm_match_data {
 	loff_t initdata_base;
+	const char *acpm_clk_dev_name;
 };
 
 #define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
@@ -604,9 +606,15 @@ static void acpm_setup_ops(struct acpm_info *acpm)
 	pmic_ops->update_reg = acpm_pmic_update_reg;
 }
 
+static void acpm_clk_pdev_unregister(void *data)
+{
+	platform_device_unregister(data);
+}
+
 static int acpm_probe(struct platform_device *pdev)
 {
 	const struct acpm_match_data *match_data;
+	struct platform_device *acpm_clk_pdev;
 	struct device *dev = &pdev->dev;
 	struct device_node *shmem;
 	struct acpm_info *acpm;
@@ -647,6 +655,18 @@ static int acpm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, acpm);
 
+	acpm_clk_pdev = platform_device_register_data(dev,
+						match_data->acpm_clk_dev_name,
+						PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(acpm_clk_pdev))
+		return dev_err_probe(dev, PTR_ERR(acpm_clk_pdev),
+				     "Failed to register ACPM clocks device.\n");
+
+	ret = devm_add_action_or_reset(dev, acpm_clk_pdev_unregister,
+				       acpm_clk_pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add devm action.\n");
+
 	return devm_of_platform_populate(dev);
 }
 
@@ -746,6 +766,7 @@ EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
+	.acpm_clk_dev_name = "gs101-acpm-clk",
 };
 
 static const struct of_device_id acpm_match[] = {

-- 
2.51.0.355.g5224444f11-goog


