Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F9CD5E154
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ExcLfK7AtyhHsVTXF3j6FOmpKWRmRkmadjs/8WzIKuc=; b=rfN0Oos7Ucs83TMdDUaYcQjXL3
	CaFImYD7jM+2gEpDDTZqZzdVrFu0SAhNG/csJy5GtLHWoFFp5X6DuXDi6SAq73R21hfDjaMGTpHpb
	vFsAzP7k0dD1VF4xbmZ9nzMJYKD3BfjfSZD7nAVmRsTWS4aXZSK40jKO/6hex51yn/DLxlI960d0E
	p4OV5REdXK31hCDFE/8hOHmIXo+p7jS/1IAIbQZPaZ/hSPw+dQDej6ol7P9SfbTCF4sDFUnlCOGnI
	F33IYetmDIc1VrNB3CHxgCdJrn48F0bQk0LogfCZHHt+P5ZzZMCihM+hWvDc3P6c/Uhu3gYwrbqdu
	j95RUYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9MIx-0000000A7zi-0vr4;
	Fri, 08 Nov 2024 10:33:27 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9MF9-0000000A6ec-3QoQ;
	Fri, 08 Nov 2024 10:29:34 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8D235120004;
	Fri,  8 Nov 2024 13:29:23 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8D235120004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1731061763;
	bh=ExcLfK7AtyhHsVTXF3j6FOmpKWRmRkmadjs/8WzIKuc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=g542i3L5dHoXm6+OIzbKy2llFuc+UTJUe4AZPONYJp2H7MiwFV+4pwLneFyhi3mcK
	 8CNig28H0rFmojisYv9cXJfgoVAzq7n/vBYh/ldRYEOFE1s5hfYdDZLvvtLhLGnmpI
	 qvm0gs+Tbd4fec4if9iV4fLI+GBWnrz1sDvTmPi5l6+AwBtyvjzOe8jmDhaJptkZ9M
	 sYkYDKEKzoHhvyn39M1Z95QVaT4byIZssq5MT9BW5FkG6Od7ECYyxKvqH16WgDvNWA
	 D6R7DqZTMw5+GubT3Ye48QiT34VmqJ2fKmmufYBtkfpXrl3caY8u4wdT0dh3NdNSIi
	 5GTJUceiDxNjg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  8 Nov 2024 13:29:22 +0300 (MSK)
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <vadim.fedorenko@linux.dev>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, "Alexey
 Romanov" <avromanov@salutedevices.com>
