Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE938C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5Tvhn8A9wvlhyeA7dmIZaaAQOCoRp93WSAR9jXgEio=; b=Q2XNMiyDNT4Vx+26u25qI3vCq4
	IUaqi0lXO4SpOGDj/mCLxyTiVbUXLLSBS1FNwGPRR6yzhTARXqay6Wm2uzE4E99YXD01ciZisadqZ
	B1wdZRPtJZkizZkAJIw9gFKygPbjKDg7LqC6Wr9gaMK9PQ2Tx2x1Zytw4Dosf8XDZM8yyDRDOMjjg
	0SC7J34+2pjxBH4KdkmyG1X4tWBHYXpcHcfrRjnvKm3YgXy2bzmsTJptegqEH1K8QBmwehrmLFh4k
	abUT/7YW2EjFVuAG5DdPOCt92EwjrAgc0gfom+xGM5SlVJYTnzt94Bjp4yOJH+ZBTTUNEg1dRFMoz
	aumlABxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVkF-00000000K1h-1lf1;
	Mon, 10 Feb 2025 15:30:47 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVeS-00000000IO1-2cSB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:24:49 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AF0p8m016534;
	Mon, 10 Feb 2025 16:24:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	b5Tvhn8A9wvlhyeA7dmIZaaAQOCoRp93WSAR9jXgEio=; b=q5YjC4OuiPEhaac7
	9uW8Ge9s5oLc4le55343PJpmhflXPx4+udSe6AZF85fF2fFtBdVFDb4NhTSGjkzZ
	clREgdqrFhpIrT7pHKxo89LXANbrqD35MUaPK5weRVw2Fj3tCU4a3aiyj3Db9CkB
	dYtN9ycQmo3MFJgf2LjA31aNhtjCb68C1p2J3GF2hUzTVWwZXUTObejWUa1HTwP4
	tioQyf8DK6lUBI5cBespV3RmpdyoO8k7cTdWmj6izF/2L9ei5opwDorpkhNCmmx+
	gNgp3IXuxJ54SX3La5VxH0mCZRb8Ua3IZrJE1F9y0uyXI2VswIiIrGknAOmk73f3
	/WnDnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0rhy5sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:24:41 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9065B40062;
	Mon, 10 Feb 2025 16:23:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D49E62957AD;
	Mon, 10 Feb 2025 16:21:41 +0100 (CET)
Received: from localhost (10.48.87.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 16:21:41 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Mon, 10 Feb 2025 16:21:01 +0100
Subject: [PATCH 07/10] arm64: Kconfig: expand STM32 Armv8 SoC with
 STM32MP21 SoCs family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250210-b4-stm32mp2_new_dts-v1-7-e8ef1e666c5e@foss.st.com>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_072448_968214_2DE7A743 
X-CRM114-Status: UNSURE (   7.77  )
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

Expand config ARCH_STM32 with the new STM32MP21 SoCs family which is
composed of STM32MP211, STM32MP213 and STM32MP215 SoCs.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm64/Kconfig.platforms | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 844a39620cfea8bfc031a545d85e33894ef20994..f788dbc09c9eb6f5801758ccf6b0ffe50a96090e 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -325,6 +325,8 @@ config ARCH_STM32
 			- STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
 		- STM32MP23:
 			- STM32MP231, STM32MP233, STM32MP235.
+		- STM32MP21:
+			- STM32MP211, STM32MP213, STM32MP215.
 
 config ARCH_SYNQUACER
 	bool "Socionext SynQuacer SoC Family"

-- 
2.25.1


