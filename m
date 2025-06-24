Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B44C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 12:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWhMh/5fYler3nhbWTRM07ex/VdP8S0PYvhv8obnGps=; b=xPYxPd2aLskQ2BOtejwsum/bJe
	+zS0r2PkhXAoC0ILjp7JdCikZYPxQYKgAV7p2p8E3rSleIU2crusNz/tCuUDhb5KVpxLmHpOnVCgT
	3OQ7kiRB1XCfja8q08/27bAhfGpusk4nlmgfycIdCaWYK5Y7/3oMj8mLuA8Z/pZZtwxerv1nwOz2e
	DZPWZJgU4qlWWk7gfiJEy+FwZZCjL3Nt9019vExOmbqK9K1HJOAgZM4ZFUsIftNZWZWTOsxoaep+V
	0a31j7GQ7it1yy2vTKQIHfJKUgccYweTKqtZmaIC3jIEqEsSNdslJSR7M3/LnR14WGlLKE4ZkYdV9
	LijGtrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2uh-00000005baX-1LLD;
	Tue, 24 Jun 2025 12:38:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2fk-00000005Yid-0aro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 12:22:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-adb2bb25124so81354366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750767763; x=1751372563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWhMh/5fYler3nhbWTRM07ex/VdP8S0PYvhv8obnGps=;
        b=pmHparUiMJpfqF8VLx2hy/bCHeGVaHxz4893Mw/GLoeXfnqhAdRIukKWr1gxEEjg+m
         6psQVDZIJ+0eqfJQgyNmM1TjVrHIG30DF0/Xs98eDiqehSJAFFUVnlw3QoDKZ3yWGtp9
         p37OgRGRFEOi2ced4ZtFzJ6H92NSSW4b+9OIoQwt69C0k25EIAUE4ociDnyT51yxIPSd
         Bw4DNAKH3tJOUASRNetTd96YAEqdXiEiEgwvTfufiKM35lHHXEwvuQE+h8aDUFjCtqjj
         mOpppEUOej+zqCsawE9Rba0v4kRkLunafDaj2yR2g7u/e325ClFhYVEeQOh7JbUC9oXi
         Apqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767763; x=1751372563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWhMh/5fYler3nhbWTRM07ex/VdP8S0PYvhv8obnGps=;
        b=PzZMWJxcZhRULe4kquAZzy6DGHWT7h3vj7NfklfUT1EvU10xjVt/rXzfe9uVKbAd+V
         n/fxpPkc3QTAFNARJJCx5nBzrgupe+G/hGoodoe8AwkWMBOccTvcuXH5InD3Z94s2FbL
         Hkv9az20ajLgSdv+j6UjuruLtLyDr0ldZmLKIFLgxTCYxQD69MPxE5VkFezCihKd6MMU
         muBuGgnn9b8Jd58VO7lYym46tlO/2XsbhmLhJic7mq0S12annqN08siWc5fjqGtSFcpe
         Xh4Rs24cVtu4aEIUiQITOukeNv2xHf0YfAn/GyVRLLChmCDXLiNGQwdhjmBO9PBfta0t
         L4iA==
X-Forwarded-Encrypted: i=1; AJvYcCU6UgVQtBGMhEXkdIF5t3GbKNcZVOtJt0rVbkcz9StZ543AmLivdVnb3ZpYLQGlEzXa6F7/qiYHVNbtoWu/bWzD@lists.infradead.org
X-Gm-Message-State: AOJu0YxZN3SpcZObUjhRNtr4pWwdVEj01/CvSzpUCZDO6w5otVizMMqu
	vTfZ3jIPJmjv+1OCPmyoLq9Uf1hRkz8vBgNsEBwrWypnw1l4B28IGF34uQKDPlTq5iShpKxAa3b
	VrjEQ
X-Gm-Gg: ASbGncttbKfNpYuI/NO2UXIVcm/Taitx62LkZttcivfjy4jGin0l4jk9cC2pAaE7UOm
	yClibjCxCYHCpUJzZ6NafEMh4ejBxEAoGaJwJdJx80ITvbgWtI91nhQAjJP+z07raW5q1ApkJTK
	6Gha2T5SEhhCDqqkLDlr4RW4pcZ5ehGyxzUqreVsyYWMVqEEWjV7fEuerJqfy8dKLwb4h5ItQdz
	T9HOMQQGGKTzbMWfVu0lU+c2QU804dsD1U0kdTRh0f87dhYZO5aktXBshYifKP5cFPrKJwUxrOV
	FpZRFg98BHV7CrGZfO1Go7v21JwbvnoMmnlZU96FbcRfYJV/tKIjgOZyc9IGqt11g26OZdmaDzv
	t87mG9w==
