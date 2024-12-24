Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F696E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 03:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wMZoz9EsR7ePQZtOUEnxMQEqwmOfNV6YCxuM9WMR5ks=; b=Ll/cfFMnC8K8Xf
	tJR2h3NQRRAIAIJ5BWGDvyXadBRS7Y42ldg45sF6KfpVVjiVPzkA+QLR5cwe1qJTgu8SMP+PhJ21z
	apLYTt4VZWt4mWbOCsN6ByjATqSa+F4dgQB2v/0kxQNon7k8LBJIjwdI/DtAiDHD4H5crUCYP0gJq
	BlXcGsXpt8h9wW+Muic2h0uBgg+J6gy2JQRPxPCGWG/Dumcd/Q2MfyRZdV0If5Cxx7+kFzxaeiYot
	by3GTk0gag6bO5ZgN1nrKLi4Cz5qjgo/I+nFRepkImJ5BwZce9ktT7KGrzkGHaLCxpAgWgptcN6hS
	YkIEmFoaGCjtrjVnSoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPvIC-0000000BA3G-36II;
	Tue, 24 Dec 2024 03:09:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPvGz-0000000B9mZ-3ru3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 03:07:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNNTYBd013037;
	Tue, 24 Dec 2024 03:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wMZoz9EsR7ePQZtOUEnxMQ
	EqwmOfNV6YCxuM9WMR5ks=; b=EOC6Bu5JnzVPzTD6l85NCKthQbR4LysUp4WSwU
	VH41PRk8bHfzOAC23wBUVk1hXL5jnlvoccL1zDc+xuHQJhraDzurv49wArVWmgDA
	JAIGzYZ2Ym39MqugT4K57XVYGqqY06m5PdWkE+gIF0lpV1p7EDHsAgcg9eP4X7Hq
	gMkbHNJFAd8zyl61CbUVtD8GTJgw4A5YiVbPca+vw5/ZRtRg7xnIM6nsT7tgy1Sv
	EhdwboKVKOI4wNfrvC6XT+nWx9BdPyqrFsOM0PfayPSzwfI4jTnHE5QkfS889ykM
	7mQDkdJ2nt7mHy9p7ch4IPy0uh/4kUPGbRN8ikct7r3Kb+nA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qhk60fj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 03:07:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO37eIQ010620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 03:07:40 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 19:07:34 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH v2 0/3] Add standalone ethernet MAC entries for qcs615
Date: Tue, 24 Dec 2024 11:07:00 +0800
Message-ID: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFUlamcC/1WOy26DMBBFfwV5XUd+xiar/EfVhZkMxQtMaxOUK
 uLfOzxSldld6Z575skK5oiFXaonyzjFEodEQb1VDLqQPpHHG2WmhDKSjhfosA/c1dI6VwslWsu
 o/JWxjY916P2DchMK8iaHBN2Cb9RezPh9J9G4tbcqDH0fx0uV8DHyTSY8W5a6WMYh/6wfTnIl9
 mfU65lJcsGN8WdnQ+Nrc7uSAGKCE80u0h3wB0DKxoG0XoOAA7BYJ/XfpP9ARaBW59BqY3UI7RG
 c5/kXcfy2Q1IBAAA=
X-Change-ID: 20241111-schema-7915779020f5
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <quic_yijiyang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735009653; l=995;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=V1zGyQmYhn1B3R0aP6noecmZ+tYMiaOEfL5LiuDtAuQ=;
 b=iEN0aQA+fbBlJbyinT4oTHXLhJpGSTXCeREt86FPbzelipctnYMpOhtUdAINO5U/fBryetUY1
 IDC4GW8y4bFCV8HY1h9dkx70wnuMcmo5Sp9m2IvA/YZAw0FRfVRBvj+
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7Fp3y0zv5LQdjJWuF1eOXv_iFRKNJRYt
X-Proofpoint-GUID: 7Fp3y0zv5LQdjJWuF1eOXv_iFRKNJRYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 adultscore=0 mlxlogscore=664 priorityscore=1501
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_190754_097517_97F2E439 
X-CRM114-Status: UNSURE (   9.53  )
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

Add separate EMAC entries for qcs615 since its core version is 2.3.1,
compared to sm8150's 2.1.2.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
Changes in v2:
- Update the subject for the first patch.
- Link to v1: https://lore.kernel.org/r/20241118-schema-v1-0-11b7c1583c0c@quicinc.com

---
Yijie Yang (3):
      dt-bindings: net: qcom,ethqos: Drop fallback compatible for qcom,qcs615-ethqos
      dt-bindings: net: snps,dwmac: add description for qcs615
      net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
 Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 4 deletions(-)
---
base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b
change-id: 20241111-schema-7915779020f5

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


