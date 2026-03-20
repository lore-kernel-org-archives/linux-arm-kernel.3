Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E27108B916
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vp5vpsrgGynCEXTWY7d25hwmYtHsPR9BeSeV6eOnFM4=; b=bVO5uQxmAuZHTr
	7K4RcGzi25dWmI3/oKh2nrJRMZWe181kr1xaDthJaXpjhLUvDfsBm8E2kGjui8QkB301z5J033qhS
	VxASfQ5HlJxB8MgjdBgK5znwbPaR7VsdcfuHooEZplaDzokOpSuADoQDvSgcxBPTYGdpk86TdWtTS
	dagOmShB8ygEbflXrXYMUcMDwSVYKeBx3abseT7fPvbnoaPL86ApXeWXmdAEM8u5YTVGEtKR9iyxO
	8/rQYpEJW+3RypFOvKEotbAVw9DWAZ1fiMZRtCH8t3EUzflyvmZYkhnbeAAicG7K+HmOWcwIGG422
	avqCZlybtA78AxiRIbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtD-0000000Cl5m-0ur0;
	Fri, 20 Mar 2026 12:23:43 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtA-0000000Cl59-0rjT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:23:41 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id E4AC813800D7;
	Fri, 20 Mar 2026 08:23:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 20 Mar 2026 08:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1774009418; x=1774016618; bh=vp
	5vpsrgGynCEXTWY7d25hwmYtHsPR9BeSeV6eOnFM4=; b=OfIMbLHCeYetfjS2QD
	iaIyk7LGNtMja47diILroL4QAuTGt0XSKK296m0pGA1z+Vs+MDodV6aeY5+Y6Bna
	d9o/s3tMQopb1NLuZ4Clb5HSDPQ5GBevrNnPC8PZYWvhID9KGpHsXGpaNSUjgLP5
	a1HfP1gDaS9rvQHuDzQ4lBy7ukEBT0rKvog6f4crHXrXdlFyHYro+A5oy9ladteH
	UmHP1LIWFQJBct4HBN77WsSz1BHzuWGMX/JjlKlak+s5Zj3qIrSEW9gglXXsWH9n
	WznRZWxSmEqlHQLz66GDquLkyka0xIIQULRjcpLsKkHLzxab98eoSRGBBgUlqToQ
	6sWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1774009418; x=1774016618; bh=vp5vpsrgGynCEXTWY7d25hwmYtHs
	PR9BeSeV6eOnFM4=; b=HnXeVY3ZckUVA58JrrQLhRJeTnxfBNryuCqC7Lt/Qn6E
	lwFgqwIgG+Xq0ETzyJXn8d1OYkPdya3Sdc+qXecKmCtLnUMWhkiR5XYxF0cVYgjG
	5Kg1RdtDIPDLDO1ZwmOXcxw3SlPuKVJ/vjVLEOmXZL19tkRGwufODdmaOzc+vCDt
	JriQQrq2Nj2pzvVDKHLUIJ9UsystbeVnvyL0qJte9WYBgjdYzvCeVuQFaQWAoTDw
	aWX+HpzYlPkmA7u7QBvJygqIMHt0Mql5XsijHUVfsi1Iueqhoiw4Oq1YsaUZJM63
	vTnYiNTJEQXh60zDDO1zxMDY5d2z1kvY3gszkXyt1A==
X-ME-Sender: <xms:Sjy9ad1ItbEf2PWzpeW_p5wGjSRI-YCLDDw7_j3xGrYLSPL94ZumWA>
    <xme:Sjy9afGkPs2hA3yZGrRVbykayZRVBj8-CulTzs7tY2_x4bXn0gytA4mjPa9U73DeP
    YqjuSyMW35ZeTfWojqwk9oXO7cGvrm2URtq95v6s2MChxd3Me34jg>
