Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10B8F45A0A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 17:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJZo3RoHubY3+427UYcQOwBABNHb9pYAZoQ3zZiCZOc=; b=Fnvl5EB68g+hp3aMso3mJbw5hi
	yUcfjP4ig0YfakA69kWO7NjpxdWTtZfh5POkDWo7+01Xp+c3nqKz+1LYagJlVEvrZf0ma690CQ2Af
	7PO7LAFWuh1TshYavpCuzFc2LP5wObrNvH3jX8qk5bewGIUxRdBZBNt7HJc2jGKO05QKWkd6S1Jj1
	cKseOSorDMURhvPkaGjxTfJvI3qquah2ZyH+tMcXExNs0B1Y48HPqcQS7Fr8CadMnW9R7SPwNHPeZ
	l/SINwQDe2+ETKyLV0bQl1KRFPQ+GjW8lqElwwTjtBflFdVmyawdyigfml1b5zS8M6Z2NHlonpshg
	tN30xlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFTB-0000000Cbdc-3uRb;
	Fri, 10 Apr 2026 17:16:37 +0000
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFT6-0000000CbbG-1zjj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 17:16:36 +0000
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AGX9Ij1533795;
	Fri, 10 Apr 2026 17:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=qJZo3RoHubY3+
	427UYcQOwBABNHb9pYAZoQ3zZiCZOc=; b=gtatrXk/XfoJcmnv3g1WIJ1K1DX/y
	UpHlmMJADZ7QhZOPpNCBcZ52zcfGUk/02VXxPj91Q5hRh/GAxLwTZj/7P8uBk3io
	3d+hOwLzFwwZ/GTRN1adX8AZkwcfxcyRhxaHNXK1lpAj6H1hzgJgbiIaNU4nZFef
	5ALwOC3w5jlFZbUL3CNpFQx5YwdW9gmx9wtDs61OM6PNOEXmzubVEnF0UOzjEVw8
	3EbpEZw07Vh4mZGrMPeEO++NepJroTEsg7tuR+E3gUc7cIbxeNS557IFlq6qlSRb
	NJevFeKZ3YaLsWHUPGW1OsAQICus8jcfbKrRAIF3ZYfXZgRDj63ndEF/Q==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4df1bgb2nx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 17:16:19 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 42761801711;
	Fri, 10 Apr 2026 17:16:19 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id B9B808048E6;
	Fri, 10 Apr 2026 17:16:18 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v5 1/4] dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
Date: Fri, 10 Apr 2026 17:16:08 +0000
Message-ID: <20260410171611.2547255-2-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410171611.2547255-1-nick.hawkins@hpe.com>
References: <20260410171611.2547255-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE2MiBTYWx0ZWRfX+zk7neMpzx2z
 5U8t7YcD+YpDQ1zLnG9U8smcZE9qNDBg3Cr2smg3XiXCNXm0Yq+mAbfT7XVi/EwKpaDhLqGYL4l
 4/PR+kh3QBmmI6v6yLCsmdXOMAJyAg7Omknvz9YHCNXalCL0lhtBmAQ7bASurF3rBFnK+Ob9KkI
 JejwjgUHdAMC9PEBl/8o0qoJOIkMnCjovo45TJ6XRwOv9mMA0TEYHj7apwcSetwMYVsRRvVU0d4
 eU+fWOr+jK/EPDCMaVBRiczvL6uO8GkhnNXZ0XMYHDT+YUw+fIECc6LA9CJiwY8OpJFcnnfDWZA
 pKDxzpNOB6GEUsEjGRq5r+CjzV9AwC4omwSnbMqh/+TmsSJ/6bQTj7Y5nLWIAh+3+sukZ9wr5lY
 Wz+IR2XiIjwcRs0X8nsohK5rsEDdK6rh4VGUp29dGYExDu7/Mh1gaf7x4msKxFKmWrBX0vn2j4+
 Mwd2/7omNOD+DoMMLCw==
X-Proofpoint-ORIG-GUID: noib7IsZsqhMZajekWYKKjvRYlfoMTTM
X-Proofpoint-GUID: noib7IsZsqhMZajekWYKKjvRYlfoMTTM
X-Authority-Analysis: v=2.4 cv=At7eGu9P c=1 sm=1 tr=0 ts=69d93063 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=RtSn8ETxjE2H05FtM2s8:22 a=gEfo2CItAAAA:8 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=HR7gm4R6eJ7T60OizSAA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_101633_203222_8087AAA6 
X-CRM114-Status: GOOD (  12.29  )
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

