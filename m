Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF02BE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjXTcsvIAL+4FtVS8P5fKPwNHbwBgsvtSCaYyw6ZUH0=; b=laxG3Sx7HVfHl947O7UAkGK394
	CJRftmERldfPZHricaTFysaZBq5uE5J7dokOQYRLmW0u1xY2ZG2yofPoSODCxf64PqJLIwxSRMb3h
	F2U7LamhLIWqjPNCgXAW9zEdxlrzh6Rn40FjZmB1ETH46XFRcs88pEZshRJb5tHij3KoiYUvEAUHb
	8siznzOU5TrNtQJPGp8LT50Zwo1Im5U/jB8NJ4u+fRQdw3FtMR+fmmMsI0kwyP3UwRTvsSYxRWVdL
	8C1Dyy3dBn+vgeQ6dgCCVbiyyBjKrvTPtSi/Q63+R/3l30xIGC62JW4qLAWrpRtLmdu+LGZsjx11o
	KOSrK2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNq41-0000000G1iy-1Qaw;
	Wed, 18 Dec 2024 09:09:53 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpzJ-0000000G0f3-2I7P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:05:02 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6mX9M021743;
	Wed, 18 Dec 2024 10:04:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	OjXTcsvIAL+4FtVS8P5fKPwNHbwBgsvtSCaYyw6ZUH0=; b=dA9VAuQBHQ0H8jVP
	isucuDq+uF8uUS+1aF20um23q1oEi94lFruIi1mpmvSg4UNm/nZ3cwg8jYvk9Th+
	2PlZamjknXS3t23xQUnz1DYx4Ss8JOMvTK0wUMpLnbwwYJTYDsW/TdP3Rnmpbhkv
	gNoFRtyFx1lsqRPB/5hzv0q7YPYhvUYWzGYNlGPugS/YDChR7Nc86eFn5mkhNIWc
	29Y9zUgdyjl8Q3N9r6NUY2JIVTzfExxQmZsF3rBfBpNBbG4PR8Hhz3nCr/wunuRz
	wFuZMNsX0LaYa4gf1vMBWs//6tP9ZPPw4XPJI4oAJRHxw4Qh2Q1Qq2I3lx8fPq7T
	6ZO5wA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43kfu8a4up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:04:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E861040076;
	Wed, 18 Dec 2024 10:03:57 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40AEF25E677;
	Wed, 18 Dec 2024 10:02:59 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:59 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:58 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <wbg@kernel.org>, <jic23@kernel.org>, <ukleinek@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
Subject: [PATCH 6/9] arm64: defconfig: enable STM32 timers drivers
Date: Wed, 18 Dec 2024 10:01:50 +0100
Message-ID: <20241218090153.742869-7-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
References: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_010501_867628_4CE26977 
X-CRM114-Status: UNSURE (   9.46  )
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

Enable the STM32 timer drivers: MFD, counter, PWM and trigger as module.
These drivers can be used on STM32MP25.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..d6aabdc103d7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -764,6 +764,7 @@ CONFIG_MFD_TI_LP873X=m
 CONFIG_MFD_TPS65219=y
 CONFIG_MFD_TPS6594_I2C=m
 CONFIG_MFD_ROHM_BD718XX=y
+CONFIG_MFD_STM32_TIMERS=m
 CONFIG_MFD_WCD934X=m
 CONFIG_MFD_KHADAS_MCU=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
@@ -1499,6 +1500,7 @@ CONFIG_IIO_CROS_EC_LIGHT_PROX=m
 CONFIG_SENSORS_ISL29018=m
 CONFIG_VCNL4000=m
 CONFIG_IIO_ST_MAGN_3AXIS=m
+CONFIG_IIO_STM32_TIMER_TRIGGER=m
 CONFIG_IIO_CROS_EC_BARO=m
 CONFIG_MPL3115=m
 CONFIG_PWM=y
@@ -1516,6 +1518,7 @@ CONFIG_PWM_ROCKCHIP=y
 CONFIG_PWM_RZ_MTU3=m
 CONFIG_PWM_SAMSUNG=y
 CONFIG_PWM_SL28CPLD=m
+CONFIG_PWM_STM32=m
 CONFIG_PWM_SUN4I=m
 CONFIG_PWM_TEGRA=m
 CONFIG_PWM_TIECAP=m
@@ -1650,6 +1653,7 @@ CONFIG_INTERCONNECT_QCOM_SM8650=y
 CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m
+CONFIG_STM32_TIMER_CNT=m
 CONFIG_HTE=y
 CONFIG_HTE_TEGRA194=y
 CONFIG_HTE_TEGRA194_TEST=m
-- 
2.25.1


