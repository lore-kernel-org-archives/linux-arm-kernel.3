Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8302BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WBJrsL73e4aYbCEIe9+/sSAesDiICXM3dX1ODVhbowk=; b=jBnNv27ef7kj8REhgzgc0g51PW
	ViZFQ92tawuYNpsgGxcw7G4FyiXIkiEGMWjAbPnHi2t+xHHmEP/yOgwxrNp+OKFJopprQfXqmEF+f
	/Ni44V737ZfSr9ytYeHEBoASOHNXTCB0JX78itAqjTolp7bVUzK/4sMbdZ1bZvqKi7hkQ3ZSzi66f
	BVb7Uz5G9bJEYv2jRur6xLU7Ac1KYMC4LStlS4eN8rcIFEnblLvJxqexJ5TJdW5cRZtT/PHhPj7Nr
	A58tCYxUsnqGEQe+8wswJ2XYOJrIMtVAaTSD6ASsrufXzsQKSTrbGpPLhv6bMoXtNSVRZjiYJhBNl
	9FzIzQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKQR-00000008y6l-3gus;
	Fri, 07 Feb 2025 09:13:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKI8-00000008w6I-0093
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:04:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770cf1014995;
	Fri, 7 Feb 2025 09:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WBJrsL73e4aYbCEIe9+/sS
	AesDiICXM3dX1ODVhbowk=; b=JQGKVuMPWx6Yq4gniRXGtL5CwjOej187fnMkUx
	kpdLkapxPyznZSQDNsZSfHdzWcFHh1XbH38pIqAcSEC/pdKnEfWxuURLxXQ0ieK/
	muio9epwjYhIF4QLjgSRKtB7R5hCVklb9XMc2pN2hZ6cjoLARyu+fOKdfgZOXuNN
	yg7hf9Se2luM5KWeBg/4mxbrikx4UjlGb3GvvjfOFHoUBra2cjikyRiLONYnd9wV
	Pk/gVHC9s/sPdfbLzVo8cdb+IQ3gnsYUR+Fh0X1IWDegyA6jfTqkd8TTmK7/5j8L
	8Uf8LyqaRowehRr/ShLBOOWmceKP4rZY7MXlowJoZUG5eeqQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddm89q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 09:04:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51794gYh017841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 09:04:42 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 01:04:36 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 0/2] media: qcom: camss: Add sc7280 support
Date: Fri, 7 Feb 2025 14:34:20 +0530
Message-ID: <20250207090422.1609260-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3uqoPIeEYqVzf8PydFbkR9f9rnoJwnRn
X-Proofpoint-ORIG-GUID: 3uqoPIeEYqVzf8PydFbkR9f9rnoJwnRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_010452_049851_FCCB94A5 
X-CRM114-Status: GOOD (  22.58  )
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
sensor.

Used following tools for the sanity check of these changes.

- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml
qcom/qcs6490-rb3gen2-vision-mezzanine.dtb
- make DT_CHECKER_FLAGS=-m W=1
DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml dt_binding_check
- make -j32 W=1
- ./scripts/checkpatch.pl
 
Changes in V12:
- droped mclk-pins{} and put the properties directly under the
  cam2-default-state and cam2-suspend-state node - Konrad.
- Link to v11:
  https://lore.kernel.org/linux-arm-msm/20250121125010.1853269-1-quic_vikramsa@quicinc.com/

Changes in V11:
- Moved [PATCH v10 1/4] and [PATCH v10 2/4] as a separate series.
- Marked dependency on
  https://lore.kernel.org/linux-arm-msm/20250121120901.1841142-1-quic_vikramsa@quicinc.com/
- Sorted the header files alphabetically in dtso.
- Removed invalid property for sensor.
- Removed rst-pin from default and suspend states of pinctrl. We have verified
  that for imx412 sensor there are no SET_SYSTEM_SLEEP_PM_OPS added.
  So removing rst-pin does not make any difference in power management. 
- Link to v10: https://lore.kernel.org/linux-arm-msm/20241217140656.965235-1-quic_vikramsa@quicinc.com/

Changes in V10:
- Updated cover letter to add link for v8 under changes in v9.
- No change in the patches w.r.t V9
- Link to v9: https://lore.kernel.org/linux-arm-msm/20241217133955.946426-1-quic_vikramsa@quicinc.com/

Changes in V9:
- Removed GCC_CAMERA_AHB_CLK as its always enabled.
- Added GCC_CAMERA_SF_AXI_CLK.
- Renamed gcc_cam_hf_axi to gcc_axi_hf.
- V8 had 5 patches and V9 have 4 patches.
- First 3 patches of V8 are already promoted to linux-next
i.e  
  media: dt-bindings: Add qcom,sc7280-camss
  media: qcom: camss: Sort camss version enums and compatible strings
  media: qcom: camss: Add support for camss driver on sc7280
- 2 new patches are added to handle new comments from Konrad on
  "Patch v8 4/5 arm64: dts: qcom: sc7280: Add support for camss" 
  1 of the 2 new patches make changes in yaml and other one is making
  change in camss driver to handle new comments in dtsi.
- for "Patch v8 4/5 arm64: dts: qcom: sc7280: Add support for camss" I got
  comments from Konrad to make changes for clock names so I had to make
  respective changes in "bindings/media/qcom,sc7280-camss.yaml". As dtsi
  changes are not merged yet, so there is no issues with backward
  compatibility and I am assuming this should be acceptable.
- Link to v8: https://lore.kernel.org/linux-arm-msm/20241206191900.2545069-1-quic_vikramsa@quicinc.com/
  
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

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (2):
  arm64: dts: qcom: sc7280: Add support for camss
  arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision
    mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../qcs6490-rb3gen2-vision-mezzanine.dtso     |  89 +++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 178 ++++++++++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso

-- 
2.25.1


