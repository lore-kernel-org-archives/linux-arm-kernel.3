Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042BBCD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDYAlmQq2lyT0mKI/5jPVDdXiqH331Ok6KPFJGIkolA=; b=PZ+mgQTESj+xIp+UJmCt8imTo9
	fdL2bPrg5EoV29BONAaD6O02ed1tTZyw+D0QRJDqnSxmaGwAVgEiLoEHXxnTuTmfNBHErWHFgnlBD
	/mrUXYDswq+qD9lpS87sQfjhHf9oZWDlW/wInDjN4p2PUoA3s2TmDqhX8pBqJCSleiO29a+cGR9Dc
	4WJsLkQon95JHhPbHOQdHniBYn7Qo9dU2ofpod/gQeQ2gwjFXp+UqvxFmWMb6CsAcBVSG9qEsZUxL
	CvWyv9uhDMHezgabnRpzjeZh7mNARYEFVnQSG/Fo8kPO2mFpG/XynYJbkzjF2JhqXVPnMKZepWdRw
	rCtEmTjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyW0-00000007ZW7-1Fsx;
	Fri, 29 May 2026 14:48:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyVW-00000007ZDV-2hLw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:48:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11C3143C49;
	Fri, 29 May 2026 14:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AE01F00893;
	Fri, 29 May 2026 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780066097;
	bh=rDYAlmQq2lyT0mKI/5jPVDdXiqH331Ok6KPFJGIkolA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=QX53BMvHmF9Tb016y6OiviqLZpdCcXakEzemQvHAIKHZmDwqrBZ9kKc4eGKH+DM7R
	 m6NOmObiOsgEXE9+ZMADhdk8mZfU87xXkUaBGEAcA4R/n1Q0380J4hxoJ7N0rnzntx
	 pFEysq+iLGkMo4UZG6c2O5zG2qvZnbaM4aRgHF8b7tVhZ0eU4aaL0+tAbGi4TYbB5o
	 Xheulmx2TTK+BQxu8Uw+3F7ThLsqWRwQiQ1T5gSGNdwLENawgUsV9l1gvVhixOS8J1
	 nEYMDyX4++E76AADfsobhXucTV82EArbMolMJmHNQPts4kqOycyQ2QOqeHTZnczoo6
	 2bjirJ6ob0crg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9B26AF4006B;
	Fri, 29 May 2026 10:48:15 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Fri, 29 May 2026 10:48:15 -0400
X-ME-Sender: <xms:L6cZalvqhsB-aHhaRkze_h7UY2ABhSZeFnZ60Q3_IKMDCODR4iuKzA>
    <xme:L6cZapRecgER7059-g_h5SmbR74_rDZdbLKHp8wKImrL7GCvJSuQ-czyG9PRHVNgX
    LodoT-OBe61zEkLfQ414HQKZYu3vF8l4Y7Vj5axhKW3qvVV9XuVlw0>
X-ME-Proxy-Cause: dmFkZTGt+msDe027/QMow7WM2h4XBrXubrUHHx9XVuKXNuewjeECntXEkvpZpwjkpuwWEv
    A+IG7AeFN5owfWzwbPO9CjcB7TRAAsY44WxF7zXFXy6LoVGUAKFH2Bx1eeqBPzIerpvVjv
    ELx4NQx0XG6whtq/UTw90jigQlW4j18Zh0Zt1+paIGSTOJ9ku9oHpPkPFvh0lxBxqNkgBT
    FnRPsw9ol+7BaTbq+VC3GgNlb/hfOhjgLaPfDPKB8smIObxRKijH1R3rHFi8eHD+NkkdLJ
    A7LUeOTltjqUyU3MM5Wv53HhVF64Qimbf03q9/pBfm6OGXhfkEoLOeymapiGYXWuW7kwNp
    ckYNzIG87pXFDqxBpRSEjOxQSObcP/T++yyH1GkG3YItNvgZi8BW7YZJf0oLK1Eiu9ctpj
    e/Qrzm63c6EjvCPOKuUOldqVtQ9ZHP5SjAUyNeaZsq8FP10znmcrDkJjKhmkqvgalMjmqj
    5yI6GJ6yQK3gJ/0sFlH1xfNMM7hLe/tXPVaeY8cRX+7fv6nhbeMCau2aQ4gfKKOCQInygr
    DX9MXYrq5o/uY7i19kTROhADx/RRu9bkIc+kVBeOktIvcQ1AMx9acT0YqOTPMhDzC2jr7R
    qbv5MzK1kh98MwYu6S2aUc5FDL3Tal9kQVrQ86RuzLjlmuBz9HkOhgZjLFug
