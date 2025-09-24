Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D79CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41p1zpQsk+NbDwSIv78ihFM0CdBgvYG00QN32wnKKd8=; b=35MbdwzVIvpvHGqXCCt4iZntmj
	b8KTbjP2d/g3RWuwFvRSUGelHXMweT6Y0/V1eUKu3/QbPqqJuhcM0ZNeWHo4ZyRIKVodb965gq0Tm
	LyjzSLwfqjA+ltO+6KuGOiMqgUNWYA7VI9w8jY7CZi3vGYakQRTBPXB2c0qqBqi0qhecvLoJhId5c
	dy3pHnM9Ei+fq6adbn7+9ISQoU8plFTdpBFokMAeovr9Wg+KJXWGiY/I28aNaQogKAkbbCFADLSOp
	TuR71lqQNjatK6p5eO1RG3FAb7vRPTyxao2chZyxZ4Aw0RxoNPRq+nSu4p0IUol+JbvuKvvSxZna7
	vAWQjESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R9M-000000015Z6-3MIz;
	Wed, 24 Sep 2025 15:11:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R9G-000000015Re-0xKV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:11:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46e2562e8cbso13158325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726672; x=1759331472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41p1zpQsk+NbDwSIv78ihFM0CdBgvYG00QN32wnKKd8=;
        b=Mxd1RK5mCUI+ihz67czQEqgKosNMLc83AE1l38Ui4q+NoFyFFprW3TFWt0Z0RKCgr7
         +AwrwMV1M6TIaW6QhwfOSt+AiELHLPgNT2/Kfr0W5r19yQpK2QDIRLCBoMmrwqlHTdrE
         l3NkesI4RODHKtPLpsmCFokJmk9a+5nLu/u89+BHwAv81hMbBdGUdQY9Sxz/w7XL1T3r
         uGvhixuRpMPQ/u31BKwJy2MvEsBsQ/B/ehbHG9bYcbGHf9kiyqGA/6Cq6vnWrQICD3qD
         TnWVmxCCoouGpqVakggDjhwsirqsQ3YP7uVjpE2ZBTyWZYPhV8nveWDVtOue+fCGbgyi
         lIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726672; x=1759331472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41p1zpQsk+NbDwSIv78ihFM0CdBgvYG00QN32wnKKd8=;
        b=mWG684lqFiY1qp1qGkwHmMoEupBhjidzruqxeKt/fwh2PMdNrlgM1Xf8QcVer3C5O4
         RxIbGg8+MYHUL+dco6cSew6SU/Ootd1obfI3Z4z8xlMtH0e0J1IIXl0H5v4GcC/tuAwt
         F6SU1/U+Khg50aq+/BRBFiIQV5kKKO3OfMLtcuYB6BUvyYZw/bLYp7ww+TnQJZbMXBwS
         Q83iu/RzwtXRI5B91VOUDxl0lhQNR1UP63X/6YwNLwVXrfkc0NQSkCqv8SXQmSLtVRs6
         Lu6Zl+2qg6FfU7U4qFzkhNADvmhEpPv30qDZgYsYt/0PUKKBSbl1wFvI4DG/FWgC2m/k
         pqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYipu9kLlSlDXHseeqIvEMdi/peDNC3IjbJqzOchNfQtvTVfAqga658s50DICc60FRBVJvRvlpW+I0xu+UngNR@lists.infradead.org
X-Gm-Message-State: AOJu0YzmVyB/KVuekJJWT4FS7CL8MT/zpudfGYKSx6hB2pEGAvBBExGc
	Ek6U9cVOjbINvYD0S78gkLbBI0JarWyaqR9/j0b4tw10aFBdz+ZpDvK1aB+YogX9pqU=
X-Gm-Gg: ASbGncvT/6Jy0GlmkYtaagX8n+GL+3ac/9SL2TmgTj+lyUJm309TfW+awTrweu1MCl3
	oqh5u00UWiw7846Sn3Nxt0rFCerhMsRpnmaqaTVNIShrJsRA4bBh7hbGS15fe6L/y4RXJ6h+FQL
	Y+IpFQSPCoxWcK0qW2Y8UW1yFe2D+bRjlhsH3z15zjNVZuobE62GehiWFiCyYrx526dLopFalh+
	77xkoQIakxLrWwF9TguYMs1fdnN8mMrNv/cZq9GjA/1CWsmwEi2wf313u+vslx8p8dv3ngwPOn5
	AmOy+CgaIJNAEqCJcf2WEv8LEwtFY2uw+DzMNTqPCkdwvhaMYV7mTxdHc0pFW9RYaDagT+WLCri
	FsswAX8LnGLOhd2Pzu7D1DtNGpshnt3VhLtXtqLTFItyM7GwgEeeSmHXqWxWxtJ7b5BTL/A1G6b
	o=
X-Google-Smtp-Source: AGHT+IETWzoCn+KI4Y062GniSVBIueDGgqmtXBjNxKzPiwlUP/Ee0vR/LVaxIC0wQUEdUpBQ+TYtnA==
X-Received: by 2002:a05:600c:a47:b0:46d:45e:3514 with SMTP id 5b1f17b1804b1-46e329f9b7amr1978275e9.17.1758726672238;
        Wed, 24 Sep 2025 08:11:12 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm36045145e9.0.2025.09.24.08.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:11:11 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 24 Sep 2025 15:11:02 +0000
Subject: [PATCH v5 3/5] firmware: exynos-acpm: register ACPM clocks pdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-acpm-clk-v5-3-4cca1fadd00d@linaro.org>
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
In-Reply-To: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726668; l=2732;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=e9jnjsKxvNvdU2khw3Ii1tiDbQ0I3fEhveIt8DxtYOQ=;
 b=8K1Nho86vCYKFmFOrazLr4JP7fnaMoeuy8L8qTUu/0OpDGoboRM5EW54QSEvJNgMv/DGNkSgY
 c1wak4b5exrCe3QpKblmZ7ZO55mwUaDA00P58OE0FyNZ2H8STjvekkG
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_081114_301833_D347545A 
X-CRM114-Status: GOOD (  17.26  )
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
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
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
2.51.0.536.g15c5d4f767-goog


