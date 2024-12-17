Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0F4E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtCfWtly1yA8xA6HRcgTnBmAYXHBLqBXnS/SuV3GJW4=; b=FU2hgU/a7xyMbiNzQ2xFazhfUQ
	/jqVgV5HA7Lh/wmyecZcOAW5V6sEvtu0Uda/aU52HnvcXi0Q/LAmZeeXJ7c++eNaDULsMyGD5fmut
	5bjAHTVcnR1zD5oyR6i/75dnHRN8IjAxBUsOKGTXMTudsludkp+Q3JKvQHIMxWnl74al/s05hCc7d
	dMdyvbScuzfn8xtCJh2I2P5Loe233iPLfLv3BxHJtsgGlUShl0JxFRuXSlTO5y8O2hpsAF4Fg+fUj
	moS1uvwiDviTEhOCe+g/1fG/0iW/CEFM9Z+vBrlsXB52dOF87P13g71/n0radSmKfFh7dboJGCQaU
	/orfxXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRZx-0000000CVxH-2ufB;
	Tue, 17 Dec 2024 07:01:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNROJ-0000000CTCH-1lMC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:49:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH5faib001075;
	Tue, 17 Dec 2024 06:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vtCfWtly1yA
	8xA6HRcgTnBmAYXHBLqBXnS/SuV3GJW4=; b=Q/r4Jdtpcv5dob/GZwlqsoaeu3Y
	I9aSRHpyD+D7CR87OsD8PHe4xNfyiww5K9TqaXWpRvqcIZPRlUe4aA4cplM3rpb6
	TgwrXfhaZPiaU9wHov3kxH+kr6MLdpvb6Ka77YEf9SMKWEV2clz6eoAmVvhLAYF2
	8VrCQg7PXyTxuSwnBRA+DN8DfIjdlgTJZ0YqqWSq1rtbGskkiMgXjTieMEwXS1ln
	HdUO34MaHP9uAEF0XUJclMxHCojWNMbK27yehhPQfYTIBJxDgj0Mh8WkCItkHGrD
	mZXInct+/uxwVGeKJW0LdMrTET5Nn7kWOBs96DiAWY3RZmSXTE+LsADxAJg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k3cgr5e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6n038014907;
	Tue, 17 Dec 2024 06:49:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43h33kx8y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:00 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BH6n0Yb014877;
	Tue, 17 Dec 2024 06:49:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BH6mx2E014866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:00 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id EE1124D9; Tue, 17 Dec 2024 12:18:58 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@quicinc.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v4 1/7] dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
Date: Tue, 17 Dec 2024 12:18:50 +0530
Message-ID: <20241217064856.2772305-2-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
References: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YoS6X7iIYxFi0ijNobwelX9gXXUQjlNg
X-Proofpoint-ORIG-GUID: YoS6X7iIYxFi0ijNobwelX9gXXUQjlNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 clxscore=1011 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_224911_465424_EEAD6A14 
X-CRM114-Status: GOOD (  10.92  )
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

Add the unique ID for Qualcomm QCS9075 SoC.
This value is used to differentiate the SoC across qcom targets.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index e850dc3a1ad3..1b3e0176dcb7 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -284,6 +284,7 @@
 #define QCOM_ID_QCS9100			667
 #define QCOM_ID_QCS8300			674
 #define QCOM_ID_QCS8275			675
+#define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680

 /*
--
2.47.0


