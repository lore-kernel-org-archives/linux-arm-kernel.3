Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6918BD5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y7/mODUWIJ7WcjhYvW1iThbGnXVZthYhPasyb98rI4Y=; b=HQzIH9OGs5Og06lw5y08fGw/Yu
	007O9qcbCPWKN1HV0n5WMRteYgs0muipU+moAmJoTVWUSl/pZ+xRxchyiaIX6djPcAKwIAvjs+N/x
	m8Bq4oRly+N5ybP76mM6IbleD1vrKzvp8jSzCJ/b2IW0ppYAXSPF93oQJs7QEl8p2iLOOAu5C3Xol
	x3s55mG4+qrTAALh4FQIPFXeza1GTlzins3b/CViABnSe11q0TTt2UqYCFf+GUM5CqV4YR1EOBFhi
	7x70vcug9q6Dc9ZEgdF9m/CzaBYc1MXoifvf2VmiOrcxKCY2XMn4BZMTmbH1IpQPtvEec1ovxQVTy
	vvnRb5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGFz-00000004Iyz-1eq0;
	Mon, 15 Dec 2025 21:37:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGFy-00000004Iye-0Y0Z;
	Mon, 15 Dec 2025 21:37:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55D7860188;
	Mon, 15 Dec 2025 21:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23BAC4CEF5;
	Mon, 15 Dec 2025 21:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765834645;
	bh=wmjDBhckxO9cRIHd2f6bnvjoFkSVEjiuEsebiJDC2DE=;
	h=From:To:Cc:Subject:Date:From;
	b=goeXrmN13YhUySTuMj4Nrbvpzs8W3dpD3jVhIUfys8R4l3kkEK9v0BZy7CCNYBlBP
	 xk93RAEiKW3TycTO8GAqJbDNxlL9r50WMbS6NEbBfyBEa8Cbw0lKWEGSY46I1emFCj
	 V3qWgalKiUV2Jx2QoVu7hiOItVAyZd0QVSlCbjs/d2jknO+sJd7BVZ0vQ86Ci8P6SN
	 qRPF/Z+AIrA/ZPIte6hIJF+xX+lS4/wpPjKoHWc1dY5e9BuLFjWeyP4DTRZkc0gM20
	 HKRv/BY1UqAKr64NpTMjaLjZCzKpwO7z3dQdl+2VMJsmPHaeWl8eT9bHH2nPPsLk87
	 R3oRSkCQdk0TQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: raspberrypi,bcm2835-firmware: Add 'power' and gpio-hog nodes
Date: Mon, 15 Dec 2025 15:35:14 -0600
Message-ID: <20251215213513.3331128-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add missing child nodes for the RaspberryPi firmware. The firmware
implements a power domain provider in a 'power' node. GPIO hog nodes are
also already in use.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - The error in the hog pattern was from my own bad addition, so fix the 
   patch to add gpio hog nodes.

 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 8349c0a854d9..983ea80eaec9 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -65,6 +65,11 @@ properties:
       gpio-line-names:
         minItems: 8
 
+    patternProperties:
+      '-hog$':
+        required:
+          - gpio-hog
+
     required:
       - compatible
       - gpio-controller
@@ -87,6 +92,9 @@ properties:
       - compatible
       - "#reset-cells"
 
+  power:
+    $ref: /schemas/power/raspberrypi,bcm2835-power.yaml#
+
   pwm:
     type: object
     additionalProperties: false
-- 
2.51.0