X-ME-Proxy: <xmx:L6cZanX74O-bar_jLvxjWKCnp-Ih7O5QrV09suBOhbCd2rIrR9xQeA>
    <xmx:L6cZamrF7UpYic3Pul9sEvDf0nlILb6aAYq-n3JKJgUil7UpBZORtQ>
    <xmx:L6cZarFrHHphMz_k0i3sOdMq0fdtjxTfs29QHz9bIdolxCo5oEEGVA>
    <xmx:L6cZaouUFRbFWAprH-4qWiANOmu1DUXbhNuFie1nlzyqPUFP98ZCWQ>
    <xmx:L6cZauQug8MFn_HvWRIXz9IpPD4mlQQP6iSw5xCI5jVhcTfQZiXZW5o_>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 780D8182007A; Fri, 29 May 2026 10:48:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 29 May 2026 16:47:54 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "David Hildenbrand" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Jann Horn" <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Message-Id: <feab72b8-2961-4145-ac5c-80e820bf1ce9@app.fastmail.com>
In-Reply-To: <b76b327f-612e-494f-b8d3-44108aa73d2a@arm.com>
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-26-ardb+git@google.com>
 <2a6f9f05-ac57-4ef8-9328-74cc8ccfea16@arm.com>
 <96a8b6b9-71f2-4550-bbbb-fbfa146f4e6a@app.fastmail.com>
 <b76b327f-612e-494f-b8d3-44108aa73d2a@arm.com>
Subject: Re: [PATCH v6 09/15] arm64: Move fixmap and kasan page tables to end of kernel
 image
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074818_740659_FB18CC3B 
X-CRM114-Status: GOOD (  18.60  )
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

On Fri, 29 May 2026, at 16:42, Kevin Brodsky wrote:
> On 29/05/2026 13:19, Ard Biesheuvel wrote:
>> On Fri, 29 May 2026, at 10:27, Kevin Brodsky wrote:
>>> On 26/05/2026 19:58, Ard Biesheuvel wrote:
>>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>>
>>>> Move the fixmap and kasan page tables out of the BSS section, and place
>>>> them at the end of the image, right before the init_pg_dir section where
>>>> some of the other statically allocated page tables live.
>>>>
>>>> These page tables are currently the only data objects in vmlinux that
>>>> are meant to be accessed via the kernel image's linear alias, and so
>>>> placing them together allows the remainder of the data/bss section to be
>>>> remapped read-only or unmapped entirely.
>>>>
>>>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>>> ---
>>>>  arch/arm64/include/asm/mmu.h    | 2 ++
>>>>  arch/arm64/kernel/vmlinux.lds.S | 8 +++++++-
>>>>  arch/arm64/mm/fixmap.c          | 6 +++---
>>>>  arch/arm64/mm/kasan_init.c      | 2 +-
>>>>  4 files changed, 13 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
>>>> index 5e1211c540ab..fb95754f2876 100644
>>>> --- a/arch/arm64/include/asm/mmu.h
>>>> +++ b/arch/arm64/include/asm/mmu.h
>>>> @@ -13,6 +13,8 @@
>>>>  
>>>>  #ifndef __ASSEMBLER__
>>>>  
>>>> +#define __pgtbl_bss __section(".pgdir.bss") __aligned(PAGE_SIZE)
>>>> +
>>>>  #include <linux/refcount.h>
>>>>  #include <asm/cpufeature.h>
>>>>  
>>>> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
>>>> index e1ac876200a3..2b0ebfb30c63 100644
>>>> --- a/arch/arm64/kernel/vmlinux.lds.S
>>>> +++ b/arch/arm64/kernel/vmlinux.lds.S
>>>> @@ -349,9 +349,15 @@ SECTIONS
>>>>  	_edata = .;
>>>>  
>>>>  	/* start of zero-init region */
>>>> -	BSS_SECTION(SBSS_ALIGN, 0, 0)
>>>> +	BSS_SECTION(SBSS_ALIGN, 0, PAGE_SIZE)
>>>>  	__pi___bss_start = __bss_start;
>>>>  
>>>> +	/* fixmap BSS starts here - preceding data/BSS is omitted from the linear map */
>>>> +	.pgdir.bss (NOLOAD) : ALIGN(PAGE_SIZE) {
>>> Do we actually need the NOLOAD type here?
>> Yes, otherwise it is emitted as PROGBITS, resulting in all of BSS to be
>> emitted into Image.
>
> That's rather strange, aren't the .pgdir.bss input sections already
> NOBITS since __pgtbl_bss is only used on default-initialised globals?

Not sure why, but the section was PROGBITS not NOBITS before I added the (NOLOAD)

> Also AFAIU NOLOAD does not prevent the output section from being emitted
> into the ELF file.
>

NOLOAD marks it as NOBITS, which means there is no data in the file that should
be used to populate the section in memory.


