Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA9AC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 17:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TbD/TdwU+qHq+NwWIps3/LhUGddSUepWeKH8hb9UQKc=; b=v+BB+5JLhgOBLIsbacIwNMUS8f
	W5AGRpmvOxlNlx73DrtSmHKp9ig1ZRutO5Kj27B1Izi9NHO6avb8/CQ8MF9forSWWxrhXd1bDKdqf
	DzkGiWEoB5Im7PocSJ1z9+JPPoJxewqz/iwkcrysFqfJV/KAs8v52D76cObMwbUA2MsMw645xPrql
	3dfKZsNwoq7b2ja6u+Y53bVClM07Xz8uN6RAZV+0Rw8lPfdATycGPR52Izcer70v7CvD1l+9TkYYj
	SUgXYGYNKhz0o36aD4DPCcQti6F9fmScR47Do/Vh6sasSBxIov8dfhgtTVTRixNeQihCKUnY8GH8m
	hBMgHWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt94A-0000000EvCE-0j2B;
	Fri, 14 Mar 2025 17:43:26 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8vc-0000000Et6u-2i9d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:34:38 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EF6KLg008585;
	Fri, 14 Mar 2025 18:34:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=TbD/TdwU+qHq+NwWIps3/L
	hUGddSUepWeKH8hb9UQKc=; b=VZ3xLcv6tx+H3qO2Y6pL+h3q1yn8UsQQ+z+s/R
	Va2hhkTOiNfcyLTPCcQOjjMw9JoPjkJwtanyf8W4lw4Cd0i1wCfQAjzAVve4pXoK
	YzBbVysPCv6i1dhl7K7uV8Nvmxd6cSw350BwTMbt4JUjikNXpXODisUHqZPM1Q7y
	Nj2XH/fz2m4tVPqMISgD1b/tLJFPPtW0nhSaXz2MZIX7jTDwS4XcHJZ8nptJbYMH
	zcLx39/f0KCNBftuC2RjXqgs3CEwvhTGxEwfqkspLDn3NozMarzX11cn4pWpNGzn
	kFdpJkqNlPWVYo/hY7syKspvIyYug/28BWs2Jyh/5Qkd260w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45c2nswdtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 18:34:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4B2204005F;
	Fri, 14 Mar 2025 18:32:59 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6E076D07B8;
	Fri, 14 Mar 2025 18:15:03 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Mar
 2025 18:15:03 +0100
Received: from localhost (10.252.1.141) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Mar
 2025 18:15:03 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jic23@kernel.org>,
        <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <robh@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v4 0/8] Add STM32MP25 LPTIM support: MFD, PWM, IIO, counter, clocksource
Date: Fri, 14 Mar 2025 18:14:43 +0100
Message-ID: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.1.141]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_103436_989028_482E5033 
X-CRM114-Status: GOOD (  11.78  )
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

This series adds support for STM32MP25 to MFD PWM, IIO, counter and
clocksource low-power timer (LPTIM) drivers.
This new variant is managed by using a new DT compatible string, hardware
configuration and version registers.
It comes with a slightly updated register set, some new features and new
interconnect signals inside the SoC.
Same feature list as on STM32MP1x is supported currently.
The device tree files add all instances in stm32mp251 dtsi file.

Changes in V4
---
- Simplify IIO trigger driver as per Jonathan's comments.
- Rework clocksource driver: encapsulate mp25 changes in separate function
  after Daniel's suggestion.
- Add some definitions to MFD header.

Changes in V3
---
- Yaml indentation issue fixed, reported by Rob's bot

Changes in V2
---
- Review comments from Krzysztof
  - Adopt compatible fallback in dt-bindings and driver
  - drivers: drop "st,stm32mp25-..." compatibles when unused (e.g. no .data)
  - counter driver: no update (patch dropped)
  - defconfig: only enable the necessary config for upstream board
  - add lptimer DT node in stm32mp257f-ev1 board
- Add missing management of IER access for stm32mp25

Fabrice Gasnier (7):
  dt-bindings: mfd: stm32-lptimer: add support for stm32mp25
  mfd: stm32-lptimer: add support for stm32mp25
  clocksource: stm32-lptimer: add support for stm32mp25
  pwm: stm32-lp: add support for stm32mp25
  arm64: defconfig: enable STM32 LP timer clockevent driver
  arm64: dts: st: add low-power timer nodes on stm32mp251
  arm64: dts: st: use lptimer3 as tick broadcast source on
    stm32mp257f-ev1

Olivier Moysan (1):
  iio: trigger: stm32-lptimer: add support for stm32mp25

 .../bindings/mfd/st,stm32-lptimer.yaml        |  40 +++-
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 177 ++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |   8 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clocksource/timer-stm32-lp.c          |  51 +++-
 drivers/iio/trigger/stm32-lptimer-trigger.c   |  75 ++++--
 drivers/mfd/stm32-lptimer.c                   |  33 ++-
 drivers/pwm/pwm-stm32-lp.c                    | 219 +++++++++++++++---
 include/linux/iio/timer/stm32-lptim-trigger.h |   9 +
 include/linux/mfd/stm32-lptimer.h             |  37 ++-
 10 files changed, 594 insertions(+), 57 deletions(-)

-- 
2.25.1


