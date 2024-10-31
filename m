Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE4AD74958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEZ3WAdK/kOGgzHGx9bh509zo56x8Bp/oGEk2s9V5Io=; b=t3EndFzXKs9uHDmn1bavsdPTlU
	qViqwWnpVbED6R6NaPLlnABX3QzmhtugdjK9Wq3JjXHOeyMkr4JUH/EHar4Z6EEjrHrw0HjksQoun
	C1EwX7VGJCKchDYi0P+vXg44/MDlbtcx6PaSyRTlPPH+x5EKd2uAi+Y5sQtWvPoEu1H5A7Zg/MgUt
	wC+SHkHsIBgryhDs2irVBmkf5856hgsq7Fd0efBCvmfOM8aAav30Xtb6wvoJ6lAoXsXQspFOcwRPv
	Wi0/sEZgRLVCMPi6e9BEmn6s2wOHEdj78oyA8x8MBIpvfh/QYKV91H7noiDeOoFdqoTtxMhZ0sHoC
	8HJ+PtZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ux7-00000003e6b-2jR6;
	Thu, 31 Oct 2024 13:11:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Uma-00000003cFe-2i1n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 13:00:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 771CA1063;
	Thu, 31 Oct 2024 06:00:41 -0700 (PDT)
Received: from [10.44.160.105] (e126510-lin.lund.arm.com [10.44.160.105])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98ACC3F528;
	Thu, 31 Oct 2024 06:00:06 -0700 (PDT)
Message-ID: <8dcc7e49-ec95-4d7d-8ded-d4f7202d623d@arm.com>
Date: Thu, 31 Oct 2024 14:00:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Improve arm64 pkeys handling in signal delivery
To: Jeff Xu <jeffxu@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
 anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com, broonie@kernel.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, Dave.Martin@arm.com,
 joey.gouly@arm.com, keith.lucas@oracle.com, pierre.langlois@arm.com,
 shuah@kernel.org, sroettger@google.com, tglx@linutronix.de, will@kernel.org,
 yury.khrustalev@arm.com, linux-kselftest@vger.kernel.org, x86@kernel.org,
 Kees Cook <keescook@chromium.org>,
 Jorge Lucangeli Obes <jorgelo@chromium.org>, Jann Horn <jannh@google.com>
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
 <CABi2SkW4Utuo3qGKodTQn7VuFrRa4hpwrik7WaorS4=wm_cS2g@mail.gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <CABi2SkW4Utuo3qGKodTQn7VuFrRa4hpwrik7WaorS4=wm_cS2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_060012_882234_87AF2C01 
X-CRM114-Status: GOOD (  21.77  )
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

On 30/10/2024 22:59, Jeff Xu wrote:
> Apologize in advance that I'm unfamiliar with ARM's POR, up to review
> this patch series, so I might ask silly questions or based on wrong
> understanding.

That's no problem, your input is very welcome! There is no fundamental
difference between POR and PKRU AFAIK - the encoding is different, but
the principle is the same. The main thing to keep in mind is that POE
(the arm64 extension) allows restricting execution in addition to
read/write.

> It seems that the patch has the same logic as Aruna Ramakrishna
> proposed for X86, is this correct ?

Yes, patch 1 aims at aligning arm64 with x86 (same behaviour). Going
forward I think we should try and keep the arm64 and x86 handling of
pkeys as consistent as possible.

> In the latest version of x86 change [1], I have a comment if we want
> to consider adding a new flag SS_PKEYALTSTACK (see SS_AUTODISARM as an
> example) in sigaltstack, and restrict this mechanism (overwriting
> PKRU/POR_EL0 and sigframe)  to sigaltstack() with SS_PKEYALTSTACK.
> There is a subtle difference if we do that, i.e. the existing
> signaling handling user might not care or do not use PKEY/POE, and
> overwriting PKRU/POR_EL0 and  sigframe every time will add extra CPU
> time on the signaling delivery, which could be real-time sensitive.

From a purely functional perspective, resetting POR to allow access to
all pkeys before writing the signal frame should be safe in any context,
and allows keeping the handling simple (no conditional code). The
performance aspect is a fair point though, as we are adding an ISB
(synchronisation barrier) on the signal delivery path if POE is supported.

> Since I raised this comment on X86, I think raising it for ARM for
> discussion would be ok,
> it might make sense to have consistent API experience for arm/x86 here.

And indeed this is what I think is most important at this point.
Considering that Aruna's series resets PKRU unconditionally (sigaltstack
or not) and has already been pulled into mainline during 6.12-rc1 [2], I
still believe that patch 1 is doing the right thing, i.e. aligning arm64
with x86. If the concern with performance is confirmed, and there is an
agreement to reset POR/PKRU less eagerly on both architectures, this
could potentially be revisited.

- Kevin

[2]
https://lore.kernel.org/lkml/172656199227.2471820.13578261908219597067.tglx@xen13/

> [1] https://lore.kernel.org/lkml/CABi2SkWjF2Sicrr71=a6H8XJyf9q9L_Nd5FPp0CJ2mvB46Rrrg@mail.gmail.com/


