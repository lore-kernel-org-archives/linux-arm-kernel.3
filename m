Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA94C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 10:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1VW7Pa1Gidi9hXrAppAz/zYkvYMUMSpLtKQNgis2pAs=; b=lyH0F2meLSFF6t
	HyJ7BfS+J4X8MMBmW/u0wEMy6i7jZoZ3mD/wy/sJxPIGmsDIRn8uvpOhwfosAKkTnH+jYlTX+aFCt
	irvXKXVnsv9H7tBPMhLyyju99kqD83DYpkCdy0kdzvAbFu/aWlBgr7jaDnw5UOSiAdmb7TA9Uem95
	PH5n7/S8VezH53MU8r+wBuezO+tcK+N5c4ikQ/iFa5buf4y67N3kSLV4z3BLfCstDk/dDxZzDCwQp
	0ZU7Mv2VW5Mti5JFCN5tiqQ2yrDouny+g0qbzoIxqnQ6PO+qOY+FFumcHKhefSPvh6caDyRPGWsHs
	v+pmJ88n+J2h12QD88lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6gA-0000000418H-2pmJ;
	Mon, 16 Jun 2025 10:03:02 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR649-00000003uRJ-2KZ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 09:23:50 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G9HgW0009690;
	Mon, 16 Jun 2025 11:23:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=1VW7Pa1Gidi9hXrAppAz/z
	YkvYMUMSpLtKQNgis2pAs=; b=nGvHoSK9r/Yv+tQd5+u/IYuDVPowaAxR9jB+y0
	vlFUl5YmxwhAFmmMOnSBe0HXaK873nI7ZKsuE/QeZnoyw7h/O8he9jPCHdwhwBB8
	KLWxnl0Ed5wFb7wuZb2gnPKpzjqd1Jtpl04pOvadm1ujCNCIiKKLnvWKKaFUc/pz
	1i68Ewwmpq4hsBo4HQ/MW4U0hzy7UZRtLaW2zcxCwLpJosjF2o7ejNmaE0SGwEXm
	gGNxgJawgJRnsURShoR873GPTgiJj+aids0ojLnl4ZR/NfckPVmFrNq4ssz0iMh9
	ssh/zSut0yPiF5ILulMaUrudg5tkq1ZtkCHy2TYflWRIF2/Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 479jn4mm6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:23:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 075084005D;
	Mon, 16 Jun 2025 11:22:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9066FAA69AC;
	Mon, 16 Jun 2025 11:21:06 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:06 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH 0/6] Add few updates to the STM32 SPI driver
Date: Mon, 16 Jun 2025 11:21:01 +0200
Message-ID: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP3hT2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3eKCTN3SguKSotTEXF3DpEQTC4sUC0OTVHMloJaCotS0zAqwcdG
 xtbUAWkKrH14AAAA=
X-Change-ID: 20250527-spi-upstream-1ba488d814e7
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Erwan Leray <erwan.leray@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
        kernel
 test robot <lkp@intel.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_022345_870734_49E64F62 
X-CRM114-Status: UNSURE (   7.65  )
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

This series aims to improve the STM32 SPI driver in different areas.
It adds SPI_READY mode, fixes an issue raised by a kernel bot,
add the ability to use DMA-MDMA chaining for RX and deprecate an ST bindings
vendor property.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Clément Le Goffic (6):
      spi: stm32: Add SPI_READY mode to spi controller
      spi: stm32: Check for cfg availability in stm32_spi_probe
      dt-bindings: spi: stm32: update bindings with SPI Rx DMA-MDMA chaining
      spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use
      spi: stm32: deprecate `st,spi-midi-ns` property
      dt-bindings: spi: stm32: deprecate `st,spi-midi-ns` property

 .../bindings/spi/spi-peripheral-props.yaml         |   1 +
 .../devicetree/bindings/spi/st,stm32-spi.yaml      |  48 +++-
 drivers/spi/spi-stm32.c                            | 310 ++++++++++++++++++---
 3 files changed, 325 insertions(+), 34 deletions(-)
---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250527-spi-upstream-1ba488d814e7

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>


