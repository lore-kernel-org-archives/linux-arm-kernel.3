Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527ACCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 17:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UdfFzpnhS7U57awjE5W9odVWDhGyDLhKNpOJs/ps/C8=; b=h18MkUUyVR8pmKoH96wHSZf/q7
	U/dOw2uQsz+/TgSW4SBb4ql5lYez02xDAjjMoYjotWNcG/NmbCv7T3tAdsIG+UXe4vh5x/tkyOptq
	JFVY7QTGKNvs0emClHNQiXZbpXeT2Q+0GkukpFqHB/RRTs1uFtEKnn6kCdZX8g8OjvQ+Y2QN1Z5Ry
	s1QF2oZAu9QGdyIR+bYnWX1aV5C5Qgntwjw4WhintEVYqa/5jOQfbSsDuxfEHzVdDWM6P5q2DlFvw
	+Lt7DyMaeQYs84p2jd1w9BxcunqajVyzw/lFWnDdcv1JnyHZ196pAgzZLB1WDALHyET1WVJnaMbAZ
	YDxO2QHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL28I-00000004QLZ-3hA8;
	Thu, 07 May 2026 17:03:30 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL28F-00000004QKn-390z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 17:03:29 +0000
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 42578EC0352;
	Thu,  7 May 2026 13:03:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 07 May 2026 13:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rembrandt.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm3; t=1778173404; x=
	1778259804; bh=UdfFzpnhS7U57awjE5W9odVWDhGyDLhKNpOJs/ps/C8=; b=L
	869GgN5J3arbAebz3mrE2MpE3lK4DYx3mG/LXAIo71QUjvz+lUH15kwcpL1dNZe8
	CV+V1tYpx/m01dWAi0rBSilDh6weqiS2swf9vtzX4c+JypI8KoRTcoR6Na5oPd8s
	toe4QMaJ93H+2MmqyxOX3nqeOJfwKiNvjMVC8JSsRZ+dPY5r0YNC95EkwX+cOp9y
	6oRkjDSyGTStW3iWuFS1vukYEsKX1DmexauvZt057GsPqd7CDlejKqUOzV4q9wl0
	LDkMPQ5DtDHAP1GVI0mIivvnzmROvkHB+0DRJ2vSaBKQtRtHz7Mrj2w6l/A+hZS9
	bU31Qy3q+MwE+/PFYzKWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1778173404; x=1778259804; bh=UdfFzpnhS7U57awjE5W9odVWDhGy
	DLhKNpOJs/ps/C8=; b=k3nq3zQ385cr+P3f/spgtD9yxB1m7t7HD1N8xxZk0/36
	FmQgVkMns2iqMSpasLHHJiXw0VbMozSCM4g0KBQ9fUAt0hyYVEmGCIc9MbkVgxtV
	ZyYpIW+3ZRj4TWR49g2w/Usg6tOJqhyZdQDW9H8/HwS4sKv5nXfYsdpvIOSROp3r
	4ilPa68yER1riYu/CvjssuSlroHAbjXlXC6/8QLb9unP/tkbdootvrX/RllSLbLg
	nb2uBw6vDdjkhYhN+/NsWJrmWiFw0zko33RZ6vapWZgp9tjmyGyD8eZWv7fpSLgn
	nBnQNgRSdEF0ZNTeI+Ya6TZK23sWg1EeM25blSQrVw==
X-ME-Sender: <xms:28X8aTyK_LLuoa84Qi6pXYeFGc5rrJIR04_s9Z0RvYrND-t0Wv6cuw>
    <xme:28X8abt5qqJT7hYQbEXsArIva4D35b0e2p181as_Ud_69jtfV01SqNMYS4BYahnIl
    GPwKotfoeLiyyeV4bC-XfDcAycFDqeemt-BbEoRnmLbqaHDaZgd6w>
X-ME-Received: <xmr:28X8aeDSXpfHrx94itOJOdGunClWreScfhcp9zn6riwEKm0pVq26um7y14Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdektddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhgurhgvficu
    tfgvmhgsrhgrnhguthcuoehkvghrnhgvlhesrhgvmhgsrhgrnhguthdruggvvheqnecugg
    ftrfgrthhtvghrnhepveejhfdvgfegudfgfedvffekffffvedtudetudffueefueeiudfh
    vdehveffudevnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpkhgvrhhnvg
    hlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepkhgvrhhnvghlsehrvghmsghrrghnughtrdguvghvpdhnsggprhgtphhtthhopeelpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgv
    lheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhesrhgvmhgsrhgrnhgu
    thdruggvvhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrh
    hotghhihhprdgtohhm
X-ME-Proxy: <xmx:28X8aVHwIMNMZnd51TTggfasHWZHeF_18WFITw_oevnuftkj6B8WzA>
    <xmx:3MX8aWBRQenDgKfrwihfQ4DVUsoom2bHSBg8YFOIsOsI952jjLwHyw>
    <xmx:3MX8aTnn4HSUYnU5-AqsKq2z_lxDB3DOSmCP0BBONqubh-qnyBeEiA>
    <xmx:3MX8aUOBKcaTD48OlplAhSONycgdD_bmF4I21_4rMkdo07KL6YHO_A>
    <xmx:3MX8aTXjMxd4J5cJJvB6F4JRmnjRdenKTRDp5iqEimTl_i_1sL674M5_>
