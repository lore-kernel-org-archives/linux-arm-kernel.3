Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BECC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTQBEKKpUKJ2EHlkrbcRSsrVXSaMIyD8QzSmT3bFAXA=; b=RFZwjnB0DDRNIyS6zDWYagPUii
	4Ih4+b7SvLX36aIEJli/yfm6ef2cZTTavRKu4ChxOjHbmqSXdDR536bAYmLCLtKkLWd709foeqg90
	S6woRa9bBoyCH7bqkm+Fc0GIsZiy+1mHJAZmomJFdIYqdlRFOLnynqByaSwgv7GW4bIE8BWKoXuCJ
	LcCTNoZaNqq+f9bqUcPyp3p363QjI+UoStFwNm0DGEOFHkFFI1fTDuvSnzeVLeDY1gj5y9zhTO3lT
	QmDzRciagZembdZyd+1HOzZXqVdehb0OdD08RBJNTK67DUZ3r0LUXOC/teeWsRwCoHZBBxz23riki
	8gc76sug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbmV-00000001tTM-4B0x;
	Mon, 23 Jun 2025 07:39:55 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbf9-00000001sHJ-2h7P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 07:32:21 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4bYPo006473;
	Mon, 23 Jun 2025 09:32:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZTQBEKKpUKJ2EHlkrbcRSsrVXSaMIyD8QzSmT3bFAXA=; b=oKgafiSAS9XMZXqt
	6jwgcRnnZpdvlS6FwFHA8XzABA4P2yY9hEXfb7wsIqHy2ebDOHW78vobjJRSUlGr
	kNrFUWkq/lX5npdq704U+E0h6xFpsUK+aW1lVwqm/aUYQWhzU7/Y4NyIJAV5zhob
	3mr8Q5XOU15RfsjW1s/A76DPrrHmh+UMsmdWLEiAsjrgh6bYpKnJUUlmcenNirUr
	aTnnY5eXnENVyc9uZV0rQhnIaW7LiZmnT6blwPtBSMvOLw/C8b5xIuMexdP/SdDT
	SbYOfXOI2gCdrIQ3UKLcJK7KQ4H+uLQL7zDmcpWSW+VWqALioBTCZECuESjKxajS
	vo3KiQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5ner57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 09:32:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 64DD740057;
	Mon, 23 Jun 2025 09:30:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56593B5A33F;
	Mon, 23 Jun 2025 09:29:48 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 09:29:48 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 09:29:18 +0200
Subject: [PATCH v6 8/8] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp157c-dk2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250623-hdp-upstream-v6-8-387536f08398@foss.st.com>
References: <20250623-hdp-upstream-v6-0-387536f08398@foss.st.com>
In-Reply-To: <20250623-hdp-upstream-v6-0-387536f08398@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_003219_963813_8AA1AC6C 
X-CRM114-Status: UNSURE (   9.98  )
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

On the stm32mp157fc-dk2 board, we can observe the hdp GPOVAL function on
SoC pin E13 accessible on the pin 5 on the Arduino connector CN13.
Add the relevant configuration but keep it disabled as it's used for
debug only.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 1b34fbe10b4f..a6ae6ca14cdc 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -63,6 +63,12 @@ &dsi_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&hdp {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&hdp2_gpo &hdp2_pins_a>;
+	pinctrl-1 = <&hdp2_sleep_pins_a>;
+};
+
 &i2c1 {
 	touchscreen@38 {
 		compatible = "focaltech,ft6236";

-- 
2.43.0


