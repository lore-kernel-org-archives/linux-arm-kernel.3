Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41343CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M23uVWJiYeTrr1JS3uWWgf1JteN+eMtkrHNZo9t3Nsc=; b=zX33V+i4B1B3ir
	ePJMIu7E6lvw2zGv5uizxOOgk7yn2QP3kOSWqxmNrdo38/GavChJT0gWCehFsyKzHh+SOwfS39fiJ
	DIM3+h4dhLc7kWMZcWUwVWUKPO0we3nVtepfTx3AH+W3VghyfQD5WuxB53njyuguu8e3EFRTb3eOl
	CGzxe5BJE20gPgiN6UtXv7om1aFLBEFtmFEXnIfon4JcmpVX7Kt9R6rDHV1CzP9s1vDWIbXYXexv2
	8BCq/ZrAMdZ8tUb6/LUI/+7f8gNKDV5GLYSDLAG/Uf76cg6ics9gyhy9A0rhUAOXsAa599m8bADDz
	OQYh5BPAHf0ASJlYhbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1eM-0000000BtOc-2F5N;
	Mon, 01 Sep 2025 10:20:34 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0h7-0000000Bim4-0QFO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 09:19:23 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5818dWle030842;
	Mon, 1 Sep 2025 11:18:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=M23uVWJiYeTrr1JS3uWWgf
	1JteN+eMtkrHNZo9t3Nsc=; b=T7hBZMHGpHWX8yIcx4pkx4yXc0Gvci0C4fZ8Z/
	k6FZBtMm75DcvF7uyHfLZwnr/TDkl5lNA+oDzp0l7J1c3bbNDzlz4uYiBI1YF9Vw
	DHoze1NMr2Q1fM1WbxAOwm+QTj/1o5NCrm5OpfmTKooFBU4FnbPHnqDc2a7kumne
	j8Bqs6I9IttmDIcKECxxicqZFNrTWB/xYcFDoDFZi/VCJP1eqpoKAFVOFRAF9as/
	gmPpvKebOvlBJ5u/e3qMYyfb4AA0da5XAcll/rDdDvvoaT6Pe07CeR168Lg+yFTf
	9cJBotYpCwvGbeBUnimJ27c1D6uls5eO/o0RKcqEX9BKGxcA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmx690q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 11:18:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 831924004A;
	Mon,  1 Sep 2025 11:17:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 873B776555D;
	Mon,  1 Sep 2025 11:16:36 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 1 Sep
 2025 11:16:36 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH net-next v4 0/3] net: stmmac: allow generation of flexible
 PPS relative to MAC time
Date: Mon, 1 Sep 2025 11:16:26 +0200
Message-ID: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpktWgC/23NwQrCMBAE0F+RnI3U3abbevI/RCTGjQa0LUkIF
 em/G4ugYo/DMG8eIrB3HMRm8RCekwuua3MolwthLro9s3SnnAUUoAoClJ6vOrrEB3vl4dD3QVq
 twR6NtjUqkXe9Z+uGydyJlqNseYhin5uLC7Hz9+ksraf+7ZYzblrLQiIZXSkixKrZ2i6EVYgr0
 90mL8G30cwZ8DJY2QIVKFOqfwM/Rg00Z2A2KkImaqg+avg1xnF8Akh6th1GAQAA
X-Change-ID: 20250723-relative_flex_pps-faa2fbcaf835
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, John Stultz <jstultz@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_021921_651235_9BF5580C 
X-CRM114-Status: GOOD (  16.17  )
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

When doing some testing on stm32mp2x platforms(MACv5), I noticed that
the command previously used with a MACv4 for genering a PPS signal:
echo "0 0 0 1 1" > /sys/class/ptp/ptp0/period
did not work.

This is because the arguments passed through this command must contain
the start time at which the PPS should be generated, relative to the
MAC system time. For some reason, a time set in the past seems to work
with a MACv4.

Because passing such an argument is tedious, consider that any time
set in the past is an offset regarding the MAC system time. This way,
this does not impact existing scripts and the past time use case is
handled. Edit: But maybe that's not important and we can just change
the default behavior to this.

Example to generate a flexible PPS signal that has a 1s period 3s
relative to when the command was entered:

echo "0 3 0 1 1" > /sys/class/ptp/ptp0/period

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in v4:
- Export timespec64_add_safe() symbol.
- Link to v3: https://lore.kernel.org/r/20250827-relative_flex_pps-v3-0-673e77978ba2@foss.st.com

Changes in v3:
- Fix warning on braces for the switch case.
- Link to v2: https://lore.kernel.org/r/20250729-relative_flex_pps-v2-0-3e5f03525c45@foss.st.com

Changes in v2:
- Drop STMMAC_RELATIVE_FLEX_PPS config switch
- Add PTP reference clock in stm32mp13x SoCs
- Link to v1: https://lore.kernel.org/r/20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com

---
Gatien Chevallier (3):
      time: export timespec64_add_safe() symbol
      drivers: net: stmmac: handle start time set in the past for flexible PPS
      ARM: dts: stm32: add missing PTP reference clocks on stm32mp13x SoCs

 arch/arm/boot/dts/st/stm32mp131.dtsi             |  2 ++
 arch/arm/boot/dts/st/stm32mp133.dtsi             |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 34 +++++++++++++++++++++++-
 kernel/time/time.c                               |  1 +
 4 files changed, 38 insertions(+), 1 deletion(-)
---
base-commit: 864ecc4a6dade82d3f70eab43dad0e277aa6fc78
change-id: 20250723-relative_flex_pps-faa2fbcaf835

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


