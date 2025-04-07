Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEE3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+aM4v81IIJ0lXB9aqI4mX4YkHUFBD7dtY0uixMWUn8=; b=UHJfQC8UALnSzx4MDCoHM0U+Wc
	SEk8Vs4gLNxqDsV6PaRPkTsKx0bkajY6BN6VB1oRnAefDJXGOpGUedPHnopic+wKsW7TA6DZ2/YG5
	hnKO/mBzIh/uaxLasbHJuSwyfH+xk9oeWriGJmPkr1H8AjV1Jmyr1SFfXy8KdqkLH+gRnyNU1N5v5
	OhfPWHRETimN3EItD3HGYX7WHzFDBdShrRKq42pDzkwf8S8V5ZWlhr6wPn+tq7xRR2pkkN0/bP7gi
	jXTNUELprYc0N3X15D6xlsbDa4hydldjlX9QYTz9VSQEhERdiPDhplO76VndomiRqNO9+GfD1O7rZ
	H52C89Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ngH-00000000mRO-3aTw;
	Mon, 07 Apr 2025 14:42:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mXp-00000000WQu-0urj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 13:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6+aM4v81IIJ0lXB9aqI4mX4YkHUFBD7dtY0uixMWUn8=; b=N+Y49kqSeSBJw4xssjQ5UpieMH
	HrkVMUoksqOORUGI8hgCdNharryz2l7XfiZ6g0R4/RhP6NMbtaZggbsE4j3XGpiVQYbwly4ZP9FNl
	gLhHLVthg141b+9CNszrkKv26LHqrW+9Sjak7uILYumGH+hKc6mtb6nFwa+TvmH1pJ85559vnz/Lj
	2oc0ctjSVPova4tKEFGMq/bqG47Ms9byTa74vImS0sU3EZF5j5KjpVzfR59iQHpntKdxL2W3KzohJ
	2ogmyleff2PMI4VZ81dJSB6m/cZ4VWcs67SS/UdwtRcwiXe2BK9ZjEY9UAimv3nKnH2dTf+lithjk
	8IPCDucQ==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mXl-00000007xLV-2gkP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 13:29:44 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537CPtK0020013;
	Mon, 7 Apr 2025 15:29:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6+aM4v81IIJ0lXB9aqI4mX4YkHUFBD7dtY0uixMWUn8=; b=doCt7kmH+R5+iRmg
	YP2prSynfMLoUGpYUPeb0JZBr5fVjhai0q6iYGuJeKDA2LhBQvPWHuhC0T8SRaVb
	dGwYJwniFTgiDv/qABGzN5kvv462dTCXaIGguJ2A18wxTUtITONuZ7aMh8IzCtzC
	aZxvg0/V6QOGjcGYLDEgNRaZg9ANJGWTTdvht2Zfq1FMnn8N30pTCUrAQFV4uULg
	xWpuGx97fR+ck1O/5naouKs5+BLVBocE+uhc66D85UQWrESY4E3ge11otKOO3ROC
	xu5M5JY0R9rz1QA29CkmkJPOI5cr1DFRK+MnEsN3FD4PwXLrwDa8EhiokZ1c4WLF
	8Y3oGA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw5g04jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:29:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6697240047;
	Mon,  7 Apr 2025 15:28:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3ABB49400C0;
	Mon,  7 Apr 2025 15:27:42 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 15:27:41 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 7 Apr 2025 15:27:32 +0200
Subject: [PATCH v8 1/7] MAINTAINERS: add entry for STM32 OCTO MEMORY
 MANAGER driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250407-upstream_ospi_v6-v8-1-7b7716c1c1f6@foss.st.com>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
In-Reply-To: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_142941_913752_89626B84 
X-CRM114-Status: UNSURE (   8.23  )
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

Add myself as STM32 OCTO MEMORY MANAGER maintainer.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b7e1f9c30f3e45fb85b0d0f58b56db84d986061..830245c8d583c422e869dfe4b5a184faaf52b559 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22766,6 +22766,12 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-stm32*
 
+ST STM32 OCTO MEMORY MANAGER
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
+F:	drivers/memory/stm32_omm.c
+
 ST STM32 SPI DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-spi@vger.kernel.org

-- 
2.25.1


