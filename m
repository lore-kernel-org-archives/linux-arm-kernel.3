Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BCDD1D494
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8MwoLw3nQeq6OMFA9qd8hgLbODnrMCyrSn1Vrtcd/U=; b=j7aYY+dV4gxwtkGQZG9b/KfKE7
	oj4f6ghcQCKX1zIS3HE7QRH8HNF2aQfb15igBnGI4uyEZq9EURbePXNlwDsyFoL3Z13OJQ6UK48jd
	w1v2SR5PcxGsTIbMwR+rlsQF+tqo8Wzd7HHzrMuk90i3UMoQc6X+628MRURugQfKlpwM12dI1IApO
	Pc0JCBoKv07ryANzSrNTfvxdkCNQNCYyfr6kcoWW1a2Ax6EgdkSJNsCAhm9Q8TlhWn+OuPbkFTAq+
	X80A01vuZoA4V8aZ4LhM9Mf/uW+P932PTIp46y2+ScQWYSS0tsX4Q+Ad09DYCZUuSDI2hvoYX1TN3
	2BALKr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxBT-00000000rUP-4AV9;
	Thu, 08 Jan 2026 21:04:43 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxBP-00000000rSw-01GI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:04:41 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 229401D00070;
	Thu,  8 Jan 2026 16:04:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 08 Jan 2026 16:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767906276;
	 x=1767992676; bh=b8MwoLw3nQeq6OMFA9qd8hgLbODnrMCyrSn1Vrtcd/U=; b=
	MPnudNsWg0G3S3bPjBiCjdExs0KzqRHPVxxR/Gs4j/Y7ogZJzsL0nzrvIwqaEu8S
	UA8MAW1oByW2crii8X/cix8+9iRR8FZL784Y6qVEd1VHGCGmwYFc+eaQTvaCq4Vx
	iwGZyBuijapWQDQp4lBTUvoRgfclRduhH4SzFpXVrnpzTRvxKEagCqg93psH110S
	/G96C0baqopkGNaymRkDd23e0Wp0HE5sx7UmLwPpTMN9me/2+78iFKP1hmBSOaR7
	OxoE3FjJWnEn6EJTwVQjzRifVh1cL6HEIRiT7Fjcswybve5wsY1J4w/NGZBwEXxI
	cVO/GaARa2Sq6hZIo0twLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767906276; x=
	1767992676; bh=b8MwoLw3nQeq6OMFA9qd8hgLbODnrMCyrSn1Vrtcd/U=; b=z
	vtoLnw2Cw5nQpBOb/aXCTHaHFyRtPzp6QKstrLR0goHQCa5cQRRwUUHlbZRGe0O7
	y92lJHGjRSTDHE6xJU2u1H/IlRU6HADVHZ2URJLCHVDLQTVR4wbQEn4YSPOqSmhR
	I3jCXUzbB3UtcMU9TALLNqSZXo7J55jwWdrR0mdn1Se2Xq0LC1xIEEy7UM1dXcgl
	+ehOS3Ubfvopjyim/4KLU3Kp/dJXB+vuSYErb72U3QL6PbJcWUjt7reWRbyyV2qy
	r4OfOMXMUsXvESLUzeOQQPii+s1Fvb9qD6s+vOEJaWWX1+KV5gj+HllFO35oMlyg
	tyFLsxMbtUdkv0wHl54WQ==
X-ME-Sender: <xms:5BtgadbgDLzukVvbe4n38uDwSQ8y1J9j4eL0zJRmefCgNGocVs9wGw>
    <xme:5BtgaV88cq8RsE7lG0IcWeei4gRkARCFQRWknaN03krQMQbTaF95if4EW1X-xz4yI
    XmLY3ygkXbhExjFEzhiFQjLECMMqxb5cMfbl06baqiN0Ge3F42hcnM>
X-ME-Received: <xmr:5BtgafOk_6VQ0tPKy4QRd-nxYdWnlw7-QjbdUdSD3qOnk2eO4p186ss6cMMon5rHGUHv-Y5DT3Aj9bvH28VyVHv5Hyi3IwMYHz6i6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeileekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhih
    eslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5BtgaSFfDlFKDgRf39Xm9qMJy_X9QOytiqRnv385aPov7g4LRZTHIw>
    <xmx:5Btgadw0m4awAO3LZHnYhW3r6zavCJ4CJtF9apzdxZF3IzkYEqV91Q>
    <xmx:5BtgaTqozZaRg2aKTHOBOnsa-gszjwdSeANEt0cCZJUZ5uhbs8gqtQ>
    <xmx:5BtgaTneHNn-HhJAHveJ2ChEjZ258hzcNMMNk2dxFwkK1U_9pjQTrg>
    <xmx:5BtgaXXHE-VfoZuPdU2q2Y4O36Uzst7OzWfbH9sj5hMckcvK0UD2pEx9>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 16:04:36 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Thu, 08 Jan 2026 22:04:01 +0100
Subject: [PATCH 1/3] arm64: dts: apple: t8112-j473: Keep the HDMI port
 powered on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-apple-dt-pmgr-fixes-v1-1-cfdce629c0a8@jannau.net>
References: <20260108-apple-dt-pmgr-fixes-v1-0-cfdce629c0a8@jannau.net>
In-Reply-To: <20260108-apple-dt-pmgr-fixes-v1-0-cfdce629c0a8@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=eh/RncIhcNF7K7NjRWfxhxp8BvQj2+b3J+GhqEj6jH4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhswE6btlRbsbJk3fHHhLxEleW4JB6aDYxO+ynMd0RN5dL
 v6v8Nezo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwESswxkZ9l9ocJw/5d/36HZ7
 fdNnHGu3Jjxk0ypZseq0kXRVBMNCS4Z/1srl0+qDtn2JurdKSVlzj26jyDaPX+EXD5nPf7KMJya
 TAQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_130439_595815_180CF90D 
X-CRM114-Status: GOOD (  12.10  )
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

Add the display controller and DPTX phy power-domains to the framebuffer
node to keep the framebuffer and display out working after device probing
finished.
The OS has more control about the display pipeline used for the HDMI
output on M2 based devices. The HDMI output is driven by an integrated
DisplayPort to HDMI converter (Parade PS190). The DPTX phy is now
controlled by the OS and no longer by firmware running on the display
co-processor. This allows using the second display controller on the
second USB type-c port or tunneling 2 DisplayPort connections over
USB4/Thunderbolt.
The m1n1 bootloader uses the second display controller to drive the HDMI
output. Adjust for this difference compared to the notebooks as well.

Fixes: 2d5ce3fbef32 ("arm64: dts: apple: t8112: Initial t8112 (M2) device trees")
Cc: stable@vger.kernel.org
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 06fe257f08be498ace6906b936012e01084da702..4ae1ce919dafc40d849f7dcee948457158562316 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -21,6 +21,25 @@ aliases {
 	};
 };
 
+/*
+ * Keep the power-domains used for the HDMI port on.
+ */
+&framebuffer0 {
+	power-domains = <&ps_dispext_cpu0>, <&ps_dptx_ext_phy>;
+};
+
+/*
+ * The M2 Mac mini uses dispext for the HDMI output so it's not necessary to
+ * keep disp0 power-domains always-on.
+ */
+&ps_disp0_sys {
+	/delete-property/ apple,always-on;
+};
+
+&ps_disp0_fe {
+	/delete-property/ apple,always-on;
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader

-- 
2.52.0


