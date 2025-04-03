Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F220C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 12:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRxQoHQhjdUnPqTUWaWYCnnyELWrrYam5NAxpHrT/bo=; b=0gqOT+eN5zURtRgcsqlJ5vW1xy
	4WHbqhUplA6zqDnQZrRaZ70lATDrV1c7AsTNYu6s1SxtYt7l80eO/LYWlHj8E4czKOrhdTpKNHuSs
	OiaFPrlIzQLdRuffwhPgG6JnBfma7n986IFt5qilRpX/fh9d72rOkrsowp/6Ll2HesRs4xn7G+mID
	/j0s5+pP0jSjNqr+2C6sBL1tDpp25fhUFvwJnu0GfQ6Ni+1HiRbZPibYhx/rosxRv5M4MWNwPnJxm
	1s13SMKYF69Dc5pMbCxUCfEzMKXqDH+K+w050gTJ4orBM2theQ8frf4jE55yjOEINGwz9QsHZ5yHy
	aXq76fmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JnZ-00000008pbc-3QfU;
	Thu, 03 Apr 2025 12:35:57 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JiG-00000008p2y-1KAw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 12:30:29 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BhN8I024322;
	Thu, 3 Apr 2025 14:30:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	lRxQoHQhjdUnPqTUWaWYCnnyELWrrYam5NAxpHrT/bo=; b=ql/0Ll0nMHB9EhBx
	VS7h0VDdwjdZU2/vpW4ig7Nf4oUO9S6aNJ34ZCuMpePQwIGgs5jpw07RCwO/WqNi
	rSSZOsxZqvbCmkll24h1zz8phU+w7/+BViYyv1Jpq8Bvpb15bcVM5ERgPpxQavrF
	KFgpJy34jRA0QwpS1Wect7YaaqRSPPEPD9llPWMmyKRqPufGOWi+25wkPfcdxv1/
	i8IwmZXk3fw2JCkZAo96WmCD10mSqLe+w7qx3CT6nEjOjxLQ+WrpHTiC+yLiupj8
	jgUqC+3NKyKrR6VOFSspvBCcxDUZrMJafjXQca0/zGiqYWoosMG5VkD3ir1xgmsV
	ZjrMGQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2c7eey9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:30:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 51E5240044;
	Thu,  3 Apr 2025 14:29:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 768688EECA1;
	Thu,  3 Apr 2025 14:28:31 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:28:31 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <maz@kernel.org>, <tglx@linutronix.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH 1/3] dt-bindings: interrupt-controller: arm,gic: Add st,stm32mp2-cortex-a7-gic
Date: Thu, 3 Apr 2025 14:28:03 +0200
Message-ID: <20250403122805.1574086-2-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403122805.1574086-1-christian.bruel@foss.st.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_053028_661507_B596AF23 
X-CRM114-Status: UNSURE (   8.93  )
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

Add st,stm32mp2-cortex-a7-gic compatible to support remapping of GICC_DIR

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 .../devicetree/bindings/interrupt-controller/arm,gic.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index 7173c4b5a228..7ea7224b2f36 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -37,6 +37,7 @@ properties:
               - arm,tc11mp-gic
               - qcom,msm-8660-qgic
               - qcom,msm-qgic2
+              - st,stm32mp2-cortex-a7-gic
 
       - items:
           - const: arm,gic-400
-- 
2.34.1


