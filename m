Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E77BC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDAcdHpoPNx1V/t+8KFXiu+A1A9/UVrEAH/pQVGbf34=; b=EOLVssdMR4Z3PkIHT/FtG83OZ2
	UgDjZH9TUpZGNh2rgRkYd0jOOSGgLCf0bcnusV0fNPdnyXJ1UqxJTe60VY//FYcABBFdwls5zdgXF
	EpmMKVcr+mx5h5xKZHeLjNtmF5G1sh/g/tuJC66XlXxqj/0+CTT1AA5YhCaSEc3qRfy8lfVUOqHEE
	3Kg/sHcPdIAlBXEn5yJZfyzvwdyqRLMvqIrqHRyzWihBmLDlQjBzSxcqxmUZWTq13gtrkzOmt89pd
	jCKlIcJGrRnXEWAVVBfnzrZ0EbJfklqYHM9RjejBMs6hgKJHlvllTSDhtbv7Vm9tX3bADtaaBNx9u
	0egkCOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilx-0000000D35R-31lQ;
	Tue, 14 Jul 2026 19:26:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilk-0000000D2hj-01GQ;
	Tue, 14 Jul 2026 19:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ErSmMot59uUff3S0fqcoPQhLjYg3OrZQBrUrGhWxA4Kc3dwo9JbpLzczMVL3ELSDH
	 rc5e09nNv10es00Wna57ouuVzKkEb28wQZs3DfTLHMvpsGf9opNiriMoRSdDtmx0wb
	 xBQnnIw5M1NPsZ/DYbw/KJ+QVjIuhQ8yHnA3UUZfDF2q0sIXA7O5Hy8KD6gnUQ7sQF
	 jkiHIZ3nDq8z+tsxz1y8v1dBTgxcguxgk2mfRVnRoH/3O+wjknVZtOf36ux3AQntvq
	 c1oYv1fl9XBMGcXbjC9w6tUlNa3HGP11BQjcQQudxZxrkdCNF28r4UkGJRMHkY+ez8
	 AOyTFaTY4+SxQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 216E117E019E;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CD1B4480027; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:02 +0200
Subject: [PATCH v13 01/35] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-1-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2405;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU+Nw+8rIW1hzSFKW0nOinq/2VIqGtuE3
 aX2eICel/XGPIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qaGhoP/0F2BGsdjVj6LWBtawVTd4j3WWzaZKZ6ZAMDozmg8ElihlWTZ6Va89Hwi1skMNSszoD
 R7NH0eVXLC5Wo1ZI+H21g64PraW2C9TyW+5fqIFWx3729XDLnQi46PvnIFKw49Cjz5d8/5jygWe
 O0If3wyLX5P8y7vSVBUqAlfrl/fgFkrLcAUaG/J6qsw2dMdSjgor5fgjqDe7VlyY2U61YOUJKPI
 3VuW09rSOsN9S6pKlHYlFr10l/oiy7pmVBFU3lPksTmOwmbP7XpAjtAwvokKpU02dWDySCohr+1
 syS0Cx+/Okv5JxUJNgydRriidgkSmv3WbcShfF2ZQn4lAucTKFikXOeEPIqWv7t2bWlskHKCjin
 vI3cULJnW7IvMRA+yGRjYyhAe8GH1Q7XwOtfch21tLf5y516Ml4+ZtTF7p+XRNcdHKIb5SMyIs1
 dSp43ao67JetKbayJjzcn8HYxruIdADlw3D1c0ZMCOCHWwvFV78Dxf9r+pcd39E/zsSKOorJe6s
 WIM01RYfDES0HPqMkBd8KYNYdlsW8ojHxmdAAt4NN+Qgc0Hs6YyJDcR7SBlwQkPZeYMGHjr038h
 c+fmtrlH2Hyag8f9FsnhYPvZsnzCdD3CshxUPqiDBB5F7ZoT5jA+iE21kDmlkjBo4+oshVupwTl
 q9T091wU4kMK/jEamWhsxVg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122616_226679_D65163DC 
X-CRM114-Status: GOOD (  12.86  )
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

Currently the Rockchip USBDP PHY is missing a documented port scheme.
Meanwhile upstream RK3588 DTS files are a bit messy and use different
port schemes. The upstream USBDP PHY Linux kernel driver does not yet
parse the ports at all and thus does not create any implicit ABI either.

But with the current mess it is not possible to properly support USB-C
DP AltMode. Thus this introduces a proper port scheme following roughly
the ports design of the Qualcomm QMP USB4-USB3-DP PHY controller binding
with a slight difference that there is an additional port for the
USB-C SBU port as the Rockchip USB-DP PHY also contains the SBU mux.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/phy/phy-rockchip-usbdp.yaml           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index 8b7059d5b182..89efaf005a7b 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -110,10 +110,34 @@ properties:
 
   port:
     $ref: /schemas/graph.yaml#/properties/port
+    deprecated: true
     description:
       A port node to link the PHY to a TypeC controller for the purpose of
       handling orientation switching.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for USB (or DP when configured into 4 lane
+          mode), which should point to the superspeed port of a USB connector.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the DisplayPort controller
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for DP Auxiliary, which should either point to
+          the SBU port of a USB-C connector or a DisplayPort connector input port.
+
 required:
   - compatible
   - reg

-- 
2.53.0


