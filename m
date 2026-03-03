Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A99EC145E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9/R9jHGK3WkzvY5Ld13Rqnr3iuMuxtEV3nciTD+gEc=; b=0/aCMBO4MphB7baLuM3bQ/Ljk8
	fnNMliwRT8+mQQ2I0A0ULI/JznNkW9GYvTWP6UR9X0BemgLdiibVj6pJjnWNYrBsF1w6cesSpkh1H
	iUj+9sRMHGhrcutU/hoSVh+rk/9HOSZlE/2IGIpHDq9hOLSYd3TlKNW7UcNjFtMfqUHkX5XdwKODS
	KX/Rft68aXHY8TBrZgcJnnp6NrX5YAYfQk0w1AXOMN9Tap0Qff3r835lrjN4yqsmlI0JlGNQNtA7g
	V0gx0joBbYAWv5ZRmYIF+Erub3q4vwuCN6+iIphBsW7zAx4XzICxJZJc0PBuCdHLrrshbLvT2NL+o
	CJqX8/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQxv-0000000FLjC-1fbM;
	Tue, 03 Mar 2026 14:43:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQxs-0000000FLiT-3GRc;
	Tue, 03 Mar 2026 14:43:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D7F4497;
	Tue,  3 Mar 2026 06:43:03 -0800 (PST)
Received: from [10.1.31.220] (XHFQ2J9959.cambridge.arm.com [10.1.31.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12EE23F694;
	Tue,  3 Mar 2026 06:43:05 -0800 (PST)
Message-ID: <8c799a17-56e3-4ea4-84a2-b878337bddfd@arm.com>
Date: Tue, 3 Mar 2026 14:43:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Content-Language: en-GB
To: Thomas Gleixner <tglx@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
 <20260119130122.1283821-4-ryan.roberts@arm.com> <87ecmcwjh9.ffs@tglx>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <87ecmcwjh9.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_064312_950910_CE8C66F4 
X-CRM114-Status: GOOD (  13.83  )
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

On 22/02/2026 21:34, Thomas Gleixner wrote:
> On Mon, Jan 19 2026 at 13:01, Ryan Roberts wrote:
>> I tested an earlier version of this change on x86 bare metal and it
>> showed a smaller but still significant improvement. The bare metal
>> system wasn't available this time around so testing was done in a VM
>> instance. I'm guessing the cost of rdtsc is higher for VMs.
> 
> No it's not, unless the hypervisor traps RDTSC, which would be insane as
> that would cause massive regressions all over the place.
> 
> So guessing is not really helpful if you want to argue performance.

Sorry for the slow response. I no longer have access to a recent bare metal x86
system that I can do performance testing on. All I have is the Sapphire Rapids
(m7i.24xlarge) VM.

My original testing was on bare metal Sapphire Rapids (same number of CPUs and
RAM as the VM).

Just to be clear, these are the results I got with bare metal vs vm. Negative is
an improvement (less time). (I)/(R) means statistically significant
improvement/regression:

+-----------------+--------------+---------------+---------------+
| Benchmark       | Result Class |        x86_64 |        x86_64 |
|                 |              |    bare metal |            VM |
+=================+==============+===============+===============+
| syscall/getpid  | mean (ns)    |    (I) -7.69% |   (I) -17.65% |
|                 | p99 (ns)     |         4.14% |   (I) -24.41% |
|                 | p99.9 (ns)   |         2.68% |   (I) -28.52% |
+-----------------+--------------+---------------+---------------+
| syscall/getppid | mean (ns)    |    (I) -5.98% |   (I) -19.24% |
|                 | p99 (ns)     |        -3.11% |   (I) -25.03% |
|                 | p99.9 (ns)   |     (R) 9.84% |   (I) -28.17% |
+-----------------+--------------+---------------+---------------+
| syscall/invalid | mean (ns)    |    (I) -6.94% |   (I) -18.56% |
|                 | p99 (ns)     |    (I) -5.57% |   (I) -20.06% |
|                 | p99.9 (ns)   |    (R) 10.53% |   (I) -25.04% |
+-----------------+--------------+---------------+---------------+

So both sets of results represent an improvement, I would say.

Given the level of review that the series has had, I propose to repost today,
then hopefully Kees will be happy to put it in his branch so that it can get
plenty of linux-next soak testing and if there are any x86 regressions lurking,
hopefully ZeroDay will spot them?

Thanks,
Ryan


> 
> Thanks,
> 
>         tglx


