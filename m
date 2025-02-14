Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098C1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6bDzF9bdtZvbRCYScBaWVd0WL9dpBjDYnPodk6BE/8=; b=NqGfnpoOm0vQwzyT/2xx7cvr2J
	CvR2fw2Cps05cRPc588v6ZdrK70Hc4JnNiP8tgqWu7KlodnSuhUHdu/YT2KnVRjirERdlFk44rrgQ
	n0VXa7DJh+dAUEHJELSFMRv8FhPn6bFWRoj2i3Gop6avyr90wAPHJH9UrzgW/sdXzsB/SDRliHxDo
	Vh3l0cBA7fjqwNqF0HXsBs7sNbXeI03aO2dVrB1QR+oqFv6Ia15cQNZMGnUguo1vrsQ7RhfFznfTk
	vib3Ln7XJg9P8j+uBzo5VQJIPyrDBilDVcrKrISJ/dut79/l/P7k/GNjyL12UJ7JY6pgdqIMb4gGE
	DtttUDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1nX-0000000G6C3-1jbV;
	Fri, 14 Feb 2025 19:56:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07P-0000000Fp3f-343Z
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 18:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t6bDzF9bdtZvbRCYScBaWVd0WL9dpBjDYnPodk6BE/8=; b=CQISq9FzRJumO0LcSi4AjXDJ4/
	PZLzylvaYcnugAnixsc/wLQpYn0AvU4/3lesPfotyZSYAVMK6/0Nff8PYwmJENvMFF1PawrFBl/VS
	FUpSuAbZp+bg58xcHoZICyG6MjpaFnAWc0hosno/VN5poPcy6p0aEovzYL1pKhLVPjjG+0ZrRRwSA
	3CukI0sdJ6JEkZI18c7l+HAgXFd0O9x8yaU5MgcZ42JIKTNfnyzqG8uJH35m5JGXmh/vyb18VJbLL
	AL5p9bokyoHU8hx4pB+A+DtXro/kFuIgJi1n+olzvPSaRm8x0+P+QUOE8gih7ri0FILX3Dgg+UpdL
	pxsHC4QA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07M-00000001J2v-2IMA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739556529; x=1771092529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jbCTVPEWFw9WF15vsBw6QaeoypJLSenxXsize2yrV+s=;
  b=J61R8AhxLE0ws5ZtqEOGNnTMeEptJ71hXvW6Umg15uFiaH0UrRz9xUM3
   tqyxjou5r/IHHHtWGOQegs3YGuyrjcfBsE34OKe8hjfjPUA76YQudjomD
   bXsbwGL1KlIeailTIuH4OaozsSPoR5CtPcrkTxTXw4suhEH1CZPNtYXHC
   iTmjtMEWuVVbDmVBY/iO+9ozFLHhTiXRVF9AIHdouBRlUJNvdkHZtueMc
   hbunUlawkpz0zIIDmoh2zgjAzG2rLv6SMorPsYo33LNCmAfU9CAeuZUjJ
   AkrfGwjMYpby9pvXtihTMoWuZhZT5W+24p05K+1wXFpHQsAJ/oBSGcuG3
   g==;
X-CSE-ConnectionGUID: afEECSQvQkGMMmDvtHvTFg==
X-CSE-MsgGUID: dqD54zzST1Cb0T7PxsIoAw==
X-IronPort-AV: E=Sophos;i="6.13,286,1732604400"; 
   d="scan'208";a="37700926"
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
Subject: [PATCH 2/8] dt-bindings: watchdog: sama5d4-wdt: Add sama7d65-wdt
Date: Fri, 14 Feb 2025 11:08:15 -0700
Message-ID: <3c55e634f2993ac5a49e1b8bfceb2333e175d376.1739555984.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739555984.git.Ryan.Wanner@microchip.com>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_180849_066349_50A75EB0 
X-CRM114-Status: UNSURE (   7.37  )
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

Add microchip,sama7d65-wdt compatible string to the dt-binding documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
index cdf87db361837..e9c026194d403 100644
--- a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
@@ -23,6 +23,9 @@ properties:
           - const: microchip,sam9x7-wdt
           - const: microchip,sam9x60-wdt
 
+      - items:
+          - const: microchip,sama7d65-wdt
+          - const: microchip,sama7g5-wdt
   reg:
     maxItems: 1
 
-- 
2.43.0


