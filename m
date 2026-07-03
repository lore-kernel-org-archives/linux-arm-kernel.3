Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953FFC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyxnSl+SAlk1ixTPdXrkFnr6s6HXnRifmslBmcN8Ynk=; b=jlwQk00BOSVGk5RKK2E+vaSMEu
	0EJW/HRKkBsxfhSm74yHwaY+zl6Z1Baf+/NdTQ/l3UVRg648k4ft4vWJpDnyCtVqA5w9IHaL3pMIB
	ZhQlL2dEHnY3dXd5xE54BeZ1zNXANUX21R8xguWzg2igXFO6hr4jghjPKDOYdmxpsc3Cid2TReT9l
	KRvDAfuX5KtSRNsj6ztWJetdg9PKqFO+UcwjrAoHkO8f7saOJuy/pY6dIRvAvMrEVl8l1B7OkL8Nn
	iXSkG0YtNvkZUC9pQjBADS32QPc8ouPm7ezCrp8mllQT5GBGODRf3oKQzyqeFSInhvYUBoHjl5EgN
	hbRc4Z2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff1N-00000007HkY-3vW2;
	Fri, 03 Jul 2026 14:37:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff1K-00000007Hhl-1e8m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:37:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7986C4E40C67;
	Fri,  3 Jul 2026 14:37:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F6D860300;
	Fri,  3 Jul 2026 14:37:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8892104C9567;
	Fri,  3 Jul 2026 16:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783089449; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=eyxnSl+SAlk1ixTPdXrkFnr6s6HXnRifmslBmcN8Ynk=;
	b=vUEHy3Wf3mLQQLoTxlALSzYEY9BEtJkpk5mreSUm+kbB31fVt0AN/P4rv478x7lrq9iQIR
	obLQaS/Mk92doQ7JtJ3/xPUqfDH/RRrvybmb46zlggVx++7SDe5pnW51nH2xyucyfoBbla
	Okn+l9S+3FpMX+y08yEusEUFsgoWozHbJ3prTDtUZC5sqBN/2c5+0yzdRoocc0FE92Leak
	eYKd6p+B/6FLA9+eXmDavEyIp7H2rDhRtykgR9O9gx3+ihUMFrT7OVzbMF1jP4jYxbc8Em
	VbOqpI+a58JDiTeLNqk6ia9GGzF3g54EvK1DcSDFRsmbLIC2AE/7khLdtFkY1g==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM memory region
Date: Fri,  3 Jul 2026 16:37:12 +0200
Message-ID: <20260703143717.177362-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703143717.177362-1-richard.genoud@bootlin.com>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_073734_576527_674D7766 
X-CRM114-Status: GOOD (  10.65  )
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

Declare a carveout memory region to store LPM metadata on Jacinto
devices.

For Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image. This LPM
metadata area is firewalled to be accessed only by TIFS.

U-Boot R5 SPL/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image (which has been copied in memory at boot time by U-Boot
R5-SPL)

At resume, U-Boot R5 SPL is executed and detects that the board is
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml   | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 14e6b2f817b3..af2acd429974 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -155,9 +155,10 @@ patternProperties:
         description: |
           phandle to the reserved memory nodes to be associated with the
           remoteproc device. There should be two reserved memory nodes defined
-          for the basic layout or 6 partitions for a detailed layout. The
-          reserved memory nodes should be carveout nodes, and should be defined
-          with a "no-map" property as per the bindings in
+          for the basic layout, three for the Jacinto layout or 6 partitions
+          for a detailed layout. The reserved memory nodes should be carveout
+          nodes, and should be defined with a "no-map" property as per the
+          bindings in
           Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
         oneOf:
           - description: Basic layout
@@ -174,6 +175,12 @@ patternProperties:
               - description: LPM metadata
               - description: LPM FS context data and reserved sections
               - description: DM RM/PM trace and firmware code/data
+          - description: Jacinto layout
+            items:
+              - description: region used for dynamic DMA allocations like vrings and
+                             vring buffers
+              - description: region reserved for firmware image sections
+              - description: LPM metadata
 
       memory-region-names:
         description: |
@@ -192,6 +199,11 @@ patternProperties:
               - const: lpm-metadata
               - const: lpm-context
               - const: dm-firmware
+          - description: Jacinto layout
+            items:
+              - const: dma
+              - const: firmware
+              - const: lpm-metadata
 
 # Optional properties:
 # --------------------
-- 
2.47.3


