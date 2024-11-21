Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC39CD75BC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7QGRJT45n0T5+Wc2ENAMTJgAWENYDW4gQh9c7sFtMA=; b=m5+Z1wOT9/duUNzyeP6tTDeKmx
	yb6ruv/WsHj41XP0moWCkqHSQYXJyvsiCF+iVe05vx+RXqPz6afP5jK1Llm2MBfyJ9Lwa3oEahANB
	UOKl++rnsS3YbbLAQdUrxIngI+H2WEct5ihuD9aHqGgUYMxAXuQHnURIN/MekURKXuaKk3ZQ3BdHk
	C+EbOd/eU9tjIWCw/Mt+XnOLqBH2snfPhFn0hCJ+rAroGM1CgpQGCb9/e/M6Br0JR6razt4uM1uvo
	tPCXyRkkgz3NOLaQ9myrIrpqcrD7y5i/+H443+nrC1JlOVqe3Cd21zJB+knx23hG262UiOmtuv1qU
	AWKG+7eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE0ju-0000000GvmJ-05jt;
	Thu, 21 Nov 2024 06:32:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE0hB-0000000GvEf-4B8b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 06:29:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKSNM5003971;
	Thu, 21 Nov 2024 06:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r7QGRJT45n0T5+Wc2ENAMTJg
	AWENYDW4gQh9c7sFtMA=; b=e1tqEh07ncsSPIDTj0OtsSCjsGJHI79/+o33X2i7
	MC6s0rHZZrfEtECwEZ65pOGaOFyrz69gXFU4bP4YhYGL2RHO8XOIxkHUsfzFW05u
	0I3Bn/vF6DQZifcSC27fTGyT7grqC570OEJXvONeVjIY1mTBROtYrnP6kWaQsWtn
	QQUWZt13PsubGvAtbDsQT7UJDy+UDD49EnS5/W0Ho/r66ZBL34VlnywzsDzxKZdw
	3a7rwtcGrFFUIm6B+4OBZg/O/FJtbAhoAhpqurs0gaxu6dz3jT+DFeELjeFkbGBr
	i7vdLmVpIDJJp4ZPVizMs6dNavQ5i6xXapLKVXamGYOzSg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3axp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:29:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL6TQmh025550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:29:26 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 22:29:22 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v7 1/3] dt-bindings: arm: Add arm,static-trace-id for coresight dummy source
Date: Thu, 21 Nov 2024 14:28:27 +0800
Message-ID: <20241121062829.11571-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241121062829.11571-1-quic_jinlmao@quicinc.com>
References: <20241121062829.11571-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: noefrPb6PaVQEMUMK35Xlg45owA5jzaz
X-Proofpoint-ORIG-GUID: noefrPb6PaVQEMUMK35Xlg45owA5jzaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=926
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_222942_038263_0C857D33 
X-CRM114-Status: GOOD (  10.27  )
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

Some dummy source HW has static trace id which cannot be changed via
software programming. Add arm,static-trace-id for static id support to
coresight dummy source.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
index 04a8c37b4aff..742dc4e25d3b 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
@@ -38,6 +38,12 @@ properties:
     enum:
       - arm,coresight-dummy-source
 
+  arm,static-trace-id:
+    description: If dummy source needs static id support, use this to set trace id.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 111
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.17.1


