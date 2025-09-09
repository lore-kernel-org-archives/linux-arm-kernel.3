Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09035CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=44rV39RuM0t4i4ZwNFg5Mi2/lQovCw3o/lMEzZuoNzo=; b=cRHGQPGAq6lTIU
	kcQrjpuV5EcVIeM5SgpeEqBID3Zrj5SrNT4Zk7I7kcu8+j2Z5us9R0rW0SHjZvKTFzSeRX7Cxkjho
	fY0M1mwWHunMB4OZh2a3xTbPXpfToPN5b/ymyE7WV+c+IMq9jRcxV62JCOCaBuLEoIrYQfFRjWa1G
	0kpe6ZLNq0XAlaUNQ51aKla61q/Jh/MshR1C1NIWa0LVLQEDcPQ6DV2eiYxU7QVJs8HdAIPbHXJc4
	DswUHoXEa+OFcJoyeZj7HNcDMT06OF+TeXuDytspnQ/enS13qDUjFWSbQzZpMApzEnKzSo/NFpqeu
	PwNxlNqiQvE6n17PAhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zv-00000008uBr-0zSG;
	Tue, 09 Sep 2025 17:19:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyZz-00000007SQk-2GcN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:40:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LmhT024975;
	Tue, 9 Sep 2025 13:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=44rV39RuM0t4i4ZwNFg5Mi
	2/lQovCw3o/lMEzZuoNzo=; b=Q76V/bW99GRic7nSBlEGNovxMJh/04T8FfI7aw
	tUM0bK+vBpzBWYxjGCx4uJ2Jf45a36pH2bBxRDUhs+YvFntgBhoM/xQrYr5VkLjx
	8K2kY/uhXyx9I/TtYDcnizYSTZ5oOz+UHFylev/I6E2lFyb/Wpkevr1f0ygFJfdS
	VsunEMsI7NSdhPYyyyB+/1Y8tW5V+CeeOL52L3bjI1gxjU+Q22Nk9hg/PaykYd8p
	tbPsIAnKHbB16iRZIR7FVeYvRsWQ+CAoUff42mpaHEZa8n8Duzwd1RvDjpQkaFkh
	GzpDfHqrdEOxNuZwAo2viREfmHbGsy+JfKhBB2T3+F32XJrQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by90ds7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 13:39:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589DdSe9030446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 13:39:28 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 06:39:22 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH v5 00/10] Add Network Subsystem (NSS) clock controller
 support for IPQ5424 SoC
Date: Tue, 9 Sep 2025 21:39:09 +0800
Message-ID: <20250909-qcom_ipq5424_nsscc-v5-0-332c49a8512b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP0twGgC/3XOQQ7CIBAF0KsY1mKAgi2uvIcxTZmCnYW0BSWap
 neX1oUx0eWfzH8zE4k2oI3ksJlIsAkj9j4Htd0Q6Bp/sRTbnIlgQrFKVHSE/lrjMCopZO1jBKC
 tdtI2TvBSK5KLQ7AOHyt6OufcYbz14bneSMUyfXMlZ7+4VFBGHZe6BbnngovjeEdAD7u8SxYwy
 Q/y56ckMwJG88IIpgyYb2Se5xcQl4ZN+wAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Varadarajan
 Narayanan" <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        "Manikanta Mylavarapu" <quic_mmanikan@quicinc.com>,
        Devi Priya
	<quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_suruchia@quicinc.com>, Luo Jie
	<quic_luoj@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757425161; l=4620;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=8TUfSfsjcjeJinpxlZlLjr7NUdnn33y4lspuTRNsq8c=;
 b=1gm5wvhkKAiVeWSrgmLNUTU1OiUyhYA+Iiad1StfCEnft5O3j/q3EY3qUh1LkjguYpfGrfKsB
 U0DxUScUE7sAcHefcx8QwJOH+VbIXCzQPopYKsC1IGlYLKRI/pHX8zM
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c02e11 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=7tda8KZc5G6-a3B2-a8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7MXtuW5MNahNoeweuYpK9XpZbT6UCTur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX58P7X6umouR1
 WzJudk2LU7zvg1/ey+xLH+gSiPeZUz3833AXy5+IH0DJ4ankYOJT2VJQIBACMCPRaDbhEMr6KMn
 T/IhqoqHEbljCY6nit6d1L6K4SsgZTD0xbBDPCd8USTwOhOvsz3bynyjOCQIi0tEH73UDorqn3/
 BoeBt/RqMOFQvtxpNVwWKOQdBlX8Ej1Wt+LcK8OfwKkovTe/q8N1h1LavK3CvEeAuk/GZrQimBk
 8Ix4+g5fWPxwwGoe5uV6r9mjdzw+OIK0yrGSJ+S80bQnTIYAdBpYCFTOhr/qv5PZbcdv7pWiGWU
 QIF1b+ZW4xG7RXq1ewJZcT3fBw1gHv6kKXYfezhvqk/oflK4C+ljhoRce4DN+5g3BZGsm8Nht6Y
 HZMEhRo1
