Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12CBC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 20:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUkeSo7YC2+Gn2w1d+tbi/AOnqcGp5wOrds4KCweP6o=; b=VsNlJyZvn7Qu+GzS0a3eYm93xV
	qP9cIJpaky1jB+bnGubF8WMaNFeAf38eZjNPaog+ZaLiEU1lxMHOvqqSxr2aJhEu9zAGMK6Q1YC0X
	folw2FDs7NI7LMSzZBx4jJkpsg35lNSuTCZycBhABGB0c+c69BLx9gZRIjtJoRE+P7kw3qRzmPvDC
	/xTM3iMtX2w9h/ggRZiVohAis7NWNA1Lvubq1/845OBKEMlxH8JDDpBCEteWwHOK3iB8G+cWGNTKJ
	e598TUFEma2rX5B9WrSdZ6XkE/hEXgM16d0YGzM+JitSgTcdMbBsjf1FizMhkdV30O+IVqZqsjJtn
	BXpUL3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twoYG-00000004DJd-45LY;
	Mon, 24 Mar 2025 20:37:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twoGf-00000004ANy-07bC;
	Mon, 24 Mar 2025 20:19:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OIIRQO025897;
	Mon, 24 Mar 2025 20:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUkeSo7YC2+Gn2w1d+tbi/AOnqcGp5wOrds4KCweP6o=; b=P1lprcKwaSUMD6A8
	4zYwB5Q2iL3D0zoR79lfDqMt0Y+Eta0ulgHLS/BhfPLVbBKhvWrdI+sX6Z5brHDl
	4VT3bDMNgztHcsrjs9pPFwWBBOGeZ4hOLWXlOJxRtEOOqIiGyCx/6hS6F+5b2tt8
	Aw/hCowNecEocDob1SvPkbtIx8Xdn8NaQEXVjYb9ZeLA9mJhU6QGK2Yp6pVCsD9X
	L8hHqdJZ2mMEyxjoVv7hT79bwDIBVvXi1pvqojfLgmL7ElG8g1pTJp5M04IJGVoZ
	/NuVxT2SgelHcUtb3s6IVH4nDP221eGzzv7UX7DJLvnGJgSBFgHgQW+6mC7NObyt
	WIbB8g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnnrec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:19:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52OKJH6c027848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:19:17 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Mar 2025 13:19:16 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 24 Mar 2025 13:18:29 -0700
Subject: [PATCH v3 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8750 to QMP PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250324-sm8750_usb_master-v3-1-13e096dc88fd@quicinc.com>
References: <20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com>
In-Reply-To: <20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742847556; l=1364;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=lF4rP9lXDFjIz08ty8NJ8mDbnU5o8JXcLPPWxqt/0t0=;
 b=whasjRrvXK7yA2cHl3tWbtaCueTdB1I8bc+Kb2raYE6uDfZikyEJEGZlsGYK1RBa5CbGbtB7L
 L+uxIC9D2G6AeZQMEH0wNUjF/emIY2/J9qddiF6oHm7Gg2R9ccdcLVl
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67e1be46 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=bbY3M6C_flAL0yJJl3cA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: c_DtHrmL6osST2vkxdvSk1qnhGz0AVXc
X-Proofpoint-GUID: c_DtHrmL6osST2vkxdvSk1qnhGz0AVXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=878 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_131929_202093_C2DA8113 
X-CRM114-Status: GOOD (  10.10  )
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

From: Wesley Cheng <quic_wcheng@quicinc.com>

Add an entry to the compatible field for SM8750 for the QMP combo PHY.
This handles the USB3 path for SM8750.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 358a6736a951ca5db7cff7385b3657976a667358..38ce04c35d945d0d8d319191c241920810ee9005 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - qcom,sm8450-qmp-usb3-dp-phy
       - qcom,sm8550-qmp-usb3-dp-phy
       - qcom,sm8650-qmp-usb3-dp-phy
+      - qcom,sm8750-qmp-usb3-dp-phy
       - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
@@ -133,6 +134,7 @@ allOf:
             - qcom,sm6350-qmp-usb3-dp-phy
             - qcom,sm8550-qmp-usb3-dp-phy
             - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,sm8750-qmp-usb3-dp-phy
             - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:

-- 
2.48.1


