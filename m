Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34ACD5E362
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+69KJK3zrl6PpqAifiS8qjg8S5oJH80PJf+IyWPC+S8=; b=l9NZZhn2C2HF7mEdtA41cNx70a
	veN7aCSXEclgJRkFgQhIq/KbRpWemzjfDqQVik3dY1WohQ27bbfibICLjqcreRblF1+045WP1OLye
	hB42ngN76QIt6ry2GpnHCVs3enimZlmraIHrW7zUVFSEBpb58WHL9iV1l2WMlicu01rQXd87C3L1T
	j2H2H7/fLyJHqGMzcBpIrAwtxPbAFkTheqlvxbBztxTUpUdEVsAeiXwdfTl0FnLikpRX4m2m5TA2T
	uZULDhT/HoQxmNkarnRyG4tHcvP9UfyHD+O9qQPqXXdIyYMFjqFFFzrSz8Euy3wLPc5+2Cp/x6+Zv
	fd1wi7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9i57-0000000D10z-13d0;
	Sat, 09 Nov 2024 09:48:37 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9i3L-0000000D0qo-2I9n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 09:46:48 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 4FF73603CF;
	Sat,  9 Nov 2024 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1731145604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+69KJK3zrl6PpqAifiS8qjg8S5oJH80PJf+IyWPC+S8=;
	b=GlB6r8CotjkQXfveXfLsZZSZtBqONyb1qwOYtpPE1to6m3N2tSGpxvi+PHqEybyZh3q020
	2EpmHJfojRfFYGAcP4FYcXzyM1B7WA3tS/fAPp3bFx3X3XohByixBOIessxnYPlQnaUWZ3
	3h2cs3YgXMB8e5eo/4MBsdPaABl4CFs=
Received: from frank-u24.. (fttx-pool-157.180.226.68.bambit.de [157.180.226.68])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 6E2C14028F;
	Sat,  9 Nov 2024 09:46:43 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/3] dt-bindings: ata: ahci-platform: add missing iommus property
Date: Sat,  9 Nov 2024 10:46:21 +0100
Message-ID: <20241109094623.37518-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241109094623.37518-1-linux@fw-web.de>
References: <20241109094623.37518-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: fc86e688-7b61-4350-916f-198d8262f45c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_014647_756821_2964C21A 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

From: Frank Wunderlich <frank-w@public-files.de>

fix dtbs_check errors in following files:

arch/arm64/boot/dts/marvell/armada-7040-db.dtb: sata@540000:
arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: sata@540000:
arch/arm64/boot/dts/marvell/armada-8040-db.dtb: sata@540000:
arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000:
arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: sata@540000:
  Unevaluated properties are not allowed ('iommus' was unexpected)

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
iommus seems to be added with
83a3545d9c37 ("arm64: dts: marvell: add SMMU support")
which seems not be documented in txt before i converted the binding.
---
 Documentation/devicetree/bindings/ata/ahci-platform.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/ahci-platform.yaml b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
index ef19468e3022..cc35cdc02840 100644
--- a/Documentation/devicetree/bindings/ata/ahci-platform.yaml
+++ b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
@@ -84,6 +84,9 @@ properties:
     minItems: 1
     maxItems: 3
 
+  iommus:
+    maxItems: 1
+
 patternProperties:
   "^sata-port@[0-9a-f]+$":
     $ref: /schemas/ata/ahci-common.yaml#/$defs/ahci-port
-- 
2.43.0


