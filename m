Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32806C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WHUhKfS+ZaE2np/nTIVSoQCKqx2vGtVJRjfiTaKlFI=; b=SMi3SDPsazPx88
	NrHhFh9K+7sHfzLclXDYB6EwUsXLvkt8R8RgFkjJWExKWWF8y3SRoHr4rx99UCpPu15z6EFpvAsNz
	7oV1J3lQx38z9Zu64ObY4EEBRUMb1VnvbgkhHCH3eOxxP6cReNCZhVWJvLiX0KS8HarU2OrCP1nVc
	wLCPLSebowPHYRSc6o8myohgT66JvAGFRBFoEC4e9V5ZPMjnGqYqwJUa0TNJ3Cop+w7067xmcTphY
	gtY119qQhyFAVshWK/Xp5M+DXdvxwR5cJ3YXtXwIYfSOLYqEm3Hddsd2UTn9HkUZXpw1K2huak2XK
	gCC4lf1WVQpriP4YFuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thX2u-00000000bhL-0wi5;
	Mon, 10 Feb 2025 16:54:08 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWuX-00000000ZNs-1102
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:45:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36879148026A;
	Mon, 10 Feb 2025 17:45:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0WHUhKfS+ZaE2np/nTIVSoQCKqx2vGtVJRjfiTaKlFI=;
	b=bNcPmcycV16BVxYBZn4F/R/IPE5AjKPvr1AaFSMK12kIuoE0BNKJ8Cf23OP4hppFsuIOqR
	3lIVX8EhZlpJfRggCvq0YttBKutSbqIhi5PNgMPwI3QrBk0nmS2XWfd7ValonGF7hISV3A
	wfAMZ1Hv5YVzrXpeAO0LTP98ALZZfIEg6FuyJlle2Y0UuqGe2URVFn1cdALz2K2RVZLGhT
	srEOTJkp8b/B8azWu0R1fnlFHsc/h/NYk2qpMU9C+1WQK0UpnZl3IXTDf0BEEKwyqj0GMV
	bKCIAuER9uvBpFVNfOvka4YmEXpJxSn49oJ1SbQSBBKWEIa5FXUPqsSH5YJsWw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 04/16] dt-bindings: clock: at91: Allow referencing main rc oscillator in DT
Date: Mon, 10 Feb 2025 17:44:54 +0100
Message-Id: <20250210164506.495747-5-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_084529_440349_2B43AB0F 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Ryan Wanner <ryan.wanner@microchip.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The main rc oscillator will be needed for the OTPC to work properly.

The new index introduced here was not used on the four affected SoC
clock drivers before, but for sama5d2 only (PMC_I2S1_MUX).

Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - new patch, not present in v1

 include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 3 +++
 include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 3 +++
 include/dt-bindings/clock/microchip,sama7d65-pmc.h | 3 +++
 include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
index e01e867e8c4da..dcd3c74f75b54 100644
--- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
@@ -16,4 +16,7 @@
 
 #define SAM9X60_PMC_PLLACK	PMC_PLLACK	/* 7 */
 
+/* new from after bindings splitup */
+#define SAM9X60_PMC_MAIN_RC	6
+
 #endif
diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
index 2df1ff97a5b18..6f17d6553b33c 100644
--- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
@@ -22,4 +22,7 @@
 #define SAM9X7_PMC_PLLADIV2	PMC_PLLADIV2	/* 14 */
 #define SAM9X7_PMC_LVDSPLL	PMC_LVDSPLL	/* 15 */
 
+/* new from after bindings splitup */
+#define SAM9X7_PMC_MAIN_RC	6
+
 #endif
diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
index f5be643be9b36..5c8e52299c110 100644
--- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
@@ -29,4 +29,7 @@
 
 #define SAMA7D65_PMC_INDEX_MAX		25
 
+/* new from after bindings splitup */
+#define SAMA7D65_PMC_MAIN_RC		6
+
 #endif
diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
index ad69ccdf9dc78..7bcd2634da37e 100644
--- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
@@ -21,4 +21,7 @@
 
 #define SAMA7G5_PMC_MCK1	PMC_MCK1	/* 13 */
 
+/* new from after bindings splitup */
+#define SAMA7G5_PMC_MAIN_RC	6
+
 #endif
-- 
2.39.5


