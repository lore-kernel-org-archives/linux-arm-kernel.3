Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9FFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 21:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUq5GKUJQT9N87Jz3+DMSxtocMpiKV3sAuwC+kx/V2M=; b=ZR6pDobicmSku7cyWERoSU/hBM
	gcyL19T6xnfuxrH8qMHX3Bn5HTOUYQ7V040/AfqajjUrsJPToWHO5lMdC8Bu55/yvwYLzAAqQmbj3
	J8YzvMxPSyLFKwX3tMzft4cqYfhV0UgGFj9q111QFsXBNO2HW5s1O3Yo/1fkqrD7ptnOKk6gntKbm
	UTE/uVGCouGmb50FV21gF0JwWBWY1/bTPhyaTidqQK23wpzaIGwImAMCAHBUQLI5xEASVJFx29o1P
	BVZPl+XLIfpnBrLjnx31jHo58GoHjRVowIL9aSr0QbTWZjtCsq1lcSQaSuUccKByqXouX+4mBXdsw
	3xrDGuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSPr-00000006kE5-3tCN;
	Mon, 13 Jan 2025 21:56:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSMM-00000006jTm-03lm;
	Mon, 13 Jan 2025 21:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yUq5GKUJQT9N87Jz3+DMSxtocMpiKV3sAuwC+kx/V2M=; b=g7z65YFE8sKmkT5jA4frFbLvvo
	eaZTjD/Ku3jKtmiehCXE+j1hmWiYVmf5HKPc8qmSUNaxQgXExEtsRvEKZy6Tv4lip1CojSMzBSuj5
	ityp7o4bzvu8+DjfrbvRVp0ZI7AoVMuAqWtQoJ74zSaTIv15lclaNHwD9UYEYcK0sZR4aO/hbBDDy
	l/csXsNVYQ5MDHx0wlIHOQaA5wQ2rfBt/TY5Gd+xGel1fCpuyL3/HBIHTVjTnWwv2VzchTck/wkOt
	eBvsft/SUzIS24miNI6CkLu6XWvCe3BXrHGpMTzfihDXnay0xsMy1Lwp37AJqjmW992bplRa88PNF
	dqlOMw9Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSMI-0000000AMKO-1OIK;
	Mon, 13 Jan 2025 21:52:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DC0g3R000376;
	Mon, 13 Jan 2025 21:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUq5GKUJQT9N87Jz3+DMSxtocMpiKV3sAuwC+kx/V2M=; b=FRSncLf8R3+/LPW1
	CcFAGeytvtfrVfef0CpfXfWQc/61VbzFTD1YEKgoLAOtYkDF0oSXVGn6MjFe/Vn2
	k+GLIkYWmTtxe7PDP5zi9vT6UBWkHtkCe6eUP+N1pIJHUJ7csZBGCSeCkzo7PkSB
	5/EuuVV+7X418Vu+t8B2ILLTi+1DktXcVGOx3U594n8iOy83HDT93A14KI1KZ9T1
	P96dd8JB5naCy/qNjqkjD/1cJefSO2pgX2tn33FQUmQt7+Z+0615aoU59Mmo7E5q
	qfYrHP+QuHJuS5jmVE5gzTCj8Rma6qaGz6WPw5y/pSw+YpOmohscLctvt6j356Sf
	2QxWoA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4452f91dn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:52:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLqIV4010729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:52:18 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:52:17 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:52:09 -0800
Subject: [PATCH 3/7] dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_usb_master-v1-3-09afe1dc2524@quicinc.com>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
In-Reply-To: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Melody
 Olvera" <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736805135; l=1390;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=+XvGX3yz2FF6Q6Rc3ef8ijnEuO3FuGYecpcSYaVe9zc=;
 b=kqRyqzwz6WVI+mVWJUoCtZkKzTay5WJV2xgPEJGScQvo+W3niipjXtlu9/i4PdLmCp/0vTl1X
 GGnBjgcRuDmCa4Cwnyhh8H5YisBdBw6DCngAAn+zu5WHOG7LLsKZULU
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UOOh_k424oHoCgs13WXwA6ScWTaHCzx_
X-Proofpoint-GUID: UOOh_k424oHoCgs13WXwA6ScWTaHCzx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=754 malwarescore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_215230_867844_06616040 
X-CRM114-Status: UNSURE (   9.87  )
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

From: Wesley Cheng <quic_wcheng@quicinc.com>

SM8750 uses the Synopsys DWC3 controller. Add this to the compatibles list
to utilize the DWC3 QCOM and DWC3 core framework.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 8fd02e8aaaa5e74adbac1a4a722d0fe46ccbcc59..45b32db08edbfa8d6ee8594c550dcc688974e67e 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -54,6 +54,7 @@ properties:
           - qcom,sm8450-dwc3
           - qcom,sm8550-dwc3
           - qcom,sm8650-dwc3
+          - qcom,sm8750-dwc3
           - qcom,x1e80100-dwc3
           - qcom,x1e80100-dwc3-mp
       - const: qcom,dwc3
@@ -353,6 +354,7 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -494,6 +496,7 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         interrupts:

-- 
2.46.1


