Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CC6CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 07:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pLhC4lsKdeJ9/A2G31nCU/i9ls1OYFW3dx0kccZaDUU=; b=SCCZkuXulDyvuwm42hb1/tAYFM
	SIQrQMIBgEO6S1DlvxwEQHFtYhN4l3WztHof8HbCUgof9QBPQZ9yb6z0AIdyh5PnupDTPV/NLP4dh
	0z31zfvStPJCIcqOU75BJKGw8XgXlW65PCMf6W1+3+29f3Ucr3Sa3gSx5q/yOvHuipXZUIefd726q
	I1GqioOb26W3Ah0rap/Hm1usYnFHMc8qUYfmUf2YJVyHtULzNZE3+O3IpekFE0pdsWAl8dPsaDmyJ
	aT4h2vQKSGY2Tp/du6tSuNFAybqapbtzs2X1Iq9mhkkrtRZEa8GMlCb+YhqEwlVMbfbDYusnZPXE3
	2yz33U3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoziq-0000000G6Yy-0V8b;
	Thu, 21 Aug 2025 07:28:32 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozGM-0000000G1n6-3pJl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:59:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb7a96309so7294166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 23:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755759545; x=1756364345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLhC4lsKdeJ9/A2G31nCU/i9ls1OYFW3dx0kccZaDUU=;
        b=lTG5jLyJcZaKkJGNrE1OHMchDQ7c2+kHduIbfTbPHlWL8bANMkPj1ah+/mZg3Axu6C
         CpOxkn+1n9uybsKwEMmIedLPBxtSWZ5UT6zLw46OekN3ZkDTNkHg8E6al/pKxyfpCniN
         5nC+y8KPmV3jGt+Smm1QH45iJ4LLgCLH4XmAxKiyG7al22Guq4TSuL7NAzRfOkOzFlb0
         WFVETb8cFDtObv0MngnVzxShEuPQiwBDlP5MDLuRPDckLhldHbEPVeJm2+aMDETDUwJQ
         OkdcZpkqU07kz/FmlbkxxbO+mUpnHl0yqFQHtqfXD+YnnCogON81/te1fWns6Wu/Keve
         GKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759545; x=1756364345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLhC4lsKdeJ9/A2G31nCU/i9ls1OYFW3dx0kccZaDUU=;
        b=C5r/Fxn2rG0KUaBF2sGPjLPebmNHh/nuyUkafwCHy9G38/qYfxM99S9VB69dApLgEx
         TZfE7eE0BV+vgd2JCnxY3p/CHR+1Lr+k/sypPh4jLFGlX8w57fX7/68ndDt2Ju8LWjNR
         5KR+TiIxUMsD6kpXYYYRN2ujF0Xxlt8I55GrxhnRLmST69YKeCswyhxbopPKyF1oSi/1
         sgckM/fF0Lsq/yoWO/ovXi5gR5TVXWvPDjQkGAkUHPlz5MOTDkQ7wXtjVez8/x8is/Ba
         YIo8HzJp6Zvct8KshSsOzet1UhVtjHyc1lTPu/HTYJeCK/iKBA59kmdY0zGRl+EtKTYq
         tm/g==
X-Forwarded-Encrypted: i=1; AJvYcCVdphMJvllpOpxmpX+nwxh1SSRb4j1/Fl+ufRMqezwZ+EPDg/prWc7vu9nUAqEluMHgFbIa6HMW7bdo5zsl31mc@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl0g3Qnt1ITl/aK015fsk6DHU/VC6l+mC+r/9GBYNH2R9xge1f
	dHB9uEzmDwiuZlAk0HtdVXOH8nhPMnNdBIc9TBbabRE4qTQBZKrgf8DkGWbUXf1Qebg=
