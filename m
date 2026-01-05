Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF44C2A088
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qj1wWuX/i5Ulu1ZXXq8t5vSSkT9gBOkVJYRGoReWc/M=; b=xufJYAmbg4mSnuVGo6zkQOB22e
	6s71jy0Rgl1QrDXzzUK0kG/RKWMkPhlexxLbSQQXgFMwbIUHPTzmNEVwSDO+UAh9jJ9pLwthq19ok
	4J4TutwLAA1c+SeUDyIBCADFUR9x1F2YNT1cAMuVUU61tqkbhR5RkUqnB2eiCeJ/PHZiMLOFKVLxm
	bDEAZRWlPLg2ehrwfc6LSicCGjsFi1bWxqZwjhSzjtVKJ+6XwX/q7A0DC7iO1KfK+DpYcFAjnfYDn
	PTWpT+0YWWRbcMfiZ2gskGj0wPsGA18WjYvbiKoR9ZTocdcD6rnW3L2IKTSnD/cIb+Q8vyaIc9JEW
	FQ+JkGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchqn-0000000B6sz-3sYs;
	Mon, 05 Jan 2026 10:30:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchql-0000000B6sX-2AfV;
	Mon, 05 Jan 2026 10:30:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45673497;
	Mon,  5 Jan 2026 02:30:00 -0800 (PST)
Received: from [10.1.38.150] (XHFQ2J9959.cambridge.arm.com [10.1.38.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EA473F6A8;
	Mon,  5 Jan 2026 02:30:03 -0800 (PST)
Message-ID: <19a0da52-5322-40b0-9195-5d191f582bc5@arm.com>
Date: Mon, 5 Jan 2026 10:30:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] randomize_kstack: Maintain kstack_offset per task
Content-Language: en-GB
To: David Laight <david.laight.linux@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org,
 stable@vger.kernel.org
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
 <20260102131156.3265118-2-ryan.roberts@arm.com>
 <20260102224432.172b1247@pumpkin>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260102224432.172b1247@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_023011_607690_72AF67FF 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

On 02/01/2026 22:44, David Laight wrote:
> On Fri,  2 Jan 2026 13:11:52 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> kstack_offset was previously maintained per-cpu, but this caused a
>> couple of issues. So let's instead make it per-task.
>>
>> Issue 1: add_random_kstack_offset() and choose_random_kstack_offset()
>> expected and required to be called with interrupts and preemption
>> disabled so that it could manipulate per-cpu state. But arm64, loongarch
>> and risc-v are calling them with interrupts and preemption enabled. I
>> don't _think_ this causes any functional issues, but it's certainly
>> unexpected and could lead to manipulating the wrong cpu's state, which
>> could cause a minor performance degradation due to bouncing the cache
>> lines. By maintaining the state per-task those functions can safely be
>> called in preemptible context.
>>
>> Issue 2: add_random_kstack_offset() is called before executing the
>> syscall and expands the stack using a previously chosen rnadom offset.
>                                                            <>
> 	David

Cheers; will fix in next version.

Thanks,
Ryan

