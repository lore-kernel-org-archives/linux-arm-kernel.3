Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E76CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wa6TFc9OL+cK5v7vkXc9oB2NfQRwG1NMvHL69PFrykQ=; b=a3lna80vaDs4TF3lXgKFg+9aEr
	SvORHcVp0m7R25esXVuD/PcKb656PTc0pXdN9ataArHq72dw9W7Agmkh4d8RwiDW1jYHHIqK041lJ
	1X/vRY/ogfCunBfmYMYkW3x3ARjYzTSNHQZZqhN868jLXUOmjnkykC/WvOyLtyC7U5dD8RLyawDTi
	Mpo9Dt7htDEiWRBMPFjCuwXeY6WTPGYWVnvXA4qr7BSrE6RrCU8KgeWBSfJM+htLbg+izPKHN47eO
	FYu59/fqaA6R6BWXHVoTAV3exvpEcub5gx7OjJzA14pWrnYYs74r6DNNc9jCjKRRsED4io3/wMGEq
	omGakHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyi8-00000006Ldv-3blc;
	Mon, 17 Aug 2026 14:53:12 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyi6-00000006LQL-0ZG5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 14:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=wa6TFc9OL+cK5v7vkXc9oB2NfQRwG1NMvHL69PFrykQ=; b=fAHvbSQnYdOAyveILazATtC2xW
	hmsrrmi+MwlVqrdbK6Dmh7hd2B9/fDs8Dlwka5cmGXWaPOWyTjE45rkxsWswsnp2DJk8MTziFcNJf
	4IdGDFDe9iVXcIRFheuoDdK/Yi1nUYykFyZV9L/vEV7/yy9SDoS7OEYhPJkD/gthqbDhfGV6LdMnH
	ULE/k8QwQ7pFEkDr//lMg09CecI7sgXFayVi4EFjRJvA9VeDmufmPoWUVML+DvAJz1lvsA2ZKME8M
	w7BUUVsPTU1hjrINVWMRBdgkRfm0F+WYqELIXlhOhf8qD3vaSDLDmmk5jX8mL7CjKoQKnXi2YGHcg
	6I68jhIQ==;
Received: from [179.135.28.2] (helo=[192.168.1.56])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wvydl-004bkh-GI; Mon, 17 Aug 2026 16:48:41 +0200
Message-ID: <8207cba6-a6e0-38e6-a1bd-6f4453651793@igalia.com>
Date: Mon, 17 Aug 2026 11:48:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64/kernel: Expose the running CPU of a native task in
 TPIDRRO_EL0
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
 robin.murphy@arm.com, gshan@redhat.com, kernel-dev@igalia.com,
 kernel@gpiccoli.net, Mark Brown <broonie@kernel.org>,
 Ryan Houdek <sonicadvance1@gmail.com>
References: <20260815152759.2046231-1-gpiccoli@igalia.com>
 <aoGIEEje1NIMTjyv@willie-the-truck> <aoLLf_iZq6DLNpLO@arm.com>
Content-Language: en-US
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <aoLLf_iZq6DLNpLO@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_075310_185216_99B0B07D 
X-CRM114-Status: GOOD (  16.82  )
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

On 17/08/2026 05:51, Catalin Marinas wrote:
> On Sun, Aug 16, 2026 at 10:51:12AM +0100, Will Deacon wrote:
>> On Sat, Aug 15, 2026 at 12:19:32PM -0300, Guilherme G. Piccoli wrote:
>>> The register TPIDRRO_EL0 has 2 meanings / usages today, depending on
>>> the mode userspace is running:
>>>
>>> - For native/arm64 mode, this register is always 0 from the userspace
>>>   perspective. In the kernel, it is used during ventry (entry.S) as
>>>   a scratch register, related to KPTI (stashes x30 in fact).
>>>
>>> - For 32-bit compat tasks, this register holds the TLS userspace pointer,
>>>   and is not used for KPTI or anything else in entry.S. This is ABI and
>>>   userspace can count on having a valid TLS pointer there.
>>>
>>> Happens that other operating systems follow a similar approach than 32-bit
>>> compat mode, even for arm64: in both Windows[0] and MacOS (xnu/darwin)[1],
>>> this register is used to hold the running CPU of the current task, hence
>>> offering a very fast / non-syscall way for a given task to figure its
>>> running CPU id.
>>
>> I don't think we should allocate TPIDRRO_EL0 for this as it precludes us
>> using it for anything else in the future. If you want the current CPU,
>> then I think you're better off using either rseq (which I thought could
>> do this) or looking at reviving the vDSO work you mention (but that has
>> unresolved limitations iirc).
> 
> Indeed. IIRC glibc already implements getcpu() using rseq.
> 

Hi Will / Catalin / all,
first of all, thanks for your prompt responses!

I'm a bit confused on what "using the register" means here. We have 2
ways of using it, IIUC:

a) Use it as it's already used today! On kernel space, this register is
kinda free, right? Currently, it's used as the scratch, in the entry.
But nothing prevents other usages, given that, as the final step of exit
to EL0, it's restored to the value of the CPU id. So, AFAIU, it's fair
use on kernel space with or without this patch.

b) Use as in "expose something else to userspace". Is it OK doing that,
even the ARM specification mentioning

"Purpose
Provides a location where software executing at EL1 or higher can store
thread identifying information that is visible to software executing at
EL0, for OS management purposes." ?

Or do you mean exposing **different information** than the pure CPU id,
but still related with thread information?

Would it be better if we guard this usage with a Kconfig? Or as Ryan
already said, prctl flag or another idea?


Finally, I would like to reinforce / disambiguate things here (though
Ryan already mentioned): rseq or vDSO **are not** valid resources for
our use case. What we are really interested is in having this register
filled with CPU id.
Cheers,


Guilherme

