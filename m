Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECE6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9vWrxkdJO0dfpBjkfIgsKAeydLi/izf9pI2P/yUQt9k=; b=0T+P79Xg1B8xExNN97fE2edy4x
	f1aAbQf952FjgWkZaqxBf79Mtbu6yyEHUbSquzVBApiShKMpQz380WTE3Tvod/YrKKkwoICa+p5be
	b7rc3jZc+2l+5JCMx85ogt6A4ngEZO+Ei3Ei2RVQ6Zaq65Gkiz0mZ/bW2tqhEVJHRj2Gi6tWFFndJ
	5oibpzvkQAWuX8U405QYv0FXjh/ul7o2FXSQfkCf02Kfxx9LMA+ZCEMV7tV/oY9v+u2xvLpqNh+TT
	WVzplf0HAPUkNkY+pcOZKgQMkBjmIKTjXro1BmaTZIr5QBJ1e/n6DadYSXMFCcACBvd+5LtXGkh6+
	ktw48iww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbDN-00000001a28-2SUK;
	Sun, 16 Feb 2025 09:45:29 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjax9-00000001XP3-33zI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 09:28:45 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 71B472540111;
	Sun, 16 Feb 2025 04:28:42 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 16 Feb 2025 04:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1739698122; x=1739784522; bh=9vWrxkdJO0
	dfpBjkfIgsKAeydLi/izf9pI2P/yUQt9k=; b=TnS4ZvGcjmNcHcThPob+4lkFfs
	Ok8ynTUxDnN+HKzgPRPEALIFzPn98SqEAHWPRZpBhFPV/P/KY7+mu+QNSygKU5V5
	6afaY7ehh+bu1MmL6reNHPWIIt/WNAzMZc6u7RTNFSUhORBPqwdDiecaTm5JbVVQ
	/8HIwFaKdQcyzpCGlA/izjikJ1n59pLhe7/C4seme+Xyh1e1vehIavh0arz9qQN/
	oGoHkb9yjQy6nI2nKWj+OsSpYl6Xp2FPAvnpu6ABFDztTws4VtMNek1Vl2eH5FqA
	FIo7Pd1Oi0PkLl6s5ZvyTivWsJ5TqyVeDRhQcb+Yx9rWjUGI0LUhWkwRdxVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739698122; x=1739784522; bh=9vWrxkdJO0dfpBjkfIgsKAeydLi/izf9pI2
	P/yUQt9k=; b=b9KzmkmnUxRhqTAddNUkXycFSIsxBGbkytbKxvW61xgMPuA6Mgt
	CRTZx+0d5PTKtqw4elLVDU5zJUqk5Jw8z+HnyQiYh6ljZXDvaGBF+ZTr6Yo6xt5o
	m29QQbfWTCtpYEskA2lPBTsCOe+D97CItXm2fdo+whPasDLPcVnO0VxUWwRoqkFG
	+svztD9BU1dhmo8HDjnSAGF035ImxISC9PNCTmoW6/GNt3LoSZ8veE26Nr/D8nPl
	QuxAsA8m+LbL/qiBh6AuzIlCjU9HxgTLvo9p9g6UZHJaoRqjTdqdUN4Cswq0Zy+8
	dO+wvUvdL5HEzrSbR9bET/pLHk1COZzJDFQ==
X-ME-Sender: <xms:ya-xZxUytV8M8nzwIDu6_sTNrxiL-1IABXlRKKmVmqGr14Pz-uDPSQ>
    <xme:ya-xZxlNdzS5cFoDzfZ1YLMGX6CrDDy-zJPG4FDlDL48doZ9EQn2RF4wf3vMeukds
    GeA5vt7ZgeWvDeLyA>
X-ME-Received: <xmr:ya-xZ9ahfD4cG_NyG-HunaPVOLRZEvBgHRkhn-gpupYDV8HPT6e0zaX0lE-Dq6nOIgFBpkFrY4G2e4GnZH2kGRaX9XparWb_qWXFdJ6xfvxv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtg
    homheqnecuggftrfgrthhtvghrnhepfeejjefhjefhgfeitdellefhueekfeetueektdej
    vdeuueegudehudffkeevudeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgv
    shhtthhorghsthdrtghomhdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhr
    iihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthht
    ohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsh
    grmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopegrnhgurhgvrdhprhii
    hiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesgh
    hmrghilhdrtghomhdprhgtphhtthhopehkihhkuhgthhgrnhelkeesghhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:ya-xZ0WYop4DZMjFYPiDdruPnDaHqMVpPZKjWVNjdMw4pnbex0ZVFw>
    <xmx:ya-xZ7mX6BFiKxwlRvgG0Y6_YtzqAjR6C7jjwMqcxKugWqAmlmR2-g>
    <xmx:ya-xZxdsy2VWkCiwH_DUoaVtx4sAGzQDXveBjS-Gq5yjt4rYmW_Q8Q>
    <xmx:ya-xZ1FBiySdoogsmZLAs6oQ9VOpHXcWGXM9qYtH7nP6uXkzd6LCNw>
    <xmx:yq-xZw8ruD8YetD0qr29I-XT4-556R4xw5hnnd82dwNl5OKUbFOeYKxw>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:28:37 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 0/8] arm64: dts: allwinner: h616: add LCD timing controller and display engine support
Date: Sun, 16 Feb 2025 22:27:07 +1300
Message-ID: <20250216092827.15444-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_012843_853902_6ACCC1A4 
X-CRM114-Status: GOOD (  11.27  )
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

The H616 series of SoCs has an LCD timing controller as part of its display pipeline, capable of outputting to an LCD display, as well as HDMI and (depending on the SoC) composite TV signals. The pins are not exposed on all die variants, but the H700 variant is exposes RGB and LVDS pins. Building on the DE33 display engine patches on the list (https://lore.kernel.org/linux-sunxi/20250216085432.6373-2-ryan@testtoast.com), this patch series:

- adds the required device tree configuration for the display pipeline to the H616 (bus, display engine, mixer and timing controller)
- adds a quirk to the sun4i TCON driver for the Allwinner R40 (compatible with the H616/H618/H700/T507)
- describes the H616 RGB and LVDS GPIO pins
- adds the required pipeline endpoints to the device tree for the Anbernic RG35XX devices featuring this SoC
- adds LCD panel description, and required power supply configuration for the panel, backlight and GPIO pins for the RG35XX

Thanks to Jernej Skrabec for the initial out-of-tree patch for the T507.

Regards,

Ryan

Jernej Skrabec (4):
  arm64: dts: allwinner: h616: add display engine, bus and mixer nodes
  drm/sun4i: tcon: Add support for R40 LCD
  arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
  arm64: dts: allwinner: h616: add LCD, LVDS and PWM pins

Ryan Walklin (4):
  bus: sun50i: add DE33 compatible string to the DE2 bus driver
  dt-bindings: allwinner: Add TCON_TOP and TCON_LCD clock/reset defines
  arm64: dts: allwinner: rg35xx: Enable LCD output
  arm64: dts: allwinner: rg35xx: Add GPIO backlight control

 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 221 ++++++++++++++++++
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  64 +++++
 drivers/bus/sun50i-de2.c                      |   1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   9 +
 include/dt-bindings/clock/sun8i-tcon-top.h    |   2 +
 5 files changed, 297 insertions(+)

-- 
2.48.1


