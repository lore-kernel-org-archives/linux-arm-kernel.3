Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB32F46C44
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QrAv4VGSoq0AOCco2CYmzJVKP5jzWlstWu9rsfotWO8=; b=H2MMHUt+BZYX/MrjQYtR8wTxBf
	jVFB0rjvaUHAAuXJkI/o+Z4f/uLTf6qSUQOOS6xqHC+C70CEvJJu3p4FlME9fzwW+GST5zR/LKuqs
	4nroKSG9irhmvj80Y5ECIw70y8CUlFPiz+12greLkLtw1micbEmov21FW+68cWlT5H7gCbhl+Okqc
	Mrs2yj3Z/EIj26C/hwhBuKuHve7tM0PXPFx9SJIiPN1XyHolkzpfUk7/NCvmd+Izw3dOAiCFWHSlQ
	Z4Sjlyes0ir57RE4TjVZTksKk+ZMQ/boe9F+ZgBobzbwO+bJVB+a0q3Eifd1xQXKsWnm/DZdV1Exf
	AXGrDOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9l6v-00000005Cwy-10qg;
	Mon, 06 Apr 2026 14:39:29 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9l6r-00000005Cvz-3jWx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 14:39:28 +0000
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636C8rh31225568;
	Mon, 6 Apr 2026 14:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pps0720; bh=QrAv4VGSoq0AOCco2CYmzJVKP5jzWlstWu9rs
	fotWO8=; b=Clz/dp29FSGmmFdIGus5vL2pgiAAV8yujFfDMgZ/VwBTaTywvcNXQ
	X+F6+Kemzly74JMls4CvBVH8KJuQFFRT0kpEi9m2XScZ186prd7O56dnwKWpW46z
	ATWr4o9KQ4o/zqkk0SXqhGc6I9EDpDz2qs+RScG4HqKWuqZcHjwSMxW4m+RGO/iX
	i3jDa9NPJHsokkXDjwycYAypOKE1r/5MsqxDRdT7Lj6EnXAPyXf+FfIpsYTLyVOI
	xmu2G+lM0NBDlMFTpYjyOJm3VcQgcBTZnHX6zw6KtogzSSclZJivfGnho2IjOS+0
	AxD1lgHs2Wvx0thnTWcd9kaICa4GxHzOw==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dc8vyux84-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Apr 2026 14:39:09 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 1904E2BAD6;
	Mon,  6 Apr 2026 14:39:09 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.39])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 052C88081C4;
	Mon,  6 Apr 2026 14:39:07 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nick.hawkins@hpe.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] arm64: Add HPE GSC platform support
Date: Mon,  6 Apr 2026 14:38:17 +0000
Message-ID: <20260406143821.1843621-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WrEm8Nfv c=1 sm=1 tr=0 ts=69d3c58d cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ZSrvDirOKP4VPF05hnFf:22 a=MvuuwTCpAAAA:8 a=ExUFRefvzqp9aA4d7S4A:9
X-Proofpoint-GUID: Lrzc4rr4drxOjdqLW_-ySY8y5wZmGS8h
X-Proofpoint-ORIG-GUID: Lrzc4rr4drxOjdqLW_-ySY8y5wZmGS8h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE0NCBTYWx0ZWRfX235CH7KTSfew
 cGpJm8gYxUErvBhNLmQ0ZRyij6TRLVnypoHTk+qrZIr6NfwWKerDTTUbakWYZfCUiZbZ2ZIyaIJ
 m09tLwxfo2Pjx88vsjmIShR5z620EoK07UeMMA86V8NBIaf+LTA9alDn/yZoqUF4GkwgvpOKrox
 t0izOx6sihna7pvHmmnP9SoR2a33HKyMxG3tzPlvNTdROqvO0phCr87wRjSBjEe3GNzbvdLggAh
 S7hF5Gdn9gsOlhYkcbUrdiaMfdbt/+KKr10ctnmx6igeiECRD5HGkLcHu3vOYEh+T0ju97ruE+v
 wfNtYx/Ps8p5fKz0l4cDVYzpLtBbk189GXYPodoyYR5D9L2EidvnobC8z3qYxGckv1/Mu76LlVv
 Mq4sfwsvf+zBiJgpT02Ncwutc+qHULVV3Dxgd5YFGY89Jlq62/anzxugDeonBWBw0HPwrv8gTkf
 LbGg//18vAAxJ7MoUDA==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_073926_295117_3583B08F 
X-CRM114-Status: GOOD (  13.13  )
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

From: Nick Hawkins <nick.hawkins@hpe.com>

From: Nick Hawkins <nick.hawkins@hpe.com>

Add initial platform support for the HPE GSC ARM64 BMC SoC.

Changes since v3:
- Patch 1: Moved GSC entry before GXP in hpe,gxp.yaml to maintain
  alphabetical ordering by fallback compatible (Krzysztof Kozlowski)
- Patch 2: Added Reviewed-by from Krzysztof Kozlowski
- Patch 3: Changed SPDX in gsc-dl340gen12.dts from GPL-2.0-only to
  GPL-2.0 to be consistent with gsc.dtsi (Krzysztof Kozlowski);
  reordered nodes within soc by ascending unit-address, placing UARTs
  before GIC per DTS coding style (Krzysztof Kozlowski);
  moved interrupt-parent before interrupts in timer and all UART nodes
  per DTS coding style (Krzysztof Kozlowski);
  reordered root-level nodes alphabetically: clock-33333333 before cpus
  before timer per DTS coding style (Krzysztof Kozlowski);
  reordered properties within all nodes to follow DTS coding style:
  compatible, reg first, then remaining alphabetically (Krzysztof
  Kozlowski)
- Patch 4: New patch adding CONFIG_ARCH_HPE=y to arm64 defconfig
  (Krzysztof Kozlowski)

Nick Hawkins (4):
  dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
  arm64: Kconfig: Add ARCH_HPE platform
  arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12 board DTS
  arm64: defconfig: Enable ARCH_HPE

 .../devicetree/bindings/arm/hpe,gxp.yaml      |   7 +-
 MAINTAINERS                                   |   3 +-
 arch/arm64/Kconfig.platforms                  |  11 ++
 arch/arm64/boot/dts/hpe/Makefile              |   2 +
 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts    |  18 +++
 arch/arm64/boot/dts/hpe/gsc.dtsi              | 104 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 7 files changed, 144 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/hpe/Makefile
 create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
 create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi

-- 
2.34.1

