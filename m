Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852D7C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mmod6GyCvN+xKlhUHyHmJv0MBU3r0IJh4g+WMqECjq0=; b=G7PFvsbOuA862nNghH9dJ7jf45
	oF4tlN3aV2zre6rpZD6hlAZWryGHl6yK2dGSCpRtJu47aCGYCLpdor43x2d2WcXhk5vJe6jdr/yHH
	ebpX/v5NHjsEgt40TS38s33dguz/BE837Y3h2iIkx0Qixa4biNAx2pkm7ATrVFZ+h9tFmaNofTeCY
	qALpMVYpfHWKWeMIRP20/rMWUeLVday7H+9l2e6egq572qBPcHGQxUfiAbyJbnDyRDTbEpDxZwNAH
	fG3OSGvInemhvnyIHrVU1nSo/fu494/5c+rUrM/FjsHWOo4/wSRgk0dTETlUZa+HXtTQ3G9x75KJ4
	sEb/k11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4Kv-00000007syB-20f4;
	Tue, 10 Jun 2025 19:08:41 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0m5-00000007HJo-09cj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:20:30 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLCla032162;
	Tue, 10 Jun 2025 17:20:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=Mmod6GyCvN+xKlhUHyHmJv
	0MBU3r0IJh4g+WMqECjq0=; b=wYYLTwM3L6iIUCZS1+O47DnT0JkqnRBQs8N65t
	Jfi6VIeQ+/uqzBwuXX6D0HmqlPF2kOSodqn22MXTD9ciWwL4Ad+QWixdo6J/cXR5
	ylcswSsjRIFnH6aXlBTs5zfib4lYDUk73yMDhGrCZ45tBKUkDUJzUqCOapQMeyny
	kHsV8Nnkd7SlNfnurpE0SmZ+hcKrQtcPXInzdV1KTR25uH/Ledhek6TIq30szpvy
	e5SqWOqLKqzqVIuDEc5H8pQ0nIrqUu+H0sgQS0zsbOcsNWZp9iRJN9sZ3/57p2dd
	Z4u2knkBQ/Hjhs0yfA61NYcoNbmdDqSuMKOaWMfCdUJ49dkA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4750cntpqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:20:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 01D3240044;
	Tue, 10 Jun 2025 17:19:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAC0DB7450D;
	Tue, 10 Jun 2025 17:18:41 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:18:41 +0200
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
Subject: [PATCH v2 0/5] STM32
Date: Tue, 10 Jun 2025 17:18:32 +0200
Message-ID: <20250610151837.299244-1-antonio.borneo@foss.st.com>
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
X-CRM114-CacheID: sfid-20250610_082029_359942_F9AECFCA 
X-CRM114-Status: GOOD (  10.96  )
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


