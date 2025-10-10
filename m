Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2337DCCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iPGUbK9frPbiRIF66lkOW8PKDoG2AW/288srP+02V0=; b=vLeLhrdYKMi7rUURllBeg/gMqP
	g8NYE3hWonCmNIJni+7DbmgfIbSQ2CheBPgTZGSPWJ2h68dwtR9YCXrTuE7r8ZFW77zkyKWKaOPvu
	GpLNQJTaBZltlNSSKSD7KXe5OYKkD1joOGelq+f9b8OrBi3iEz81ZIU2t/qvTmVY8J6jS6sd2gcZ9
	JaO3zMGZbYhLGJUUSzOxJzyDNup0p1TJ0rPrCT9RFzIe3vov6cqg1G1aqynFpgoketLFh9LoQIneN
	5n0sHNiiQIb94pqlHhGmLTZHMuFlNJbjDwpJYW8PBs74S/uZJB4CYCIJVcCrqSK98BSlIfr4PPhNt
	OJejexkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CWK-00000008TyD-3HrK;
	Fri, 10 Oct 2025 12:46:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CWG-00000008Tsh-2KaR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:46:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so2364494f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 05:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100407; x=1760705207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6iPGUbK9frPbiRIF66lkOW8PKDoG2AW/288srP+02V0=;
        b=LmoJ+aIIYz9tJpY5TyNGt4HSShXHR5wB4f5+xNCGvT/Ku9BmceEYN5fssMIqXHln1Q
         QLZZckXSRaIb+PWyaOWGDNMYQjtSsmhWJLEY9j/D+o8jQLxoRwufNFnMI8H4HTryRi4k
         E8p0n2WNeJWKpOTk02BCwGWxVwFTHcX/K7nHgTe0/Ol4jy3oIECxCA1R+RLPUQybIOvN
         S/Ze1IBTSzxtUK/Xbu4ED8UgOIMt0XkqqriEL7c8ZVNUcYjWrmac6oXtvdo1G6KfwdnR
         qUwv/8gXgGSC/r6yo8RsXMaAKqZakP5Kz8Zx/4X0tkFuWSKgjnkqRhReO3iJH6Vpx1Ij
         2aPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100407; x=1760705207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6iPGUbK9frPbiRIF66lkOW8PKDoG2AW/288srP+02V0=;
        b=ZnEM+x+wEaNH0LTUeGWjuOg84QB9i5HjhgRIFE0M3Mwg3KbJh5PBZ1S8F70npDzkp7
         3MtIUVjKXzZDfdehUHbfIs1SgR0t8B6nzfag5uv6+A56oJFZLd1tVzBkm4yKfl3jgAcQ
         PAvklPqSU7+hJs75MeNtLGvun0KrdfdjioPTyB/dbGrvTnn/lFxO8cfidFD22C4i7gB2
         7QNZcB3hLPfDFfqYP7ZD+NZgIDYprpGeFERCSXrxXGAj1D26vGaN0diwmBnSpGZDnPct
         Zwgv3AqfaGYrL/+jsyKOGzDMSQIwB8IuF07Zkhj9u38QbdjMHlXyFrphoCPOhtpNHh4v
         Zgww==
X-Forwarded-Encrypted: i=1; AJvYcCUgjUgerMv89lzjW2UFqnlamthci80OVCQruqRrMlJPcPnkpg3/vboT+6uRT3SX63phl7GTC9WKKCCqaeOn7WFG@lists.infradead.org
X-Gm-Message-State: AOJu0YzzW20ZXXXqDQw9nvycp50xI2zajMCp+QMESt0LHjhlHLw5LWgY
	o8unUIMu9LdI/f1rPSQZXxOXzvg7CGcwRYGjJZgMS+YWgCL3VoGeaoqe2C7GxPu2aEY=
X-Gm-Gg: ASbGncsT7eRzBZCOMLoxdFgo2eU1wRxjdtuRBm3GLUAAQKST6Cqe5VZKgcSvZWKJhf8
	8EQL3AYgWtp68dtH4JN1g2+bb3NScPjq0Ojdg/rahGTfVCpy+yCQv3uJVtStMrJPvxGwvFNNz0q
	y2kOkhAUHerN2h0ILTMuDkT7dNa350nkZP2puqZmVOt6zzsE8b4+chrpLnwZJkhy0foL/MKfy94
	UU8BP8OYjI4pytmPTjUWMCWrsFI3biHqPqCXLck+wFHKSxdl+BtXp9a9XvFG6Qu8kby3FNWV7+t
	rvIwcCYhHiA83VsVTaSOleJ14Psa4Wpn7tI4IwRHPlNGkv3dwmSaag8y6PXP7I17ktsnel3uR/B
	dSR5hf3zIDLaGGbcFYb1uiZ7PImatKry+xPV3RTz8Sk+1k2EfRjgOUbloWiR4UzbXnGLF8/2hLO
	LfiqrHlLB1RgFBgak5ufe0gg==
X-Google-Smtp-Source: AGHT+IGDLF3Dn6ww4MqMyl8hynsTWVMXq6aUH6TJOkzwSsp0EMXTDsmcy1Rr53t1iniI2RiP834aMQ==
X-Received: by 2002:a05:6000:288c:b0:3e4:d981:e312 with SMTP id ffacd0b85a97d-4266e8e51f2mr6813063f8f.62.1760100406667;
        Fri, 10 Oct 2025 05:46:46 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:46 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 10 Oct 2025 12:46:33 +0000
Subject: [PATCH v6 3/6] firmware: exynos-acpm: register ACPM clocks pdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-acpm-clk-v6-3-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
In-Reply-To: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100401; l=2732;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=t1lPRTLbJh3Ia3iHDBwP0Q/txEDKq77Cj8s7vCWLHB4=;
 b=qk3U65kSz815bNfHe5stxRu4BJ0qvWZNQmQfMvtFvJGNAjNj9MvxWPW5Jp4sLvaf2hRaK3Jlg
 J1pvueABQIEBkgK0U/NX3fwYmXMxSALpy5zS1E7Te84RmsjTueCqo4C
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_054648_624381_9A7C4D2F 
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
2.51.0.740.g6adb054d12-goog


