Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD336D6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yD0K3OTadJJd6t4hzFzNdpV2SBHdW94fnjzmwjH3hgg=; b=VBm+OnazJ40+W2U1aMxV2NrSo5
	SLMr6vMWMbqOWtDPaIEtFN3RB5DY4M1S1JuCPtnWZBV2hmtcRVfRXN3VRhf2HE1WO6G+iG+bF8EKX
	h4cK9pJcO0z+tr+/svPJyRdQBeZGdo6wzj3EoGLig6yJuamHzynF3L8S4BKGmVw7pIvU5YzcXsce3
	NEO8w70v8Atv6YKkKo4Gqjlm9+AbsFCdf4Y/Wdk8390k5g96JSEQ62Wn28DQUfn/ML0r2zzUUZtE7
	VCIMrI2ZAGiD6wmGslpSkWUWKs26bw6LXIJOJtieYKrifDx0/rirKm7qpkHJXLRhXXd8OGNJYun0P
	C4qb+H8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJL1-000000092yg-2nI3;
	Thu, 18 Dec 2025 19:06:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJKn-000000092ms-1XE2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:06:47 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so1120191a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 11:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766084803; x=1766689603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yD0K3OTadJJd6t4hzFzNdpV2SBHdW94fnjzmwjH3hgg=;
        b=MglULdZy958gJg98d1qf4sPTWJ/cJlJAP9iNH2gzKBLZYHgIariQfISYZ59qWBgbFO
         DGk4y3JaCZB+VYrjmsOFa4Era8oA1ZKxdQUU9MfqQNgKHY2JuxvzqgvVKTyGIkkP4V0r
         WvRZ7PJOjuSI7cxexWsibPyettQ8uztjjwyIRtPeJcYwwtVbNn6muYprtUnWjDsuAMKJ
         fkGBwTalhKLZmdQ5P5UhjEPQ56GoQCNaULNbLIW/GDsQ4V+5XS7pPhxLSfPeMrQcxmVU
         4d7+LPpBvMF5LYKdKKu3kGyARjzXWH89cf7m6r7l3p3QoYVjzGagzCqdKsjkvW1cJI7P
         icJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084803; x=1766689603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yD0K3OTadJJd6t4hzFzNdpV2SBHdW94fnjzmwjH3hgg=;
        b=COXKgC0/npWtE8gDY+1RgOd8MTpA54fGgaQyXuZpmPdQ2eA8kiAALnjbum8IgUYVt4
         iEdvIPybqyOXxizj01Te/MkmhklwaCvpAsZPu/9SP4rtHygsMehc5H6NwRwzSX/+iFhn
         kPzBxYOVr5AptA7khFkjvP+qH1fyPkNT9hyNUZflf0tdiS3jV1NarJLbqTo9mAkqY9SS
         RUjhqvMre/peZTw0NCf505m14Wi06/kcUVqiX//i89Ml7qgVO0PSaky4/ZeK8f6D8nwa
         ZVzqN8l5w/QHXgTmnqDuUWt339xN4tZahXg+ZEjqG9Z6US2YyoLKQDHXyWi0cwr+BeTB
         5jJg==
X-Forwarded-Encrypted: i=1; AJvYcCWeFayktNAMuJMeCEbceuHlk/Rptj303GlHwNZc4Z9clbiY8xn1lqrG7oBLg9epWwUz09wmtlA4+BWKI6sHNrme@lists.infradead.org
X-Gm-Message-State: AOJu0YwAo1tXXDJxBIyneORp7iFcOQWC54E3pLUM/u6940m5CRwNzlXL
	IqHecQhqNzkNebvSAuXdoM3xZj4Kt5VG/632QRUAv+f9+WExmhLgWHWHta4WCTioiFmpTFmQ1UY
	Ocs6Z
X-Gm-Gg: AY/fxX42pHIQlZsrYTONSGQwk6+H8v7HfjHSMiw5khQC9Fzf/lFxkG7KBFwaYEPt8t5
	/rbM2/xf0TSqaB1W+jgFA6DZQqfUUPHNEdPdANlxlcx1nC6Uh8IXS2lCdHR7JQusqWDyREGCyO5
	7dC2OUdIN0cVrRCVbOVvvVop2SLJY5mLj2bp6VLf61g2/cwWlbWQ1+X5pa8BQkn+4jxMPderXR3
	eB8osKpQJ/agGhjtGml1oyeExRCJPa4Wa3CEk9MyA2a3XIL+zukfs3VC2V8ncuuRWtPlge5r0pK
	lICKwMSA+Mh3bX0bkbyyXFqVUes5WaIpT3yy4Epu2FNj7opQXtvHNJKKi+r5rIab7QnvQMK8FSA
	jmm7dzbu9o6pzPJFOg6ieiweKdJma3/prDLaH7PGUnE/rNbnYAniYIP34wP6uMgEnnN/hAkH3Ug
	pJ/KeHaXVga6ffYvF9OA8U/ogzIUTuM3xzo6tHipyHY4EGn17UJADgWQ==
