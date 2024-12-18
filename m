Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE42E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMDYAqPUlLt/uQuP5vZpK9yRBbdZHFpelAHBXteQuJA=; b=s83ZlYiuyqS/95GOSbWUwlsg9J
	g/IcWFk4ewM4KKvd+S34oB8QEg0eu64qTrnBSzcuFscgsClVigjzyPu0Xl9InlAn79VpDkO33i8yy
	H/3X5lZH5Z+uPg4m/o1DZY8yT0E3sn023UqGbVFfyxJo/0Ncbc0m6/7F9pDaN3kFZZKgdiQQxuF3H
	EPlWlvzpEkxf/Fwf40ODUIHxHspO8wn1vfIew/cx5tv9QVlAaai3f3cKxoQRKElP79FAVGxedVwcW
	k6LV9FgtexWIAvKAp1ZxfCrblnVybY6o/TdRcekw4VpAJGknLz19P8/Qas7rhNqQ+bu534XWl1ilC
	Bi3Y/AOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNq69-0000000G2Dz-3Ml3;
	Wed, 18 Dec 2024 09:12:05 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpzK-0000000G0fE-3NJt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:05:04 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI7Hs46023628;
	Wed, 18 Dec 2024 10:04:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dMDYAqPUlLt/uQuP5vZpK9yRBbdZHFpelAHBXteQuJA=; b=fRKpb99TT+YkM2IU
	Ttlzrhg96C9CwhZfthg6HdmpHcbRKo8GOYUP+TWaE3Uh7AhHz0Q7UYFr1/tsBwyI
	3Pn8jPunTI2gT67FUy2pAgP9ewbEpR+DKJ9kkgz1ysc3GkD2f6BCszkzSxHgARk4
	u43sQikxUGZ1pL/KYGAiIVYo1ixxhFSNcgdRpiHp9hG8tiy5chNChmZ4eFF0Zzmk
	/ym3B3z7jQ4FzGUOu47XoBUh+UIW+08grmIiTTmBaqOwqpHJovp1EmK7PDbrSGxV
	rfoAzKzgwgMZEUmtm7gsV1CyvZHUq4F59766FG+Ts9o8k+U1a9kRCQKKlKnkRajo
	x9zcOA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43kfu8a4un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:04:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3B56340073;
	Wed, 18 Dec 2024 10:03:57 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCB6E25FAF2;
	Wed, 18 Dec 2024 10:02:57 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:57 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:57 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <wbg@kernel.org>, <jic23@kernel.org>, <ukleinek@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
Subject: [PATCH 4/9] counter: stm32-timer-cnt: add support for stm32mp25
Date: Wed, 18 Dec 2024 10:01:48 +0100
Message-ID: <20241218090153.742869-5-fabrice.gasnier@foss.st.com>
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
X-CRM114-CacheID: sfid-20241218_010503_122193_9039917B 
X-CRM114-Status: GOOD (  12.89  )
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

Add support for STM32MP25 SoC. There are new counter modes that may be
implemented in later. Still, use newly introduced compatible to handle
this new HW variant and avoid being blocked with existing compatible
in SoC dtsi file. Modes supported currently still remains compatible.
New timer 20 has encoder capability, add it to the list.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/counter/stm32-timer-cnt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index e75b69476a00..3d3384cbea87 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -669,12 +669,14 @@ static void stm32_timer_cnt_detect_channels(struct device *dev,
 	dev_dbg(dev, "has %d cc channels\n", priv->nchannels);
 }
 
-/* encoder supported on TIM1 TIM2 TIM3 TIM4 TIM5 TIM8 */
-#define STM32_TIM_ENCODER_SUPPORTED	(BIT(0) | BIT(1) | BIT(2) | BIT(3) | BIT(4) | BIT(7))
+/* encoder supported on TIM1 TIM2 TIM3 TIM4 TIM5 TIM8 TIM20 */
+#define STM32_TIM_ENCODER_SUPPORTED	(BIT(0) | BIT(1) | BIT(2) | BIT(3) | BIT(4) | BIT(7) | \
+					 BIT(19))
 
 static const char * const stm32_timer_trigger_compat[] = {
 	"st,stm32-timer-trigger",
 	"st,stm32h7-timer-trigger",
+	"st,stm32mp25-timer-trigger",
 };
 
 static int stm32_timer_cnt_probe_encoder(struct device *dev,
@@ -846,6 +848,7 @@ static SIMPLE_DEV_PM_OPS(stm32_timer_cnt_pm_ops, stm32_timer_cnt_suspend,
 
 static const struct of_device_id stm32_timer_cnt_of_match[] = {
 	{ .compatible = "st,stm32-timer-counter", },
+	{ .compatible = "st,stm32mp25-timer-counter", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_timer_cnt_of_match);
-- 
2.25.1


