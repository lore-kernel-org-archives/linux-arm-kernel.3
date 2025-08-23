Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703D0CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bmkOGDbZuHb+4/T8LqP7nmd61o+/4jaly+x5FDNGBwk=; b=BVQ37djiA5wSb+
	5dv64XeGuqkEERLpaapzu+jtursnES7JbhfNW2xdK2iyKKxzpkCBbAMhny00LMEtb6n5YvI1gYngZ
	Pg3XYQD3GJy4Dzz+FBQy2WSSC9PgwB4u+KiyDmAnN/gYuurH2zzdGdZ4A3QfMUlmizr2BYbXIlWFe
	5u3tw1wmimX2xCR/uB0QM5+TNWnhsvF/X+5XnzYR2ESmL9ijhwWzSm5o9IR1S+BL0SCtAjAJCQqBB
	ep0+xDIpUh23wnBLw6hL1kO5wNSEVhrXc8znhwTomw/Wq9//xE/h3Tw0wGRe8fpSx5T7XazPT/7TN
	+3M4WGEzw1saSK7lLf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplBL-00000004b8o-28dw;
	Sat, 23 Aug 2025 10:09:07 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upksj-00000004Zo6-1CBH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 09:49:54 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id BB72A1D00088;
	Sat, 23 Aug 2025 05:49:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 23 Aug 2025 05:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1755942589; x=1756028989; bh=bm
	kOGDbZuHb+4/T8LqP7nmd61o+/4jaly+x5FDNGBwk=; b=fHpnSRRCjuGFsi9rO2
	Z6NcFhBpITWA495+M+3PSznWk5iqhWM6J5fuePnLsOxlTfZHp9R7XjR2jSwlG1fY
	kkSHyru1wiWYeSvr1V+Eku3hxNcBtaROvr0wo/8djMhSusah7YoycvVndMPBzIMW
	aTZ9shLxij3cDryAVmOWici5MpjC6gDkQOucgIc8nUgeuOy1q/nzGBauGLHbxyLi
	ZkB8ZXsEUHT4HbywLtJMRJtlA8yRSaKZ2dKfp7iCVHwy3nSUbqzUrA171/WsiMNp
	dDXJiYYQHcWLk6oAygvhaEde7p5lDwHBJd4PAh5v0j7QKFHqItZcreMPI9aVpIXv
	GVxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1755942589; x=1756028989; bh=bmkOGDbZuHb+4/T8LqP7nmd61o+/
	4jaly+x5FDNGBwk=; b=cezUg/Pok3jq0Shzd7ZIEoJ0szKKmPSv3OSfvrEi6U86
	kRvtrhSxx0L4q0kHUTsSB2i6qQcAMwzSIamR+Z1R7/5SWPTkYGtiDY0XoISm18+t
	+0HIvGHcnYZsAugeKBbdze4sr9JmWheDds59mFBM1frUMT0J8/osmL7kCnGSKCtO
	cNqOUzPOJJ34pLOLZv9nbHqwcaz8mIZ16WFPgQw/iC+lQ5J74UmPIsfprWkN97f2
	wh+HBdnhpoVnHxCeum5RgGhQd9u2EpRMswiP5eYChKpgCBc+3rfBNRpLdcPLkCxE
	daW4GzF/O6bNO/H+Sa7eXNxqXLUEV2dNYnbmTHSU+w==
X-ME-Sender: <xms:vI6paFHdsxIzH6bHiuGgKH26qk7X2u75b0t9q9vRS1b0PoEnflp4lw>
    <xme:vI6paBlPj5upxrTpPcBoaF8M0J6k1PNPMjhoAnZtVGaw08ioQgJJPscSfPvxN3OMw
    RM_UFOtjKMbu0vwLhk>
X-ME-Received: <xmr:vI6paCBrocZcFghRChOpdcCPk8g3Ae3qKtEkotuGQz45SFDjEmdP68ppEzX9oxZmjOhlxNljQ2k4TdSeS_UT4yNMSiiBBeAJyRMa9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieeifedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepueelgf
    fhfedvgeelfeduuefhfefhjeeihfffueefjeeihffhheeuteeuvdeuhffhnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepudef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghtthgvnhhishesohhpvghnsghs
    ugdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdought
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuh
    igrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggr
    nhdrshht
