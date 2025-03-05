Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4F1C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qR5OAEjVcqhFEhB6Kg5+dlLt98AeFnFdzL54hTZvlw=; b=0TAyaK4CIPXZWM1vkb4y94vtdU
	UvRMjbeTEhmh9XqpVMkVgkeVaDqKpjKKhFN4kJN1NxZ6PXVPtZB2jXyzyLH5w6iTgJS0K9Zksmepb
	UYnPtObCxgUw5FkkA5zOAmT16GIAamwi0eEg+BZfyokrhKnxK3gR2pLrRhyQV/N2sZmcqkRKwz8Ep
	/YtuIdhhkYYuP4onzb44eLySxKQsZ/sUDQcxTWPSP6cYma47VAbuIde6gXiPGSfR3yrqoTxGDfsHJ
	oIHk34IuFydqtJvdZ1sqLwkPCBdyNRfTQBTS0C/nT3aBHElfYPRyGClFDCPB/DaERhgJR//hdsJQz
	00DTBloQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppLb-00000008HFC-1Xn1;
	Wed, 05 Mar 2025 14:03:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoHK-000000085Of-49FA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 12:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5qR5OAEjVcqhFEhB6Kg5+dlLt98AeFnFdzL54hTZvlw=; b=UjML0S8dIepOJHPv37vVterKYN
	zKkat73U6Q5eJ6z2gD14DdIwmRMHtr3/oSiPjIKkWBJPCYEioQk53nRiycAYS1IYTNNpMRJOJJnao
	4UjoB5oV9HNyMIegNav9G8iKrJk0DzYUooUoqT7Tb7DCz7iccGZk+r16/dw4G0uL0fhDNl5XIC3IX
	b1pZclN9SXwRZ5W88ZVRzVC85MEs802N0G5sU7n+LWevjC/WHODfvm3XjBP/GS812N2ZWY1QhvQq8
	AmNwGOgex7aKeio0NzfHtathTosXF1ZPEuXf7WSByHDZgPKy25htBuYJnE3fz+yxETmoR2N5Ek6+V
	T2eoEGPw==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoHI-00000000X38-0gPV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 12:55:13 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525Bpj1m010815;
	Wed, 5 Mar 2025 13:55:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=5qR5OAEjVcqhFEhB6Kg5+d
	lLt98AeFnFdzL54hTZvlw=; b=WQo9AnKQGjuAo9tnbOQrifVGQxt8Il91K/8yw7
	tppqFNxXzUh8OPYin9zOOSvxipmff/mcqf/7dOmONtyVZ/MeFWZvRytc2h94PhdJ
	/e4UBd+nFC6wkuDxQTkvfJoTiL8McfITWWLFruYSo5TY/2kBDHNGimhls4JpAKLS
	8dEkiec5FReXI4EgDyDXD8Y7uw8x4PMS0K3XaLP4zjxosmVH9OtFxAyWN9N8xjOk
	7VkbVGM0GdUuPQCEntvpm+gYtMRv/rPnpny4sjMF44GcxffC1vx9lonCLD5po6K6
	xUNrI9jdYcwRbDapKgnO/AhsSDqTngeL3FB8eqcr/kVkE1Hg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 455wbhuk9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 13:55:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9C2674008B;
	Wed,  5 Mar 2025 13:54:05 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C38B62D58A;
	Wed,  5 Mar 2025 13:51:54 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 13:51:54 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 13:51:53 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <alexandre.torgue@foss.st.com>, <olivier.moysan@foss.st.com>,
        <fabrice.gasnier@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] clocksource: stm32-lptimer: use wakeup capable instead of init wakeup
Date: Wed, 5 Mar 2025 13:51:46 +0100
Message-ID: <20250305125146.1858978-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_05,2025-03-05_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_125512_289817_25FFACA1 
X-CRM114-Status: GOOD (  10.92  )
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

From: Alexandre Torgue <alexandre.torgue@foss.st.com>

"wakeup-source" property describes a device which has wakeup capability
but should not force this device as a wakeup source.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/clocksource/timer-stm32-lp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index 96d975adf7a4..f08baa6720f8 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -186,9 +186,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
 	}
 
 	if (of_property_read_bool(pdev->dev.parent->of_node, "wakeup-source")) {
-		ret = device_init_wakeup(&pdev->dev, true);
-		if (ret)
-			goto out_clk_disable;
+		device_set_wakeup_capable(&pdev->dev, true);
 
 		ret = dev_pm_set_wake_irq(&pdev->dev, irq);
 		if (ret)
-- 
2.25.1


