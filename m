Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E26C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ToFVU9D0kJNOUVuQ9UJi9Bxt0XxkB1xPx18ssjBYmrE=; b=umixWygXvqiFeX
	gXuvonwhlbQ0kIWiwmnsd1h+3n+EcR9hXNUtaqN2HzPvTgmuCEkKbbZnKE4VVXWQR43AYm6ejQ8pG
	4x6iCq4xFByYu2dD5LD73BwA7fGbHb9Gni46HAloLh8VpKDNPBhucr/H2V5HOctXwaB4gRZyT7E3N
	8qMgnAswPqK+xp+aBYikNYHm/PCEyX7dw9dW/Tkr3XmhWKBirKZtbtP7Nnk6KpvkbXlfZOAdGjfJA
	yJTTz668wdXS00CDI8DoKmrirg1LwQWsvEsR9/TiP962PcIMRkUXt2b4xjwNAW+sAolAM8qVqNHs2
	X4vXA0n/7iSSUwsCmibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KJS-00000005X3v-1Q1m;
	Mon, 28 Apr 2025 08:58:06 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K4t-00000005V0j-0VVF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:43:04 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S11AlL010275;
	Mon, 28 Apr 2025 10:42:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=ToFVU9D0kJNOUVuQ9UJi9B
	xt0XxkB1xPx18ssjBYmrE=; b=qMY1A8KCvC06tdGpOMDtLnwr5pI1X1/Q1B1q+w
	0bPw5LMf9CbVxtCBOrtFXJWu9nVRVYndDfGgqh8BtU2r4nSS+gttrGRIrYGVQpuV
	p6gxg3mexbGS0iWdV1RPCmurva3KUy8mR5ydMsmvp6EXxDdM+RJLXnBPKXzc586T
	iEGJ7QBFO4XEe+sUfZOOyWsbzircPMmjcoslXREiurtXdJDEzW1OEqTJtkjb9Unn
	Q2DBujChnsAWADXd9Ip3DmLjBobcpwj4PNG8LnEoBxFhBdOIG6C1tqlUWNJYZfFQ
	vJMghCgvlEtOzX0E1ISRyq1/9zlgxRbriEk+my6rEF3KFKbw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcg5njj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 10:42:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1F79640055;
	Mon, 28 Apr 2025 10:41:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9456A3D589;
	Mon, 28 Apr 2025 10:40:44 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:40:44 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v9 0/3] arm64: dts: st: Add SPI NOR support for
 stm32mp257f-ev1
Date: Mon, 28 Apr 2025 10:40:20 +0200
Message-ID: <20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQ+D2gC/x2MMQqAMAwAvyKZLcSiSP2KiNQaNUNraVQE8e8Wh
 xtuuHtAKDEJdMUDiS4W3kMWUxbgNhtWUjxnB426wbpCdUY5Elk/7j4jkcf5EIX1ZFrnUFOjIbc
 x0cL3/+2H9/0AznUuTWcAAAA=
X-Change-ID: 20250410-upstream_omm_ospi_dts-04b97cc02e52
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_014303_434438_E80A4963 
X-CRM114-Status: UNSURE (   7.66  )
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

Add SPI NOR support for stm32mp257f-ev1 board by adding:
  _ Octo memory Manager node in stm32mp251.dtsi
  _ OSPI port1 pinctrl entries in stm32mp25-pinctrl.dtsi
  _ Add SPI NOR support for stm32mp257f-ev1.dts

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Changes in v9:
  - split patchset by susbsystem, current one include only DTS related
    patches.
  - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com

---
Patrice Chotard (3):
      arm64: dts: st: Add OMM node on stm32mp251
      arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
      arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 51 +++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 54 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 32 ++++++++++++++++
 3 files changed, 137 insertions(+)
---
base-commit: 65954899a157832f68536b488194cf698248a26e
change-id: 20250410-upstream_omm_ospi_dts-04b97cc02e52

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


