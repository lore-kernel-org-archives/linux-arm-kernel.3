Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE531C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bn+2EfPxrW74YCVLrUQ7XmafitrVBvkYEYL0uehflMQ=; b=A/SLdD1KAuqcbG+J+0yiHuuTpI
	JzBb3RUewNdFZS89tuiOXLPcoFmIqwhbX2yP8sKbUYPlvgx4iAa2elM58q8Fv1XePVvbW5EYiJ/HZ
	1VJFoVinNxvNoXZPJQGK4SP6DJu+yJoCCGQUeEgBSuQk0RRHWLAaSfXB8dOczNZXNpzvqMcZ3avdJ
	NeizNoLfQG3tBXYRuE/QsrqeWNzy1CnplDEaSpxkG5dAPRhR0hdhOFwzgNyort0t25P5NBDkhU8Ei
	XJS2YvFeckB9lyMsrJlv6Nej8ujNZMqmJ2zSQGwAUAHEmXjYx53S5r+EXT9oFRwczNfhr0kKJYJnw
	jGUgef4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDqm-0000000EtCB-3DbA;
	Fri, 11 Jul 2025 13:31:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDYj-0000000Eqh4-1rQT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 13:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bn+2EfPxrW74YCVLrUQ7XmafitrVBvkYEYL0uehflMQ=; b=SoTqLTJ73EnWj0yObaM+9p4VO6
	eegEUbF4/0yoMwz3RUt1KEfcxnZm7PIXF5rYS2PR0Vce7Jadifyi1UnYEj+eGWRKH+rC8ueLQi2tL
	6cL/qWFfPVmeAAvvTaegRzdbClXBYckGKZrjNfsR6vYbhXYllfnQ4tVcGqvNx+e1lvj8VlGO3du9Q
	wjdwbCBlQpxV+Rh6lQ+0Aw5pg5gn7t62xPsLu4i3H28BWpR0aSZu3Q04vf+uLGLPuia91JlSzoIKI
	Z36/RAA5KOprl4f/ECU7fsYJqlZGqoqu1x0o2mA3B+v1ZqicRG/EmNIEspvyvV4xA0zklzwLW2Xte
	uVPwbPJg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDYg-00000009GUh-0JUF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:13:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BARiTi018184;
	Fri, 11 Jul 2025 13:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bn+2EfPxrW74YCVLrUQ7XmafitrVBvkYEYL0uehflMQ=; b=bJMVvB1Jqbo71wJc
	nKVBtGf8jJfcB2QiiLoK0ZdLSxbrnog4ZKOUhuq5faeB7GFBQvv3SZGbG84r4+to
	37Nq/OWEVBK66RykkaK/IdyyGlvELFstrORvUbYUL8gomURXo1wjDRw04jSjb82v
	Y13Fl9x+vrET0ajkP56BUeen3M89+yS2G8YbBmmXZIrm/kTapdXKGG6rBhSSo8vT
	a99f7ihefrzgNiF2urtq4pjdW9g41+DzlOHx2BKMjkpOpqzzhWdHXQyMpaP2mcKQ
	lA+XIHutyGL4dx26aG5KcaUr9o2ZozBsVGI5h6hLqZE4b/8o/U3D+UuSBYc/BGes
	0KIodQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf32j6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56BDClBQ021644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:47 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 06:12:42 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 7/7] media: qcom: camss: Enumerate resources for QCS8300
Date: Fri, 11 Jul 2025 18:41:34 +0530
Message-ID: <20250711131134.215382-8-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5MyBTYWx0ZWRfXxC8aVI6XJP1O
 Xp8xDr+op1eogsEtsbeYOp6Cv30bRRkm6GppYyfWTlFikzeCRi6YJ9yLom3e69+boi7ZXEh8TVu
 TqXr0Zh53/WCNG4j/DSpEKJKHDSyyphZmO6vHsGKdsl/iWIPR8TAmIiiIvm+vo9ORlZjKoqMDye
 fPQIwM990HCeP7Cvc0uKHfkQOSTUw13i3PjHPykZ97glDC0D8gECmmaqVLrmHI+b2O3QXXLJngO
 8BvwuhFYf2li9mA2MO+oYYERZ8YMvExNp62EmWapaNFOU/+NZTEeDra/vcjQjlexP5Z7VCbZii4
 0uHFOUf6vn9AZRG7Gn4lVRPKAWlQxiuwpAwBXR+xqHN0fESHf7ykSRFJ+c6RRpc02fqQVsVi4iD
 1U9h/m5RPy7a2ffN3MyJz7iYxm2VuYo5ffydKFhduebwWObKrLVtUfMDtHCVv2T+sMH2lTOk
X-Proofpoint-GUID: DsF0ThitgJVYzCklWyN-iT9MqQnjrSWS
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=68710dd0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=5xgrgTx84zIufkjN8CwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DsF0ThitgJVYzCklWyN-iT9MqQnjrSWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_141258_742380_A58512F0 
X-CRM114-Status: GOOD (  11.07  )
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

Enumerate csiphy, csid and vfe resources for qcs8300.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 124bb56167cd..6cd6a5116f5e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4569,7 +4569,14 @@ static const struct camss_resources msm8996_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8300,
+	.csid_res = csid_res_8300,
+	.csid_wrapper_res = &csid_wrapper_res_qcs8300,
+	.vfe_res = vfe_res_8300,
 	.icc_res = icc_res_qcs8300,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.csid_num = ARRAY_SIZE(csid_res_8300),
+	.vfe_num = ARRAY_SIZE(vfe_res_8300),
 	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
 	.link_entities = camss_link_entities
 };
-- 
2.25.1


