Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57972C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdMlUGUbtEgwTwa+QYeh/PtyBSFF35IMj3odV52+M4g=; b=0zZElOmkht9oR0UHfDR9VnCI40
	cI57SMvcMya+o+WgFiQUIqkbD/dcY8JimsINZJ6LiKFEQcz3JaNsXm35hJpNQzZ82gTbG9Cebnw/K
	7ci+Hg/to8lntwOwZeu4mqq8PbNNJ1d49F8d9rrdZQsBbRisAyHP4R8erJowxwk/b38XTLkcRIvXJ
	mXMsMomqBBXXWogFozoJeiqVXMXRD5zVMPpW9dBrkbhCqdIZhWO9F6xeL3gZ8KAyWooI+dFzUSVLO
	DkKET0GKcr+D8XWVCOhOMALrI7VcDKlXaaAAa+NswdqaFsn61/8irE/vLDdVE+8Gj1GmfwZfzBYYM
	cIoqgbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaIW-00000006Ly3-0PFx;
	Tue, 04 Mar 2025 21:59:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaGw-00000006LiZ-1eec;
	Tue, 04 Mar 2025 21:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=CC:To:In-Reply-To:References:Message-ID
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=TdMlUGUbtEgwTwa+QYeh/PtyBSFF35IMj3odV52+M4g=; b=cQoAdHzxjsmhBFXjLCWwjsnecx
	hkCnQFiAhq8wTTknrN6plLs4T/pTp9jY0JT/Zr6ZpnzZ9iWmaFXfM+qKO2wdRI2YKGmsv/sVD9M2H
	tzSF0g5qpwJk3Qv7rUKrCNoc1iCVv52O4bQIW2wQo8uk6MSpt5UoA2FRnryxu5hljbJge87IreikQ
	4TkdMgFX3V7pZ8tcASVghMQn8/ISUlHeiqbk39Yoh9hcSsmf3pE3wtKV+Ssk7xFtWUHerevON6K7I
	d49Rj8CdycklRae0WvWchXrFxbQr0gspvDfJ/SsidXPmdSQp6Y6vSl0qvGEFlzGmfS2cd6jhX0V/x
	IPL62lrA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaGt-00000004AmF-0KBn;
	Tue, 04 Mar 2025 21:57:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524Lk9vV025636;
	Tue, 4 Mar 2025 21:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdMlUGUbtEgwTwa+QYeh/PtyBSFF35IMj3odV52+M4g=; b=CPGaYX0+gKrVCsF/
	nanMRQud0tZZl2sBZS8wE772CsPrhgkDk2Xfys27Hl/2T7BkFNb9SQ00SNd78mS/
	GEFeJJqP3jEa7YsAJEYPk//PiR36mz1du/Tqt/C3y9msJEYHORSORcuLmUrvvF47
	Z9Zmes6eF7vF/zZBTBHvdwi1YTLByAvoOUKbjjY56xu65il8o0wvE703bhLDoKPq
	yQltCas2pDwsM9dgh9CTGZsvC5Lg2QRKMOaFORo88ZpVH+swutx0OJHgzHAlMK4y
	UJ4XVcu2r6qVFh40IjOkhzvIVBCD6SfhWVQFzROoL4uDcRR5pbD9qY1aZoWgwBty
	X28Wog==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vb8q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 21:57:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524LvfHe022663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 21:57:41 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 13:57:40 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Tue, 4 Mar 2025 13:56:42 -0800
Subject: [PATCH v2 9/9] arm64: defconfig: Add M31 eUSB2 PHY config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250304-sm8750_usb_master-v2-9-a698a2e68e06@quicinc.com>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
In-Reply-To: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
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
        "Melody
 Olvera" <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741125455; l=712;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=9DmVicPrlTPOcpmBQU75aKufZtlbrj8uKOaGgQZBasU=;
 b=riWdijZkG8UDSq68rGABHp7R5veaXARMgSeIHrMtf89tRjOhb7fwYjP22OSDdI0SmsqgS80ZC
 fiGZ2RMCxJFCer8vDnzNE2qEl1XETtHesRX5Bhr5tLqUh7PSb1QERxq
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sHyA-6889VbNNDUFWFniAId-wV9Nu8qQ
X-Authority-Analysis: v=2.4 cv=bPnsIO+Z c=1 sm=1 tr=0 ts=67c77756 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=75KNVkkY0apcGqszbmoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sHyA-6889VbNNDUFWFniAId-wV9Nu8qQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1011 bulkscore=0 mlxlogscore=604
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_215751_496044_ACEB2EA1 
X-CRM114-Status: GOOD (  11.31  )
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
index 3a3706db29822036d25a7228f8936e2ad613b208..7a7187475a11206e708a5a2c6dd51736e16932e9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1587,6 +1587,7 @@ CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.46.1


