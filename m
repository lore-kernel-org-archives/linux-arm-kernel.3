Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75947CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cfSXL73LYNoY9rCDtAr6B+DOeIwLOhBdUm0HxsWgPY=; b=kPK1n5VYpFL/dvKBk9PY5lc9Xz
	M+0pcj/ioY2ZUdWRRYyZVeqKc8+ZPnKBj5UDrT5EmtXQBJJtDa4y41fSz5P59cL2yBFbBFzjZMxtb
	hhbKLCGm7c8grBrqgu9OVT8344OO/yNwikOJGLyC0mjnJ8oZl12xsb9M2IckVIJlw7+IW4HIeMnNU
	8U3fH4jDiebCic1l1tz22uRAYQ+IHaEUpOp5FBivLLmm7q07FZoXXCbd64GEYejrKT0EAEDHYKw6S
	hF8g5W+MNkOIHzHP39taW9DF5McVuPCDtMSnEGMWlpNChMlvPoB9EGb30XMJnoFzcAQOcIV7wAsvl
	wjGXzQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIRY-0000000G1uS-3q5G;
	Wed, 27 Aug 2025 15:52:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFTo-0000000FSIt-3BTI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 12:42:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3c854b644c1so2569822f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298539; x=1756903339; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cfSXL73LYNoY9rCDtAr6B+DOeIwLOhBdUm0HxsWgPY=;
        b=cDLTuv2WQjbHXuil3NiOGL/k2xDTnuk4r0mh1jUH/Q/9MJn96Vr6tm2iwE0M0pW2qr
         uf3wzPYmX1lAxG5WfLYpbrT7yt0gGQbQeKk/BFxzprfY6pYTPakl9+JxjyJqxbrGluzX
         XPyePXfpGEgX+NRthr9/O4sg/XxHtfk5PZJ4LRfyQ3pY37YYm4NlDKSwu5R+IN9ADh1j
         I5ZgAY1Tx74n1Iwgx6NDkf3W5EZiDGe8gNI6dAS9XGkOVlA0uDP84RtUPlRz1H1kHHMd
         PWIYOFabYt+DpyXIgCs381m/mpKZR+ghrwkYuBmDKrf+oAzJsJHBcr3LyR5woZcLB0Nu
         I+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298539; x=1756903339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cfSXL73LYNoY9rCDtAr6B+DOeIwLOhBdUm0HxsWgPY=;
        b=LP4VBu8oztZx4iJ/axCzDXmfaDemJyyyoFhPl8cQbxA3e+XRJxhUQGbfyiNWm8gObG
         ZM9YQYOQVugV4KW69c9jrwkQYFSYwZa7RqJ4zn7FrsWkeP7/Es8dkpN5BZvFnXXl0ssB
         CnalOim4MK7v04fTQh4ayWICUwUA7nC2VsAKYmN5lQEY3AYApMZzxfZb5WJm8lXYBuAl
         FVnAw6EocbAOVi9It89c4Eh4IswHG5y+y4ToR4Mq/DqRjin5s6gPfbGbaI6eEU3aBXwP
         454cIUNMdSpv+Xe1lo0C80HGuf7SSrtpuj7kTu4G1nyMlby3l9x31X+99besKcnPbtxI
         pS8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9EPwURXBcR+UWaxH8rTsmPz73PGwW/VDSe54GOGYznLMN9SH6xhJww0fvymVYhgH0ILKuPHimPczF0yns/1cu@lists.infradead.org
X-Gm-Message-State: AOJu0YwUa0w7GLT7nKE8tmu+o1H/dhNW7SrVOEQnmcvk9ifYdRhCfah/
	1WURFpFXOoAMrv5LBgJQ1QctsSSOD8shJzNd7DrvPCjL6KdTap8q+eWpTTqczJNm4R4=
