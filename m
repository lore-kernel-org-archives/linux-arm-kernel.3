Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B599C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SdfsqttsoqnkLSHVYtLWqH4z823DOc7YuHAnk+opa8=; b=IJZXhTUUS6mqgN+2TI9qSzuK13
	OP7IErgyHp8qpAKghJGzRUb1SKn902T/kPfpPWWdGJApmbupOIGbFedGkoRaKygJGcq7Sizgsind5
	q0ds+knq0SifYaNMgGXgWEM2YaWHpKxICDxk2Kr6+6PQgpcWR8IKFB6p7c0zA8jwJ4scyXicEJAur
	oKjs3Lvra3fWGsLG/qr8ijMHqeIA0AaLsSOYgbkQttugzT1wd0NZFNZLjmiH+BL3ew6G5I/QwO6dF
	gn0QxWzdz/XvjMWDWiyZpHxpgn7+TUJuPCfiFEjcWXA7iJPazkHy8qIeWCHjBQTAkq1j3qh6YirMA
	xW0a/JeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fCH-00000005gQr-0hkv;
	Tue, 15 Apr 2025 12:15:25 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eKb-00000005VKz-46CH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 11:19:59 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7B8LD023886;
	Tue, 15 Apr 2025 13:19:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	0SdfsqttsoqnkLSHVYtLWqH4z823DOc7YuHAnk+opa8=; b=J30kttT2slNxBEwv
	MQO3WrONweQqnYGKj5HLOZCzOThC/pR1GqTGFx7BaablaoPWGbd1rL6ssFYB14YN
	tEDDhbw2MgVj7hkEoAzVV4rfN4JPz55B7XtsY6PgX7oJMlDrp2ZFFN/8B0CAbnvm
	kR8VuOPq03JwNxl0LQRcnuQouamGpF86pA8LSe5JH8F5KvhWcNoFXhnaCn0FFpnR
	MpSfigxurjLDvx6y6unFSU+wRaTV7t0PG7SFZiUnJ9H3SwzjXga9kynmOMP0m6UK
	RWha3LuMJWFFyBXL2LZS42xe/9HyfnbHW9RqV0zw6ne6OiEBTv7TvVv1AddPmvqE
	Yqjg/w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45ydkmd6m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 13:19:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 77EB24002D;
	Tue, 15 Apr 2025 13:18:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 210CC9D22C1;
	Tue, 15 Apr 2025 13:18:18 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:18:17 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v2 5/6] arm64: dts: st: Adjust interrupt-controller for stm32mp23 SoCs
Date: Tue, 15 Apr 2025 13:16:53 +0200
Message-ID: <20250415111654.2103767-6-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415111654.2103767-1-christian.bruel@foss.st.com>
References: <20250415111654.2103767-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_041958_320748_8FA57E1F 
X-CRM114-Status: UNSURE (   9.89  )
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

Use gic-400 compatible and remove address-cells = <1> for aarch64

Fixes: e9b03ef21386e ("arm64: dts: st: introduce stm32mp23 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 8820d219a33e..3f73cf1d443d 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1201,13 +1201,12 @@ exti2: interrupt-controller@46230000 {
 		};
 
 		intc: interrupt-controller@4ac10000 {
-			compatible = "arm,cortex-a7-gic";
+			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x1000>,
 			      <0x4ac20000 0x2000>,
 			      <0x4ac40000 0x2000>,
 			      <0x4ac60000 0x2000>;
 			#interrupt-cells = <3>;
-			#address-cells = <1>;
 			interrupt-controller;
 		};
 	};
-- 
2.34.1


