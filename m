Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB051C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7HswGLqiJ3CaSj6uXkqJZl8ULEeu3eLu1BMBLkbZbL8=; b=nulbi7jEBzD63gBMQOY0ST7RUy
	nxeQQAumAuVR0k3vV61EfbUzDjQMIfHEnWbsSz2gTpcZCwJz8/MOtN/0ZPonrsFWfPYlJJeIcUX0e
	lNKUim632t8R5zn2bqpEXMm6Y5F+BJfemI8Tn51xiS7k33Y582dZXsckOrG5qgsWoDDCvSDFk3B2w
	pKQvabQoctHFM6vaNpG/gkmQ9em6TY9egTNGpLUxwZSe6huFwX9M38Gi7HrGNJJmwF27xpirw0/xt
	BkjiJ5Mp0ZSxPsgw2IqvS96jD4YVLUqgMMN6xEB7NYgKttrNsJlH3WMGUNxXR0oYTHVV4zXaHGpNs
	yWwrkBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7exc-0000000BbBS-3UmP;
	Wed, 23 Apr 2025 18:36:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eJn-0000000BQum-03ON
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:55:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CDEB438E1;
	Wed, 23 Apr 2025 17:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA74DC4CEE2;
	Wed, 23 Apr 2025 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745430930;
	bh=/LVwP2J7phmJo5xUbPuYBsq73NOkQB14cAElXzkBoks=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=phSeOFmNEoUyqaK9vn5Kfla9WgE6envapLq9rZ7dT7yWpDJRt10Hip4/mrnX1eYWt
	 omajTVlNqQIi/7tkbUbkeJ5Hqsj2WBseHU+/duUvNSVw7nwtLuxkLqfs8sA63AqHy1
	 5r1siANzs4M33++KsgKnzYcpyskCkJml2DAxHXsLIRdQNK78RKYFFjHR7Y/Zctn0SV
	 5VlZDIj8oKswAyD+er/HA+Fzv8IF9Cg9/K9wTXapzp1g2xKuPd+aTmEV5dAudGoVSv
	 f0KKcRLiuzjKh6r3y5BIUNuHa/ZmqVp/3350IKMZzwZHH4kRL8mlmZX3i8tTje0axx
	 M5Jp8TTmJ877Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86CFC369CB;
	Wed, 23 Apr 2025 17:55:29 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] Apple PMIC NVMEM cell driver (Formerly: Generic
 SPMI NVMEM cell driver)
Date: Wed, 23 Apr 2025 19:55:12 +0200
Message-Id: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIApCWgC/23MQQqDMBCF4avIrJuSTIyGrnqP0oWmow40KkkJL
 eLdG11Z6PI9+P4FIgWmCJdigUCJI09jHvpUgBuasSfBj7wBJRpZKiPi7FmMyZMXJG2ljVaVqg1
 kMAfq+L3Hbve8B46vKXz2dlLb+zeTlJACUVZ1S2i06669b/h5dpOHLZPwSOsfipm21lqjSJdN1
 x7puq5fOHbWGN8AAAA=
X-Change-ID: 20250415-spmi-nvmem-e08635316175
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745430928; l=1822;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=/LVwP2J7phmJo5xUbPuYBsq73NOkQB14cAElXzkBoks=;
 b=DYImOHdO3m2rCslcCrmKq+Ure36xtXDMfMi0nYTg6CXkPtjKnUVyEChYMW8gOT5qVYqXuThMd
 Ci910bPQ5VpCr/YdCgRCnRTDLNFysECw1DxHkbLO6gFHVJK4qBZ/w7M
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_105531_105321_3CF96267 
X-CRM114-Status: GOOD (  11.58  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi.

This patch series adds a driver for exposing a set of registers
as NVMEM cells on a SPMI-attached PMIC on Apple ARM platforms.
Those are used to store the RTC offset and to communicate platform
power state between the OS and boot firmware.

The NVMEM cell consumer drivers will be sent in a further series.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v3:
- No longer try to make it generic, use for the 3 relevant PMICs only
- Link to v2: https://lore.kernel.org/r/20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com

Changes in v2:
- s/pmu/pmic/
- Sort dts in unit-order, instead of t600x-unit-order
- Link to v1: https://lore.kernel.org/r/20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com

---
Hector Martin (2):
      nvmem: Add apple-spmi-nvmem driver
      arm64: dts: apple: Add PMIC NVMEM

Sasha Finkelstein (1):
      dt-bindings: spmi: Add Apple SPMI NVMEM

 .../bindings/nvmem/apple,spmi-nvmem.yaml           | 54 +++++++++++++++++++
 MAINTAINERS                                        |  2 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |  1 +
 arch/arm64/boot/dts/apple/t6002.dtsi               |  1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          | 50 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi               | 50 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi               | 50 +++++++++++++++++
 drivers/nvmem/Kconfig                              | 13 +++++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/apple-spmi-nvmem.c                   | 62 ++++++++++++++++++++++
 10 files changed, 285 insertions(+)
---
base-commit: 2e0e70c95077172b29a5b13716c4b159d578e82c
change-id: 20250415-spmi-nvmem-e08635316175

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>



