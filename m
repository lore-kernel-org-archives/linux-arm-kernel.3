Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E45CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 19:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iIzcezubwlq0RFm/fy2Wz7m1elEGd+5wrncON0Sn1iM=; b=nYd0Rknbouuy+0mkmKRIk8yqeY
	STVt31I7ZZO0r6E/qwuo8r9WaeQigLHE4Cr/j+liHv+mQW6RQ48n7J25bpjKY/bb/yjDbRwYwrOvE
	NWJfTlOpq70S94Ctu3rOE7wXexwQv2acOVecAkqT3L5qNp045B0vdiA37yoo+HUOhwfF/FPJPM3tv
	iZAA7SNvQh1E/4voW6AVqGJ3GqY3aoQZ5W5XNjLlNKnFY0BCMyx+1oxV619wS9Dbix+1Jxs8fzniv
	pqgx6VfvQbs2fMgkh3iol34tW+EbsGZBG59gHdaucfJdB7Mk+HYdukVnqSK2L17558C/ZzZkX/30r
	gQDkzSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18MT-0000000EcnM-1WgO;
	Tue, 23 Sep 2025 19:07:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18MS-0000000Ecmb-37Rf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Sep 2025 19:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=iIzcezubwlq0RFm/fy2Wz7m1elEGd+5wrncON0Sn1iM=; b=J/d+5Wh13aBUVQn6VbIxktkmQv
	wwW3mEKCA2yPTGb2aNuwDSVCV8x2CdHpgdZWhWxIcYaYctLH8n3qVZxa5P7Zt6C5HyzPkCAD0nvGl
	oqxbBOOOUm+7Ta8wh4euKswGWbTBlVVq5lP+Z0gNlcvPAFxIpQi5EvQoSdTPuR75aSPDk3eKA1IUZ
	ChTiy8zXQWCAiOk9/IyCVT7dVYv+gIq74CJOedZxzMsSswqtoZRQ39bbJw3+JAk2/QXWeHOopCr8V
	F88RDtCIB8FgpDhTKIBpKrrVXmtF9qnrPeYXEalmrfOURhwDaUmVN0NhGHDH4E4K+XdImUPuSlk69
	I1pdC0Rg==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18MD-00000008Y6T-1lId
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 19:07:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso4938200f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 12:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654439; x=1759259239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIzcezubwlq0RFm/fy2Wz7m1elEGd+5wrncON0Sn1iM=;
        b=Ei7TL0hU8gGTpaSknkExj4Gf+q9qULvEUKOrTeGbOoRHesNk9LS6icbPA85HQ5pmA9
         63L6aSs92htiImLMGi0Imw2wFFKuRrGPy9+Jjo9DqIb4YR+bw2c5ozUiSYGZPyg7mkyM
         it6zp8ha14raPxKBQl+Ntp7tIab2xXYANeE79zdm03PRXC+S49PfSg/LVM339YVhCcZB
         7yG9PavewNw0NSqHkj4rkgGQben1/fU22jaIpH7N0zMxx1DToCLuEppBeOZbalKk1IdO
         PB9J4galR7sA1+H4KVdCTUwkxYpU2MaLhjznRqy6DvtVnTUWaYhCxw7ml7nC8XehspYy
         Xb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654439; x=1759259239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIzcezubwlq0RFm/fy2Wz7m1elEGd+5wrncON0Sn1iM=;
        b=bUK3q0yhBIEZhpw+63JMurqhfvxpjwMs4e3SIHoQKd4wSnyxuN5JcYRCoQoXEmdcK0
         6MoKaYsK+upYqEKDuUctywfEbhHjKY9CCVaHctNR7+FYGiBsJwkiihW+JtcAjkVJvSlU
         B5mFNJCA1M63UgCiudk5ZtzMlCKBmj8s6VQY4Q6hbsaDe8J9sYpco+ro7gOrQZ/DXSoM
         0GpoJlghURYU+qpwFAeNG7eQn1ucH+3LOU1t4f8Ns8ByN3qtUDIKX+wrRxErrj9A5QLd
         PFgvpkHtp/LFf789V/xEm9pxyAD+clA0WJfK9bV9Xf9KG+umHvcMq5e51qIqKfWxmdpt
         4mAA==
X-Forwarded-Encrypted: i=1; AJvYcCUssmwcTHRCaEHmPBHYpZzg6yAi0whU54/usLxKcZjexyKq7z2/vvcM/AkLrYCGLuhP/BemXnYsKew3AY4rIjQA@lists.infradead.org
X-Gm-Message-State: AOJu0Yznduix3JHouNUhQmp2glmP4pXJr2wr3kLlUshJS7Lo34JdPonL
	TGC+Fpqgc+6JUTXjC2VLKmTm8Ti1/Yq9aK0Y+FLj+443sBgToNPSPnK3
X-Gm-Gg: ASbGnctQoOWbtIxR4xtwrBu3xXu4buvsWl4P1Hq8Ymg8NU+i6ArQ2A5snTjbN6OsU8G
	T7R/VorF0eBqa4Z4PmKTifvaCY05CRSUrfczvvu12xXL2iBLt8VUahy2Ml6xeLK1Im6ViG2hPpk
	EamPsB03VK6MHHAjD9LWMlj1YUV5zARwkHuQZ39ggZx6RQts7Pmh9fjZ+TkzSFD/yX8AGIDjYsD
	rCsKAdUXVgtYJQbFRM0pABDGKJN0ZJv3yVuJuFi1edLpp5KKL126917qOamIMWVauqjMWymX1jO
	G0rILlK0gjloC8X5K6L3y1w6hcLPt1I1+ULIJ2bG5nH2bXkPVBWrlz+FFQH33jR5JgBvY7c13WS
	25E8NreKR3n7dGTnH9BOSkS3O2oX52hl5fZ4R8v/zfX1SpPkZdnK3kV4MtU6mq3SE0z3pQQw=
X-Google-Smtp-Source: AGHT+IFMC5WZipXFwAc0jOhdCUt9YzXLNEh2M6BwA3JZ+CheIOjLK/BQJ1BA+7EBMR0NC+aWeWWvaA==
X-Received: by 2002:a5d:588e:0:b0:3fb:7afc:c17 with SMTP id ffacd0b85a97d-405c7c5e8d2mr3394096f8f.28.1758654438709;
        Tue, 23 Sep 2025 12:07:18 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-464f0d8a2bfsm265240915e9.2.2025.09.23.12.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:07:18 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: Add support for Airoha AN7583
Date: Tue, 23 Sep 2025 21:06:59 +0200
Message-ID: <20250923190711.23304-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_200721_747700_40A6E431 
X-CRM114-Status: GOOD (  10.96  )
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


