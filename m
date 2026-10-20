Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E5460A260B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=av8nbhEY;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=XUfQyvgt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ztv0HJ8l22RRsNhgDD2bkXEQ2puahy2KotEJnS3/Ydg=; b=av8nbhEYhaMcFX
	FuJgmJemud9A2TqxoD9MQBgvseL8qWECdq7GZGvyVscn72xAIoBU96Dm/xBFwJg90D0rH/H5niQGX
	YW2pci2bdTBy7r0n1Fnt4EwCzE4i+FNl/xYwhCh5N3ROCrXRp7v29iccKkET1GyrhvgpbVboVJnZg
	egKuG2HGXU1Q09JtY2WneB0oIdxGtn5gJmpe2CYPcnOZvIkgWXUo725AaLINv1OugQoQdY9DpwXjJ
	KulltGBP6BmqF0BX+5vsCCUZ368Mke2nypynb8Usq6Dj5eMRszsjyRjpHj6BEsw3Ga8HKAZ/pjdYg
	axNu1EEq5fwQ+rldZ4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBIP-0000000A0fA-0niG;
	Tue, 20 Oct 2026 14:58:33 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBIL-0000000A0aj-2I1L;
	Tue, 20 Oct 2026 14:58:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20F43A02DC;
	Tue, 20 Oct 2026 16:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1792508300; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ztv0HJ8l22RRsNhgDD2bkXEQ2puahy2KotEJnS3/Ydg=;
	b=XUfQyvgtMIFS9NUybNkk3G15CGBu9TocD6/t68NAvHfY8yTD5ZDTrcJiQLAuLdnoVTkwh7
	9J5snnKJFFnYJSqDvuBX4QvV70VO0spX6/DmcmUvXkVLZWyZlHDcH6/RezGHwz9IhB6CTq
	k5kxCDLLIt03//O5Pc0hqQiQywk/IxWUbo5d3RJ0+zV7FvGDFL44ypsGTQLZ8EZRKY8DYK
	0yw91bL1OB1H+VChen/EriIIeMXiAaAv31wteLNr2VU5v4tmAwhv/ytsk7f8KYSc3RTNfI
	WM0672a3sMi1Srp2n8KiKKyIcnCcXUdfNCA0fxqJrjKreYo9IFbre7jreAopww==
From: Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH 0/3] clk: bcm2835: describe the BCM2711 GISB clock for the
 GENET MDIO controller
Date: Tue, 20 Oct 2026 16:58:08 +0200
Message-Id: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CQAxG4VchXduETgxeXsW4mCk/WEU0UyQmh
 Hd31OW3OGchRzY4HauFMmZze4wFsqlIL3HswdYWU6hDI7UEbjFj4KT3sBPh3jyxDjfWbg9EOei
 2iVTiZ0Zn79/4dP7bX+kKnb43WtcPNgwxmnoAAAA=
X-Change-ID: 20261012-devel-bcm2711-gisb-clk-cf8eea19c46a
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>, 
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_075830_123822_4EA205CF 
X-CRM114-Status: GOOD (  10.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The timestamped MDIO write series [1] needs the reference clock the
GENET MDIO controller divides its MDC from. On BCM2711 that clock is
not described anywhere, so 5/5 of that series hardcodes 200 MHz behind
a compatible match, and mdio-bcm-unimac's clock-frequency handling
assumes the 250 MHz of the STB chips.

On BCM2711 the MDC is derived from the CPRMAN generator at 0x1d8, which
the firmware calls gisb and has always run at 200 MHz (PLLD_PER 750 MHz
/ 3.75). Changing that divider at runtime moves the MDIO busy time by
the same ratio, see [2], and Phil confirmed it from the
Raspberry Pi side. GISB is the register bus of the STB peripherals,
which is where the driver's 250 MHz default comes from.

This adds a clock id, the generator in clk-bcm2835 (critical, the
firmware enables it and nothing in Linux owns it) and a clocks property
on the mdio node, like Stefan did for EMMC2.

No functional change by itself. The driver only looks the clock up
with [1], and only for the timestamp bounds. Making
unimac_mdio_clk_set() use the real rate is a follow-up, as that moves
the Pi 400, whose clock-frequency = <1950000> currently lands at
1.56 MHz instead of 1.95. The limit is a level shifter on that board,
so the follow-up keeps it at 1.56 MHz.

Patches 1 and 2 are for the clk tree, patch 3 for Florian once the
header is in. dtbs_check clean, booted on a CM4: clk_summary shows
gisb at 200 MHz under plld_per, eth0 comes up as before.

[1] https://lore.kernel.org/netdev/20261009143506.2507607-1-jjc@jclark.com/
[2] https://lore.kernel.org/netdev/60accbd89cfaf0d4be1da5ec2fafd975@tipi-net.de/

---
Nicolai Buchwitz (3):
      dt-bindings: clock: bcm2835: add the BCM2711 GISB clock
      clk: bcm2835: register the BCM2711 GISB clock
      ARM: dts: bcm2711: give the GENET MDIO controller its clock

 arch/arm/boot/dts/broadcom/bcm2711.dtsi |  1 +
 drivers/clk/bcm/clk-bcm2835.c           | 16 ++++++++++++++++
 include/dt-bindings/clock/bcm2835.h     |  1 +
 3 files changed, 18 insertions(+)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20261012-devel-bcm2711-gisb-clk-cf8eea19c46a

Best regards,
--  
Nicolai Buchwitz <nb@tipi-net.de>


