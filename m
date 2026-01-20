Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D680CA5FA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzCqaWRw4l8YZiXRlEaKsY2UZqzEryF7b+9WjJwCLVI=; b=SdY6uEQKzKK0a7aNGPT3Wo/pkO
	GnUT/JQpdT2J95pTYdjv/vz2Vz4fEZe1bGMcgaQkheOwmdbcDtKWvc4MpjnP1KdAiwIj/hwjMY9gz
	/63G6bXWQNPpKOO3DXV1GVDNOxN95PFfM8UkUbfYtaGBWr+8N2eR+XwHBb4dDIp70lFRkb+u468Eq
	8e8UeXcLzVExs84SAMtzQS5emPwNlWrm1683mPe9FFi0Ph5LaNwU38r8ax9g/mHRtDG7ewOmHGsEj
	N7CwUL/c0kgc01XHaFfcPmAD4F8kvrGrvpfTNm5WBjque/gWMsJcgdqyQc7edUZW52D/qOfKJe0T7
	7kJEeUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEeb-00000004ApR-31Nn;
	Tue, 20 Jan 2026 16:32:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEeX-00000004AoO-1XbN;
	Tue, 20 Jan 2026 16:32:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B3771476;
	Tue, 20 Jan 2026 08:32:16 -0800 (PST)
Received: from [10.1.39.200] (XHFQ2J9959.cambridge.arm.com [10.1.39.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFE823F694;
	Tue, 20 Jan 2026 08:32:18 -0800 (PST)
Message-ID: <785a7d90-babe-43af-93a6-c220c1877bcf@arm.com>
Date: Tue, 20 Jan 2026 16:32:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Fix bugs and performance of kstack offset
 randomisation
Content-Language: en-GB
To: Kees Cook <kees@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
 <20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
 <C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_083225_449484_344D2076 
X-CRM114-Status: GOOD (  16.96  )
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

On 19/01/2026 16:44, Kees Cook wrote:
> 
> 
> On January 19, 2026 8:00:00 AM PST, Dave Hansen <dave.hansen@intel.com> wrote:
>> On 1/19/26 05:01, Ryan Roberts wrote:
>>> x86 (AWS Sapphire Rapids):
>>> +-----------------+--------------+-------------+---------------+
>>> | Benchmark       | Result Class |   v6.18-rc5 | per-task-prng |
>>> |                 |              | rndstack-on |               |
>>> |                 |              |             |               |
>>> +=================+==============+=============+===============+
>>> | syscall/getpid  | mean (ns)    |  (R) 13.32% |     (R) 4.60% |
>>> |                 | p99 (ns)     |  (R) 13.38% |    (R) 18.08% |
>>> |                 | p99.9 (ns)   |      16.26% |    (R) 19.38% |
>>
>> Like you noted, this is surprising. This would be a good thing to make
>> sure it goes in very early after -rc1 and gets plenty of wide testing.
> 
> Right, we are pretty late in the dev cycle (rc6). It would be prudent to get this into -next after the coming rc1 (1 month from now).
> 
> On the other hand, the changes are pretty "binary" in the sense that mistakes should be VERY visible right away. Would it be better to take this into -next immediately instead?

I don't think this question was really addressed to me, but I'll give my opinion
anyway; I agree it's pretty binary - it will either work or it will explode.
I've tested on arm64 and x86_64 so I have high confidence that it works. If you
get it into -next ASAP it has 3 weeks to soak before the merge window opens
right? (Linus said he would do an -rc8 this cycle). That feels like enough time
to me. But it's your tree ;-)

Thanks,
Ryan


> 
>> But I don't see any problems with the approach, and the move to common
>> code looks like a big win as well:
> 
> Agreed; I think it's looking great.
> 


