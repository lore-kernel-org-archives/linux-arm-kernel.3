Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2FFCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 22:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+FDQ7zQAPnlAXJ0xUMPhBN5Vu4l6pnGvG4mZcfsdHU=; b=hlIFkYvPoq3Da9ILHcTkQu94UW
	5BhF1Qe79/8sAe8f8kjCCr7UP3qBkbLwZLQOJsd/VaOACvEPkIVs3NErz4vbcJ1DySFguT6PgoXaE
	2/s8ifFs+M35wOE6XFHb5PEcXBTEP17IH7wrtkBZEtnDhBojewQV0A/422vi0oBiEokJMVyFaRYZO
	Kw+qMduVHWRlHPA7xfJ8v9+4NhbMdXZyy1cD1YrkmPlqXyDHSH/naHHxbmjhr3vf6YhQYHbOFWVOQ
	Qs/FyrkmV04z7fW6Gw5UsJ1UKwVYlXRCLvcps70VsF22YXM6UQ/ZGXyqSpR6KoPhmBCOWIUTmP/E/
	Xo2rfpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ce4-00000004l8o-2eIj;
	Wed, 08 Oct 2025 22:28:28 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ce2-00000004l8O-1gYC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 22:28:27 +0000
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32ecc60c9e6so57140a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 15:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759962505; x=1760567305;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+FDQ7zQAPnlAXJ0xUMPhBN5Vu4l6pnGvG4mZcfsdHU=;
        b=v67qmRAieUItI6VX4NMKRaE/of+0xkPAPQqv+669nAdWUs3yaT7F36/OlghuStVZkz
         Me7UIabdKWJBet+9MdnORmcanIp8EuAK2YQDDNyMZXOJrNVjdNy15ffbw0NaeHo97mjX
         5czfHhqGIUFMzRwvcdI+dlAkGy5kWcDEPlFTM13p0PN2u5Qt3vrh/2LdynJQhVA+BnS4
         dEmhiDCGlCc8ixVZMVUnAlja2T6iPiBn0k9Bj6H5QnIQwfP+nIOYqGDykg/k7640uHpR
         0BAtY9w4YYHQI12mo+LvZ/OMEghrdoGXCHwVLvQD4tRYddMroBhHgYE0QUqwdpVgmSWt
         ygmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSKWsIGTO0ABRz9FGaNKsdubI4bl1syaMOAPzTOEebt77U+XC5yR7e2dnm13WTEUnoY8r3GYt/C73Mc2hqC2iJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxiklzkSRa1GZceLLk/nnbxdBqHDmtPA8pXDvzag0WXYLRCVN84
	b04cUbZADFl7o58fmJoy9mrH0UxPd7ce3F/Sw6gULShjtLotN22FsJgC
X-Gm-Gg: ASbGncuF5ovLVVDY0sm02VGDb4qoWQ4ABMaETiyJ1D8zdSG29AWmRreVDEO2uXxYzTn
	0CXUCGhemIk8tLrgtaSHb66B+bx+7J7vp9HpfA+wMWekiWh2qF3cKmMzj3od7X4p/GZciKgvpKE
	Yu7+dxVY18q/c4l3Z6tJ+/uRHWBR6PrYIFQijqcpmK5t9TUgECxysP8CMTcKZZqbeR3EAXVsz5G
	rYu4yTjyVzvIT4sSKQLlEk2e7uMqlHpfd0PRtv7fXnO4e2uN3xnr9Jv4nmA9A2JuCKVISGWVpEB
	NHjiy2cxTHyTp4hpB20FaRZw+f0P/WNkfla6wQ55PFy9B7381UYUM2I4CSkwY9NB09Rlc2rbpwg
	k/ES5vs2OWCW1tG+vtOFFEjWKSi8/XyzBnN5FL+jqujsZ4qtteAHepWRHhX3QECq+I/vwd3SbUR
	RhhDOhJOV0An9s8Cz3jEBlKGzzj3kbB79U/y5ymli1xg==
X-Google-Smtp-Source: AGHT+IEdZv4j3V0V2ftmpYVdLCo1oL6MXTicZXNitpsrrWfaGVXXmpVpfjZcQG1gnntbQIiScsAVNQ==
X-Received: by 2002:a05:6a20:12c4:b0:2c1:b47d:bcde with SMTP id adf61e73a8af0-32da80da615mr3884733637.1.1759962505124;
        Wed, 08 Oct 2025 15:28:25 -0700 (PDT)
Received: from [192.168.50.136] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b62e3508744sm15811209a12.30.2025.10.08.15.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 15:28:24 -0700 (PDT)
Message-ID: <d0fc7dd9-d921-4d82-9b70-bedca7056961@kzalloc.com>
Date: Thu, 9 Oct 2025 07:28:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: cpufeature: Don't cpu_enable_mte() when
 KASAN_GENERIC is active
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Marc Zyngier
 <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Ard Biesheuvel <ardb@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
References: <20251008210425.125021-3-ysk@kzalloc.com>
 <CA+fCnZcknrhCOskgLLcTn_-o5jSiQsFni7ihMWuc1Qsd-Pu7gg@mail.gmail.com>
