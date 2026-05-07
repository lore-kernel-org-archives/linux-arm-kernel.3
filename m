Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346C9CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=obaRYY9JzXNdH88KlhAeQWbZmg1Lx4Y8Y1HPVUVLH7s=; b=bnpwWK21ZI4Zjs
	OPTlYmbM9wNssod46CD9SN8BrkJb2wrLGNgAC3eNALP6oqSAia/JbtZ2TdPXfnn5USx8ur15ZJ786
	UDZHd95uOqLmtQw1/0HMf/CbCSlplZXI6JHh2o9PurPYePFBkdkBX8oSxWkihDmx0eoiaUIRRyQ17
	GSv37lcamjt+Ij2DU0bGhRq8H8SrXmvgC7c2H7uTJ+OUCCT0zIv2jESWheU+xGJpdaLvhB7bv1GX1
	jyRBFhQ5Dp9kkkzwZsxP/ulNtirWUp3wQF2l7UtVof04l8PdGA8rr1EzjtE+dHNUJ8o0V9bl33c5f
	dOB8P0C+Ts/8KuFV84Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtEa-000000032AA-1l8y;
	Thu, 07 May 2026 07:33:24 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtEY-0000000329f-3sgq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 07:33:23 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1BD8014000A9;
	Thu,  7 May 2026 03:33:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 07 May 2026 03:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1778139202; x=1778225602; bh=ob
	aRYY9JzXNdH88KlhAeQWbZmg1Lx4Y8Y1HPVUVLH7s=; b=BFoTC7sApuZKlWxBx5
	+usWZD/Gro5rpeB2DD/9LUtgW+KwsZxfaQ0/hEeM5/JkStz37Fl2zbS23Le1aaJp
	Zz1+HG1t5HVneTcYLtkhmuM3xDMMWuo13VXYwXsEHXOgLqLWGSHtck7JdjWBlmYt
	sYhtNuyHlk2AcXIzf3Ts7THuqMPNyqwtF1qSg10iza/HhvQ3Ab0dJ9yPdeOcX2lf
	vdNf/jf7kuihd0T4WO5x6PldWkuiwNhmhoSjh3l9bEbtxCieXhzGOwPW4CB7dCcs
	pjl7a/0DWKBL2GSvV0IX1Zn03u8s7HNkqaC75UluD/Nuk7RhPr7XvNxrRywHKnQ8
	hvTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1778139202; x=1778225602; bh=obaRYY9JzXNdH88KlhAeQWbZmg1L
	x4Y8Y1HPVUVLH7s=; b=QKxinEHSN6lIpgBWAmIp9TYQR0x6LOW/sXj0FjG2F4Qr
	cZ5QLNPTG53trqofjNvrcbxeaeLJnGRHbuzr36S0KLSariBNc7oCIKzcMHi7+jhd
	2OJdaL26SQFNExvk3Y3CiSrTk8VigH5TYILrzNDj0u1cFzKAjPVca1oP7lUYDvxb
	YPdJT+Lop6MYDKDRejtq24QgCu+iXWv7/jryc6oFNvRFneacKBqPLzIr28kme1KZ
	W3HZO3asghankiOOsILa7kF2GnEvQ7aLcHGXdYBp08Y1g2jsyxFGf3uy2LKcdzzi
	OwByPvNEgGnnBw4at27P0qiciRlnO3zd0V8uskF92Q==
X-ME-Sender: <xms:QUD8aXvoqNaInCsWo4L-piFTFezYVujEfLIGf0M3QmXT_sWrnGzE8w>
    <xme:QUD8afgUieJkm_l4y4t2SwlxpXBl41EQ1HMdDBo_q48niDr3yLfBq5bkg7_bQTNww
    UI3XEf9w1KGxk54KFeBlPsDKINMClaXTOlnfaz8uD3qXKPOCFsmVMo>
X-ME-Received: <xmr:QUD8aSffngvcYKyw-3RfI17UGDESGUI88OM7wcR1_yJNfInLigetknz_r1fVh6W0sdTK7pp4nTTT5fSj8TKdZLb1I2_8JmBvByqmsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdeikeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepueelgf
    fhfedvgeelfeduuefhfefhjeeihfffueefjeeihffhheeuteeuvdeuhffhnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepvddt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhp
    rgdruggvvhdprhgtphhtthhopehukhhlvghinhgvkheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:QUD8acnBJAO8PYUMFX4rJwgoLKq3KdUfZbl_iPgz6ErxjHsmcYIMNQ>
    <xmx:QUD8aUomx87W9ppOpkibHg40btOx2hZ6deDS7rShW6wqnR6Q4pTaCg>
    <xmx:QUD8ab96Ow2VzIj2QbZvz3Ya25TobhNgac2rqSgzTlOjL8qBryOcFA>
    <xmx:QUD8ad3h3XdB9bmr6j0Q3T0xrTzlRF6dA64pbwjPEQvAWjEIYRd5CA>
    <xmx:QkD8aX85hs3TiruHTUdJOIhBjwBKGdqih7I50og5PORDdgOEqUJPJ3wv>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 May 2026 03:33:20 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH v3 0/5] Initial Apple silicon M3 device trees and
 dt-bindings
