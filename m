Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C73CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 13:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=98URZ/cpJXW9rn2zuoqCwFPwoXiSh4G9Lz7HidOJFoA=; b=T45yCG5o6stmgXVmo8bt0cNYQw
	zX1iIUYzj4YuWlm2M1m35muXAenv5Tjg9OxDTaAU6Rr7lftP0OEPBueBVKV/HyC2zcvB2wHS/Y1z/
	JRYOPnv+7w8oHIZ9QZtffZFPdd62RefyxChoTAg1oBxgfQGR3Wfxhp56HP+QAMnHCXV+lcktx1/Kh
	uIqeGYkqLVxzPAZGyB3pXLIAg4v18E1Z3A9Mt1SR4fuORSyByPT0eQcF4DUcxu2HrImBq5mdVovYv
	u6Mp9K4cQh+70td/d9SX79s6qXVHhmBb01I88+8Al+KXIYH/htjjEgJJtZvUxFlGq/FoNOw+R0Cgo
	cQCUXC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMQB-0000000HOHO-3Kyi;
	Fri, 07 Nov 2025 13:22:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMQ8-0000000HOGa-1cxL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 13:22:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7B5RaT3175381;
	Fri, 7 Nov 2025 13:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=98URZ/cpJXW9rn2zuoqCwF
	PwoXiSh4G9Lz7HidOJFoA=; b=hjE7+65TXp+y9nRW523UqFKurqYTRIE/f7noHQ
	FXHcamKbPsdPMK8bJwSVtA9p3Ed5dvXN95i1yh1/Zedg5YZZYqCXQq0DCJ8iyWMW
	+9/885/jtA7nQsuY62CqfF/M25SfkNQEGx5V+PclFBKQlWb5ZT2/FtRLnAAoi8C4
	apx7i8jTaQsTen9XtGq9WZ14gUqfbpea4S92J/sI+PZfzqJKzVUUN7yWagdEnJ82
	hX4vmfgf1KCDarfzK6/VGiprpPOGe0D0NeSJ75Ystse68voQA0Im05W6lu1xwFLk
	jWEhlPrhU5S3CmmSbM4E6RQrb3l4ZASPMvSCst7MAigyhWkQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9fk80ar7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 13:22:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A7DMHUd007636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Nov 2025 13:22:18 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 7 Nov 2025 05:22:12 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nihalkum@quicinc.com>, <quic_vikramsa@quicinc.com>
Subject: [PATCH v5 0/2] qcom: qcs8300: Add qcs8300 camss support
Date: Fri, 7 Nov 2025 18:51:52 +0530
Message-ID: <20251107132154.436017-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: f_1oKXw3S4z_kdK8yB_M9eOm_017e-1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEwOSBTYWx0ZWRfX7X5enrP4+zTB
 cs4AeL39Yieqd0pGd1kSzBOh+++/t2bx2mr7N+dxMDlMTZ38GqhLcat1NFMZP4W7Hzj2Yd6OHtd
 JtkczR4CICoMvMvRkDQRY9zzA66RAyR78kx7BhWA4TQ5j92N2fdA8jSdEqmTD9kgndiFr3I7t+Y
 Ltw0ryrMCHuP35FaVgk9lSZI2jCDDrUXBN5rNt8K+IhDuYPmqo7J9M76rF8YabvxkJ1JKxwaLpj
 MP+lTGtsZ/yKS2ykBOewsj5MAHEVBvHLDsqF8s1Y5HCPqWprQghW/HniE3hicOxl/++DwSWJsjL
 m4PoP7Njt6hcn+Fnapx9DqPWRPb+g4LwUzSiYGb2n1aivBOzHaNSdUyRWeubdcsdS9KVhMGEkwT
 pmi/n/UavIAuZFR/aaliTvn+xD2nPQ==
X-Proofpoint-GUID: f_1oKXw3S4z_kdK8yB_M9eOm_017e-1G
X-Authority-Analysis: v=2.4 cv=CPAnnBrD c=1 sm=1 tr=0 ts=690df28b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0I1b_zmpnLY7N7-knUEA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_052228_547679_9B781EC3 
X-CRM114-Status: GOOD (  14.32  )
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

Changes in v5:
- Added Fixes: tag - Bryan
- Removed empty lines between single properties - Vladimir
- Modified binding phy supply description - Vladimir
- Link to v4:
  https://lore.kernel.org/all/8966ddaf-9c10-4626-a4cc-36efd3fc93e2@kernel.org

Changes in v4 compared to v3:
- Added supplies in bindings to enable camera sensor.
  This change was earlier added as V3.1 of Binidings which was 
  reviewed by Krzysztof and Bryan. Link to this discussion:
  https://lore.kernel.org/all/20250910104915.1444669-1-quic_vikramsa@quicinc.com/
- Droped the zero-prefix from the size field un DT patch - Konrad
- Link to v3:
  https://lore.kernel.org/all/20250813053724.232494-1-quic_vikramsa@quicinc.com/

Changes in v3 compared to v2:
- Bindings and Device Tree: Reordered csid_wrapper to appear first in the
  register list (as suggested by Bryan).
- CSIPHY Driver: Updated the commit message for the CSIPHY patch.
- VFE/CSID Resource Data: Reused the same resource data as sa8775p for VFE
  and CSID.
- Patch Series Order: Rearranged the patch sequence and moved the DTSI
  update to the final patch in the series.
- Code Cleanup: Removed duplicate data structures and reused existing
  ones.
- Optimization: Simplified and optimized conditional checks.
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250711131134.215382-1-quic_vikramsa@quicinc.com/

Changes compared to v1:
- Changed the order for register entries in bindings - Krzysztof
- Changed the naming for interrupts for consistency - Krzysztof
- Combined separate series for driver and dtsi into one.
- Rebased on top of latest version of sa8775p camss patches.
- Link to v1:
  Driver: https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quicinc.com
  DTSI: https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quicinc.com  

We have tested this on qcs8300-ride board with 'Test Pattern Generator'
https://lore.kernel.org/all/20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com/

Used following tools for the sanity check of these changes.
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
  qcom/qcs8300-ride.dtb
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
  dt_binding_check
- make -j32 W=1
- checkpatch.pl

Vikram Sharma (2):
  dt-bindings: media: qcom,qcs8300-camss: Add missing power supplies
  arm64: dts: qcom: qcs8300: Add support for camss

 .../bindings/media/qcom,qcs8300-camss.yaml    |  13 ++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 170 ++++++++++++++++++
 2 files changed, 183 insertions(+)

-- 
2.34.1