X-Gm-Gg: ASbGncsuDnqK+m7D/YyYLolltQtHaw2xk50vaeZ1aQKWCiEmkrTMkNJROI0QQs9h/dH
	DVaptsEggFUyaf5cWUFaEg0ojfxHksWhbKRtv21F0xhhlmNcCkBS9fZQBMgYYwIPS8uHwIm3jiH
	SEDn0kAKRmi2vYdqrQAB2D4sEksUEwG/gM+GGZ3DCTCzHlMBFDwcHbIVYX9edp2cNSYl9mzTCka
	6xUUUsK0Mh5z073vq0FgpepxbxolmfgdQBE+ZpEwgL5yKvSqKIUfTtiO/Y4UsAw8RaCg6kGytkt
	+doXwFNDSPB0dTyLdcLpksmhUlgnM83H5tcJi4s4mvsbmdJD2MPjXJ5Qnl1v2Ve2hmUlu7MZ9dx
	SO5mMdBTrTjOqEhlxD9L1auTOPxXd6Qvx/9Y7GMBTg8oPcvpx/RMGeGMR8EwoZSFtIdgk7MoHri
	7uVg==
X-Google-Smtp-Source: AGHT+IFlHa5emvmCKQfoDDkPRlNGe/uXhHgcv977YZ2vSKl+w8mC+U+AGdr8d85CmNa+TjSLH+q9Nw==
X-Received: by 2002:a05:6000:288a:b0:3a4:fea6:d49f with SMTP id ffacd0b85a97d-3c5dcc0dec3mr14394157f8f.49.1756298538987;
        Wed, 27 Aug 2025 05:42:18 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:18 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:42:14 +0000
Subject: [PATCH v2 4/5] firmware: exynos-acpm: register ACPM clocks dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-clk-v2-4-de5c86b49b64@linaro.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=5210;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=GciBv6TscMWoUL5NOWHvgdZWg70tQo2b5jzt+et6cck=;
 b=GS+9vzYJP6T4ggVpRCRv6J4WvF9fBE/H6F09fimItPewcc/1VJ9tRuthqg3yPNy+9zXnUVBvU
 ukecEb66+HWAfBZ7JoAEuzjmTBSm7Uw9ybIAmdsFdHdZYdNJKT/66XL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_054220_807007_48A377C0 
X-CRM114-Status: GOOD (  22.74  )
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
 drivers/firmware/samsung/exynos-acpm.c | 64 +++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 9fa0335ccf5db32892fdf09e8d4b0a885a8f8fb5..86a220a845d2934aa28e9bb8996cf914f65cdae6 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -24,10 +24,13 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
+#include <linux/platform_data/clk-acpm.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <dt-bindings/clock/google,gs101.h>
+
 #include "exynos-acpm.h"
 #include "exynos-acpm-dvfs.h"
 #include "exynos-acpm-pmic.h"