X-Gm-Gg: ASbGncskhJYqGjraTHdh0FD9toFfB16c1KPRXMW0f71fBHXhBn5DLGax1ZlFvlAVEfQ
	VCic4vZ7CuzyqEZMGN13lzhWSP3oxCCA8twYb41cubi3xFPs17YRsjvqSFUcw8BQ9bRhfSO9X3M
	dxHh2itBtp8DGMxVMqRmG3csySvrvt/+nPo8al4tZqMBgmzmo+DZkuBReRTY1EP+EiK4kjVMElT
	tcFqgmbKLLAsO1n4xB8c3tNpzbLnYG+9l4aZYJcVBhle7CSzw0n/gd/pOISb3tqYLGFTDQhOetN
	sibCOaW7vyoKaj0sQeSV9pkwM0bkzIV+ebH0gkbkUbyE7G1cUsq7tgDyFxLQsQLSOdCLhegeS+1
	3tTl5d+bqEFlvJEGNfm3jYj2fpGxcdtgyEw==
X-Google-Smtp-Source: AGHT+IEuVTZYnamN/Xowwi1nRdH6LMjKeL4XdJAvBXyBCXh3wYl1BQwHweSgtnWHDmWjFNyCCYNcGw==
X-Received: by 2002:a17:907:2d90:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-afe07e9d221mr56729866b.9.1755759545251;
        Wed, 20 Aug 2025 23:59:05 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf0ba2a42sm296119266b.49.2025.08.20.23.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:59:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] media: dt-bindings: mediatek: Constrain iommus
Date: Thu, 21 Aug 2025 08:59:01 +0200
Message-ID: <20250821065900.17430-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3795; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=noJnXR5fz5uvdCvAkcNEa1jNmbr6rkH0YiAY8IYmjQg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopsO0jo7CwTeUi/nTEXn6Hl/cd661HvDUBl1G1
 CoaNqlc6G2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbDtAAKCRDBN2bmhouD
 13pQD/9vTqb+ZSb40TqgV9s9GSHbKX+jREpUaz1Lbl/H9x1SCzuYcFTdKLgx0SBdIv/3/DnkpJq
 vo4NhdsbhEwABDRNfTFkidTninZ4+sOOW9IBkJcd81ceHIlMX/+8FhLS+PaWcfQMGzjmOWO2LeM
 hl1knU+od7Z5A6vy6xOrsQ+UIqs3NPsxc7KkHDjxYdc5HynoLR5dP02syrmBRRvX7A19iy+9RnS
 ZeW4b4suXJhVRt6Bp+OT3EGGuQxXuJ/lmlt5AX+5b/lYeUkw1+WQSRJDDEpl/7zgoQODT35oveh
 kmYdjWLaxjh6T99vUluCdHMm20oVUoiF1ESlZ+juv+2wkQ83KrC7H6V4mh24OywQu+omV6FXXgS
 UkP1ZpMX318tChOvSCx+Flh5W66b+1NAfDyq4eFJzqJsgd8BUj4HP7AXPZtEYZWUB+TlxW58LVY
 AUqfnNxQKwMp4in3IYO2O0a7/ybRfGUOBxTzYITO4PWbHZq3ofmPG1GG8qayMt9OFJbDjBP/gUb
 IxShcYENueZ0YrKLb82fSGXqRGhcfnFNr8AB8APcAIjlUg40iWE9ySR+DnZagKj74puDbphzG0Q
 iUyzR25u2kDVdGOnM5FcwTuUYBApUdObGTvJlNtxmoBzWfuZ6LQyU4DO3bPoiltiVSoKKt3AQlG vlGi4hhxJqNiBxQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_235906_967914_8B18B05E 
X-CRM114-Status: GOOD (  11.67  )
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

Lists should have fixed constraints, because binding must be specific in
respect to hardware.  Add missing constraints to number of iommus in
Mediatek media devices and remove completely redundant and obvious
description.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Ack
2. Mention dropping description
---
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml           | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 4 +---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 4 +---
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index bacdfe7d08a6..ac0d924a451b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -45,9 +45,8 @@ properties:
       - description: OVL-2L Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 4f110635afb6..c0fd0a91c4d8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -65,9 +65,8 @@ properties:
       - description: OVL Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 878f676b581f..7e5234def39a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -64,9 +64,7 @@ properties:
       - description: RDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,rdma-fifo-size:
     description:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index a3a2b71a4523..276868c0fde7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -43,9 +43,7 @@ properties:
       - description: WDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
-- 
2.48.1


