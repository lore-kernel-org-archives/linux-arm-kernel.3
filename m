Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6174CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 10:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqDXoEyYjLRclnNgz6+Jqy/Kv/maF7IMepbaEjnrWo0=; b=k+C2HMDu4VEXbbFSxPpS+TXUTR
	AYu0rxfUIfx05tT5U9HyV/K5Y1fRxzajQyKC6Bx9VJmklP4k2QvlfpkXo19pG5M964CgNo/3I56FY
	TU2ahBi/Yuk9b+dCpw5UDoLXP4px9NT7gwp5Vym+UXkJo9c2tQWuW0pKcerE6sAzsle6amY9rJTGy
	HO3G46TFyHqFuAjYhJd9f7WGaJw0AlBclHzxH+z5RmkK5Qu4ePxokXkR7bYTnwx6hrkgRwetwTcnh
	b9XD8g0OsiIOYd8V0DHg/Dx4Wtebly27sLvqdHJC9GMh61XJqsL20FHTJ+0smm3ZjzJKw88X0Ao+1
	obqNm5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOK6-0000000DboA-31gR;
	Wed, 25 Dec 2024 10:09:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOHm-0000000DbLU-2JhJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 10:06:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BONkMk8021968;
	Wed, 25 Dec 2024 10:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqDXoEyYjLRclnNgz6+Jqy/Kv/maF7IMepbaEjnrWo0=; b=DOcn+PRVwpwyd4R6
	oveuEnK3HVXp3xvtB/LS077tiG/4g29q+Dq1YtRiHvFdd80Qbf0lEDbJQrXFps6V
	ORF4OBurfU9q+9hpxVLn3TDjOuX0YoW6ToNqahqBtDz3+DRLSDxkY8p8XJ8HxQ+t
	Xw9U/IUzANQepyzB/VZPNnYnlGgg3gAwcHCXvpE96Hq4ICYFrwV2rumZRlSNHUtL
	KkGOljuGv1zDqWsaOtQ4aLDHYYM2Iw/GRKiMeyuOsJXlsqpQzw2m7OVNHbTRciRC
	cx5NyMqnBdxj+cg4df/4WMqqCxbvJCEuLMdImoMRGpBQD2QsIH65RqU5HwB1Lbd6
	4fbQaQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qybd4yhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:06:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPA6Te8003110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:06:29 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 02:06:23 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Wed, 25 Dec 2024 18:04:45 +0800
Subject: [PATCH 1/3] dt-bindings: net: stmmac: Tune rx sampling occasion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241225-support_10m100m-v1-1-4b52ef48b488@quicinc.com>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
In-Reply-To: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735121177; l=1213;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=Apxfv2T/un5aZ85UbnR2vXIgKjHF/0BsJNT6F5/1VEA=;
 b=ADtYydjbO7oefF/JqDoZc7oxIOVR2uvm8OpdSMe5eY2xDP2+uAG1SicbLfLaCcXb0ABi0W4LC
 ev2B/iaaJbvC6KWi7Y5DI+mp+sTQjConT6pAc23EW7xEmGOaw9TdNE3
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f9_Tnsl30W4T8c1jb2p8xz9UwclxlR0c
X-Proofpoint-ORIG-GUID: f9_Tnsl30W4T8c1jb2p8xz9UwclxlR0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=498 bulkscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_020638_718025_F91B5938 
X-CRM114-Status: GOOD (  13.04  )
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

Add documentation detailing the capability for tuning the RX sampling
occasion of the Qualcomm MAC. Introduce a new flag to indicate that a
board requires switching the timing of signal sampling, instead of relying
solely on the EMAC version in the driver code. For older DTS, the logic
for current boards is hard-coded in the driver code to ensure they
function as previously.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index f117471fb06fb3b507df811d55d41d0b610ac15f..dab6d9ccfa9a0b64e314a4cca84f25b97f6cee40 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -78,6 +78,12 @@ properties:
   phy-names:
     const: serdes
 
+  qcom,rx-prog-swap:
+    type: boolean
+    description:
+      Swap the sampling occasion on the RX side. This can be used for
+      tuning when connected to a third-party PHY.
+
 required:
   - compatible
   - clocks

-- 
2.34.1


