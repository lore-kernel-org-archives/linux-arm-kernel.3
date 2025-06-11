Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3DEC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNzuAa/Uazdw3p5L2VOhfCBO9w/r53QUlAR5HnqCwzk=; b=NYl97MHW4gt4JNull9cX2yz9ZU
	flK8e1pf6LmX4pGoNBL6mHMRs+BM37eIfgmWqTgrUuL5nWW5pmFDCpsLOFHO96iNVlxz+i3Wct7pu
	UF2DsSMyOrxz7/ELWKvG6yO05LMrSjaTUarwQd1PYNKHaB1ZBGn0YPVqtRPFulvnY62+rDgkB/Z6x
	FrQ5ZMFVY+3IHg6CRUdYmiIPbeAQZnzQ5vWaUfsZItK5LH8oIPzekRL3M2Im706vJyweOCvf7zQ/+
	e4jNe2Mp7icm1lXketDnQePBoKKuMkRVc3BHz15FQFqWVrMQ9uIvZWUXWg4XC1kByUkGUVnM3JswZ
	rLdEQb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGpg-00000009Gm0-2HNV;
	Wed, 11 Jun 2025 08:29:16 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGSc-00000009DE6-0I5g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 08:05:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-234bfe37cccso77385615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629125; x=1750233925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNzuAa/Uazdw3p5L2VOhfCBO9w/r53QUlAR5HnqCwzk=;
        b=X49UxfsAstpRBfffvxd3EkH3OB/eGq09fGC8zptmX73XDZ5HemgiPCTqPzDarACQBS
         /rzEi1Icj3FQZEeq+E6D548hvlplbqIqu1gxnJZv5frCLAeJ3VgL5/Gz6i8NNDmWSRCm
         OyWmgq61d3q6e1esNbnVrg1VLaLQuAgkFMYg9goRSwsgdo9ZNnt9ZoPFP0KSgezJn6KP
         izpy1Y1SgG0JbFMiycPn1/UR4b60K28B8NvXL2or2laTY7iyCAITeqkOHGw6kU/3CAX7
         Vh3rHpiFOfLWf10NC0Lamf1zvWvzAMUAavFGLN30St5Hz0IzAEqVI5BS4IX8zSkgvsre
         wbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629125; x=1750233925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNzuAa/Uazdw3p5L2VOhfCBO9w/r53QUlAR5HnqCwzk=;
        b=Fx+pJG5uD9pV/CVvWZvSBjVKB0RCS6HgSoXmzAn3AuFqf+/9mZNAR44tyevO5M7N16
         WJtQai1Kc/FjITGpxyhzZnZvpXpvBEtmwDaMP6zEIf5hpZc7B+gdIeNNrssLYjk3zXQU
         tJwSkW6ZfiPsiWy2kX6JSUmDTTZ2kdHY2v/7la3RuN06lNX9gzCRtWvAQyMk/05jgia/
         Zzb5vEm9mrWqEcrvu6tihnvMmVHnfXRYeS2EIsZgzTPqMB+ZV4c7DYbWhC6QWpx4Vyb2
         KIwT5Old0gEOYNwdLHAmhEnfwe5J6sAPoIZQzmenvq8/5PrEh+tRcixymKaoY0VwGMVY
         tX2A==
X-Forwarded-Encrypted: i=1; AJvYcCXi8T6SdVoicNGDO26Qjbaare5ROaJX51LTz/nfi0L7z/CMlsZKZpEduRCUapVG/d0LrKS+qMUtDFuaA00uebY5@lists.infradead.org
X-Gm-Message-State: AOJu0YyCVL8e2z3XfqVvWrrHzXbg/bTXKltVr2iIc5xCN7LaPB2kVb9m
	XL3bpebqbZ6xrGfKPAycrqjxei/DWnKxwY9BvCmJ9f2X6uAwGLhJWvt5KLCaVw==
X-Gm-Gg: ASbGncumlv0/7Mvbpx3YXGy908U3ikyDbHYNhSMer4LO9sp2r8wwG6QbgRCqWRdyZ2R
	NT9O3ELE/bEKiCNBq4PuUV7NMWPX4bsmko2RBb064RhcwkjFc5YVZAb0X4ySTRQjy360QJbvtYg
	OzIsFl8TT+zr5GgsXBqjgxR1ao0TKltyx9xeqEUZeILRsb7Kqamoi29bNlFNq2VnbuuLcmaPvkD
	TftT8lhb1j2qMvsKk2enV3m718itpkvooorTD63rpft1ih6x7M9k52EFw0m4K6G5k2GltlmRXsg
	kn72QuInd2lOnExiM7Xl1pyqhxOFOpRrdaIgmGaL49cVqy2KkIgAUpgJIrLtSReNva03WhX8zif
	iEEKiqvZOLF1ZMV5LEJW24OntfUjU7IlUew74/Q8RqKYs8mUSomw6nv61SJT5jUG3js3N4oYdqU
	0bjd8b/g==
X-Google-Smtp-Source: AGHT+IHoyKh/sH8/DfqDm6/YTmj58rUQ/xaund/2a2KvsOZBw+ZZaPMZVA4RQVLdez8ySceA+Rd2qw==
X-Received: by 2002:a17:902:ce0f:b0:234:8c64:7878 with SMTP id d9443c01a7336-2364260d248mr28868105ad.11.1749629125239;
        Wed, 11 Jun 2025 01:05:25 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:24 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 2/5] ARM: dts: aspeed: harma: add fan board I/O expander
Date: Wed, 11 Jun 2025 16:05:11 +0800
Message-Id: <20250611080514.3123335-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010526_105902_104A14C8 
X-CRM114-Status: GOOD (  10.69  )
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

Add GPIO I/O expander node for the fan board to detect and monitor
fan board status.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 3a215bb1e220..344e20394665 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -218,6 +218,25 @@ temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
+
+	gpio@12 {
+		compatible = "nxp,pca9555";
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <116 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","fcb1-activate",
+		"","";
+	};
 };
 
 &i2c1 {
@@ -273,6 +292,25 @@ temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
+
+	gpio@12 {
+		compatible = "nxp,pca9555";
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <114 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","fcb0-activate",
+		"","";
+	};
 };
 
 &i2c3 {
-- 
2.25.1


