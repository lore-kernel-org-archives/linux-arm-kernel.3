Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12387D2D8CC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VbdIJzILFQDRG5jsL7qPRw1et9KNoQFCHz5a/Ra582o=; b=oNHVXrZCkRec6P
	Ep9OexTnzicQwsgkYUlZseI8SWvCqWEoqiYwGSn1XfTri+R2jOVG8BkWn9AY1jQ5Ncx2TC5HNiljG
	Aww8Unj7Ni7yLba1gc46p48ZnLfAusDVlaUo/AztmpNb/zsOb39MF+/4Th8w9sNTPQSYdb8SWitHg
	6pyKPJbu67HgtjmwQEPOPopImzcfcTnvKD/utJo4jmRkwIn2YdHSuIArZ/Zye1sT/3iTvS8sktoCp
	EHc2h0YAVmXftpaBg88eC1iWH19upnO3XHoY4RoTSntb+G0L4ytG6csQHk8YseLwqWo/I4GLMsCsQ
	IWW5NYDSMMvYWsQNAcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfcd-0000000DyyU-0Rr7;
	Tue, 27 Jan 2026 09:44:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfca-0000000Dyxm-0C2K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:44:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 154B1497;
	Tue, 27 Jan 2026 01:44:20 -0800 (PST)
Received: from [10.57.54.43] (unknown [10.57.54.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 701203F85F;
	Tue, 27 Jan 2026 01:44:20 -0800 (PST)
Message-ID: <28e54f74-9b3d-4c3c-9172-ceb429e7fcbe@arm.com>
Date: Tue, 27 Jan 2026 10:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/16] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
To: Will Deacon <will@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-6-ruanjinjie@huawei.com>
 <aXe6W69Esd1NLEU8@willie-the-truck>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aXe6W69Esd1NLEU8@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_014428_948168_8F60C172 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, tglx@linutronix.de, richard.weiyang@gmail.com, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, linux-kernel@vger.kernel.org, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 26/01/2026 20:02, Will Deacon wrote:
> On Mon, Dec 22, 2025 at 07:47:26PM +0800, Jinjie Ruan wrote:
>> [...]
>>
>> To make it more reasonable and in preparation for moving arm64 over to
>> the generic entry code, move rseq_syscall() ahead before
>> audit_syscall_exit().
> I've been struggling a bit to see how this helps to align with the
> generic code.

rseq_syscall(), or rather rseq_debug_syscall_return() since eaa9088d568c
("rseq: Use static branch for syscall exit debug when
GENERIC_IRQ_ENTRY=y"), is called first in the generic
syscall_exit_to_user_mode_work(), so the aim of that patch is to align
the order of calls with generic entry.

>  I'm also concerned that rseq_debug_update_user_cs()
> operates on instruction_pointer(regs) which is something that can be
> chaned by ptrace.

Isn't that true regardless of where rseq_syscall() is called on the
syscall exit path, though?

> So, I'm not saying this is wrong, but it feels like a user-visible
> change that needs better justification.

This seems to hang on whether the force_sig(SIGSEGV) that rseq_syscall()
might issue interacts in any way with the tracing calls. My feeling is
that it doesn't, but I haven't confirmed it. Worth noting this is only
relevant if rseq debugging is enabled, so any potential user-visible
effect is limited.

- Kevin

