Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F90FD3774
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wHKdwAMNEz9YwMlr8EqS0oQhOrg5q+vUv7LPu03mT64=; b=hYCNeCETK3YWL8
	ziP1DSjQH58pccux2yEK08ZNjSfom+QBqCM7NhXQNtlE7+ocI7zPUtMseJw2Bn6szsJJSzc9a38yj
	v6P4SmRZS/ccUDw2REx2dGRnP3t0Tn/ikrlSBeWUzekCL6g1zdWzklRwm/tSy35cPy0WrjOZvULDr
	v5shfYrPdfNY2xsv2A+OGjWqpw6lPva7CXPZ/6j50ETMeV30MhWQuY3z3s3pEoeK4Bv+B8K7Z53h2
	WKcqpJRTeWiBLaOAsaN3BW8cuTZAcSJ+D9qeIZ0zQBTsyRvP1nU7bCRdgvyYA0TacnnunGT7YxdXJ
	SUFm8hZyS94kMHVwLEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHru-00000004XF7-1S2f;
	Wed, 25 Feb 2026 16:36:10 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHro-00000004XE7-40Bc;
	Wed, 25 Feb 2026 16:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=wHKdwAMNEz9YwMlr8EqS0oQhOrg5q+vUv7LPu03mT64=; b=zfjSHjNeqN0+aHPGFacwcMU2xT
	AeynVr6e9UBRY5NiqaFsK9zHOP+4w4YW0+9U1WpDWeMfPeb0El+uNrSxvCgPhc1ZilmgqGZYvWTn+
	62o10n4C0w7n3ptZocHFu6PH9+QOTsAPuccNX0yAxyEXJTbBU2e2Z6CPf1ZL9SEO1JyY=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:47746 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vvHDH-0005uT-Ix; Wed, 25 Feb 2026 10:54:12 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robin@protonic.nl,
	andy@kernel.org,
	geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	hvilleneuve@dimonoff.com,
	mkorpershoek@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lee@kernel.org,
	alexander.sverdlin@gmail.com,
	marek.vasut@gmail.com,
	akurz@blala.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	hugo@hugovil.com
Date: Wed, 25 Feb 2026 10:53:57 -0500
Message-ID: <20260225155409.612478-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH v3 0/4] input: add GPIO-based charlieplex keypad
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_083605_097872_99C30B9B 
X-CRM114-Status: GOOD (  15.37  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hello,
this patch series add a new GPIO charlieplex keypad driver.

The first two patches simply commonize two properties that are present in
a few bindings, so that the actual patches for the charlieplex keypad driver
can reuse them instead of also redefining them.

I have tested the driver on a custom board with a Solidrun RZ/G2LC SOM
with three charlieplex keyboards, all connected thru a single PCA9416 I2C GPIO
expander.

Link: [v1] https://lore.kernel.org/all/20260203155023.536103-1-hugo@hugovil.com/
Link: [v2] https://lore.kernel.org/all/20260213171431.2228814-1-hugo@hugovil.com/

Changes for v3:
- Add ASCII diagram in bindings, and reference to it in example
- Reorder properties alphabetically
- Add patch to define common input settling-time-us property
- Add patch to define common input debounce-delay-ms property

Changes for v2:
- Fix yamllint error for example
- Remove unused debug variable (nkeys)
- Remove support for custom linux,no-autorepeat DT property
- Remove support for custom gpio-activelow DT property

Thank you.

Hugo Villeneuve (4):
  dt-bindings: input: add debounce-delay-ms common property
  dt-bindings: input: add settling-time-us common property
  dt-bindings: input: add GPIO charlieplex keypad
  Input: charlieplex_keypad: add GPIO charlieplex keypad

 .../bindings/auxdisplay/holtek,ht16k33.yaml   |   5 +-
 .../bindings/input/cirrus,ep9307-keypad.yaml  |   7 +-
 .../input/gpio-charlieplex-keypad.yaml        | 106 +++++++++
 .../bindings/input/gpio-matrix-keypad.yaml    |   5 +-
 .../devicetree/bindings/input/input.yaml      |  16 ++
 .../input/mediatek,mt6779-keypad.yaml         |   1 +
 .../devicetree/bindings/mfd/fsl,mc13xxx.yaml  |   2 -
 MAINTAINERS                                   |   7 +
 drivers/input/keyboard/Kconfig                |  14 ++
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/charlieplex_keypad.c   | 213 ++++++++++++++++++
 11 files changed, 365 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
 create mode 100644 drivers/input/keyboard/charlieplex_keypad.c


base-commit: ab2e361ca97a42b7af8be1d273646b30d3b75bf3
-- 
2.47.3


