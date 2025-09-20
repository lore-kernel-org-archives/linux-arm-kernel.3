Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18376CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 09:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/xEwCQ2kLx4wO4jHEqwEMPS8Qvt2FpFOtZT1uSLzl+Q=; b=PNE+DGDD1+ViMe1IhztivXvZfE
	tpnpr5ueQzrkxQBYStU58eseS4/T5KM4bk82hUQTV303E2k67vkquVFFk+6O2p8LtkLvOcstWUspg
	8wx4hLu5gPUBDczdp4XEq6ePFuC8l1neACTjwm9SqFWJZ0gvnioJ4sAxyvvE5PJSJLv/jwbTnckxj
	6RrI6V0mBhbZWLEILsU6/TTBZVfEZj1ltJtqT/e/ej3aKlEdm1+jOeZZPR10YHYMp6Vv2NPzhcoxC
	lDWp3SSbwMi/1LY4BEwKktjISRFkh0jJELWQ68ZNonJy6gHhSwYr1Og61TNLF+m5taPvBLaEgAkAP
	AM+2q7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uztrQ-0000000573C-3bH3;
	Sat, 20 Sep 2025 09:26:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uztrN-00000005720-3mJB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 09:26:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so26084455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 02:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758360384; x=1758965184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/xEwCQ2kLx4wO4jHEqwEMPS8Qvt2FpFOtZT1uSLzl+Q=;
        b=j3G+JMdkwEvbdaTnvkLkl/iBQYZiZp3vDFb1VvgeZiZOykawQ3qAC6KJhPV6QDvdKu
         PXW4Nyqow+aQBI/i0vKfdYeMtas/j6quaROjVuuSSJg2YnVr0t6XDqFf0qiJ1BctSgRM
         ZVY2OXYQdEGANkp0LymK0Xt401cy4yvMUi1tnhCTekhdqBxS/OTa+tz2SHuwC3g6MjJV
         ldO9Y9+3pnhNh3laogLJ9rOq5k7b3uF7YyaRB1FOMQRmPXGWssI3zm6rMyzzFdsX6lw5
         S0Fr/hxtwE+KPNWgh1O6AagKzDajFR6kCUFkZSyLIyfgLKWRTQ3lKcclGswV63NEGdLE
         nlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758360384; x=1758965184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xEwCQ2kLx4wO4jHEqwEMPS8Qvt2FpFOtZT1uSLzl+Q=;
        b=Rh2tfakFFoCGAbXTW2qPid9OeVjjrGIEhk6p+gp1YIJizUJl2BP/0rdFZp8aD8VOH3
         76rZFLA0px0I6iMq8XOaTAoG1lZuTf9x+lGKXB+cfsZ1EwPqakh9FW1Cz5WUp5bp+GN+
         qPBFIkYX51t7Kt5+cPia82q6t3r/xF1AzMqR8gzhl7B+66e1BsunnF4tViMuv4Almp2c
         BlVrRPpb94oNA9/1Dopno4nz1OVzDES4Nk+RrlCjZ686MOZHWzmqIwDCBH0TDXrIiIf1
         uNfZZmhjuAN7nRojMTPOyo3a9gKFd0+JfL23AsNGLOBbuC96BcQ1jVXOz/OI3gAkno8s
         7Jww==
X-Forwarded-Encrypted: i=1; AJvYcCW+u9V9TRXS45Q8/r6u+xG7ALd6spIK0L15K2G6FezkIeWHszMkGijXm8GcI3ZHutPd6KVv5CqhlTNap+7h+pMd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9RQsvv9zLanmZYb9mh/HKBeECRH8rt8mT9F2W93ODYKU5D72n
	Nz5fkxRy1M5wPT9M0G3yyy8hTkmyCqXIHJouXZvwaU5WLnnDa+wHvPl0
X-Gm-Gg: ASbGncts7+nodC/nfWqMtNM+j1QAaEY1MULTDxmb90eH/Eeyz8vt2EknpBOcLtIfNEe
	H2vFqiE5nRiwJZEdJpE2fm0dUBEmBHuTvjLAe07h4otN5Ku/qhiAZsHRwuvfGv28Bj60wE2cPvN
	7acgxQkpGkxsD8VEUmZ+GRlZ6U/o88mSrqar8CmlxbCk7eKe1YDXtmra4TAp2EHchu0wqnab2aQ
	7kVy/uf/hF57dlZFzcpPHSlOrKudsbtd8j1v1/rssxXd5PMRyGCdvOt/AoP6vB7ZDfZ2NcCPHa4
	1NKbc3rui2rQKm2lb2QVnRBgKI55Yfd2bVKd3n/PztZV1U/nphk5PMdi/FPyh0MI7pbVqD2kDpl
	lejEU7Z1NrxMI9yGABEkZH4iVPi7feyXndTWQ1JVLMTvG/+wnDnDViyXPZnyTKuZvSOSpN8A=
X-Google-Smtp-Source: AGHT+IFxlAXSV4W5++7XWnPzZ12JWvBKJO7xkpt1cyOakCo8rv+0InqQQYz6OthfTBtMJczwkWlkVQ==
X-Received: by 2002:a05:600c:43c5:b0:45d:d295:fddc with SMTP id 5b1f17b1804b1-464f7027ee6mr62778095e9.4.1758360383862;
        Sat, 20 Sep 2025 02:26:23 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-467fc818e00sm73648535e9.0.2025.09.20.02.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 02:26:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: PCI: mediatek-gen3: Add support for Airoha AN7583
Date: Sat, 20 Sep 2025 11:25:34 +0200
Message-ID: <20250920092612.21464-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_022625_956417_EC71883B 
X-CRM114-Status: GOOD (  10.31  )
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

Introduce Airoha AN7583 SoC compatible in mediatek-gen3 PCIe controller
binding.

This differ from the Airoha EN7581 SoC by the fact that only one Gen3
PCIe controller is present on the SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 0278845701ce..3f556d1327a6 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -59,6 +59,7 @@ properties:
       - const: mediatek,mt8192-pcie
       - const: mediatek,mt8196-pcie
       - const: airoha,en7581-pcie
+      - const: airoha,an7583-pcie-gen3
 
   reg:
     maxItems: 1
@@ -298,6 +299,26 @@ allOf:
             - const: phy-lane1
             - const: phy-lane2
 
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-pcie-gen3
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          items:
+            - const: sys-ck
+
+        resets:
+          minItems: 1
+
+        reset-names:
+          items:
+            - const: phy-lane0
+
 unevaluatedProperties: false
 
 examples:
-- 
2.51.0


