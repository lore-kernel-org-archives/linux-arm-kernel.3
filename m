Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB99CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmwiWlv0Ck+IJdd3Cks26VCoCBj9MKGyMc1abZ8u9bc=; b=NbRLs29P4upab/k7xT/kU1ZF4J
	7c3rwGTNogClkh2hXIcwTZVTGELTP4n65lld1ZLIr58BvSzENbbmIt/V47aVsy+xxVfHVHx6r/Zmg
	t9oe7T73iM+8yr3L8G1rV1/RJyCXi9GuPpnsVw6tTp7BdlL7trTZQ2cjuG6jauCX9ruBnRctmB+v6
	R1kuc9kseHA3cY1wzXTY9GzYF2diAUdB7bWXdvI3LmHt81jxRSTTNuJt8nsiFptOtfF8uBV2vJrCO
	h80ENeQqM0OmHvTXfcR53MOhkAG/gtOqxkQEU/gP3O2PWNUWRpKqeBrg0qXL2Lktqe74Igmm/C55F
	PvRWJb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycWf-000000095oF-44Yi;
	Tue, 16 Sep 2025 20:43:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycWd-000000095nB-1lak
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 20:43:44 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758055421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AmwiWlv0Ck+IJdd3Cks26VCoCBj9MKGyMc1abZ8u9bc=;
	b=fHPtAqg+sMLZLZm4bRBdG+NiQpOen4eY6FYi8WhQrq19OvXZnf2i/z2g5rtCmo0qHGtLB+
	SeT7RZAk5FllzyIV1UyDvSAMM994Ex8at8LZHYteYOaPRhs6lS+WvGOPmw655mWBH5clU5
	IOjibH494K6t2MobsKztgrRJ+NAdU4Ff+eu5Rl49LjTLNTxsHPnvl5qHARxH/EEMdJEZiC
	+WIu8Al2sjL+EXjE4Njq3tBtKpetXd2HHl3g1BotVyH8956ySuA60kl8n3BV759LfRhQK5
	JOAXot8OcYRkSoxO6N1w9UO4uDCsuipPa8OMIdLEk0EAzGDgh8gH8jE56BBNlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758055421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AmwiWlv0Ck+IJdd3Cks26VCoCBj9MKGyMc1abZ8u9bc=;
	b=WxlwnHu5OHd/bgNf03lRyfpAkm1XZWwyZSTeEMav+PPR2rXHI/bzmT7JiwFUd4uG6OVxel
	xAvZFpDnubaIGQAw==
To: Nathan Chancellor <nathan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, x86@kernel.org, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2 2/6] kbuild: Disable asm goto on clang < 17
In-Reply-To: <20250916184440.GA1245207@ax162>
References: <20250916163004.674341701@linutronix.de>
 <20250916163252.100835216@linutronix.de> <20250916184440.GA1245207@ax162>
Date: Tue, 16 Sep 2025 22:43:39 +0200
Message-ID: <87ikhi9lhg.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_134343_598978_74EFF35F 
X-CRM114-Status: GOOD (  27.54  )
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

Nathan!

On Tue, Sep 16 2025 at 11:44, Nathan Chancellor wrote:
> First of all, sorry you got bit by this issue.

The real annoying thing was that I could not makes sense of the error
messages and when I started shuffling code around for analysis it got
worse by failing reliably even with one instance or it exposed random
other incomprehensible errors which did not help analysis either.

Sh*t happens :)

> On Tue, Sep 16, 2025 at 06:33:11PM +0200, Thomas Gleixner wrote:
>> clang < 17 fails to use scope local labels with asm goto:
>> 
>>      {
>>      	__label__ local_lbl;
>> 	...
>> 	unsafe_get_user(uval, uaddr, local_lbl);
>> 	...
>> 	return 0;
>> 	local_lbl:
>> 		return -EFAULT;
>>      }
>> 
>> when two such scopes exist in the same function:
>> 
>>   error: cannot jump from this asm goto statement to one of its possible targets
>
> For the record, this is not specific to local labels, unique function
> labels could trigger this error as well, as demonstrated by Nick's test
> case:
>
> https://github.com/ClangBuiltLinux/linux/issues/1886#issuecomment-1636342477

Ah! I somehow failed to find this one.

I was actually trying to create a simple reproducer for using in the
depends on $(success,echo...) magic and could not manage.

The test case in the issue tracker is really helpful as it can be
condensed into the obfuscated C-code contest format required for
'depends on' checks. So we don't need the version number hack for
detecting it. That's definitely preferred as it catches potential
misbehaviour of later versions and of other compilers as well.

I'll send out a revised patch to that effect later.

>> That prevents using local labels for a cleanup based user access mechanism.
>
> Indeed. This has only popped up a couple of times in the past couple of
> years and each time it has been easy enough to work around by shuffling
> the use of asm goto but as cleanup gets used in more places, this is
> likely to cause problems.

Yes. I noticed that moving the label around or rearraning code slightly
makes it go away or even worse, but that's not a real solution :)

>> As there is no way to provide a simple test case for the 'depends on' test
>> in Kconfig, mark ASM goto broken on clang versions < 17 to get this road
>> block out of the way.
>
> That being said, the commit title and message always references asm goto
> in the general sense but this change only affects asm goto with
> outputs.

Right, that's misleading.

> Is it sufficient to resolve the issues you were seeing? As far as I
> understand it, the general issue can affect asm goto with or without
> outputs but I assume x86 won't have any issues because the label is not
> used in __get_user_asm when asm goto with outputs is not supported?

I haven't seen a problem with that yet. So yes, as things stand that
seems to be a ASM_GOTO_OUTPUT issue.

>> +config CLANG_ASM_GOTO_OUTPUT_BROKEN
>> +	bool
>> +	depends on CC_IS_CLANG
>> +	default y if CLANG_VERSION < 170000
>
> Assuming this change sticks, please consider including links to the
> original bug report and the fix in LLVM:
>
>   https://github.com/ClangBuiltLinux/linux/issues/1886
>   https://github.com/llvm/llvm-project/commit/f023f5cdb2e6c19026f04a15b5a935c041835d14

Sure! That's indeed useful.

Thanks,

        tglx

