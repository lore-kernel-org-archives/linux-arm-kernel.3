Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF84CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AWkoKbA9+qEs5hmTewD+yrKcvLlJBMSi9kqxdIrgkcA=; b=ydhwSM78C5d+OI
	i7gjF6sbaKkKw2FWmrWFUGjmp3fiVjY0/tQgv2WmKBYwte7QCSq3Ck08rksQVXDMG5l98cIyvQN91
	7jq6ij5rvDiGBdD/14hmushuitONStmkO1Qnbvr/artqoIyHI5X5qQKf6kyG4ybnSFcsnE4woGT4E
	D7s2xQP7tr38yaiPDWGGXmorEYfe+cDJfOP6w/EumcgSH4apVayfkj7XmLl+KSEM+1PLg6qtNSOhQ
	PToT3vD2ktRyizYgJfdAmilzOOOWnI7y7KFJpdBINH8IlNzlA1PWbN3PID0PuEQ7w75sNruwwzz9V
	pIxmcuIm4pAPOG510UeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw52Y-0000000A4Q5-2s4g;
	Tue, 09 Sep 2025 20:34:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw52W-0000000A4O5-0FBF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 20:34:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D33744212;
	Tue,  9 Sep 2025 20:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CE8C4CEF4;
	Tue,  9 Sep 2025 20:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757450046;
	bh=IsCF+MUxVzd13pKkvlXlP/Ccmh25UQn/2DMZZUacACQ=;
	h=From:Subject:Date:To:Cc:From;
	b=Pi/6Fm4aKrtyZmoD47MIk+2XEaNGEKSGvzDAEn7BW6R3SWBk1tfYPJQ207A+ukqIH
	 efbIfEZ3JJAOkF/ySBMoMAyOBPQFM/rw1nm0DvlStfj5EYoCTMhbHLxssuOoiL7B5G
	 fiPDeZjvxrgusL+VBIMP3ENfrl1tODwDB7ua0e4z5g99rsMjtSQdQwtzWoGVVgh7Gm
	 G0jhyoEaZWrE+LXt+63xAYwWJQHD0uvVIBfcH+skb6uIJbFquHPWVV8/8PNVJXDBP2
	 t7OikkrH0xFC+rS5B2rqNWT/aAw4lLZBptJbcly63rI2pE0XvJNNpFfE3gBSZP3SA4
	 jR48JpShhwd4g==
From: Andreas Kemnade <akemnade@kernel.org>
Subject: [PATCH v2 0/3] regulator: sy7636a: define and init all resources
 needed
Date: Tue, 09 Sep 2025 22:33:01 +0200
Message-Id: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6OwGgC/22MQQ6CMBAAv0L27JqyagFP/sNwWOsKjaYlW0Mkp
 H+3cvY4k8yskES9JDhXK6jMPvkYCtCuAjdyGAT9vTCQoZPpjMW0NPZgUZM6dGSY7Y2Z3BFKMak
 8/Ge7XfvCo0/vqMs2n+uf/f+ZazQo1LaWu2K5uTxFg7z2UQfoc85fHj9F1qcAAAA=
X-Change-ID: 20250906-sy7636-rsrc-c20aa6baa2c4
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=IsCF+MUxVzd13pKkvlXlP/Ccmh25UQn/2DMZZUacACQ=;
 b=owGbwMvMwCEm/rzkS6lq2x3G02pJDBkH+vnPTTxzUXRhTfqE6mvGl+aE77f6I6JQGK0QmHhN4
 Zf4rbc7O0pZGMQ4GGTFFFl+WSu4fVJ5lhs8NcIeZg4rE8gQBi5OAZjIl2aGf4pvBO/b9M6u6vkd
 Y/8qc1GWt7Hm7ZkdLDMeCF62+vkkZwsjw8lGzbfLLI4ZO95qO3I0TEjZZo67WB4PU8qeOUsadJz
 3cQIA
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_133408_142559_9B9F56B7 
X-CRM114-Status: GOOD (  12.23  )
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

The SY7636A has some pins which can be hardwired or used to have more
more advanced power management available. As several devices containing
this regulator have these pins not hardwired, but instead connected to some
GPIO, enhance the driver to have them defined and initialized.
Also add the ability to power off the chip completely by defining some
input power supply.

Actually implementing better power management is planned to be
implemented as a second step. The regulators in the SY7636A should only
be on for a short time during display refresh, but currently they are
unconditionally forcefully enabled by the hwmon part of this chip.

Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
Changes in v2:
- en[-gpios] -> enable[-gpios] in yaml/dts/driver
- fix en vs vcom_en in error handling
- comment delay
- drop applied commit (rebased to regulator/for-linus)
- Link to v1: https://lore.kernel.org/r/20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org

---
Andreas Kemnade (3):
      dt-bindings: mfd: sy7636a: Add missing gpio pins and supply
      regulator: sy7636a: add gpios and input regulator
      ARM: dts: imx: e70k02: add sy7636

 .../devicetree/bindings/mfd/silergy,sy7636a.yaml   | 16 +++++++++++++
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi              | 25 +++++++++++++++++++-
 .../arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts | 24 +++++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts | 24 +++++++++++++++++++
 drivers/regulator/sy7636a-regulator.c              | 27 ++++++++++++++++++++++
 5 files changed, 115 insertions(+), 1 deletion(-)
---
base-commit: c05d0b32eebadc8be6e53196e99c64cf2bed1d99
change-id: 20250906-sy7636-rsrc-c20aa6baa2c4

Best regards,
--  
Andreas Kemnade <akemnade@kernel.org>


