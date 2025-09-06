Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF53CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qK9pnZrRTXp3oKk9VgMhaESahqe+P31eLaiWi34USQ8=; b=QCt78nf7QX6UPh
	Q91ACyT/5z71/NmzmzBVlnKjuU7sZDb07YpXZXlGoQvxepyFGdySLET2ix3ZH1n8yscO5j0P5U9pb
	wj4eycWx90L9yBEM5I4EkBtSYMclUmclAXdn/J/A9TXH5TcOXRWNrUfzn3t4jOJJF0bgZc2Jbo1DJ
	pum1CmLNq2T1Vsduwk24+qJFxcnpEDxXylGmfmHiWaIAXxos7kyqUmtESBnYvupXdep+LLOS67FGW
	hRxyNCjWaoY8ipvNT31O6NoGp+jDK/OPd/Kn3drK2XKrPTS/0plZVg/fwJlC5kIpfATZ4TLa120yE
	BjV4llWN302jFamW9isQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuoyc-00000007IYC-16Bi;
	Sat, 06 Sep 2025 09:12:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuovl-00000007HNd-0nzE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 09:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91B2B601B8;
	Sat,  6 Sep 2025 09:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AC4C4CEE7;
	Sat,  6 Sep 2025 09:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757149796;
	bh=oUpwW1ukVVMWcU3O8pfRmoB6AzDVF2v4yYJ6GaL05Uw=;
	h=From:Subject:Date:To:Cc:From;
	b=OTzLPc+WVYmA1rfUZ5A3YXIpvrvHpSjY5VPYXb55h+sTCVxk2zyhWNq+qeKJUUNLA
	 k/YSpGU/li2N+YSWsqK+g3Yr9jkkGBkV0zLFLnatNATbK3WiIv3075EGSt0YvJGJAV
	 RS/8fLMKTqVV1YilXZHTOqJIVOaLv4DixBc5zCqS3rXccN9C8+35ruw/OVzuM0Uckj
	 3QM+U0z+NCNMBirgmxKpCiCyTqhYeEUg9qOVfZxzddCHaHkXdnrBZ7LoqYSIqOaCHi
	 wh6eUGHU3IludvLeEAlkrayk/ypmcoL0DMOqVZ9oUnexLZQF9udz/hB9qtmfB+YdE3
	 KmLLEPjBT+gew==
From: Andreas Kemnade <akemnade@kernel.org>
Subject: [PATCH 0/4] regulator: sy7636a: define and init all resources
 needed
Date: Sat, 06 Sep 2025 11:09:11 +0200
Message-Id: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADj6u2gC/x3MQQ5AMBBA0as0s9akigpXEYtRg9kgM4mQxt01l
 m/xfwIlYVLoTQKhi5WPPaMsDMQN95Usz9ngnW9c54LVpw1VsKISbfQOMUyIPtaQi1No4fu/DeP
 7fuDWrjRdAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=oUpwW1ukVVMWcU3O8pfRmoB6AzDVF2v4yYJ6GaL05Uw=;
 b=owGbwMvMwCEm/rzkS6lq2x3G02pJDBm7fznmaR6y7Oc9/ffw/+iZ5/59lei0iXD3OTnje/hF7
 ZeB5rqvO0pZGMQ4GGTFFFl+WSu4fVJ5lhs8NcIeZg4rE8gQBi5OAZjIyi0Mf3h/cGwWfpHx7d+P
 7zN8JBbPvBrJ2dovHCF7THnZ9L2SiTsY/icaOPTsXV6ePi+seqXBVGPj7M1aMh9juQSWPMw7fHT
 Pfh4A
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
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
Andreas Kemnade (4):
      dt-bindings: mfd: sy7636a: Add missing gpio pins and supply
      regulator: sy7636a: fix lifecycle of power good gpio
      regulator: sy7636a: add gpios and input regulator
      ARM: dts: imx: e70k02: add sy7636

 .../devicetree/bindings/mfd/silergy,sy7636a.yaml   | 16 +++++++++++
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi              | 25 +++++++++++++++-
 .../arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts | 24 ++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts | 24 ++++++++++++++++
 drivers/regulator/sy7636a-regulator.c              | 33 ++++++++++++++++++++--
 5 files changed, 118 insertions(+), 4 deletions(-)
---
base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
change-id: 20250906-sy7636-rsrc-c20aa6baa2c4

Best regards,
--  
Andreas Kemnade <akemnade@kernel.org>


