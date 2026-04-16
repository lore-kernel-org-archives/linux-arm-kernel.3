Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA299F8D772
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 19:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUHI/uE+8wXb1NPS5/0fe9BrIRorqRCB+r5YbC8Vm6c=; b=Rxm5dZ99QfT1y0Fo/dDpKN831f
	H716+5TXOSm76ht+Uw0Cz+HDbuolrtWjvwtI071PctTvUB7v0OPmxsjwSuuxw2DdIoB0Q4uieaOwo
	wia2bzof44bKpXh7wi99dLEaJhf/ooeH85AWaUAdBRFnMRkrN6lweksTmjJ9x+Mp4GrK5cX1jqHm6
	jYD5oSqQBhe8cm+9wjI2r3C2JREFLBpfrkTSUQqC0ftMsVsoS4+S3MxCoFf1o3iOIoBu77AdivsNV
	5qyqc71n8yZGqAyDwUonLK4YWg0kpyDnZa71Kcw60ALXMreUkvvnhdIdDB1fDpE2qd30QYnbqaNLh
	0lAZPfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDSPR-00000002sYp-1WMn;
	Thu, 16 Apr 2026 19:29:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDSPQ-00000002sYO-0O9X;
	Thu, 16 Apr 2026 19:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA94660127;
	Thu, 16 Apr 2026 19:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F0EC2BCAF;
	Thu, 16 Apr 2026 19:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776367790;
	bh=IYYhpzvOPkjnKmWSOWOV2gjFmCyUK20pzUwsrPCl5+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TjiRJ3JYC6H6QODlRe73weMWqu2ToVyxgZaKwDYZeUuXvTFyEukiq8tmP1ejDxYzD
	 rmrx12vxM0g7ZC9obrRxDAfB+VnhJNvbWfFDZNFPe0bmQhLp4LsxxAr5syn+ysbEnb
	 CJFNwSq3IzVphxzvT3UyUKOg1K7FQt/yAeF/6TILljylkaralKACrM4Mn6BgOOeIKv
	 wGHlIow7JIanfsrwpPNBBsFvw34FcmmRQCfrRZvueDO/yyXUoANoGReW/3j6l4sYGi
	 SDFU6WZgysyVavWZIkFYQOfBKcrZOljXUSUoxloeAjzhJrasftfXxGpcy4vC+O3xsf
	 ay/dWzrcNvMPQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-s390@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu
 <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, Michael Grzeschik
 <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, Bernie Thompson
 <bernie@plugable.com>, linux-fbdev@vger.kernel.org, Theodore Tso
 <tytso@mit.edu>, linux-ext4@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, Marco
 Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Richard Henderson
 <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Catalin
 Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, Jonas
 Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Paul Walmsley
 <pjw@kernel.org>, linux-riscv@lists.infradead.org, "David S. Miller"
 <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [patch 35/38] s390: Select ARCH_HAS_RANDOM_ENTROPY
In-Reply-To: <20260416134238.9230Ba6-hca@linux.ibm.com>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.924028412@kernel.org>
 <20260416134238.9230Ba6-hca@linux.ibm.com>
Date: Thu, 16 Apr 2026 21:29:46 +0200
Message-ID: <87y0imemad.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Apr 16 2026 at 15:42, Heiko Carstens wrote:
> On Fri, Apr 10, 2026 at 02:21:19PM +0200, Thomas Gleixner wrote:
>> The only remaining non-architecture usage of get_cycles() is to provide
>> random_get_entropy().
>> 
>> Switch s390 over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
>> providing random_get_entropy() in asm/random.h.
>> 
>> Add 'asm/timex.h' includes to the relevant files, so the global include can
>> be removed once all architectures are converted over.
>> 
>> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
>> Cc: Heiko Carstens <hca@linux.ibm.com>
>> Cc: linux-s390@vger.kernel.org
>> ---
>>  arch/s390/Kconfig              |    1 +
>>  arch/s390/include/asm/random.h |   12 ++++++++++++
>>  arch/s390/include/asm/timex.h  |    6 ------
>>  arch/s390/kernel/time.c        |    1 +
>>  arch/s390/kernel/vtime.c       |    1 +
>>  5 files changed, 15 insertions(+), 6 deletions(-)
>
> Acked-by: Heiko Carstens <hca@linux.ibm.com>
>
> Thomas, would you mind adding the below as minor improvement to this
> series?

Sure. I'll respin it next week.

