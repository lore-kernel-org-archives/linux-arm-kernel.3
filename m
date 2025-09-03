Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B67CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VtDIXnB6jguTha2nuJ2+4gYyBFOqAKGNF3LBQOKc0iI=; b=WFtK/Y7/N7NpaF
	dR6mj0YNKFkTvKGD8KFroRCMvyWE8ZclOXECWuOT+hX6tg5UHvOgDAo2JUQR+iQ9Gw5ayOKSPoLjh
	kVzD0s5eMT4sloEaI/l+eh0A/Vv04EF1dugrdyXr43lHpojt8IpQhNHGpkmosMt6Y16QlKbdpxHGO
	wJWIHyNc2UkirnaLesbPcyIhQyp7LaH8teraRe6djon+NCHe/foefmm4HqQOdrbptCv1Y/Iz4AYr0
	OBVMrLNMvnQqCdmMaA+rmzccRQpbkFtmatNGhQv0LnQP8Y8d1T6RClQLOrA8AQXCYJy1EKL5QzKbL
	e+ySbDFQysPT1phq0Pxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlHQ-00000006AiD-21f8;
	Wed, 03 Sep 2025 11:03:56 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkCL-000000060Kl-1XTI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:54:39 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839hvmm022675;
	Wed, 3 Sep 2025 11:54:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=VtDIXnB6jguTha2nuJ2+4g
	YyBFOqAKGNF3LBQOKc0iI=; b=0aB6pQrODfKgQg6egCwF3PoX/a/6K4garsVZB+
	k7P/j+/z4fdmr4SfAEXy5hV0/exkc6+WdQh/LutqxPlsQD5KWbMihgoY7ycxbMuV
	goVfv2JAtnzw9lYMODuRH+PXn8ceSROTkgVqyVj+jKsrg1YXsTvfMJRGCNE5qKeZ
	dFClyT1QRgJ68AZyTysttTlJE+WpXGoC8k5PniDRkfxYn/8eeEQNBKDYkPXyOx4W
	Yt9B3Uw8fcjOpZdq0PgBHoQFS2Nzh8VVTRlPr8sw54WT04UmO2oWkKjczLbeN0iV
	6xplLEswwJnpAxI7uIeEd6d/9ARG7/3dZKK9AO+KqYHiOYRw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7g1n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 11:54:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1ECFB40048;
	Wed,  3 Sep 2025 11:53:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 417292BBC04;
	Wed,  3 Sep 2025 11:53:12 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 11:53:12 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH 0/4] arm64: dts: st: add ethernet1 controller support on
 stm32mp23/25 boards
Date: Wed, 3 Sep 2025 11:53:01 +0200
Message-ID: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP0PuGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwMj3dwCo/jUkozUorzUEl1L85SUlFQDizRLA2MloJaCotS0zAqwcdG
 xtbUA8Lec4F4AAAA=
X-Change-ID: 20250902-mp2_ethernet-97ddde08f903
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_025437_673337_346BE77C 
X-CRM114-Status: UNSURE (   8.62  )
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

All of the current stm32mp2x boards embed an ethernet1 SNPS GMAC5.x
controller.

Add the support for it on stm32mp235f-dk, stm32mp257f-dk and
stm32mp257f-ev1 boards and default enable it.

On the stm32mp257f-ev1 board, we choose to keep the ethernet1
controller as a standalone ethernet controller instead of using
the TSN capable switch.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Gatien Chevallier (4):
      arm64: dts: st: add eth1 pins for stm32mp2x platforms
      arm64: dts: st: enable ethernet1 controller on stm32mp257f-dk
      arm64: dts: st: enable ethernet1 controller on stm32mp257f-ev1
      arm64: dts: st: enable ethernet1 controller on stm32mp235f-dk

 arch/arm64/boot/dts/st/stm32mp235f-dk.dts     |  24 +++++
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 126 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     |  24 +++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  25 +++++
 4 files changed, 199 insertions(+)
---
base-commit: 4952fb7f53d4c9f007147ffb250c04ed40c959f7
change-id: 20250902-mp2_ethernet-97ddde08f903

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


