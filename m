Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B481ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HHqTE40OeZMLliROMlhjzvXOYxWvPRUMusZKV+Xmu40=; b=JTtQdXzupqSRpUiriBNql9Vrvc
	7FY3QG7xwFMS20Ju5+LGBysR8cwO0jqIKvnoUuy2URdTmmcxsIXZF3z0A5Xi51AfwiG3rhJ0uFDkZ
	4NmP9Opzlw5Gvpqf55qgTpuSj3zvfVri6mCI9jWXsITKNLt3sKHUm5nDdcX/WRJZO268Bov5pjxng
	c1D0xp1EWU3XBwK+Lu6QUgjEHKBlgKN6dmJ3IT0fFv4vfiX0y/zQO13EZar5cD2jxcIm/cpy9JC2B
	kwCNFdCVEBGID9bo0daDV3LniWI2Ojo9X1T6HXws+ja8g8rokqKdE6GJ+l1DJ0unXhIqIS8fo7LuC
	qi9QtnOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXnd-0000000GyaY-0Bgq;
	Thu, 14 Aug 2025 13:15:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umV10-0000000GYbM-1rIS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:17:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9NHnW025666;
	Thu, 14 Aug 2025 10:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HHqTE40OeZMLliROMlhjzv
	XOYxWvPRUMusZKV+Xmu40=; b=dEqMoNMSgPmtONmC30si4KNfKYRi8Y70573+nA
	+z9TUT/1Yys+yR/nesKXEkdMsTaivxjwrAidEjG5jfjTgcbJt2/4GOj6kZJl+ewz
	eMVaQzkuyW92S9Ot3CZneDC1fESm6lJ7CvhCYf9RjXM6xqZ6adji0xARTYvrbpLZ
	tTc3eyXO4AuV+iKUl9qfkAZDMeB5udn20+Uf19h+fiBu9d4ZcZikfPyDGnIei5CW
	pInNpR2oq114BgFk3d3zuwgiNvYDcM46MO/GGzVFtgcYYxKy+miZcIpvGven1xqG
	glbKy9DtktpkiESlpyspWw6ihImUrZ8mxrc52YaB+b5vG/Rg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gf7cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:16:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EAGnrc028198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:16:49 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 14 Aug 2025 03:16:44 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/9] Add lemans(sa8775p) camss support
Date: Thu, 14 Aug 2025 15:46:06 +0530
Message-ID: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689db792 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=7F3gip01v3SWeLcEoC0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfXweDiPgpSvyCy
 cRawQZOSSmBQQN8NCAgSKlMI8RhtSkcUKZa5KuJQQEsUZB5PXxV4/Q8SZX+g0uRmddC9xTBUfx6
 T/6/bQBjx2C2DdUS/iKr52XkygLPxdsI5lmXagFhjOZguzCLrSrgdij2+xm8iPtWFFGxsPSzLTz
 qd1UhkkR2/9V5sI4pRjhpBEwXEDwMLK4SuiA9NAEuD/Cd94ftemvCdWWMdadpA81qrRYj+KKq4T
 tiI9h5ym+kbn9xJSIgpNX0O1VoIG0aY3Vuw1LLy8VHLTUwQauW0069/xwz1rmfUY7D4ZB2Yeu9n
 2zJ/mL8WNT+2Vd9he1mDLCvP6HPN9TK+wFG2uF7vFj8KJHVCaOs7MD0ZX4D6iRwqamT5ihdGe+X
 XPRn3hHF
X-Proofpoint-GUID: tSfxV8QJNIEnt0AI7WY1bR-yfYcyu3tx
X-Proofpoint-ORIG-GUID: tSfxV8QJNIEnt0AI7WY1bR-yfYcyu3tx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_031658_485684_92E0C479 
X-CRM114-Status: GOOD (  16.92  )
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

Lemans is a Qualcomm SoC. Previously referred to as SA8775P. This series adds
bindings and devicetree to bring up CSIPHY, TPG, CSID, VFE/RDI interfaces
in Lemans.

Lemans provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 4 x CSIPHY

