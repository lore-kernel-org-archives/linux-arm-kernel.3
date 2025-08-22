Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E99DCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AtTpKVUrrZWtxsaE3XNcl8fBkP2fQZlgHoCoWUccQ8U=; b=CaK+LYwQl59AFoXHOblA46uN4s
	sDgktvPsQCTIcKTEI8KGBUdiHZON3sChjEmQsOaDlHy/1V/vEqupBiTdDPdvhd+YlbTAFs4NloloY
	hVLsNa2ptuMdviGGCgu7vppKG9dwrWGixeAlFowrNw0eX0jJZ36P4yCeNxhnmB11mm/5++WfAOOkw
	xNel862SzMT0rvjQiSNiKHEv1qbDcCQPYd9yuDumScXl80If7/yGVbT3e3fYmvoUBv6Jz+04psCUS
	as2fPd3W+64QTfbvQENmzI7p1dCt/tHNOXH5I1Rqh61+PM0C88sSLvX5mW9ELfmG+YTacPtGCN0XU
	YzTQ8HFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqN-000000045G5-0dBo;
	Sat, 23 Aug 2025 06:35:15 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRuX-00000002dph-2SN0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:34:30 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6188b668b52so312282a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869668; x=1756474468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AtTpKVUrrZWtxsaE3XNcl8fBkP2fQZlgHoCoWUccQ8U=;
        b=kxgUVD/39gAyw+eLPteGozgWZhQ0akkVRJlTOK6tPA3NY7cZfh9wql2fFpZYSFzmhQ
         Y4t3gISSp8oi/TQRHfMWcRnZeExXJ/OkfFRP5FcafYYefKf2+bLGDU6zFA1eWXoobpoK
         8JvYdoSw70w3zCiGDzLT661b2sU+QlBPWbbuTqfxM+LSbTkB6gObvnVE8pJ3JYr7powV
         gsYfuRJr90tbL3jvXfNhr2X0CRMuOP57VFkqaClqzV+kBRNFCNZNxsNO6aK0sUHW5dZK
         MMGaPlALIUbjOkRiF7EFuD3aqcRuVrVKFq0wBG7W2NlMJfj+HPDGf8W9jmVBfIKxLwkt
         6Vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869668; x=1756474468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AtTpKVUrrZWtxsaE3XNcl8fBkP2fQZlgHoCoWUccQ8U=;
        b=OIQzn8pQtN6LmnkzgRe8OFpMnJTtxH+fBIgsZal6FeMuUDe4zSGFLEDMrLyH/MpuvZ
         MUcIV+58r1/H0AdJT3FMRjVC4eGsNYtCG4PUgctzb0e54QuhZZxshnTFQVcTVDY2btKY
         C1cDEbUJaOWycylol6t3w2cjBun301T10werSUcnvkDRpoXL9J2f/ug9cx06IeFTyUvz
         iNHxUPIbjtchZexOGZQEQyceMapSKajdhfT79k4aRAKSGq0GBLH49BmtH10hML3wze7+
         ZqQPB7ZVOXeEeRLwFhGSTk6zbkozVqJlGEwI5EWP0/1Hgfipx9Kzm1rfwigqTatORvX0
         ZSQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHQ4t4dFjDl1mCnwznlYtB4lYWzgMGN+a6i1a0ydzSxhxYir7x4B2FRE/cfvQTDfqEWavLlZ2YEcltLjkTxb2R@lists.infradead.org
X-Gm-Message-State: AOJu0YyEUKo9iFeI8vbSaz2o3fyGv0bgzKhf9HIOA6BjFIj8wYhjKsOo
	dPXuxPlicLkrFt0sssbssDaGbZXwKm8M3VbQDCELGBMhGjDC8KKTl8Pk74BR/KnHHr0=
