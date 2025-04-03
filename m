Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C0AC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8m5hxedZPYuA8gq9KPkzlAoP1ev25Kezn0E2Hh0fGw8=; b=HXbSziQL0HzN4rq8rMHQ37hi8R
	+95zB3dmJ2A66wne6DMYX4AiCkI4aE1/69Dz4x21A9z5cpAArCMqvNp4rl4r5RB9aUQhpcds3FtFU
	mLipBvK38EB/ZFmJix6iV1b+h0IRgBFyNksH9SE353pFfAoUWZQjcCYYV68ApKMsjBjjhjULtnE6V
	Cto3KdFlBC2htA3GkaN8FbWpPfKJddHA/KmUkc7g2SBwlCmsj8lmJUCU0asdqVVc4aNRNYw+NOEn5
	GZmyaXR97DFD8J7ICFvPkxV/Tdr2EO82GYrPNFOHUsWSzCpL+5wKQtDYn0P30GYB2FsuZe7h5UMoR
	0qsQKPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JNN-00000008n2o-3EpV;
	Thu, 03 Apr 2025 12:08:53 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JIA-00000008mRY-1MDg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 12:03:31 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BgbZu010583;
	Thu, 3 Apr 2025 14:03:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=8m5hxedZPYuA8gq9KPkzlA
	oP1ev25Kezn0E2Hh0fGw8=; b=zlxgjrBE3HY+eChJOvKwqgPNoSbZyEL4kL+0vq
	64iD3ukrZJaVjDs3WN9weJKSbYhvAlXEq8y/qvpEP8QtlNeDWN6baukmWeS1WSQv
	T9d3GSr1Zfmh+isctuCbUMgYR0TP3tUZEE5cS1qLX3GU5b2ZK/Vrg3dtcTJLqxlb
	7HX96HU/h6FljGvv48g4OAVNT5hu5tk5lt2ouDjFTvr1XMDng2tl+o2LKdKSf/dq
	Gr2TwnNm7dXFdIevpNcDWoUguEMKKrvxu159Hb/0/Hsu/WO/CEBpAxY5ql4FQYjf
	nJepm5f0OJ1TCsUPyusAupJN/gfUaGVOCSCW/297XPqIYFpA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2cte9ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:03:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9605240084;
	Thu,  3 Apr 2025 14:01:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A2BC8E3169;
	Thu,  3 Apr 2025 14:00:11 +0200 (CEST)
Received: from localhost (10.48.87.151) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:00:11 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <fabrice.gasnier@foss.st.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Olivier Moysan <olivier.moysan@foss.st.com>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ARM: dts: stm32: add vrefint calibration on stm32mp13
Date: Thu, 3 Apr 2025 13:59:52 +0200
Message-ID: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.151]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_050330_658977_2020E4C1 
X-CRM114-Status: UNSURE (   7.72  )
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

Add vrefint calibration data in STM32MP13 device tree to support
STM32 ADC internal channel VREFINT.

Olivier Moysan (2):
  ARM: dts: stm32: add vrefint calibration on stm32mp13
  ARM: dts: stm32: add vrefint support to adc on stm32mp13

 arch/arm/boot/dts/st/stm32mp131.dtsi | 5 +++++
 arch/arm/boot/dts/st/stm32mp133.dtsi | 2 ++
 2 files changed, 7 insertions(+)


base-commit: 65954899a157832f68536b488194cf698248a26e
-- 
2.25.1


