Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDE0CDE011
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 06:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g41ZlfK29fM863Pwf07Q3hPzs6Ufs0fvl4z4IAmyq2k=; b=QyyAVCafrPyKh9/HObjnF8iCXy
	l7KXAp+eXb2Or8mzCCmYxV/Vy4pG/Hpjtt6RIrQJXNpxHs78ndZqYh0jjiO5vCM+pQ+Tfm5ItQuuc
	wxvsTqXMPdR0otq4YZIjmgPd3+Kq9yVD6cB3kRGuNiVd+PoNbGWgdg9qmMAmUG1G435T41imytfcz
	jn2hfS1dILkZ3m4Lh54qP5R49chbTof4c6PaqAhCwPb6TjA+dqjFuQ1x8wNfcQCicI37noLGPdbvT
	3/BiVDo7a60riTBv0U626pAK1E6mOaxOAs+GpuQ1oEbni4Bm9c3asfzWBEdBntcvoeGeuDs3ovTfH
	6cymoIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnZX-0000000BgEE-2QJK;
	Fri, 14 Nov 2025 06:46:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnZU-0000000BgDl-2f5V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 06:46:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMbJeY1486313;
	Fri, 14 Nov 2025 06:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g41ZlfK29fM863Pwf07Q3h
	Pzs6Ufs0fvl4z4IAmyq2k=; b=MGrUdl/I64Lbg1fZf09WOFZ9JiSTe3Qndrl/e+
	dBGd52z3o26ZvGxefW8wzK9MpnwHj77HXFeUj4jpATPkUzO5Dl3k3Gzm8HA6g+kB
	saDf6GlY4YJFJJcOhy+P04HZ66E5gDP88YHQH+Vo7p3b7WRV6t7WlwkhOI+yPt2f
	WWletiBdlCSpeQpe/SP9G9t01d4j8LWEDDbIspw6t6418/jiUaxvDTxfFF1cQsHf
	k0YQekcfOocs+34UVIPwAQSg4KwAuxi7HkVQ5gWCA1zY0nKPT41zMwQCME0F7z9H
	S4LkLeVe0sbtSbmY0Sf+n9RSrMYuUi+68iKEziyPRbn2TQIg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ch5be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 06:46:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AE6k1u6023234
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 06:46:01 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 13 Nov 2025 22:45:55 -0800
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
Subject: [PATCH v5 0/3] Add CCI and imx577 sensor support for monaco evk
Date: Fri, 14 Nov 2025 12:15:38 +0530
Message-ID: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Nq_CULvA0midnqJlnfLCVhcZ7eb5-k78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA1MCBTYWx0ZWRfX25fI4IzSxIe4
 XP0ETdLgqjUQ+VVD2ky9/5+HIuwtoa5b111pjMpu5vexCQ2Gy3TGEmfGy93RSx33IUCasMUXIbU
 XE3QE5W+0+fsc+e+DjKBU4hp0K6uFy1XaIGeqKHxYZY185UIpfakPrr4IIIUAkg5fzmk6PCNAYq
 QnpOTPIKCy4hskhg9/up+2JVH7Z0HbG/eJu0lqf8LHC0XiIwlsLCaHtLyofmaEWMu/oMYaWWhOs
 40+7V6M6bsPJ4sh3LXn1CMtAPMxiFtL1q8pq1eFTxz8xd5y6pcJxVVoBXSsi1b+Qez+YaSdoXSr
 U2mPuyNhuWFjj7jMC1f7YN3IH9WCs/3B1N9ardt54qBIrBuUmu8Gn8X5DkH4R+7I4hJsvJ34Vps
 Q7QJUpmCJ2sBtugHk/keIJH/cBbXLQ==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=6916d02a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yYjbjCPdd4sGEI68VPkA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Nq_CULvA0midnqJlnfLCVhcZ7eb5-k78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_224612_682418_D1017E0F 
X-CRM114-Status: GOOD (  15.66  )
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

From: Nihal Kumar Gupta <nihalkum@qti.qualcomm.com>

Monaco EVK is a single-board computer based on the Qualcomm QCS8300 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
---

This patch series depends on patch series:
https://lore.kernel.org/all/20251107162521.511536-1-quic_vikramsa@quicinc.com

Bindings for Supplies are added by below patch:
https://lore.kernel.org/all/20251107162521.511536-1-quic_vikramsa@quicinc.com

Changes in v5:
- Rename cciX_i2cY_* to cciX_Y_* to shorten the labels - Vladimir 
- Added description of pins with MCLK function - Vladimir 
- Link to v4:
  https://lore.kernel.org/all/20251015131303.2797800-1-quic_vikramsa@quicinc.com

Changes in v4:
- Remove the AXI source clock from the CCI node - Konrad
- Updated the qcs8300-camss device tree binding.
- Link to v3:
  https://lore.kernel.org/all/20250917130647.1701883-1-quic_vikramsa@quicinc.com

Changes in v3:
- Updated and Wrapped commit messages for [PATCH v2 1/3] and [PATCH v2 2/3] - Rob
- Link to v2:
  https://lore.kernel.org/all/20250912141134.2799078-1-quic_vikramsa@quicinc.com

Changes in v2:
- Remove the patch that adds PHY supply documentation in the qcs8300 CAMSS. 
  bindings. This change should be submitted together with the qcs8300 bindings patch.
- Fix indentation and regulator node name - Krzysztof.
- Update commit message as suggested - Dmitry.
- Link to v1:
  https://lore.kernel.org/lkml/20250909114241.840842-1-quic_vikramsa@quicinc.com

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml dt_binding_check
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Nihal Kumar Gupta (3):
  dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
  arm64: dts: qcom: qcs8300: Add CCI definitions
  arm64: dts: qcom: monaco-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/monaco-evk-camera-imx577.dtso    | 105 ++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi          | 303 ++++++++++++++++++
 4 files changed, 414 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso

-- 
2.34.1


