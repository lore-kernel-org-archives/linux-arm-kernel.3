Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496A3D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Q4KxaumXr/I3N+USRelHC+Ec4RhrRY/NcEDOdheJqc=; b=S3gsA/QpFOJL6l01YSa7AxkUOl
	G1Dlkl1oa110of+4tP/4TBHnMZcIityvI5edPB1hfbWZvZHeEPEOJuJJNVyyV/LKU7Iw1kkKxcx/1
	QjIsUXp6iu9UkdbGEKUyvh3vDzNDw4Mq0xXCWkKX4O23XFrTpihX8tcEBTfAyg4LJA1tTs8En1Wfi
	fevniibFOvcgD5Y1knXgc7i0T6+862bp62w+DAQGk789dmGi25O8jEZ7m3uTMJeT1fDanIxJcdLcx
	agRnDiHThfBbHAdUJeiZaDAhn1YSWwJRDi3YLwQp/BbP8a6gUytup42MZSBEkowBsaQoOXh11CdZE
	zRnK2y7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsT-00000003zrZ-0e1u;
	Tue, 20 Jan 2026 14:38:41 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsI-00000003zo6-1jEd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:38:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55ADE148AC11;
	Tue, 20 Jan 2026 15:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768919908; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0Q4KxaumXr/I3N+USRelHC+Ec4RhrRY/NcEDOdheJqc=;
	b=cIcorOanxwDfHb3hqHFECCmwACYAldSxVcBFu81t1B70g9kRsdc5DFI+V7eiZtni7wcmRX
	f51f7+4NSQmnqw+NekBOVclt+wlXSBz23j1ehV5yQ/jSgWpazYPQ71RBOjEnThu+sZNayX
	aNSdxUCrC8we9JNa7TsrPMIsQhOVKs7ehL1dVnJOTEgNQoYN75WXNC4x1FxE/1v/PcezmY
	kS1w5NG9WlCM5hGXQq8uaQEv/WrwhuC+1P/3GeiHamtl+sFYBElVULA7LGv7xwg/+w3MwZ
	/DvzoD/SvRUWSa8Naz+lKCZH9I/bp0qN4rcSJyR4Ec4/gdPUtJygejZ/GqZUZA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 03/19] dt-bindings: clock: at91: Allow referencing main rc oscillator in DT
Date: Tue, 20 Jan 2026 15:37:24 +0100
Message-ID: <20260120143759.904013-4-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120143759.904013-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_063830_610717_AC628BA3 
X-CRM114-Status: GOOD (  11.77  )
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

The main rc oscillator will be needed for the OTPC to work properly.

The new index introduced here was not used on the four affected SoC
clock drivers before, but for sama5d2 only (PMC_I2S1_MUX).

Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
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
index 91f8f863ea076..1f6bb51780d09 100644
--- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
@@ -10,6 +10,7 @@
 #define SAM9X60_PMC_MCK		1
 #define SAM9X60_PMC_UTMI	2
 #define SAM9X60_PMC_MAIN	3
+#define SAM9X60_PMC_MAIN_RC	6
 #define SAM9X60_PMC_PLLACK	7
 
 #endif
diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
index e1dd41fe75046..657f32ce10071 100644
--- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
@@ -10,6 +10,7 @@
 #define SAM9X7_PMC_MCK		1
 #define SAM9X7_PMC_UTMI		2
 #define SAM9X7_PMC_MAIN		3
+#define SAM9X7_PMC_MAIN_RC	6
 #define SAM9X7_PMC_PLLACK	7
 #define SAM9X7_PMC_AUDIOPMCPLL	9
 #define SAM9X7_PMC_AUDIOIOPLL	10
diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
index 09d152da6db44..ddcb236718978 100644
--- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
@@ -12,6 +12,7 @@
 #define SAMA7D65_PMC_MAIN		3
 #define SAMA7D65_PMC_CPUPLL		4
 #define SAMA7D65_PMC_SYSPLL		5
+#define SAMA7D65_PMC_MAIN_RC		6
 #define SAMA7D65_PMC_BAUDPLL		8
 #define SAMA7D65_PMC_AUDIOPMCPLL	9
 #define SAMA7D65_PMC_AUDIOIOPLL		10
diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
index 0303cae56f849..e891715a35173 100644
--- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
@@ -12,6 +12,7 @@
 #define SAMA7G5_PMC_MAIN	3
 #define SAMA7G5_PMC_CPUPLL	4
 #define SAMA7G5_PMC_SYSPLL	5
+#define SAMA7G5_PMC_MAIN_RC	6
 #define SAMA7G5_PMC_AUDIOPMCPLL	9
 #define SAMA7G5_PMC_AUDIOIOPLL	10
 #define SAMA7G5_PMC_MCK1	13
-- 
2.47.3


