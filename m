Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0B7C44506
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/x+YYxsv60bL+EGSlJ2dLJ3eczcNCxWtbxZDP+PXMA=; b=3yh+bkHZqOkXljwPEzXqkQj6qp
	mBaDi1itPZT+Hscolv9mdDYKhkLehqY4PaoOamh5lp4j8U8GDEcdYrcz0whviyLCoL2lXfstZXCSE
	fyvA36yYVwnNjWVDHFTwhdRBmdx/MLfBBgCvKDbmTrtFTqveL6vIMpA67X/JIsJ4D9i+U6YIRr4zF
	WN8il3E08FM+KE8dtyGVeuNcrPET/OHr0jotLTmZLWUgF4jt7MqLN9L9TsQXURBz+QYZUGwvWmbKj
	LBvjS+0gpR5UaRU0ImYVHSxamQFKShd77REM6Lh2QVrplyPb3+5+7lKVklkfXsFcyGhC5p1OEcA7R
	/53h/E7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnZ-00000006Ep1-4Aew;
	Sat, 11 Jul 2026 06:02:50 +0000
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnR-00000006EgD-2ZUV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 06:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783749738; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=iF/B9SBDEvkXNuexCIPHG9Ujd48FL86LW8AQhbDHlVrSTnALAuBf0v8dutzcF7Ai0o
    muiZkUmL80ELiPksCEAvRwMrm+B/juxJKuRexaRPAy49ef6GkXreqKuDhJ0nb/5IWS6s
    Bth31lf95JRqIgzbl+T4IEFHyZRJzkSTkrBO93Kmws2zMvWBX4WruiLGUxLFzU1oAx7C
    uVc9sWIT9bbp50oOJ9ltVlccfubHNbUYc5WxCkIq4ORRode+mOlfn1igcRcFyjXvBSQn
    n7ItmwyjumvgxHOU1RqaTwSTVDb2EudTsEq0UL5FdD2rwltVi9+JHYDNZs/ci2PcHWJ4
    YxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749738;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=t/x+YYxsv60bL+EGSlJ2dLJ3eczcNCxWtbxZDP+PXMA=;
    b=D2e7Iyzhl4/CphUbFloTXyHZ2Ap7xTWkVzJyFesvwINQdw01EsJ76NOVrMhX0AcRgU
    ED0hcClxLTgbjKyPXqRDM+FzhwgBfq7+DUyCGEKdPvuMYxyQvIpD/nvnkkGO0BV+905A
    ATsmi1K5RcGMi+1EOSezjB85TFGSYN70KaNzxPBTnjojc4WkJ8P9SmjQuvOgr9VWofBH
    Ya0S1hP7wVOdQSwsFD5AZJWMoTF+SCp7LL/Ynn6LYjGjO/lt7FvuBjMCUbOQN8iOe9bZ
    J0FwZ1lSG/Vty29GO+w8GHVrOSj6fADI9C6bPjeMebDSrXennAHSd+TmwM0fOGwPHqjL
    DuqQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749738;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=t/x+YYxsv60bL+EGSlJ2dLJ3eczcNCxWtbxZDP+PXMA=;
    b=bZam3ACtFP/+X/qTQ4Ho0KMLfkU12LPFPoAt49mvn2uKjUqHr9W2UJJPxNWbS5W0gu
    mGHPbyf9uBtzn7xMTc6BgcLJcSa1hCt2s+UtvlRsuVDa05xCvp1P2x6iLk89gFmuWdwE
    aFI6Oc6dx8OWxMvIVVoU0t0CKZVFtBNVH6LcF0zJ8TPV1rk9FY0avTL+n8fPSLFRUy1h
    XYx4GlnIcR7j4bKdxcN3ljCj2WV2iiH1prUnH5LNq7cYGoxBlzRVU4o9JJw+kkBbKveC
    8S2a/zeW/d3I3ceQWkNtFQMSpnHXCW6oDx2mL7+PiuJP40R0mymfalu/GjBm9qBouQGf
    6KGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783749738;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=t/x+YYxsv60bL+EGSlJ2dLJ3eczcNCxWtbxZDP+PXMA=;
    b=cB868UH1KLyRnvCaocIO59JWga3iF1uWRNJMphEEqoS4k2t1BUCiPb6eIyP46xL8WR
    h23BL85VNpg+04e1u6Cg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrT35oLmciNszeF4HOToVDOd6S1gdjuILE2MKVd"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426B62HGhu
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Jul 2026 08:02:17 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Grond <grond66@riseup.net>,
	Stefan Leichter <sle85276@gmx.de>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Grazvydas Ignotas <notasas@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andreas Kemnade <andreas@kemnade.info>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sen Wang <sen@ti.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Niranjan H Y <niranjan.hy@ti.com>