@@ -160,6 +163,7 @@ struct acpm_chan {
  * struct acpm_info - driver's private data.
  * @shmem:	pointer to the SRAM configuration data.
  * @sram_base:	base address of SRAM.
+ * @clk_pdev:	ACPM clocks platform device.
  * @chans:	pointer to the ACPM channel parameters retrieved from SRAM.
  * @dev:	pointer to the exynos-acpm device.
  * @handle:	instance of acpm_handle to send to clients.
@@ -168,6 +172,7 @@ struct acpm_chan {
 struct acpm_info {
 	struct acpm_shmem __iomem *shmem;
 	void __iomem *sram_base;
+	struct platform_device *clk_pdev;
 	struct acpm_chan *chans;
 	struct device *dev;
 	struct acpm_handle handle;
@@ -177,14 +182,39 @@ struct acpm_info {
 /**
  * struct acpm_match_data - of_device_id data.
  * @initdata_base:	offset in SRAM where the channels configuration resides.
+ * @acpm_clk_pdata:	ACPM clocks platform data.
  */
 struct acpm_match_data {
 	loff_t initdata_base;
+	const struct acpm_clk_platform_data *acpm_clk_pdata;
 };
 
 #define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
 #define handle_to_acpm_info(h) container_of(h, struct acpm_info, handle)
 
+#define ACPM_CLK(_id, cname)					\
+	{							\
+		.id		= _id,				\
+		.name		= cname,			\
+	}
+
+static const struct acpm_clk_variant gs101_acpm_clks[] = {
+	ACPM_CLK(CLK_ACPM_DVFS_MIF, "mif"),
+	ACPM_CLK(CLK_ACPM_DVFS_INT, "int"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL0, "cpucl0"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL1, "cpucl1"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL2, "cpucl2"),
+	ACPM_CLK(CLK_ACPM_DVFS_G3D, "g3d"),
+	ACPM_CLK(CLK_ACPM_DVFS_G3DL2, "g3dl2"),
+	ACPM_CLK(CLK_ACPM_DVFS_TPU, "tpu"),
+	ACPM_CLK(CLK_ACPM_DVFS_INTCAM, "intcam"),
+	ACPM_CLK(CLK_ACPM_DVFS_TNR, "tnr"),
+	ACPM_CLK(CLK_ACPM_DVFS_CAM, "cam"),
+	ACPM_CLK(CLK_ACPM_DVFS_MFC, "mfc"),
+	ACPM_CLK(CLK_ACPM_DVFS_DISP, "disp"),
+	ACPM_CLK(CLK_ACPM_DVFS_BO, "b0"),
+};
+
 /**
  * acpm_get_saved_rx() - get the response if it was already saved.
  * @achan:	ACPM channel info.
@@ -606,6 +636,7 @@ static void acpm_setup_ops(struct acpm_info *acpm)
 
 static int acpm_probe(struct platform_device *pdev)
 {
+	const struct acpm_clk_platform_data *acpm_clk_pdata;
 	const struct acpm_match_data *match_data;
 	struct device *dev = &pdev->dev;
 	struct device_node *shmem;
@@ -647,7 +678,30 @@ static int acpm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, acpm);
 
-	return devm_of_platform_populate(dev);
+	acpm_clk_pdata = match_data->acpm_clk_pdata;
+	acpm->clk_pdev = platform_device_register_data(dev, "acpm-clocks",
+						       PLATFORM_DEVID_NONE,
+						       acpm_clk_pdata,
+						       sizeof(*acpm_clk_pdata));
+	if (IS_ERR(acpm->clk_pdev))
+		return dev_err_probe(dev, PTR_ERR(acpm->clk_pdev),
+				     "Failed to register ACPM clocks device.\n");
+
+	ret = devm_of_platform_populate(dev);
+	if (ret) {
+		platform_device_unregister(acpm->clk_pdev);
+		return dev_err_probe(dev, ret,
+				     "Failed to populate platform devices.\n");
+	}
+
+	return 0;
+}
+
+static void acpm_remove(struct platform_device *pdev)
+{
+	struct acpm_info *acpm = platform_get_drvdata(pdev);
+
+	platform_device_unregister(acpm->clk_pdev);
 }
 
 /**
@@ -744,8 +798,15 @@ const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+static const struct acpm_clk_platform_data acpm_clk_gs101  = {
+	.clks = gs101_acpm_clks,
+	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
+	.mbox_chan_id = 0,
+};
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
+	.acpm_clk_pdata = &acpm_clk_gs101,
 };
 
 static const struct of_device_id acpm_match[] = {
@@ -759,6 +820,7 @@ MODULE_DEVICE_TABLE(of, acpm_match);
 
 static struct platform_driver acpm_driver = {
 	.probe	= acpm_probe,
+	.remove = acpm_remove,
 	.driver	= {
 		.name = "exynos-acpm-protocol",
 		.of_match_table	= acpm_match,

-- 
2.51.0.261.g7ce5a0a67e-goog


