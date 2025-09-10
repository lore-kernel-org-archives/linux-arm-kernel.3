Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C062ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MU+8Ek2Bil7TNiQlYb94p1r140wLYSJJ7wLQYhnM4Vc=; b=KG21MWdE8pkqqDzMgyIcC6QUrK
	5/rvAtbNkMadI+lR9k2QZlAIS1l06Cevpq/WmoWiSLfWoUZdE0FpnmIC6wXYWF0ZNpyaTY5CfDRrF
	fK2hgZL3yS7XAdaIiKkj2/FgeQJHX0nhP7OXixmOYjBmlJrBeSQvg/T9Cld+VQ400tp9ipfcZiRzV
	3TZilNSs8pTZapulej9rdRACkun5uqQl4OcaDxzS3AogzF6fUqZAuxQ9jkX8Y9AELw2lWiTo99z4h
	SZiL5HJykMK7Bro2zJrGzhDiREq7cwRKL5N3c29IFA+uLpYJpsKq1Ka4OHvq+sf6kPWgKfafeIPNJ
	J7w01YOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNag-0000000FRmh-3l3a;
	Wed, 10 Sep 2025 16:22:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNae-0000000FRke-27Az
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757521356; x=1789057356;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xu3xFpP6OXvzUwoD4NKkxmtoukGTQw+z9PKBijHr5YA=;
  b=nth409R/GpnW6Y0nRsBKm2/LQ9/gb391ByERLRV9sW9AxMrFq1WoXX2f
   4h8ZwZSUxHW/XiB/IhYwKzDmVOiRQ0eRff3BHHqK+Yi6bhQhzkBhg2Git
   566ptAWtb5MwmWpi0j3gqhJkYOZ0F/7ZLQ7IwNKGus3tXqBvukv5yb5TI
   ewMvJ7MDgypx/dzaZeQlz2bwxW1wxpkqMqvg3ivT3N1/fIgiEZ4vAXGJP
   HD+Vrs1MAlao86HI6vgsgg2/z6LOs8dhROfZonhC08Uk6fIcgCWDhre7w
   HX4Q4LAF4NUTSeEB3E2Q5T35GJ3gsgqLw6eKGd/T1hEgqHMDdvNk+EtzQ
   w==;
X-CSE-ConnectionGUID: yOp9HMF6QSeW0ZytE26RNg==
X-CSE-MsgGUID: 4CDB0pBtTlCSlNsC6aYZhQ==
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="46875547"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Sep 2025 09:22:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 10 Sep 2025 09:22:10 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 10 Sep 2025 09:22:10 -0700
From: <Ryan.Wanner@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <sre@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH 0/4] AT91 Low Power Mode adjustments
Date: Wed, 10 Sep 2025 09:20:35 -0700
Message-ID: <cover.1757519351.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_092236_580247_702AF08B 
X-CRM114-Status: UNSURE (   8.82  )
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

This patch set adds the LPM pin feature to the SAMA7 SoCs.

This set also removes the 2.5V regulator since this is no longer
supported.

Claudiu Beznea (2):
  ARM: at91: PM: implement selection of LPM
  ARM: dts: at91: sama7g5ek: add microchip,lpm-connection on shdwc node

Ryan Wanner (1):
  ARM: at91: pm: Remove 2.5V regulator

Varshini Rajendran (1):
  dt-bindings: power: reset: atmel,sama5d2-shdwc: add lpm binding

 .../power/reset/atmel,sama5d2-shdwc.yaml      | 16 +++
 .../arm/boot/dts/microchip/at91-sama7g5ek.dts |  1 +
 arch/arm/mach-at91/pm.c                       | 98 ++++++++++++++++++-
 arch/arm/mach-at91/pm.h                       |  1 +
 arch/arm/mach-at91/pm_data-offsets.c          |  1 +
 arch/arm/mach-at91/pm_suspend.S               | 75 +++++++-------
 include/soc/at91/sama7-sfrbu.h                |  7 --
 7 files changed, 156 insertions(+), 43 deletions(-)

-- 
2.43.0