X-Google-Smtp-Source: AGHT+IGJeHAE5O/zwjKbt1rTA+c+TADFcI3NU88w3TmhhB+vtkSIGErnItgRWYP4ZJeQzbFZwyUKeA==
X-Received: by 2002:a17:906:7311:b0:ad5:2caa:cda0 with SMTP id a640c23a62f3a-ae0578e8100mr576222166b.2.1750767762491;
        Tue, 24 Jun 2025 05:22:42 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b3448efbsm56794966b.177.2025.06.24.05.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:22:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 24 Jun 2025 14:22:30 +0200
Subject: [PATCH v3 1/3] iommu: omap: Drop redundant check if
 ti,syscon-mmuconfig exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-syscon-phandle-args-iommu-v3-1-1a36487d69b8@linaro.org>
References: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
In-Reply-To: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MR4X/vqSPCpzHXBlHPwjTdycYDcqajyWXlyrIiTPhc0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoWpiM6ARA2FxSObqWTe3UcZTFThPbO9BDoHWLU
 PhkHh1V/zeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFqYjAAKCRDBN2bmhouD
 10LmD/9HpPHgdOhaRuuJrbNOYY6y9CLhs2idJGqV/EDv2qgsS8WG1i8N2cleWDdJPlajEelEsbK
 uYaR6Z+FIKU4TWCOtHXjkut3T8C5kKBQfrMWmCzFoA3Br3z+X5FssW76DmzfikShRZdMPIKAlyj
 VcTszq8nPqtvxu9MPR6AJrTkyWRr0CyOJG3fShHB6V3YaHccvBsGaEJkoFElPyKEUMcLK42Vyym
 Zrxd3svSy2w4Zz8vvKJgvjsUUBJ3dr9BMe8xng/sMQWX4Nqn1Qi9GTdMGsnMvKtergM97bwe7Rz
 Qzsfp5TnYpKP9zG8SnvZTJ1FCKnHRwsbJJbO8cjvoIxJkWykthRKQ9fxsRMXyxBPRnuELNnZsxC
 5edJu4QdKJpjs0famlCNyXA6AS9hh3aiTdU+RHXNyKSKjyRnJYLTKTAGIR3QfD2Ura7SpymfIFk
 mId46fu0g5s/ueNSgigZnt+qUJOiarAgsptFCQ0TFhvsIvCoxUWbilR0VYEnQtaWfOZpCRetqNB
 etOLco8RovGOUMrSiECRB6Oek6GPuca/SZOU+PJxTy3ULIfHlbRdmVTaoBp5N3oTW2ZK31yef3F
 2H6IuMznU0SzXzxW3BpTNuOvFqhBE21SupYWzzYU/DRIvtFvHr/Pyfuo/gLovJv9dOWV7mkbqo4
 B+5rkWKjyrOp7Tg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_052244_189132_72ECD875 
X-CRM114-Status: GOOD (  13.52  )
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

The syscon_regmap_lookup_by_phandle() will fail if property does not
exist, so doing of_property_read_bool() earlier is redundant.  Drop that
check and move error message to syscon_regmap_lookup_by_phandle() error
case while converting it to dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/omap-iommu.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 3c62337f43c67720a15b67e8b610da7886f6f39c..4448c0a512137c79195112eea25d762266c77bc3 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1123,23 +1123,15 @@ static int omap_iommu_dra7_get_dsp_system_cfg(struct platform_device *pdev,
 					      struct omap_iommu *obj)
 {
 	struct device_node *np = pdev->dev.of_node;
-	int ret;
 
 	if (!of_device_is_compatible(np, "ti,dra7-dsp-iommu"))
 		return 0;
 
-	if (!of_property_read_bool(np, "ti,syscon-mmuconfig")) {
-		dev_err(&pdev->dev, "ti,syscon-mmuconfig property is missing\n");
-		return -EINVAL;
-	}
-
 	obj->syscfg =
 		syscon_regmap_lookup_by_phandle(np, "ti,syscon-mmuconfig");
-	if (IS_ERR(obj->syscfg)) {
-		/* can fail with -EPROBE_DEFER */
-		ret = PTR_ERR(obj->syscfg);
-		return ret;
-	}
+	if (IS_ERR(obj->syscfg))
+		return dev_err_probe(&pdev->dev, PTR_ERR(obj->syscfg),
+				     "ti,syscon-mmuconfig property is missing\n");
 
 	if (of_property_read_u32_index(np, "ti,syscon-mmuconfig", 1,
 				       &obj->id)) {

-- 
2.48.1


