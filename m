Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F09D26D69
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JK95k+/eptcrGjwo7pfn+9GJ7UZIOpAN/qF7YVUg7vw=; b=jZyJoZphZOLdrs
	DU0NIMQ6GzBiYClUL5F55gmoQtCQXpkqnMLVEDG8GpLgHRMWrH+EoWjHlQw8RKkM80z6azzQruaxL
	JbBw6Tyn4H+wRO1IwSb4J4yaaDQ8eoydWyOKuawBOQYBv0boA68Prow/5S0tQBhJgoRZG0wgoQHFk
	9XdhaXITYeeN1gZ0R0q5LZzlQ0VP4J7nz5QXoAc+eefb5N0iBg0ne6tS9e9BpEvTfV/oOUZqTvIpH
	fdjXh8YTYMCCHo06m98wFZ/SbAxFLjC8XWjsmUYyulnmOmRvdALibC71MX1rZubrvPd0KhrtpE3Rm
	u87hLT5vOtUR0I1JboaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEN9-00000002TWm-1X1u;
	Fri, 09 Jan 2026 15:25:55 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEN6-00000002TVr-3GXk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:25:54 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 470651400191;
	Fri,  9 Jan 2026 10:25:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 09 Jan 2026 10:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1767972350; x=1768058750; bh=JK
	95k+/eptcrGjwo7pfn+9GJ7UZIOpAN/qF7YVUg7vw=; b=bv8dSm9iq7GxcP27MT
	iJP7JiwIv5wRl17lusH5SH+guFZmiPTxqbOhoqE8VdJfIsn8ZsAF7ffKpOcaKAG7
	6Y7oAQHbWOu3jukD04NGptJNxDwZ9ZRXZtRHr9UUTfNmj6CVbSLxtElJYtdzSx9i
	BijG2sO0+Zdd+PqXXajtvq1PHOi9n+jbt3s8R2p40a8HdACs6lGbe9r2yvz7NGy8
	vG6XysiHq7SWQz/3A1Pf6hV+KYu3bHHY/PvwrDjedAiNkMYon+pELOurt84qx0AJ
	uWgnY9b+EDV+7SxyHdqOxoIrmoszsrtWyo46vHtvEDZEtOe6xDwGVUGZGHMA/Eke
	qrIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767972350; x=1768058750; bh=JK95k+/eptcrGjwo7pfn+9GJ7UZI
	OpAN/qF7YVUg7vw=; b=UmGCGrrFWFBT38wbERLZPG2a0iYAeZVkilzJ6pB08qax
	2dJpdFLn6WwmQlRADjmmBk5GYdgZnJz20mEmZ4wRTeS1B9urZ6z/hyGIOcuB+qj1
	sWm+DiVMOB0Vxd+W1ZyakOwnPghO4Y1lGhZzXyk6jMJMvtK77iRwIR+PklUoT+Ph
	pVpvXnParcxQjZjWpZLqCzQLMBDZ0eCI/IN54RugE+8kOhGCxSnthZjwriVYlqeF
	EMQ2Q+gVr/SMXVDk0HSIkNhWQPzFCgrgrF+QAGJI6dyOkAaZo5gSQEQs57rMvlZe
	t8a79UJpvNWe6K7pxipdG5Y4DHDlPQsi+PXQ0JeMJw==
X-ME-Sender: <xms:_R1haSpTGdkI06D5xIii5pPZzEFvzRR0yuggEkLHiUKRwvDZpx0sBw>
    <xme:_R1haY01qgmcHqvc83yTwE0KFzFPdJBltSUVOpkR3EPXZ3zOiBIic8GvtL3VTeoWA
    d2c6--eUY_YokblSKr_sHoVdehpIkmHq26_asF0hfnYmZypXyS6dEP4>
