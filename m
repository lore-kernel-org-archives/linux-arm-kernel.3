Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCFFC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WvPOB5jmVHirrF+ZgOg9OU5FJ+cx1ttj/y19N8lrRAE=; b=YwPc8Gj8vM8xfzOZ0eP5zDfrO6
	d3Gp/qtPFReoN6YPNSziILqfY5UCI0Sfs4Msnhzr3qoglB4KuL21wIDFH1mMmQQVGupCUv8l5xKLF
	e5456WobRFwviW85FkF8CmoD4PL9x1R8bNB7cGqCwFvCRQxBlPEW5/cdFhGbBQyBs6KXa7msDyISd
	+9nLxB0K+C/e4VjGbG5bdbM8Rc3voAfE/X6OC1L1Thd7qMiBDaGNAMLsOXt7uenpXvli78Hgi2+ys
	6C0J7UhJ3aYclv9c8pDNqiXJUYGT7A1iAmati0tVZPYy/7OleAn7p2n8W4kK04ZSSC3VlxQGN7abP
	eFkLVuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjVI-0000000Ctx1-3u5D;
	Wed, 04 Jun 2025 08:29:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj5S-0000000CpnH-3jpF;
	Wed, 04 Jun 2025 08:03:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540FG8Z013323;
	Wed, 4 Jun 2025 08:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WvPOB5jmVHirrF+ZgOg9OU5FJ+cx1ttj/y1
	9N8lrRAE=; b=oSE8SrGCFKAwjT3n12v7OzCtlvxurfjfQIwD5gwDAl5PnYfH2m4
	P5P6gPdnLjQ8D7oHF6lNbvI8obtRip8IdaQ94EsukOaCR5y+nJjkPlDr6dybRKqm
	qqzO+tNhNAsU1F3n/bEvAXZpplS3lVzaiTmrDdB1v9TTIJH+wLSzW22BcWHRUDgI
	RkoxaTiBB1+sln7c0tG8QFYkj+fKyts+S2e5p5To81sALdCMtKPV/ZJmcHW9iDmz
	6WBt93SYa/xDpRPInkNqUz8jfHEAw/Fa/wBpaVSJEAKLbpMeb/YDSQwHpiRcmiJI
	j3+x1LOX9C7fOYyT9mRsrs+OJ/3cNUAAoQQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be810gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:44 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55482fVN003901;
	Wed, 4 Jun 2025 08:02:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46ytumenrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:41 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55482eFm003893;
	Wed, 4 Jun 2025 08:02:41 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 55482eLp003888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:40 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 8FA7E40D25; Wed,  4 Jun 2025 16:02:39 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com,
        qiang.yu@oss.qualcomm.com, quic_wenbyao@quicinc.com
Subject: [PATCH v4 0/5] arm64: qcom: x1e80100-qcp: Add power supply and sideband signals for PCIe RC
Date: Wed,  4 Jun 2025 16:02:32 +0800
Message-Id: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=683ffda4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Bg7XDE4CPuCW5LNoTQ8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: oxCH5CblYAdxVFJljLq4RirJs-ofu0RQ
X-Proofpoint-ORIG-GUID: oxCH5CblYAdxVFJljLq4RirJs-ofu0RQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2MyBTYWx0ZWRfX/aDIFhGjh4lq
 ROf3g+FmqCt45a9ln5oLfuUyxPENEEIcMmb8Ug5pXuXc/cM5DPtA24crJFz3ZPgXR1U3VeIJMMM
 zHukVV8dOlVCGAP4GIm4L5YsNAFAkTcoAz5X1JItUj6VZ09dpm3oqwpQpW4LxIKO9PRDJqfWzdk
 So3Nx2vKCwijFxjwRLCF1MaCDtHsmyotXIhlQptyc17wOVN3s/L+Scx77KE52rvhx4nNIOijXeI
 0m4BCl2GPRuaw0zHa1+hS8llPKLBv+Q/GTC1JhD4nvQCRy+sXvSSQ5ubHmD5Xo3BdyeSMEOw3Lh
 vWJHwBDfMSGT7d9+5rI+DXTK2flIpIHfEgE+zOgVvz1E7rhUeXPFdkqJx4gmFXLy6n+BgnPH5nt
 mpWYALNce4pF/8VrQXptOeiklEr/bTYGN5NbGbtlwZA0cwnQWSfgSuL1/wrQ2R60O2O8vW+9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_010302_933472_766AB6DB 
X-CRM114-Status: GOOD (  11.40  )
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

The first patch enables the PCI Power Control driver to control the power
state of PCI slots. The second patch adds the bus topology of PCIe domain 3
on x1e80100 platform. The third patch adds perst, wake and clkreq sideband
signals, and describe the regulators powering the rails of the PCI slots in
the devicetree for PCIe3 controller and PHY device. The fourth patch adds
qref supply in dts nodes of PCIe PHYs. The fifth patch requests qref supply
for PCIe PHYs.

The patchset has been modified based on comments and suggestions.

Changes in v4:
- Replace pcie3port with pcie3_port in Patch 2/5.
- Add restoring the vdda-qref request for the 3th PCIe instance by
  reverting commit eb7a22f830f6("phy: qcom: qmp-pcie: drop bogus x1e80100
  qref supply") in Patch 5/5.
- Link to v3: https://lore.kernel.org/all/20250508081514.3227956-1-quic_wenbyao@quicinc.com/

Changes in v3:
- Replace PCI_PWRCTL_SLOT with PCI_PWRCTRL_SLOT in Patch 1/5.
- Keep the order of pinctrl-0 before pinctrl-names in Patch 3/5.
- Add Patch 5/5 to request qref supply for PCIe PHYs.
- Link to v2: https://lore.kernel.org/all/20250425092955.4099677-1-quic_wenbyao@quicinc.com/

Changes in v2:
- Select PCI_PWRCTL_SLOT by ARCH_QCOM in arch/arm64/Kconfig.platforms in
  Patch 1/4.
- Add an empty line before pcie3port node in Patch 2/4.
- Rename regulator-pcie_12v regulator-pcie_3v3_aux and regulator-pcie_3v3
  in Patch 3/4.
- Add Patch 4/4 to describe qref supply of PCIe PHYs.
- Link to v1: https://lore.kernel.org/all/20250320055502.274849-1-quic_wenbyao@quicinc.com/

Qiang Yu (5):
  arm64: Kconfig: enable PCI Power Control Slot driver for QCOM
  arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
  arm64: dts: qcom: x1e80100-qcp: enable pcie3 x8 slot for X1E80100-QCP
  arm64: dts: qcom: x1e80100-qcp: Add qref supply for PCIe PHYs
  phy: qcom: qmp-pcie: add x1e80100 qref supplies

 arch/arm64/Kconfig.platforms              |   1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 121 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |  11 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c  |  41 ++++++--
 4 files changed, 167 insertions(+), 7 deletions(-)


base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
-- 
2.34.1


