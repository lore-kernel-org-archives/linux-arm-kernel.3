Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADBAF531C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vx4SoO1veOTgAl5kc7rmMtx8QOzy8eO04ZxK9Zwyi0A=; b=iPYOM3ElXeW1OclOCyLzLmLmsA
	1gseTEyApIisktAcN504fK0aL3aOJRAiC+3CacPuOyKXs54GDw+XYoE/FQ6y2cMH4FmUT8UZ10aVR
	gJ+9Hys/VkXpR35kLMjqeY+aulFzPmQjpheWnYnmIsIvK1fx2JmneiZAbmREnt20MwZo5kK39rbsO
	VQxk5frLIqV5y/lPVhMYtvAfQBbNqJruNctqV9EYymBlKdTReP1hp/ShAlTO42Ot3C8HUP6a1Rv75
	cF4YY2lVpqJccrEWdD7WztX5BalHP2AGSCicEbZcIkmPzc+hBTwJ3Poex3h7O2l6uXlu9WDx5k7hO
	j4T14rnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM5z-0000000GDAt-3UNS;
	Mon, 13 Apr 2026 18:33:15 +0000
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM5s-0000000GD8M-1pSE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:33:12 +0000
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DHaw2w2904837;
	Mon, 13 Apr 2026 18:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=vx4SoO1veOTgA
	l5kc7rmMtx8QOzy8eO04ZxK9Zwyi0A=; b=QPEKKRi3j5NzTXYgfmIu2hOKxxi0d
	fiqNN1VnjGp9GXhMC4A2vf39euoDDanP/W/YevrAl4g/uyo+qadyV8aWwoNmzsNU
	NWsAtvyw+Oniiht1CnScrxZbRwSKizNPqrl8j1UJ2aAFQ0zVyvwjnLLLtNSyXu5J
	3CGTvUq4Cz8b8UEJA8ECbMXFVcfjF6eEhCtDA7XfGZjhKfnumCl2yFLQ8gULiSiA
	VZqkO/ZNjwyOD3zaGxDbKtQOzUmLx6CcYfN248b2l9BD5FmOuTvJSqg59ecd2yN+
	+qOHW1NHZ4+QPah0pwX17k9KNn5U44MCCWO7uNu+C8AVkEf15DzhOUKJQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dh51x0jgb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 18:33:02 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 60AE789A;
	Mon, 13 Apr 2026 18:32:59 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 181D08104A2;
	Mon, 13 Apr 2026 18:32:59 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v6 4/4] arm64: defconfig: Enable ARCH_HPE
Date: Mon, 13 Apr 2026 18:32:47 +0000
Message-ID: <20260413183247.1381172-5-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413183247.1381172-1-nick.hawkins@hpe.com>
References: <20260413183247.1381172-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ks59H2WN c=1 sm=1 tr=0 ts=69dd36de cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=RtSn8ETxjE2H05FtM2s8:22 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8
 a=eJgTY4hZ_eZb3zzOyW4A:9
X-Proofpoint-ORIG-GUID: xl2cr-xhRq8b39bY2fylX4qKVJL4q2zN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MiBTYWx0ZWRfX6otUxZ2yas/s
 0wFTcmPxziHYTpQLzdCanz3OMvlqKjfsEA+s/nqVcmCSkXF9wKwgCBL8WBxnvsK6MnTcSOL5nmh
 sjrNYIWNXemT7fJkiUMqMOMtvT47oUH3HeeKPBtdp1Ty0NqERiwBhCG03uf3OejJ1TkRn5Z+Khm
 NPbxSimaB5Mf6jjklcgVhM+m9AYRojecUozecfxyFOC6dqkq1iFNxdo4qcmia/V/6CxirOnLcGk
 n3NwmamM9Ly2cKBoqc1/tKSf2wdWB7l40g/445IlRlv4ycgmjyR8WLONCAqnZS4IFN4HR+VAGFX
 KBnsroOIezFrjfUZxgFJnIqOy0N6j0H8mOXqbJBguqNelNbBy/rHCEV7fVr8hYwUKplw+72zBF1
 s2TDGI9ijl+X7uidl9wxLDnXK0cHdgKUXfDYVJnrQpGinkJDseScJgc0tjI5ipqHTeSg5Ve+/PM
 t1zJ1PEANxbcMSWx/CQ==
X-Proofpoint-GUID: xl2cr-xhRq8b39bY2fylX4qKVJL4q2zN
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_113310_665924_266BAC45 
X-CRM114-Status: GOOD (  10.06  )
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

Enable ARCH_HPE in the arm64 defconfig to include HPE GSC BMC SoC
support in the default build.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index xxxxxxxxxxxxxxx..xxxxxxxxxxxxxxx 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -xx,6 +xx,7 @@
 CONFIG_ARCH_HISI=y
+CONFIG_ARCH_HPE=y
 CONFIG_ARCH_KEEMBAY=y
-- 
2.34.1

