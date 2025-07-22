Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB01C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ny+3xzEB69ONOaOL63xU/9wLRbXsLXDOET4jNRuZ8J8=; b=YfYNUK4vv0hUR4cU9v60wz8yMn
	hrljSyUiFFsP3D1T2iaGmqsfEUx6SOiuNO/7Tq3ka9VbEz9MRm9pts30hMJUhy+UqLZG4UxKLip32
	pS/Z0w7Vqz4i8QbFj5sTDqEMgJTRy8SkrUq8w7SCT4MMmzsUzCH1AGnsvfdIcJPXI912+rVdgElx4
	q8k5/QBmwX0HGtT9yhV4eCV3wE0QvNpsiKMePgxwXGSHyN7+Mhn3uliGCLEld+C7LC8+3XEF6i5qX
	ISPKoQvqFRrEcrdbPPyaOMwdi+NY2ht0AHv+Erzf45T2wbL6wRhoGNYgyAkIdkj5747IzvaW/GdCQ
	Yzxp0AtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEZc-00000002oiw-2UHE;
	Tue, 22 Jul 2025 15:06:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDeE-00000002dgq-17iP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:07:15 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDrxTc028380;
	Tue, 22 Jul 2025 16:07:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ny+3xzEB69ONOaOL63xU/9wLRbXsLXDOET4jNRuZ8J8=; b=yOx7wKLNTVqywQmJ
	fBoiNFt7VNo+jfO1W9Wl+wBgwYT8OP2MAA5WJ1+BGXkM+R+eZ60MgRdXMuL4LgKN
	My7N2hwSp8CCimU629SMhztyHM51LFOfL1mpZ6vJh12+OL+V0fTWWRndL6qSmRr4
	fle4Rc9cE6RIIiDQw+9s1mzW0sodkVsiQvlrLKds/AI6QDbK2m9bdx1EuR/reLfr
	Nxs0atvIp8+Rr1VH6X1UjIMrWO0yrrozbn2TTjgsfQbvjRMoW/0jUqsrnsnfpqf8
	m0WNw1jKTyKxDD2sMiNQfPeO5/ZEDRism7VPyn1EiWFbJba0ZRRl4gA8hezA7dGP
	veMilA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48028g63ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:07:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 288D44005D;
	Tue, 22 Jul 2025 16:05:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6083C7A31E7;
	Tue, 22 Jul 2025 16:03:55 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 16:03:55 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 22 Jul 2025 16:03:25 +0200
Subject: [PATCH v3 08/19] dt-binding: memory: add DDR4 channel compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250722-ddrperfm-upstream-v3-8-7b7a4f3dc8a0@foss.st.com>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Le
 Goffic <legoffic.clement@gmail.com>,
        Julius Werner <jwerner@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-8018a
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_070714_602821_12DDEADE 
X-CRM114-Status: UNSURE (   9.15  )
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

Add in the memory channel binding the DDR4 compatible to support DDR4
memory channel.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 .../bindings/memory-controllers/ddr/jedec,memory-channel.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-channel.yaml
index 3bf3a63466eb..03252d97ac38 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-channel.yaml
@@ -18,6 +18,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - jedec,ddr4-channel
       - jedec,lpddr2-channel
       - jedec,lpddr3-channel
       - jedec,lpddr4-channel
@@ -60,6 +61,15 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: jedec,ddr4-channel
+    then:
+      patternProperties:
+        "^rank@[0-9]+$":
+          $ref: /schemas/memory-controllers/ddr/jedec,ddr4.yaml#
   - if:
       properties:
         compatible:

-- 
2.43.0


