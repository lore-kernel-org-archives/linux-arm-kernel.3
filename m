Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1FFC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NwzoK57CVivbZFeToWr6rVZ379tMpp+f9WbOWRwIabg=; b=ZEU2OerZnpVydXXL8egYU22o9n
	VUlkt5+RcYTejlq2wTqlXmF2Yd1F7eZy8RNlpPVz/VQV3X6z8nmD2QfKiZLqJpwZPfPa14F9KnnP4
	zZ2bz1C8arBhZGNl/99RnFmhb7OFD97wad9oFvEc5hkbBW+MrPzOBlggNyKz1WeiIFeAT1uJdgWPT
	HNahdzw2brh5Zi6JgRQvcPXifuAInSQ+BA8Wa5BGahwozx2vkpkucoGgARSnlnZM8p45rZ9cU1rn5
	vQnIeq0J7gF7PfLR1hGO2r/cf4vgVC8a25hhunmMeUBsD5jVeRyquToo+S5BaOF7RlSE65OYl5kHp
	zf7X8gzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6CY-00000000wTX-0S24;
	Thu, 20 Feb 2025 13:02:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5s8-00000000rDE-3Jhc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:41:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2212a930001so21732355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740055304; x=1740660104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NwzoK57CVivbZFeToWr6rVZ379tMpp+f9WbOWRwIabg=;
        b=DmKikJHpEbSKdCVflGWxvIcAKvh1DzSccFpeZTLdT1ErsagDXwhwNA0cbgKDARhzwI
         9clDSJ4gvPqT0VdV4RgjRlm8/eueBm+2HlGlDYfvLE/yEcU3GF4TfsUhoq9fQpcHJN9Q
         Navz2XWlkjV0LDUZ7fiA01Y6ISzZcsWZxiALacBJ09RXqpRjSvwuHuM438hmD2wEdaw+
         HbWfJXKLKrqDgItVHMASQ967fGGGYHb5ge3Jrr28aCjtfSfbTIuQX5p010kjAG+2pHkq
         ah070kw/o3RIrZRDws5IXb3rPsfUmVe+QoxRRzL0utWbqlsAUioO9NCaSok2zO3bXJI2
         hCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740055304; x=1740660104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwzoK57CVivbZFeToWr6rVZ379tMpp+f9WbOWRwIabg=;
        b=P0RGvS9/KGCPoGm39IO3wONiwTlYhTvgNwR98JeeovqCaCvo3vnq7gd3O/m+D4nVqL
         V8N/zTOBaGZdWNXVOFxs5H5WbLDbXDfgoUYXiRwrVb5QzDQ7GzhuTSyablCgqNZC+ICP
         zQbK+O3Fs4VkicbW6esKj6jgGj6QBYSJIll5iQFSa1sL7mQRkILcIUEkBHb5Mn35XTFc
         3stsRBoFuE5bSTNRq45GVXyZJzN5fwdBMCVfcG4VaCzdBFJ06Yt1MzCcR8ctctHRnk5K
         tEuPhyblZs0jytl9NWrAvcymGFuyped6AUI0P6R/meJfk0ibmEXCNkhfxWddTCTUo5PY
         Kqww==
X-Forwarded-Encrypted: i=1; AJvYcCVoZ0Kr9JJ7vb65JwvZSlU/W8dj0GQDxDfPw81ITXpfysM6LFIRtKr0IVRKspKcD3Tz0XnZtwDKstgNd9nbUhP8@lists.infradead.org
X-Gm-Message-State: AOJu0YyV+q7Z+8GHBcmj6x+5MadoIvbzL2v+BxBejoveaQlx+VhDnAmi
	d2eTdllj52mQP7IQEgAPM5uLZ5RF/oo0EyXTSRBmx18wpBGzULkuZLh8NQ==
X-Gm-Gg: ASbGncsAKpEnDhzz/fnh0VRu9WuXjOXE0y4XvD/nPfbKb7uY40nLfjIcK+OdwZvmWBZ
	O0a2RtE13Sfw4sj7To2isXBFtiq9swH2I2utmDVEQ/fCGXTd76mnyCzJW0QFYazFP8Zoe9ZdU4S
	e7m8USmkqT/WIZ2FzZoh/k9ezv6y2wfA5izRshJf45DQUhO68FstwE3wDgk8R4r+ZZohdjYceOj
	pzvV4OA19XOVMCxS4aWdGHUIsTW7jn0namAobIfSZkqpPYTXoXZMi44RU9vwhMoVxlWoFC60QdS
	yYxFYkhaROscr9QLhrXcDXgYxQlq4g==
X-Google-Smtp-Source: AGHT+IEUxOa8RxncMcqI6MDH3KqAHlCb1aHAhAoOyQhIMr1TuOd4evgMkvMesnf1ee6u0+j91BV8fw==
X-Received: by 2002:a17:903:2351:b0:215:a964:e680 with SMTP id d9443c01a7336-2210404fc53mr346967385ad.25.1740055303658;
        Thu, 20 Feb 2025 04:41:43 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9a27:2e77:89d4:5724])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d559088esm119418415ad.242.2025.02.20.04.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:41:43 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] vfdma
Date: Thu, 20 Feb 2025 09:41:38 -0300
Message-Id: <20250220124138.2355253-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_044144_828079_129AD835 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Fabio Estevam <festevam@denx.de>

According to fsl,dspi.yaml the expected order for describing the dmas
and dma-names properties is "tx" first, followed by "rx".

Adjust it acordingly to fix the following dt-schema warnings:

spi@4002c000: dma-names:0: 'tx' was expected
spi@4002c000: dma-names:1: 'rx' was expected

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
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


