Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C86E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SykAPbdT9Bxh/XN2cwTtfyOFKxm8MvNOlBJR/xt+HXc=; b=F+kiBvuwaB12yc+8w+K0I/auwi
	4oH+WVi6wJoji/Mdbed7QANX1S2e0H2JMOlT9mp+BF0lVya64JLDI+zRoLT4S5JqriwW+urZBcoM5
	8psd9SE1SQTCrcwRPCW7JhqFD45p+z2vDA4s1Xnypu5stlQQ10vdwGYSDLg4unAmHMH5GhdIrY7SD
	/JaV8URitg4Gi6+Grv6elBjrHa7oTxP5uzWdAKWQukqCF72n7d2jnd5QzPUTCDZr9IqE/3ayhJNP0
	CTs8gh4Vq43wnfA+OxL/OTmb5kF+COxFzP7fTtovJdFVdUDLAWz0oBJhrC3fi7GGLtqxic7kE+MQ7
	vcqR8uxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZ6X-0000000DsMS-2Jnn;
	Tue, 17 Dec 2024 15:03:21 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZ5R-0000000DsAV-2Dz0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:02:14 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDCT19020655;
	Tue, 17 Dec 2024 16:02:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=SykAPbdT9Bxh/XN2cwTtfy
	OFKxm8MvNOlBJR/xt+HXc=; b=NUN1FDnTHPaBMDjtMJ99rycVqvNClpey4FEnhw
	21CMwgO38ncdfS5ViO5jG9M5+oPBwvRnSBBPGXoMQLFmTJeQ5AVP2GPOw5XtCcDG
	7g6qGQOlmYCsY4idVXpoTO3vJ2yK4d93COYCETwRS3dp6iyIPP/j9FTLlu69QmRC
	GxgjQrYfgR6YFU0hLUsx1IohN+HcZ7xbzPazirZBr+db/hlzrK1st7E/xCON/WX5
	slMw8vUe6rS5ZAQqz67SxtnrO67cOIk6XNEg+ZNODj3B3+hjEwe9XSOt95yduTUF
	RYPuijPAV6ugYft7DXJ/pilVNWyK+EKHWLjKRux7+z8MZxHA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5dgtaq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 16:02:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4DED440046;
	Tue, 17 Dec 2024 16:01:16 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A8AB27C23C;
	Tue, 17 Dec 2024 16:00:54 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 16:00:53 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 16:00:53 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <ukleinek@kernel.org>
CC: <alexandre.torgue@foss.st.com>, <fabrice.gasnier@foss.st.com>,
        <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <olivier.moysan@foss.st.com>
Subject: [PATCH] pwm: stm32: fix complementary output in round_waveform_tohw
Date: Tue, 17 Dec 2024 16:00:21 +0100
Message-ID: <20241217150021.2030213-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
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
X-CRM114-CacheID: sfid-20241217_070213_876670_B097A44C 
X-CRM114-Status: GOOD (  10.53  )
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

When the timer supports complementary output, the enable bit is
overridden. It should be OR'ed. This makes all PWM channels for
such timer not to work.

Fixes: deaba9cff809 ("pwm: stm32: Implementation of the waveform callbacks")
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/pwm/pwm-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index b889e64522c3..17e591f61efb 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -84,7 +84,7 @@ static int stm32_pwm_round_waveform_tohw(struct pwm_chip *chip,
 
 	wfhw->ccer = TIM_CCER_CCxE(ch + 1);
 	if (priv->have_complementary_output)
-		wfhw->ccer = TIM_CCER_CCxNE(ch + 1);
+		wfhw->ccer |= TIM_CCER_CCxNE(ch + 1);
 
 	rate = clk_get_rate(priv->clk);
 
-- 
2.25.1


