Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D368CC88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FfOxCoq6hjlnfJuev3I+tSYLzdUN0CTcRjc6zwTeUSQ=; b=S1USS5qXk0ANOs4IqJXj7/nVPJ
	aYfXDcaD1GD2wJDtZcnqbEcZFuqcXs1tFMPQ3gVa9YUiBPHedbJfEEmVYxLqINUYcL4T1cbzF0O8N
	j1jTlSfKqNSbEEjLO/0y9rwoD2Bm8StWxd+1KKxIFbD26krEDUevXQWvw/m65j9HvcU/JlRmqhNPt
	td6O0INl3ngWgP0TXruTO1Zv4Y8IYN1ZpEUpdF+WJ+A/lmi68Fc9DgocAHn1wLEmB7yuyjkBYImqJ
	18ZYY+hT3QFoSb1zbCW1zbTiJCCiNKI/BZaR+oV84iFhPlTpqopRnjfRbup4tlopxTmixDF1oSXpm
	HyERBPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VpT-00000007Nt1-3Yol;
	Tue, 15 Sep 2026 16:16:19 +0000
Received: from mail-westeuropeazon11010019.outbound.protection.outlook.com ([52.101.69.19] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VpR-00000007NsO-3jGa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:16:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxsxzoOh+ef8nv0WwCNY4HTO2DNj/2uLzQhdx+ijboyDlf2RnQgMgI5kZYDQys5pMddOSACzvgCq1a1ZMEA2/TEqURsKj/JdRQG8o8EmYYPSg2nC2tpHmSj8+6nuayb2amORD5dDt1mmGVpR5oIODI4p+0DztWelawMZCuvesqkYeXh1XRi02KTAbki3hzj878E0xlNBl3Xys2Dv23OAjg1fsItoudI70PltJnnJcqbAEsecdDmtZskDWrV4S+pinhs3z4J6XDIWHUA9K9/di5v25SArX7NDZ3cv0go/YbPaE4Fwe1PC879EbUHFeexCnGonDGYdIvnLOsgMlUuxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfOxCoq6hjlnfJuev3I+tSYLzdUN0CTcRjc6zwTeUSQ=;
 b=glABRBwU5NesFOlDIxoVN/yjM47bsETux/VvjG7aIdoz1pSE65Wr7DrAT7d20MeUxzpHuvHCzDJV5tKqiGR/uq2PQtZyuhxEFoV5Cc4lsKyvhsubqSUXKxpY3ywL1aQ05yDWcFuBsgsAR28WqQcQDwCY1GOm+khD67mT6+zNxtgWyDJuhc21Ju4axQqWKAkc31QLwcFYMarQQps+qKylnP19t8EWxjJV/VgKWp/gMjuj5CJuhOj82/jNnj0S4MEJ0N4wvH3AHhDDjbDNAdPXZllOyM0CrNmTL/LOTL0hIFDbKJNRIDv0my8H6VFSki+QhrABoGws2dETbrjyYD3AzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfOxCoq6hjlnfJuev3I+tSYLzdUN0CTcRjc6zwTeUSQ=;
 b=QARPcK0ywgoZHg6GCek6yhamiuXZINtqPStF9CaY/RewEy6WinBLciLVXCwU2nPcz/hRBjWOzY/j4Wbtth7XA4PCBiNduOIyF97qHopI3+boFLfjeAd6adxFFzLeOwmnkBDhCSSTK11tdBPpFXh9vsgKwHDzQiEATQYd6oLZAFpBHM7mHwn1NQaCu6kdWVgxahtFRm0v02063UYaXzw6CQ4NjRYwQpwdMQ3Exw7X97pJ0eLznPsPSBdkmhmlvljiAwlzhYvBX0GYNpUB6CWJ9n2Lfn554LjzZggvHZ8hwI3sTn0PZNn4oTUhR6lZg6v/bKfkgw3rgJrLeTpyVtmHgg==
Received: from GVZP280CA0046.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:273::17)
 by DU0PR10MB7381.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:447::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 16:16:12 +0000
