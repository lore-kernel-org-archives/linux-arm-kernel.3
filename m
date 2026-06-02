Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4144DCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnWH3tLI6N52drYpUlL8fW7DfgVdrk3Ax90RPjTo8KU=; b=To5fy4Mawy6CUrbm4YMfc+u8i3
	xf7HSrE967Ph/GAVFfPNxNsD0DLuPaRk8SQAJefv0I5vJOe1lahOSfV2h7WeBiUCWgFFHp3C1FIvy
	VPLoexktJMI6nwmjlIMFH+o2Cv4MA+K5R18Uh0PdmOayCSlFb2Q2IELim0QzgFe41EoQHYQiTD7+Z
	GxUci8Daz/oz9aP/brLM8B0UGyHiMqE/l4R1OVbRzloCFPuEcutlWw9YX1L5Yp5YJ+/RIiCeUZYtf
	nl2eOtAHMgQIecpFy1fFktHyfQQVfPfhwxaOSveDgqknrFQD9UbaZKHTqIaCdmmTgMdPJXTu3o3sS
	mfnUbRsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKWF-0000000CZK1-3dDS;
	Tue, 02 Jun 2026 08:30:39 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKWC-0000000CZJS-0ZWv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 08:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780389029;
	bh=PT+6lJbxojln0Y3MXIQ5J0jCKL58p13yFJTiQO26mEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZG/8NKhTOheOicD/ZKCr+Y6m9yQdyWFpnBSofLKDQJDgY47n46wSnhwNTk0stkRG
	 9Rg/L96JOFYVHz6KRCDFRSN08vfI2tJfuAo2apcknRdfFJwytTK38NCkqrTsmzdau7
	 ytyNz4jZhNKWgchT/RnsxKv2QtamLLRIcBYiqBmA=
Date: Tue, 2 Jun 2026 10:30:28 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Carlos O'Donell <carlos@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>, 
	Rich Felker <dalias@aerifal.cx>, Torvald Riegel <triegel@redhat.com>, 
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Uros Bizjak <ubizjak@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	kernel-dev@igalia.com
Subject: Re: [PATCH v3 5/5] arm64: vdso32: Implement
 __vdso_futex_robust_try_unlock()
Message-ID: <67474c48-a49f-417c-b440-97db0baee602@t-8ch.de>
References: <20260529-tonyk-robust_arm-v3-0-a6f02684d4fe@igalia.com>
 <20260529-tonyk-robust_arm-v3-5-a6f02684d4fe@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529-tonyk-robust_arm-v3-5-a6f02684d4fe@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_013036_395086_90C49E8E 
X-CRM114-Status: GOOD (  18.32  )
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

On 2026-05-29 13:33:57-0300, André Almeida wrote:
> Based on aarch64 implementation, provide a 32 bit entry point for this vDSO.
> 
> In order to keep compatibility with arm64_futex_robust_unlock_get_pop(),
> make sure to store the pop address at r2.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  arch/arm64/kernel/vdso.c            |  9 +++++++++
>  arch/arm64/kernel/vdso32/Makefile   |  2 +-
>  arch/arm64/kernel/vdso32/vdso.lds.S |  5 +++++
>  arch/arm64/kernel/vdso32/vfutex.c   | 33 +++++++++++++++++++++++++++++++++
>  4 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
> index 76f22ea8e181..3ce9d9d79431 100644
> --- a/arch/arm64/kernel/vdso.c
> +++ b/arch/arm64/kernel/vdso.c
> @@ -71,6 +71,15 @@ static void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_str
>  
>  		futex_set_vdso_cs_range(fd, 0, success, end, false);
>  	}
> +
> +#ifdef CONFIG_COMPAT_VDSO
> +	if (abi == VDSO_ABI_AA32) {
> +		success = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_success);
> +		end = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_end);
> +
> +		futex_set_vdso_cs_range(fd, 1, success, end, true);

Should also be idx = 0, I think.

> +	}
> +#endif
>  }
>  #else
>  static inline void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm) { }
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index 2775843e53cd..cc4248539bec 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -97,7 +97,7 @@ VDSO_LDFLAGS += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
>  munge := ../../../arm/vdso/vdsomunge
>  hostprogs := $(munge)
>  
> -c-obj-vdso := note.o
> +c-obj-vdso := note.o vfutex.o

#ifdef CONFIG_FUTEX_ROBUST_UNLOCK

>  c-obj-vdso-gettimeofday := vgettimeofday.o
>  
>  ifneq ($(c-gettimeofday-y),)
> diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
> index c374fb0146f3..31e0a3770c32 100644
> --- a/arch/arm64/kernel/vdso32/vdso.lds.S
> +++ b/arch/arm64/kernel/vdso32/vdso.lds.S
> @@ -87,6 +87,11 @@ VERSION
>  		__vdso_clock_getres;
>  		__vdso_clock_gettime64;
>  		__vdso_clock_getres_time64;
> +		__vdso_futex_robust_list32_try_unlock;

#ifdef CONFIG_FUTEX_ROBUST_UNLOCK

>  	local: *;
>  	};
>  }
> +
> +VDSO_futex_list32_try_unlock_cs_success = __futex_list32_try_unlock_cs_success;
> +VDSO_futex_list32_try_unlock_cs_start = __futex_list32_try_unlock_cs_start;
> +VDSO_futex_list32_try_unlock_cs_end = __futex_list32_try_unlock_cs_end;

When support for 32-bit robust lists will be added to the 64-bit vDSO
then both vDSOs will have these symbols and they will conflict.
Maybe add VDSO32_SYMBOL() which uses a different namespace than the
regular VDSO_SYMBOL(). And teach gen_vdso_offsets.sh to use that
namespace.

(...)


Thomas

