Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A94C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHFZi57lqGB7elcnnVw9vwRemFAicTlVo9LJ+zS40fQ=; b=acupKVDBvDUno0JD/mo5ouKgmX
	qb8Djafk3zrhe9cFGzhGQwS8cG2Oz0NY7gSCK1OJrEUui3YUP+6gDM58ymKTJycerEGR/kVK5mbDk
	HTeN0h33Z3OEsBQneNTpbJP791JjvUuG3+ozLWpL85BvN+Ir4fjwtG33oWUdzX/tVhlOryeklciHx
	A0J+7DFba6yuMjsFWVBxVmPtnFum5zP7iK8oUkqxnFMC8Nu8zCBwPY3XlvV3LZu7KSEbMhOFJNxxC
	XMFDG353dPx+PRPcvnZAHIv2RjWKUEBY/ewxsHC4WDdezaYi85V/h3SbxRLNHnczit0qFjAYGXp1N
	gOkMNifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaxn-00000001XZH-0SDN;
	Sun, 16 Feb 2025 09:29:23 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaTu-00000001Tzs-2oIg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 08:58:31 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 41E9225400CE;
	Sun, 16 Feb 2025 03:58:29 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 03:58:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696309; x=
	1739782709; bh=MHFZi57lqGB7elcnnVw9vwRemFAicTlVo9LJ+zS40fQ=; b=l
	uloQ2zZfrvaEles6N3NfXWLzq9eqCSbhpfdjactSGTdKWqVrp4shMP3iyLzaCXa7
	H2jYtV+YwNUzVEkZaQrCHva/YLN0tqQl/Dq0d2dM5KzTQPdL8hOZMVUq0TgA5QYD
	jfq9J2o8k8pjRmId9n0tdRbq+15OJTby54hMUT7aCn398KKhjfIqboPp5RL+t1LY
	zCElb5OPXyTc0xaYFFi2BdB9phEskJq/J8Leez9HU9UUDVWTMmd0EUL3AB2/Ea4s
	fUvyptOKsbVbjO+A256LUAOGJzBmwgivy65m+/Jf/xonda44u6PyAzlzEJO7/2Y4
	G7MeRiHVqJRQC8LMxeQ9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696309; x=1739782709; bh=M
	HFZi57lqGB7elcnnVw9vwRemFAicTlVo9LJ+zS40fQ=; b=AXFvNKDsrOKeLZ6bX
	p0JcPgZ13fkKp+0fr5vw0aIzrXOeSeAURiV+V29bjsgxGoJ8rtJfY7e5o2no+Lv9
	cXbgnH1IlViqcVr7LB/F25kVl4d5GNtVUb89juq/4guGV49WB3AHt+F0osjU/Vd5
	GD0sgi4aDVgJXxnz3BoppkPDsqSd40iSSR6w4uHWI8yJbPeIGJIhGJuLIbSk3r4E
	KAxIpoPdQiC4C8Zbanz3zixipNBYC36KXI0B3kyh5oMZeREmBrdq2vB7RJFgdQmT
	V3y06y01V7u2xv+1rI5qvv8M8KxjGP+Mcb2qbWp/xEgjM5LrOZ4dzq3MBEGX/7hS
	tf8ew==
X-ME-Sender: <xms:tKixZ6LzQ3c_EOo5lHJd82J-HmhGQDF-bFmRc9F8xxLoAjUHK6pkcQ>
    <xme:tKixZyJkIDLF4uchTaogJ6-z-2sCZchUOZa2eCzwfERvvLrT_6ov59pcF1AXPo1PY
    PPm97-ZyFUNE_IgIA>
X-ME-Received: <xmr:tKixZ6uGeTT3uwFTviPCH_5yfGCYlu4GLZUv4GiFCIDnhKEyOxcoRf6y6E8-8IOlOwaZZNS-Yp1s4LIvDnPzd6RpDa9lWdQwn6v5HDNcGCWU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:tKixZ_ZkQzuZ9PbecnHyJyUx0hU_gZe-7_7Ni7fRykfl5Otm3mD8BQ>
    <xmx:taixZxbFcmu9SGzA58H-cK3iQnjU2oPQoJf1V14Mtno-SNdj-_VBDA>
    <xmx:taixZ7BKHiIy8DTdGOdFQSZE76CIoew4NkDKh14brBm4ANb-ZYgnRw>
    <xmx:taixZ3Z-3apiVPQdiIrXYBK17CBhTlDJFytJ-KMagNTCUYPC934ADw>
    <xmx:taixZ-Sd9uJwi72tSkOngufYPp8XPRc34scUAo0rsWq1X-PwaOIQ8u5u>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:58:22 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 22/27] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Sun, 16 Feb 2025 21:50:53 +1300
Message-ID: <20250216085432.6373-24-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_005830_793299_AB4222BC 
X-CRM114-Status: GOOD (  10.79  )
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

The mixer configuration registers are significantly different to the DE3
and DE2 revisions, being split into separate top and display blocks,
therefore a fallback for the mixer compatible is not provided.

Add a display engine mixer binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- increase reg maxItems to 3 and add conditional for h616-de33
---
 .../allwinner,sun8i-a83t-de2-mixer.yaml       | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad2..274f5e6327333 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,9 +24,11 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   clocks:
     items:
@@ -61,6 +63,23 @@ properties:
     required:
       - port@1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-h616-de33-mixer-0
+
+    then:
+      properties:
+        reg:
+          maxItems: 3
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.48.1