X-ME-Received: <xmr:Sjy9aUgT0YZGkX4cCoBxxxvVc7A95sflkkZS9beMAGMldv2bsKKVDGhG4mdxQqXB2coRCTphXogpZjF6MP1a2VgOCxHkLJvdPVJNGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepueelgf
    fhfedvgeelfeduuefhfefhjeeihfffueefjeeihffhheeuteeuvdeuhffhnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepvdef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihgthhgrvghlrdhrvggvvhgvsh
    dtjeejsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhushifsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggv
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkh
    gvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvth
    htvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtges
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Sjy9aYf3AHRaW_UpygGmBVjs_4bpPiGUSCh6gZ3wcKgxDHTpcZXbLw>
    <xmx:Sjy9aazUMdXiXgf1Rw30tXR7WnWIbbtQGkdpDZacZrMetgNDQYDcIg>
    <xmx:Sjy9aSZEfBrcEf6tsUV6b2wIqatNN_8cmT5s8XQ6gwE1VvnlHtWPbQ>
    <xmx:Sjy9aYJ0ddtXxBSF1vv3LX9-wnOFAgWq6Fai_vVQwnlzyqxAz3G1Yw>
    <xmx:Sjy9aSZU8XUOM3grg6K5NBA8Uoyahp-UUIimdgVCtrFzskBMfYuaYDCs>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 08:23:37 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/9] Initial Apple silicon M3 device trees and dt-bindings
Date: Fri, 20 Mar 2026 13:23:18 +0100
Message-Id: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADY8vWkC/x3MSwqEMBBF0a1IjbtA4w97K42DInlqgaZDIiKIe
 zc4PIN7L0qIikTf4qKIQ5P+fUb1Kcgu4mewumwypenKuhpYQljBW83qdVdZ2eXKYo9A4ta2TSd
 u6HsxlBchYtLz3f/G+34AHnfH8G4AAAA=
X-Change-ID: 20260319-apple-m3-initial-devicetrees-5c546ad977a2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2705; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=JxhD5pyU9TlybIWgDe9thdmFXajEwZfzNZlK9i5a+8A=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsy9Nu6rPrWZBjtWxbX0vq5Q7L754tARZ53PcUICVrUqm
 u4pP1Z0lLIwiHExyIopsiRpv+xgWF2jGFP7IAxmDisTyBAGLk4BmMjTX4wMTYU/n1QZ/s7OO6Xz
 ymSv4kSnp5O2LVVQmTmj3u2v2+FbBxj+O9dPjIl8ZWn2pFxz+71ONYfr0g9to1fGFsxan1Yk9+A
 yKwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_052340_319376_5B34A940 
X-CRM114-Status: UNSURE (   9.42  )
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

Hej,

This series adds initial device trees for M3 Apple silicon devices. The
device trees contain only a minimal set of hardware not going much
beyond the minimum required for booting kernel and initramfs and
verify via serial console that the hardware and drivers work.
The hardware with the exception of the interrupt controller is
compatible with the M1 and M2 SoCs and the existing drivers.
Changes for the interrupt controller were sent separately in [1] and are
picked up and in linux-next. The device trees pass make dtbs_check with
the apple,aic2 dt-bindings change from that series.

Link: https://lore.kernel.org/asahi/20260223-irq-apple-aic3-v3-0-2b7328076b8d@jannau.net/ [1]

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (9):
      dt-bindings: arm: cpus: Add Apple M3 CPU core compatibles
      dt-bindings: arm: apple: apple,pmgr: Add t8122 compatible
      dt-bindings: power: apple,pmgr-pwrstate: Add t8122 compatible
      dt-bindings: watchdog: apple,wdt: Add t8122 compatible
      dt-bindings: pinctrl: apple,pinctrl: Add t8122 compatible
      dt-bindings: i2c: apple,i2c: Add t8122 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t8122 compatible
      dt-bindings: arm: apple: Add M3 based devices
      arm64: dts: apple: Initial t8122 (M3) device trees

 Documentation/devicetree/bindings/arm/apple.yaml   |   18 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    4 +-
 Documentation/devicetree/bindings/arm/cpus.yaml    |    2 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |    4 +-
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    4 +-
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    4 +-
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
 .../devicetree/bindings/watchdog/apple,wdt.yaml    |    4 +-
 arch/arm64/boot/dts/apple/Makefile                 |    5 +
 arch/arm64/boot/dts/apple/t8122-j433.dts           |   19 +
 arch/arm64/boot/dts/apple/t8122-j434.dts           |   19 +
 arch/arm64/boot/dts/apple/t8122-j504.dts           |   37 +
 arch/arm64/boot/dts/apple/t8122-j613.dts           |   35 +
 arch/arm64/boot/dts/apple/t8122-j615.dts           |   35 +
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |   48 +
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          | 1149 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8122-usbpd-i2c.dtsi     |   32 +
 arch/arm64/boot/dts/apple/t8122.dtsi               |  444 ++++++++
 18 files changed, 1859 insertions(+), 5 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260319-apple-m3-initial-devicetrees-5c546ad977a2

Best regards,
-- 
Janne Grunau <j@jannau.net>


