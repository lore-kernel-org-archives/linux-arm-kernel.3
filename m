Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124BFC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 10:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0Qu0vwGtAqVL/brCkXgE6uqKeC4NVtshAAbeSU7+aI=; b=Ngdw8BIGjB+cFPHkQr5NiojtL9
	VMF+SsxbxBIIsYEaRJUc9mNPdQttLKERRimp6Sqm0jAQANKaFeAkyrPsfvvtiJ1+F6H3EWzZY8o+8
	7wNiWQ7GWpBKV0p+qp9xzZNaRNQAPMNq0wiE+UuBUgDBeHGt3k8IA2KNp6dg3KA9h74w11yg1GnNl
	JMIHbpVnIDZJ7XuHT3xOmWs6ToQo9yAqDda410MwP+ieXXL88Vv63S5hqwaCYvQMcjA7jSGRG9NbG
	jNvX/XaGpdIfrgNLTpXOGcj2V6COIXT0y4In1og3IgJwntv0iY+imRb4KV6Zvmj+VC0IomD0X83Io
	DPjnNAtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSdm-00000000TXT-1zVj;
	Thu, 13 Aug 2026 10:26:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSdj-00000000TV5-3DWx;
	Thu, 13 Aug 2026 10:26:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67C49153B;
	Thu, 13 Aug 2026 03:26:15 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 857E03F632;
	Thu, 13 Aug 2026 03:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786616779; bh=9rSsdIC/129SZ1WHfCEReTwxxw/QdoL6Qp0KAKAWByI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t3Bl2ZPsyAgEEtp/RWgJ8wXhch92sf7Fi5Jn2n/O3IysUP737x3khQusWpkRkl6eQ
	 zgRInDgxOP9mgG2K33Z9LX0OBE6OkE3R/c7KtrhRZ8Lbyh+7Ha8Wxc+nyIspdacYNd
	 uBFE5ImQ3gH51ksby5neG6vjeN5JuVHGSJHpHE0k=
Message-ID: <f88baccf-6acb-4ded-a6cd-0d9b69965644@arm.com>
Date: Thu, 13 Aug 2026 11:26:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] vDSO: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_032623_894757_C9EE05E8 
X-CRM114-Status: GOOD (  12.68  )
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



On 24/07/2026 14:36, Thomas Weißschuh wrote:
> Always provide the definitions of the VDSO_CLOCKMODE_* constants and
> remove some ifdeffery from the clocksource drivers.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v4:
> - Pick up Ack from Mark Zyngier.
> - Fix '-type d' argument to find.
> - Link to v3: https://patch.msgid.link/20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de
> 
> Changes in v3:
> - Update *all* commit messages to the latest logic.
> - Link to v2: https://patch.msgid.link/20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de
> 
> Changes in v2:
> - Also drop the IS_ENABLED() logic.
> - Link to v1: https://patch.msgid.link/20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de
> 
> ---
> Thomas Weißschuh (7):
>       kbuild: support generated asm-headers in subdirectories
>       vDSO: Make clockmode constants available without CONFIG_GENERIC_GETTIMEOFDAY
>       MIPS: csrc-r4k: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
>       clocksource/drivers/mips-gic-timer: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
>       clocksource/drivers/arm_arch_timer: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
>       clocksource/drivers/timer-riscv: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
>       LoongArch: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
> 
>  arch/loongarch/kernel/time.c           |  2 --
>  arch/mips/kernel/csrc-r4k.c            |  2 --
>  drivers/clocksource/arm_arch_timer.c   |  4 ----
>  drivers/clocksource/mips-gic-timer.c   |  2 --
>  drivers/clocksource/timer-riscv.c      |  4 ----
>  include/asm-generic/Kbuild             |  1 +
>  include/asm-generic/vdso/clocksource.h |  0
>  include/vdso/clocksource.h             |  4 +---
>  scripts/Makefile.asm-headers           | 11 +++++------
>  9 files changed, 7 insertions(+), 23 deletions(-)
> ---
> base-commit: ecacc9c8d3ed0f63065f4a1e94bfd8bf65a3ffaf
> change-id: 20260605-vdso-arch-clockmodes-bfcaf9a2c848
> 
> Best regards,
> --  
> Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 

Thanks for this.

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for the series.

-- 
Regards,
Vincenzo


