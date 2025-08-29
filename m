Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03641CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1TbylZkgz8Mkd/dwqE0/Jwk1LwcVvsjwyovQ8CGLbA=; b=SKF5oIPFKXR7K05B0mb/vE3w6Z
	wluqpntXybSYMcsV+HkDVZUgM1ePQjQXLGM1VWI7oiTKM/rxUU5tu0nexhZv+3wACAgW0492njvRV
	nPnNI4Q5c/vYaoGYMSgeSgHpGC30/ON69I0YcKlbVhDdRoDIsdmqmLVqQNbKedod5A5WIqRLYOx7V
	GDHOHAz1XU+hFF4ucZ6zpGCMqWahamohTXYGrG2Zq6jsMkFOXjCXIqecR5B47Rb3D2gGt9Q0S6p7g
	PbeVwlNRrhWAxBMc4/8nEm7/qp7uXFse8+EoKFgWE3wrefaWMGhdeuLpg8LmsELCgYk5XIrMVHkHx
	i44aWtdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9lR-00000007AKs-3Gzw;
	Sat, 30 Aug 2025 00:48:17 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2Mj-00000006SiL-0lTU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:54:18 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-61cb9e039d9so4405083a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756486455; x=1757091255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1TbylZkgz8Mkd/dwqE0/Jwk1LwcVvsjwyovQ8CGLbA=;
        b=anMTReIRJJYn7liiip6r8w2oY+mJft4wh6CqH9zIM1Z6UcsVaw4q9AhTxgmlH6urPB
         l/FeIbEATYKChz0NKKifrfRMJ212e7ddp30UKR6B5dKBoU2xUAjHOnCyxiwHVc3Tf4c6
         zYt3tSOCf8ml3Jpw0bLMhRXLsIM1raqHNGQCNRs5dTRujBnb6yoi2FFBCe+WvIBlgxx4
         5vHL0agQDs6Y+nMH9wKF3JKuW8rEF9LrMmzngEKRbg4RXOsS9B1/jDVxSgsNvw003A+Y
         1IQ9kItzLtrn7ODEH2EmE6C1L8zYIz8967MPYIkCR6cY00GqPGv0LyTHAJ/M+S7/T37Q
         itdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756486455; x=1757091255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1TbylZkgz8Mkd/dwqE0/Jwk1LwcVvsjwyovQ8CGLbA=;
        b=rzz0yOa3zO7RArpAK2OLymWB4GLjqDMykCv9Fmw5NiNdWWYVHfjVnv5idf8xiaamxE
         EBVe4pFRGUmoMhS84BdcKjjZpn+OKhBWDNpYDNfrW1rsFdWYmcw19CT22ofkvjJXHdRD
         VJsRMuzVxp/XSvXp732sTCi26g5mvHg6EFYRlOn76xoGpoCdZYBwOM4Wht9oHxfqrpqk
         0qRmq7GLJq+gTjbJPtFvrli3Q38PAPHJA42749Ootu6Fq+5MCyDAiNNnsT7qS47zPkJ2
         kbh25eC+C5xCteSxpD90fL2/fzupXcZo8SSHZsZDZMaExrw+RovekGCRaMjVqfp1+Xvb
         YxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAfBP/rpzhr0CxP3RDLPKY5JvfMYv5648bRg9eMG4jpLz2KvVPbmbOVgzVxn3Gy5G+sX8nA7Sx2t6VuiUrOrbJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx4jPzVRXzA4Te5/6yGCOr47FXD9njP2E0VkvN59mL5GLKmNA9
	IClbiOoCIp62O6oO3XBD1cDXl7plBm/gNcc03vFl2VCeBwymozMhqr8u
X-Gm-Gg: ASbGncsp86dpHQ0hUifBpfTKHjpI1tVdv4viginet7LAUnOz+RO2AoqEgVkMvSBE6UR
	BEXIMsyYRdtYXDQAWP6X+Gq1HE2tNRpJxlS4LIJYuSCLaryaEVR4H3cBZXylzkBiZorOJ1m4bmH
	7pFK2jD32ySV9Y4Al5/fZfAoemMgbjRlZ375Q6vKw0NNQxycyvbHOzYQdSapRrdV8d6NuBkyaNG
	tt9CTlgrGwcwe9yzRC4oRZsisABAzwCrt/rlC/RrV1OE5Pl0qhD0p67IU+B2VG/n0lpoZRfYRmC
	6Cix/yhjaMCP0ik+A/7z+WFho72Ezxnq31h2yn9WoCoxJranz9F7/+2qHANlFeGRryWC8EHcW53
	gxGPa6RAblNQxfj+VUHvw2rGHwOrrx0OF7TYgIor1Rn2ireNtiP/OtFbQ2RXiiWWRivhjxq75P+
	d4VywjOA==
X-Google-Smtp-Source: AGHT+IFy0TAMi3Q+ZqyFrZeouS3CvWNb30h+N5bukCpFIMZHGFkaOOWeYA1wUKsje2e0ELbY3m2LzQ==
X-Received: by 2002:a05:6402:5c8:b0:615:957f:416b with SMTP id 4fb4d7f45d1cf-61c1b3b93e2mr24287623a12.6.1756486455455;
        Fri, 29 Aug 2025 09:54:15 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7848sm2130350a12.2.2025.08.29.09.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 09:54:15 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
Date: Fri, 29 Aug 2025 18:53:17 +0200
Message-ID: <20250829165327.20007-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250829165327.20007-1-stefano.radaelli21@gmail.com>
References: <20250829165327.20007-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_095417_219325_759B5418 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

Add devicetree bindings for Variscite VAR-SOM-AM62P System on Module
and its carrier boards.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - Added Acked-by
v3:
 - Change compatible string to match existing mainline format
v2:
 - Add symphony carrier board compatible

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index e80c653fa438..1cdb6464e920 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -106,6 +106,12 @@ properties:
           - const: toradex,verdin-am62p          # Verdin AM62P Module
           - const: ti,am62p5
 
+      - description: K3 AM62P5 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,var-som-am62p-symphony
+          - const: variscite,var-som-am62p
+          - const: ti,am62p5
+
       - description: K3 AM642 SoC
         items:
           - enum:
-- 
2.43.0


