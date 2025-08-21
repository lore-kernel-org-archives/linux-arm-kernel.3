Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C01FCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 06:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dy56BGyXUFeNC6+7rM4Q+DhOs5rjOSsjWVWdgWGAUws=; b=qivPlq8OENkt9zYsBqIQoIVAeU
	V0vdeYO6SsSjaPLUnlppoKWrN47M1nXoShOnIwAJ2Fvk50lbwK4T6hcw5v4C8ZG1SFSmOYia1OdXV
	+uZZkszt2VlkXPFnKiObLGfTcvssMfPtjn66vCMrmX6NGqGaSi/mvbzO2cxMEdW43gtVefcJwgDXL
	C2W//M+3x/wFT9eSWqJOcCqhJcxDjorDZ6cq1YIUQRQrDBER7OyNn2R7vLCXLTxgjcKQ1cLFVLtIF
	QozqXxvLNH1bnE1lkP1eYdnzm3a/puF7HAOummXKK4eX3u5C3ZaM360bcNp6TmrZmIVFfsj5s7XE3
	2h1OYHGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyeQ-0000000FwNx-0eQY;
	Thu, 21 Aug 2025 06:19:54 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyWI-0000000FvIu-18Ou
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:11:31 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id A918DEC00E5;
	Thu, 21 Aug 2025 02:11:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 21 Aug 2025 02:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1755756689; x=
	1755843089; bh=dy56BGyXUFeNC6+7rM4Q+DhOs5rjOSsjWVWdgWGAUws=; b=A
	pAbjqVyLCnwq4ocJtdJIJKIGax3+1SrCKPfO5+kZzUn2bjfGJ1RC0blgzV26ll9C
	+2R4zU3yLUKF4DW34lU3yH56g51yPqG9QasaXxjUavIQOyS8u0ikTeBgiDpbgD0M
	oSiUbChaBs093tKB0K4Qv1K/c/PJw8nR2b9/qmaI4xPRGkN20UpASaHJeZ3ZpcSb
	vMgUdXaToQURC1ALJa2o//nYLPrLerd4cvN0xweFdysyJcSGHPKY5EZ/GY3YmKPN
	4rjcmFA99YHPwkEsEuENCGUuBGrndlsdzjylJIgITqsaGYs+Sd/g52x/rqkMojo6
	8dalXZSMZoq2w98NVrCMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1755756689; x=1755843089; bh=d
	y56BGyXUFeNC6+7rM4Q+DhOs5rjOSsjWVWdgWGAUws=; b=l8AfyutLuJSzYdGpA
	6GixLmequufsJUlhdCzLb9zAhUyieEoyGgPZ5zU3c0kjNQFVUAP3pKUT70dHFXGi
	TD4alGz7MSty5kPPgLhXvTKV0gBjesbhQzLv/SuP4wX8MV/EYMO68T32Iyc3SPs/
	F6KZJTppL5sZucoIcPYtNsRiz/bCy/bA2NcS2iNnyrsE5qE5eVsI7bvwO50kMhep
	kMxvaNNBfQUaXHwYbJSfbL6kt7aEF6bCMDmlBCc4gwr7+3zjcYlbxvZlqH1Hi5kY
	L5su5EmazhxngWjFBOFRAT5uqGTRcO4dE9lThadS0ju/W25pzAb5ytp5gi8QL4Ds
	ZVmlA==
X-ME-Sender: <xms:kbimaEOOqUt0vtp3zbPKLBaOuKbGBKgfznNlyldn3Hy4XgiN0Xjk3A>
    <xme:kbimaBsViU_qez81m1qK96tS620n44LPuYRvAUxykYKmfRJCEkcY3lV60zNEyzLFB
    OY6nTHtjbtRhMg6R1E>
X-ME-Received: <xmr:kbimaNAe7Bc7LoxWajHpIVgdL8ccgBZ_ycVZLJIMugXFXTx-mBD3MP9HLza2-1VWZ8UoSPRZUjBEfIbz2Xy3cdajFsEaaWJOWXV0RF9ZbM_gMEfnxNr4zR2UTfUNvwA4XAPdxuVKXXYI073996bb4tPL8so>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedtgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrthhhvgif
    ucfotgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghuqeenucggtf
    frrghtthgvrhhnpedtveffiefhgfduiefhgfduuddvueeukeetkedviefhgeevlefgffev
    gefhgeeigfenucffohhmrghinhepthhrrghvvghrshgvrdgtohhmrdgruhdpuggvvhhitg
    gvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghupdhnsggprhgtphhtth
    hopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghvihgtvghtrhgvvges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvg
    hrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehshhgr
    fihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdr
    rghu
X-ME-Proxy: <xmx:kbimaIbTFaKZZhLMRqg7oiaUoXYctH7Jy4VRGv8Rwee6jEuKpz2ymA>
    <xmx:kbimaIUpauC36FBcErg0GAU5JJ1sp2cLA3fMkMNv_H8x_vBrzHozbw>
    <xmx:kbimaHNbnQwhWMlp7BEyS4z8xrElkVkx0RmV_CBiXEyb0PuRsumypQ>
    <xmx:kbimaCb4ztgjmeu-0MonI_iBwhrR5_bTeRVg3suNRKAf4B4BPVdvKQ>
    <xmx:kbimaMEVDlUE5fkvjdgQ1KhikjEhIrKSIk8mQFNJ0KVHwqizeB9WZmIF>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 02:11:26 -0400 (EDT)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v3 1/2] dt-bindings: mfd: add Traverse Ten64 board controller
Date: Thu, 21 Aug 2025 16:11:14 +1000
Message-ID: <20250821061115.18254-2-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250821061115.18254-1-matt@traverse.com.au>
References: <20250813023435.27776-2-matt@traverse.com.au>
 <20250821061115.18254-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_231130_634408_72CD5BCE 
X-CRM114-Status: GOOD (  14.16  )
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

Add device tree binding for the board (micro)controller on Ten64 family
boards[1].

The schema is simple and is (presently) only consumed by U-Boot, but it
is possible that it could be consumed by nvmem or other type drivers in
the future, as well as extended to future Traverse boards.

The categorisation as a "MFD" follows that of comparable devices such
as "gw,gsc", "google,chros-ec" and "kontron,sl28cpld".

[1] https://ten64doc.traverse.com.au/hardware/microcontroller/

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 .../mfd/traverse,ten64-controller.yaml        | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/traverse,ten64-controller.yaml

diff --git a/Documentation/devicetree/bindings/mfd/traverse,ten64-controller.yaml b/Documentation/devicetree/bindings/mfd/traverse,ten64-controller.yaml
new file mode 100644
index 0000000000000..4e2f2063605cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/traverse,ten64-controller.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/traverse,ten64-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Traverse Ten64 board microcontroller
+
+maintainers:
+  - Mathew McBride <matt@traverse.com.au>
+
+description: |
+  The board microcontroller on the Ten64 board family is responsible for
+  management of power sources on the board, as well as signalling the SoC
+  to power on and reset.
+
+  Communication between the SoC and controller is via I2C, at a fixed address
+  of 0x7e. While the controller firmware implements several functions, there
+  are presently no parameters that are configurable by DT properties, except
+  those that are required of an I2C bus endpoint.
+
+properties:
+  compatible:
+    const: traverse,ten64-controller
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        board-controller@7e {
+            compatible = "traverse,ten64-controller";
+            reg = <0x7e>;
+        };
+    };
-- 
2.45.1


