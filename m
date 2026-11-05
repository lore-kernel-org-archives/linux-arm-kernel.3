Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IX3KgdKD;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=bfxV1TLh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hxyLMEGDqraxIGgBI+7+yT3sa9IS8sXUw4nKu2AXh8w=; b=IX3KgdKD9d0Iny
	b7aTft9Ni66qtJoW12uEGBU1bT7wDY6PfYRacb1Wfbk+6p83yGYT89NnNOQDfN1OBTB+mO/tToDt/
	e6mKKyFDGf8gEvfRyIw9hqdc/omOr3XVsYfFpiR8i2a4gNMY2YdQgfmJPRP7JqfnkOGMoipV9lVA+
	50pl1/W2HQSwHW//tQNAM4ev47wbrmKOQw6b1lRZncMAWiza/AFgpBqGLQ3ByvPKZ/uTNYHGgRRHB
	0s08JVZorHu8C3QYt07amrxRX+ndmbh6xUE0+PNQ99OmrVb8wE6xe9h2McJcZoVIR+6zTR3oOXY08
	zFyEjiMs6q+X3/cSFrcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJz-00000008ZoC-20xQ;
	Thu, 05 Nov 2026 11:07:55 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJd-00000008ZQZ-0LCO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:07:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E17E2149663C;
	Thu, 05 Nov 2026 12:07:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793876877; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hxyLMEGDqraxIGgBI+7+yT3sa9IS8sXUw4nKu2AXh8w=;
	b=bfxV1TLhvKfIzKHa1laHnNz1KeXCwNKQFT8TMx2lAiFftkScB4PUpNptDwfwgD82v7uADz
	d1AlfV+vnhvJ47o79+k1Ssq3fmJU8Inaw+ofTYbO6aBfNg2hp/gUuvWvP+dIENSDsblZZQ
	UX2HC3HPYHWbVaXj8CqPyuQ9nN1nexpBROKbhFgaO6xMPD1HIl1uD9Tc0fbJG6e6OjBj65
	XCLG6SEp5Z1MbnXxZFViVtxzWmMDAnHE9/2NdvRqQXjsk0a8SSZmA2JzvyrsVljWV9xq6Y
	p285R83jGlU5eXBieALwy7/fbNPh4HQi1MAZhRDx4elh8KYfBLnR0MgZoGNm5A==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 03/16] dt-bindings: clock: at91: Allow referencing main rc oscillator in DT
Date: Thu,  5 Nov 2026 12:06:39 +0100
Message-ID: <20261105110715.2486432-4-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030733_621586_B2FC1713 
X-CRM114-Status: GOOD (  11.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The main rc oscillator will be needed for the OTPC to work properly.

The new index introduced here was not used on the four affected SoC
clock drivers before.

Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - change index for sama7g5 and sama7d65 after re-adding unused PLLs in patch 2
    
    v3:
    - adapt to different base changes, added lines are the same
    
    v2:
    - new patch, not present in v1

 include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
 include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
 include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
 include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
index 050e5e774b274..830e247ba2532 100644
--- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
@@ -10,6 +10,7 @@
 #define SAM9X60_PMC_MCK		1
 #define SAM9X60_PMC_UPLLCK	2
 #define SAM9X60_PMC_MAIN	3
+#define SAM9X60_PMC_MAIN_RC	6
 #define SAM9X60_PMC_PLLACK	7
 
 #endif
diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
index 292c5873e101e..58d2a08116795 100644
--- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
@@ -10,6 +10,7 @@
 #define SAM9X7_PMC_MCK		1
 #define SAM9X7_PMC_UPLLCK	2
 #define SAM9X7_PMC_MAIN		3
+#define SAM9X7_PMC_MAIN_RC	6
 #define SAM9X7_PMC_PLLACK	7
 #define SAM9X7_PMC_AUDIOPMCPLL	9
 #define SAM9X7_PMC_AUDIOIOPLL	10
diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
index 08581418b9115..17105a6bedb54 100644
--- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
@@ -19,6 +19,7 @@
 #define SAMA7D65_PMC_AUDIOIOPLL		10
 #define SAMA7D65_PMC_ETHPLL		11
 #define SAMA7D65_PMC_MCK1		13
+#define SAMA7D65_PMC_MAIN_RC		14
 #define SAMA7D65_PMC_LVDSPLL		15
 #define SAMA7D65_PMC_MCK3		16
 #define SAMA7D65_PMC_MCK5		17
diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
index 27668634b0a2b..4a1c4af8ecc9a 100644
--- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
@@ -19,5 +19,6 @@
 #define SAMA7G5_PMC_AUDIOIOPLL	10
 #define SAMA7G5_PMC_ETHPLL	11
 #define SAMA7G5_PMC_MCK1	13
+#define SAMA7G5_PMC_MAIN_RC	14
 
 #endif
-- 
2.47.3