Subject: [PATCH v10 00/22]  Support more Amlogic SoC families in crypto driver
Date: Fri, 8 Nov 2024 13:28:45 +0300
Message-ID: <20241108102907.1788584-1-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.192.125]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189039 [Nov 08 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;gist.github.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/11/08 09:24:00
X-KSMG-LinksScanning: Clean, bases: 2024/11/08 09:24:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/08 08:34:00 #26834472
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_022932_533995_0C16E4F8 
X-CRM114-Status: GOOD (  15.28  )
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

Hello!

This patchset expand the funcionality of the Amlogic
crypto driver by adding support for more SoC families:
AXG, G12A, G12B, SM1, A1, S4.

Also specify and enable crypto node in device tree
for reference Amlogic devices.

Tested on GXL, AXG, G12A/B, SM1, A1 and S4 devices via
custom tests [1] and tcrypt module.

---

Changes V1 -> V2 [2]:

- Rebased over linux-next.
- Adjusted device tree bindings description.
- A1 and S4 dts use their own compatible, which is a G12 fallback.

Changes V2 -> V3 [3]:

- Fix errors in dt-bindings and device tree.
- Add new field in platform data, which determines
whether clock controller should be used for crypto IP.
- Place back MODULE_DEVICE_TABLE.
- Correct commit messages.

Changes V3 -> V4 [4]:

- Update dt-bindings as per Krzysztof Kozlowski comments.
- Fix bisection: get rid of compiler errors in some patches.

Changes V4 -> V5 [5]:

- Tested on GXL board:
  1. Fix panic detected by Corentin Labbe [6].
  2. Disable hasher backend for GXL: in its current realization
     is doesn't work. And there are no examples or docs in the
     vendor SDK.
- Fix AES-CTR realization: legacy boards (gxl, g12, axg) requires
  inversion of the keyiv at keys setup stage.
- A1 now uses its own compatible string.
- S4 uses A1 compatible as fallback.
- Code fixes based on comments Neil Atrmstrong and Rob Herring.
- Style fixes (set correct indentations)

Changes V5 -> V6 [7]:

- Fix DMA sync warning reported by Corentin Labbe [8].
- Remove CLK input from driver. Remove clk definition
  and second interrput line from crypto node inside GXL dtsi.

Changes V6 -> V7 [9]:

- Fix dt-schema: power domain now required only for A1.
- Use crypto_skcipher_ctx_dma() helper for cipher instead of
  ____cacheline_aligned.
- Add import/export functions for hasher.
- Fix commit message for patch 17, acorrding to discussion [10].

Changes V7 -> V8 [11]:

- Test patchset with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS: fix some bugs
  in hasher logic.
- Use crypto crypto_ahash_ctx_dma in hasher code.
- Correct clock definition: clk81 is required for all SoC's.
- Add fixed-clock (clk81) definition for A1/S4.
- Add information (in commit messages) why different compatibles are used.

Changes V8 -> V9 [12]:

- Remove required field clk-names from dt-schema according to Rob Herring
recommendation [13].
- Fix commit order: all dt-bindings schema commits now located earlier
than any changes in device tree.
- Fix typos and add more clarifications in dt-schema patches.

Changes V9 -> V10 [14]:

- Rebased over linux-next (20241106).
- Remove patches with AES-CTR support. This was a dishonest implementation of CTR algo.
- Update commit headers in accordance with the accepted rules in each
  of the subsystems.
- Moved adding power-domains (dt-bindings) in desired commit.

Links:
  - [1] https://gist.github.com/mRrvz/3fb8943a7487ab7b943ec140706995e7
  - [2] https://lore.kernel.org/all/20240110201216.18016-1-avromanov@salutedevices.com/
  - [3] https://lore.kernel.org/all/20240123165831.970023-1-avromanov@salutedevices.com/
  - [4] https://lore.kernel.org/all/20240205155521.1795552-1-avromanov@salutedevices.com/
  - [5] https://lore.kernel.org/all/20240212135108.549755-1-avromanov@salutedevices.com/
  - [6] https://lore.kernel.org/all/ZcsYaPIUrBSg8iXu@Red/
  - [7] https://lore.kernel.org/all/20240301132936.621238-1-avromanov@salutedevices.com/
  - [8] https://lore.kernel.org/all/Zf1BAlYtiwPOG-Os@Red/
  - [9] https://lore.kernel.org/all/20240326153219.2915080-1-avromanov@salutedevices.com/
  - [10] https://lore.kernel.org/all/20240329-dotted-illusive-9f0593805a05@wendy/
  - [11] https://lore.kernel.org/all/20240411133832.2896463-1-avromanov@salutedevices.com/
  - [12] https://lore.kernel.org/all/20240607141242.2616580-1-avromanov@salutedevices.com/
  - [13] https://lore.kernel.org/all/20240610222827.GA3166929-robh@kernel.org/
  - [14] https://lore.kernel.org/all/20240820145623.3500864-1-avromanov@salutedevices.com/

Alexey Romanov (22):
  crypto: amlogic - Don't hardcode IRQ count
  crypto: amlogic - Add platform data
  crypto: amlogic - Remove clock input
  crypto: amlogic - Add MMIO helpers
  crypto: amlogic - Move get_engine_number()
  crypto: amlogic - Drop status field from meson_flow
  crypto: amlogic - Move algs definition and cipher API to cipher.c
  crypto: amlogic - Cleanup defines
  crypto: amlogic - Process more than MAXDESCS descriptors
  crypto: amlogic - Avoid kzalloc in engine thread
  crypto: amlogic - Introduce hasher
  crypto: amlogic - Use fallback for 192-bit keys
  crypto: amlogic - Add support for G12-series
  crypto: amlogic - Add support for AXG-series
  crypto: amlogic - Add support for A1-series
  dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt
    lines
  dt-bindings: crypto: amlogic,gxl-crypto: support new SoC's
  arm64: dts: amlogic: gxl: correct crypto node definition
  arm64: dts: amlogic: a1: add crypto node
  arm64: dts: amlogic: s4: add crypto node
  arm64: dts: amlogic: g12: add crypto node
  arm64: dts: amlogic: axg: add crypto node

 .../bindings/crypto/amlogic,gxl-crypto.yaml   |  32 +-
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  14 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   7 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   6 +-
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  13 +
 drivers/crypto/amlogic/Makefile               |   2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 581 ++++++++++++------
 drivers/crypto/amlogic/amlogic-gxl-core.c     | 289 ++++-----
 drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 507 +++++++++++++++
 drivers/crypto/amlogic/amlogic-gxl.h          | 113 +++-
 11 files changed, 1209 insertions(+), 362 deletions(-)
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c

-- 
2.34.1


