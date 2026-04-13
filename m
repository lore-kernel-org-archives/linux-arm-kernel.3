Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79498F531C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXA44oQsFEQ9J7VmBPmiBuOSaGoyF6XluUzLaeSYqaQ=; b=vglkOvvJjI8KF0fpPaanm71+3m
	fD3mJi+dFzPuwYLMWKohhfVzxawc77DM6y26IUTUA2k0HhkP38ug/QK2ehQoQ1WljCR48yOfQvXgr
	ZA1Nsk6YrDUaq6mf97cweCQiA3ZE1aK0p8eibn0YNUWt3lf1yCVtlsE2WdRFKuQkqYyfVJaakxaOq
	8yL0JsxK36ecVA2WeGgaI28Bx0+EsQR9fviVK0Ix2/7Ah0esG195/as3igjNQpVYApcahDMT0rqCe
	3tSVF/1d7fi6B+RK+Ck7wH2es7dJn2AONHlwIUk2CN0c9z1dRPdItjCIbk4AzBD6j2XkuGcXfX1Sa
	5Al3rMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM5x-0000000GDAB-2Hov;
	Mon, 13 Apr 2026 18:33:13 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM5s-0000000GD8L-2vqx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:33:11 +0000
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DHVExd2409792;
	Mon, 13 Apr 2026 18:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=xXA44oQsFEQ9J
	7VmBPmiBuOSaGoyF6XluUzLaeSYqaQ=; b=i2vWh+mlH+SmyPy5lJIwaUQHJLVuN
	AfZWvSrauH1YHu9j+JEJzqIfJnDNzElxmFEn3bGW9MdoqtSSzRzPHj9hxlfqXgqO
	d85CCVNzLCtOTAz2pD3f5bC1L5+pj/aeRkYlKkyG1critEp4ndG5UiEPdXvFz8Hc
	bhOzO05jG0W66rTirYFa3YIhJq23N2yFbzZuHGOURJhp13qbxC/bUi9e/+cWbowJ
	WkJ5HSq7wXA1CfZzThphgTtNOy1idgO9Iu+uTkmtYmzEntVF3Mepy1M51kkAq2eo
	5i2nebAbdnRq84cmIh11iKPrAyCrngOpdaR73ewBjHMNDH216/hcrwZbw==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dgxrm5jra-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 18:32:57 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 80925882;
	Mon, 13 Apr 2026 18:32:56 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 157D2810AC9;
	Mon, 13 Apr 2026 18:32:56 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v6 2/4] arm64: Kconfig: Add ARCH_HPE platform
Date: Mon, 13 Apr 2026 18:32:45 +0000
Message-ID: <20260413183247.1381172-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413183247.1381172-1-nick.hawkins@hpe.com>
References: <20260413183247.1381172-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L84theT8 c=1 sm=1 tr=0 ts=69dd36d9 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=k7r4yCLl9DVLXMiQTbtC:22 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8
 a=XVOEL-q19URcyAXAXPUA:9
X-Proofpoint-ORIG-GUID: 8hl6sD2jf0MWx2s1_H0cBOLFiMX3QXeU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MiBTYWx0ZWRfXymUM4RYFK3AN
 WT6absihtKSbpo2Y9PfFXQlboshC5nud0uZWuiKaznFa2kcEaUUgjOf3+TaKzhh0hKVQAq0N/BC
 ogWSTGMGJKwUpcS9/RapjeT7jeTG+keNkeMIOZF1KdxHWqhTDU6TWInwmoOk9yEGLuL0W49l+NR
 PEumO2VFV2sfHBk5/GtFFkCbUsVwyaDrtwxWB0Jdw+bhpO8shjXtRjFduPhU3/JFIkOYzTzfLKC
 xHe+xOleisPY4PmU0ldmd78tRkpBVoE9ZeHndS8bEEy9PJXcIrF4KsXDqbRuZA9+98cNu6jYsF7
 H0EPobXPlrYi7pc0SCj9ar+jks3UKDjvztcb4lYmOKfTpdfRLwrbdGExDmEcGJ/xTTIfQUsdlhL
 PCD9x2ZeZAqRLPnjeWYq4FpJZYnSXYtB/v5S+MMzv8kKUJLgmJBbfpMuG+XeT42d8OS5Srde5xB
 fdMfIq5QFHg/HrzsjEw==
X-Proofpoint-GUID: 8hl6sD2jf0MWx2s1_H0cBOLFiMX3QXeU
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_113310_662239_4F466EE3 
X-CRM114-Status: GOOD (  11.05  )
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

