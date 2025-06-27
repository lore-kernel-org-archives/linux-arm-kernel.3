Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E225C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 12:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oGsPkH2rrxLl8WhqTb5Ki42Da0cJxP6OhsnxYq2B9B4=; b=YNVzKsiO+YIV8s
	I2qEpi3zUvMiNvcCH1nwyYrmsGqQ1MY7OtXcBXU+rfIZiBAXHuzQ9jPiuSMupGzRSP4tfjIQ0GI+b
	e/bYBe9bihV5BTtC3EbfOaiKFDx0j56QVsVBI6K8303gBZN8HJuabmVw7Okr7KbhNIV3IX60v0P1p
	HgGe3kWePpWWMoFA0z4T858XL1siJeE3gSS5lZBkScOMhPZGdVgJlCX8hlXowuW2sJajn1uB+ZqzK
	dAbYIExtoYDlh0nFbHSx+QEQmOoHy5NW52Jf65hE+7Pw2IoLYdqJRHcOtU4ecA/RZzIsKy35f4Mnu
	aKmTgLnx/0XnPnBWhoDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8JD-0000000EeoJ-2NDg;
	Fri, 27 Jun 2025 12:35:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7uR-0000000EbL3-2ShV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:10:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBNrSJ027982;
	Fri, 27 Jun 2025 12:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oGsPkH2rrxLl8WhqTb5Ki4
	2Da0cJxP6OhsnxYq2B9B4=; b=NGzl0STTMoWl86P1SubDRpqvYhG0YzuCmQkkKX
	+T7UKrcXSQqgOkVaIaEjy6zojkDNM9OujWS89S20g/C+zQA7MZrmq0pMrV72HlpT
	PV/ta8U7y28OLXUwsOmG+jVETyFLM/CIx1MteISJRpeCwocNTZWVJ4wO2B06Z672
	opYpCRc3s4s01NZx1gDiJG4Ran+gSCmhSTuF1vZIzwuDBDrfiUcLstFa1UGxuykB
	Qtp1fYYTz4FVS6JiAgJlyjxq4rgOuQox/qXvfPlQGsMw5UpitkB90bVT3lqEkHUK
	GtwOYaYcr84rlJ2WlmgvNAgmYV3qEknerqOhr6ZIF6Ud1/Lg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26h5km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:10:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RCAE9M007416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:10:14 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 05:10:08 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH v2 0/8] Add Network Subsystem (NSS) clock controller
 support for IPQ5424 SoC
Date: Fri, 27 Jun 2025 20:09:16 +0800
Message-ID: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAO2JXmgC/22O22rDMBBEf8XouSrSypYvT/mPEoK0WjcL8U1yT
 ULIv1eJC6XQxxlmzsxdJIpMSXTFXUTaOPE0ZgFvhcCzGz9JcshagIJKWbBywWk48bxUJZSnMSV
 ESU1LyoSmrYBELs6Rer6+oB/HrM+c1ineXhubfro/OF3/h9u0VLIMCMF6g6HHw/LFyCO+56w4P
 vaFSNlNvO4zv2fz952t/rJxGOfLRQJ4MOC9bvrQbeZ517tEMkcHXrvCQ41owZDSntpAumoUOdd
 qU6kmV2tXu9bWJv94fAPlKCmhPQEAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751026208; l=3125;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=Q6DAgIisXotFp2YyZDRPMkG4NDGXfd1fpY31E0F3F0k=;
 b=QBBcMlWF/8hT1ZgeU+Cp68z9Jp+CgKePXzxB4Wj6g0x2nHZ3D+TtSODBSMLu9NNhPbBjEU/bB
 x+LBFdDVlXWCi4EDL3CuZrtDWZVFN8GPH0X73n1ddIuEcbPMQ/F9i18
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMSBTYWx0ZWRfX9yBDhKmhkeMd
 sbMxGFYNb85A5JL71k54wfyfNKhmyeiNDku4kX+ZdjnY2Ig6oz2simG1IIPH8jN3vgDEkBVWeAK
 ywH8Z5G+s+2DZ+oS3w+YEFGz1aKfpCixILg78h4rF1rTrB/y5xEM5HYK/XueBSMtffiIfAMCuHi
 yDDtkD6R6zfPgjFq3qI+oIDkeW9mNTqC9wpHW9oMOHnVps4gyVTlLtS2asT13RCjKlNgYEdEnLE
 l0hllkNvNSY26EtLytG2LKhgUQvvd4kV6z7uno7DWCLIPiZegebNR/Vnh3kVdXI7RpseBzl8zgE
 WZBkACOylveAUnowSLv6rW+iXxZh3YJ9ZbQQwOG0wZ6moYZODXCMHkH4DjKkArzezj5ead3IdSS
 PV5QSSkg6wRiAOhFsprcAuJcJGU0Y8SO1oJ9JNRi5o8HJm4HBoyB+mxBGLPE1+exQPgEHEL5
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685e8a27 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=oHpHAfgEF3aet8mg8aIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iQvvtPDnB7v6Uf59wPRm27eHKAwNWk4-
X-Proofpoint-ORIG-GUID: iQvvtPDnB7v6Uf59wPRm27eHKAwNWk4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_051023_634269_F629F339 
X-CRM114-Status: GOOD (  14.68  )
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

