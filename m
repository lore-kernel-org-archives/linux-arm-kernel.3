Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FB0C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rtUOX80/ltlp7l3zShK1M6bZn4lxsi+XiIWvVv0TW+c=; b=wATu59dQraq8LoDVdBhVAhwZPM
	DV/BUjmu+6QqgkPF+EYVk7pZFClVjf7zuV3V6CqRsQnfIJkV1QqEuJAIOL18k6b54FVtGDtLztOQd
	+AqlPAAJZ6t2AjF2RvRUa1o+glgS26edGpNUiLZaac1Y2ZKAz6H6C6AmK5xOPTpMSWN00SJrZy+9i
	Cttf1Q2JPjFUCDB+kPnrHWUQ14BX9SoKJOulIv2w/8x7iWYAnsaHzfjK0tCW8lopdq24ySVZ5mEtj
	7wNWTWMmyORzJMOZPafd+VWxVltjwR7PkXU/zHwXc+6/YDUSNBurCtG30vKoZX8fHA9+H9nBL2OYB
	Wc+aYpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8G9G-0000000Ghpm-1pFm;
	Fri, 25 Apr 2025 10:19:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FNo-0000000GXrp-1cP9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:30:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TBbd018977;
	Fri, 25 Apr 2025 09:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rtUOX80/ltlp7l3zShK1M6bZn4lxsi+XiIW
	vVv0TW+c=; b=Miy7kN9QxhxDIxotLimxT1T29fh37yolFhu+Q9qRn2Ig1UyylN1
	7sBC7HclV4yeL4B/JMtq+DKNGfuow5aTOboFBRMi4B9hE0MWMebR8gzzUWv1qYA7
	Ge6tNp8ojcH/zylcaNb8t49oLcjPZNQ0CGusYsbznlC56Aa7QHAnOya0XaZfkZNX
	By2TB+B0kIUzjKKM31HpDg1qbaipHHtAJ1WtbBBPlgx2wgPlXzYJkeVNMVf3r0uL
	12Gmgozt5cLe0UfmzhGWc1CZfzt2W9GJOFxzc9z57ZX6Tgkt7bwb9GfaofT2m6cm
	ns4VaYk3F5pwWjbbgbXkNEd19CewysEsuig==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh28hx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:02 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P9Txjo022129;
	Fri, 25 Apr 2025 09:29:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4644wnf72s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:29:59 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53P9TxMn022122;
	Fri, 25 Apr 2025 09:29:59 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 53P9TxSq022121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:29:59 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id E057240D6C; Fri, 25 Apr 2025 17:29:57 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v2 0/4] arm64: qcom: x1e80100-qcp: Add power supply and sideband signals for PCIe RC
Date: Fri, 25 Apr 2025 17:29:51 +0800
Message-Id: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680b561a cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=4-n6rLelgxkyzdg-Py0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: r63uoIcIo8vJDo1FizADCv02yM4f4dqb
X-Proofpoint-ORIG-GUID: r63uoIcIo8vJDo1FizADCv02yM4f4dqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfX7R6Yb3LKeNoi 5sSX6JFZRKr+/obqun0INO96Qjkay+dnTqRwO0CEaw2MR1jkz/IUWD2TFCHvMb6Ub9b9hP9ML2c nC5XhbLPG/WAse+IUbA6aPsQ5KDpuTEzLSt9waTdb9cCTD27zbUGS3i+W3YDkd9yl7ElUn8nO1Q
 5uCITYs7nic0mwv5R8zFlgxGRSZnR7pk3puC6IWWdqT/zWTdM0uFemLnxTLXVVz7552Pk9IYgJc g2Uknix92kM4W+nU2/5pIKiIRWcK4urH+Ou2m4xW8E70zTYaxyFHehzbR/zaIBzNIuSjcuvGEFQ P9zVNZ22FTO6ywI2KfZitsN3IgDk4MY/Ea0KKQkRwhnzQ4ws71Jep1nRMNy1MNdvHfC00T1CuOj
 AcjbSdhf27KvjfdDNghTX9t6d9074AOaAv/sw4cpxbw9eXcn0yp1QlIlZZFqd07MkRypLevG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=816
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_023008_440138_5BC0F341 
X-CRM114-Status: GOOD (  10.21  )
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
qref supply for PCIe PHYs.

The patchset has been modified based on comments and suggestions.

Changes in v2:
- Select PCI_PWRCTL_SLOT by ARCH_QCOM in arch/arm64/Kconfig.platforms in
  Patch 1/4.
- Add an empty line before pcie3port node in Patch 2/4.
- Rename regulator-pcie_12v regulator-pcie_3v3_aux and regulator-pcie_3v3
  in Patch 3/4.
- Add Patch 4/4 to describe qref supply of PCIe PHYs.
- Link to v1: https://lore.kernel.org/all/20250320055502.274849-1-quic_wenbyao@quicinc.com/

Qiang Yu (4):
  arm64: Kconfig: enable PCI Power Control Slot driver for QCOM
  arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
  arm64: dts: qcom: x1e80100-qcp: enable pcie3 x8 slot for X1E80100-QCP
  arm64: dts: qcom: x1e80100-qcp: Add qref supply for PCIe PHYs

 arch/arm64/Kconfig.platforms              |   1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 121 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |  11 ++
 3 files changed, 133 insertions(+)


base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
prerequisite-patch-id: 8d8c88ca71e145f5f1c5145d9ff3ebe90101aab7
-- 
2.34.1


