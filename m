Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF50C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R478x+VsQssRpU/U+H9eTTLOJEK424oXp8O1P95M0Gk=; b=XAtv3XEgrwd5ICYlLyC90X01GA
	O7jJl9AGV0YlhbW3PtpF70UAO7h9YLZdp+ouBHSA22sJKPBs3C0L8HEldYbRTGhDbvQsOAkpF7lzC
	2O2dW/ml0iZ4+wFWm/zEe7jouXWwXAJf+J37hA+mEyhasY2GWLwuzJcDZ0I3FolPNJ4S84LV2H/5Q
	7+useArAhv/ZCR/gPpY7VXy3h1UekGJq064mp9XCfKMAFeiKeHXWslkINlJ9Ro5/BlapcvsQ2p8NS
	CTRQIb5rl/sX/vn1lC15lVIbP+Hk+4m5NlPudFuegdIg06Y3ddzTKvwmL8YOCsDbWlUsPPogTGOcB
	oqh+Ypbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUMJ-0000000HV1b-3brt;
	Wed, 08 Jul 2026 15:38:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUMH-0000000HUxh-0fzX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:38:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-46ed4f66256so742343f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1783525123; x=1784129923; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R478x+VsQssRpU/U+H9eTTLOJEK424oXp8O1P95M0Gk=;
        b=dU1q9wIs/TOg6fcl9bh2Msckii09ZnKJPq3w5MLrBXS2yjWoWfmcp2FfTbYXGxlzQ9
         q+FDjqXCcGABuMkOLpBakaZy8VqNfKafI0h3jxPzA5f4ePy4SIo+n0u8I6x315MoL3gH
         ZetQhCo7NOBM7pQm4YDuT6cmkLKOkVkgxzWBIRdr+wBTy793uZBpKO2xnmM76bAGWZu2
         0eqDDmEiHHRkl8oLaVgnil10eVvCU5IaRZ/mw5aUe+Vfnvb2cRK+qOaQaR8M9HJDPA5p
         GRDf7fh+BHzgz3YbEkC4/nVH4X+MBEeA/E7frOdcnKTuPuDIstTHxggOGm1ReQLqYntI
         xJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525123; x=1784129923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R478x+VsQssRpU/U+H9eTTLOJEK424oXp8O1P95M0Gk=;
        b=eXt3UZL80/JabNklRCvJ02Oda/TG0f+q2GiyHYheTyZTQG/2vUAa6Iy+kpXmsZ2pB0
         LDWFWXEhPGS6se6e5yX8uYJBnMHYrqnZe8DUV07lXYHBS3S3ZII7b/byeeG7gpDxt+XE
         cGbFnhVrHIX5jboUfQkk2UZDDaBE/Y1QaYmbGUpenDAWEj0gSNGynm5iyiCLzneHxrAa
         NHN3nyS5pxhnOGw5pdrlulgLhNbWm4eAyVzQFM/gf3L4IgOgkB7+m8Yb2gLR9jpL2pZx
         5MYN1sbaHSSu2amCFhaKIVF4L1F4frd3jjxkBKJZ6gZuKb+E3l2S5LEPsIzc08nzMfk5
         iPCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxGgeL9zqOYqY2NZZyi9LirD4pMwKT9X7OWh3xaFqHYwg6btrByT+zKRC6Dq6oT8lmrsmnpqSTerJN3zFFvVEv@lists.infradead.org
X-Gm-Message-State: AOJu0Yza4/U7LTtD3Gf1FSYy7agW3eTrUCXOP5vg0GNJ+MKs7IewLs3n
	K3aTiIs+JCgi2AbcNqrs69f5nYzV/1g8IdJIyxKxfpWdts7HYBGB/GcnJ8J6wXaoTBs=
X-Gm-Gg: AfdE7ckVo3X58gZB4qFmQYQ+ctRI9MeRIlvNtZU9g5bJXFYp3vv9DR03x3xGryzQwPm
	d2IgxwGDIXl4WShHYZc5jRz1nFESGuFrYJO0xWfYRVe3GNk2eV/1eYlVsmFwGsoUa/WqBVxmZQ6
	C3nIj2TjHjKkplDv219sYCK1HaZNhqE+r/d/07/L+nNtEHyCuD6ClVoK+51H5s8fcnwHc+aSn17
	XS0V9dxrts1l/lhfnNIbhuGhg58KDhI6ma/D5hbu9NbsHC9XQBbvYJ8gIEUZ8bo9xlkJD4vf0Vi
	2ZNYFy1sdZno42a1EIJoN+dfMcA2RtvO1rvW2d+2GLBqpyUMUGOT3QUjKyF+oZr9awN2a9Gtkc2
	Oz4otOCefMf36mvUKOybcD11mYDvRVahfIcjMyKqgBnJ/RQrjKLOMp01m4vS1W3876CSWfjBy1F
	bVjLob5+vjXuRs1QqFIM+asy7NNfTLAIxayn3LhIjkDTgU+KQWxy7VHLt5HwTzIV2+oXGvPpbCU
	Zq7IZUjCG5jt6/ea0CtT7m/l5NRy0JJ7bUjKNg=
X-Received: by 2002:a05:6000:4709:b0:475:f0d1:eb69 with SMTP id ffacd0b85a97d-47df07c5accmr3512417f8f.54.1783525123283;
        Wed, 08 Jul 2026 08:38:43 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm44254136f8f.15.2026.07.08.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:38:43 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v4 6/7] ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
Date: Wed,  8 Jul 2026 15:35:58 +0000
Message-ID: <5875623c1b20cf5a1abc980eab4c31a47cc58468.1783524645.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_083845_255669_07163A10 
X-CRM114-Status: GOOD (  10.71  )
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

Use the ast2600 compatible string.
Make it more precise and enable specific ast2600 properties.
Still use the ast2500 compatible string as a fallback.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..7c02633f2bd6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
 			};
 
 			vuart1: serial@1e787000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
@@ -717,7 +717,7 @@ vuart1: serial@1e787000 {
 			};
 
 			vuart3: serial@1e787800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
@@ -727,7 +727,7 @@ vuart3: serial@1e787800 {
 			};
 
 			vuart2: serial@1e788000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
@@ -737,7 +737,7 @@ vuart2: serial@1e788000 {
 			};
 
 			vuart4: serial@1e788800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.54.0


