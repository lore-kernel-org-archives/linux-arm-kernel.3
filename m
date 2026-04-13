Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC17F531C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJZo3RoHubY3+427UYcQOwBABNHb9pYAZoQ3zZiCZOc=; b=Jc8uvbSevpn2bXVLYCrU5w1UHj
	n/wSOdkeD4fy6Ftbuo7ToY6Yi3Z/MJBeoS9GUiGwMnzr7XnxEOtv1mEIHyKbTIWEtTg728+UTgemK
	Rz17DobSbcuH2oUCGFsH9dXzTOm+OVL4UyF8sRviU9N3ccUa/rwBL8HYGg8Pv0/4ViehuAcfJLScn
	8+dW2oiihA41RSLVvOz1nOBGqxjB40N5dYrSBUWETt6uy0iLw8QOKbRvyFE60BCR2/3k4NPSOJnpB
	PSKdxOcu5WXDwZvns83ritLcf+uHs0l5E4WtPvIEjtNAyNmxX8jZMcYALKm569vhWXcFw/LbVMWpW
	GJiARDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM60-0000000GDBv-1khv;
	Mon, 13 Apr 2026 18:33:16 +0000
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM5s-0000000GD8N-1tHw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:33:13 +0000
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DHWGxA3011659;
	Mon, 13 Apr 2026 18:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=qJZo3RoHubY3+
	427UYcQOwBABNHb9pYAZoQ3zZiCZOc=; b=g/SMXM4xT0Ql/FY+isIvGqi8seiva
	gfoa/P55vLoinzuOkzcbNatMnrq5tC057pXmC+vaA0KkV8iX9aVwCCEwTt8vt5RR
	aq9An1kek9bRjwIiipBkpsy6dSe1hI4G5jQFQWR1KX8aOP+nAc8zNzw+ixbnbHEQ
	pBAFcE95LpP4CYF0KdpmEv79In/fAz6lJIYu8eqsEhVnoSdKY1yRzm6O8TaYSen/
	aSc7+eBFg0zFydmOR59L5Qy42A5CTpuL+UlANYm6X9yJxvZtIf+T25lQ2iE6Iig6
	9R87UdDrmeJuw5uhz9SzAVDhIWVzhR27QmLagnRjqDLoPdPed0N/gIhSw==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4dgwmsed14-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 18:32:55 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 0F82980170D;
	Mon, 13 Apr 2026 18:32:55 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id A403C810493;
	Mon, 13 Apr 2026 18:32:54 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v6 1/4] dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
Date: Mon, 13 Apr 2026 18:32:44 +0000
Message-ID: <20260413183247.1381172-2-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413183247.1381172-1-nick.hawkins@hpe.com>
References: <20260413183247.1381172-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k69AzusR9CTYGSEEG_8ejV_lS5vsfHLF
X-Authority-Analysis: v=2.4 cv=FIMrAeos c=1 sm=1 tr=0 ts=69dd36d7 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=6_mrDcixewTG61oOsKN3:22 a=gEfo2CItAAAA:8 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=HR7gm4R6eJ7T60OizSAA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MiBTYWx0ZWRfX9EzCjgvrsPym
 CKsNv25UdVu/Nw9ueiU6aAoM3etGyaJrKkDD7qF7Q/tn7iaYUj0Nv01VFRcP/4I6Og5h8PaC9yY
 ZMsNb93TbgYzM4sd5zUF/iFyMU/3S1QjnJD1zhVtndbW48K5bP/G3aRSO7ZewKC81jSSzVlQdjP
 6OaGG15UXLwN/cas4X46qZ6t7i/k9IgYGiuXhqJ3MkRcNFBU/g3FHEX/WXLTaTo9IUFEqpiiy/0
 la9+coUECna/x6FrPEyy2BDA4HaCDV6zXTqVB1tDsiFG6WyJW+iCLG5vKDWARoRxJ3uTCruaWNZ
 sp5bLhmiuRvo9VHTCTj8U83vaG5cSqeiVOYB7ZfDrnO/7NR0UXathlfV5aKpcinJNZcobkr98Jg
 avqHFfSeMrrwLpjfwRQawzTepUU3oZMkRGIYcX5nwmQMPNX9viT5diftTn+gqwfAOrVqgymvZQC
 dDVRW3Muv5UT7BqNbfw==
X-Proofpoint-ORIG-GUID: k69AzusR9CTYGSEEG_8ejV_lS5vsfHLF
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_113310_662234_1B79EADA 
X-CRM114-Status: GOOD (  12.55  )
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

Add the HPE GSC ARM64 BMC SoC compatibles to the existing
hpe,gxp.yaml binding.

The initial board compatible is hpe,gsc-dl340gen12 for the DL340 Gen12
server platform.

Add the arm64 DTS path to the existing ARM/HPE GXP MAINTAINERS entry,
renamed to ARM/HPE GXP/GSC ARCHITECTURE.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/hpe,gxp.yaml | 7 ++++++-
 MAINTAINERS                                        | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/hpe,gxp.yaml b/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
index 224bbcb93f95..6f057cd58571 100644
--- a/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
+++ b/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/arm/hpe,gxp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: HPE BMC GXP platforms
+title: HPE BMC GXP and GSC platforms
 
 maintainers:
   - Nick Hawkins <nick.hawkins@hpe.com>
 @@ -15,6 +15,11 @@ properties:
     oneOf:
+      - description: GSC Based Boards
+        items:
+          - enum:
+              - hpe,gsc-dl340gen12
+          - const: hpe,gsc
       - description: GXP Based Boards
         items:
           - enum:
               - hpe,gxp-dl360gen10
           - const: hpe,gxp
 
 required:
   - compatible
diff --git a/MAINTAINERS b/MAINTAINERS
index 2265e2c9bfbe..80c66de5e342 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2859,7 +2859,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kristoffer/linux-hpc.git
 F:	arch/arm/mach-sa1100/include/mach/jornada720.h
 F:	arch/arm/mach-sa1100/jornada720.c
 
-ARM/HPE GXP ARCHITECTURE
+ARM/HPE GXP/GSC ARCHITECTURE
 M:	Jean-Marie Verdun <verdun@hpe.com>
 M:	Nick Hawkins <nick.hawkins@hpe.com>
 S:	Maintained
@@ -2870,6 +2870,7 @@ F:	Documentation/devicetree/bindings/spi/hpe,gxp-spifi.yaml
 F:	Documentation/devicetree/bindings/timer/hpe,gxp-timer.yaml
 F:	Documentation/hwmon/gxp-fan-ctrl.rst
 F:	arch/arm/boot/dts/hpe/
+F:	arch/arm64/boot/dts/hpe/
 F:	drivers/clocksource/timer-gxp.c
 F:	drivers/hwmon/gxp-fan-ctrl.c
 F:	drivers/i2c/busses/i2c-gxp.c
-- 
2.34.1

