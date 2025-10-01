Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26467CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 18:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fgVlcA+DfUuWLJkx+j1EmW8GfxvIBjsFuzmRR5gkxeA=; b=lEaZFzXm5bnToNJIbpbuOMKj14
	RKp4nn079e40AHKmXRIG6sfOmntxdZZQnG5Z8/MG7ehIM01rjXVulttYF/6/pibXUW5K96xHMlw1j
	k1dqWxRjhSm3UfjlODKDf7mcoFrtFLBh/Jc8ujhOo8CW39bHSbHZwTEDSXfpQGTFkZDx4lXF3sVOJ
	JXQQtvjXpNoKBkasoRb41cpU5imrEmTzlsbRIoUfK9C8RHVMQLXLVgKYxeLxhqwhHvJTnde3Zm2KE
	MhvtaOME79SbiLX3bsdH9I1C35IjCNjGYowMy0J4n+5r+hQGQoWS/Ft1Wxm5C4X2Xfd2We4FU1Zsf
	hXAiqvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41c1-00000008khA-33z4;
	Wed, 01 Oct 2025 18:31:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41bz-00000008kgy-2uAz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 18:31:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF80A61F15;
	Wed,  1 Oct 2025 18:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20CEFC4CEF1;
	Wed,  1 Oct 2025 18:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759343494;
	bh=Dk4SYITbrE5C3jBQ0rRmH1my75LpjgKREbgHSO0H9BU=;
	h=From:To:Cc:Subject:Date:From;
	b=B3ULQYPPrKB+zytHQTmAzDsVbcijmXu55ePTyqiaykUlEwh3Z7RkKzLcPOVPoZWlk
	 EBuPJ/vAig0NC9Wml8/cbfTqRRujqdJQ4AQL+/LxjeTNs2EWp5nPj77NMulrlYsOA5
	 eBbH9rl9FzhF+noFh8KR/RWHRDue1XpUXtOmAHPRmsAzZfIn9OUbfijvNh65+8EmiI
	 I1ZJmrej4soKRyZZ+g0VG9Rff6XPMj5dR742TIPqZEgqW1tfib8wUAPOjU/QILxNPJ
	 sxCCDumRWpk2MaPm21aDQdTUqtznSzqPxOrLdXkcjGvb0Mru3uJSD4tO40fyqa8CqN
	 XfDsdiXpMSLYg==
From: Conor Dooley <conor@kernel.org>
To: linux-spi@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jun Guo <Jun.Guo@cixtech.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/2] spi: dt-bindings: cadence: add soc-specific compatible strings for zynqmp and versal-net
Date: Wed,  1 Oct 2025 19:31:12 +0100
Message-ID: <20251001-basics-grafting-a1a214ef65ac@spud>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1SEoBl3IkinUMLRK+FNSvbKHIkHI8aGP3E2c2HCbUXE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBl3iyuEJ/2tqjwefr1vrX7loe6Jn/18eTrijgoeO5LwJ EFe/xlXRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbSYMXw37vG+tQNuVObtj65 mr9d+2bQ1Kx7k2LX710oEtb2P/NySC0jw9Zv6wquh9d2MEgUmxk+2nR1sazM/1bR7ZGz70ypsfZ 4yA0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

When the binding for the Cadence spi controller was written, a dedicated
compatible was added for the zynq device. Later when zynqmp and
versal-net, which also use this spi controller IP, were added they did
not receive soc-specific compatibles. Add them now, with a fallback to
the existing compatible for the r1p6 version of the IP so that there
will be no functional change. Retain the r1p6 in the string, to match
what was done for zynq.

Disallow the cdns,spi-r1p6 compatible in isolation to "encourage" people
to actually add soc-specific compatible strings in the future.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Jun Guo <Jun.Guo@cixtech.com>
CC: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Michal Simek <michal.simek@amd.com>
CC: linux-spi@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
---
 .../devicetree/bindings/spi/spi-cadence.yaml          | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-cadence.yaml b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
index 8de96abe9da1..27414b78d61d 100644
--- a/Documentation/devicetree/bindings/spi/spi-cadence.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - cdns,spi-r1p6
-      - xlnx,zynq-spi-r1p6
+    oneOf:
+      - enum:
+          - xlnx,zynq-spi-r1p6
+      - items:
+          - enum:
+              - xlnx,zynqmp-spi-r1p6
+              - xlnx,versal-net-spi-r1p6
+          - const: cdns,spi-r1p6
 
   reg:
     maxItems: 1
-- 
2.47.3


