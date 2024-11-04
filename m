Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE8AD132A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zY6WwSnWBK+sJbMEG9WnEhZquIYMOfDGtRU22+UrV6w=; b=iuXd5Bg2sTPKT/pYtxTFnzHV+4
	YcLGuxE4EUVXOaAn16YeSgSL4zdrlPkG3zAr/8EkT4XrqT6vH7J/uioI/DnIfMnaNEcZU2XMvu+mt
	w1JCB3IQDnARcl9tjUcoQl79m9T4ldGJVbi/c7xWIbTPfAXbPqBmPyzet31rbWhVFqmOawaWOrjyq
	BM4S34NtKNmI0W9p0V5I9RB4WV4p7s9VPjl7CD4gqMmDx4gD5+4PxpAFAsxf2u4q84Ws6JX+dHoFX
	ANqCz40VsvtUHJsmGhUpDEeaXltK8oUJ4ce2HC4IdojIcnHxQg/kQJSR6Ym65/LjfD7K1OnLG3QEq
	kGkOVZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tG1-0000000D8Rh-04oa;
	Mon, 04 Nov 2024 09:20:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7t6s-0000000D6WM-01IL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:10:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3LRwl8019485;
	Mon, 4 Nov 2024 09:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zY6WwSnWBK+sJbMEG9WnEhZquIYMOfDGtRU22+UrV6w=; b=dY/hzezfoGfjPOpj
	eECoPqTs3cEVN1QmcJT4vYeoF7eWKq/PK15ScMdg6TR2orMXu1TlVWILVCPI/ccu
	TY4V7fNdGL7DZP4Ktb8SoualgVzwmXRdPJGF3sqZwRwJBhVje31aE5Zi9lYKv5vs
	JhhgSRnB7yK+lryYZi4vvAHmGDJqNRWLcJcaeYxwhIeGyBXDQXqMcqtePd8UdSZE
	CCmdSvXK/B8hxKfxGmMWQGRsSwddxyZjlpie/YZhaAlwp1dM3wH96QaRZrOp8UWz
	EQxXpK84I4qrnZfQ7caZ7ATJeI6Th6vLjwioedianXF+nuEasOwkTllaTmHFxY83
	LzMl7A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd11umht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 09:10:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A49Aakr022322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 09:10:36 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 01:10:30 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 4 Nov 2024 17:10:09 +0800
Subject: [PATCH v5 2/5] dt-bindings: qcom,pdc: document QCS615 Power Domain
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241104-add_initial_support_for_qcs615-v5-2-9dde8d7b80b0@quicinc.com>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        lijuang <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730711423; l=871;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=AtswLMPp1Wi7CQvp+HGZVxBi+0M87Go/UAkK7Kw+6RE=;
 b=g7nFHEm47uNAEqE10bJFTwWVt8wSW9DRVjVPxXY7rI92zn3yeb9PH7mbaRyOt9Li5xwrOME7R
 CZEXBs8tqgcDaehzl8hJZfq6Q52vzWiPmkGbwraxllfvumjXjWdpTMm
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DInw8SBv3YmR9wUKPOy6ve_lI9PC9jHk
X-Proofpoint-ORIG-GUID: DInw8SBv3YmR9wUKPOy6ve_lI9PC9jHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=810
 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_011054_204388_7E594A52 
X-CRM114-Status: GOOD (  10.82  )
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

Add a compatible for the Power Domain Controller on QCS615 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b1ea08a41bb0..ac7ccd989441 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-pdc
           - qcom,qdu1000-pdc
           - qcom,sa8255p-pdc
           - qcom,sa8775p-pdc

-- 
2.46.0


