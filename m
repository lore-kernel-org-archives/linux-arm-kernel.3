Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFC1C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=caTOVoBOyF0MRwCSZLjQta/N2cLC0otSKq3vfvnJa1k=; b=hc6OTd4tjkriqFFi7Pr66HeUiw
	lErLDSLP+K7zWpTpeogXjLfy7SR48h9bhwzMi9bLz+L0esu/cINPY365Ucz1uJAh7z/MKtizDJULR
	Tu29wQQ55h+VC75TNqgFimg9anRSTQPWnRA6NoSCoUoVM9cBlnTxSI6U9qPW2F/0Kobe/06PnkNqT
	Ezqh8z189oJwc4679AZcHn4la9kz4maoDSoEDcYfnBmlpyvMqhxqH6DVih5RJpoBRXy9JrM8qYKxY
	+xLdyaEupfZ6hnjw1uMOuebJ5pxMPYZXCnkJq9EjafxICWl6gJR2k9Zp/bpOYDK9cOME1dZIpUYvS
	cP3+UhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmd2Y-0000000Em3d-3LJM;
	Mon, 24 Feb 2025 18:18:50 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcxp-0000000ElAK-2iep
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:13:59 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OEnHnD025112;
	Mon, 24 Feb 2025 19:13:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=caTOVoBOyF0MRwCSZLjQta
	/N2cLC0otSKq3vfvnJa1k=; b=hZxP1mkOfRngm5RL60oLFe+P5QXMX3xTexdEVl
	r2x+eIpTbr7WghKVqnotLaXzBtP6Rwc0rK2iaYAzfTPvP/1N2WjcCvTxOKxYiY7G
	XkHVYMbIj5x8BRGk4Vx3RFTNHG0geClTz3Nwtbt8CWV5BuMxEQN9/Nv8Ae07hbEQ
	bgVCLpfVaZC/MAQT8ofiOJ4hdIY8UdeT9pT8F/uOoYja0yCiSU4rrSZCLleGdNLj
	2RMUTlYrTbogHnZlDnzp6RNWXKFkxIyh8Qf08PY7THwYRdpW7pHUWfMTCCsDMqDu
	ofjozVhCqDtpQYr6YLbNy1l5kzi1u5kq687RXGSbjaH6HSIg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44y6bh0hwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 19:13:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8D8B440046;
	Mon, 24 Feb 2025 19:12:25 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C9221544742;
	Mon, 24 Feb 2025 19:02:29 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 19:02:29 +0100
Received: from localhost (10.252.23.75) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 19:02:29 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <wbg@kernel.org>, <jic23@kernel.org>, <daniel.lezcano@linaro.org>,
        <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH 0/8] Add STM32MP25 LPTIM support: MFD, PWM, IIO, counter, clocksource
Date: Mon, 24 Feb 2025 19:01:42 +0100
Message-ID: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.23.75]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_09,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_101357_977236_709210D4 
X-CRM114-Status: UNSURE (   9.39  )
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

This series adds support for STM32MP25 to MFD PWM, IIO, counter and
clocksource low-power timer (LPTIM) drivers.
This new variant is managed by using a new DT compatible string.
It comes with a slightly updated register set, some new features and new
interconnect signals inside the SoC.
Same feature list as on STM32MP1x is supported currently.
The device tree files add all instances in stm32mp251 dtsi file.

Fabrice Gasnier (6):
  dt-bindings: mfd: stm32-lptimer: add support for stm32mp25
  mfd: stm32-lptimer: add support for stm32mp25
  pwm: stm32-lp: add support for stm32mp25
  counter: stm32-lptimer-cnt: add support for stm32mp25
  arm64: defconfig: enable STM32 LP timers drivers
  arm64: dts: st: add low-power timer nodes on stm32mp251

Olivier Moysan (1):
  iio: trigger: stm32-lptimer: add support for stm32mp25

Patrick Delaunay (1):
  clocksource: stm32-lptimer: add stm32mp25 support

 .../bindings/mfd/st,stm32-lptimer.yaml        |  23 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 177 ++++++++++++++
 arch/arm64/configs/defconfig                  |   5 +
 drivers/clocksource/timer-stm32-lp.c          |   1 +
 drivers/counter/stm32-lptimer-cnt.c           |   1 +
 drivers/iio/trigger/stm32-lptimer-trigger.c   | 109 +++++++--
 drivers/mfd/stm32-lptimer.c                   |  30 ++-
 drivers/pwm/pwm-stm32-lp.c                    | 220 +++++++++++++++---
 include/linux/iio/timer/stm32-lptim-trigger.h |   9 +
 include/linux/mfd/stm32-lptimer.h             |  32 ++-
 10 files changed, 554 insertions(+), 53 deletions(-)

-- 
2.25.1