Feedback-ID: iec564b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 May 2026 13:03:22 -0400 (EDT)
From: Andrew Rembrandt <kernel@rembrandt.dev>
Date: Thu, 07 May 2026 19:03:14 +0200
Subject: [PATCH v2] dt-bindings: arm: st,nomadik: Convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-dt-bindings-arm-st-nomadik-yaml-v2-1-8ab05d1cda96@rembrandt.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NQQ6CMBAAv0J6dkkptKSe/IfxUOgCFVrMthIN4
 e+CXjxOMplZWURyGNk5Wxnh4qKbww7ilLF2MKFHcHZnJrhQXPIabILGBetCH8GQh5ggzN5YN8L
 b+Al0JSqtKyVt2bG98iDs3Ot7uN5+HJ/NHdt0ZA+jo9lDGgjN/0kVNRelyoUquJYSChiRAk4XQ
 t+QCTblFhe2bR/fUSwLwwAAAA==
X-Change-ID: 20260507-dt-bindings-arm-st-nomadik-yaml-942499465d3f
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Andrew Rembrandt <kernel@rembrandt.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778173402; l=3643;
 i=kernel@rembrandt.dev; s=20260507; h=from:subject:message-id;
 bh=wNI6XYkLL/wdd2KsFd6jMa9avyhLUHfadbYH1iiLeHE=;
 b=TZEE9VZkzupwLaiJ573HHVe4HMO4Pi+sh9f+W7qcNvEqK5/Xy9++YEKqjFU9zpiGVU9vy1OMD
 BvOGVOvpRWeC7a+4JZIycy6jkuN2JXZf900tzlRG+uKZbyaABwy0Swu
X-Developer-Key: i=kernel@rembrandt.dev; a=ed25519;
 pk=VOqAxv0F8uPe0IlilYQx5HupCb50kVzuEfn5FD4pKOY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_100328_242713_5E30E4CE 
X-CRM114-Status: GOOD (  13.04  )
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

Convert the ST Nomadik boards binding from free-form text to DT schema.

The binding documents the Nomadik NHK15/USB-S8815 platform compatibles.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
---
Changes since v1:
- Replace 'oneOf'+'const' with 'enum'
- Remove example node (per Conor Dooley's review - it had no corresponding node
  in the relevant dts files)

Thanks to Conor Dooley, Rob Herring, & Linus Walleij for the reviews.
---
 .../devicetree/bindings/arm/st,nomadik.yaml        | 23 +++++++++++++
 .../devicetree/bindings/arm/ste-nomadik.txt        | 38 ----------------------
 MAINTAINERS                                        |  2 +-
 3 files changed, 24 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/st,nomadik.yaml b/Documentation/devicetree/bindings/arm/st,nomadik.yaml
new file mode 100644
index 000000000000..3f65e7a15668
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/st,nomadik.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/st,nomadik.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST Nomadik SoC based Boards
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  Boards using the Nomadik SoC platform
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    enum:
+      - st,nomadik-nhk-15
+      - calaosystems,usb-s8815
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/ste-nomadik.txt b/Documentation/devicetree/bindings/arm/ste-nomadik.txt
deleted file mode 100644
index 2fdff5a806cf..000000000000
--- a/Documentation/devicetree/bindings/arm/ste-nomadik.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-ST-Ericsson Nomadik Device Tree Bindings
-
-For various board the "board" node may contain specific properties
-that pertain to this particular board, such as board-specific GPIOs.
-
-Required root node property: src
-- Nomadik System and reset controller used for basic chip control, clock
-  and reset line control.
-- compatible: must be "stericsson,nomadik,src"
-
-Boards with the Nomadik SoC include:
-
-Nomadik NHK-15 board manufactured by ST Microelectronics:
-
-Required root node property:
-
-compatible="st,nomadik-nhk-15";
-
-S8815 "MiniKit" manufactured by Calao Systems:
-
-Required root node property:
-
-compatible="calaosystems,usb-s8815";
-
-Required node: usb-s8815
-
-Example:
-
-usb-s8815 {
-		ethernet-gpio {
-			gpios = <&gpio3 19 0x1>;
-			interrupts = <19 0x1>;
-			interrupt-parent = <&gpio3>;
-		};
-		mmcsd-gpio {
-			gpios = <&gpio3 16 0x1>;
-		};
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..86e7c1dd51ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3155,7 +3155,7 @@ M:	Linus Walleij <linusw@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
-F:	Documentation/devicetree/bindings/arm/ste-*
+F:	Documentation/devicetree/bindings/arm/st,nomadik.yaml
 F:	Documentation/devicetree/bindings/arm/ux500.yaml
 F:	Documentation/devicetree/bindings/arm/ux500/
 F:	Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml

---
base-commit: c9a7f7e6b9541450a064854ac965c1a8c8fdcfc4
change-id: 20260507-dt-bindings-arm-st-nomadik-yaml-942499465d3f

Best regards,
--  
Andrew Rembrandt <kernel@rembrandt.dev>


