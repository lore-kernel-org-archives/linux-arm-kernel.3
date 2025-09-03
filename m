Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4E3CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=coCvg9toaaZHalzdq7we7HoqSKMDL7gNaulcB9obD/s=; b=DBW3TRxC4zsWzqpahHtvIY5U4T
	ToUSsRt2QZP1/nSR+IXFxJHIzqIRZwo2oBzKRTRkrker+JGz+evSc3lWc5nIdeM6EG3LNyzQftGsJ
	6uT7awkoARXWbfDMHN8YIZTcvtd1BcZHCtm9ShZ9GUm6M9kOHfHDG7+Uli+DpR9cp0AquBgKOksat
	tpDlMoURFLNBmnIMUnv+x4fvDjgy/OLInhrR7/aLNkfc+MPoUU3bScjZ6ve5h6/jZMtPhmUEcl8av
	oQf4U3TIzeZBrd8YpBEuIUQQ2w0u1o3GxFNqzkmtomrsLZZA78Z1sUWtBs/vcfGNOQO2kcHiG/Dxy
	YxTQQTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomG-00000006l9Z-1uSq;
	Wed, 03 Sep 2025 14:48:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmAf-00000006JTf-0Hbr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Sep 2025 12:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=coCvg9toaaZHalzdq7we7HoqSKMDL7gNaulcB9obD/s=; b=WZkYdzs8/uiMGcyOG2noOcR81H
	47JTVVlI4qY2en8fU1GPwQg0x4/2pD9GovohSZv7V5m05qrbeCU3oFdh6FPgB7ol8bNWajFZyruGL
	wviEWTg5+ld7c4GAw8nMC9+7B1wmuMdJO3xsnh4fY5ktTAs2tM3f62yeM/EvmHaPGmc6uqRJrLQte
	3lHWVBudbXmX/LyROmk1twbqyMmP0YMinI1kd9dB125GoW7sL7zm86ZWgoXgoUtJoDGC0LZCXjzHf
	XTonYM95Dv67Dd5iMXoyObnBpDCIwoM1EsNj5eecGxM5gtzQrUnzDS4L2miycTILnKSfNlf8HGkzV
	yqZasy1A==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmAa-000000049wn-3r6S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=coCvg9toaaZHalzdq7we7HoqSKMDL7gNaulcB9obD/s=; b=o2ZMvI9BejTF4cXzOojjDzjoMq
	V3qzoWK+kJHDNUFa3Q7jBydchZ2zA+NAQIfaUaCOV4pyhDwJFSbBL5B9xxEhZ0haczUkxYQPiEeDI
	ttEqiXVlDmjMWZPSLrRHrPtbQGYcotpXC49FZhU4Z51wiOERsjSReZ+E/j+7mAJrBu6+PiRc4c4+d
	8NIaK3TJYFxRM7LdTPFo6QAPWpT5WKcrkSOer5cZDZBe7f4sxZ9kyjOQ8hNglHzSG7B9wbxYU5K2Y
	0xQfc21VTxvndLbilf+pfJ0IKNY/4OJdFYVcW8Zio6HkmtX1XwYbZo4rgTMYQ1qTUIhk0fi9T/4dh
	B8TOZt+A==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52410 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1utlnU-000000034mQ-1Rh5;
	Wed, 03 Sep 2025 13:37:02 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/2] dt-bindings: iio: afe: current-sense-amplifier: Add io-channel-cells
Date: Wed,  3 Sep 2025 13:36:59 +0200
Message-Id: <20250903113700.3079626-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_130057_271905_F8AEFB48 
X-CRM114-Status: UNSURE (   6.76  )
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

The current-sense-amplifier is an IIO provider thus can be referenced by
IIO consumers (via "io-channels" property in consumer device node). Such
provider is required to describe number of cells used in phandle lookup
with "io-channel-cells" property, otherwise the following kernel error
is present:

  OF: /iio-hwmon: could not get #io-channel-cells for /current-sense

Also fixes the following dtbs_check warning:

  current-sense: '#io-channel-cells' does not match any of the regexes:
  'pinctrl-[0-9]+' from schema $id:
  http://devicetree.org/schemas/iio/afe/current-sense-amplifier.yaml#

Fixes: fbac26b9ad21 ("dt-bindings:iio:afe:current-sense-amplifier: txt to yaml conversion.")
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../devicetree/bindings/iio/afe/current-sense-amplifier.yaml  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml b/Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml
index 527501c1d695..bcf4ddcfd13b 100644
--- a/Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml
+++ b/Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml
@@ -24,6 +24,9 @@ properties:
     description: |
       Channel node of a voltage io-channel.
 
+  "#io-channel-cells":
+    const: 0
+
   sense-resistor-micro-ohms:
     description: The sense resistance.
 
@@ -46,6 +49,7 @@ examples:
   - |
     sysi {
         compatible = "current-sense-amplifier";
+        #io-channel-cells = <0>;
         io-channels = <&tiadc 0>;
 
         sense-resistor-micro-ohms = <20000>;
-- 
2.34.1


