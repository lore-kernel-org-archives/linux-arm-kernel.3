Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3971C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Y7qy82W/MHyCEGXEwG2LmtsCr2HxaEkUE++ooAr6hc=; b=yNg9UTZoJmEEug
	/5ZH/cHI1+wISJW6u2VEBIfoxbWPEC0bf4PfFNT9zWmGfb4igk2cbxIDE59L+np8/HbSE0oPyeadz
	yR07SsM/IJLkWgWRVGbhQGuBiRO62Heo4HkkfAtXrTLaGDUWmjRtY8LF7Qw5+ied9VIdaxrxvy20f
	/dj/PMTnuwAjXaRtrFGOqDH7Ok1IvY9fgAt/HzUovAY5p2zKcsOZcNcFYJu0UkopW3opS+bvGHk2P
	hVlkaZQpxeqJ4PH4ihentuYg3ycztkS68lhG6PYGVkHS9Is81uZOTme1hRpDYVWul1PL/O4RDu80i
	k9xoJcFwr9gMFs1uFKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZct-0000000EWb2-3jgd;
	Fri, 21 Mar 2025 10:29:19 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYx7-0000000EQDG-0bl2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 09:46:10 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L7Wugv022748;
	Fri, 21 Mar 2025 10:46:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=7Y7qy82W/MHyCEGXEwG2Lm
	tsCr2HxaEkUE++ooAr6hc=; b=sieHespPBE871IVXmcCJp+MWOXdP3dKvauL2JH
	uH2kHRNpgYjjk/PEp2QM+uM9HNDZLOdV8neSNY1zHNfcNpYV5UPPl317EXHk6s1c
	WwfRXK97/VQ/q9kmPWXO4orkhNhtW3om4yrRtQL23HAIk1BkaCymJ0Ftv3oOTULb
	lVZauc43F8dN6q+DUCiYVsDThhi/ZyFNpfj7+8Dr3a+NGIo7TWJEKU9rqqLaGXke
	sdf997s7G3LHsteRcbyjar1CZ8y7k0qWIoowlbnUmlGXfTSplgV+qqC4yLw8VZwv
	czADI3at8qrExPMvdxFM6DSNuB1Ecw0HT0z8iC/wyvbaVeAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45h3tqrq41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 10:46:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CBA5D40051;
	Fri, 21 Mar 2025 10:44:55 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA89F7C17B5;
	Fri, 21 Mar 2025 10:44:06 +0100 (CET)
Received: from localhost (10.252.27.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 10:44:06 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH 0/2] spi: spi-stm32-ospi: dt-bindings fixes
Date: Fri, 21 Mar 2025 10:44:05 +0100
Message-ID: <20250321-upstream_ospi_required_resets-v1-0-9aa4702e3ae2@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOU03WcC/x3MQQqDQAxG4atI1h0wo9XSqxSRUf+2WajTREUQ7
 97B3fs27yCDCoye2UGKTUzmKYFvGfXfMH3gZEgmn/t7Xnh2a7RFEcZ2tiit4reKYkhhWMwVZXh
 0XFfMXUXpERVv2a//qznPP7YLko5vAAAA
X-Change-ID: 20250321-upstream_ospi_required_resets-34a8b17611b6
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <christophe.kerello@foss.st.com>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.27.50]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_04,2025-03-20_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_024609_477886_D25E8E70 
X-CRM114-Status: UNSURE (   7.53  )
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

Make "resets" property mandatory.
Update spi-stm32-ospi driver and dt-bindings accordingly.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (2):
      spi: dt-bindings: st,stm32mp25-ospi: Make "resets" a required property
      spi: spi-stm32-ospi: Make "resets" a required property

 Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml | 1 +
 drivers/spi/spi-stm32-ospi.c                                 | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: e94bd4ec45ac156616da285a0bf03056cd7430fc
change-id: 20250321-upstream_ospi_required_resets-34a8b17611b6

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


