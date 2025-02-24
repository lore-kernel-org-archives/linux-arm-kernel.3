Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D536C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osiU9ANcAUpNcWXhI2xaSMZVYF5nDauriCTMslBkOmI=; b=IMpIsyfOp4m9qQvz5X5UoCTK0j
	ALF8bEypBqr+Dcq0RIbxB4o+yB/TxflkzcGB6E7yYRtdk/gNXkSY6it7WwDf8421SAXWRqudp2oG1
	J7uJgEZ9FrJnaS17o0cHf1tFbQFq3LNxhAylwbqH9cXZZNoLnJ7buqlSdHAhHxO1kuYdJiBHOxq4K
	UWEKoYhL0bLadkT8kaUfkcNO4P6GL7+cK8XvC2ke6k2zZ4+/fXH9UKKA0G3f5RiIauEJfJe7lzbdH
	MyY+Ee1X1xw5XEDHEIownCnQTwVVeoPO++Yxmkl8RLPV9u34nt1tiEYW3HGvj4SaeAYYzeUN9e53g
	nFCslluw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmd9t-0000000Enmx-1kJE;
	Mon, 24 Feb 2025 18:26:25 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmd3D-0000000EmFG-15ZT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:19:32 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ODQlVP012696;
	Mon, 24 Feb 2025 19:14:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	osiU9ANcAUpNcWXhI2xaSMZVYF5nDauriCTMslBkOmI=; b=HmSwivo2j8yGU+OD
	8CvXkxMFfO5N+oopQOWZ+3OvOWV2lwkMs9P+TV0dGKbS1xutovlmhIgUMC4MIVl6
	pXLTcG0x+LBBFE/SDLqOBmCsEMhvDbAZ6Yvvq7cY/UMTnUk2T70zH7VrWZRjjvRE
	tMANRs2l89fVQoihhQIZO5mcuEbHSaccQ/0QNU1lD2ZAZw6p3chl4g7RbDHgkxTL
	s789FLzbSAjlrlyzkloUwbBUiVo3XvjExkCruTRqqLI9TMMoVTWULgaVLyfTAuSD
	xOZAWjUvJ8YASwQkrtlZ+IvcCcNc1RUM2Otz7rTSmuvkhiARwoOqCmTyXVEhLpic
	w2oTPg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44y4vm10xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 19:14:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DA2FD4006D;
	Mon, 24 Feb 2025 19:12:29 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22CBE5461C3;
	Mon, 24 Feb 2025 19:02:33 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 19:02:32 +0100
Received: from localhost (10.252.23.75) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 19:02:32 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <wbg@kernel.org>, <jic23@kernel.org>, <daniel.lezcano@linaro.org>,
        <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH 4/8] clocksource: stm32-lptimer: add stm32mp25 support
Date: Mon, 24 Feb 2025 19:01:46 +0100
Message-ID: <20250224180150.3689638-5-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.23.75]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_09,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_101931_845048_9B650E25 
X-CRM114-Status: GOOD (  10.85  )
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

Add the support of the new compatible for STM32MP25 SoC in driver, as
described in Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
and used in arch/arm64/boot/dts/st/stm32mp251.dtsi.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/clocksource/timer-stm32-lp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index a4c95161cb22..db055348e2cc 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -197,6 +197,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
 
 static const struct of_device_id stm32_clkevent_lp_of_match[] = {
 	{ .compatible = "st,stm32-lptimer-timer", },
+	{ .compatible = "st,stm32mp25-lptimer-timer", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_clkevent_lp_of_match);
-- 
2.25.1