The NSS clock controller on the IPQ5424 SoC provides clocks and resets
to the networking related hardware blocks such as the Packet Processing
Engine (PPE) and UNIPHY (PCS). Its parent clocks are sourced from the
GCC, CMN PLL, and UNIPHY blocks.

Additionally, register the gpll0_out_aux GCC clock, which serves as one
of the parent clocks for some of the NSS clocks.

The NSS NoC clocks are also enabled to use the icc-clk framework, enabling
the creation of interconnect paths for the network subsystem’s connections
with these NoCs.

The NSS clock controller receives its input clocks from the CMN PLL outputs.
The related patch series which adds support for IPQ5424 SoC in the CMN PLL
driver is listed below.
https://lore.kernel.org/all/20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com/

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
Changes in v2:
- Add new, separate clock names "nss" and "ppe" in dtbindings to support
  the IPQ5424 SoC.
- Wrap the commit message body at 75 columns.
- Fix the indentation issue in the `IPQ_NSSCC_5424` Kconfig entry.
- Enhance the commit message for the defconfig patch to clarify the requirement
  for enabling `IPQ_NSSCC_5424`.
- Link to v1: https://lore.kernel.org/r/20250617-qcom_ipq5424_nsscc-v1-0-4dc2d6b3cdfc@quicinc.com

---
Luo Jie (8):
      dt-bindings: interconnect: Add Qualcomm IPQ5424 NSSNOC IDs
      clk: qcom: ipq5424: Enable NSS NoC clocks to use icc-clk
      dt-bindings: clock: gcc-ipq5424: Add definition for GPLL0_OUT_AUX
      clock: qcom: gcc-ipq5424: Add gpll0_out_aux clock
      dt-bindings: clock: qcom: Add NSS clock controller for IPQ5424 SoC
      clk: qcom: Add NSS clock controller driver for IPQ5424
      arm64: dts: qcom: ipq5424: Add NSS clock controller node
      arm64: defconfig: Build NSS clock controller driver for IPQ5424

 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   70 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |   30 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq5424.c                     |   21 +-
 drivers/clk/qcom/nsscc-ipq5424.c                   | 1340 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5424-gcc.h       |    3 +-
 include/dt-bindings/clock/qcom,ipq5424-nsscc.h     |   65 +
 include/dt-bindings/interconnect/qcom,ipq5424.h    |   19 +
 include/dt-bindings/reset/qcom,ipq5424-nsscc.h     |   46 +
 11 files changed, 1597 insertions(+), 10 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250626-qcom_ipq5424_nsscc-e89e03d8952e
prerequisite-change-id: 20250610-qcom_ipq5424_cmnpll-22b232bb18fd:v3
prerequisite-patch-id: dc3949e10baf58f8c28d24bb3ffd347a78a1a2ee
prerequisite-patch-id: da645619780de3186a3cccf25beedd4fefab36df
prerequisite-patch-id: c7fbe69bfd80fc41c3f76104e36535ee547583db
prerequisite-patch-id: 541f835fb279f83e6eb2405c531bd7da9aacf4bd

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


