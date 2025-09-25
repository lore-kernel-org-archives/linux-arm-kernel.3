Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D51DCAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aJqNYQ4cdfTFLv2z2ldssPg3Z08F+8b/OmsBnqjGcYc=; b=IVmNvScGezCzSU/j3MIkowpgbF
	2TO6m/h3Hz+HwI5hXS4hmss5qQkFJWapo/5DgbqYig3va7mYtWQQGWJUgXQirvQIHR//5YSNER1TU
	SiR7gk2f74bk3GgwOWqPhO59jlYXRuPcOYq30ysFXpbCv3axdRv6tZH6NTHGDhfgkrvwLXWB+i9a5
	0v2E+ujyqbuqTiN+/t8fUS0sFIcO5fhRjkdbW6ynssCuEl4j1W9jadrRvPEL5nM2EVb2tpkyJwKKJ
	bcVLgL4zv0eW3j+RuEqOx8ULwQIWPEYfEo1LEChQL5feCDNM8bxU1B0QC9iMr7YY3sbP+yRMutHzl
	if8GiR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oHy-0000000ArRw-2wMa;
	Thu, 25 Sep 2025 15:53:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oHw-0000000ArPi-2r44
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:53:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so9395535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 08:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758815622; x=1759420422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJqNYQ4cdfTFLv2z2ldssPg3Z08F+8b/OmsBnqjGcYc=;
        b=Wf4PnoSnQDwEgnxwg3rvqQT8yVewrOdUiQ/U421iT6f0U3tO84eWZAsNamVMahAUeX
         ElzRRSi0/RdyGhKp30pipfj+iJ3TKo2viocG3fvhVWCpGX+nUY8xKkr6SzqKyVlC+4PD
         diWg8knLUqZg5A7wdiM2ugb7DfT5oSpDSVmhl/lKYM9UPbxSE3f/Dxj1hIh6t9k6O/89
         /8KbmHPjFONtrhwcwxteFEd3A2oUoHwJ1XII5g4foJLhXUMIyCKh49fUhyBs9a9ZOXAv
         4h1h9YT2BtRj3HrJF9noGfIANn2irUv6oGbic3KNacSsfXpw29Sek4zyprePhQZvMw3z
         TDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758815622; x=1759420422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJqNYQ4cdfTFLv2z2ldssPg3Z08F+8b/OmsBnqjGcYc=;
        b=lJ0CMQvVu9Dbl0Fx/SMMw+lWK/NPbmcoYkUyzEe1zLtoEXaupvdbtaykuO7glbC113
         HqfJXfIK8XBw2dh7JqdnDL91veptRDNVvgNeV/3QSZMxfCdYvYYwsqp9plX5Lx4ew/ux
         yDPt07hVHkODKDmV9bHNoeCVRgavvKPrOFeR5fgwTZoh8hjnLgeVxDG82kyPnJYLxEJs
         rzjJ0Tj+Tv/3fDfSlMJJu5wH79wDg645T8F61v6kd3RyTo4nfpA1p0DvbTJT+eOY0hq+
         d1afxwC2ldZnmf5Zh9nQgItkiswTX1+lFmjUVn+XR0wXTaueOP6jij4tWS+gTG1Qtj5c
         eYCg==
X-Forwarded-Encrypted: i=1; AJvYcCUs0931V3ClvfxsI/MgCDuB7t7dY98bHOfqJxndfP2pmyNgWu1ztL2x+qVmVnAKcF3sHbNWXsQCGEdLtTtnNInI@lists.infradead.org
X-Gm-Message-State: AOJu0YyGlHES90dnesDX7t1NyNbx0c5zRK/E6MqwpkZsWX0SI8X3avRj
	SCUFDcKT4YVC1f2y9HwHGwdFxrTDYXeH+5XBBgQ/F7Yc35nAGdXumAT7
X-Gm-Gg: ASbGncu0hjo0SFCx92kF57VfwL8miURX6ujAQ+XU15wNhGKtm2W6hJjNM6cpM9gzjeR
	bUaD9BFPgYmqHty+RhgekveArBwxMeqXStWL8A6xGm1qj/fILruaKMCXOnUlgeGuVPh2G5sOY7/
	BA8bXNqAycdq8LRS1pAH5+CRgowXHaTtBIoGW9tOkGKeTaKNZC8DbCQJ2SFDHbKuS3aKR9qAN4+
	THmUKfNrDgt2YcDCAPbtrQfQ7hNM5Ri7jL2NNTEk0RDmXHy9+XRX3uNqS2gjVG7iRp5z3nNy7e0
	kKG6GlEwMaCFxW+F0kRwr2lXAG9v1z8iXpn2FdETeT3GPtNuqOJKQg+eJhj/qDIYMXzo/baWf9b
	TLIXFNJAdKgGUleUd+lQMKbu2nee1adu/AUI561DUvy671lP2K356B8vE7K6SBGqqq5lvYFUVza
	5K1TSdaA==
X-Google-Smtp-Source: AGHT+IFdx6Jo6h2Zlp0z9KNqZKsNTsBYY7KcgSjHFZWdKQaN+BPd2cWlPTLOF0WlCzxaWRiRR5GgVg==
X-Received: by 2002:a05:600c:8b16:b0:45f:2bc1:22d0 with SMTP id 5b1f17b1804b1-46e32aff787mr40556945e9.33.1758815622333;
        Thu, 25 Sep 2025 08:53:42 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac5basm98449995e9.7.2025.09.25.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:53:41 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add support for Airoha AN7583
Date: Thu, 25 Sep 2025 17:53:08 +0200
Message-ID: <20250925155330.6779-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_085344_730592_44D8591A 
X-CRM114-Status: GOOD (  10.98  )
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

The compatible have -gen3 tag as the Airoha AN7583 SoC have both GEN2
and GEN3 PCIe controller and it's required to differentiate them as
different schema are required for the 2 PCIe Controller variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes v3:
- Add review tag
- Add comments for compatible inconsistency
Changes v2:
- Fix alphabetical order

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 0278845701ce..1ca9594a9739 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -58,6 +58,7 @@ properties:
           - const: mediatek,mt8196-pcie
       - const: mediatek,mt8192-pcie
       - const: mediatek,mt8196-pcie
+      - const: airoha,an7583-pcie-gen3
       - const: airoha,en7581-pcie
 
   reg:
@@ -276,6 +277,26 @@ allOf:
 
         mediatek,pbus-csr: false
 
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
   - if:
       properties:
         compatible:
-- 
2.51.0


