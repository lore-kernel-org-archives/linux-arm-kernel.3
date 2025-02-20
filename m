Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897B6C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CE4a7LWNgD+6bEHm+If6yI6CBWntgAegdTZ6WlyVgRs=; b=rZp3Y//kmf6nxwBb6FPhcoQBBf
	5yZ/sXswT/F0J2H31/NPr8boTnv70zagTl9QvumPio+xbQHEGn4ndmvUKpCPVQcmm2EVM1veeNMDC
	8PRrL448Jnc9ERNcWB/Gp1lCevRBLkyQ3W7+kyzSisAFSUNYNMEDp5TjhkuvZx++/IDrkRm3q3ONm
	hcg9S8Oh7W2BSZMwcjxvqgteoAJeAxyW1Ni3AMgNUjrqAuDmTyRJ1enaMjDnvYPoFFdEzNqMShx+b
	4O4NzG96RwGOzWCycZz+MKrdd8+a7/3JwEHe7IlN4DU0q2hjVHE9qyGBLEOx5Lb2PSitk9H4sUC81
	cStlTqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6E0-00000000wr7-3GUm;
	Thu, 20 Feb 2025 13:04:20 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5yb-00000000sbQ-2XCD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:48:26 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2211cd4463cso16013085ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740055705; x=1740660505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CE4a7LWNgD+6bEHm+If6yI6CBWntgAegdTZ6WlyVgRs=;
        b=M8/nQ9VjH0M2wZeZXAsiXRs/reUMOjRg0q8SbMn/MLQmmEu7FYLldbIaAESkpoYvA+
         d9u/P4ie3hWDgWVFEDup0In4RoNfQk17j/LMcEBQ2UxUnkHAordIHPh3Tibp2XFz6mOe
         gJ332/6XzlGyFuUra0Xg2r93JztsS1c7vqfFLl9BavErB4IX8yOONgKrxg2sNDeB9jxJ
         ogWlJpGFkwR3/ROLQzv6xCaLcDAV+CigZdDZ7OeGOXM4bGtINS8QEMWtKUyZHFTWTqEX
         T9EVK9F2JdKQeUQMxP+5+KQE453XnnkVfrADkph+U0z8/TIr0SQHh2RH+8ZfEP+ZswJg
         5d1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740055705; x=1740660505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE4a7LWNgD+6bEHm+If6yI6CBWntgAegdTZ6WlyVgRs=;
        b=Axujise4mnE5g01C439Ir9xVd9bvfTduo/nbrv6y7f2jlU2K5buatn1hOWHZbysbQj
         ClxWGXwKd17f2F+HsxKBPEYlZrxZVUiFydHsRf9bpyO4Ua9ibO3p/DFUhkotaOkqHm66
         uxkMtuFXdYvU5RjU+NrWaWew3tV1Zf7xmcAOgrYm9z3k2K4JgFqFC2bFZelvAT225Tlj
         3EKYd1+B8oDc51JgA4fq+dMHqN/XaLRub7NmlzouqS0ndDgOAil4OPyODH1cy+l1FPBz
         s4q65T8SS1UD0zEgJ3SauAodzZo9jOQ/0eH7ky7b5w9gVZYY1gRlab66P4GxNSm3QgnO
         MI3w==
X-Forwarded-Encrypted: i=1; AJvYcCXdtWNPKfsXeEf0PAFSGJ0xS6ZRQCGkpaeQkQCir9UCmuPRL0pERGQX4IkYVy5ATPHnPZUiqmNdOT81kBXFLcNZ@lists.infradead.org
X-Gm-Message-State: AOJu0YykeeTftGNGZ5Ht7GNfSck9Qk5w31OfDIZeLtFjEdwhNY9xtjTC
	DKD5YKk1b3X9qdHgLiT1IlvvIzXgdGJxLXCfXbi1VnNcYoPpJLxN
X-Gm-Gg: ASbGncuLYc6v1YLsxYbIHxTrsUkv7nXdC1dK9DKCKzm1MQyNK3H0kRIlUNrrFSkaYKd
	Er3C9Ob6XKxitQp0VdWfycQ8d69x0AuVDlCT1zLjVnlAwDxYmW7QO7fTj2JVmSYIna1Ic5gSGcr
	BagRRFJew63QoDRHwGbks34PIM4qTwFMG5eEdSURsEsy+pNtx0g7FKA0RPDH8thZgKSXTUwb50j
	mnBBdXaKLggTXaltGxV+txg38Swhcpf+1IYf0EoGIdi6WKumd6dnK27txZ7lWVwflqAryFr9bgc
	ELubm1mDDXZFb6Svg7AyubuKcBvd7Q==
X-Google-Smtp-Source: AGHT+IFjmiPqipTEZkwZ1WqVXZGW1oHgfOJdHBp8emwTtehMMJEryDelpL2Ck2DmoddIgyfmCqbAIg==
X-Received: by 2002:a05:6a00:1392:b0:730:74f8:25b6 with SMTP id d2e1a72fcca58-7326179e8a0mr35184251b3a.6.1740055704812;
        Thu, 20 Feb 2025 04:48:24 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9a27:2e77:89d4:5724])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73255f4c0d1sm11963662b3a.62.2025.02.20.04.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:48:24 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] ARM: dts: vfxxx: Fix the order of the DMA entries
Date: Thu, 20 Feb 2025 09:48:09 -0300
Message-Id: <20250220124809.2361942-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_044825_642228_34E605CE 
X-CRM114-Status: GOOD (  11.24  )
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

From: Fabio Estevam <festevam@denx.de>

According to fsl,dspi.yaml the expected order for describing the dmas
and dma-names properties is "tx" first, followed by "rx".

Adjust it acordingly to fix the following dt-schema warnings:

spi@4002c000: dma-names:0: 'tx' was expected
spi@4002c000: dma-names:1: 'rx' was expected

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Fixed Subject.

 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
index 6334ad4aec4b..597f20be82f1 100644
--- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
@@ -158,8 +158,8 @@ dspi0: spi@4002c000 {
 				clocks = <&clks VF610_CLK_DSPI0>;
 				clock-names = "dspi";
 				spi-num-chipselects = <6>;
-				dmas = <&edma1 1 12>, <&edma1 1 13>;
-				dma-names = "rx", "tx";
+				dmas = <&edma1 1 13>, <&edma1 1 12>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -172,8 +172,8 @@ dspi1: spi@4002d000 {
 				clocks = <&clks VF610_CLK_DSPI1>;
 				clock-names = "dspi";
 				spi-num-chipselects = <4>;
-				dmas = <&edma1 1 14>, <&edma1 1 15>;
-				dma-names = "rx", "tx";
+				dmas = <&edma1 1 15>, <&edma1 1 14>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -529,9 +529,8 @@ dspi2: spi@400ac000 {
 				clocks = <&clks VF610_CLK_DSPI2>;
 				clock-names = "dspi";
 				spi-num-chipselects = <2>;
-				dmas = <&edma1 0 10>,
-					<&edma1 0 11>;
-				dma-names = "rx", "tx";
+				dmas = <&edma1 0 11>, <&edma1 0 10>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -544,8 +543,8 @@ dspi3: spi@400ad000 {
 				clocks = <&clks VF610_CLK_DSPI3>;
 				clock-names = "dspi";
 				spi-num-chipselects = <2>;
-				dmas = <&edma1 0 12>, <&edma1 0 13>;
-				dma-names = "rx", "tx";
+				dmas = <&edma1 0 13>, <&edma1 0 12>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
-- 
2.34.1