X-Proofpoint-ORIG-GUID: 7MXtuW5MNahNoeweuYpK9XpZbT6UCTur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_064015_738668_1C2ACD8D 
X-CRM114-Status: GOOD (  18.00  )
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
Changes in v5:
- Reorder the fixes patch "Add required "interconnect-cells" property"
  to the beginning of the series.
- Enhance the commit message to clearly explain the necessity of the
  #interconnect-cells property for interconnect providers, and why
  there is no ABI breakage for currently supported SoC IPQ9574.
- Collect the reviewed-by tags.
- Link to v4: https://lore.kernel.org/r/20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com

Changes in v4:
- Add new, generic clock names "nss" and "ppe" in DT bindings to support
  the newer SoC such as IPQ5424 SoC, while retaining existing clock names
  for IPQ9574.
- Register all necessary NoC clocks as interconnect paths.
- Separate the fix for correcting icc_first_node_id into its own patch.
- Separate the fix requiring the "#interconnect-cells" property for NSS
  clock controller node.
- Update commit titles from "clock:" to "clk:" for consistency.
- Update copyright to remove year as per guidelines in all driver files.
- Remove the Acked-by tag from the "Add Qualcomm IPQ5424 NSSNOC IDs" patch"
  as the new NOC IDs are added.
- Link to v3: https://lore.kernel.org/r/20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com

Changes in v3:
- Remove frequency suffix from clock names for PPE and NSS clocks in
  IPQ9574 DT binding and DTS.
- Update IPQ5424 DT bindings and DTS to as per new PPE and NSS clock names.
- Expand the register region of IPQ5424 NSSCC to utilize the entire 0x100_000
  address range, ensuring inclusion of the wrapper region.
- Collect the reviewed-by tags.
- Link to v2: https://lore.kernel.org/r/20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com

Changes in v2:
- Add new, separate clock names "nss" and "ppe" in dtbindings to support
  the IPQ5424 SoC.
- Wrap the commit message body at 75 columns.
- Fix the indentation issue in the `IPQ_NSSCC_5424` Kconfig entry.
- Enhance the commit message for the defconfig patch to clarify the requirement
  for enabling `IPQ_NSSCC_5424`.
- Link to v1: https://lore.kernel.org/r/20250617-qcom_ipq5424_nsscc-v1-0-4dc2d6b3cdfc@quicinc.com

---
Luo Jie (10):
      clk: qcom: gcc-ipq5424: Correct the icc_first_node_id
      dt-bindings: clock: Add required "interconnect-cells" property
      dt-bindings: interconnect: Add Qualcomm IPQ5424 NSSNOC IDs
      clk: qcom: gcc-ipq5424: Enable NSS NoC clocks to use icc-clk
      dt-bindings: clock: gcc-ipq5424: Add definition for GPLL0_OUT_AUX
      clk: qcom: gcc-ipq5424: Add gpll0_out_aux clock
      dt-bindings: clock: qcom: Add NSS clock controller for IPQ5424 SoC
      clk: qcom: Add NSS clock controller driver for IPQ5424
      arm64: dts: qcom: ipq5424: Add NSS clock controller node
      arm64: defconfig: Build NSS clock controller driver for IPQ5424

 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   64 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |   32 +-
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq5424.c                     |   28 +-
 drivers/clk/qcom/nsscc-ipq5424.c                   | 1340 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5424-gcc.h       |    3 +-
 include/dt-bindings/clock/qcom,ipq5424-nsscc.h     |   65 +
 include/dt-bindings/interconnect/qcom,ipq5424.h    |   33 +
 include/dt-bindings/reset/qcom,ipq5424-nsscc.h     |   46 +
 11 files changed, 1613 insertions(+), 11 deletions(-)
---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250828-qcom_ipq5424_nsscc-d9f4eaf21795

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


