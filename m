Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF0FF46C46
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVvetUKfbKanda7iTmNLNxsu399aKGN3SJr87vcZJHE=; b=QyzE6hdsn+zs0YFeGaJm9FSj8I
	7Ow662IBmgsAtdQld/hXrkwSMR9ffZCNkzhkgHKUwNMaGiijEx7DDIL/LAqy0ux9KjJhG2+sFQe3q
	Yf1T0qC3o8ihLePWVRIViYdfqGkUwcC04kE7avK5uEL65vSSu9nEt1tnDYIu34HAaRLhSlZ1HOwqS
	tdCJx7haccoCHcn9HNgC2W6OdAsAGGj+YWtjfhzglgoBHmIK5sdGr+efTW3qao/FedCWf2uumhDo4
	KE9BQfgKediMaxirmKfZdimQsT3eVu6uFd4EMfKHkY0kcaU0GIh3/epnwrwJVMN5gUAPq6uURPitx
	W1EE3GoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9l6v-00000005Cx7-2APC;
	Mon, 06 Apr 2026 14:39:29 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9l6s-00000005Cw4-12Xa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 14:39:28 +0000
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636B2Zrl1225307;
	Mon, 6 Apr 2026 14:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=hVvetUKfbKand
	a7iTmNLNxsu399aKGN3SJr87vcZJHE=; b=nA9klHRgFmVrnYoX78PwPHBWPoDJQ
	mTIRAxzdvy5mBepXzlXzK9ApGehAmJZ2yYlrqZAUGHpe5YIp/ucAV2K/JwdOf1ju
	C8DFZ974QCX3HLdxgRuR39x10pHTuBbZS0t/E3A+oC4wl/7FfyDE6N95/p7yPZxR
	MRtP2XpNjiBtvexlPootkfXhwHhWZvTQbJcBA+JBs1WXM5rw8LeFxRovkX7UGqtL
	aX1qp9GRDIhtDGcxgZ+Nv5aAouGZv5kQVazVWgaeULEPntV9oOXOZPc+UiszljMD
	qPt1ERNyQlFV0+p0imDs1/yzfR7csJWqdeFWUjJs37QUsipF1aFTaLWcQ==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dcb4a2fsy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Apr 2026 14:39:17 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 96BB6D1FC;
	Mon,  6 Apr 2026 14:39:14 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.39])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id ECC14808993;
	Mon,  6 Apr 2026 14:39:13 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nick.hawkins@hpe.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
Date: Mon,  6 Apr 2026 14:38:18 +0000
Message-ID: <20260406143821.1843621-2-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406143821.1843621-1-nick.hawkins@hpe.com>
References: <20260406143821.1843621-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: odzm7hlbEiOccwSunuZCNXnqKnH2kh8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE0NCBTYWx0ZWRfXw2bf31Me82zS
 2DAcKCwdKrpWGxheARr6oBJ8j30uvKSdCKrlqPFTtWJzuRuchMljZ/nYEq/eBu3SM+hZMHr8yd1
 +Xa7bv3TNmx9ATZfdUpFt2Q4D7PAAR4Eoq25C9iQOgIE4+h56jzQHIzSPdLmdABCxN+ebu/zBid
 vBU6hcC/iNa9pg9md/QE5zbkzH5J8q1BuCsBP8++1lhb2tE/VKlphqtElPeMweMaGQ5JYcGLb4L
 s6Z19aEIUto9H45841RCJQqZtN1i2zYE/4OCtdCS8/7NjC1/txcgzQcA8EBxpfcswoGjELoVJWN
 6ToBaQPUY2WwS3IdFvuwNb1qMnr+AIy3D5YynAzL0MNay8FOXb9HaIDMxKQ9t/0U+P5tOmTWtL1
 nvybLNcWjt5xLTHkkahDYfBR03pECaktBI5q1w79K4025a85oXh3w2eOYIqOFMFwpm1MbdVUqHM
 iNwSwHln2EK20cq245Q==
X-Authority-Analysis: v=2.4 cv=Cquys34D c=1 sm=1 tr=0 ts=69d3c595 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=k7r4yCLl9DVLXMiQTbtC:22 a=gEfo2CItAAAA:8 a=MvuuwTCpAAAA:8 a=VwQbUJbxAAAA:8
 a=HR7gm4R6eJ7T60OizSAA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: odzm7hlbEiOccwSunuZCNXnqKnH2kh8d
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_073926_403845_2CCED759 
X-CRM114-Status: GOOD (  12.77  )
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

Add the HPE GSC ARM64 BMC SoC compatibles to the existing
hpe,gxp.yaml binding.

The initial board compatible is hpe,gsc-dl340gen12 for the DL340 Gen12
server platform.

Add the arm64 DTS path to the existing ARM/HPE GXP MAINTAINERS entry,
renamed to ARM/HPE GXP/GSC ARCHITECTURE.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
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

