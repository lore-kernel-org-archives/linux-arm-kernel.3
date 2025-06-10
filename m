Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0BBC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mmod6GyCvN+xKlhUHyHmJv0MBU3r0IJh4g+WMqECjq0=; b=DLK4zb+0L1hXNbJcr0Ay/uXmBu
	AHV39axcwUr20JjKDvTt1LM4xGQ/2dW+LfT7cdgCQroiElD34gbBLc9Cfb50uX5yTv63+Z9YH69Dj
	nRLC8LSqPcYFgN7D9FGtpcNmUw4yJXhjx1793HluHKlspZ5NK8gFmSzxrc7IF3AshG/1PacZzJv7W
	CMv764u5sAxHOjtAeg6hKpasRHskMT/vXi6kuDZVvu6LaNKj93vGUCgoo015yQYiMkui4bXArhNqq
	qOFUSEJYeTCDznsCNQ6qELs+Dsn2W7uwZXxFyV1uh09p5gAp9Vgsi6jYDAO/BlpmKt9AiFl4GDkoi
	gOYPPJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3vq-00000007pPK-1Yaj;
	Tue, 10 Jun 2025 18:42:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0qP-00000007IwB-2zPb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 15:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Mmod6GyCvN+xKlhUHyHmJv0MBU3r0IJh4g+WMqECjq0=; b=A7ktVSppS6sIigGvcErojmzdn9
	StIQmqloN3FxC0zms3ZfuRWYc9I5EuCcgIKdksJjzWw2slXXJFDw2kZ1Gji9TfkEeJW1FpgQjjZ1A
	3kIeN/vzEa5KqObEtPSoeeWch3sTP63bwamzVS542z7tsEUxfQ5Lv/zcrP7Vzjt7Qz3dzPHmVeE7W
	sXYYfF9e9GebQjbrYLB1aRFVYui7K1TmMSEX4eVAnFU2yWk/6PIj0SvIcTxwOhd/ZCIp4zChLWuD8
	eT62QgCrkarocraT1v6qqWkfkNiD/WcIpYAX5qRMppUpqTXEWxSND/wRuVTHqVh4YDuKeSydBrtvO
	ncL4000A==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0qM-00000001tlS-0NQU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:24:57 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AEYo1Q005348;
	Tue, 10 Jun 2025 17:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=Mmod6GyCvN+xKlhUHyHmJv
	0MBU3r0IJh4g+WMqECjq0=; b=TpN4N10TD7/Ta96HeLV3PHeOLQVvVjlxnjEF4Z
	sUyPyu98fN+cdvqhcpjiUX2r0yiMIrvY08OU6f8qEKcFvWDRWnHzz/c0Z7kCYw7q
	rxilDs7VK+yG9zU0UVYvKBcqAt+2P6tWbeuR5YyMQPeKIKvNcJfrjn19zmAoAK08
	O1Jm8q3CgGYZvxwh0FrFIuUyVmtOwTHEmKqrdFMRteYnCd5sE2sZA9b82Luwq/J9
	js3ZeEjewG43OJ7BQJXYiLPUtFV+6gUSDlgSMm/uw200CTSYqOsayj9CxreZ4p2I
	eAh4+LZ2fAYt7D7Nuj6WPq96ZvTtWe5A86GWG6FALPnQX5Fg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2nuej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:24:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8AA5B4002D;
	Tue, 10 Jun 2025 17:23:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0B50B79BB7;
	Tue, 10 Jun 2025 17:23:12 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:23:12 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [RESEND PATCH v2 0/5] STM32 pinctrl: Add mux function RSVD
Date: Tue, 10 Jun 2025 17:23:04 +0200
Message-ID: <20250610152309.299438-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_162454_293276_2FF8E3B3 
X-CRM114-Status: GOOD (  10.87  )
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

This v2 is a subset of the v1, split-out to simplify the review.

This subset:
- introduces the pinctrl mux function RSVD,
- adds two use cases requiring RSVD,
- minor re-format of the dt-bindings.

Changes v1 -> v2 subset:
- rebased on v6.16-rc1,
- added use cases of the new mux function RSVD,
- added Reviewed-by: on 2/5 (former 04/14 in v1),
- added commit to re-format the dt-bindings,
- Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/


Antonio Borneo (3):
  ARM: dts: stm32: Add pinmux for CM4 leds pins
  ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and
    stm32mp15xx-dkx
  dt-bindings: pinctrl: stm32: Add missing blank lines

Fabien Dessenne (2):
  pinctrl: stm32: Handle RSVD pin configuration
  dt-bindings: pinctrl: stm32: Add RSVD mux function

 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 25 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 14 +++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts      |  2 ++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  2 ++
 drivers/pinctrl/stm32/pinctrl-stm32.c         |  9 +++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h         |  3 ++-
 include/dt-bindings/pinctrl/stm32-pinfunc.h   |  1 +
 7 files changed, 55 insertions(+), 1 deletion(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.34.1


