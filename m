Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2519CCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hEveejQ5LezW2cXHJne2TGfo1ZNO0O+jmUKcv/3d1g8=; b=VrdXo0BCKIPH4ioN2KYMMJIug7
	TjZUp60IF9Ko0IwdnZVWmikAKU6yLs4cL9i35TahRFWI262DFs4BXDaBMOJhXzwMCci5qrkJmoIEI
	Q39gjr2Y4tXQ/lWOa5jU07o9kr46BILcASIcLaP6JLPZzAEgln08cr2xq/nJY1nh8mi1+OP0qjxTF
	GorSdxaQGYh57tU6ISXN+Jva9UZzNswQnXUhdzF+fwbVXX4rHq5EcaPkitRD33rEfwGpY5ILdAhuZ
	wgFdDyEgY7xCSiLnJyuGvbOu0WxD1YMWfeqVYqjfPABmxO/ox3YQX+z+nVjWOWwwe8Caz4UegkSX3
	TLVsnyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6c-00000004930-2Sj2;
	Thu, 30 Oct 2025 12:50:18 +0000
Received: from mx-relay16-hz2.antispameurope.com ([83.246.65.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6Y-0000000491m-1UzS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:17 +0000
ARC-Authentication-Results: i=1; mx-gate16-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=hEveejQ5LezW2cXHJne2TGfo1ZNO0O+jmUKcv/3d1g8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828603;
 b=oICKMQttDU0MURGsV9oSsVYmaJmYhoIMjSBqr+tFdC452euBXjJfqbPgdpG4/NsGEXmvzJL5
 5wqrM1xzj4OOTjb8PZB0xR2riqcccCQnJTUsZmdEfBt1qigr9Ao3x5UReMQ/lbQrhz+svYMLMQ/
 fvw4CVPRp9pacKKcnhTwMrhpLbCSYcp7Fm+kPChJSfjt1z01S3PiXAHhOgdE3K7XbW/9eNlbnwL
 15kkOOk3fZ/fKHCmfmuT8gVomP6ncXi+beLCwerroUezGxMqaktdmIBP3/boufWldBAnCvbw85a
 qmGKAamFc6x/xsGD7xThoIC+mmGA15C4tEcKG/e0qDLMQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828603;
 b=Zb9uGAMCZe2dAD6IyCILvo6XSymsX5hONY+tQXrEsF/BgRi9Z+IoYDLO6hhwi+D8QBY94Hwt
 bzF8rKbYrSGC9rJCDMuIiVa/MIfdVvSG0e5UuYCTuJ57RKwauRdEVVE5IfT/sP3/dKzLbD8wNYd
 qKpkPO4S2IBJdWJ8E9CgO5+X78Lzn1SgWSuLBzpNAU5TLjcQh+xUhTaPBFeYkiKDMWijAbYySWn
 7BPLye/pfqhqcRPwX0zWbq7uA0CaAJlzcJEWjPKolLV2aL/MsZr53TThB8q26xN5syoWdfqEX/h
 iMyZ+eUVAFIIqtq6blxkFfOFWYpOTZXvE5Qx1ha5a6+Tg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay16-hz2.antispameurope.com;
 Thu, 30 Oct 2025 13:50:03 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1D6A7220C5A;
	Thu, 30 Oct 2025 13:49:50 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/19] TQMa95xxSA DT fixes and cleanup
Date: Thu, 30 Oct 2025 13:49:07 +0100
Message-ID: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay16-hz2.antispameurope.com with 4cy3q25g17z29yQ2
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 4af8d990a1c9f7c4fdb1574041f6d9a2
X-cloud-security: scantime:1.686
DKIM-Signature: a=rsa-sha256;
 bh=hEveejQ5LezW2cXHJne2TGfo1ZNO0O+jmUKcv/3d1g8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828603; v=1;
 b=J01Q8xzT14LdNsWineAsj1EWMhBQtA8Gng2tjxzEm9Oofl8Uk4QS810tTIPGmUNM2bE0WYds
 M5xQp//xSC4+xB/70uK47ewLUutrFvmnaKTHzmjBDmDKTlM3cl677pOhKFp+/rVOKvYeBGIkg39
 couqpUw66f/z6809RHIvA6tts7JStLI6uU8el6zWy2eHPVG24zeVhGjiirX8pdexMtdHEfexTlo
 yzon/dLQvs9PR3skkfZerA+GhKHyIxEsGBTwMFH89OoNTf/e3CsqbXXJEDcVMXu6Afjw1DVvmiD
 0lnv8y2zA9ad9K+BGUIEHxgTVjeDqbnWfOVBX6dTvrXRg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055014_942520_258CB62F 
X-CRM114-Status: UNSURE (   9.58  )
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

Hi everyone,

this series includes two fixes for TQMa95xxSA. Having a Fixes-tag I put them
at the beginning. Following patches are DT cleanups:
* move pinctrl/config to module .dtsi as SMARC-2 already defines the pinout
  the mux is fixed already.
* Remove 'sleep' pinctrl settings as they are identical to 'default'
* Add I2C bus recovery
* EERPOM page size is increased to 32
* Whitespace fix
* Add MicIn routing
* Mark LPUART1 reserved. Unique control of syste manager (SM)

Best regards,
Alexander

Alexander Stein (14):
  arm64: dts: imx95-tqma9596sa: reduce maximum FlexSPI frequency to
    66MHz
  arm64: dts: imx95-tqma9596sa: increase flexspi slew rate
  arm64: dts: imx95-tqma9596sa: move flexcan pinctrl to SOM
  arm64: dts: imx95-tqma9596sa: move lpspi3 pinctrl to SOM
  arm64: dts: imx95-tqma9596sa: move sai config to SOM
  arm64: dts: imx95-tqma9596sa: move pcie config to SOM
  arm64: dts: imx95-tqma9596sa: update pcie config
  arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for flexspi
  arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for i2c
  arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for usdhci
  arm64: dts: imx95-tqma9596sa: add gpio bus recovery for i2c
  arm64: dts: imx95-tqma9596sa: whitespace fixes
  arm64: dts: imx95-tqma9596sa-mb-smarc-2: Add MicIn routing
  arm64: dts: imx95-tqma9596sa-mb-smarc-2: mark LPUART1 as reserved

Markus Niebel (5):
  arm64: dts: imx95-tqma9596sa: fix TPM5 pinctrl node name
  arm64: dts: imx95-tqma9596sa: move USDHC2 config to SOM
  arm64: dts: imx95-tqma9596sa: add EEPROM pagesize
  arm64: dts: imx95-tqma9596sa-mb-smarc-2: remove superfluous line
  arm64: dts: imx95-tqma9596sa-mb-smarc-2: add aliases for SPI

 .../freescale/imx95-tqma9596sa-mb-smarc-2.dts |  75 ++-------
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  | 153 +++++++++++++++---
 2 files changed, 139 insertions(+), 89 deletions(-)

-- 
2.43.0


