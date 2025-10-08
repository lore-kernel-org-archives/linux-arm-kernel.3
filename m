Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FA8CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 23:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+f6ArVeWZd2reFq0nlx9DebYmTrmGwR2XKW8kYdyUtM=; b=GPi0TZxBEhKNSLkYy9KkiN21Ws
	iCBK6Us7TAS9/D7SZjRAWXjIhvf9sUPr0aPIRordFHsw7b4L3tESzBziKtoy8HB4kDmoeUhHoKGus
	J7jVbwPYtkPabmgm3X2Ezgb82tevFohbfHdxfjzgmsGI66a75+0fDzlwXT0vg/gkDYtjcUjWvXP3s
	l/z3Xn0X+kKJFMYYx4SwErlHp7PYT6JjfmjugsJoIkxonQPBciuCiuWaccvQlMahpms4R4D447ZTB
	JZZDQy6mWI3VD8EXweTW9LBeIzFapMOv7zN3rkhslFA7sMexuR5wePXZqJARXEsCQ56VWTgheOeJs
	qLYVSAdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6dJG-00000004n6a-3VpT;
	Wed, 08 Oct 2025 23:11:02 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6dJE-00000004n6B-0TjY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 23:11:01 +0000
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-32edcc68e0fso72473a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 16:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759965059; x=1760569859;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+f6ArVeWZd2reFq0nlx9DebYmTrmGwR2XKW8kYdyUtM=;
        b=mdqlkb+t3JHzefWsxzo6pjOQllqG1cSiznZXV8ef7ZofyyBm/Ih6oWaPjXUAk1ITnu
         eDIV30cCmaU+fvK1Y7+nnpO4xNtDmfcBNLYuEr0iZDxv/aVhA3IaC6rn1tUf4wRdZOPH
         3QTime4GDuhBFywIStRhQuhHbwPBr7kJp/gTfcG0cydWx03gxgehp5SAh89p1zGz1XBX
         09H8kAi06tQwDPf8nXWuMIHjlkbfbhhZJesItOQN+xt8coaZoW98d3n/wZCnEoD7wbB2
         Ae1oUuQkHgBvD1A887hNIRKqX5/Jmvjq+FaG764mK8ZBQrKZoxGcZAMATnbK3HAwuayw
         3dBw==
X-Forwarded-Encrypted: i=1; AJvYcCVSM5TqEJgD8qzmrt9UudrMObU0xR4HdMvafCeRYkFaDpp4AOMO7bHbbYoT1agg1D711fT6ahmqPtQc4CG4xq6v@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz0l/BKMjkJMMv3SgbUUvx9cUjjKucSkwhkOFjsrXusCufVGHg
	eJbXRYoI3drKi9jFfXS3Mfo7qoFz/ySkosEhHYOjmbrElx7NILX4y6Xj
X-Gm-Gg: ASbGncsBcESgtLsKYmc4hl1eNlcugUSBW/IzLlvvQWtqGkI9Y3loa6WqIoH4I4STfYn
	pNB/ln+LqymkyWuQkanxmxm5RPp474PLZ5cyj0NbCuCyhiiM4zAGh6TdJYOd6deVmEHi/KgAAOn
	Ewf8KQ20Xt4fCsG/xVSaeBQleXVeoqnYXB7+6khAIs+94VTF7KQc+MWOrgjIg06E1ULD3sx/xUS
	o1K88FwpuqJl0apekHQz/m7amgUn25qH83pJBo2itwx+kUaz201pjLZQDDG4vnktZKOegTkEaoA
	bEjjeRxDb6Isjwt0fA+XeZ5EMl4ToiY7LFo1ur/JCwUqC7zpS9oWk1m4gsVWknqgbImqVJpsEcP
	SQEV3UgQLN0F51RQOebWxabM69L10Z9o+xttuTsTJf66iDK4lvFic90MAt3tDfv49/LoZlXv3ww
	aodenOVRQNWeiUZd4DslYxjYpJvV0vNm9i76ny1M7upA==
X-Google-Smtp-Source: AGHT+IHYx7yW+JTJ5Vs8n0h3lqIBDwvHJUxcle/Y9dCGu8zkNMcwMzSHyFZOcfaJ/LG/hQU90oGRKA==
X-Received: by 2002:a17:90b:3889:b0:32b:dfd7:e42c with SMTP id 98e67ed59e1d1-33b5139575bmr3708891a91.5.1759965058889;
        Wed, 08 Oct 2025 16:10:58 -0700 (PDT)
Received: from [192.168.50.136] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510ff99dsm4801947a91.6.2025.10.08.16.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 16:10:58 -0700 (PDT)
Message-ID: <2b8e3ca5-1645-489c-9d7f-dd13e5fc43ed@kzalloc.com>
Date: Thu, 9 Oct 2025 08:10:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: cpufeature: Don't cpu_enable_mte() when
 KASAN_GENERIC is active
From: Yunseong Kim <ysk@kzalloc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Ard Biesheuvel <ardb@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
References: <20251008210425.125021-3-ysk@kzalloc.com>
 <CA+fCnZcknrhCOskgLLcTn_-o5jSiQsFni7ihMWuc1Qsd-Pu7gg@mail.gmail.com>
 <d0fc7dd9-d921-4d82-9b70-bedca7056961@kzalloc.com>
Content-Language: en-US
Organization: kzalloc
In-Reply-To: <d0fc7dd9-d921-4d82-9b70-bedca7056961@kzalloc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_161100_156616_2A1EE340 
X-CRM114-Status: GOOD (  24.74  )
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

