Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF449F44850
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=7Lj1aNml9xNTs4vJYi74RnqcLcp2m2BsrRjTAYhHjrw=; b=K/x1AsUK/7GecS
	ZSQxh9P2bSqNS6cv8QydT28sS53VYsuos279usw60oLNm8YmXhrPiigoMMZf4ZOn4p/lY1hV4rc4j
	LyXxBJwIXjzRNpDdGvsAuaOcbpObsZZE5fkwzOMyDjZJs2lKocm75EsxAiDdV36sBSpGeCi9Qdsw/
	tdBk7jam4mbzRFwfvt3NS+gzDymPSNbyWBIJYmbi7xsFv57y5zHfOCjHych3db2IEBCBfwYu4V2Fq
	t6qp6sFxZhX8p8Lj6QCtHFM8VPggaNHCh358SAVKEBO2Igdr1AwhCjfzduY1z2ral+zxWwGSTxeS0
	LeV38vD5Gl3mNoD9DvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqO-0000000CB2S-0YkQ;
	Fri, 10 Apr 2026 12:20:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqI-0000000CArl-2FPy;
	Fri, 10 Apr 2026 12:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC2056132F;
	Fri, 10 Apr 2026 12:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CA3C19425;
	Fri, 10 Apr 2026 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823609;
	bh=UKj6WoZFsTQfNpLsa4hK9AJwWp/c6TyAgfAmmgBM2Aw=;
	h=Date:From:To:Cc:Subject:References:From;
	b=SEmycwX5s0//+gtSPktg47GJS+8sJlwAPsv65Bq7Wv5tg7uQL3Gpghd9FaOczcWIN
	 ZQaCuA/qh+jNH/riNYpmVLmwYhqyjM2JbqnNtt1yhbGBg3HT7iCiqP6g94wS0wTPIA
	 99ougHo5Nu9h67SjSnTNqyHC+/lIAAGR6p7tHCAck6aAnXmlbTDue5R1sT+DZ/waOZ
	 GXIvFpg3p1ueseORBf9eozHpgJ3jpkMWN+atB0UvtcxRk8vKXhCteFgdwrDai6rThh
	 FHU0CtO/nkzQnAaFOlH62oLpy9zcH9gwc0II0cebCdnPQhGplJ3L9nz1drcdz9bKdB
	 3Oc5+96qoKgtw==
Date: Fri, 10 Apr 2026 14:20:06 +0200
Message-ID: <20260410120318.929806643@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 kasan-dev@googlegroups.com,
 Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 20/38] kasan: sw_tags: Replace get_cycles() by
 random_get_entropy()
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Seeding the random state with get_cycles() is functionally equivalent on
the architectures which provide get_cycles(), but it does not make sense
semantically.

Use random_get_entropy() instead, which is the proper interface.

This is part of a larger effort to remove get_cycles() usage from
non-architecture code.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: kasan-dev@googlegroups.com
---
 mm/kasan/sw_tags.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -41,7 +41,7 @@ void __init kasan_init_sw_tags(void)
 	int cpu;
 
 	for_each_possible_cpu(cpu)
-		per_cpu(prng_state, cpu) = (u32)get_cycles();
+		per_cpu(prng_state, cpu) = (u32)random_get_entropy();
 
 	kasan_init_tags();
 	kasan_enable();


