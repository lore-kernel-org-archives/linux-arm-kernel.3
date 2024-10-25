Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946DCD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 04:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwMWhgwUsncIvAoBDC7Sn1syFgKztW5s/fFhnZ/XXvc=; b=iH77+7RGD88T10P+BpHltFiMnV
	qayVXAdvIgR5vbcX5IbtIOOzONvmxaF9u7PHVGp1tslmkhsPkYdSkk1pK5RyaDdzl+s0KHQclu7yn
	wBy+LKkvmKKlHnRepwfs2rDqUo4qGWXj3xKfNwCUNXAR99NWVe5hMAg/mWq4XC8XKhCIhO6LtE9ST
	OxXOjQ9IqhBiQci3qwooKJROqKX79gxEUnaClHWZrhFrWo7SNLJzEZceoTpQGwZp1q1PdqOCpI/g5
	KCyOXmTMsGS7eHqFR029y32rW2NJWkw9yOOgb3EVzTAda4TMXItWtckvRP9nUMca/Q2HheZ23xXXY
	SUbM3a+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4BVN-00000002S5J-1lrM;
	Fri, 25 Oct 2024 04:00:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4BQs-00000002RG8-0AVY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 03:56:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OL32Ko018568;
	Fri, 25 Oct 2024 03:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwMWhgwUsncIvAoBDC7Sn1syFgKztW5s/fFhnZ/XXvc=; b=o6NwZFzcmIKkNfXk
	WQrHYaeSPxDZGqNSNdBaHeHXu1AjVMIaeYEeNLBbhS3cUHoTsECeerCfFbu0deSK
	0H4SCYFcOAnM+KD4ELG30kzoQBxZAyRdGtRvBvL6k90QqfX7RYZnCucDpJsZqcWe
	NoFMtERLarALlXD/Bcl9rz22njn86aeZT+WlpHngVNTy49JNqK1ReW/ULDjisYKc
	FgkmcnF5Nf0xAQrTKpDP3oqZBw3T32Ontan0k6/Phx/3jtQ6Dlosh5EfCsHkxffy
	My7cmhX11yciBEZ5iPeKeVo+BwNtKzIpW7ufa8enLoGLbHkKeaVi5Bw1QwFeEwqt
	Z4yYoQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em66fp88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:55:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P3tvQB000682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:55:57 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 20:55:50 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <angelogioacchino.delregno@collabora.com>, <neil.armstrong@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>, <quic_anusha@quicinc.com>,
        <quic_mmanikan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v8 2/7] dt-bindings: clock: gcc-ipq9574: Add definition for GPLL0_OUT_AUX
Date: Fri, 25 Oct 2024 09:25:15 +0530
Message-ID: <20241025035520.1841792-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
References: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6_2x5gh4TVYwVh4gAYn0Vlr_Rdb26_tu
X-Proofpoint-GUID: 6_2x5gh4TVYwVh4gAYn0Vlr_Rdb26_tu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_205614_109681_3DE634A8 
X-CRM114-Status: GOOD (  10.93  )
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

From: Devi Priya <quic_devipriy@quicinc.com>

Add the definition for GPLL0_OUT_AUX clock.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V8:
	- No change

 include/dt-bindings/clock/qcom,ipq9574-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,ipq9574-gcc.h b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
index 52123c5a09fa..05ef3074c9da 100644
--- a/include/dt-bindings/clock/qcom,ipq9574-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
@@ -220,4 +220,5 @@
 #define GCC_PCIE1_PIPE_CLK				211
 #define GCC_PCIE2_PIPE_CLK				212
 #define GCC_PCIE3_PIPE_CLK				213
+#define GPLL0_OUT_AUX					214
 #endif
-- 
2.34.1


