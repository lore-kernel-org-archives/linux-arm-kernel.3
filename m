Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485E6C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVrwImYHaBmgSPFsjlUjaY5EbqPbICsIa2yOwISZvOg=; b=Yf23Ykfs5+Cy/Lynlp2wOVwtxA
	fkJL1H4HmtJqqocQzH/SO6oFgyK7jd/FzvoKL12Qs5eNhRY4iHifpGZJZoaaURf2SSujfnCZHQ3G/
	GRwaRLrzvG1JaldoUNSaqNU3wlw5MA5+qnZtR4Guo7RE2xDOw0zpExGD0vVTJRCF3xRxrNLOl0h0E
	9LvxZBSJBOkUoY4UXgIXSEixBTKj2QcJUBYmlylWrpYnr5gwykZ617xtcFWMe1cd024hnbNiKOJrw
	vvDPHLTtbPDQ5dqK4vBlnDF4eCfyq38A6h7FaxVuwwPJeQ/9W42QHd1PN07CJL3lS/lTibPOZ7l2a
	YcnQNWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmr2J-0000000GY8h-0Rdq;
	Tue, 25 Feb 2025 09:15:31 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqkt-0000000GU8J-1hh9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 08:57:32 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7ui2M015805;
	Tue, 25 Feb 2025 09:57:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	QVrwImYHaBmgSPFsjlUjaY5EbqPbICsIa2yOwISZvOg=; b=l5d9qn+UaqaEuzW/
	o5cV0ISyRxh0tXu+pYQ+qRNeLHjgzpmBV9dAL+uAULKByPP0pMcG/H4n/yf/VdXk
	jHAsZ4OCzAOtPYB/kar5tNgZgaKIk7S+zfatlpT6oOQ0Or6/apH+gfJ5kM0i3fqR
	YQ8JDlSu6ngtxke8sZrsq7uBCLdqbcjGI8qecWLeYgd2sSW51HnoInGHJVsUXacm
	iSyXbl+r9P9XWi05IRcTDhLy3iBZOQYbO7Q96MzYgZKYL4lo9dsJujPSB8uEjHXh
	PjU1lwvSzwDEgJZ8LhHDR19e8AmkqX+54fN2rCgZiYLdUh7npS1qqpmSMCnGw/cK
	JFHUFQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sqsssj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:57:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 15D354009C;
	Tue, 25 Feb 2025 09:56:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0384B42B146;
	Tue, 25 Feb 2025 09:54:36 +0100 (CET)
Received: from localhost (10.48.87.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:54:35 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 25 Feb 2025 09:54:12 +0100
Subject: [PATCH v2 09/10] dt-bindings: stm32: document stm32mp215f-dk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250225-b4-stm32mp2_new_dts-v2-9-1a628c1580c7@foss.st.com>
References: <20250225-b4-stm32mp2_new_dts-v2-0-1a628c1580c7@foss.st.com>
In-Reply-To: <20250225-b4-stm32mp2_new_dts-v2-0-1a628c1580c7@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_005731_736584_EA638031 
X-CRM114-Status: UNSURE (   7.56  )
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

Add new entry for stm32mp215-dk board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 9ffcba51c9207b5a1386c025f850bc594c915c8c..9db52e5d09ac1d963e79bd937eef6cb33313f343 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -190,6 +190,12 @@ properties:
               - st,stm32mp235f-dk
           - const: st,stm32mp235
 
+      - description: ST STM32MP215 based Boards
+        items:
+          - enum:
+              - st,stm32mp215f-dk
+          - const: st,stm32mp215
+
 additionalProperties: true
 
 ...

-- 
2.25.1