X-Google-Smtp-Source: AGHT+IGMlzVyG7sXrFNsNeLNed/uMM7+wZEL1Cu2Qp1hC2aPgnk5qKL9w/gcFZDVh1e21Hfc/SdNQQ==
X-Received: by 2002:a17:907:868e:b0:b7a:1be1:86e6 with SMTP id a640c23a62f3a-b8037224ea0mr39939966b.62.1766084803242;
        Thu, 18 Dec 2025 11:06:43 -0800 (PST)
Received: from localhost (host-79-37-15-246.retail.telecomitalia.it. [79.37.15.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5c4dfsm18931166b.14.2025.12.18.11.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 11:06:42 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH 3/4] arm64: dts: broadcom: bcm2712: fix RP1 endpoint PCI topology
Date: Thu, 18 Dec 2025 20:09:08 +0100
Message-ID: <827b12ba48bb47bc77a0f5e5617aea961c8bc6b5.1766077285.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1766077285.git.andrea.porta@suse.com>
References: <cover.1766077285.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_110645_435360_E8183805 
X-CRM114-Status: GOOD (  21.81  )
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

The node describing the RP1 endpoint currently uses a specific name
('rp1_nexus') that does not correctly reflect the PCI topology.

Update the DT with the correct topology and use generic node names.

Additionally, since the driver dropped overlay support in favor of a
fully described DT, rename '...-ovl-rp1.dts' to '...-base.dtsi' for
inclusion in the board DTB, as it is no longer compiled as a
standalone DTB.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
The DTC compiler produces the following warning:

WARNING: DT compatible string vendor "pci1de4" appears un-documented -- check ./Documentation/devicetree/bindings/vendor-prefixes.yaml
#91: FILE: arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:31:
                        compatible = "pci1de4,1";

I'm not sure wheter I should add that compatible to vendor-prefixes.yaml
or change the compatible to something already recognized as a vendor,
such as 'raspberrypi,pci1de4,1'.
I'd prefer the former to be consistent to what would be filled by enabling
CONFIG_PCI_DYNAMIC_OF_NODES. Any hint will be really appreciated.
---
 arch/arm64/boot/dts/broadcom/Makefile         |  1 -
 ...-ovl-rp1.dts => bcm2712-rpi-5-b-base.dtsi} |  0
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 39 ++++++++++++-------
 3 files changed, 26 insertions(+), 14 deletions(-)
 rename arch/arm64/boot/dts/broadcom/{bcm2712-rpi-5-b-ovl-rp1.dts => bcm2712-rpi-5-b-base.dtsi} (100%)

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 83d45afc6588e..d43901404c955 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -7,7 +7,6 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
 			      bcm2712-rpi-5-b.dtb \
-			      bcm2712-rpi-5-b-ovl-rp1.dtb \
 			      bcm2712-d-rpi-5-b.dtb \
 			      bcm2837-rpi-2-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
rename to arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 3e0319fdb93f7..2856082814462 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -1,22 +1,16 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
- * bcm2712-rpi-5-b-ovl-rp1.dts is the overlay-ready DT which will make
- * the RP1 driver to load the RP1 dtb overlay at runtime, while
- * bcm2712-rpi-5-b.dts (this file) is the fully defined one (i.e. it
- * already contains RP1 node, so no overlay is loaded nor needed).
- * This file is intended to host the override nodes for the RP1 peripherals,
- * e.g. to declare the phy of the ethernet interface or the custom pin setup
- * for several RP1 peripherals.
- * This in turn is due to the fact that there's no current generic
- * infrastructure to reference nodes (i.e. the nodes in rp1-common.dtsi) that
- * are not yet defined in the DT since they are loaded at runtime via overlay.
+ * As a loose attempt to separate RP1 customizations from SoC peripherals
+ * definitioni, this file is intended to host the override nodes for the RP1
+ * peripherals, e.g. to declare the phy of the ethernet interface or custom
+ * pin setup.
  * All other nodes that do not have anything to do with RP1 should be added
- * to the included bcm2712-rpi-5-b-ovl-rp1.dts instead.
+ * to the included bcm2712-rpi-5-b-base.dtsi instead.
  */
 
 /dts-v1/;
 
-#include "bcm2712-rpi-5-b-ovl-rp1.dts"
+#include "bcm2712-rpi-5-b-base.dtsi"
 
 / {
 	aliases {
@@ -25,7 +19,26 @@ aliases {
 };
 
 &pcie2 {
-	#include "rp1-nexus.dtsi"
+	pci@0,0 {
+		reg = <0x0 0x0 0x0 0x0 0x0>;
+		ranges;
+		bus-range = <0 1>;
+		device_type = "pci";
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		dev@0,0 {
+			compatible = "pci1de4,1";
+			reg = <0x10000 0x0 0x0 0x0 0x0>;
+			ranges = <0x1 0x0 0x0 0x82010000 0x0 0x0 0x0 0x400000>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			#include "rp1-common.dtsi"
+		};
+	};
 };
 
 &rp1_eth {
-- 
2.35.3


