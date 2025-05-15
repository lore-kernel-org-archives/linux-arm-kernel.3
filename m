Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9B5C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAS7AYYGOitchQOYiqBu5iY1SE87tPP2eKQTXou91Jg=; b=Z9119qKKwduURnKZciXjFG3GPm
	tAVW/snJ33LBIAbbTRUiGlF/rSEo49q1slAetf2QrWtiyZNh/4N1BGpo7uevp1LQkwv7DdH/GKFcW
	vg9tFg97t4nZMAgKOFgdjCLQnUJJtkc0dM+z9repOu42mxml3mIMH4/iToB+iIKa7YOWXbj4NoulT
	ZkVmFDxm+NmcqWvsxWqLjC4oGLRr60E9OFu4XaMTz4Zq4of6sAlX02PSjXSeY5bT8lD/Y7eJHGR6g
	XCK+9O0EvSVYJ6RvBILvBIgk3Ceke6/gytGJUT1REPDUDfq6IYJNW3kID2H/HbOVbVlHY4wHI181I
	t9Kw8oog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYZU-00000000ihr-0IZZ;
	Thu, 15 May 2025 13:24:24 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYPo-00000000h0C-2Uk5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 13:14:26 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FBPdNk029562;
	Thu, 15 May 2025 15:14:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	NAS7AYYGOitchQOYiqBu5iY1SE87tPP2eKQTXou91Jg=; b=59ashyF+2iD+hePr
	R3yKnaygAXOQpabwxtAhNakxQ1T8vgAQHfDhS3vE9Fn7VFsMB4ktna8VU5+YQM6E
	jrYf7U9hlb1+EcKNnJ48P0XtcNBBTO2YWwzEMNh/p7ryz9Gc2SfrsFCuCyXt5lsH
	hiGW67INgmCe4ouNmluz9gDwwP7Akb8LlvQOtW/MXOo6xYgV20cjhTZPrGZ9rPrw
	JRfmd0dISjUUcwuFFQFLq2FWAUoHr+I17cohh5DoAetJ3sBVA6mz0VVK2pGerlrB
	MyDEf15mMPHZuHqmrHf7caBY7uxPFMT/BTFBCivAHX0kA1faFaPd4UXkBpxS4W0Y
	IfNpRA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdx8spt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:14:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4239240057;
	Thu, 15 May 2025 15:13:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DDC9B3D254;
	Thu, 15 May 2025 15:12:44 +0200 (CEST)
Received: from localhost (10.48.86.182) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 15:12:44 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: Patrick Delaunay <patrick.delaunay@foss.st.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 2/2] arm64: dts: st: remove empty line in stm32mp251.dtsi
Date: Thu, 15 May 2025 15:12:40 +0200
Message-ID: <20250515151238.2.Ia426b4ef1d1200247a950ef9abd54a94dc520acb@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515151238.1.I85271ddb811a7cf73532fec90de7281cb24ce260@changeid>
References: <20250515151238.1.I85271ddb811a7cf73532fec90de7281cb24ce260@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_05,2025-05-14_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_061425_227666_3E99E9F2 
X-CRM114-Status: UNSURE (   9.39  )
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

Remove unnecessary empty line in stm32mp251.dtsi

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 74c5f85b800f..5d54be027254 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1495,7 +1495,6 @@ gpioz: gpio@46200000 {
 				st,bank-ioport = <11>;
 				status = "disabled";
 			};
-
 		};
 
 		exti2: interrupt-controller@46230000 {
-- 
2.25.1


