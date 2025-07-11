Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE04C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bl1nSPn5YlRo3UiVoA8IR2c/9+m0L+tOtQINu67XSlc=; b=Cfr1tV3lD0038y7fOh07kQZoHq
	zOXbPFZfN+IOISeuqlWG3QPDzmtF/SzI8S31CsH2aZVoGU+kervWDyp2NwJ4bugixsvfX/TWlvUTN
	3dHYDnkh28WHUS142nJ9RrapZooZZsJ7MTbVLUAJ1lWbiGLLQGHv9ITxCNd3qzZLI/8JtVAsyfCr6
	KWOmmC1NncQYULV4v2rZJIgHK88r8M+yPbNCt58At4/HEjBoYS85zqKrMtmH30m1WFxk0JmQl3WUl
	lwaTVnVrdR0d+I4xoI1R/m2PVb3U23+ExiPsQzUAbue1mHEhJkDd0NpbFLVaT0cEbSkSPr3ooaiYv
	NQQtdSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFv6-0000000FBLq-2EHN;
	Fri, 11 Jul 2025 15:44:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDYH-0000000EqcF-0Gai
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 13:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Bl1nSPn5YlRo3UiVoA8IR2c/9+m0L+tOtQINu67XSlc=; b=j0rUCvGmpTfYxMjlGuczePKFVa
	Bt0PN+9A4w5lcP6P8uCqWxMKUnMDWkI6KqdcpWmWY1TJc4WYBUq0p/wKntiCSd0H/44Rg2+GWkU9y
	fVMpTmwqFxX/YYQUUsL+LyabZKZ0pgWcDC/M92WcS8S/9fz2gOfSnoZdvON73+FsRK2mrqwMQ4k1x
	GeYngraYrsXvyFbPDUkQEXK0ttec/YOOfk9pMDSc4UgqW+Knijm2fWOo2z+5AT94boAMeUqI8ubAA
	TlamHnjTG2vxl/N4ipdTvoQlxmRAD+Ud5wwO+Tvl064JUOk8hiCZQ4+bhky5T1S+9jLKHmaQNWc9y
	xDvo6U+A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDYD-00000009GTw-22jZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:12:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBLP7A018809;
	Fri, 11 Jul 2025 13:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bl1nSPn5YlRo3UiVoA8IR2
	c/9+m0L+tOtQINu67XSlc=; b=AMR4YYqPLwOQ8HgTlUj3ND+N0gEkDIHDwD9Yrn
	qHaXaNrlto0oegBiwBBkGkEvdrSKhLQS9wYTWeH7OF7K9eTacrKi+y2YEUbW2L8J
	rIXF9vTM/9T4Z+Q+8ktlR2+c5NDwldI0Forrgu7j6mr+/9QujPdMv2IY67FaeTeL
	rG0TKAROVIqlM1xH4oX6BNW4KbVDVXUyd5zGDxRueFfTmX4rKMIagUReGhGPsRPE
	mdYQNOmGs4grFYk+FWFwJE73niPHxZ6E66/uU3hlg3viZOk+cfCUtdhikn9gOkc8
	2HKlL47XM+ef9ZQFoodxLUSpze9hzWhF4u5c2/C3jreyq2Zw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf32j5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56BDC9j2019978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:09 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 06:12:03 -0700
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
Subject: [PATCH v2 0/7] qcom: qcs8300: Add qcs8300 camss support
Date: Fri, 11 Jul 2025 18:41:27 +0530
Message-ID: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5MyBTYWx0ZWRfX4AlnZ+BefChF
 qO4LfICsTapvG8UfsT67gJ0kC/Ksm8hSs6sJk2z4SLX8R1MSIrx66qCW1HZpRLr6cytVTcRj/nx
 CaW+JEXHK3weHAFz8BLgQAQg7lkUULZtnI6Mol8NQ1RdIhdvLlh4gqV/ZalbzW+kcaS4sHzkE3w
 d/a6kxz4qsw4pkXhWnwgNmwWet6j5ROSBGbpMpFUfIsVUhmXpsE01AzbtdjqZ//3LtBEHAXh9fJ
 tYFKuOjkbuuY17EpAmYYlaynX5xvLhS3N5+/p44q/FnE2BHXXoQD+pCjymA+kZ3CskSs9QtSDco
 cU0CNSOs+c55R/HNNfDF/bNgxZVLSO29om/evhTeeX5vb7tDPHSWnovIKe7KQwT2g0QaKpv8mMQ
 Oe6cI9lkgXHWzXU0cFmZyTlDV+KcEhD4R5S0cRFdIBOCa4Vh9rXh5M+2ZQ0lDUF8Vu6vSG1V
X-Proofpoint-GUID: Lm_SF-pIGKVbL7LD6FApfTwYH86JsB5X
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=68710daa cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=vOnZBVaixI17Gw8aOCoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Lm_SF-pIGKVbL7LD6FApfTwYH86JsB5X
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
X-CRM114-CacheID: sfid-20250711_141229_970411_11BF63EA 
X-CRM114-Status: GOOD (  14.89  )
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

From: Vikram Sharma <vikramsa@qti.qualcomm.com>

QCS8300 is a Qualcomm SoC. This series adds bindings and devicetree
and driver changes to bring up CSIPHY, TPG, CSID, VFE/RDI interfaces
in QCS8300.

QCS8300 provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 3 x CSIPHY

Changes compared to v1:
- Changed the order for register entries in bindings - Krzysztof
- Changed the naming for interrupts for consistency - Krzysztof
- Combined separate series for driver and dtsi into one.
- Rebased on top of latest version of sa8775p camss patches.
- Link to v1:
  Driver: https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quicinc.com
  DTSI: https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quicinc.com  

Dependencies:
https://lore.kernel.org/all/20250703171938.3606998-1-quic_vikramsa@quicinc.com

Driver side changes for TPG will be submitted as a separate series which will be
rebased on top of these patches.
TPG Patches:
https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/
https://lore.kernel.org/all/20250217-qcs8300_tpg-v1-1-6e0f4dd3ad1f@quicinc.com/ 

Tested with following commands:
- media-ctl -d /dev/media0 --reset
- yavta --no-query -w '0x009f0903 0' /dev/v4l-subdev0
- media-ctl -d /dev/media0 -V '"msm_tpg0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta --no-query -w '0x009f0903 9' /dev/v4l-subdev0
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 1920x1080 /dev/video0
  --capture=7

Used following tools for the sanity check of these changes.
- make CHECK_DTBS=y W=1 qcom/qcs8300-ride.dtb
- make DT_CHECKER_FLAGS=-m W=1
DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml dt_binding_check
- Smatch: make CHECK="smatch --full-path" M=drivers/media/platform/qcom/camss/
- Sparse: make C=2 M=drivers/media/platform/qcom/camss/
- make -j32
- checkpatch.pl

Vikram Sharma (7):
  media: dt-bindings: Add qcom,qcs8300-camss compatible
  arm64: dts: qcom: qcs8300: Add support for camss
  media: qcom: camss: Add qcs8300 compatible
  media: qcom: camss: enable csid 690 for qcs8300
  media: qcom: camss: enable vfe 690 for qcs8300
  media: qcom: camss: Add support for CSIPHY QCS8300
  media: qcom: camss: Enumerate resources for QCS8300

 .../bindings/media/qcom,qcs8300-camss.yaml    | 336 +++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 171 ++++++++
 .../platform/qcom/camss/camss-csid-gen3.c     |   5 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |   2 +
 .../platform/qcom/camss/camss-vfe-gen3.c      |   4 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 401 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 8 files changed, 919 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml

-- 
2.25.1


