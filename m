Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C2DF483E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NbmZ1QKrXEl2r+K4tiwcyEFIcHYN37QKlPIMtIbx0A=; b=LsQRvZEU2F8z80UaA/LKjW6qks
	C1x0YS3V7frYky+jrFjuRzxmKm4ZfPiea1Xj+E2Y0GVbiVzwFbm68fUve0gZ1p4I5fhxUsrrYJreJ
	EYColoQ7Spgnoc4nJIM7nr3mvGGrUpr58mIegsfLJZKJNc68B2APQhCn4/gGuZTPKnCCbXkCBTIoi
	B/xeFVnFDszf/D82tv05DUqHiix2T3hHvhXJ6Wyv16ugQznX5ifaCm23zE3Iwek7n0yy1b81fJZgD
	g32rnW6cI2V1bP3cDqItgm0Qr9/dsJIhDbj0c6wEbuHPPchuI5Nn8lkbmFPV8MtgFh0vXVyUvZoJF
	ZQj5wivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lAj-0000000HTkW-3lgO;
	Mon, 23 Mar 2026 19:42:45 +0000
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lAf-0000000HTgx-3Pn4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:42:44 +0000
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHBbS63538076;
	Mon, 23 Mar 2026 19:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=7NbmZ1QKrXEl2
	r+K4tiwcyEFIcHYN37QKlPIMtIbx0A=; b=iSipXJrvTf/UWBn8mzKCzxGYdllmz
	GXSGDF2OYlSXtrD1R7T/wDc3WCijB/XIgypkM7Y8/LrVefSW7vZDE17XFtAK9InV
	ZS//9lw/rCK3IeG6Oef6IHgqJ/bQ/uLBhO7OKgsMfZMnp3V8sywK60E+THdPg2zj
	/UL/gT/q6TPY6gmKR4LDLHvla6BCKGGz/+x0e8UnuZK2TkxsoYazeHoCSsHBxDHG
	x+YcdtJFxWDf8p4eIvtGBbEuPPoESEoiYa5bczeGNC+b+UtXE5dFyQ8hDqJMQ+4j
	BOGe+9TCd/OsJdSC7xKMXGgrNsmGiSmTZOTv7xJIebBztr/6FuxRWsJ+Q==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4d32faykv3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 19:42:30 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 1FA13802BB3;
	Mon, 23 Mar 2026 19:42:30 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.39])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id A27EE810AF6;
	Mon, 23 Mar 2026 19:42:29 +0000 (UTC)
From: nick.hawkins@hpe.com
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean-Marie Verdun <verdun@hpe.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v2 2/3] arm64: Kconfig: Add ARCH_HPE_GSC platform
Date: Mon, 23 Mar 2026 14:42:22 -0500
Message-Id: <20260323194223.683487-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323194223.683487-1-nick.hawkins@hpe.com>
References: <20260323194223.683487-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SztAbvx7loym9CNYxY-pARWcbR_1LesO
X-Proofpoint-GUID: SztAbvx7loym9CNYxY-pARWcbR_1LesO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0NSBTYWx0ZWRfX8dZGn8JhO4pI
 r7AJbyMcv0jDfC9vXFZyOjSGr7t8Ukr2jcgcb9SKNhjGLspuqsPcDRzZJdKT7RngsTOAqnl6SDC
 bG+aG3nrtAvzbYcODd/pScoWAJEiY3Ri2Dse7VDlZlPytPP+2Im1zgE5hPUz2nyEAmveIgu244R
 dl3pF39iHzB7697pUSsDHE7doKLjQ6xvr2/OIe3jP2ngq5DQBuFo7J/0LEIltrTPinRo/faihgW
 nUurqOisTZG4DN6dDke7dzCMuQmxDsl+nH9vMMqijkjXmDapy86hbAPvutAlDD7gjqPQ8QqqQlB
 uaCi62+e/+hzocKf3b6aRnz9uVccVSjH7mYpnubioZ/OJaW30D0PkvC5c6T8l4BXeCWlFU7D2Mm
 hkJJkXvVD93HudavIt/uCck+Z9Je+eurHkm2LAiVAyEpAcGdMHaZrYK8zliPe0Jx1+GIwn4xW6r
 d4cUiLuI2EoPdUgTx1Q==
X-Authority-Analysis: v=2.4 cv=ZdEQ98VA c=1 sm=1 tr=0 ts=69c197a6 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=_ZmgHqWwjZUDpi_pur5s:22 a=MvuuwTCpAAAA:8 a=N7h5HMGqC5NSTC7Z1HcA:9
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 suspectscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_124242_966552_7C790348 
X-CRM114-Status: GOOD (  11.48  )
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

Add the ARCH_HPE menuconfig group and ARCH_HPE_GSC config for the
HPE GSC ARM64 BMC SoC.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
---
 arch/arm64/Kconfig.platforms | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 54eb1d7fd419..4bbc27bb9b7b 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -168,6 +168,29 @@ config ARCH_HISI
 	help
 	  This enables support for Hisilicon ARMv8 SoC family
 
+
+menuconfig ARCH_HPE
+	bool "HPE SoC Support"
+	help
+	  This enables support for HPE ARM-based SoC chips used
+	  on HPE servers.  HPE SoCs serve as the Baseboard
+	  Management Controller (BMC) providing out-of-band server
+	  management.
+
+if ARCH_HPE
+
+config ARCH_HPE_GSC
+	bool "HPE GSC SoC"
+	select PINCTRL
+	select GENERIC_IRQ_CHIP
+	select CLKSRC_MMIO
+	help
+	  Support for the HPE GSC ARM64 BMC SoC used on HPE servers.
+	  The GSC provides hardware management, power control, remote
+	  access, and server health monitoring capabilities for HPE
+	  Gen12 and later server platforms.
+
+endif
 config ARCH_KEEMBAY
 	bool "Keem Bay SoC"
 	help
-- 
2.34.1


