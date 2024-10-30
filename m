Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FFAD5CC94
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4nneJZ/tkv5Wps64EEwbucC9EgRrZX1VyDoag3u69ow=; b=BHd0JzJ8et4I90nk50+wDrbh9s
	v2VjZ67mlGkuPeovy8YwY1OYwG/vZ0t4HWm3cDmRpSGx7qCHzPb2ZmnyBX/282ScZhLbtrcRDrJVu
	kTmscWy5/L/hnnaNWzyEbGO/byXn6N4ir6KYqwEm1N6llORGKwOFkQWQN3UgX7oRrE1ubteF4FcER
	PTUiabwGZA9kIYZy9Zejkr8Bc9cT+eKoVr2hlCuQv6KF6yPjm3igRSbECRkLuuvQQq+2hPo/G/1fy
	nPWC+eoLs5miwM9yHfPhT+CSsxkouKdBAs5vTPi7PqG0FZrSMvVvksgc7SUIEsWPTMM3E7ugmHctL
	TrCaS/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66VI-000000004TU-34nN;
	Wed, 30 Oct 2024 11:04:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66LM-000000001gy-3mKQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:54:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UATGCj028362;
	Wed, 30 Oct 2024 10:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4nneJZ/tkv5Wps64EEwbuc
	C9EgRrZX1VyDoag3u69ow=; b=LdXOC2cY5DeZ4pF7eapKIG3AT6rcs++nKdfP29
	OxDz1w7t/TdHHIvos/wAedDdQSHQMEmpI0M8V7Uucnb0e6MHGFEFgDSjT+uv5pgs
	F4uJmn3x5IUoPwK3Suv5wp0YdwCMUl5YzZkqwPEZBrhvvvJ3hHJ6XqgDCKVntqHq
	h4UKYoxJ/0061dvsGX6kDQrb8p6B0dt8qC/rJVkWrqhw106JQEo7NcwLjWMCV8Hk
	rmT6qf/lAzeeznnA4d+/+WfxFEImqTFndesUHYBPzEW+4lwE3zuc6KGdI9mkJqrp
	+NDdtHfoO6nq+LD28KJX79N7VkNZH6g5Tf8KCkkyH3GYzIRQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt73k97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:54:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UAsIET015340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:54:18 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 03:54:08 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v4 0/6] media: qcom: camss: Add sc7280 support
Date: Wed, 30 Oct 2024 16:23:41 +0530
Message-ID: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fp7mfYV_mEXXm3OuCViUAq4uXaITKw0E
X-Proofpoint-GUID: fp7mfYV_mEXXm3OuCViUAq4uXaITKw0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_035429_089809_96E47D29 
X-CRM114-Status: GOOD (  17.78  )
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

SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY,
CSID, VFE/RDI interfaces in SC7280.

SC7280 provides

- 3 x VFE, 3 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE
- 3 x CSID
- 2 x CSID Lite
- 5 x CSI PHY

The changes are verified on SC7280 qcs6490-rb3gen2 board, with attached vision mezzanine
the base dts for qcs6490-rb3gen2 is:
https://lore.kernel.org/all/20231103184655.23555-1-quic_kbajaj@quicinc.com/

Changes in V4:
- V3 had 8 patches and V4 is reduced to 6.
- Removed [Patch v3 2/8] as binding change is not required for dtso.
- Removed [Patch v3 3/8] as the fix is already taken care in latest
  kernel tip. 
- Updated alignment for dtsi and dt-bindings.
- Adding qcs6490-rb3gen2-vision-mezzanine as overlay. 
- Link to v3: https://lore.kernel.org/linux-arm-msm/20241011140932.1744124-1-quic_vikramsa@quicinc.com/

Changes in V3:
- Added missed subject line for cover letter of V2.
- Updated Alignment, indentation and properties order.
- edit commit text for [PATCH 02/10] and [PATCH 03/10].
- Refactor camss_link_entities.
- Removed camcc enablement changes as it already done.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com/

Changes in V2:
- Improved indentation/formatting.
- Removed _src clocks and misleading code comments.
- Added name fields for power domains and csid register offset in DTSI.
- Dropped minItems field from YAML file.
- Listed changes in alphabetical order.
- Updated description and commit text to reflect changes
- Changed the compatible string from imx412 to imx577.
- Added board-specific enablement changes in the newly created vision
  board DTSI file.
- Fixed bug encountered during testing.
- Moved logically independent changes to a new/seprate patch.
- Removed cci0 as no sensor is on this port and MCLK2, which was a
  copy-paste error from the RB5 board reference.
- Added power rails, referencing the RB5 board.
- Discarded Patch 5/6 completely (not required).
- Removed unused enums.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com/

Suresh Vankadara (1):
  media: qcom: camss: Add support for camss driver on SC7280

Vikram Sharma (5):
  media: dt-bindings: media: camss: Add qcom,sc7280-camss binding
  media: qcom: camss: Sort CAMSS version enums and compatible strings
  media: qcom: camss: Restructure camss_link_entities
  arm64: dts: qcom: sc7280: Add support for camss
  arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision
    mezzanine

 .../bindings/media/qcom,sc7280-camss.yaml     | 439 +++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../qcs6490-rb3gen2-vision-mezzanine.dtso     |  73 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 208 ++++++++
 .../media/platform/qcom/camss/camss-csid.c    |   1 -
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  13 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c |   8 +-
 drivers/media/platform/qcom/camss/camss.c     | 500 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 11 files changed, 1190 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso

-- 
2.25.1


