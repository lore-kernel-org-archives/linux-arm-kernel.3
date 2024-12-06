Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C943E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 19:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QopC44fOOvrT9hEmNgwSNJUTEQasnjDGvPOi0wfHG+M=; b=tzDucAqSiYAr34APbN3h1Vap/5
	tKR/XCfvFK72Dv3gH9R4jCmSYuuVDVOb6gk8HD+Qva/MIApJMMy3zIP7Qm05CtM/7Ph17ncol3tRf
	aPe+8/CS8qD6O9pwwXGwE7LAo3dHocEwACsmH3Rqf70c8annrXAlE/IQlh/3eBAx5D0v16FatNkY/
	gPKqm4HaWzzY+IqyuOsPw9YWCkkzCUfNxFB1aCMLhtEMDxWyu1TF175mkB5r2mzrNyyAzI/0/4ltZ
	iznRQ2t7anH0YAV49q7ulgPqSyTsyOWzX/78ayD7jOVu10vpjCmyMp9YdiTJaJqsmr+6zxvvxVmgo
	VYd2WacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdsd-00000002X6Q-09yt;
	Fri, 06 Dec 2024 19:20:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdrZ-00000002WpQ-3eMs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 19:19:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6I2rtR007466;
	Fri, 6 Dec 2024 19:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QopC44fOOvrT9hEmNgwSNJ
	UTEQasnjDGvPOi0wfHG+M=; b=FagEYa0zahZylZXF4RHApoJAf+m3LCYELoB/ut
	7suomjPvQWuzGWdxxlesl6PUCv5M+nT7+SJeixu/gU96h7wK0QG0Cmsp2xMq3Iit
	QPWaR/IYp/GMBnt1UYzb9ctbg5Ssv7HIYsjLUq/8WYXj+baIKsJRbylT/lFakbI5
	HIE+Okch6RdemYB0Ha9laJQSp3wDtuJSGwVX11/22LJ9DDMB08oGb98fNT25L4Pn
	+UhBtXVGVNbFj36L5BF24pbz2bZMsQF31RGm0MW1g68iONxSgprJ+1KATOjSEulX
	v9bin3OVJzPPONujmW7cutZ2zz/Dr+MPVui02ozg+Blhpclg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben8c2dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 19:19:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6JJSbH022383
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 19:19:28 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 11:19:19 -0800
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
        <kernel@quicinc.com>, Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v8 0/5] media: qcom: camss: Add sc7280 support
Date: Sat, 7 Dec 2024 00:48:55 +0530
Message-ID: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b2Jzb8DQKrcJTvkpNogIQG2ljuwJKHje
X-Proofpoint-GUID: b2Jzb8DQKrcJTvkpNogIQG2ljuwJKHje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_111941_907335_8A8FCF55 
X-CRM114-Status: GOOD (  19.71  )
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

We have tested this on qcs6490-rb3gen2-vision-mezzanine board having IMX577
sensor. Verified both TPG and IMX577 sensor.

Used following tools for the sanity check of these changes.

- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml
qcom/qcs6490-rb3gen2-vision-mezzanine.dtb
- make DT_CHECKER_FLAGS=-m W=1
DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml dt_binding_check
- Smatch: make CHECK="smatch --full-path"
M=drivers/media/platform/qcom/camss/
- Sparse: make C=2 M=drivers/media/platform/qcom/camss/
- coccicheck : make coccicheck M=drivers/media/platform/qcom/camss/
- make -j32 W=1
- ./scripts/checkpatch.pl
 
Changes in V8:
- Changed node name from camss to isp.
- Added QCOM_ICC_TAG_ACTIVE_ONLY and QCOM_ICC_TAG_ALWAYS tags for
  interconnects. 
- Added blank lines when required.
- Modified power-domain-names from horizontal to vertical list.
- Sorted pinctrl nodes based on gpio index.
- Link to v7: https://lore.kernel.org/linux-arm-msm/20241204100003.300123-1-quic_vikramsa@quicinc.com/

Changes in V7:
- Changed unit address for camss in documention and dts.
- Added avdd-supply and dvdd-supply for sensor.
- Changed reg/clocks/interrupts name for vfe_lite and csid_lite.
- Link to v6: https://lore.kernel.org/linux-arm-msm/20241127100421.3447601-1-quic_vikramsa@quicinc.com/

Changes in V6:
- Changed order of properties in Documentation [PATCH 1/5].
- Updated description for ports in Documentaion [PATCH 1/5].
- Moved regulators from csid to csiphy [PATCH 3/5].
- Link to v5: https://lore.kernel.org/linux-arm-msm/20241112173032.2740119-1-quic_vikramsa@quicinc.com/ 

Changes in V5:
- Updated Commit text for [PATCH v5 1/6].
- Moved reg after compatible string.
- Renamed csi'x' clocks to vfe'x'_csid
- Removed [PATCH v4 4/6] and raised a seprate series for this one.
- Moved gpio states to mezzanine dtso.
- Added more clock levels to address TPG related issues.
- Renamed power-domains-names -> power-domain-names. 
- Link to v4: https://lore.kernel.org/linux-arm-msm/20241030105347.2117034-1-quic_vikramsa@quicinc.com/ 

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

This is tested on QCM6490 Fairphone 5 smartphone with WIP drivers for
IMX858 and S5KJN1 by Luca Weiss <luca.weiss@fairphone.com>.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Tested-by: Luca Weiss <luca.weiss@fairphone.com> 

Suresh Vankadara (1):
  media: qcom: camss: Add support for camss driver on sc7280

Vikram Sharma (4):
  media: dt-bindings: Add qcom,sc7280-camss
  media: qcom: camss: Sort camss version enums and compatible strings
  arm64: dts: qcom: sc7280: Add support for camss
  arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision
    mezzanine

 .../bindings/media/qcom,sc7280-camss.yaml     | 425 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 110 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 178 ++++++++
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  13 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c |   8 +-
 drivers/media/platform/qcom/camss/camss.c     | 321 ++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |   5 +-
 10 files changed, 1060 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso

-- 
2.25.1


