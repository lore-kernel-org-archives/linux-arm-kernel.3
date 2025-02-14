Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F775C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hx3Kv045gPNwB8kgg5lcDJFwukn3SyPYHLraWoTPzV0=; b=W0KzNwaCOXWD0VtNwULV94vPNz
	WbgfrV40EfSQLI2F+apsD/2u0PuN0M14s3fdxNwOMU8l2mpif4mC1WRD0L40f4m/Nb+qphxQfT+ep
	1LX/xSqPwvod5UeMm7kOAGjPV9SxJrSutpi8TralDq26o+BQpifoV4RIMyhYUcVDIkeUGXw/nJzS+
	nXZPVKzoa8wvg4RIwN2sjJrDRzRBn3HZ/9MRcMYg64jq8A8bfQ4x7itvxX3FFMQTFx827X8KJh9MY
	MQ0wpvXX0tWg3a36Llk/rOfJ5SkFB3r6J7N7mF9y9t+O54QCadsoLGEeHPQh7gAu3lHSLBxeTHPcx
	EUcu15yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0eL-0000000FvK7-0rDk;
	Fri, 14 Feb 2025 18:42:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07N-0000000Fp2P-0Xa9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 18:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Hx3Kv045gPNwB8kgg5lcDJFwukn3SyPYHLraWoTPzV0=; b=RE+dODt6a9+tFs/CxGRHkZ/yde
	Gt5TCNPst3kxt9A5cb+RyT4q0Xo4N+3oM9pHorM6H7zcxCDHiA+mZeF+Ei79m9YOd6EYlliBsUS+k
	ZgD0zReIv2XiwBYp0mRB1SGd5p8xKo9R3cl/NBs04GkLI6C4ibALeAPXZ6nx0xrCS/NcJXTQMmg3+
	lTh8c8H3tGWW8zAxdo4Jl1RUgKYkP87CJthx/qkrr4I81VwWBe80dkWCQcOOutYNXVBaagHRfI/Wt
	wjhkliltNUAIC2rqQEUPeVb8m/IjxGBYajutQW1DXDEuEVBha+U48y+Z9d6cUHZVd18GufOWUtGO5
	WlfxFNdg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07J-00000001J2v-1svI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739556526; x=1771092526;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IiA3Lsk8M2dYMgk/4nS7W+qSoNllaePb+DQMH94UMsk=;
  b=CrGVD99z0CGJ9iwGUm4ZHEXXZY9dOjc+xISb5Xw1vwGMjvWXpg5HkLac
   /h6drHuwfcaWyzmY7bPXNQy1Yxm7ZHJw/9rqUTPfZSE55XXRH5f7hTSer
   yDY1NR5WZdbCffwNxDgckPbjRyK1m6c70orTRXCiXX5DHj4eMXkROWBx1
   nKT/IxLZETG6BDfgDnAKUw8nLnj6s/y+OF3Vapdirp9HxSQZTAxB/svTY
   rLIh3pMZ7ENEW4x3QhRrPgj4nIVJV3rcnRazlr5yR/gnvaT1SwbjY/0Lg
   7dJq/co/MAijV4zK63muy1iu2f3Kjr7flBA780BIpS+98kQQ6wQYScLPV
   g==;
X-CSE-ConnectionGUID: afEECSQvQkGMMmDvtHvTFg==
X-CSE-MsgGUID: ObyPD2RNTM+y/AWm3wOGew==
X-IronPort-AV: E=Sophos;i="6.13,286,1732604400"; 
   d="scan'208";a="37700925"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Feb 2025 11:08:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Feb 2025 11:08:25 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 14 Feb 2025 11:08:25 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <vkoul@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 1/8] dt-bindings: atmel-sysreg: Add SAMA7D65 Chip ID
Date: Fri, 14 Feb 2025 11:08:14 -0700
Message-ID: <008e4e49c9fd315cc96a185662b31eca1a64a614.1739555984.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739555984.git.Ryan.Wanner@microchip.com>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_180846_290767_D6209FAF 
X-CRM114-Status: UNSURE (   7.50  )
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

Add compatible string for SAMA7D65 SoC ChipID dt-bindings.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-sysregs.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index 1a173e92bb137..d3821f651e728 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -2,6 +2,7 @@ Atmel system registers
 
 Chipid required properties:
 - compatible: Should be "atmel,sama5d2-chipid" or "microchip,sama7g5-chipid"
+			"microchip,sama7d65-chipid"
 - reg : Should contain registers location and length
 
 PIT Timer required properties:
-- 
2.43.0


