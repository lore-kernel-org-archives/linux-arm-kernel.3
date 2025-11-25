Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624C0D0E6DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 13:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mM2gTmZqkqbQTos2ShIiPVJp5nFvqUQjOy+kaEUeiss=; b=NGiDs7H3bDs5w3SGDD4UtUNA2L
	zqxSq+u9Uz+md1pJOCCzJhdN2eG6DlrM0IUMN2ogX/hyHPsT/hF/iqgL58QnCrT3Vrx2gjtEUFMqE
	di0QpvOb/1rDFSSow1e2SC6BKcUbgau/ETmCCES1CF7PCsCUYtnrRCVXnc8Az5fYqfWt49hRnu1o4
	yO7uN4zDpnfMj6acn36Nc92BqFUzqlteO1nxfY3qPeSziCM0DD1NIbd9bD4w+nLiCmHTXjVjC2Qoz
	fs2cIlFnFONi2vbnoBFlgI759iARmLjAGOMNb7JoSXaVJtGKT24zABWhexb5xFiGzGBSzUCFnZ0bl
	eTPmB2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNskz-0000000DJYd-1uYR;
	Tue, 25 Nov 2025 13:06:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNskw-0000000DJYA-3QFk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 13:06:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1494314BF;
	Tue, 25 Nov 2025 05:06:43 -0800 (PST)
Received: from [10.44.160.56] (e126510-lin.lund.arm.com [10.44.160.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2492B3F73B;
	Tue, 25 Nov 2025 05:06:43 -0800 (PST)
Message-ID: <c7032b82-12b3-4334-b568-86cf620c2ee7@arm.com>
Date: Tue, 25 Nov 2025 14:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/11] arm64/ptrace: Split report_syscall()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 akpm@linux-foundation.org, ldv@strace.io, macro@orcam.me.uk, deller@gmx.de,
 mark.rutland@arm.com, song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li, lihongbo22@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
 <20251117133048.53182-2-ruanjinjie@huawei.com>
 <970d9689-4188-4c40-92e6-bdf1e589e8a2@arm.com>
 <9adaa51a-09d1-8450-afb0-838ace0f28e9@huawei.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <9adaa51a-09d1-8450-afb0-838ace0f28e9@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_050654_904905_EA8A783C 
X-CRM114-Status: GOOD (  12.86  )
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

On 19/11/2025 10:49, Jinjie Ruan wrote:
>
> On 2025/11/19 1:09, Kevin Brodsky wrote:
>> On 17/11/2025 14:30, Jinjie Ruan wrote:
>>> The generic syscall entry code has the form:
>>>
>>> | syscall_trace_enter()
>>> | {
>>> |	ptrace_report_syscall_entry()
>>> | }
>>> |
>>> | syscall_exit_work()
>>> | {
>>> |	ptrace_report_syscall_exit()
>>> | }
>>>
>>> In preparation for moving arm64 over to the generic entry code, split
>>> report_syscall() to two separate enter and exit functions to align
>>> the structure of the arm64 code with syscall_trace_enter() and
>>> syscall_exit_work() from the generic entry code.
>>>
>>> No functional changes.
>>>
>>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>>  arch/arm64/kernel/ptrace.c | 29 ++++++++++++++++++++---------
>>>  1 file changed, 20 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>>> index 4b001121c72d..5534c175ceb7 100644
>>> --- a/arch/arm64/kernel/ptrace.c
>>> +++ b/arch/arm64/kernel/ptrace.c
>>> @@ -2317,7 +2317,7 @@ enum ptrace_syscall_dir {
>>>  	PTRACE_SYSCALL_EXIT,
>>>  };
>> This is now unused so it should be removed.
> Sure.

In fact it is not unused, not sure how I missed that... r12/x7 is set to
one of those values during ptrace_syscall_entry().

It would be a good idea to add a comment saying those values are part of
the ABI and must not be changed.

- Kevin