Received: from WA1PEPF000099D2.eurprd04.prod.outlook.com
 (2603:10a6:150:273:cafe::10) by GVZP280CA0046.outlook.office365.com
 (2603:10a6:150:273::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 16:16:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099D2.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 16:16:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 15 Sep
 2026 18:21:40 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 15 Sep
 2026 18:16:09 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Tue, 15 Sep 2026 18:15:49 +0200
Subject: [PATCH] iio: adc: stm32-adc: fix check on internal channel
 availability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260915-adc-fix-intchan-v1-v1-1-761a1b35001b@foss.st.com>
X-B4-Tracking: v=1; b=H4sIADVvqWoC/yWMQQ5AMBAAvyJ7tklLCL4iDrVdrENJi0jE3xXHS
 WbmgsBeOECTXOD5kCCLi6DTBGgybmQUGxkylZWq1gUaSzjIieK2V8BDY27ZmoqY+kJBDFfP0fi
 mbfdz2PuZaXtPcN8PoBPj1XYAAAA=
X-Change-ID: 20260915-adc-fix-intchan-v1-3deda8cecb50
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan
	<olivier.moysan@foss.st.com>
CC: <linux-iio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Sashiko <sashiko-bot@kernel.org>,
	<stable@vger.kernel.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D2:EE_|DU0PR10MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: b6eee13e-4c5c-43f4-c7f6-08df1344a870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|23010399003|36860700016|18002099003|13003099007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 7Diy54/Qs7Z3gv9ct/wZgbbqWyE6l4/NW34jrNQk511mPcaU9+GiPoBOPTGU4h61yQSxqTiJhGMBymX8wd1UlFsVJBBg1+ocfQ7YJ2W2NLSDunGgvbyfvVq5ZyZ6quq98yIUYM6BwkTgoMisMuhjGrs3/4u7oxefXBHfmT9CqXB0f65ZUrLSs9DclRdBYhEQ80cLmYi7IGd0Hw3eyRiBlCM7YbyotK07KsmT8xY+eX5/Mn+sgubnwvFody614WtOWHNQJg7H16vEi9LALXK13r5w8B+aBtw4rkJmgpK9m5qjK17T0q1PgKt2SvrAvMkPpJOFyqmHeqU7jWwD8d+qnd/tleC21PRqniWbgeGfZjdoEZ9fYzwINUyB8QsuG5+qQd3TmjITVzqDFe73zUl+Q32B5b/gNMWrFZm87iVLUxw66MgdT553dBmlP9OvI+GCjbShsCg3jtbdO1CWnVbfQvHusrcjmaaaJ5niMK/7L+W5212iec6ENsl8BuhfG4TZDOEP6RaTtpWtt9pJvhJe0uRfXErXZb3ll/NN/B4/fq5vwnJM3ljbfb02Fe6IVrJiKvqZMrBi+iZl2jCzF65Be+XiBU9XEkxqCD/JXXybmZApFfA4lg8cMnsJkVfGn7kTTQIkAfjd7vbNaUsZafkfR1qVeNTlkDGP/z4Smmp1gRJQbL7Lw/ctzGGZBSd6jsEbE7EEfkobIAV18RLxxfde0w==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(23010399003)(36860700016)(18002099003)(13003099007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Tjo4EfdeWqVdKvsP+59ypwWXc7sbXFHPLMC/l+PcFmhsDBONne8bP/Efs+zFVmm8z5gEBSabuW8kIdhxrbKGpJWgExWMwlYV1gpboI2QoDe1rA/70jwR/4ckuzU0gqcPYVIH6seLE9MeoZRxCCh/30YU2mxwHiQ1QALMkVH/lEXaZVsDg7cF1RLzau0b+l0qmmZrwlGVOypc5SbgdekjLxmKpEdvuxStPKsW+N7a6WcpceYMdDpwQYscsDZkTPiWcoB1NeSYQnIgTKljbbsMj4bLTPWdH9geDszzhhOodYxI8Dw9bghqWjZBPkH8vF2n+eA3LdAgc36PP6H+sbm+DOXaGdPldh2yQtzO2PDbC1EIdcq3jQ//W7xn5i1y5mwBSLImBciajaJhrk9Dne+2LCq/+6zFTMZLZD6klspqUn99qR25HCRR1PZyHJMkOxz4
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:16:11.3537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6eee13e-4c5c-43f4-c7f6-08df1344a870
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099D2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_091617_940143_CAD6A141 
X-CRM114-Status: GOOD (  14.10  )
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

If an unsupported internal channel like vddgpu is requested, the driver
prints a warning but falls through and assigns it a valid int_ch below.

This causes a problem later during setup:
stm32_adc_int_ch_enable() {
    ...
    case STM32_ADC_INT_CH_VDDGPU:
        stm32_adc_set_bits(adc, adc->cfg->regs->or_vddgpu.reg,
                           adc->cfg->regs->or_vddgpu.mask);
    ...
}

Because the register offset is uninitialized (0), this performs a
read-modify-write on offset 0, which corresponds to the ISR register.

Fix this by returning before a valid int_ch is assigned.
Choice is made to just warn about the channel name as it could
be confusing, rather than making the probe fail.

Fixes: cf0fb80ae167 ("iio: adc: stm32-adc: add stm32mp13 support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260911162602.D323F1F000FF@smtp.kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/iio/adc/stm32-adc.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 5c6c06b269be..87fafdd4698b 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2259,7 +2259,7 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
 {
 	struct stm32_adc *adc = iio_priv(indio_dev);
 	u16 vrefint;
-	int i, ret;
+	int i, ret = 0;
 
 	for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
 		if (!strncmp(stm32_adc_ic[i].name, ch_name, STM32_ADC_CH_SZ)) {
@@ -2267,31 +2267,36 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
 			switch (i) {
 			case STM32_ADC_INT_CH_VDDCORE:
 				if (!adc->cfg->regs->or_vddcore.reg)
-					dev_warn(&indio_dev->dev,
-						 "%s channel not available\n", ch_name);
+					ret = -ENOENT;
 				break;
 			case STM32_ADC_INT_CH_VDDCPU:
 				if (!adc->cfg->regs->or_vddcpu.reg)
-					dev_warn(&indio_dev->dev,
-						 "%s channel not available\n", ch_name);
+					ret = -ENOENT;
 				break;
 			case STM32_ADC_INT_CH_VDDQ_DDR:
 				if (!adc->cfg->regs->or_vddq_ddr.reg)
-					dev_warn(&indio_dev->dev,
-						 "%s channel not available\n", ch_name);
+					ret = -ENOENT;
 				break;
 			case STM32_ADC_INT_CH_VREFINT:
 				if (!adc->cfg->regs->ccr_vref.reg)
-					dev_warn(&indio_dev->dev,
-						 "%s channel not available\n", ch_name);
+					ret = -ENOENT;
 				break;
 			case STM32_ADC_INT_CH_VBAT:
 				if (!adc->cfg->regs->ccr_vbat.reg)
-					dev_warn(&indio_dev->dev,
-						 "%s channel not available\n", ch_name);
+					ret = -ENOENT;
 				break;
 			}
 
+			if (ret) {
+				/*
+				 * Confusing channel label matches an internal STM32 ADC channel.
+				 * Just warn about it, as there's normally no restriction on the
+				 * name but that's not among supported internal channels.
+				 */
+				dev_warn(&indio_dev->dev, "no %s internal channel\n", ch_name);
+				return 0;
+			}
+
 			if (stm32_adc_ic[i].idx != STM32_ADC_INT_CH_VREFINT) {
 				adc->int_ch[i] = chan;
 				break;

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260915-adc-fix-intchan-v1-3deda8cecb50

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>


