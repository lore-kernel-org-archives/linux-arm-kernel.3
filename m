Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91C5C982C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8McmYyqCWRJOKJjuUPK7EGmzoTFVXGu9WTYiWFEOSLo=; b=e4oYp3LW7QaU8O
	tLmdiOyJvRdoWWBsVg0Ri/yNOU1ch2yjkuCM8A/1VSgEw2KtOf7xmLklexkMmqUVykHmNbYwGhA81
	/Elpm6NT4NMgWCFpqc0bTBxR9ITDrJP8r/Ab4QSKFHEx/V8cFd+5G315tRyo9Eq+hensg8Wj41SRm
	HhEI2Twx7kZkAn6q880oyb6FKjkVtDw9BMZ0p7W0CFRlUK5visQVYKHse6wRDjDetMDHszN5u5EHI
	nkpZFXFOuLCJXRRpgTPB51bLDH6f1ytlKwq9JE9qxsft89SUl1sGU+xbuwmJD6IZPSjqatJhW2Mgr
	8kcdd4671r+qt9y/iwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VAq-00000007DjV-0Sq0;
	Tue, 15 Sep 2026 15:34:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9Z-00000007BG3-3vhh;
	Tue, 15 Sep 2026 15:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789486379;
	bh=CSj95wcr1eJMcOyg4FMm7GN+52z0f+uoqAgwCBiMWd4=;
	h=From:Subject:Date:To:Cc:From;
	b=aCnnxjTi2HOLgx1pgeB+ws0yxqInZG8Fr4o9ZrPYjS2h8HlfbVBD73wl9XvTy6um4
	 jU9kG760f8nAqR6bww7R1dPoDSJkLza2bA2TELJFfYxnHYE15YViBfxzb8UJ3FSegr
	 l69mmYchmvlFIOBx3Wgxeq6FRgC+JPCmPSHKRp4qZ1RK3itJu894Fn5Qvh1kjlMhtI
	 d44tH/TRRHHlAZZ7Ad6tkNFB6Ff1yWM4nZ73RmM1FGrrJMyBNXWdXYS/i9Oyg6aPKk
	 95zKmYzt/2YBaD4i+99fhHi2r8hsiOQOJhKAAoODD8K3JqIVs1V/ZxLntLYMXM5GVL
	 BX2rLFJHDTi3g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC1C717E09B5;
	Tue, 15 Sep 2026 17:32:59 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 67AB548002B; Tue, 15 Sep 2026 17:32:59 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v15 0/6] phy: rockchip: usbdp: Clean up the mess (part 3)
Date: Tue, 15 Sep 2026 17:32:47 +0200
Message-Id: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQ207DMAyGX6XKNZlyalN6tfdAu0gcbwv0EJKmm
 zTt3Um3IZAQEtz5t63vk30hCaPHRLrqQiIuPvlpLIHXTxWBoxkPSL0rDSKYaNgzV9QqGid4g6M
 PNCfrAoUezZgDDSbOkgIYzWQr0aIkhRIi7v35pnjZ3XPK9hVhXrGPjYjvubjn+xoZMCVzU3fVQ
 1z/Zl3KiNGWoQDOHQdstzD1vbFTNBuYhtXwH956hfikupppsJxrtf8j9ft73AnkVzr0GQu3YHU
 jra1V0wqFP7HWJKSlHvzcVYveFARwsrtePwCDyx+3rQEAAA==
X-Change-ID: 20260914-b4-rockchip-usbdp-cleanup-part3-cca70383ebe3
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3863;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=CSj95wcr1eJMcOyg4FMm7GN+52z0f+uoqAgwCBiMWd4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpZSOeLIKYwEs1gZhvlA91GXs1N2h7LIsyA
 Lw1qIDlkMtHkokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWUjAAoJENju1/PI
 O/qakWgP/Aph3bCm+kwnaw/Hcwwy+RX3mqmbkYbIM/+5yuQJHlfwKJJc5py95z7inKBWkyV1dHK
 nttkM3vUbbQDpe/tEHMdSqvey2lU5RV1neKaI8bB+5UlAbEwJBIjFKVimSASgaLAWJrH6eR1yBg
 wLK6yLUP8gALGNyCBu/u/MX1dN+lV7IlM8IE/x9mi2ONcKYp4Li70sSX0Ma6yrBNEfFkqVlFvLY
 tZZuM+IoRAzwzT9+1NVxvHu9q18H6OQRyv3Y7d99NWDJBuL7K/xSqLsnBwmWsX22wO4OionpfWo
 1SsOox0fElzX271t9veL9AA/7pxKaqdAanCyMhvrq/2eO5LHXmQdO/v91rjR9evJAsB8tw21H1Q
 ArT32lHp+w2X1t8PPAX66QLkqXu5oOdP1VcjmURxGxRYiXYnogsSfq6jG6OowyjP12k4OZNDyc9
 ETnRQp+C4rjTLNFUTV3RqVEfZ51jtWcBOOV4CLhMJbwRX41ogEHupgeM06k46SBVkkdFxa0gdJ4
 RW+r2MaEgZqH8lo3XcN9oU9NSvjtEb8Hw1BvjoN2K7WoygDJfmMWElXQw4YhXkB6kgkqMKzKNme
 JmTDTyGyzeS1FuGVOAKyJE6GelXz/TeJYfvK7i0oeTbhRGgXNnrAPpIsz0EJoCh8tU7hu6xSuo8
 bSubrcvRjdtaFniqOCworZw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_083302_160649_FD8FE407 