Changes in v5:
- Update commit texts for almost all the patches to refer sa8775p soc
  as lemans. This is required because sa8775p.dtsi is now changed to
  lemans.dtsi for IOT platforms.
  Name change is done as per:
  https://lore.kernel.org/all/20250803110113.401927-1-wasim.nazir@oss.qualcomm.com/
- Link to v4:
  https://lore.kernel.org/all/20250807121105.710072-1-quic_vikramsa@quicinc.com/

Changes in v4 compared to v3:
- Bindings and Device Tree: Reordered the csid_wrapper to be the first
  entry in the register list. (Suggested by Bryan)
- CSIPHY Driver: Added comments indicating the CSIPHY process node number.
- VFE Configuration: Defined bit fields for vfe_top_core_cfg.
- Clock Optimization: Trimmed down the clock list for VFE.
- Cleanup: Removed newly added deadlines from the CSIPHY, CSID, and VFE
  files.
- Link to v3:
  https://lore.kernel.org/all/20250703171938.3606998-1-quic_vikramsa@quicinc.com/

Changes compared to v2:
- Renaming camss-vfe-780.c to camss-vfe-gen3.c and camss-csid-780 to
  camss-csid-gen3 to avoid code duplication for SA8775P.SA877P have csid
  690 and vfe 690 which is almost same as csid/vfe 780 with very minor
  change in register bitfield.
- Restructure vfe and csid addition to reuse existing files.
- Updated commit text for Bindings patch.
- renamed cpas_ife_lite clock to cpas_vfe_lite. 
- added voltage rails for csiphy in documentation.
- removed sf and icp clocks.
- removed sf_0 interconnect.
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250427070135.884623-1-quic_vikramsa@quicinc.com/

Changes compared to v1:
- Renaming camss-vfe-780.c to camss-vfe-gen2.c and camss-csid-780 to
  camss-csid-gen3 to avoid code duplication for SA8775P.SA877P have csid
  690 and vfe 690 which is almost same as csid/vfe 780 with very minor
  change in register bitfield.
- Restructure vfe and csid addition to reuse existing files.
- Updated cisd-lite and vfe-lite interuppt names.
- add enumeration changes as seprate patch. 
- Update required fileds in bindings.
- Link to v1:
  DT: https://lore.kernel.org/linux-arm-msm/20250210155605.575367-1-quic_vikramsa@quicinc.com/
  Driver: https://lore.kernel.org/linux-media/20250210162843.609337-1-quic_vikramsa@quicinc.com/

Sanity check for these patches:
- checkpatch.pl
- Smatch: make CHECK="smatch --full-path" M=drivers/media/platform/qcom/camss/
- Sparse: make C=2 M=drivers/media/platform/qcom/camss/
- make -j32 W=1

We have tested this on qcs9100-ride board with 'Test Pattern Generator'
https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

A rebased version of the TPG driver, built on top of this series, will be
shared as v3 in a follow-up post.

Vikram Sharma (9):
  media: qcom: camss: Rename camss-csid-780.c to camss-csid-gen3.c
  media: qcom: camss: Rename camss-vfe-780.c to camss-vfe-gen3.c
  media: dt-bindings: Add qcom,sa8775p-camss compatible
  media: qcom: camss: Add qcom,sa8775p-camss compatible
  media: qcom: camss: Add support for CSIPHY (v1.3.0)
  media: qcom: camss: Add support for CSID 690
  media: qcom: camss: Add support for VFE 690
  media: qcom: camss: Enumerate resources for lemans(sa8775p)
  arm64: dts: qcom: lemans: Add support for camss

 .../bindings/media/qcom,sa8775p-camss.yaml    | 361 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 185 ++++++++
 drivers/media/platform/qcom/camss/Makefile    |   4 +-
 .../{camss-csid-780.c => camss-csid-gen3.c}   |  33 +-
 .../{camss-csid-780.h => camss-csid-gen3.h}   |   8 +-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  84 ++++
 .../{camss-vfe-780.c => camss-vfe-gen3.c}     |  75 ++-
 drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   2 +-
 drivers/media/platform/qcom/camss/camss.c     | 428 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 12 files changed, 1138 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
 rename drivers/media/platform/qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} (89%)
 rename drivers/media/platform/qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} (84%)
 rename drivers/media/platform/qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c} (70%)

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
-- 
2.25.1


