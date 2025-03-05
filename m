Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA63DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPWXN7XU6ij/VILhA4L2prDYWt4HSSzxWCxw+iSrXQ4=; b=VfzCA0Z+2Whj2qe/wuszCB0jbt
	NtpBT8cFd49ctKqCK8vmdQeit8itjGjxT+bAjfTWrku6jqXEynrMW4qXG5/9X/9+F17zOmRO7kLq8
	t5FKuSWPXj4Y6Y8Ly9cSYI/otjghMsGA6qtQqgxWIxlPuKRudza+ltXOieQaRBT5xPkaop6QL2Pn4
	ua3FZCLQfGOLWbhP2Fwh5LwKHmRQlsLv3AtSHL+nUXfk0U3dGWJ8ud8TwBKvTIhuE0m+rMHhsmu1/
	7DjTJVQoVygm1zHidpsVtUlVpcQWEdgJTzQ+VgUIfg5sxnrE1/7ktXecVjt7X0Sav5A54RIfVejcG
	5YT6GvDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmcJ-00000007o27-3Nnt;
	Wed, 05 Mar 2025 11:08:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplS7-00000007Zhq-0sBa
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 09:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HPWXN7XU6ij/VILhA4L2prDYWt4HSSzxWCxw+iSrXQ4=; b=CrBOMLMK26mpnmdAbULvDfbpXQ
	PfRd9ylpvMxDamYbccDbdLjZ4MjAJs3+iBnYlBv0ClEppO6aFTuvqwwl/lxN13/mkWYeMhzwMgdQy
	rmk8F6AMyZDHtO3ilxmnVhTCCDpwB2vARhQLumXTTV7J7ALyS1wjDTvRMfmBJHDGdZ0zn3j+eEAUV
	jpscaTugjZJ/rmm5Duseb+ELDMtnZN5rvhK2NWU/ZgqDw0V8bKAoDWfCKbDKZ8SSIAb7LMM4bHxH7
	4i91nT315fRnn/6YCXEVscnXUWiZ/aFHQ9ZYph8LvikwVltnEEH03Nt0hq1q7gwYdsRiwW9t/7b24
	TRPTCRHg==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplS3-00000000S3n-3Lc6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 09:54:09 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5258h91S026811;
	Wed, 5 Mar 2025 10:53:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	HPWXN7XU6ij/VILhA4L2prDYWt4HSSzxWCxw+iSrXQ4=; b=4yYu27+H0FZ0o41k
	cM7xAskr/IDPManubEqf90BwrtoDEgyArDs68oLfUOmtLpELAbvSBV9hobiLZxK9
	MetDWmT98iHVAAQsjMowciE2J5VAHFwnYfYLmvl1EK5u4KcLVGBChTMgs4EcWJoE
	p1j1pfMbQqqt1Rl9C0QLXkWCiJYiq2tGTJKvMkCzWN/lPygiOu1vrvkUBdPiqIMy
	oqMUmgT1uLak+l0NNQy1g58PZUMpttiBq7GnvKIRzow5MyIettcMznFXlH3x0942
	z+gcKMH8gIQewG5qd5XZUUV1fXhuCbeQL0LtyUuiiU54JgpXG5fZnWbdyw959d4G
	giSBJg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 453t83kqpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:53:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BA28B40045;
	Wed,  5 Mar 2025 10:52:53 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E27BA5A9E13;
	Wed,  5 Mar 2025 10:49:55 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 10:49:55 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 10:49:55 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jic23@kernel.org>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <wbg@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v3 6/8] arm64: defconfig: enable STM32 LP timer clockevent driver
Date: Wed, 5 Mar 2025 10:49:33 +0100
Message-ID: <20250305094935.595667-7-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-05_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_095408_215319_EBA5A194 
X-CRM114-Status: UNSURE (   9.49  )
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

Enable the STM32 LP timer MFD core and clockevent drivers used on
STM32MP257F-EV1 board, for PSCI OSI.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- dropped unused IIO trigger, PWM and counter driver unused on upstream
board currently, as advised by Krzysztof
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f25423de383..b29b2350ae27 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -775,6 +775,7 @@ CONFIG_MFD_TI_LP873X=m
 CONFIG_MFD_TPS65219=y
 CONFIG_MFD_TPS6594_I2C=m
 CONFIG_MFD_ROHM_BD718XX=y
+CONFIG_MFD_STM32_LPTIMER=m
 CONFIG_MFD_WCD934X=m
 CONFIG_MFD_KHADAS_MCU=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
@@ -1401,6 +1402,7 @@ CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
+CONFIG_CLKSRC_STM32_LP=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
 CONFIG_IMX_MBOX=y
-- 
2.25.1