Cc: letux-kernel@openphoenux.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	kernel@pyra-handheld.com,
	mfd@lists.linux.dev
Subject: [PATCH 09/16] ASoC: dt-bindings: add OpenPandora Sound Card
Date: Sat, 11 Jul 2026 08:01:56 +0200
Message-ID: <7989e699de400c0fe3f0cb7af77a54077784df78.1783749722.git.hns@goldelico.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_230241_820413_131F9060 
X-CRM114-Status: GOOD (  14.76  )
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

The OpenPandora audio subsystem describes the routing links between the
OMAP3 McBSP interface, the external PCM1773 DAC, and the TWL4030 audio
codec, alongside amplifiers and power supplies.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../sound/openpandora,omap3pandora-sound.yaml | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml

diff --git a/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml b/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml
new file mode 100644
index 0000000000000..d3c747e5c58d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
+
+title: OpenPandora OMAP3 Audio Complex
+
+maintainers:
+ - H. Nikolaus Schaller <hns@goldelico.com>
+
+description:
+ The OpenPandora audio subsystem describes the routing links between the
+ OMAP3 McBSP interface, the external PCM1773 DAC, and the TWL4030 audio codec,
+ alongside amplifiers and power supplies.
+
+properties:
+ compatible:
+   const: openpandora,omap3pandora-sound
+
+ status: true
+
+ label:
+   $ref: /schemas/types.yaml#/definitions/string
+   description: User-visible name for this sound card.
+
+ amp-gpios:
+   maxItems: 1
+   description: GPIO pin controlling the amplifier power state.
+
+ amp-supply:
+   description: Regulator supplying power to the amplifier.
+
+ sound-dai:
+   $ref: /schemas/types.yaml#/definitions/phandle-array
+   minItems: 2
+   maxItems: 2
+   description:
+     Phandles to the audio CPU DAI (OMAP3 McBSP) and the codec DAI.
+
+ routing:
+   $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+   description:
+     A list of the connections between audio components.
+     Each entry is a pair of strings, the first being the connection's sink,
+     the second being the connection's source.
+
+ widgets:
+   $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+   description:
+     User-specified audio sound widgets.
+     Each entry is a pair of strings, the first being the widget type
+     (e.g., "Speaker", "Headphone", "Microphone", "Line") and the second being its name.
+
+required:
+ - compatible
+ - sound-dai
+
+additionalProperties: false
+
+examples:
+ - |
+   #include <dt-bindings/gpio/gpio.h>
+
+   sound: sound {
+       compatible = "openpandora,omap3pandora-sound";
+       status = "okay";
+
+       label = "OpenPandora";
+
+       amp-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+       amp-supply = <&regen>;
+
+       widgets =
+           "Line", "Line Out",
+           "Line", "Line In",
+           "Headphone", "Headphone Jack",
+           "Microphone", "Mic (internal)",
+           "Microphone", "Mic (external)";
+
+       routing =
+           "PCM1773 DAC", "APLL Enable",
+           "Headphone Amplifier", "PCM1773 DAC",
+           "Line Out", "PCM1773 DAC",
+           "Headphone Jack", "Headphone Amplifier",
+           "AUXL", "Line In",
+           "AUXR", "Line In",
+           "MAINMIC", "Mic (internal)",
+           "Mic (internal)", "Mic Bias 1",
+           "SUBMIC", "Mic (external)",
+           "Mic (external)", "Mic Bias 2";
+
+       sound-dai = <&mcbsp2>, <&dac>;
+   };
-- 
2.50.1 (Apple Git-155)


