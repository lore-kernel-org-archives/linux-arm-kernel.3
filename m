Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EE4E7716F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 23:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZj1RaIR689iBjQPsydrspqYQr9x5Ze6T2G/5ThnrAU=; b=oUjoyBppg5fOvudiB23CzdHbhl
	whHbmRm+4UOwYpnd07y72/t4h/iJTO+RRnhUinitax3pd4saCCv5FGuXizmDqlzoLlNvmhNVScGei
	O9WNwi2KSpBbNrhstScGoS9rrzYpwixnWFPUSA3mS4zRu+s8efV8CS1tjXtjhoqeEN6v64DHFjuBz
	ryY1XfMVNsF2e75xAGGYvT/L0u+FTUgM4p7ULj7eeEKupoHhK6frtBY1CtK1ILJwRQsjfpqr5waR+
	nlwm2w2zmS+XiljhqXbPUGAJggGyFyXoegn5SKmgYlb1SuAVPN0+SepSgdPTOMe55GuPft0/hGcNQ
	VzvbbRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIyjt-0000000E8dP-1zZe;
	Wed, 04 Dec 2024 23:25:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIydx-0000000E7T1-09KK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 23:18:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4DMBiZ020088;
	Wed, 4 Dec 2024 23:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZj1RaIR689iBjQPsydrspqYQr9x5Ze6T2G/5ThnrAU=; b=JoUHepWOqZb+uhhF
	A0iLnT1qMsDyWFtNMor4TCISE7HIO+hO/WPTCzgvHaBjnl15j1YyqiWHHb/CwTfz
	b4olG26NXtyySWd6GnhcGgfHNalTDww4SU2dwBeUDyJEmcBmjcVWY/MF2kkbRsgp
	5rQHqaKE7YAAZ/EdXaDtPTEb/PHhbTAwMXPW8e8YXrSSAqEp5/9S/nmYVmnBS/kS
	A/1gjp3jzIj62GLc8HU3TiIWCsHsfOT3M+9Xu/cAZ7Wzge0KRcrh8sjdxciwfK8l
	QQ+bZ1yf2t91mmq7j0WqimGXRWEl5mi9mNqHkHlDgF9+JELVo/zCgbl0DOAE7hPL
	AWGlEw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3excndv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 23:18:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4NIk3l003186
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 23:18:46 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 15:18:44 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Wed, 4 Dec 2024 15:18:07 -0800
Subject: [PATCH v3 7/7] arm64: defconfig: Enable SM8750 SoC base configs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-sm8750_master_dt-v3-7-4d5a8269950b@quicinc.com>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
In-Reply-To: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Raviteja Laggyshetty
	<quic_rlaggysh@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733354321; l=1815;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=fQ5Sm9gJIHB6p616DwV7mMw4vnJJ0bo3tcHNWh+Kj2Y=;
 b=YgrACuve7a7tevFTBV9FLSRN1H2J5rAqNu4Ne7uH6mcsoCfncsT9uFgswuyy12blvmYP10uQV
 2bDVHBmUy8jCSiXfBbFuvGec9cs3Fb/RgOEQoxxsnNo46DUBYalJ+MB
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n64WWdWALakD70dBcEHetR95NUzkXXX6
X-Proofpoint-GUID: n64WWdWALakD70dBcEHetR95NUzkXXX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=758 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_151853_123252_0961C3F7 
X-CRM114-Status: GOOD (  12.21  )
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

Enable GCC, TCSRCC, Pinctrl and Interconnect configs for Qualcomm's
SM8750 SoC which is required to boot SM8750 MTP/QRD boards to a
console shell. The configs are required to be marked as builtin
and not modules due to the console driver dependencies.

Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6beb0b5efd2e693b826d4a3106d4c4b4582d1927..b7a039f3d763b5723cb21810a649281c24b0f2f1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -630,6 +630,7 @@ CONFIG_PINCTRL_SM8350=y
 CONFIG_PINCTRL_SM8450=y
 CONFIG_PINCTRL_SM8550=y
 CONFIG_PINCTRL_SM8650=y
+CONFIG_PINCTRL_SM8750=y
 CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
@@ -1361,6 +1362,7 @@ CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y
 CONFIG_SM_GCC_8550=y
 CONFIG_SM_GCC_8650=y
+CONFIG_SM_GCC_8750=y
 CONFIG_SM_GPUCC_6115=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
@@ -1370,6 +1372,7 @@ CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
+CONFIG_SM_TCSRCC_8750=y
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
@@ -1650,6 +1653,7 @@ CONFIG_INTERCONNECT_QCOM_SM8350=y
 CONFIG_INTERCONNECT_QCOM_SM8450=y
 CONFIG_INTERCONNECT_QCOM_SM8550=y
 CONFIG_INTERCONNECT_QCOM_SM8650=y
+CONFIG_INTERCONNECT_QCOM_SM8750=y
 CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m

-- 
2.46.1


