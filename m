Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6543C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 21:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j99x+HHnRvJvE8UMWDBgH5i9h2yDF4jNwaGyZxSsSko=; b=c7CjwdYV4k+L4V1ruq0lddWQuL
	4REvDehjs4SJ8pwtviX1u8E4n97rZ9I+AlAttb31jxcNfjum9N86z93ou32JtGVfWQXMY17sd8xvL
	tm+EDbQifhPOkkM4fbPSpkvtzAwHl9NKKf2qZPDuLkhmQXy0Ft3qEoIf4udk+ce1ekPN+ZGszqGPf
	xHopwCcrV01WmIP7izARRJJpFMwLg7pAr0/MEEPBVzAojsID6bVulgpR6rTXdutmUTGrP+2px2g4F
	fUUwnD/QY6vd0jb2z9HW5FJfP6kdcxOWkRjKOyTY6ODixtag7EQymYAyIuuoL0ZMxPgoUmQChOYQ0
	RIpLUW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RlP-00000003dVK-1RAn;
	Mon, 14 Apr 2025 21:54:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RZ3-00000003afr-0cho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 21:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1744666920; x=1776202920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P0+FQOoZAZDGBeJjjiJS1++QSiAMr7ZQoLAUMUlSI2E=;
  b=uqill+MSoz8+pL2GnQ2qUnk5rja+E+Aq7k7spOHqTL5aUsBSxWq6hfpf
   YcpDz/I8fXSx8XjzFcypbgmTnqycmU0sEA/4x9Y1kKQdrkp8H58l0CGk6
   4SEOc9Dv8lt9Evk+BwZKcZe7CpuqATU4KtieXNKTIucSqHDTJDwaLyba3
   kK7NTzSdOKkD5CelGTVA+B7TtSEWGQ5U26DRSzGFDcMJ1IFB1aVoWMlw4
   2Dt5T2tlLU0aGYRePMyqydoTvGkKcuq2T0678u7Z/+pz1TmRvFmfxJRUM
   WJceGmoM1nk94UkYGgm5vikRfUlEOmKJgwFYF/5aoxbRuYCRoMcGdxppN
   g==;
X-CSE-ConnectionGUID: jf75aQsXSneWELgtntpGWQ==
X-CSE-MsgGUID: oiXX/nZaR0SBoW4EIzQuEg==
X-IronPort-AV: E=Sophos;i="6.15,212,1739862000"; 
   d="scan'208";a="40006673"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2025 14:41:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Apr 2025 14:41:05 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Apr 2025 14:41:05 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 05/11] dt-bindings: at91rm9260-rtt: add microchip,sama7d65-rtt
Date: Mon, 14 Apr 2025 14:41:22 -0700
Message-ID: <183474a65377f4030360166a5f2659af7323e82b.1744666011.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_144201_256723_F45B15D5 
X-CRM114-Status: UNSURE (   7.66  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add SAMA7D65 RTT compatible to DT bindings documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
index a7f6c1d1a08a..9c9b981fe38b 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - microchip,sam9x60-rtt
               - microchip,sam9x7-rtt
+              - microchip,sama7d65-rtt
           - const: atmel,at91sam9260-rtt
       - items:
           - const: microchip,sama7g5-rtt
-- 
2.43.0


