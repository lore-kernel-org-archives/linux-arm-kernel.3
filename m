Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86454F459F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6eHisBYg7qyonBevv/veresEfTDm6GmxPzgogzf6FU=; b=utk9BnBMctdmSZYU56Ni2vuZnY
	wZo/XpHcy98bSs6qTugGWd8eTX1aEULta5AGyZyWBV6PsQ++TADvr17lLXvZ5lUG9wij+dDW/HOpC
	l/M6rKnUVFmndmU3EJy3ZGFlw2KvF04EOn6PXaBS2WP2ZtzS94P2aKA1Kjvi5Wi/WZRFoKTdMNaRP
	98Ez8lA641Xvn2AdVhIyJInoKoByrRRE3ghToKZXZht+38JthAk1oy8t9H6wdAGoh2efTuONO1oe8
	3nlwa5ICwM4Ln87HwfHwQUcuWJRgDHgfGyWJ3R/x8kDFA2XL18MyqozOzFr9cbo9hd9DSpAnYviLG
	+7GDJ0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDYd-0000000CQuM-0lXx;
	Fri, 10 Apr 2026 15:14:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDYa-0000000CQtn-3cvw;
	Fri, 10 Apr 2026 15:14:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B0CF43DD6;
	Fri, 10 Apr 2026 15:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA7DC19421;
	Fri, 10 Apr 2026 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775834044;
	bh=ZX44VkA/oGGdYrqGVtHG3BQ09eU0s5TAD8UsmKEvOJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DQRfv3hPFw/TKa/ZakF0C/CvhlLPEsVqQv+2r4uwxdObvOGMMWr2s346gixb/wzYP
	 kH3jI1VGrMbPCg8bbeliLsWsv0WorMVV9pr65pzZbqt3ANfLMAZ3WpCzHo7EbPC0aw
	 sFqvG5W5Zh5Zl9hqpd/S10vk3SPDt4AvvXdP7MWFAVnJ1yy95RtrFN5r3P/n0YzraC
	 K1ddeqgVvP6yW3cqrHOPD+5bbhJuKzxhUEtkBkREvZCz2D1PF358eBsZtX1OaLotF8
	 mIrAdKqmlNIgawRmNAF5mT5jG8tytmCXBJPCuscrYjON8tMw7soKn19X1CoLhvhPBR
	 sIA/Sxe0F1CKA==
From: Thomas Gleixner <tglx@kernel.org>
To: Baolu Lu <baolu.lu@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>
Cc: baolu.lu@linux.intel.com, x86@kernel.org, iommu@lists.linux.dev, Arnd
 Bergmann <arnd@arndb.de>, Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Herbert Xu
 <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, Vlastimil
 Babka <vbabka@kernel.org>, linux-mm@kvack.org, David Woodhouse
 <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org, Theodore Tso <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, Andrey
 Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer
 <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Richard Henderson
 <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Catalin
 Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, Jonas
 Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Paul Walmsley
 <pjw@kernel.org>, linux-riscv@lists.infradead.org, Heiko Carstens
 <hca@linux.ibm.com>, linux-s390@vger.kernel.org, "David S. Miller"
 <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [patch 09/38] iommu/vt-d: Use sched_clock() instead of
 get_cycles()
In-Reply-To: <9db9515b-08e8-47bd-aced-206ac183195a@linux.intel.com>
References: <20260410120044.031381086@kernel.org>
 <20260410120318.187521447@kernel.org>
 <9db9515b-08e8-47bd-aced-206ac183195a@linux.intel.com>
Date: Fri, 10 Apr 2026 17:14:00 +0200
Message-ID: <87y0iuzw3r.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_081404_920940_4105F41D 
X-CRM114-Status: UNSURE (   9.06  )
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

On Fri, Apr 10 2026 at 21:45, Baolu Lu wrote:
> On 4/10/2026 8:19 PM, Thomas Gleixner wrote:
>> Calculating the timeout from get_cycles() is a historical leftover without
>> any functional requirement.
>> 
>> Use ktime_get() instead.
>
> The subject line says "Use sched_clock() ...", but the implementation
> actually uses ktime_get(). Is it a typo or anything I misunderstood?

Indeed. Leftover from an earlier version.

Thanks,

        tglx

