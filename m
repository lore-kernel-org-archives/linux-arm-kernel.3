Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2EFF4484F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:cc:Content-Type:MIME-Version
	:References:Subject:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=YQzJkFKLTggwDr4aZ8p5K5IXIPCjwwK87RXbOM/NyyM=; b=U+6ER9AZ9zkN4W
	seDoRKG2cUSSmu6O1eevprnYi9ZEkdTgefBLuxwE064Ffgv9Q+kkBCV0nMxkx35k707idi5l1iUz+
	CQIBO5m1GWhPKTZQ2mYXMg/WFdQLap2KRnlfuPmAvWtZgshVhKdU+Oeee+l0jHApmKaUOTdWEgM0H
	+YambLGQNFTmMaMFxq/EXXtFlIvHCvHh3+E9ITDCE6GaHGRgkGg0Go2LXsu7D5u6yi7cyNn089EF4
	n6CdbS2ffc9wooRMQ3C1Fv6H4MSTfd5kAAkiKFVmeKeGV1KCN+pdZUggxKcMXwhuv5+7+I9aqtVU/
	RhBGIP15JavlzjedhIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAp4-0000000C9FP-0GMA;
	Fri, 10 Apr 2026 12:18:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAp1-0000000C9Ce-33NL;
	Fri, 10 Apr 2026 12:18:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E54A42A40;
	Fri, 10 Apr 2026 12:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41928C2BCAF;
	Fri, 10 Apr 2026 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823531;
	bh=d9g4tptgi4bHAMeSUYU/X2RKjwFUxFqrN/mhP3KVNVE=;
	h=Date:From:To:Subject:References:cc:From;
	b=C95dlBh11sE1EDcg7WkfMi8fo/Gu65tTzE/T1Srv47O6KGVj91UAmlXjU/FculsKY
	 awynI69i3I7OzFyIZRoLHG74aENkFw6rGItybhxSqe437lYLBTdjTVnjO/BdcaqFmm
	 BXfUg/n2zRCzaQYn/z/fsuHLl0WmkcWVFMRkJhLQ5RkhTFRVvrz/UodergNNz9SIp4
	 BVs5UNoonypUPXLwnttDKrM12mG46vN5EiYmDA6MeZqU6JoMxzzH1xMf+HYNN+Suws
	 7vEfC+JysbP6o62RQk33gA7qFJeSKzf6pdk/9/gi1eWOgpyfVkfoVSPrkQiIoyiqxd
	 pjPaBhdVrzMKA==
Date: Fri, 10 Apr 2026 14:18:47 +0200
Message-ID: <20260410120317.843419270@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 04/38] x86: Use PIT_TICK_RATE instead of CLOCK_TICK_RATE
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
cc: Arnd Bergmann <arnd@arndb.de>,
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
 kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_051851_797326_C4998085 
X-CRM114-Status: GOOD (  11.46  )
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

CLOCK_TICK_RATE is only used in x86 but defined all over the tree for no
reason with comments that it's scheduled for removal for more than a
decade.

Use PIT_TICK_RATE for registering refined jiffies to get rid of the last
dependency.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 arch/x86/kernel/setup.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1268,7 +1268,7 @@ void __init setup_arch(char **cmdline_p)
 
 	mcheck_init();
 
-	register_refined_jiffies(CLOCK_TICK_RATE);
+	register_refined_jiffies(PIT_TICK_RATE);
 
 #ifdef CONFIG_EFI
 	if (efi_enabled(EFI_BOOT))