X-ME-Proxy: <xmx:vI6paLDk4zmdnUxlfV1AZmqMJ--2Ggr1941uzcaBP26d0l-HMPdnqg>
    <xmx:vI6paBG-3HWT9BNKiKpPY_XKV3xHurvAc-r8vH10Sl5cRtWPN4E3Lw>
    <xmx:vI6paK7G51l3NqWzuR1d6wVe2VrtM1MTHV6gyzeOUU3oxGKnwH0qcg>
    <xmx:vI6paARseNFcebZYtM37iHbgWbtvsyou4j8xuX6XUJRt1lZhVyEjBg>
    <xmx:vY6paCANtR_nHA5HS_4-dd0OryT0DIoLUwlHUwLiuKwYFlGjnUPcCoxp>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Aug 2025 05:49:47 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH v2 0/5] Apple device tree sync from downstream kernel
Date: Sat, 23 Aug 2025 11:49:43 +0200
Message-Id: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeOqWgC/32NQQ6CMBBFr0Jm7ZhODQKuuIdhMWmnUmMKaZFIS
 O9u5QAu30v++zskiV4S3Kodoqw++SkU0KcKzMjhIehtYdBK16qlC/I8vwTtgmkLBq9IDVpyhkz
 bucYwlOEcxfnPEb0PhUeflilux8dKP/s3txIq1KpzVFtSzKp/cgj8PgdZYMg5fwG5KnogtQAAA
 A==
X-Change-ID: 20250813-apple-dt-sync-6-17-d1fc1c89f7ca
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=wXnxizWwkszTat9AweecGcJnROVya1QAB6nbCu02L5I=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoyVfTtjZHV4Dizd+CMn68Jxo5sTt1Yf2Okb72Fx8JvTl
 Cv5Wh/ZOkpZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAEyk8QgjwwYdsZvR/Lc+HxQR
 Sr/n/a92aniE+Iq6Gc5NJw+vlg4+/4vhf8gJveRD/9oLg7heJH728ExsmRMXLaNx9Hret9uOPwN
 2cgEA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_024953_730481_6AE635BB 
X-CRM114-Status: GOOD (  11.23  )
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

This series pulls changes from the downstream device trees which are
supported in upstream kernel.
Most importantly it fixes the PCIe description for a specific iMac model
(iMac M1, 2 USB-C ports, 2021). This is worked around in the downstream
kernel by not disabling the port. In preparation for submitting M2
Pro/Max/Ultra devices trees I investigated the issue on the similarly
affected M2 Pro Mac mini and fixed it this way.
It completes the Wlan/BT device nodes for t600x based devices and adds
the missing 15-inch Macbook Air (M2, 2023).

Checkpatch emits following warnings:

WARNING: DT compatible string vendor "pci14e4" appears un-documented --
check ./Documentation/devicetree/bindings/vendor-prefixes.yaml

Which I chose to ignore. `vendor-prefixes.yaml` prefixes contains no
other mapping for PCI vendor code and the list of ignored prefixes
forbids extending it. Both options feel wrong though. "pci${vendor}" is
clearly a vendor prefix but duplicating the PCI vendor data base feels
wrong. `vendor-prefixes.yaml` currently does not contain and PCI vendor
aliases.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v2:
- fixed commit subject of PATCH 2/5
- correct Macbook Pro (15-inch, M2) to Macbook Air
- added Neal's and Sven's Rb: tags
- Link to v1: https://lore.kernel.org/r/20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net

---
Hector Martin (2):
      arm64: dts: apple: t600x: Add missing WiFi properties
      arm64: dts: apple: t600x: Add bluetooth device nodes

Janne Grunau (3):
      arm64: dts: apple: t8103-j457: Fix PCIe ethernet iommu-map
      dt-bindings: arm: apple: Add t8112 j415 compatible
      arm64: dts: apple: Add devicetreee for t8112-j415

 Documentation/devicetree/bindings/arm/apple.yaml |  2 +
 arch/arm64/boot/dts/apple/Makefile               |  1 +
 arch/arm64/boot/dts/apple/t6000-j314s.dts        |  8 +++
 arch/arm64/boot/dts/apple/t6000-j316s.dts        |  8 +++
 arch/arm64/boot/dts/apple/t6001-j314c.dts        |  8 +++
 arch/arm64/boot/dts/apple/t6001-j316c.dts        |  8 +++
 arch/arm64/boot/dts/apple/t6001-j375c.dts        |  8 +++
 arch/arm64/boot/dts/apple/t6002-j375d.dts        |  8 +++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi   | 10 +++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi        | 10 +++
 arch/arm64/boot/dts/apple/t8103-j457.dts         | 12 +++-
 arch/arm64/boot/dts/apple/t8112-j415.dts         | 80 ++++++++++++++++++++++++
 12 files changed, 161 insertions(+), 2 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250813-apple-dt-sync-6-17-d1fc1c89f7ca

Best regards,
-- 
Janne Grunau <j@jannau.net>


