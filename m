Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CDCC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 08:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjQ6jzp5petaGXfP90uNsQR+cc1MZ23TGQzGVRHgV0E=; b=lHvy6rWXuMoNctKugP992hUEp0
	jMli8TJPCpT+SeniybMDC2BPD/qq7zWQqsaEY00otE6YYQDlhWaW/XSifRy56HTihLb1MdE6Z2K4P
	aA8NhifJFYV1mnJaUgl5gsnw3Hq4IK4r5uDq/pQMt6WzwGXG84bBk7yDVAAxtA5lQcrbKI/spbpmI
	ugNXyy6G+Yh6v3l3oqQwQO2iqZw3LrkKXA3weRA4Lzbiyt+aZJ0VUN2j5alWBV6hHYHXiH+tOYk03
	JKyUCfN0xyzwChzZFqlkkPQaVJiUAZQXpIF6bYOc0po6sLqXPqdiPowVO8+9hCyNgpiWISJbUwQUK
	ZuYhW+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMPI-00000007xFL-0Ssg;
	Wed, 26 Mar 2025 08:46:40 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMLs-00000007wmG-2gvh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 08:43:10 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q7YPIE019497;
	Wed, 26 Mar 2025 09:42:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	tjQ6jzp5petaGXfP90uNsQR+cc1MZ23TGQzGVRHgV0E=; b=kZtf6gQth6RK04zU
	1OQPPLmEdGqZICiwIrbCfRTqLX5vuWf7hLrbXnfQOG9FVTqovq87y3Pe0JuKvqNF
	kC7DmoL/H5DVauLclCJcplVXEWkNRh5XbsNd/yEkOzgTsQCYhnAej5nDsZ1v+rja
	kF4XkCSnV0k1q1Dcw3KpHnH1aSScCj6SiYmKt7sZd/qVQfFmwCJvZ9ZQfuUXtD7E
	6fIIWAkkn9EBjC3rBuGU1Dkrt1YuK/A2AAJi3kPHJ0DHsPZJCwmekp8G5ZfkRZOy
	KLdTDiEHCHXLGcGJ75oTwrnNIgugBj/TMEoXqflWLgJg405XOGkH6NMK9LixN9iQ
	+OcihQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45j91se31e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 09:42:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A138340053;
	Wed, 26 Mar 2025 09:41:50 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 048BF87F424;
	Wed, 26 Mar 2025 09:40:02 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 09:40:01 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 09:40:01 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: stm32-rproc: Add firmware-name property
Date: Wed, 26 Mar 2025 09:39:11 +0100
Message-ID: <20250326083912.12714-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250326083912.12714-1-arnaud.pouliquen@foss.st.com>
References: <20250326083912.12714-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_02,2025-03-26_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_014308_967190_261B8D58 
X-CRM114-Status: GOOD (  10.79  )
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

Add the 'firmware-name' property to the remote processor binding
to allow specifying the default firmware name in the device tree.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 370af61d8f28..a0a16bfe8ef7 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -139,6 +139,11 @@ properties:
       If defined, when remoteproc is probed, it loads the default firmware and
       starts the remote processor.
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    maxItems: 1
+    description: Default name of the remote processor firmware.
+
 required:
   - compatible
   - reg
-- 
2.25.1