To summarize my situation, I thought the boot panic issue might be due
to incompatibility between MTE and KASAN Generic, so I sent this patch.

However, it seems that the problem is related to the call path involving
ZERO page. Also, I am curious how it works correctly in other machine.

On 10/9/25 7:28 AM, Yunseong Kim wrote:
> Hi Andrey,
> 
> On 10/9/25 6:36 AM, Andrey Konovalov wrote:
>> On Wed, Oct 8, 2025 at 11:13 PM Yunseong Kim <ysk@kzalloc.com> wrote:
>>> [...]
>> I do not understand this. Why is Generic KASAN incompatible with MTE?
> 
> My board wouldn't boot on the debian debug kernel, so I enabled
> earlycon=pl011,0x40d0000 and checked via the UART console.
> 
>> Running Generic KASAN in the kernel while having MTE enabled (and e.g.
>> used in userspace) seems like a valid combination.
> 
> Then it must be caused by something else. Thank you for letting me know.
> 
> It seems to be occurring in the call path as follows:
> 
> cpu_enable_mte()
>  -> try_page_mte_tagging(ZERO_PAGE(0))
>    -> VM_WARN_ON_ONCE(folio_test_hugetlb(page_folio(page)));
> 
>  https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/include/asm/mte.h#L83

 -> page_folio(ZERO_PAGE(0))
  -> (struct folio *)_compound_head(ZERO_PAGE(0))

 https://elixir.bootlin.com/linux/v6.17/source/include/linux/page-flags.h#L307

>> The crash log above looks like a NULL-ptr-deref. On which line of code
>> does it happen?
> 
> Decoded stack trace here:
> 
> [    0.000000] Unable to handle kernel paging request at virtual address dfff800000000005
> [    0.000000] KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
> [    0.000000] Mem abort info:
> [    0.000000]   ESR = 0x0000000096000005
> [    0.000000]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.000000]   SET = 0, FnV = 0
> [    0.000000]   EA = 0, S1PTW = 0
> [    0.000000]   FSC = 0x05: level 1 translation fault
> [    0.000000] Data abort info:
> [    0.000000]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
> [    0.000000]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    0.000000]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    0.000000] [dfff800000000005] address between user and kernel address ranges
> [    0.000000] Internal error: Oops: 0000000096000005 [#1]  SMP
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.17+unreleased-debug-arm64 #1 PREEMPTLAZY  Debian 6.17-1~exp1
> [    0.000000] pstate: 800000c9 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.000000] pc : cpu_enable_mte (debian/build/build_arm64_none_debug-arm64/include/linux/page-flags.h:1065 (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/include/asm/mte.h:83 (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:2419 (discriminator 1))
> [    0.000000] lr : cpu_enable_mte (debian/build/build_arm64_none_debug-arm64/include/linux/page-flags.h:1065 (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/include/asm/mte.h:83 (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:2419 (discriminator 1))
> [    0.000000] sp : ffff800084f67d80
> [    0.000000] x29: ffff800084f67d80 x28: 0000000000000043 x27: 0000000000000001
> [    0.000000] x26: 0000000000000001 x25: ffff800084204008 x24: ffff800084203da8
> [    0.000000] x23: ffff800084204000 x22: ffff800084203000 x21: ffff8000865a8000
> [    0.000000] x20: fffffffffffffffe x19: fffffdffddaa6a00 x18: 0000000000000011
> [    0.000000] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [    0.000000] x14: 0000000000000000 x13: 0000000000000001 x12: ffff700010a04829
> [    0.000000] x11: 1ffff00010a04828 x10: ffff700010a04828 x9 : dfff800000000000
> [    0.000000] x8 : ffff800085024143 x7 : 0000000000000001 x6 : ffff700010a04828
> [    0.000000] x5 : ffff800084f9d200 x4 : 0000000000000000 x3 : ffff8000800794ac
> [    0.000000] x2 : 0000000000000005 x1 : dfff800000000000 x0 : 000000000000002e
> [    0.000000] Call trace:
> [    0.000000]  cpu_enable_mte (debian/build/build_arm64_none_debug-arm64/√ (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/include/asm/mte.h:83 (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:2419 (discriminator 1)) (P)
> [    0.000000]  enable_cpu_capabilities (debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:3561 (discriminator 2))
> [    0.000000]  setup_boot_cpu_features (debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:3888 debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:3906)
> [    0.000000]  smp_prepare_boot_cpu (debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/smp.c:466)
> [    0.000000]  start_kernel (debian/build/build_arm64_none_debug-arm64/init/main.c:929)
> [    0.000000]  __primary_switched (debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/head.S:247)
> [    0.000000] Code: 9100c280 d2d00001 f2fbffe1 d343fc02 (38e16841)
> All code
> ========
>    0:	9100c280 	add	x0, x20, #0x30
>    4:	d2d00001 	mov	x1, #0x800000000000        	// #140737488355328
>    8:	f2fbffe1 	movk	x1, #0xdfff, lsl #48
>    c:	d343fc02 	lsr	x2, x0, #3
>   10:*	38e16841 	ldrsb	w1, [x2, x1]		<-- trapping instruction
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	38e16841 	ldrsb	w1, [x2, x1]
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> 
> 
> If there are any other points you'd like me to check or directions, please
> let me know.
> 
> Thank you!
> 
> Yunseong

Best regards,
Yunseong


