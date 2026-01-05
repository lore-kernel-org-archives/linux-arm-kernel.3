Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C7EC79F81
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6eM60ItKlUGDQjOgClkUabzHQ/uw2le+PxyFyRkX8dE=; b=dzqcEy8ONlwpJ+
	aAkxGhtlk4bFpmDLGLpxbp3zDYbyMJUVmMPZGpTJsIOyq0QFxoKAxnYhn9ccrxetclfF77isizfvA
	fw5X2Jb3d8TklFP4+dhJoohEiqshppy4CDFDOjDGWdFSOd5eNynvRI+5231JLiozzh0KUoAAy0C8w
	TPoNiPXfQ34pSnxTdKdulCyWLZAuQOH8QYS+J86hVB6yFS0yIp3nCdwpRKUIQKoCm57QsGtPW+EvI
	/CONih5kIJe3hWQYGD5sEd8TdSYiuxwvFUq48eBF2HXyFk+Qn2Q2YVc6sQTsJNo+3BUeOMZbHVkqW
	2/MlpNUaZyxghRCECCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjO9-0000000BFIV-3Y5P;
	Mon, 05 Jan 2026 12:08:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjO7-0000000BFHp-1cLs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:08:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB36E43D21;
	Mon,  5 Jan 2026 12:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301D5C116D0;
	Mon,  5 Jan 2026 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767614920;
	bh=lp4eIMOna4MNieJ1lmI1P3hAqicQqw8PUE7YM6WWrBo=;
	h=From:Subject:Date:To:Cc:From;
	b=ID9ZupHVCxPPBdwz3tsRPoyomM9SXndk90YXjvWQ2e+oCfKcMM1gg+96JYAyjyycT
	 iP/D7jJTPsRaYvNo/2Noq8Nz6MwoqdMG75ya9lkc6/MVHivBxkWtQLCgCiF8voFZH8
	 fTU/KhiimPEW0meAe6uh99I4EYHqEYS0KK67srWbkxeMsLZjPa95/ekdNuYuWnuA/c
	 fesNK66CwkacL1+J+6rQ0rKWeCWd7zVcQOWQhZK+Bws07R9wGn6gKMyGp++u2xnIrQ
	 e5FdJ92R9EINGl04nuSKa8SSb/YxWQD8NYzV+V88P0g57Wkc0dGllVKZlld6tYgKmD
	 0hz5ln8HV1hxg==
From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH v2 0/3] net: stmmac: socfpga: support both stmmaceth-ocp
 and ahb reset names
Date: Mon, 05 Jan 2026 06:08:19 -0600
Message-Id: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOpW2kC/23MQQrCMBCF4auUWRtJxkQbV95Dith2bAe1KRMJS
 sndjV27/B+8b4FIwhThWC0glDhymErgpoJuvE4DKe5LA2p0BtEroWdIdAndrKw91Ptd7VvtEMp
 hFrrxe8XOTemR4yvIZ7WT+a1/mWSUVs5b9Ja0bXt7upNM9NgGGaDJOX8B8CfCQaUAAAA=
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mamta Shukla <mamta.shukla@leica-geosystems.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: bsp-development.geo@leica-geosystems.com, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=lp4eIMOna4MNieJ1lmI1P3hAqicQqw8PUE7YM6WWrBo=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpW6nD3bGHKCXvLV9aGkSRL2Vu/FSzuQNiUrF+r
 Ws4jBe/UL+JAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVupwwAKCRAZlAQLgaMo
 9L9SD/9MSQpSzD9w1H3cRpOdRjVz4eGBvIglwZ7HIIsCt2OIrC6+7h//BuRnXiXkQYpiG2cQ0Rj
 9puf91hKCmdlfWHFjXsnuH2Arf0sKSduwqduHhy0+BY9EtODoRs0ERqElkjBQVG5CVATFgNf33k
 poUKbYV5J053dwRHkmWMXYd19HIauhBOVZWcSZiPZwQd5EUH6i3VUaDwogPTzg4XjxDI6/7Dwhr
 Vdx6q1/1IUEEiXbH5NguQEl8wFevG14B3/6xuqht6RtRrnUSIy7k7XPwnn/51IH5yuKB7kLeyYa
 NuSG0bBGBVLPk6ZS3hQHHKLUL3M5u6W9+rXVKIRfOuaj8WisdGfc1iOXb4NkmvDBm2bqZsuI3Iz
 2nJ0WEb5biIkSz7CoR0FnzJQ3PQPLoXjf6QUIoSLF70VzTdermpYe5XLPDCQrMQ9kXP+5x0HCb/
 mYLjsFOFmOrMD70OMnrJ7Ic9Yzdxdiiqnp99kShU5L2InFmmuNGAsKQhZ9K4PbaefkzdPgkZUbV
 6kYyJOTOm2c9am0ikt2DIBJyGRQ/Cj1RJ1sQ46cU23d6PQBY5Qc0FstJDBLcGPj9TYXmTvlvyVD
 HWWdxjmzQggvXh7MEDoRu9qmqskINhSXa7sp3je8PlJZn39dCarTjUmBTShSNJV9u+PljGM2jQy
 vVFkF00MXnRQm7Q==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_040843_467626_BA0339E1 
X-CRM114-Status: GOOD (  13.89  )
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

The dwmac-socfpga stmmac ethernet controller supports 2 standard reset
lines, named "stmmaceth" and "stmmaceth-ocp". At the time of upstreaming
support for the platform, the "stmmaceth-ocp" name was used for the 2nd
reset name. We later realized that the "stmmaceth-ocp" reset name is
the same as the "ahb" name that is used by the standard stmmac driver.
But since the "stmmaceth-ocp" name support has already been introduced
to the wild, it cannot just be removed from the driver, thus we can
modify the driver to support both "stmmaceth-ocp" and "ahb", with the
idea that "ahb" will be used going forward.

This series add the support to call reset assert/de-assert both "abh"
and "stmmaceth-ocp" to the dwmac-socfpga platform driver, then reverts
the patch that uses the DTS "stmmaceth-ocp" reset name.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
Changes in v2:
- Added a dt-binding patch to mark 'stmmaceth-ocp' as deprecated
- Link to v1: https://lore.kernel.org/r/20251229-remove_ocp-v1-0-594294e04bd4@kernel.org

---
Dinh Nguyen (3):
      net: stmmac: socfpga: add call to assert/deassert ahb reset line
      Revert "arm: dts: socfpga: use reset-name "stmmaceth-ocp" instead of "ahb""
      dt-bindings: net: altr,socfpga-stmmac: deprecate 'stmmaceth-ocp'

 .../devicetree/bindings/net/altr,socfpga-stmmac.yaml          | 11 +++++++++--
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi          |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c           |  4 ++++
 3 files changed, 16 insertions(+), 5 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-remove_ocp-44786389b052

Best regards,
-- 
Dinh Nguyen <dinguyen@kernel.org>


