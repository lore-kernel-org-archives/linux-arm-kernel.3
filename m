Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CE7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQ3Whnc9k1Q+1OLPMm8+x6IOLTpBlsEtmK8zovMkXoM=; b=urbO3Z1h2NKFhh4hIhdAfIsAFg
	V3ahldEnbfOBPk/bSaOhpIRoPU2CtjTC3V0/0izomTOlx9fpuYcFe+pzzunsu11om3/pyeB/lmoi5
	Kcy7Hih2LSuKnsU6Z3BsKDwCuy27624ctFKfBMiIjyl0UBkU0DrVXUYIKOFHFx+LfkqQeNAp7jv+T
	Bq47KZRBjQnRBp6P0mTnnXZAVdPQ2tIq1J2rAmZaEyhQyplKwls5b3nebjMfQ3mzFlKsfheOTpY1J
	GXtmyhRLW4PeR5LX5WaDY40+SBj6zz5Bs+LLdLV1aWCdKrtcQinXcy+RsbXdU22+SG4lBintBWgPL
	u8/C142Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyGP-00000002nhz-17kj;
	Sun, 12 Jan 2025 13:44:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyBN-00000002mlA-0sUR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:39:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4363298fff2so2924945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 05:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689151; x=1737293951; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQ3Whnc9k1Q+1OLPMm8+x6IOLTpBlsEtmK8zovMkXoM=;
        b=tnxK1AFiGwpzn+MHdjIGIreb7O/slMEWa9GJ8Ooc0MCwGV9f9T3ighzk6/Jek2dTox
         JNSiA9iU1wBL4eRedyqAwpcRkVtMilOMwS5h2z0IdFqguB6JUKaKAMrBQXhfj/ncErXK
         wuednRAVHOE0M7V0eRlWBD2gCOybBdSpfBig7VuOY0qfg2WpMfmVuOX8yWSnQzXBo0an
         KXNGNYCN+mF7subvQWe0c4BlYGloQXqT7g9ftZA1Cf8QwOa35vluoh27/cK59SAdP83Y
         uybCrvx83x43wsNgWXZURP04WIV03GZpIKbdZvrU6Z/ctMb7slC2bbEvMcYR5OTCdmpN
         YWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689151; x=1737293951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQ3Whnc9k1Q+1OLPMm8+x6IOLTpBlsEtmK8zovMkXoM=;
        b=LZj/brU7J97rNpgWp3zN5Za96ylj4g0lkOS0iG750gh3jvdo2dXtegkmFNHDJv3J4Q
         AV1RSXGDDBLoEFmUJGrtcBuL4P3JX+vEhJwRVpPRTbrNegjdWN+HCxDuZFHbMADEGlRf
         DT9UkD6PA+j8Lmv3k6G0VE+qPRaKTf6eVNCZ3sQrNOTI3ZuJuMzO+6RPY31FEpX5wIrV
         eVDoIaQeZqjefkn+PC+vEwlpiYR7XXGG4/LRNaYzT5hMWf9esMydcE9xFk/cyWubmc9v
         oPYwuzDPxK2qVplTpEcba95N4aReDwRdY5ygzAZUY4PY0kDES3FJhwS0mj3HtapLH7PO
         yLzA==
X-Forwarded-Encrypted: i=1; AJvYcCXx5Nn323PqL77meMKyoHYRfhgo2jNJBfQwviB8rEvmkaolY4LRSUSthuH+uZMrMgVj4Eota7wXIzig3+8l9V8p@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr69PPcK9Ku3gcb1XtACmHkEEZX4rsYkOF43sod0++F7AowJNg
	gZZndTSuKCG6ByWwRTLkgrs8zFdy9aZ1vbRGel333m8waQsiDyB3YJiRxE/D8ChnBYScGSIrv/7
	R
X-Gm-Gg: ASbGncsIJtIKGHNmpu016P0aWLuL84XuyZG/TNieKal/uXyLHRXWr7jsFPSGEhaKwqR
	ZhKqRv8XekCj68e+TYoePGBnALmuOnIbLUZ6+Il+8BGeAPpzOHrgqaMhoVDSLPtn3KpP41sYV5t
	dSkiWzix+zoF56UdHpuVtUobWK6JxJxrzuNyGgUbsxY/MO5vOQYRK+Bqc48jetg6flVs+VxlWse
	8UPJyVJNRmLNEvG8+yHG114BxGPbUBybqME4uUfiJL35nAsaXf/TJ4u8jH07BorXKxWPl37
X-Google-Smtp-Source: AGHT+IHlqQUT4nJ5SQNBM6sybXZwL+bzxz0Y9M1+BN250gX4iG9BJx5WOU34PwgsHmMccXztrJhIFg==
X-Received: by 2002:a05:600c:35c2:b0:434:941c:9df2 with SMTP id 5b1f17b1804b1-436e272c89cmr62461175e9.8.1736689151481;
        Sun, 12 Jan 2025 05:39:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c006sm9581924f8f.46.2025.01.12.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:39:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:39:02 +0100
