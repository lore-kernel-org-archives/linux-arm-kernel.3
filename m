Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269BCCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=668tN/r2sYEV2dclmY+UlmPJ9GaHeFfzvPli8gfAk68=; b=KKcqYFc5VebSy3vAyovFmlnEHp
	3aCVT+XhaDMFYr4LJT5lOmfXc1kcEoWWeCRUZMrVa7LvfXWI94SeEOtEfK76jNGtmYzsemEC6twDU
	HLvpEwD8CFUQMeTqxlk39dRAvF7UEIE5Jf7oncpenwR8j7MyW/yRqWUcb9+eNFWM9uW3d1b779cMe
	kfrLeEHIApfthk+4ZJBxHOmx5P4h1AsztdpvDHZ1PRI7/ZVNybiMw7ieXWi0LySLJc6OI06Kgt0Uc
	9VncuIYsnZRYXlLRNpPU1o41yk8O6GsNgVWJddgJj0ng+vCtP6hZw3KOjMC9yveuXRru48ZoJzCSQ
	57D28VTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAj6T-0000000BzLo-0RZV;
	Mon, 20 Oct 2025 06:10:45 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAj6L-0000000BzG6-3lhL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 06:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=668tN/r2sYEV2dclmY+UlmPJ9GaHeFfzvPli8gfAk68=; b=CHSmqV
	IpmdTBm4jaalCqch73ilElfVg1Qz17FauQ5L0jpIJa75U8alYSkbt5wIIlyTrACj
	RmEnP7SdJNGJpLtVxOHVNJGIyt3ArcdaPYDR7or9Nt8AtXYTWQ4cLuEtTaeeYF6a
	eayDSN69vVG/s1mOi0PhUdoS/xbiE0r4148b/+/jjU1R3IoFlbE3qsMJZpMREBu5
	s/6+f3HE/SkKysFECGiQKRCgCNq4qlIeNS10j85hxObdzsLuUH/T740IF00pmv8S
	/my68GZYEqkI+/5KKbltSExMzw5T/aDzBDsLK5X/Vi3vtHMwj3iBxZtQ3Q4kVZzT
	Rl0s9cVsl7wTgQeg==
Received: (qmail 941026 invoked from network); 20 Oct 2025 08:10:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Oct 2025 08:10:26 +0200
X-UD-Smtp-Session: l3s3148p1@zSeC8JBBJIggAwDNf0fPAEuMhp6AgTGK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: devicetree@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>,
	Liu Ying <victor.liu@nxp.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/4] dt-bindings: bus: don't check node names
Date: Mon, 20 Oct 2025 08:09:50 +0200
Message-ID: <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_231038_781187_1CE7F834 
X-CRM114-Status: GOOD (  10.25  )
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

Node names are already and properly checked by the core schema. No need
to do it again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
I'd suggest to give subsystems some time to pick this patch before
Rob applies it?

 .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-
 .../devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml | 2 +-
 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml       | 2 +-
 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
index 24c939f59091..cd5c2a532a92 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
@@ -43,7 +43,7 @@ properties:
     maximum: 20000000
 
 patternProperties:
-  "^.*@[0-9a-fA-F]+$":
+  "@[0-9a-f]+$":
     type: object
     additionalProperties: true
     properties:
diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
index 4adbb7afa889..6645352c7f6b 100644
--- a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
@@ -70,7 +70,7 @@ properties:
       - const: ahb
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "@[0-9a-f]+$":
     description: Devices attached to the bus
     type: object
 
diff --git a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
index d12b62a3a5a8..bf0af3424c9a 100644
--- a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
+++ b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
@@ -44,7 +44,7 @@ properties:
       Contains the firewall ID associated to the peripheral.
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "@[0-9a-f]+$":
     description: Peripherals
     type: object
 
diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
index 20acd1a6b173..9eb0b48b4f51 100644
--- a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
@@ -60,7 +60,7 @@ properties:
       Contains the firewall ID associated to the peripheral.
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "@[0-9a-f]+$":
     description: Peripherals
     type: object
 
-- 
2.47.2


