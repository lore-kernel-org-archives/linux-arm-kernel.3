Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5912DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igEgukfSkxd9Lb0gDtb+b5hHlfZiNI0bOlSQUW3jbLg=; b=TpX0aH0SFbQ4d0bK4NPMJygfsO
	iglQPIHsioSTPavrYidoKBLWAw+KxdXeTJNAiL+o6TkjuFED6S3vHeXhGplC4dzLx7/OtaQh18DVi
	NTfnmjsQigUT1bPePyLo4nmdgaS9xR5nXLvWMPVi4Pd1cPmkTxmtzLN0VQt5mQ514v23MOo8oGdhc
	OKP7rdQ13MJREt+wMGn33LT5Pi1zsvzwRI15GWJIUJ29T9KkEY3BVC+kagz0a6bpdti/Rg/RrD5Sl
	rwNOjkQq6ifVREIp1Q4jY2zQq1SEX7uN0ZWxNYt9KtyGWqbONc8LE27N6V1wbzWYMghojdFqye6Lm
	3COooaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTHQ-00000009glE-0OD8;
	Sun, 05 Jul 2026 20:17:32 +0000
Received: from devianza.investici.org ([2c0f:f930:0:4::108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTHN-00000009gkj-0v4L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 20:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1783282645;
	bh=igEgukfSkxd9Lb0gDtb+b5hHlfZiNI0bOlSQUW3jbLg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Yp81lp6hka566/I/bgdEOy5+VOoNojQqip3RA0McuW/O9kb4fmMHZ8UW6TJviUhE1
	 rAFY/X79D9RDro2RgVmcWAESjKqvPEX7iE7AUAmmaqGPxaEfN8oRbMan8zXdry5rSA
	 XcIPos/X5tz2Zrla5WBlP8ZGuhc1P/vVCooK461M=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with ESMTP id 4gtf114bS8z6vQD;
	Sun, 05 Jul 2026 20:17:25 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4gtf111bYnz4y71;
	Sun, 05 Jul 2026 20:17:25 +0000 (UTC)
Date: Sun, 05 Jul 2026 21:17:25 +0100
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>
CC: Dev Jain <dev.jain@arm.com>, Oliver Upton <oupton@kernel.org>,
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4=5D_KVM=3A_arm64=3A_Record_whe?=
 =?US-ASCII?Q?ther_pKVM_stage_2_mapping_is_cacheable?=
In-Reply-To: <87cxx16vpw.wl-maz@kernel.org>
References: <20260701192428.17430-1-include@grrlz.net> <a3b2423e-d8bc-4713-90ef-5bfac7079834@arm.com> <87echh6xuh.wl-maz@kernel.org> <8D464B64-27CF-4430-8F7F-9E21B77CE4D3@grrlz.net> <87cxx16vpw.wl-maz@kernel.org>
Message-ID: <E9BEEB06-0617-406E-AAE8-41BCC6739003@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_131729_402124_B9E408E5 
X-CRM114-Status: GOOD (  19.50  )
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

On July 5, 2026 9:13:31 PM GMT+01:00, Marc Zyngier <maz@kernel.org> wrote:
>On Sun, 05 Jul 2026 20:29:20 +0100,
>Bradley Morgan <include@grrlz.net> wrote:
>> 
>> On July 5, 2026 8:27:34 PM GMT+01:00, Marc Zyngier <maz@kernel.org>
>wrote:
>> >On Sun, 05 Jul 2026 15:08:58 +0100,
>> >Dev Jain <dev.jain@arm.com> wrote:
>> >> 
>> >> 
>> >> 
>> >> On 02/07/26 12:54 am, Bradley Morgan wrote:
>> >> > pKVM keeps its own mapping list for stage 2 operations. Its flush
>path
>> >> > uses that list directly, so it lost the PTE attribute check done by
>> >the
>> >> > generic stage 2 walker.
>> >> > 
>> >> > Record whether a mapping is cacheable and skip cache maintenance
>for
>> >> > mappings that are not cacheable.
>> >> > 
>> >> > Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
>> >> 
>> >> Is Fixes tag required? If I am reading correctly, Arm ARM says this:
>> >> 
>> >> "For VA-based cache maintenance instructions, the instruction
>operates
>> >on the
>> >> caches regardless of the memory type and cacheability attributes
>marked
>> >for
>> >> the memory address in the VMSA translation table entries. This means
>> >that
>> >> the effects of the cache maintenance instructions can apply
>regardless
>> >of:
>> >>   Whether the address accessed:
>> >>     Is Normal memory or Device memory.
>> >>     Has the Cacheable attribute or the Non-cacheable attribute."
>> >> 
>> >> So nothing goes wrong if we do dcache clean for non-cacheable
>> >> memory.
>> >
>> >Two things:
>> >
>> >- having to perform CMOs for something that is not *expected* to be
>> >  cacheable is both pointless and a contradiction of the intent
>> >
>> >- what you quote is about the nature of the *mapping*, and not the
>> >  memory that is being mapped. Cleaning a dirty cache line on an
>> >  unsuspecting MMIO endpoint is never going to end nicely. Just have a
>> >  try.
>> >
>> >My reading of all this is that a fix indeed is required, and therefore
>> >a Fixes tag *must* be present.
>> >
>> >	M.
>> >
>> >
>> 
>> 
>> Well, fair enough.
>> 
>> It's kind of two things.
>> 
>> 1: A fix
>> 2: a optimization 
>> 
>> I say it's a fix, because it's not fun, no.
>>
>> And I Also say it's a optimization because wasting cycles isn't a good
>> idea, trust me.
>
>This is getting tiresome. Really. And when it comes to wasting cycles,
>you strike me as the expert here.
>
>It's not an optimisation at all. If anything, the test is going to
>cost cycles because there is statistically never a case that you map a
>device with upstream pKVM.
>
>If you call this an optimisation, I'll ask for numbers *proving* this
>is actually one. Do you really want to get down that road?

yeah, lesson learned..

before I embarrass myself more, I'll only respond if I have to...

sorry.

>	M.
>
>

Thanks!

