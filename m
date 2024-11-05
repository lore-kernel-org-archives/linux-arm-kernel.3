Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60764D2B925
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TetSS7jFoBp6Tin3h7L23IRUGsf90Xa/sZ5eLbt1uIE=; b=pXWgKGI5FUu7zyIeAtFssGL6m+
	ssnfR/RlrVUI25N2iymdBKolpd7r80OBFsjiu+IEyW8MU6nYhteL2rQpUcW/SsxDKN83efBeCm0kZ
	hwi4wzuoAAkLTOiIYF9kfNLDmHwYOF0Pyg5MQ+BWeTNwmAX9AG3NfmEf+np+9e0Y7f0omdX87QhOP
	hWratvHBQKviTPEymngrxfz90hcCIixzwmAd/nLODoOrKoTnA4Ri84l+uJqOAuX5bH5n+jnVycvBX
	LxjUUwo60YjOsTPogf7MpjtfiuNMf7xfrrI2FQj6hMi9N8gfHy6qKd2vlP9iyBSNk3Zs44gjptWmS
	Uni9GY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JtW-0000000HARH-45oB;
	Tue, 05 Nov 2024 13:46:54 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JrE-0000000HAEe-02SX;
	Tue, 05 Nov 2024 13:45:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21972240006;
	Tue,  5 Nov 2024 13:44:25 +0000 (UTC)
Message-ID: <5dba5a49-91e5-4988-9018-63b146b5e26c@ghiti.fr>
Date: Tue, 5 Nov 2024 14:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] riscv: mm: Log potential KASAN shadow alias
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>,
 Evgenii Stepanov <eugenis@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-6-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241022015913.3524425-6-samuel.holland@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_054432_235464_0FE9A525 
X-CRM114-Status: GOOD (  16.89  )
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

Hi Samuel,

On 22/10/2024 03:57, Samuel Holland wrote:
> When KASAN is enabled, shadow memory is allocated and mapped for all
> legitimate kernel addresses, but not for the entire address space. As a
> result, the kernel can fault when accessing a shadow address computed
> from a bogus pointer. This can be confusing, because the shadow address
> computed for (e.g.) NULL looks nothing like a NULL pointer. To assist
> debugging, if the faulting address might be the result of a KASAN shadow
> memory address computation, report the range of original memory
> addresses that would map to the faulting address.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>   - New patch for v2
>
>   arch/riscv/mm/fault.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index a9f2b4af8f3f..dae1131221b7 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -8,6 +8,7 @@
>   
>   
>   #include <linux/mm.h>
> +#include <linux/kasan.h>
>   #include <linux/kernel.h>
>   #include <linux/interrupt.h>
>   #include <linux/perf_event.h>
> @@ -30,6 +31,8 @@ static void die_kernel_fault(const char *msg, unsigned long addr,
>   	pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n", msg,
>   		addr);
>   
> +	kasan_non_canonical_hook(addr);
> +
>   	bust_spinlocks(0);
>   	die(regs, "Oops");
>   	make_task_dead(SIGKILL);


That's nice, I used to do that by hand :)

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


