Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C4C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xiv+tmWQj8JxNcIFBhipf2x0bR1+XTfjHUYBtG0sdcE=; b=YUV5rBrS8IybCgVvUWm/HWcYJC
	4NdqCL0vYIl9kSnakXGcteX6Huw/DTtNExUPAwFUMWDs2sG7GmKcr/alazV0UfhGkitnM748aLrjh
	xOsxi2iIuj3PNw1mh6GG3NT7PUH6QbXzDPn6WCBkcrHiqviUgyyuCRcBQoCCgole3Mbuuxeyh0zX7
	NLaztxJ25mTBJHIvi8TJ0V5D9x/dPyEYoz0xOrXK0gtebTR1sh5alq9C6omLReNtb3KWNMtVYKE0x
	8N71XQhdRvLwHok+UnO+hlvCRa26M5Wy8oSLurj6i6aRkwlj7VwFApLo1wekJD/g3FudwvQ8Xsfrg
	lW1NJ1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXtV-000000060hR-3flJ;
	Tue, 04 Mar 2025 19:25:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWG4-00000005g7K-1bhh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xiv+tmWQj8JxNcIFBhipf2x0bR1+XTfjHUYBtG0sdcE=; b=oZlu+a1stVPF1wnNBSdzlZgp1c
	oWXnisYDOAT7PErZfIULFRMtaLwYVeOswfC55U2c2O7T3F0ljK0nTUqIp1IeHPzX21h1z8KHRfRQB
	o50Mv2lyAWin3g88yxNBIohECBkqJYAoBZDrnor+iJlpcIZBhtGISQq+un6zBOg6GvbodhR7M6j5W
	oLQGnkBFobj3OtHMwIBtrzGUzEqcxr5uJ9RbppPbOGDkt2RURhDXJUQj05GaJMORWUec5/nKm5ig+
	oh37O6quwkR+jV9d6L7S+lpKXPlGslL/fLM0ZuGztXBLcTsG8GXztQNwZtqz9jXKkFrK0kILrqJcg
	/mW69qDg==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWFw-000000008It-3LlV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:40:40 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524GGX8T004186;
	Tue, 4 Mar 2025 18:40:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=xiv+tmWQj8JxNcIFBhipf2
	x0bR1+XTfjHUYBtG0sdcE=; b=dxCjS/X045HVrPxtzpRU9FysmctxMZGVwhO1pq
	OPw6YgY9q1daiz8WEJ1bmU8tlY7SfqiPJl6Lnc5XD8dOFawOFUIh0/gFHLFeCIwn
	lhUfXBGC1MWNxMe1bgPYybnDhHljALRmxY8Hs5PBVO69PeOh9MlJzoHrxxhjhMOf
	u2HWp6W/Mmvb6kS9/XoSL5ihmFqHOVuvVE6gHD8B02IFket9q9NAN9pXCPb57yPD
	nyjerrpW2JMAljk3l5BvnBHt5XrF9dn+mKOpxahodx0NfE3NdDphrLYUsOKWe/ev
	ZYdCk+o1IuulnC/B3/bD7UsZMEftjOWJw1C0H68MlomkPieA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 454e2sf0qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 18:40:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A71C4400CA;
	Tue,  4 Mar 2025 18:39:19 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 067C0594045;
	Tue,  4 Mar 2025 18:32:46 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:45 +0100
Received: from localhost (10.252.16.143) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:45 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jic23@kernel.org>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <wbg@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v2 0/8] Add STM32MP25 LPTIM support: MFD, PWM, IIO, counter, clocksource
Date: Tue, 4 Mar 2025 18:32:21 +0100
Message-ID: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.16.143]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_174037_002193_B30271A1 
X-CRM114-Status: GOOD (  11.62  )
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
 drivers/clocksource/timer-stm32-lp.c          |  26 ++-
 drivers/iio/trigger/stm32-lptimer-trigger.c   | 109 +++++++--
 drivers/mfd/stm32-lptimer.c                   |  33 ++-
 drivers/pwm/pwm-stm32-lp.c                    | 219 +++++++++++++++---
 include/linux/iio/timer/stm32-lptim-trigger.h |   9 +
 include/linux/mfd/stm32-lptimer.h             |  35 ++-
 10 files changed, 599 insertions(+), 59 deletions(-)

-- 
2.25.1


