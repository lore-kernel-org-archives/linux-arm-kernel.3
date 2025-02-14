Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB31C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 23:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FeyaBUGdJjlkWGW9Mb2IxlcoLsMedTXWODoDc3NaxG0=; b=CtuHNc41/cNYB/pBdJ2TVxi4v7
	8M0GIc5KGNVQ5Wx8VvJQhzHtgALkhLXlcvihhKdk+ubVlDE67lLPRaqTHU5cjtFIi1DAYNDMbBwKW
	ewmKDKzS0vvmHlQhRCCN2jX7Kd3bvrDInrN3KyO1Y4ilpRQEigRKfPJ7cORfrddcvlZ3sjwtXKvmU
	WXlONr0dZBnES/pdTdBrqFpWxU9UMNb3XT951Yb+a96d6k+G77kPVszPnMcxyB7R6NLzhkCbquD+X
	0LvhbVT+6wyPzuV8AXAs3K8S2qFm04nfaKhZjX+KhbUMQJpOpuVOomSFdnLAiNWgCdvOsD5PcjSGX
	KXibfhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj52E-0000000GU6C-3NB2;
	Fri, 14 Feb 2025 23:23:50 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj50m-0000000GTwG-2lid
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 23:22:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51ENMDql941245
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 17:22:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739575333;
	bh=FeyaBUGdJjlkWGW9Mb2IxlcoLsMedTXWODoDc3NaxG0=;
	h=From:To:CC:Subject:Date;
	b=P9BiM/uf60SIVuIQuPsdXSDdSogfHjtvnBd6dpYPS0LQIQva+h8t/Cyi594V/9VA6
	 C2/xIFkTQvJDVzD49aANNt4QCufv4n/+LOCzKOctihvvyh6UW5DR5aHXYmwQCbDxE1
	 M8Wc0eZPsaKOzCgoFOtODWzSrYRq1ZYjk+bJ9LSM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51ENMDZL014707
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Feb 2025 17:22:13 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Feb 2025 17:22:13 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Feb 2025 17:22:12 -0600
Received: from uda0506412.dhcp.ti.com (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51ENMCYN053254;
	Fri, 14 Feb 2025 17:22:12 -0600
From: Kendall Willis <k-willis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <msp@baylibre.com>, <khilman@baylibre.com>, <d-gole@ti.com>,
        <k-willis@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Add alias for RTC
Date: Fri, 14 Feb 2025 17:22:12 -0600
Message-ID: <20250214232212.1158505-1-k-willis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_152220_787645_970C8403 
X-CRM114-Status: GOOD (  12.22  )
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

From: Vibhore Vardhan <vibhore@ti.com>

Adds alias for SoC RTC so that it gets assigned rtc0. PMIC node is
assigned rtc1 so that PMIC RTC gets probed as rtc1. This makes it
consistent for testing rtcwake with other AM62 devices where rtc0
is SoC RTC.

Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
[k-willis@ti.com: Reworded commit message]
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Link to v1:
https://lore.kernel.org/all/20250212210604.745175-1-k-willis@ti.com/

Changes from v1 to v2:
- rebased on latest linux-next
- fix spelling mistake
- add test log

Tested on AM62A with rtcwake [1]. The wakeup source is 0x50 which 
indicates the SoC RTC is used to wakeup the system as detailed in the
TISCI documentation [2].

[1] https://gist.github.com/kwillis01/402aa56d263ef757316f1d6e44dea83f
[2] https://downloads.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#tisci-msg-lpm-wake-reason
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index a6f0d87a50d8..51ea961f166e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -22,6 +22,8 @@ aliases {
 		serial3 = &main_uart1;
 		mmc0 = &sdhci0;
 		mmc1 = &sdhci1;
+		rtc0 = &wkup_rtc0;
+		rtc1 = &tps659312;
 	};
 
 	chosen {

base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
-- 
2.34.1


