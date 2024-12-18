Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E46E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1oWrWl5HM94IDeHh5v4VY92O0MF3BbHI+a7HB2xR+Cs=; b=IHMiSZC+WaBxuO/viquJ0HHVCu
	ZGk0J+SquT+ShA1Lx00GOzYlFHlkdgDC9d66/1idp/ko1eLIo1Y5LVnTw+j0hkGuSuaRN/XljTN+J
	Pt3nsiMMQcgHA37TtP74QcRvnr/oBjapk+YwPmC2AHmzREYiFAiFPLTgnyYmauPkjRFuGxH4jMY8I
	PCzdR65xQXs3lxWw2RQXzu51iFwk9rnr1tECf01uKctXZvjSabury0tuLOIuxrOZYI7TsdYktHDWr
	vAAyxokkD6chdhJ0xoFD/foY8ov5g7V0b7no3moFOJJXnkDHX8eizBrAezUXUuAueUUhqesEw0IRl
	MplxLbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNq0q-0000000G10Y-244S;
	Wed, 18 Dec 2024 09:06:36 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpz8-0000000G0bG-12vE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:04:52 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI7Eetl022006;
	Wed, 18 Dec 2024 10:04:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=1oWrWl5HM94IDeHh5v4VY9
	2O0MF3BbHI+a7HB2xR+Cs=; b=4FfTT2hYqblXiq3AnMeik5u524MAdH+EuI2lQI
	N7LHXhuR7+R6MqXLsk8qrY1yv48SuZoAeo+BKA23Yd4ogrvjNuhGisXeoGqRzjRe
	exPABAd2J3gMNf7VlXL1PheZXw6OHzQJPi+qFg0DHz6qnD1HGnqamPr4yl4WpCcv
	wPrCm9q8AQ+3BE58N+GOl8u7JKEwqcDplhBCe81nuLJdT4j/HgzbFoz4sg4xQ+L7
	uqfgJvZ4Ze89mmtCDrpJLBQ0+JQMafx0MsRskTXXmRIox5dkowDVTACdcAEoU8Kv
	4NFummP1BmXoLkYPjcg1rTpUcy5/SyTF3C0fCUV96qxRUIxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43kfu8a4ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:04:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DF04B4004D;
	Wed, 18 Dec 2024 10:03:53 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0B7525EED5;
	Wed, 18 Dec 2024 10:02:54 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:54 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:54 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <wbg@kernel.org>, <jic23@kernel.org>, <ukleinek@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
Subject: [PATCH 0/9] Add STM32MP25 timers support: MFD, PWM, IIO and counter drivers
Date: Wed, 18 Dec 2024 10:01:44 +0100
Message-ID: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_010450_580779_F1A6B8F2 
X-CRM114-Status: GOOD (  10.73  )
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

This series adds STM32MP25 support on MFD PWM, IIO, counter timer drivers.
This new timer variant is managed by using a new DT compatible string.
It comes with a slightly updated register set, some new features and new
interconnect signals inside the SoC. There is also a new instance (TIM20).
Same feature list as on STM32MP1x is supported currently, except for PWM
capture (not enabled, by DT).
The device tree files add all instances in stm32mp251 dtsi. PWM, counter
and trigger examples are provided for stm32mp257f-ev1 board.

Fabrice Gasnier (9):
  dt-bindings: mfd: stm32-timers: add support for stm32mp25
  mfd: stm32-timers: add support for stm32mp25
  iio: trigger: stm32-timer: add support for stm32mp25
  counter: stm32-timer-cnt: add support for stm32mp25
  pwm: stm32: add support for stm32mp25
  arm64: defconfig: enable STM32 timers drivers
  arm64: dts: st: add timer nodes on stm32mp251
  arm64: dts: st: add timer pins for stm32mp257f-ev1
  arm64: dts: st: add timer nodes on stm32mp257f-ev1

 .../bindings/mfd/st,stm32-timers.yaml         |  18 +-
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  61 ++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 524 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  58 ++
 arch/arm64/configs/defconfig                  |   4 +
 drivers/counter/stm32-timer-cnt.c             |   7 +-
 drivers/iio/trigger/stm32-timer-trigger.c     |  21 +-
 drivers/mfd/stm32-timers.c                    |  32 +-
 drivers/pwm/pwm-stm32.c                       |  39 +-
 include/linux/iio/timer/stm32-timer-trigger.h |   6 +
 include/linux/mfd/stm32-timers.h              |   9 +
 11 files changed, 766 insertions(+), 13 deletions(-)

-- 
2.25.1


