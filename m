Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B10BCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kq2DhKQo8ptLIXroc27s3A+iNop2714/WUHopXrdZZI=; b=chvDaYv7ZO5yAFutL9LzXHNHjL
	EtcjEjbFKEigH3VC6JU4XP16M60FqRXmkptrJ1yDuSie/qa3f95GYQ7h8H9ULesdO4OCeH/9IJHJ/
	oF7Cwa9PIx/NyC71l9Dmkx2JzboLeZtCRwCHvg67EdXfzCkGaEKSYR27x9aOQ7JJjXwdN/HRNmhYc
	77xSzEso/tC+pN7NW4vMrbBIEsLBBw7aat8vV8M5lexEy0GusPzhRgzgQJXq5wsnfsvlJsPq7RMow
	KRSvgmVilqovtWhCEmUWddXQ/BVc+ilGDCVqc8QprY84dgXqEWD83EeO1aE3w6hBG+ILoYrDee/X0
	IISycd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KGm-0000000AbL9-2ebI;
	Thu, 02 Oct 2025 14:26:56 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KGj-0000000AbKQ-29mb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Kq2DhKQo8ptLIX
	roc27s3A+iNop2714/WUHopXrdZZI=; b=cjz2K0Nr2FCoG0OMRwodk9VwnIWnPV
	P6SiLaJ++JhWSVDFXX0TfIQLalwADdM8sKBMHnqamXIbrRDgAlAbcOAbnrL2GUdz
	2MXYT8LBkIYFjdMzHsd42VzzRnozb+9mYWbbVOBFPKkhI0ei9G2Ibo7M20G4lpd8
	I7U/yY/KfDFC74m8GI8V6d9fiCi+N0iZQqeB4CrVpPd6JJXP7j8uQCIUE+5ytMu4
	QHug3hBKATPoGbbjJaekpqZ3u+z6mUBrhqJdXrMgYsGYjAaoFlcpqiFla7tT1fz9
	DBy0o2o4S1QKzktiCv3M+cOmpdloIVFzhiBifvYcT838JiIL7IthgNzw==
Received: (qmail 302230 invoked from network); 2 Oct 2025 16:26:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Oct 2025 16:26:48 +0200
X-UD-Smtp-Session: l3s3148p1@iiN+xi1AGrogAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: physmap: add 'clocks' and 'power-domains'
Date: Thu,  2 Oct 2025 16:23:11 +0200
Message-ID: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_072653_827305_B5B52616 
X-CRM114-Status: UNSURE (   9.04  )
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

Physmap supports minimal PM since commit 0bc448b49e8a017e ("mtd: maps:
physmap: Add minimal Runtime PM support"), so support it also when used
in DT configurations.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested with a Renesas Genmai board (RZ/A1). Passes 'dt_binding_check'
and 'dtbs_check'. Supersedes my original approach "[RFC PATCH 0/4] ARM:
dts: renesas: mtd-rom has no clock and power domain":

https://lore.kernel.org/r/20250930101656.33435-6-wsa+renesas@sang-engineering.com

 Documentation/devicetree/bindings/mtd/mtd-physmap.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index 1b375dee83b0..a9ec3ca002c7 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -69,6 +69,16 @@ properties:
     minItems: 1
     maxItems: 8
 
+  clocks:
+    description: |
+      Chips may need clocks to be enabled for themselves or for transparent
+      bridges.
+
+  power-domains:
+    description: |
+      Chips may need power domains to be enabled for themselves or for
+      transparent bridges.
+
   bank-width:
     description: Width (in bytes) of the bank.  Equal to the device width times
       the number of interleaved chips.
-- 
2.47.2


