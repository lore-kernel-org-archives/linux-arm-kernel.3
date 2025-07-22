Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D02C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 08:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woNBnziE8osFFeyWhWsrxwNCjZX1BCpANYJQWz/MjCQ=; b=EyAQ7PgDNYoGGJEpcBNKVU/rib
	IFB4M5VLkD/r9gty2GGhCaJZaIKbrXpYkn7Ew9PUhY200GACmMLSpjlCpPy+wIy7jOdIDa/uTK9P9
	rwWoYNubx+cA3C1GrQZiJLGCU9j2etNdKTOJUuVrrQU8Tc+uWA4HmkAQPtvX0nvqcUNXmpkh94RjW
	FpvuTrgGJRUT9IFRV0HQAWP8swTFqPTXJP5crDa9JDSaX/F7NEs28EKRF6mAGwkDYi2QvMUY4Xk2T
	clE6aA50hr4Xqza/7dxNppYE2gvZ3p1MVBgqU+SdeLT4hQaljuya1oAnFfNW6YEBs4pm8Ocy/zicp
	As/jwSrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8BI-00000001n9A-2ocw;
	Tue, 22 Jul 2025 08:17:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue88o-00000001mWy-2uJd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 08:14:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7WnZc032748;
	Tue, 22 Jul 2025 08:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	woNBnziE8osFFeyWhWsrxwNCjZX1BCpANYJQWz/MjCQ=; b=mA3tXiMZBTFU3Aiq
	rwXOXyKNsT8+arie+Am4BTa44zn/cMq5AV7cCm3ki5g+nVHmnl5RuP+p7t5Mc2dG
	rJUBJdFQVEH7xTDVNIug7yIIDWemPciqXH6zFQzVeQR9DAQcFoIMMsiibpHT9bVK
	tlOKfOCugS1qw/ZCxecK6qj32d1Eonj+Znb6rmYKsVMfgwfQklnqhC2kHmW+EBne
	a2cR5Q7qRWUMwFvr+g9wixyI5Rfd7XuKb3ne/83m6zstcCFGwFohoVd3oPber7mL
	ttBgMuAlvMQMvnejWuYX5uxtXS7UeQtl9eVQZPLtvK+9hA9OfXpzkXpSt4wLNjCI
	wbzgqQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v70da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:14:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56M8EHWD001630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:14:17 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Jul 2025 01:14:17 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: Yingchao Deng <quic_yingdeng@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Mao Jinlong
	<quic_jinlmao@quicinc.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Date: Tue, 22 Jul 2025 01:14:04 -0700
Message-ID: <20250722081405.2947294-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hi8_RfKdThoqSDUBJQQfjdz6lmBEjrZA
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687f485a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=uCLwI1R7FFjruh-RNAkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA2NiBTYWx0ZWRfX6khDhDQYbskY
 6+nq7lXXzkLHuvfuq63A0CwfXijqGyH+8twIRg5eh8KAEwM200xDX/5FFuMj7hcguu1EXRDSAci
 KNgl5m8LG0TzO0JB4BSopuO1rTV3KsJCRp41TljvaEkwpbckt+lC3S4QYDm7rQvM1appByty6oV
 yr1GoOKGKvnLfv3h5OjhHNSBtnEDxbzsIzQAM9Bkui8aP+PAY7yBcPJh+6dCARiUYVDqgAlRMvj
 E4ZQf4ZfLU09zWRynOO48C6RboEa5XF3spYZCvFY34fWxp+fF2tXzeb6qDhNO11lWzRUkJKp+3+
 bCSU7lqi4JTF+4r3p0sfxOb/4toDmTk9mMc8Oo0G6dmM+JN4KcoP8m6gM/LrrZJD6aWuFwyicoP
 +MSBksbLdu8L6GqLmScZH9PjyjatGMVfyTMx79z0i9euJ1dhB/kyRt1T9VgfoxfnMgICR/lZ
X-Proofpoint-ORIG-GUID: hi8_RfKdThoqSDUBJQQfjdz6lmBEjrZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=871
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_011426_733336_A25F6509 
X-CRM114-Status: GOOD (  12.34  )
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

From: Yingchao Deng <quic_yingdeng@quicinc.com>

Add Qualcomm extended CTI support in CTI binding file. Qualcomm
extended CTI supports up to 128 triggers.

Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2d5545a2b49c..1aa27461f5bc 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -84,7 +84,9 @@ properties:
           - const: arm,coresight-cti
           - const: arm,primecell
       - items:
-          - const: arm,coresight-cti-v8-arch
+          - enum:
+              - arm,coresight-cti-v8-arch
+              - qcom,coresight-cti-extended
           - const: arm,coresight-cti
           - const: arm,primecell
 
-- 
2.25.1


