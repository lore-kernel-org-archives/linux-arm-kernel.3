Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9CCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ug/esXvlXPzNIJKb14lQ1+ZPUlmHKKmJRUVvjbEcQN8=; b=D9UQpfrh07boum7QpDfC+fHhZl
	6PfL5WQ8zTbTBO4V0ytbGLV3DemdpoCMgIvJDZbaM0ZWA5n/APFilM0/O9V75Yi1u/1gOxtlnVnmv
	rJuHf7/imU18XPaA8eLhN2eDxohavNQmJBsp3SltVkj2HspOTGsD88bJg5nFGTBH7U0qq2xw/Ehhm
	DJZgHxS1fDKrL3JnENr4J6ArsauOTWIHJzsyoShgyfqw5O2MWtmaVwCBjFJ2TVFLNfElMx3XfzjQM
	KSGCsENwEQjxK+LOlGhbICJTwrzlKduhSVsBuiu0tvnAsRNJMDLavaN0or3G9beVk56VqVtmB9BnG
	qTpcn61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBEh-0000000EgZj-0Ll7;
	Fri, 10 Jan 2025 09:23:23 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBDS-0000000EgC2-3Rx1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 09:22:08 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A3QQOU006235;
	Fri, 10 Jan 2025 10:21:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=ug/esXvlXPzNIJKb14lQ1+
	ZPUlmHKKmJRUVvjbEcQN8=; b=cGHshVnYAZgSPIuTPu4gOXOzUKK5GWcPsiYzHC
	uXWvuwaIfErhVfjTkLwkcufyaqL/ElzbJaeKQchN2ErwXs4NXUhHk491vp5WXr8Y
	F2BbbcbTT3dn/TKG01Cn7ju87Hdfb+r4HDvGjzPZMoAWjESauKKZl+3+TDqzD2t7
	vPUcTg+sLFjCG5+ntVs5TwDPnWP0LVrbvYvFLF6yEyyhVJvK5ROv4CkZ4ouFo2yH
	r5JZo2v10f4N6oRsGB+ushyh+/ZbML3zJDJhxBD5885qc2ouk7ns4naTnkFbyvuc
	qhnCtPb/4yhxZXiJnslKzdiZ49YG4jD5UDqU3/OSbM4E5TRw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 442hnxay3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 10:21:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B6A734004D;
	Fri, 10 Jan 2025 10:21:01 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 967E7289EF1;
	Fri, 10 Jan 2025 10:19:59 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 10 Jan
 2025 10:19:59 +0100
Received: from localhost (10.252.28.64) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 10 Jan
 2025 10:19:59 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <wbg@kernel.org>, <jic23@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v3 0/8] Add STM32MP25 timers support: MFD, PWM, IIO and counter drivers
Date: Fri, 10 Jan 2025 10:19:14 +0100
Message-ID: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.28.64]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_012207_152169_93576E54 
X-CRM114-Status: GOOD (  12.05  )
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

Changes in V3
---
- MFD updated since Lee's coments
- IIO patch dropped since applied by Jonathan

Changes in V2
---
- PMW driver updated to address Uwe's review comments
- Collected Acked-by

Fabrice Gasnier (8):
  dt-bindings: mfd: stm32-timers: add support for stm32mp25
  mfd: stm32-timers: add support for stm32mp25
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
 drivers/mfd/stm32-timers.c                    |  31 +-
 drivers/pwm/pwm-stm32.c                       |  42 +-
 include/linux/mfd/stm32-timers.h              |   9 +
 9 files changed, 740 insertions(+), 14 deletions(-)

-- 
2.25.1


