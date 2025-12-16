Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63044D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDn8E5SZH3haG+EaPJnzeVYGaSLQewkEDM55mF67Wt0=; b=N8KkZgW/KyobgmnhXHrvNytdhp
	Vh44J28gTAM7Jhih382r000xzDIWwBjADMQlxnHTnC9ubol+HjlV5R+Xmfk+v7963NizC3nPROQII
	OZhyiz6cMe9BDir47O2NFU38DNMVSAj3ECP/8mLytue/MtvQZe4VTQdNHXDKlvw45IB6ACkKJy9kF
	PxzOo58gVk8OXdqmLELwS6feI/EyN8TlyvB5ROctpgjBVwFho9jWPx8bJp+iQFAsEXEc3PMQzDiSJ
	vv8OOVO79wejG4K364yMmE/54TWOV2Nyv/WAPdwmcwFt4cKOLu5bc520JG5AYAxavSd7YV+rCKVGH
	mokHibKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOSl-00000004mAZ-3sGF;
	Tue, 16 Dec 2025 06:23:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOSj-00000004m9I-1VvM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:23:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG65Pns4174108;
	Tue, 16 Dec 2025 06:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TDn8E5SZH3haG+EaPJnzeVYGaSLQewkEDM55mF67Wt0=; b=B/POJeVL4Ajb1tNL
	W9lcWXc6l2yWgQJelk4j07TxMHAZQCIQEHgO1PqTuyd4ZRkzSd7p61F+d5XwHKxg
	oFT9Ss67Fwul2EBBlVYyH2wzl1I2F2cdZo2ZeP/caRdI9qU+6jdFIZ777EWEUXoS
	1FjmqOEY1msB2lT+b5uukYrPocOEu+ZarBMlR1TldoXqnKvLYBKpZ4ilJvNvAefV
	IgB7sWMaJx/ON+5Rr4BGkFI6Bfx6zq7VULJ+tnxhiPKNMEoerLYyqHM2Dpu9ollq
	0Tw+WSLQcF9k2hKL0aDr1weIOEkFN9w78nmTl7GbzIiFpXwHEBxb8SJRh9YzhZeR
	YUQatQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2ks03128-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 06:23:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BG6N0io006345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 06:23:00 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Dec 2025 22:22:55 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 3/5] arm64: dts: qcom: monaco: Add camera MCLK pinctrl
Date: Tue, 16 Dec 2025 11:52:21 +0530
Message-ID: <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dYDLD-P3gjbFYBgOwMe2OcwIABh21Mkb
X-Authority-Analysis: v=2.4 cv=eZcwvrEH c=1 sm=1 tr=0 ts=6940fac5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=6Pri4IUzgJ4UHTSCBaEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dYDLD-P3gjbFYBgOwMe2OcwIABh21Mkb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1MCBTYWx0ZWRfX6CFFgsrB2xPE
 nRL+jBo0TQQlnz6n8HtVLrTp0BaLTqix7g8wMBPBhAaNkNjYRXlmqf+MIvnlHDBSKWX/At+nHk+
 jDlHkKtkq00UyLjmCzGHuIxcmEFDYgM0hGaOQa2tx8uPtkHZQsvOwfc4OhoX3CBko3CFD6YkS7S
 SIA3vC35reApIHeeTmqLQBPN8eJWu5UcbQpdhKkJPrmkXYupDege3pCUaJgVtr8kvDg8kBtT7Ut
 ANWBRXacQEhGh3dqP3NHSwFyKrWUuiVqeL8Qe310V4G2LfU6lxm4ioLRoovRIBFGqyuDDUiYj/P
 A03IB98cH7N6P5oWk7fwHMFq3QBNurDhlreIBs/k3+Pwi3sumvAKOshwsk/aQQ0ayKV27c7jqll
 EnvY1VnYAb8K7U5pZKfI56YpIOPbfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_222309_406156_E53C33EA 
X-CRM114-Status: GOOD (  10.35  )
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

Define pinctrl definitions to enable camera master clocks on Monaco.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 4b2d8a449b00..ace09239d167 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5182,6 +5182,27 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio67";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio68";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio69";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio57";
-- 
2.34.1


