Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41A7C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 01:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9iPlkY3CknuAFyY3M8TOGdUAXhGOxVAJ6BaVRsWDl0M=; b=oZYvIojm0TLMDklSmSSk6pXlz8
	lcO/CUE7IgQaZDtjOO6CMcB0fnEopuExJM4V/52h0K980sgG5OAMhMH9zj/ojv9c28AlwO5kE3k7c
	VQLvXRsMJdCS3xuv364FDNfMSuIVGZdjESFK7Gplpx7GDp8NVCEQDEiHBKZXSupzrtESCGKDYFjW7
	0kFlcEilBHAQBwu+s6+cZ7cICbqvlMXQKBk+xs783aciiNNochG9IYcSEh4T7EZ17F6r+n+GaGgQC
	T25qzk2DtWPWVxp3hcyot/gLb01MYCzBPYNcRNehCGN8W3kMUtmS1/djojU/gzYGn6yLcd8wt9MpW
	GmYPHNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8TGq-00000000hf9-2SHF;
	Mon, 21 Sep 2026 01:56:40 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8TGn-00000000hek-44MW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 01:56:39 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so2150924a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 18:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789955797; x=1790560597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iPlkY3CknuAFyY3M8TOGdUAXhGOxVAJ6BaVRsWDl0M=;
        b=Oy7ZtZ1SwWXBSDvu8g6SRFeU/Kheea04PMHErVRrlWbiUzNrWn3djZPzIsiAtSpNxH
         6Be4/G3B90fiwirCIgm6Lb+J3OUr5voIIH+NDbBqHjb4EWuKY07iXtdW56WAU3uBkg2q
         R2AoRQmD44Hld4H/maYQyWXrYCndcFJQL7Tk8KDpUMBCcqoDcmq8wOsaJnSXp41nkQv7
         8Hil66oCaE3SbzjpEFhA568dE7QSyzeu4xpvte8M7mRkwBxgnrkgScIeaAmrdXq8BZYU
         gC/42H+XouGUHqGK+xeopkFTpJaneM7ABKVzxyavFIKfgzRtBRRsPLJ8EyDjP+Oqd3Fz
         tqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789955797; x=1790560597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iPlkY3CknuAFyY3M8TOGdUAXhGOxVAJ6BaVRsWDl0M=;
        b=ZhSIyHxqm7xkhPECniNJuhtFkEJfcrobjOBJeSrsr+1GafjoEmSLwifie+OOJUHugj
         8KMEQq0+pi06M+/L9DisjlHlfEqGyZZO08B3JDZ58/mU0Z679T6Aj4V9eTEgUK63heFJ
         lkfKWMKVwd/2daY2v85kuPJeg4UNoaGkPlw/Eew3h7shDEVNJ4QGHsrYS9lyLDb74I4m
         NygNt8NO0qrPnPgOjzeHSEUmQHKPAsHtWuGsjNuaIaJbvMd9XBCD5Q+zbyreAN4gII8u
         0kEBNIGtL8W87wD7bHAfd64ikRVHHyLCeEakwCBMyXMDOLCwjjCgWHhffWonfYHk7Xju
         lbrw==
X-Forwarded-Encrypted: i=1; AKwUvBzfoCoqN9pXrM5NN0WYv8Ri9ZfK6U/nWVBsLJz8HhSbkWLFWuLr1b8jfyinZ3Nwh3Dcip935trICUUfmxNWrBz6@lists.infradead.org
X-Gm-Message-State: AFuF++lcJ0rvhTArcPvSZtW0vw54sTyRUantYMcj8Wakv4quR3bTY1D5
	mnXWXONeEhi38TjZzW1+/OvGMaB5N46Do3ry2xSEm6DMJqHjMpTi+DH3
X-Gm-Gg: AYBFou2n9+QOTMn5GpDfhugh9wXNE69t478yI86aipZv0FImnWFvo3NhiRnaKIpu/iG
	CP2Ykrixr1ERHChwJjVJP3OI85jM4bvzfOadXiRswODM8A2t2By+RHuYrnmNmW/9mpOw3BF88Rp
	yx6+2YwFo2cx3W+b/P75c4QlVztMBzS7zBD+zHvtw7fD6U4znLkoEDp15Xee9UFUL1ldYVhF8LM
	SmMJ9w/uKN03guXWpuu5tQ2dr+3mThny2ZfFfhSXfW5Wt01pN9lJKeF6zki+ZJL4XCP1mlZntqr
	s/Ers2KYj5hvu7KXnG2AAvMDOOoAWLIgSERtWbytrEug0nYkciV6600xl6YQc4hxTn/LzfEX4Vl
	3JpZZUFM46ZelHOP6RycSWs+o9cOes6COyM9DSDhFk9bWA++EYlli+2J/cVWw11j/ZkvYDWlLDD
	+mx2xkeUp2R02W5mye05qBzi1EGS6FOGfP1tLxlbUnLs3GzJysJsplZLuAybowLFwCx9G1SCOxa
	lf0mpPSAFji73F2uWBj6sNTEEf2jQJnPv/lb+qWw0GNv4AH4wy83GtY9BjkyDmk2WfE4eSCdbrz
	l9zgwykrSUq+AjDj1AB9LRXvBHCI8YrfiwpFWnb9A4ysJolBMfjBD5bDpSY=
X-Received: by 2002:a17:90a:d2ce:b0:3a0:42a8:b357 with SMTP id 98e67ed59e1d1-3a042a8b394mr2631643a91.4.1789955796847;
        Sun, 20 Sep 2026 18:56:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a041b87bfesm4094223a91.3.2026.09.20.18.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:56:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: broadcom: rename pl330 DMA nodes to dma-controller
Date: Sun, 20 Sep 2026 18:56:34 -0700
Message-ID: <20260921015634.1044454-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_185638_067057_F323B1ED 
X-CRM114-Status: GOOD (  10.94  )
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

Each PL330 device node in the Cygnus, HR2, and Northstar Plus dtsi files
was named dma or dma@<addr>, which does not follow the generic
recommended node name for DMA controllers (dma-controller).

Rename them accordingly. The phandle labels (dma0/dma) are preserved,
so existing references via &dma keep working.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi | 2 +-
 arch/arm/boot/dts/broadcom/bcm-hr2.dtsi    | 2 +-
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi b/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi
index 07ca0d993c9f..a017e46fd78f 100644
--- a/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi
@@ -331,7 +331,7 @@ msi1: msi {
 			};
 		};
 
-		dma0: dma@18018000 {
+		dma0: dma-controller@18018000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x18018000 0x1000>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi b/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi
index 75545b10ef2f..13bc358adcfe 100644
--- a/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi
@@ -154,7 +154,7 @@ uart1: serial@400 {
 			status = "disabled";
 		};
 
-		dma@20000 {
+		dma-controller@20000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x20000 0x1000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index 6a4482c93167..5f14cd3ce211 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -201,7 +201,7 @@ uart1: serial@400 {
 			status = "disabled";
 		};
 
-		dma: dma@20000 {
+		dma: dma-controller@20000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x20000 0x1000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.55.0


