Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459E4F459F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXA44oQsFEQ9J7VmBPmiBuOSaGoyF6XluUzLaeSYqaQ=; b=rsw7X8pyrQDVrlzlO6sG3lNAr4
	1aAkogZ3omeoQ6eKoWXDfERs7+Q7z96//1TD2YXBXPdbjKDuGrfocxDQnaLEPuJG4VTMEOuzE8YPO
	WkU2m6zpPQg4m0GYAr9yy2oQoTGsXNxUUk7H8BCFunaVY790eep9g7Wq9nOlos0ZqPixAW9VBImcQ
	sJRUKIxdItHWN3nh+0kjBOTuJGoyDLEUNJW/VunIRnh7M1faQKK7reWkV4nZvK6zFwkzb/v4ornQ7
	+a/iDETNQOKyL/R9iAGiPstCOX9MdxXmyAWmZbQjxTuegaaI0K3voqTQglA4N2En8zat0JWFGFIRb
	yQV/mwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFTG-0000000Cbgu-1pq7;
	Fri, 10 Apr 2026 17:16:42 +0000
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFT8-0000000Cbcb-20an
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 17:16:37 +0000
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ADSf3L700659;
	Fri, 10 Apr 2026 17:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=xXA44oQsFEQ9J
	7VmBPmiBuOSaGoyF6XluUzLaeSYqaQ=; b=HTjgmachV9sA8T1x1xHQSAWUpuqAn
	8WIORRhj7Wr52HIRobTfTaSDpeESsXJ9G3e7mIJ0RF4Jo6UF0nJ+GqRlp7rqNGn2
	fnmC+Ip98DntF+XRvq6oQG0MZ7l3pd4IbUgHwoH0qwtvv26gubCZ78UxbPLKNeLP
	qVFsS8jrDsv8iCr6O0XKEXQk5gbz5u85QPCp9wTl92451Fk6d1Vfaem3RkJtAyJ5
	/eLkQLid73G8MIAINiad/cCxpCcAz7TUC8KOf92ya0IugErS68CnEeaCqxNt2aBf
	bX83eGrs7PfQJVyW5dZuFlQ+aoc8DekwyxJ/NM4YUzlCxpGfRg4OCx71w==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4df24b2hg4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 17:16:21 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id BA3ADD1D6;
	Fri, 10 Apr 2026 17:16:20 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 53DA5801629;
	Fri, 10 Apr 2026 17:16:20 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v5 2/4] arm64: Kconfig: Add ARCH_HPE platform
Date: Fri, 10 Apr 2026 17:16:09 +0000
Message-ID: <20260410171611.2547255-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410171611.2547255-1-nick.hawkins@hpe.com>
References: <20260410171611.2547255-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yss/gYYX c=1 sm=1 tr=0 ts=69d93065 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ModqzXLkJJ0tFyq98apW:22 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8
 a=XVOEL-q19URcyAXAXPUA:9
X-Proofpoint-ORIG-GUID: Wpo8iSVfXcuG8Hiy5lP5CXnxszRhqY62
X-Proofpoint-GUID: Wpo8iSVfXcuG8Hiy5lP5CXnxszRhqY62
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE2MiBTYWx0ZWRfX57ZnCZtspLpE
 kHFQXxYBcxH4RkD3NMfd/oMPEMH6mjoXAyJNxxoBn7n4XH01CDBqEvrJ799VHR3VgD/BBSriVmS
 5FQRQHeDR3zPzWath2Q7A0aYMYlSvlOahxzhfZRVZZnuxzS7TMTWAraGoXnW/45DrNgKGSF/6jt
 1S6Zxx5WVhfsQJkcmhJbgdn6R2RSP2LnK3X8JLn5cMMC5qWDjMOnuNXlma5KXWcvzMTfgfwMDF+
 KFlGthxfeSPsL3P+tmtAIVuituSkLDGEIdJZBfSxlVWiw9XwQ03PlMHJbtMHZE7gbyJziNvpNAg
 E+jK8HItakryFh1EuUAS2X+PD/cGJxZmcbwy6kKUZyffxTyLM06OGqHlkatag6znyL2nigA4M4h
 4YmbAd/Q7Vcs++WhoKTEp9j3KwWKiqGt3xbphHzTT/+z1yj0zhWZWYB4l1+bKSI8HCr88Tuqq/J
 kkpz62lYc56qmxilzcQ==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_101634_522688_F2553DBF 
X-CRM114-Status: GOOD (  10.67  )
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

