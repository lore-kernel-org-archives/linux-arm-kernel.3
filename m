Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C469BC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRwS5y+6+ListVV+cfmEY7D708flMTRs7UfPH9JgUtw=; b=3HhU1M7lM8CugELy9dMCrLbZfM
	iqn1F8sZP+zPrOaapelH3ENBCvGHD9nkK2BtoC0QvBi2XjXEOHAoGTo49KY3838+YeLWlizkqySpl
	03eY0wP/wKcbgfXUXOM2xpxyI38WOJlHEFoqj1bImlbOEGA5K+fw9DJHEM3IWCEFD5VCEZGolXMDB
	qYGyJUuQ+DhM4K5lmGDQKp5Fx2Hd/N3eTasiZAQB243aEbaXlyIYF6MjQAm6HxJO9/px6ay97ubPe
	KDB6y0cDZX1mVRdce541m1We3az9bqIfoCyDDFlsMPhCG3Rm3dqQ362uMe/rVlJ/TMPHZ4dAab3ed
	xIpvp09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4TH-00000007u7s-1DPw;
	Tue, 10 Jun 2025 19:17:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0mU-00000007Hb1-3WXz
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 15:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iRwS5y+6+ListVV+cfmEY7D708flMTRs7UfPH9JgUtw=; b=iAQHHBCYYC/s3zpih+ZyIIJH+Y
	+17bAPMFK1wheuLNG2OecnMDnrw8fIF94MjYSUSZeIGyHm7cfWFwbyxb6JbhtB125NasHDhfG7fnr
	hZUJ2Kp/pbKj/EJWQM+X15xTE9VRje92uRO2q+dvRPvclVK30EpZAdrVUvlDa5//3ihcMpvZFs7z4
	tQnXV6zbluA5jVd46vVvC0bv1rfkHR3oL+BepR5/l++vIZqoe1y+7sZfRPO5AxQcx8/I4GbUHw67Q
	WVxI6dQsqMejH0A44cx+s4d4sjCSdhbpDhjugbxqhunkhumuyZH+/OZ1KwZPj1FSuZnM86zlxwPzS
	CHfOpvLQ==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0mS-00000001tSx-1GkN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:20:54 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLDXT012933;
	Tue, 10 Jun 2025 17:20:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iRwS5y+6+ListVV+cfmEY7D708flMTRs7UfPH9JgUtw=; b=eKXRLLuGCrKmGZba
	f3drpZSQ8KTejJTI2ufpHGpLXRJvFdVGLQH7A7h7glW3ReNXfiRkt943FaD5v+Ym
	686+XG5YoPs/hIyM9OOt9KuSA5qjMjIPfPnJ136WYhP6KiXOAfzksczto2yukHtq
	pgT6Z9stXRKsxaTHHJO96/es/1ApxoNaKzby0aUP2PaJELFhLvtdj7kSdmqvkex3
	fXJuPVPwPM8hXMpSTZXkE8NFrODJxAcTU367iFX0+87C5/pvA0SrT/MEhSimdHW5
	yhfXe76a114n+iXP0qyROXNR8J3d/Z8SoUhUvK7l7lxCBUMDR2Bg1DCrss7SIg/g
	cc+YlQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aume54a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:20:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 84A894004F;
	Tue, 10 Jun 2025 17:19:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBE9EB74DC7;
	Tue, 10 Jun 2025 17:18:44 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:18:44 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 5/5] dt-bindings: pinctrl: stm32: Add missing blank lines
Date: Tue, 10 Jun 2025 17:18:37 +0200
Message-ID: <20250610151837.299244-6-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610151837.299244-1-antonio.borneo@foss.st.com>
References: <20250610151837.299244-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_162052_539425_629CAEFA 
X-CRM114-Status: UNSURE (   8.39  )
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

Separate the properties through a blank line.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 5d17d6487ae9c..961161c2ab62b 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -32,13 +32,16 @@ properties:
 
   '#address-cells':
     const: 1
+
   '#size-cells':
     const: 1
 
   ranges: true
+
   pins-are-numbered:
     $ref: /schemas/types.yaml#/definitions/flag
     deprecated: true
+
   hwlocks: true
 
   interrupts:
@@ -67,22 +70,29 @@ patternProperties:
     additionalProperties: false
     properties:
       gpio-controller: true
+
       '#gpio-cells':
         const: 2
+
       interrupt-controller: true
       '#interrupt-cells':
         const: 2
 
       reg:
         maxItems: 1
+
       clocks:
         maxItems: 1
+
       resets:
         maxItems: 1
+
       gpio-line-names: true
+
       gpio-ranges:
         minItems: 1
         maxItems: 16
+
       ngpios:
         description:
           Number of available gpios in a bank.
@@ -187,18 +197,25 @@ patternProperties:
 
           bias-disable:
             type: boolean
+
           bias-pull-down:
             type: boolean
+
           bias-pull-up:
             type: boolean
+
           drive-push-pull:
             type: boolean
+
           drive-open-drain:
             type: boolean
+
           output-low:
             type: boolean
+
           output-high:
             type: boolean
+
           slew-rate:
             description: |
               0: Low speed
-- 
2.34.1