X-CRM114-Status: GOOD (  11.11  )
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

This series was split from the USBDP cleanup series and contains a bunch
of critical bug fixes for the Rockchip USBDP driver, but the fixes
depend on the cleanup and features added in the previous parts and
cannot be sensibly moved to the start of everything.

This part depends on the cleanup series part 1, part 2, as well as the
series adding the new DWC3 glue driver.

The most important change is the first patch adding PHY reset
notification support (i.e. the PHY notifies the consumer that the
PHY is about to reset).
    
Changes in v15:
 - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
 - Split the series, no patch changes in this part

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (6):
      phy: rockchip: usbdp: Add phy reset notification support
      phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
      phy: rockchip: usbdp: Rename mode to hw_mode
      phy: rockchip: usbdp: Fix power state handling
      phy: rockchip: usbdp: Re-init PHY on mux change
      phy: rockchip: usbdp: Add USB-C state without DP enabled

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 237 ++++++++++++++++++------------
 1 file changed, 144 insertions(+), 93 deletions(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260914-b4-rockchip-usbdp-cleanup-part3-cca70383ebe3
prerequisite-message-id: 20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com
prerequisite-patch-id: 27d601f203e30baebffc3486a1b787a2d280f5f7
prerequisite-patch-id: b42efbccabb13cd37252ea9bbc3873141bd5b8f8
prerequisite-patch-id: 8b416e19148a0b90c71778ff4fcc032b52ed49ce
prerequisite-patch-id: 04b986df824850902431339cdf43787d8036ac5c
prerequisite-patch-id: c0a6f7da1f986c76248c6271b0c04d8dab21e5cb
prerequisite-patch-id: 12bf844fd4a355c1860812522fdb16a1ff4232ea
prerequisite-patch-id: d71d6a6a232b59804f0775ba5c87d71bfdbbea61
prerequisite-patch-id: 301c705f92061ccb1a1923ec5d3bdc1fdceca24d
prerequisite-patch-id: 978560cb9620a16f57e14c424e8efa4ad7178747
prerequisite-patch-id: a6562299bf87dc57d4b14a8079d2b1e3fe407702
prerequisite-patch-id: 1b90e6acf41e9093636c3fe8791f46492b583520
prerequisite-patch-id: 60f32afe1f50ed33d48041b41e7ec8a5841d0ebd
prerequisite-patch-id: 8a9a01d462e581e6539bc9fd07b13e0f32933126
prerequisite-patch-id: fbcfbe4a42de5c488052e865bfd146260be738fb
prerequisite-patch-id: 7f3c3811dee1e11e0386ff2d8b4080f07bd68e88
prerequisite-patch-id: 831ca526a0099f3f7292f2060df9888bdf3055b4
prerequisite-message-id: 20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com
prerequisite-patch-id: aa7f5784cc227e8dd7e9fe376dad1997828aefbc
prerequisite-patch-id: 21ff208d83fc75ac5efa9f69d8aa36455d1ae94e
prerequisite-patch-id: 4f721e51f1f4d57284354cc0b99b6a092b4603da
prerequisite-patch-id: c5d9d7bf27e215f9f60ac98ce9cc2117b5041d38
prerequisite-patch-id: e1cefd986004360890e009dede50fc849ce927df
prerequisite-patch-id: e2788d7c6dad4f9b3352ed59c5b4bedd7c55529e
prerequisite-patch-id: 45c0c6cdd117dba967ae3616531d7229fa853075
prerequisite-patch-id: acca212cc347efc4748dbe8d74a192e0f58f0133
prerequisite-patch-id: dabae3467575f218da2042bd26aa7314f599169e
prerequisite-patch-id: 4208007b7e8ce5710399a7a1cd93a45b2da0007c
prerequisite-patch-id: d2362c993cd9289d8849af2144a05da1bb5d84c9
prerequisite-message-id: 20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com
prerequisite-patch-id: 14c0d95ef04887c85fa5b00910f128416efcf17a
prerequisite-patch-id: 887cc9953b0df9e238ae0777ac3c8a263e537d9c
prerequisite-patch-id: dadeaf9e369e04d8b3329493a1a0756ddd6140f0
prerequisite-patch-id: be213d23cea80f1c646983de557fb1305d545f63
prerequisite-patch-id: 8cc3059384276b97b1905fb04ac5ba153e1bf2f5

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