Content-Language: en-US
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
In-Reply-To: <CA+fCnZcknrhCOskgLLcTn_-o5jSiQsFni7ihMWuc1Qsd-Pu7gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_152826_450005_43D9F5E8 
X-CRM114-Status: GOOD (  15.65  )
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

Hi Andrey,

On 10/9/25 6:36 AM, Andrey Konovalov wrote:
> On Wed, Oct 8, 2025 at 11:13 PM Yunseong Kim <ysk@kzalloc.com> wrote:
>> [...]
> I do not understand this. Why is Generic KASAN incompatible with MTE?

My board wouldn't boot on the debian debug kernel, so I enabled
earlycon=pl011,0x40d0000 and checked via the UART console.

> Running Generic KASAN in the kernel while having MTE enabled (and e.g.
> used in userspace) seems like a valid combination.

Then it must be caused by something else. Thank you for letting me know.

It seems to be occurring in the call path as follows:

cpu_enable_mte()
 -> try_page_mte_tagging(ZERO_PAGE(0))
   -> VM_WARN_ON_ONCE(folio_test_hugetlb(page_folio(page)));

 https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/include/asm/mte.h#L83

> The crash log above looks like a NULL-ptr-deref. On which line of code
> does it happen?

Decoded stack trace here:

[    0.000000] Unable to handle kernel paging request at virtual address dfff800000000005
[    0.000000] KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
[    0.000000] Mem abort info:
[    0.000000]   ESR = 0x0000000096000005
[    0.000000]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.000000]   SET = 0, FnV = 0
[    0.000000]   EA = 0, S1PTW = 0
[    0.000000]   FSC = 0x05: level 1 translation fault
[    0.000000] Data abort info:
[    0.000000]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[    0.000000]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    0.000000]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.000000] [dfff800000000005] address between user and kernel address ranges
[    0.000000] Internal error: Oops: 0000000096000005 [#1]  SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.17+unreleased-debug-arm64 #1 PREEMPTLAZY  Debian 6.17-1~exp1
[    0.000000] pstate: 800000c9 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.000000] pc : cpu_enable_mte (debian/build/build_arm64_none_debug-arm64/include/linux/page-flags.h:1065 (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/include/asm/mte.h:83 (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:2419 (discriminator 1))
[    0.000000] lr : cpu_enable_mte (debian/build/build_arm64_none_debug-arm64/include/linux/page-flags.h:1065 (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/include/asm/mte.h:83 (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:2419 (discriminator 1))
[    0.000000] sp : ffff800084f67d80
[    0.000000] x29: ffff800084f67d80 x28: 0000000000000043 x27: 0000000000000001
[    0.000000] x26: 0000000000000001 x25: ffff800084204008 x24: ffff800084203da8
[    0.000000] x23: ffff800084204000 x22: ffff800084203000 x21: ffff8000865a8000
[    0.000000] x20: fffffffffffffffe x19: fffffdffddaa6a00 x18: 0000000000000011
[    0.000000] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[    0.000000] x14: 0000000000000000 x13: 0000000000000001 x12: ffff700010a04829
[    0.000000] x11: 1ffff00010a04828 x10: ffff700010a04828 x9 : dfff800000000000
[    0.000000] x8 : ffff800085024143 x7 : 0000000000000001 x6 : ffff700010a04828
[    0.000000] x5 : ffff800084f9d200 x4 : 0000000000000000 x3 : ffff8000800794ac
[    0.000000] x2 : 0000000000000005 x1 : dfff800000000000 x0 : 000000000000002e
[    0.000000] Call trace:
[    0.000000]  cpu_enable_mte (debian/build/build_arm64_none_debug-arm64/√ (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/include/asm/mte.h:83 (discriminator 1) debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:2419 (discriminator 1)) (P)
[    0.000000]  enable_cpu_capabilities (debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:3561 (discriminator 2))
[    0.000000]  setup_boot_cpu_features (debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:3888 debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/cpufeature.c:3906)
[    0.000000]  smp_prepare_boot_cpu (debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/smp.c:466)
[    0.000000]  start_kernel (debian/build/build_arm64_none_debug-arm64/init/main.c:929)
[    0.000000]  __primary_switched (debian/build/build_arm64_none_debug-arm64/arch/arm64/kernel/head.S:247)
[    0.000000] Code: 9100c280 d2d00001 f2fbffe1 d343fc02 (38e16841)
All code
========
   0:	9100c280 	add	x0, x20, #0x30
   4:	d2d00001 	mov	x1, #0x800000000000        	// #140737488355328
   8:	f2fbffe1 	movk	x1, #0xdfff, lsl #48
   c:	d343fc02 	lsr	x2, x0, #3
  10:*	38e16841 	ldrsb	w1, [x2, x1]		<-- trapping instruction

Code starting with the faulting instruction
===========================================
   0:	38e16841 	ldrsb	w1, [x2, x1]
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---


If there are any other points you'd like me to check or directions, please
let me know.

Thank you!

Yunseong


