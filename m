Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5CEC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 20:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AshXr5XWQSneXnPYWhCHee0M+0gxjcps5sVK7/ZOTw0=; b=4qh0z8q4/uarLWstG3VTgOUEhA
	775IklLuCqTaAOvAp/jdacg1LSpRnQLosziafHOB3KFZs93jo4/oSGdR5sKpYVE8rj02sP0X2X+ZK
	wX6ShYfqAeOx0yJE40DZsfeLE2OXPL6WaG2eR3or2PMcBIkHhS948Mh3nFKvtJSJI/KG3MB/WtSXz
	BJDCYSMJuxf8bWo/IAW8G9Oz+myECtSon/3UryX+YwUBBdCXgBrzE8or40mtbJEM8MjWymjRHYBDO
	gP2EeLebFgwX4NG4vvvozZmU5ztYZdExgTh3QbNhty+JfjWqywTAz1hc+D163OzlDBATRSpe67EEZ
	oHZCY08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYyL-00000004s3f-25gz;
	Fri, 23 May 2025 20:26:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYwH-00000004rs4-0zN4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 20:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748031861; x=1779567861;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2F6xMBFuRrBPNxJsv+wvLS8JyNsreiW7TLaLUVv078Y=;
  b=qdcPikqIcXchFGG5EUy+1eFDdgvi2bYIoZ/cJaQvcDqYKIOf+7PH8ycu
   59kKePDkLZxvq2pxdVQESyCxAuUIEe5uCIbUdufIvADah9AwtvxL0LyNc
   kMInwpGLHmrCCmjcToT57kn4mKwK0JdEUiyJ699P80mNFC/H1yya1gr0k
   2/JI/S0r2sfz5OMFZe0nQnggtK+2Rkp/q+QW+Cjc2rmhIjq20eLdcTTCk
   OcyuIyVgrsR63AndJC0Z691ioiytJthDl1RJha1zz0hY/42BVVazq/u6O
   lLJsT53AvwL9bcEvfFQzTH+IrcKL4ftZv3edfOc7XqI/ULrsemn4rsi1E
   g==;
X-CSE-ConnectionGUID: KBUIaMEtQL+E9GaMz9Liiw==
X-CSE-MsgGUID: SOO35i9VTWOb/MEN5NYIWw==
X-IronPort-AV: E=Sophos;i="6.15,309,1739862000"; 
   d="scan'208";a="46850857"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 May 2025 13:24:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 23 May 2025 13:23:57 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Fri, 23 May 2025 13:23:57 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 0/2] AT91 SAMA7 SoC Clock Adjustments
Date: Fri, 23 May 2025 13:24:29 -0700
Message-ID: <cover.1748030737.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_132421_448206_88A9C27A 
X-CRM114-Status: GOOD (  11.63  )
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

This set has clock system adjustments for the AT91 clock system for
sama7 SoC family.

The patch set updates the device tree phandle formatting for the
sama7g54 SoC. This also adds names to the xtals so the driver can
correclty find and name them in the clock tree.

Changes v1 -> v2:
- Add clk_hw struct to parent_data adjustment for the sama7g5.c driver.
- Add correction to sama7g54 dtsi main xtal phandles.

Changes v2 -> v3:
- Removed the empty line after the fixes tag.
- Correct commit messages to better explain the issue that this is
  fixing.
- Initialize parent_data index to 0.

Changes v3 -> v4:
- Add clock-output-names to the xtal nodes.
- Remove the clock driver changes since those are not needed for this
  set.
- Adjust cover letter message to reflect the changes in the v4.

Ryan Wanner (2):
  ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
  ARM: dts: microchip: sama7d65: Add clock name property

 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
 arch/arm/boot/dts/microchip/sama7d65.dtsi      |  2 ++
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  6 ++++--
 3 files changed, 14 insertions(+), 12 deletions(-)

-- 
2.43.0


