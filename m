Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF493D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19HAAVgOxijJVWsGhNBm6u6+sThnKdWsvNyZwVWltNA=; b=U2xGLXLW4VhuHFr9uBAHE2Tq8+
	4gMxNguRaNV24FbNmRe42kIYRftQYNzD67HpiNvhlytoKsYOF8H81Lt5yAiwQJB4mP4ZwPdbmfQ9R
	GJ7bFq+b/jXdw/mCmBXixR5Tm9gnuCgGZ7QexwMbMhix/ge7v81ruA/d7/Qs29ndQH2hD3XTmLke/
	Z4BA65/wxdCZ7tiePvOp7aRmek3Erunt+Tupbg/z0GRvyHnH4Jax8jBr/Udt89BB3eVr9eVQEh3UK
	UVOaJ54YTqb4h4ZWQetO2CSC63O9bJYT7XKW02+4qW2AYJx5oFUCmPek2zv4U/dW7UwqyU5HbrR9G
	vlrJWi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvpr-00000000Ieo-1OCE;
	Fri, 28 Nov 2025 10:36:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvpp-00000000IeP-2zoZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 10:36:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E44A176A;
	Fri, 28 Nov 2025 02:36:09 -0800 (PST)
Received: from [10.57.87.167] (unknown [10.57.87.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 395ED3F73B;
	Fri, 28 Nov 2025 02:36:15 -0800 (PST)
Message-ID: <6e4cfa83-3181-4988-a3d8-55e066b68947@arm.com>
Date: Fri, 28 Nov 2025 10:36:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/RFT PATCH 0/6] Improve get_random_u8() for use in randomize
 kstack
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kees Cook <kees@kernel.org>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20251127092226.1439196-8-ardb+git@google.com>
 <b1dae5a7-27bd-42de-bcce-9fd3c2b1c178@arm.com>
 <CAMj1kXE-Qm4DQNAcg8Tg7YM4EMdLBu_UJm7M8Cpk3t5g7XqP5w@mail.gmail.com>
 <e996fdd5-7113-4327-a884-336dd5f77c4d@arm.com>
 <CAMj1kXGyYMy2xhcdNicHkMfWBnEjyhc+xg8ciuR-6WXDxDpZxg@mail.gmail.com>
 <f95593ac-d4cf-4e06-9a94-cc5133897c59@arm.com> <aSiDSp8NpqJkr1oD@J2N7QTR9R3>
 <CAMj1kXF9-tXVQS-_p8c058ssn80xaiDu+01SR98=yQ004xevng@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXF9-tXVQS-_p8c058ssn80xaiDu+01SR98=yQ004xevng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_023617_823523_A9492BEA 
X-CRM114-Status: GOOD (  20.83  )
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

On 27/11/2025 19:01, Ard Biesheuvel wrote:
> On Thu, 27 Nov 2025 at 17:58, Mark Rutland <mark.rutland@arm.com> wrote:
>>
>> On Thu, Nov 27, 2025 at 03:56:59PM +0000, Ryan Roberts wrote:
>>> On 27/11/2025 15:03, Ard Biesheuvel wrote:
>>>> So the question is really whether we want to dedicate 16 bytes per
>>>> task for this. I wouldn't mind personally, but it is something our
>>>> internal QA engineers tend to obsess over.
>>>
>>> Yeah that's a good point.
>>
>> I think it's a fair point that some people will obsesses over this, but
>> I think the concern is misplaced.
>>
>> I know that people were very happy for the kernel FPSIMD context to
>> disappear from task_struct, but 16 bytes is a fair amount smaller, and
>> I'm pretty sure we can offset that with a small/moderate amount of work.
>>
>> AFAICT there are extant holes in task_struct that could easily account
>> for 16 bytes. I can also see a few ways to rework arm64's thread_info
>> and thread_struct (which are both embedded within task_struct) to save
>> some space.
>>
> 
> Oh, I completely agree. But it is going to come up one way or the other.

I'm always terrified of changing the layout of those god structs for fear of
accidentally breaking some cacheline clustering-based micro optimization.
Putting new variables into existing holes is one thing, but rearranging existing
data scares me - perhaps I'm being too cautious. I assumed there wouldn't be an
existing hole big enough for 16 bytes.

> 
>>> Is this something we could potentially keep at the start of the
>>> kstack? Is there any precident for keeping state there at the moment?
>>> For arm64, I know there is a general feeling that 16K for the stack
>>> more than enough (but we are stuck with it because 8K isn't quite
>>> enough). So it would be "for free". I guess it would be tricky to do
>>> this in an arch-agnostic way though...
>>
>> We went out of our way to stop playing silly games like that when we
>> moved thread_info into task_struct; please let's not bring that back.
>>

OK fair enough.

> 
> Agreed. (after just having moved the kernel mode FP/SIMD buffer from
> task_struct to the kernel mode stack :-))


