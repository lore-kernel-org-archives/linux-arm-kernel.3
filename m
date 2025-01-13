Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4221E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taEiKmKlVys5nB8Z9Qfz6vGyP3PJH7r7vDrV7QO4ysE=; b=cjGTxJKQg/BDOCfSRnRnIORjC+
	0xL0RLIbuos1gGjLksU/2Od5jk9/uNA8C7g2YsAVRXK9naZ1QQf40wOOKosQ1j8AuvHH6C3OO7T2P
	EXRi8EcH0TN+xlRLlrFmAAZJbW7Mh6j2bGlpYB7LMmE5pQB7iU5te7PAbpSOYzAUF4PeKViwLRVdD
	qjPVXqAaMjqxahvdduRTSMUbhwyjPnGqNt2aQjfwjkZyvp/jyxFkSjU1ZmOjIUo2fpR1SxP7NJbAH
	ftdVXfCoGy5ONrEGKOcrQ2mMCOXhWnTQ+6RA1DRW1l2ZqKHXBodOXwwai7hF1E/r8YcKb5pGlAg9Z
	k7y0BSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGOQ-00000004XWb-3X22;
	Mon, 13 Jan 2025 09:05:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJA-00000004Ved-1QqJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jan 2025 09:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=taEiKmKlVys5nB8Z9Qfz6vGyP3PJH7r7vDrV7QO4ysE=; b=Nta6R4EfSLFxVmVV1MwaPo0jo3
	ymlLWsui09xhCYU4WhOfi7c3dns/nHBHTmts1eyHPWqD68uQPyc8GhZuDHXKTFR2lCl29HDL3WKYp
	YNdva+nEU75DJFjzZPRS3y30KWuG0ak+2SO+Fi5rvOTUG1ReCZ8FTqSDzHU4lECEO96EBdZhDGLKF
	2ACw4iXqcPpVdSx0p16j4UGabK/gYs43fiLxt2n7YVhK4szRbbJHiSpWq6Op4z4ITDGon8J0m6nO6
	b2XcpG+pvGmzSI47K+/F/mibYeNFcB9gS66jLatR+Uay57fEP63Ac9sIfufBgwgjLszNuAGSUviu5
	ECFld9lA==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJ3-0000000AGnn-3MmV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:00:26 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5kAnl011631;
	Mon, 13 Jan 2025 10:00:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	taEiKmKlVys5nB8Z9Qfz6vGyP3PJH7r7vDrV7QO4ysE=; b=KZorB1urNUsJOvou
	N7z+IrR3CDeOB3gbRtO/p9ziDq7GH7KCnm3Yu+CdiHM08gWak04OW1p3uz6nNcRT
	kEf3vGBA/MCBOPtRjPmjF9DBoWxSAxrw4f7iAU8ydmtIBCmh3q8s/K4rV6UYebul
	ZnDYvSd8PBBO8KjxlVwH1/FEmp2tgxcAEuD7eH65iltPE227JQ++vXp0Afa3aZBA
	Irikafgxys/q9BSeB+CMLC5NiY+yISEET/hFbwjKfOMEF4WSNDTmscZwxnmCF3kB
	qw2unEpkKFI2E3fdZTB1GREHdSvXjUXUEFcop/WfwYj1FvGaVyYlXvMD0MyfCQsp
	aYsT0A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444vyr0p8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:00:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4801A40052;
	Mon, 13 Jan 2025 09:59:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 86F19234C22;
	Mon, 13 Jan 2025 09:58:13 +0100 (CET)
Received: from localhost (10.129.178.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:58:13 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 13 Jan 2025 09:57:52 +0100
Subject: [PATCH v3 2/9] dt-bindings: media: clarify stm32 csi & simplify
 example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-csi_dcmipp_mp25_enhancements-v3-2-33b96744df46@foss.st.com>
References: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
In-Reply-To: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.129.178.39]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_090022_531173_A562D3CC 
X-CRM114-Status: GOOD (  11.07  )
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

Clarify the description of the stm32 CSI by mentioning CSI-2 and D-PHY.
Remove the bus-type property from the example since this CSI has a D-PHY,
which is the only bus-type option, making this property redundant.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
v2: clarify commit message related to bus-type property removal within
    the example
---
 Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
index 33bedfe41924..e9fa3cfea5d2 100644
--- a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: STMicroelectronics STM32 CSI controller
 
 description:
-  The STM32 CSI controller allows connecting a CSI based
-  camera to the DCMIPP camera pipeline.
+  The STM32 CSI controller, coupled with a D-PHY allows connecting a CSI-2
+  based camera to the DCMIPP camera pipeline.
 
 maintainers:
   - Alain Volmat <alain.volmat@foss.st.com>
@@ -109,7 +109,6 @@ examples:
                 endpoint {
                     remote-endpoint = <&imx335_ep>;
                     data-lanes = <1 2>;
-                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
                 };
             };
 

-- 
2.34.1


