Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6174CCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMQLACR9Qn1ddrP+BJ+dMHbn7l/vC1Wst+WQeSofqBs=; b=c+EhFP1hJT9dXBaMPXbtbD0aeD
	iMge6ceWpDWOPuRGrwGlQnhdGw4HOqB5dvDC0ADSRLjQR7ViE3HdAKWHROuaZUSomPjaI/VtU86dz
	BM5oQd5vuI2D5UbtDJxklDfkycIiwlYqLAT8hnPEhI0zpSY131OLHhcjDOtKS31YQrt9GgjpL557q
	UIL1BXlvNTvzoQOCxapEQ5PMhM9V4BjwTnKj3+zGVKrkVdtcpSIwuwB8dEsQLLlPbrLax2EgfaEk9
	TjKqdQ0gRU3HkCvEQ3Kom7XF4KNGtNZ6tdaRZsNMZO7aSj6pXowr1ta7y3sCUZCg5BBKftvGY61fR
	UeVabAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphnV-000000041Rq-3iIT;
	Sat, 23 Aug 2025 06:32:17 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSw0-00000002rYS-1snF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:40:05 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MDRXbr012312;
	Fri, 22 Aug 2025 16:39:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	fMQLACR9Qn1ddrP+BJ+dMHbn7l/vC1Wst+WQeSofqBs=; b=3H94Cvqwba560bLd
	xD9ZoUCdAtZXMxG+q4MGwK0Nv1PPYzrjurYgAQ53eQTg938lEsIosXe4UCGNpAwh
	FRINCKHID/JTuLM26kY86xGE61iWC0ICet2re9gL8czlWfjz74a0nCXlW7q8NYDL
	Pw2Vsehf173bUoREONFdxzB6+eLFiKQaH1eSHvdGBsh73FgWpgSPHm8HpZK2Tz29
	LxocavoYssNH8SXBVGGE8/95YBmsjWqNRH6be7943dQmXUB4TMwxUWbKooC7POo3
	t/NGEX5h18Ze+NULZCj6LT/0jS1tbeneIqwpQN4I7h0KrQJ6501MqxGjv5/aGOyP
	am9wjg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nd5xshsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 16:39:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B806F40047;
	Fri, 22 Aug 2025 16:38:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 84B58726F1C;
	Fri, 22 Aug 2025 16:35:56 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:35:56 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 22 Aug 2025 16:34:21 +0200
Subject: [PATCH v5 12/13] arm64: dts: st: add clock-cells to syscfg node on
 stm32mp251
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-drm-misc-next-v5-12-9c825e28f733@foss.st.com>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
In-Reply-To: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_074004_756850_28A7F9DC 
X-CRM114-Status: UNSURE (   9.06  )
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

Make the syscfg node a clock provider so clock consumers can reach child
clocks through device-tree.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index b44ff221e0da968be104ff8195f9bef79c90c57a..24823bbfee31f15e813573ad1a0c4f67a125ce51 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1874,6 +1874,7 @@ exti1: interrupt-controller@44220000 {
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp25-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
+			#clock-cells = <0>;
 		};
 
 		pinctrl: pinctrl@44240000 {

-- 
2.25.1


