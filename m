Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636E7E6C61A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q2RBkO3nvuxlv2gjSgJxbOXgxf5FYdpDETzUvFONTeQ=; b=FbP86ZHlxZIKAn
	jmzueH7mF2c5+8Qj7Tl45nyPqRYbwF/QnEqnh7CkkBB4evuxpASpzcwoNx0iWMEL7AQyPPGvNhvW2
	wMcEpKaSZSGM2MwI8ouBPG02NWUCBch1nrK5K3sZQiHN+ee2+oJm7JSiVWAfVs79pilxhvnCO6Urh
	ahQl8Qzu63qdRJJKOWJ48HnL2BuqMV5GEZgDzS7QXFICdHqNzOXdpOdvm91nkf8GkG4VXlMwllPFd
	/f37SlhRMEWIzcT/2tCTxv+HBxuyBBQBhmaRWwqKpyYWKwR9UTthiavmu6+afrFfBFIBG9VmIEm+S
	rMqEkJRWGvlka6SihLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPDm-00000008sgf-1gxr;
	Tue, 03 Dec 2024 09:29:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPC6-00000008sBb-0fOa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 09:27:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B362axI027818;
	Tue, 3 Dec 2024 09:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q2RBkO3nvuxlv2gjSgJxbO
	Xgxf5FYdpDETzUvFONTeQ=; b=VoZzCYFppgIvu7pYsHDbWVK3NzkyiOO4YEgb5c
	gRA1mMfulOFXStZ4awltJdmqMdFHjB5NyDyVfBbm45gfJ9+aSwbxMuHXEPIZaQlp
	rgxU/xP5MhtQ38ANoyK1UGb6bweZO/JeBpjFwfAIJEyKbbsKzkRhM079MrVxWuH6
	0FsSbbZSaiNRi9CfpA7djGuOWvLbxqiflfiqpDi07czrbuTwbK/gn2+cGVsE3FIX
	tapaacGrZYZCqoUHI/NjvAjAEuq3wczZyvct25BCpi9UEttxFqDmpklsvQSm9BR1
	6CkFU0ZVMFAi0iWUivlaaoKgTaYpJRpZqQ/F+DOJ+17Vyjdg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vceghp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 09:27:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B39RdTr014991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 09:27:39 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Dec 2024 01:27:35 -0800
From: Jingyi Wang <quic_jingyw@quicinc.com>
Subject: [PATCH v4 0/4] Add initial support for QCS8300 SoC and QCS8300
 RIDE board
Date: Tue, 3 Dec 2024 17:27:11 +0800
Message-ID: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/OTmcC/3XP0U7DMAwF0F+Z8kyQnYQm2RP/gdDkOgmzxFrWl
 Ao07d/JOgmBYI/Xlo91T6rmSXJV281JTXmRKuPQgrvbKN7T8JK1pJaVAeMQTdBHrsEC7GSQWeh
 1l+YqmpItGC1nTF6107cpF/lY2afnlvdS53H6XL8seJmuIERw/4MLatAJMkUqiQH84/FdWAa+5
 /GgLuRifjDm4QZjGuOiYweFDDnzl7HfzO16i22M6YgCYeciut/M+dp4ym1aZb7WVj3VrNv+IPN
 2U1zoOFA77wN6Uzrbp8QeEDsCDtGTL7aAadj5C8dzOc+UAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733218055; l=2910;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=T96BcuoR6g93Ngo3aMuJXGBNQ20OEsJzQg4Jmbm8yA8=;
 b=hpZHCYEtZXoBsGltYPA15q+LLQXi9gwAfMaRJ6Zca9sDD2vtK7F7k6qE/KNDhJJk7YV7vj5gP
 EKSBfgo/3bkCH0Z7LVGFZXBXWOeJBVQ4TfOx1k8xddT0N/taCSQem5c
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TuKrq-KOtN24SrnUSjVF73LsKhO6_b3o
X-Proofpoint-ORIG-GUID: TuKrq-KOtN24SrnUSjVF73LsKhO6_b3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_012746_208533_15076014 
X-CRM114-Status: GOOD (  16.33  )
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

Introduce the Device Tree for the QCS8300 platform.

Features added and enabled:
- CPUs with PSCI idle states
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC and RPMHCC
- TLMM
- Interconnect
- QuP with uart
- SMMU
- QFPROM
- Rpmhpd power controller
- UFS
- Inter-Processor Communication Controller
- SRAM
- Remoteprocs including ADSP,CDSP and GPDSP
- BWMONs

binding dependencies:
- remoteproc: https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com/ - Reviewed
- qfprom: https://lore.kernel.org/all/20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com/ - Reviewed
- pdc: https://lore.kernel.org/all/20240911-qcs8300_binding-v2-1-de8641b3eaa1@quicinc.com/ - Reviewed

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v4:
- fixup typo in Makefile(Andrew & Krzysztof)
- add board name in the commit message of the defconfig change(Dmitry)
- separate cpus into 2 clusters in cpu-map(Konrad)
- use QCOM_ICC_TAG_ALWAYS instead of "0" for interconnect nodes(Konrad)
- Remove unused labels and drop redundant comments(Konrad)
- Move clocks to the dtsi file(Dmitry)
- drop reviewed-by tag for dts patch for the code change
- Link to v3: https://lore.kernel.org/r/20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com

Changes in v3:
- Update title and cleanup signed-off-by tag(Bjorn)
- fix the INTID of EL2 non-secure physical timer(Cong)
- add reviewed-by tag(except for the dtsi patch for the code change)
- code rebase
- Link to v2: https://lore.kernel.org/r/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com

Changes in v2:
- decoupled from the original series
- Drop compatible for QCS8275
- fix property order and add line breaks
- move sleep_clk node to qcs8300-ride.dts
- move l3-cache nodes out of l2-cache nodes and remove cluster1/cluster2
- add BWMON nodes
- commit-msg update
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com

---
Jingyi Wang (4):
      dt-bindings: arm: qcom: document QCS8300 SoC and reference board
      arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS8300
      arm64: dts: qcom: add QCS8300 platform
      arm64: dts: qcom: add base QCS8300 RIDE board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts       |  235 ++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi           | 1405 +++++++++++++++++++++++
 arch/arm64/configs/defconfig                    |    3 +
 5 files changed, 1650 insertions(+)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241128-qcs8300_initial_dtsi-ad3f193ce1d7

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


