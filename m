Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B900AC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHYQZpJOcF01wqgRxSLLELgB3m02US75WnLoLG1k+dI=; b=yTkaArNKPUqaei6+3qOyebGGFS
	s4q01gUJOz+H5DINOARHl3lo/8V+PiVs+ohICKNeAz0EsCm8L5HlADUc0dZiprv49PDq3sZrbGjAV
	NSmi6Rv6OC4dFIeCVPhX0l1QCwFzp87/qQZy0q+I5kg00jQ7IGZKD9TGRfbwA2DMOtJCawD4vcMoh
	iCNsCApZbH2KdTmzJefmrMouRPDmDTnB4agkD66EaEKQZq8KhH283vketpXrt2fa3L/hg7vSKoXVE
	1i2El806fvoks/jgcw11JzAMVkTjb16geYL77fRjjHw3iWQnGxUzhjU+aeSaNTBoyN/Bk7ESGARa+
	JnvhJmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSTT-00000006khK-2b32;
	Mon, 13 Jan 2025 21:59:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSMO-00000006jUW-2EcK;
	Mon, 13 Jan 2025 21:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fHYQZpJOcF01wqgRxSLLELgB3m02US75WnLoLG1k+dI=; b=Dv+ge0LZKANzTEW1VGXbv4Tavi
	J2HqZm66sRsT4rE5xIblin1/ebjk/Hz/Y/Hu73rysWYwVoe529O6PhHR0xDnXbZRGqZnIgmGHD9Fs
	r5O04iEmf+Sw6F+yighlUI6Qh7OrFajJPajILR3E1dJBi8eNC9JPRnVoxyZhDLum0XM3fJP7d2jsg
	uGKzKrC7g6l6yugLgks3QsP4CKabICg3EMwst7TkkjKtUcsZzoAkB1vErQXPSfIbad4llBD/I5BU2
	IsFlqe1KYU3WniEhzT37g3iUlAteYWt6EIlQBrMwGbvRKqBD/cgFJ2OShQn3Kbthek1YDqM/VEMrD
	+iVL17eg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSMI-0000000AMKR-2l3Y;
	Mon, 13 Jan 2025 21:52:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DH3eUR020076;
	Mon, 13 Jan 2025 21:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fHYQZpJOcF01wqgRxSLLELgB3m02US75WnLoLG1k+dI=; b=Gt5skp6YtROS7BLB
	01leg7K4rW4NvGCs4qEumk9zeQP1iS0rWTQtU9ach98sew574JvbzytGbkhmgJI3
	u+lYzxVEE+YDreDEhqSPQB9MH4GUDdCA+XLYCV+wT738YeRimv7buV2lhKIVyWJ3
	CcSEN0V6+Y5RdIVr+QzTVFWsyp9QIsbTu0jT2cK55HutaMjEZG/ERlSkpVrOWBNL
	aHzmkvcDxvwGKccqx+4cYWSXiXQVYoEQ4VxJSrXjsAQvV54bpnWnWYwzn3YKOVsy
	mprLaLGEZVU3/+N9vDCyTVYv1fog0kGoVx0jcuVKVJMQV24JSGwCv5YWZuPQY07C
	u9yaPA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4456wa8m99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:52:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLqK9d010762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:52:20 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:52:19 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:52:12 -0800
Subject: [PATCH 6/7] arm64: defconfig: Add M31 eUSB2 PHY config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_usb_master-v1-6-09afe1dc2524@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736805135; l=712;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=Snu7NdvOj8NxUVTmkPXPeDpPek7KPwsuCtdz66NwfyQ=;
 b=xQcLz7LFQA8lRxRSmInpGpSyw1BJDy/H5jU3V2xI36HravdIomjWZvVa26Imf6jadMHhG5jqL
 l3C97Q8+sjmCt5sW2TGhDHSWRDA2poYBIqUd6dFmIESCzwmanHpX5me
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yQAM9nTelAR7hODWYC8GbVOZsmJl-agS
X-Proofpoint-ORIG-GUID: yQAM9nTelAR7hODWYC8GbVOZsmJl-agS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 mlxlogscore=584 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_215231_174541_F97B13AE 
X-CRM114-Status: UNSURE (   9.32  )
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

Add configs for the M31 eUSB2 PHY for SM8750 USB.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e729948b7d69a2731dd3f0594808cd2e4fd4f451..10400fb72d5cc426c200e84561cde2b54ac8e86b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1569,6 +1569,7 @@ CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.46.1