Subject: [PATCH 1/2] PCI: dwc: dra7xx: Use
 syscon_regmap_lookup_by_phandle_args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-pci-v1-1-fcb6ebcc0afc@linaro.org>
References: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2790;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=O/NOpD3CQ/1x8q7Y6t4lRJsHtiSHlvyOKne/i9Zp+mw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8X4L014og7m5GFccNS9Q1a7ef8G6dskIt37N
 AtuFjYZz3GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PF+AAKCRDBN2bmhouD
 1zdhD/9GJ5EK0dF1XS8FiJAKuNvLC2/kqb5mlabJRSMHZdEJCZ/GL7iydkfU9R1IKDjA66xKDmm
 hlNvjnRKN/hieQdFKqBKkIaX7u1J8XN81DlqeApDDVAvXODx9YSIhO9ohNVyS2TKVr8ijveqHRV
 xf1hkYIqg3PI+4hoBI19dAtKTe5fMuYqNGAef1GQif0M7Ft7R4pwIy8GOzXcwEwN/w2sxCihHI0
 dFdgfMR8fpJlfVyXIzExgvbuAQHETHiDkWsEMuFk026YaBiYaNFUUySyGVGlkMOA9W6sDHzBTVd
 dMq7AR+B+9ieQF6+urHXKTHdEulrR6e5GzgbtB/HP6Lg7moaY3WQWo55ApZSRtX3pIKxpkCCR5a
 sVwl4OKXXouOWzWCjNZJtSHMln7mbZL0AtDRu3woJlZLn3gfL+EPeSBbJUnzgUcOIfZ9eo8GAsG
 ntmiIBueXybLz+sA/pd+O1rFk5mWLdE9/SO4XfQmTTAcUSw7ZgxdlM1gGc3f7BNNSZZSBSRunX0
 2YlqC5NDhKq0MCNb9E3HwtK5DDgD0VRrfxyjd7wpqx/nWmLxq0+A1CtnkXo5AKgDBofZrafaiPD
 BFSuFhJASUudUf8dUahKZZsyJMXG063citE9ertMgorxFBCJvwmvganrycsTWi47bthL/d4KAxB
 REoi4dl1sllDW8g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_053913_253625_7FCEFEC5 
X-CRM114-Status: GOOD (  11.85  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 5c62e1a3ba52919afe96fbcbc6edaf70775a69cb..33d6bf460ffe5bb724a061558dd93ec7bdadc336 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -635,30 +635,20 @@ static int dra7xx_pcie_unaligned_memaccess(struct device *dev)
 {
 	int ret;
 	struct device_node *np = dev->of_node;
-	struct of_phandle_args args;
+	unsigned int args[2];
 	struct regmap *regmap;
 
-	regmap = syscon_regmap_lookup_by_phandle(np,
-						 "ti,syscon-unaligned-access");
+	regmap = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-unaligned-access",
+						      2, args);
 	if (IS_ERR(regmap)) {
 		dev_dbg(dev, "can't get ti,syscon-unaligned-access\n");
 		return -EINVAL;
 	}
 
-	ret = of_parse_phandle_with_fixed_args(np, "ti,syscon-unaligned-access",
-					       2, 0, &args);
-	if (ret) {
-		dev_err(dev, "failed to parse ti,syscon-unaligned-access\n");
-		return ret;
-	}
-
-	ret = regmap_update_bits(regmap, args.args[0], args.args[1],
-				 args.args[1]);
+	ret = regmap_update_bits(regmap, args[0], args[1], args[1]);
 	if (ret)
 		dev_err(dev, "failed to enable unaligned access\n");
 
-	of_node_put(args.np);
-
 	return ret;
 }
 
@@ -671,18 +661,13 @@ static int dra7xx_pcie_configure_two_lane(struct device *dev,
 	u32 mask;
 	u32 val;
 
-	pcie_syscon = syscon_regmap_lookup_by_phandle(np, "ti,syscon-lane-sel");
+	pcie_syscon = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-lane-sel",
+							   1, &pcie_reg);
 	if (IS_ERR(pcie_syscon)) {
 		dev_err(dev, "unable to get ti,syscon-lane-sel\n");
 		return -EINVAL;
 	}
 
-	if (of_property_read_u32_index(np, "ti,syscon-lane-sel", 1,
-				       &pcie_reg)) {
-		dev_err(dev, "couldn't get lane selection reg offset\n");
-		return -EINVAL;
-	}
-
 	mask = b1co_mode_sel_mask | PCIE_B0_B1_TSYNCEN;
 	val = PCIE_B1C0_MODE_SEL | PCIE_B0_B1_TSYNCEN;
 	regmap_update_bits(pcie_syscon, pcie_reg, mask, val);

-- 
2.43.0