X-ME-Received: <xmr:_R1haSw9DDcWNc2pKweHBbaLC7kMj9DmYKS6jmJ7527o3Ge_kGuMI9KNhjdQdCpTssCskzzGVqjdgTMEJ4IPQW8_aBzCI0TWAyiHqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeludeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhephfdtue
    duleejffduvdehkeeutdefhfdtvdeiieegheffleefvedvhfeggeegffefnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsehjrghnnhgruhdrnh
    gvthdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhiheslh
    hishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghr
    nhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggr
    lhesghhomhhprgdruggvvhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:_R1hacgZNF7thfNtG8tQf2JydWf2WbmpciDSRw4llsbk_gKIS6q8zA>
    <xmx:_R1hadrtBhfdO6PzARFSKjyPQ6dBlEvgPPitle7wB1ZI5rELNlhTRw>
    <xmx:_R1habj0gU9CYxx8A1J-zrRYitgipoznzSzU2XcY2pqg84vP9NJXvw>
    <xmx:_R1haXOdnZWdpsx_a4xHybb_is7aCgEnRC6IVc9Jr8u6vLbs-Nq8Eg>
    <xmx:_h1haXLMomtAhwH2L_NDVdlBB9F-lLcUimsIZy-VZDU2UAlBM1OKjWCz>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 10:25:49 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/4] arm64: dts: apple: Add chassis-type properties
Date: Fri, 09 Jan 2026 16:25:42 +0100
Message-Id: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYdYWkC/x2MQQqAMAzAviI9W1g3FPUr4mFopwXRsYoo4t8dH
 kNIHlBOwgpd8UDiU1T2LQOVBYyL32ZGmTKDNbY2ZFr0Ma6M04FZq4ricUfG4KiyzlOoG4LcxsR
 Brv/bD+/7ATHZd4FnAAAA
X-Change-ID: 20260109-apple-dt-chassis-type-f31523a1f681
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=lW4m4RnXR/rqNsCu9D9OsNfRk839aXE8VkEWAegepkU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxE2d++30UKrjoJ5Quem+Cwa6bCPPP1jq5yFXcXts30O
 BC+qe1IRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIlsvM/I8D7FfCOX45PrDQtP
 vftotcDwIHfDycLm6ptNE2Y2ZtVJsjAyHPu7R/DmsfRfd8TfHT597M+LO01TS2bP2nZefke7Ak/
 3Sk4A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_072553_106606_6635D003 
X-CRM114-Status: UNSURE (   8.21  )
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

Add chassis-type properties for all Apple silicon Macs. "chassis-type"
is used by u-boot to fill the SMBIOS "System Enclosure or Chassis Type"
field. User space software uses this field to to determine if a device
is an laptop. The exact use case eludes me unfortunately.

The Mac Pro uses "server" as chassis-type which is not entirely
accurate. The tower and rack mount Mac Pro versions share the same .dts
file and are identical except for the enclosure. I haven't found an
obvious property in Apple's device tree to distinguish between those so
both use "server" instead of the more accurate "tower" and "rack mount
chassis". The latter chassis-types are not in dt-schema anyway.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (4):
      arm64: dts: apple: Add chassis-type property for all Macbooks
      arm64: dts: apple: Add chassis-type property for Apple desktop devices
      arm64: dts: apple: Add chassis-type property for Mac Pro
      arm64: dts: apple: Add chassis-type property for Apple iMacs

 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 2 ++
 arch/arm64/boot/dts/apple/t6022-j180d.dts      | 2 ++
 arch/arm64/boot/dts/apple/t8103-j274.dts       | 1 +
 arch/arm64/boot/dts/apple/t8103-j293.dts       | 1 +
 arch/arm64/boot/dts/apple/t8103-j313.dts       | 1 +
 arch/arm64/boot/dts/apple/t8103-j456.dts       | 1 +
 arch/arm64/boot/dts/apple/t8103-j457.dts       | 1 +
 arch/arm64/boot/dts/apple/t8112-j413.dts       | 1 +
 arch/arm64/boot/dts/apple/t8112-j415.dts       | 1 +
 arch/arm64/boot/dts/apple/t8112-j473.dts       | 1 +
 arch/arm64/boot/dts/apple/t8112-j493.dts       | 1 +
 12 files changed, 15 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260109-apple-dt-chassis-type-f31523a1f681

Best regards,
-- 
Janne Grunau <j@jannau.net>


