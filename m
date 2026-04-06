Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE79F46C44
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 14:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ja2Zw7SQIo+uZyNvquQPR3IByzGhbnlQCQbJj+JcdNQ=; b=DJkfWCWB5ScY5i2bz11g9OZWCl
	7BmJt8EvUPCbrO4ppMMSqyx+7rzcsI95sFqzPwbpqhZWVHcDyquKdf52ovmg0TyvGMAwufYt8hCCc
	Rg12hxMOBHOXYeb2xHnZA3ZnsQMvXR2lUQ+Zj9CATtvVmKvazJgu3tQMfuvC8DB3V2RcmTSZnl6pV
	CUsD3SVxz23PUbymTRofdRb7QSumJQ/JrKrdEbWuJDPnz8EbdgHMvQWRgVeYpLzBeEbmAyl0QzEcZ
	98ll+cghcMXSx4AC/5j6nT+xMWpJdUVfqQ0CAQV9qtuB4mTYRFnMwdFSISS8tSd8dAVIvZYaRIOGO
	UqroDZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9l6z-00000005Czq-1JfD;
	Mon, 06 Apr 2026 14:39:33 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9l6w-00000005Cxd-49tf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 14:39:32 +0000
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636CKjip1306974;
	Mon, 6 Apr 2026 14:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=ja2Zw7SQIo+uZ
	yNvquQPR3IByzGhbnlQCQbJj+JcdNQ=; b=La0tRLkupMrfA3u/w65lbX24YeYNx
	vjdcHvwAAZ1L3BQ3gf2BOet97rregrGa5a/hrXUFvSN/ih+8BoEt73rKXZq9rbVI
	wevbSLzCa/eOQtpq/EgBJ/0R4Qw9lppZboKEEwu+Ofbj6oK6zSQXtcemBZ3fWMmb
	V4iu/Uppu6pl9GVT848XkpnFT4P2akQvfG+XT6fEljJrxLNt9YqqrmS/T+3uRhbF
	yEqPQ4enShDwp3ZA1Lo2gWzHC3/ysSIMV43q6qIBHwN4NwGMWRweab93F81wnZkL
	CTylAnMAaImOVr9jAfO/rSIJ6gpPG7sCB8alWVl3jlwqs1BlxcmK/f51g==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dc8nc428b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Apr 2026 14:39:24 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 3AB22801722;
	Mon,  6 Apr 2026 14:39:17 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.39])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 3EFD8807BAD;
	Mon,  6 Apr 2026 14:39:17 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nick.hawkins@hpe.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/4] arm64: Kconfig: Add ARCH_HPE platform
Date: Mon,  6 Apr 2026 14:38:19 +0000
Message-ID: <20260406143821.1843621-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406143821.1843621-1-nick.hawkins@hpe.com>
References: <20260406143821.1843621-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q9vpVQT4_a0RW9CIx06lR2ROrwb5wIIj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE0NCBTYWx0ZWRfX3z2ARCe+rBqZ
 PuVF7pswuHFyJaqOFK/LSrTBUi9RS6HjlcFDwMSqL2wY3m4a6/K66lSdcaPQF786x2jHdEJX0Km
 J/rUcvtWwFalaiLMmlEGq/ZyB/5dECJv3iTxtbZ8UgwTujXiGvPWVXIag7wVSaxTgTNkvxGBbsb
 DJuRTIEl3Iu4+2P0Vofh1lvMmTq8qs6xJCrg1XYfwNsdjM+A07YO2L5Mvq1+JBNBURSbN97hUOi
 FZwABuw42YZKOI1HfIkoQx+6PktaYVVhflLT0TVW+FjZKoO4kAo/VmAXJPLXDL6Ve6Yg9KIKUnZ
 HEXDf4HyFfSCjRB73kK+yCCNMkG4jq0TupsQl/58HbQozxMkKTp4nnJThwZAsF9meDlYGWPZWtg
 0i49PO/AUdnHyzln+DkMu0Jqs+jbFhaKiVx7r7E8gc2ZocCe0+vBQjxHsXNK9PBFEqZ71GkKxOY
 ZdNOO7or0Xtzq1S6EZA==
X-Proofpoint-ORIG-GUID: q9vpVQT4_a0RW9CIx06lR2ROrwb5wIIj
X-Authority-Analysis: v=2.4 cv=cPHtc1eN c=1 sm=1 tr=0 ts=69d3c59c cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=NCWKwCw8Xy9Og0ibBRsL:22 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8
 a=ExUFRefvzqp9aA4d7S4A:9
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_073931_185913_DD4F3CB9 
X-CRM114-Status: GOOD (  11.09  )
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

Add the ARCH_HPE config for HPE ARM64 BMC SoCs to Kconfig.platforms.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/Kconfig.platforms | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 54eb1d7fd419..b4217809c774 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -168,6 +168,17 @@ config ARCH_HISI
 	help
 	  This enables support for Hisilicon ARMv8 SoC family
 
+config ARCH_HPE
+	bool "HPE SoC Support"
+	select PINCTRL
+	select GENERIC_IRQ_CHIP
+	select CLKSRC_MMIO
+	help
+	  This enables support for HPE ARM-based SoC chips used
+	  on HPE servers. HPE SoCs serve as the Baseboard
+	  Management Controller (BMC) providing out-of-band server
+	  management.
+
 config ARCH_KEEMBAY
 	bool "Keem Bay SoC"
 	help
-- 
2.34.1