X-Gm-Gg: ASbGnctDIz13IkTBHNRpgVxd2XBpigWaCtgUxzCKvWWcl7OeLJh8l4bBuPbGJhBJDYR
	ng5/KriJstHRpo5XZmEsBnB0Ux+Rrrt8Ttu6lbSRT5x1wWN/PRp+UDrUo2+XVskgHLHpGhVKWag
	76hLUGCrVTM9Ttwm8HyGQzSqIX7dpiYMv84tF4bNmEo0RxVm87Oeo/ZUenrm2vDTBjH++HSUqMx
	plf3iUV+kFIfQSAbUAMwCDo6UJi2CM6gKSH20+wER+wL9a7YCS0MQkrLYm90Gkq9agtafhvKjMh
	G5X5xs7UhhLlnV8Unj6vKWhkIYiuswRFwaCnVK8wb2/Qf6d6go6IF4Ya0Gc97vcsWzV2F1TEVff
	7q//gakXGrbZiObD0uZBJuhRWb+8aUhVHyQ==
X-Google-Smtp-Source: AGHT+IHyPW5NgrCRagEyLACFGuB7+uhylut2VWju0IRcaH4EtwnYWwcFk/zuHnAseVuD7vXuzF2thg==
X-Received: by 2002:a17:907:94c9:b0:ad8:8c0c:bb3d with SMTP id a640c23a62f3a-afe28f08b6cmr138535066b.3.1755869668029;
        Fri, 22 Aug 2025 06:34:28 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded3020cbsm610986766b.31.2025.08.22.06.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:34:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Antoine Tenart <atenart@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: amazon: alpine-v2: Add default GIC address cells
Date: Fri, 22 Aug 2025 15:34:24 +0200
Message-ID: <20250822133423.312621-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=tyU5PFf0gSlmc6T4OX+FawiNzX4PdYFtA22/rM0+roc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHHfELWc05SkwOsVBGBcKQXp6Y93jBQ2qJ97g
 Q0o5Iy2rQiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhx3wAKCRDBN2bmhouD
 1xt/EACXLCSkFmZebqljwxXYnk2YlY9ntN9zgdTE2izATGlbDmWlBaPPVTHzdI/JiX3dkM2Bol4
 AfyDL/lYvqflqBto5GLqCGhTNbJ7eKk7b7bkXxp5S7kI8XShQFk7CVdOcQf2byUtHo0yr8sFYMb
 1iUCrT5lVZud7qF/WAVN3/g5m21HJ78wkfgi80jFISnB5CyLLUmzonnsfgER1lqBaDHYEUMjIxk
 vFlh0sMk/3pZdg0eegriBDktPyypCW7qDO9JmD7Pyc2TvoTNm9s+3r7jp3XyX3XX1EGBz1oynxo
 3SHZYGnSsX3uQKhSGhxECeASapKr88yTK7mOFQS9sORg2nMnH8bu0bntEBtKcN41T950EbD7gry
 eHkGl+/T2PEaFq144GyWp07tezX/l+GLSqLK+xD+JdfUUiyMAeaLsxcASGvdoVUzl6mBAm5l+7s
 kxtz+mAhAFReeFT1DpelH1SRMqSHZ6GXT3TBlnCh/MliW0Z0ovfIcI8mK3f6YkVxaIYwN7w2JBN
 jkLIchwiO4zGkNpkGa7xQsLV1230UNeK5wjZzkq8MPDoZ/UnqKelPjCWvzfYqFJ6BsXlwQcAqd4
 UhAAvgG1uWhrDMSqKf+09BG/zmT6omfmddRIEFpqLCrokU0IDEtVQuA13Kr07cYnAWmsYbuhP1E 8v9LSY0erntWa9A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063429_620677_B9AD2283 
X-CRM114-Status: GOOD (  11.20  )
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

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  alpine-v2.dtsi:138.4-139.33: Warning (interrupt_map): /soc/pci@fbc00000:interrupt-map:
    Missing property '#address-cells' in node /soc/interrupt-controller@f0200000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amazon/alpine-v2.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amazon/alpine-v2.dtsi b/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
index 5a72f0b64247..f49209fddbbb 100644
--- a/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
+++ b/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
@@ -123,6 +123,7 @@ gic: interrupt-controller@f0200000 {
 			      <0x0 0xf0120000 0x0 0x2000>;	/* GICH */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 		};
 
-- 
2.48.1