Date: Thu, 07 May 2026 09:33:06 +0200
Message-Id: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XQyw6CMBAF0F8hXVvTB+Xhyv8wLioMOgYLtqXRE
 P7dgiTGjS7vJHPmZkbiwCI4sktGYiGgw87EIDcJqS7anIFiHTMRTGRM8pLqvm+B3iRFgx51S+u
 4VYG3AI6qSqWZrss814JEorfQ4GPhD8eYL+h8Z5/LtcDn6QoL9hsOnDKqilQAB1lKXeyv2hg9b
 A14MstBfDTF1B9NRO3EKtFIxUtg8KVN7+IW7kN8h1/bT9MLCtbuYSwBAAA=
X-Change-ID: 20260319-apple-m3-initial-devicetrees-5c546ad977a2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Kettenis <kettenis@openbsd.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Joshua Peisach <jpeisach@ubuntu.com>, 
 Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3514; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=oNNEw9bLdFvVnMGexbn1rELFpbY8zSMmrT7OEjZH3no=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsw/DnYzjtukxMfXB8zd96D21HxNiyL3sqRNdZnLJ2c6b
 vHlY1zWUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCLu5owMp3pbr06rOVzYrv+b
 KdNdauXefeIKrZXnOiVXyF1cOk1+L8M/8yMfBdV3Wr3aLHzQv9a9cXdE0pr3LwWc7M+UTLui938
 tDwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_003323_100580_8A1FFBE7 
X-CRM114-Status: GOOD (  12.97  )
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
`make dtbs_check` depends on the already applied and dropped apple,i2c
and apple,pmgr dt-binding changes.
The watchdog load depends on stalled and forgotten addition of the
"apple,t8103-wdt" compatible posted in [1]. I've replied to the thread
to get the change merged.

Merge strategy:
Apply whole series via apple-soc / arm-soc to keep `make dtbs_check`
errors minimal. Otherwise no dependencies between the patches.
I might want to send another series which depends on this later in this
cycle.

Link: https://lore.kernel.org/linux-watchdog/20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net/ [1]
Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v3:
- adjust reg size of pmgr node to fit all its childrens' regs. Improper
  size was caused by a bug in the script used to convert Apple's
  power-states into DT nodes
- drop picked up changes from v2:
  - [PATCH v2 1/6] dt-bindings: arm: apple: apple,pmgr: Add t8122 compatible" (for v7.2-rc1)
- Link to v2: https://lore.kernel.org/r/20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net

Changes in v2:
- specify merge strategy
- rebased onto v7.1-rc1 and thus dropping the aic3 comment
- collect Acked-by and Reviewed-by: tags
- drop already picked up changes:
  - [PATCH 1/9] dt-bindings: arm: cpus: Add Apple M3 CPU core compatibles (in v7.1-rc1)
  - [PATCH 5/9] dt-bindings: pinctrl: apple,pinctrl: Add t8122 compatible (in v7.1-rc1)
  - [PATCH 6/9] dt-bindings: i2c: apple,i2c: Add t8122 compatible (for v7.2-rc1)
- Link to v1: https://lore.kernel.org/r/20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net

---
Janne Grunau (5):
      dt-bindings: power: apple,pmgr-pwrstate: Add t8122 compatible
      dt-bindings: watchdog: apple,wdt: Add t8122 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t8122 compatible
      dt-bindings: arm: apple: Add M3 based devices
      arm64: dts: apple: Initial t8122 (M3) device trees

 Documentation/devicetree/bindings/arm/apple.yaml   |   18 +
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
 14 files changed, 1848 insertions(+), 2 deletions(-)
---
base-commit: 37a578184d32b2e8110aa88c1c1fd10a23419e01
change-id: 20260319-apple-m3-initial-devicetrees-5c546ad977a2

Best regards,
-- 
Janne Grunau <j@jannau.net>


