Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46441CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tI3ydivwzZpjdgTNdFF7o40pjFw/3r9BeMoi/UwtNJs=; b=R+7mnSSfNGuK0s57t84pq8QysD
	+uhZtyc8IiB6XLeOn/RUM8nUtc7u6wvknmLGMQbRoy/Nag1WYWMyCB5rkH366u282jJs6gYImNlt/
	qd3uOybJynjece9v1R7XaTR02dZ3onoamJB8UbZzMnhLGZH3gMKucGBbtb6AF8cPMvUwSBr1O7A3o
	r2eqtT9+aa+CuUi+zHOkngincm3kpgUaFuRfdLWwkvzrp9oKx4UvtDbqCwA4DoFtFC1j1U05E7fdv
	0td3ut+ya+dD5NbFxaUJHSiF0upS+Lriz+WOqZeXVK0/M5V/NZrjqCUm47CubiUZmXnDLOEHQiRVj
	ecpMoC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24Ji-0000000HMk8-10tt;
	Fri, 26 Sep 2025 09:00:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24JZ-0000000HMeV-3umf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 09:00:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vard030527;
	Fri, 26 Sep 2025 09:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tI3ydivwzZp
	jdgTNdFF7o40pjFw/3r9BeMoi/UwtNJs=; b=JS/uduzc9QDb8EiZiEgBtk2MuzA
	lJbXIxbcwjCOMSxigtheBZ3tDlfl3f8q75/gIYDzFDGhKqBqpPGVlYmbdj+SYVoz
	N8MNt3S276aonO/s0BMBkmKOy6ObhamAnveudgsjPGldSwyJbykyyv9S5WeUMMEM
	lx5opUaRVPZHQhFvxR70T4bh+k1UFtg+3tRn5kCzE36Yo87DPkmkiUPv7q0UfBzG
	LqRz3WBPChJDl4JuUvxOZSucd2mCkX/QOsjGeKQ9QjYmUZxvxXfDHghcRC73lJ6v
	9bJs8iQTzqG8lMsbRRg5ILeZGPTDpzsgX2qRiAc7nPMZDhZ4Tkai2XLOT+w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u26gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 09:00:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q90BNx008610;
	Fri, 26 Sep 2025 09:00:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 499nbmgtp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 09:00:11 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58Q90AMK008577;
	Fri, 26 Sep 2025 09:00:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 58Q90Ace008573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 09:00:10 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id 9979058A; Fri, 26 Sep 2025 14:30:09 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: [PATCH 4/4] arm64: dts: qcom: lemans-ride: Enable mdss1 display Port
Date: Fri, 26 Sep 2025 14:29:56 +0530
Message-Id: <20250926085956.2346179-5-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CjD4wHk1vGHtmdKmyRB5W09kt0RDR1mM
X-Proofpoint-GUID: CjD4wHk1vGHtmdKmyRB5W09kt0RDR1mM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7hgvq8QoI0Bq
 YwOesexJMisfTCuhGMvQZIaW8WgrM4C0mCeNjzWdw33tz+xY11er0JGDBEzHyAqVCq+oAmQSg63
 d3b+TmJ2IuqMgTY+o2HpxO8/7YMNL3Xk7TT9c/pZcB16KCQVjkzxMtHfgigfKixfqtiBQYv9jWq
 X4orwMZfuLhpoZ0JT/uB1KKG0hMuWHCL5E0ELLcqkJyj6zq70kWqgIgg1omdiNYVlwSmbaQK7Ex
 LhtOurioEBb/0/XbdHBoZxzzOeTWxYrydWvwmAsuYjEf9osbzXQUln6FN/agsAebTv5TlXeD5Pj
 NM9I0aAPXESxw71858bXSpRGhUFSmGH0Sneacegw1EYSOhZmIxMNT6FAEKkV4vYkTAfoKdiI4aB
 FOmzZPxStjx66qR/sGHVWGkcFKxeTA==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d65625 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=lcgM4KOETyTTvZj5T8AA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_020030_106376_CF15DEB9 
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

This change enables DP controllers, DPTX0 and DPTX1 alongside
their corresponding PHYs of mdss1 which corresponds to edp2
and edp3.

Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
---
 .../boot/dts/qcom/lemans-ride-common.dtsi     | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index d4436bc473ba..5a7a1c131dd4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -180,6 +180,30 @@ dp1_connector_in: endpoint {
 		};
 	};
 
+	dp2-connector {
+		compatible = "dp-connector";
+		label = "eDP2";
+		type = "full-size";
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_out>;
+			};
+		};
+	};
+
+	dp3-connector {
+		compatible = "dp-connector";
+		label = "eDP3";
+		type = "full-size";
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_out>;
+			};
+		};
+	};
+
 	dp-dsi0-connector {
 		compatible = "dp-connector";
 		label = "DSI0";
@@ -635,6 +659,50 @@ &mdss0_dsi1_phy {
 	status = "okay";
 };
 
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	pinctrl-0 = <&dp2_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss1_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss1_dp0_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&mdss1_dp1 {
+	pinctrl-0 = <&dp3_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp3_connector_in>;
+};
+
+&mdss1_dp1_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &pmm8654au_0_gpios {
 	gpio-line-names = "DS_EN",
 			  "POFF_COMPLETE",
@@ -812,6 +880,18 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 		bias-disable;
 	};
 
+	dp2_hot_plug_det: dp2-hot-plug-det-state {
+		pins = "gpio104";
+		function = "edp2_hot";
+		bias-disable;
+	};
+
+	dp3_hot_plug_det: dp3-hot-plug-det-state {
+		pins = "gpio103";
+		function = "edp3_hot";
+		bias-disable;
+	};
+
 	io_expander_intr_active: io-expander-intr-active-state {
 		pins = "gpio98";
 		function = "gpio";
-- 
2.34.1


