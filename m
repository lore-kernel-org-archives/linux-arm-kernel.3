Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEEDD1951D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 21:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdffSHeo/iYpRVNWqMXBIRygwWn3EwsHPHsZ8am4tRk=; b=3T38NAQuRvPM2yHk1FhujbAOj3
	KJbltpnluLu9ji6QG0OIC60T8Az4G9/eKqmta+TBmjNr8dO0qP2iumaY7BokpjeaeqI5g0cKWGt0z
	iO3Sdo/IqjDCgnpJ4pO+iByj9gQLUsh1+KscaR+tn+lNHf78FqVg/70Wd5YIUTFvifWUbIuxfgjA5
	ATXP8wisL1dXnyF+E9suBHlqauGGKQ6ENykU+KLVJB5WlDU12q1Px8yQcdAfN+8mP0YAaFmXpjNDj
	FanFtVKLAeBzJ/MN3ETMoh7uwyEmOAWbdqkbL3/OTTeG9cpFG8/b+nHNqT5Trh/8b1cg9j+v0gH/U
	xwOWIWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkUBp-0000000DHGH-3jGb;
	Mon, 26 Jan 2026 21:32:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkUBn-0000000DHFt-40vg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 21:32:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a0d06cfa93so6955ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 13:32:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769463122; cv=none;
        d=google.com; s=arc-20240605;
        b=huzo+UVgF1Lv+kTAnGQFP/raBG9u4UAkTkBSnPk3SD8zAPxq/sExOYdLzdCvq13fCj
         yS4gMT4I9ctcP/UQkiJEm+IuN2BKY0ZS/SVC6m+WzhtGotcjuemTd3KbUyfy4YIVgiGJ
         Zvztemg2ppjLmxVTDdodZDwBL1n8ITAS2iD1ZuF8ROwlFjc2XiV2p6MJwCRjGyyOu3rp
         iuTF6ZTcHl/r//gOWFX+8ev5Rs+CDE3y0QuoT2XWsZdDBh3lJ1UXh8xaDr2Naj8LE2UF
         E+PPaLSebJEF1WbaUy57QEfSAQzaQktmVIZNkvT1nA3oEbLa3FF9lhygM/jlhYJbrYJZ
         W99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GdffSHeo/iYpRVNWqMXBIRygwWn3EwsHPHsZ8am4tRk=;
        fh=6XD8V0aYFoWkAr3GA/eZcf8YHIINOXfAeEBJXX+B/sw=;
        b=dSW6H309llsvtIkBed9EXaI2kOx0fpE32hY8eqCbPY4S9bVZ/hARZrk7A8QQcdsSky
         RE2jNbhKdeR37sW5xLsE9a1f0Dzu+5eCG9pBAc0V4CQ3bR1R7krQOOQ6tvCRkt3vknj7
         6+l1vufGg8I1wrT34La3Oh8X5OVIPJbIyK+hqKM5FsgejwFjge7dzddW9oQLd9m9kdWE
         6+/RPcHt0UmqvLOUE9yGegJZqhk5saww3p36CPbX2TL+f3tCQl29HnV5oq6KucbkuhZX
         yf4mspZkvZeJ1F98qAqnPKJovg83zvu/349KxHdjxjjTqVvrIz4gvOBuDYtMK/1ir7YA
         zG9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769463122; x=1770067922; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdffSHeo/iYpRVNWqMXBIRygwWn3EwsHPHsZ8am4tRk=;
        b=F1n79A1uwbNM7Z+HFI7wLXIMahuqUg2s6wre3XzLa6QJub9jM97dwuuZ29RQfhr7q2
         WAxidMX/4t02Ky54A49rbJz60nosUpRbFBCgKbiPnPmB74U5/OO2YE3+BLdw9GKG0Opl
         Xf523cUwFpRXtjsm+PDnCXT+AMOLqPEG53JyKFmTT/jVLgfxtyNsYPGXe/26zSyf7OZa
         6YAl+1/ZzCjQqsPUB9l1z3q7nxdkZkj0ljCe9PSCvD8yn0eGB6YkYir/EuTLhA5Gs5tF
         M/uSiXGjB4PldwN5g3hRtKsM9yRj/wKwkFyuuAvXrcTRcw7O4Fi46BHjFkKDBYj6mfTI
         bEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769463122; x=1770067922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GdffSHeo/iYpRVNWqMXBIRygwWn3EwsHPHsZ8am4tRk=;
        b=Cm16u+Vj+BQsD7JpXKOhNkRzV6C8Asu6jH6R6Uvl0MnuCtmaCOAeMNO0sX4YVCwKwd
         LvnJtt+v2CSTDOMyC5CzbGR3ox8oiIBnn4f25EJXB/R9Tv/Dg2JGTo4ymku2tYsbmWIk
         hlMrmZ+TMRHkHxIbRwLoBRn/lO6wK53uHBFXO/tNTCFV4rQ3ad3E6CFYkIyJeTlkeMCO
         wEi0XONjz9pgIQpOBfq8zUVpElFOcR5lanhsmVbtX7MxVk+hV6dNdBqgbTELyK23XSVO
         hlV5O4BqoZXWJW4vla+Du4sjXru+S+/70EtEl+1NqzT7PbOIpShvZk2vrFH2kTlI2g4C
         /Ddw==
X-Forwarded-Encrypted: i=1; AJvYcCVNgcx9TJa2WLyG8t1S0tunZbxrqZZn8V6vV+5Vu1QbUHJX0a+tdgLTkcL7cjLLHAUh1z8vcKFgl4KmT5ioZONp@lists.infradead.org
X-Gm-Message-State: AOJu0YyzWNhEPj66CZ928JJ4x3BSi5GoGKfbTT4XHaWyf5LgBO8GSb9P
	OSX6wkyz6pESVqNilO0UnuB4OSunNoe0AhILKHu+xU4l8nJq6jApzlbkF6oE9ZMjqoDuuLRY/vO
	XalIWKpAE5hUaRxbTzwYr+J6QeuZpCfytC3nNM3nW
X-Gm-Gg: AZuq6aKBfxGDRnVQoljl/Od69co5p1HXya4RIW6vtK9OIFwk4PH2dCCl0Eoc/r3IQK1
	m3J5hULxj9cx+K6mVI6yu7PRGQSymCz4sO40womJ4Y8DesZa64o+LtmE7TGLapvtpFEaKqSPw3v
	B2Six+tTIeu3NmZNmuX1RyE6ubhry+Tg8SUTaJ8c45eVXETQTuvQq8Hm5/2KEL/mkyKmBCiNo/E
	iY8XdPZIyKRKOnnOY5ZH24IjonlSY2T3N55EE+8Up0Ohmw9eBvksRnzb1pObpXBCP+XfkklTRie
	8EaxB4QweQ29ce+iwI3cArwx
X-Received: by 2002:a17:903:18b:b0:2a0:7fac:c031 with SMTP id
 d9443c01a7336-2a844e78abcmr3049555ad.14.1769463121618; Mon, 26 Jan 2026
 13:32:01 -0800 (PST)
MIME-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com> <20260126104419.1649811-20-vdonnefort@google.com>
In-Reply-To: <20260126104419.1649811-20-vdonnefort@google.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Mon, 26 Jan 2026 13:31:49 -0800
X-Gm-Features: AZwV_QjRVAsI7BYNB-SSd0KqV-MZmQcJjsc_0anhfEHofc202jxoz2KReva1YZQ
Message-ID: <CAC_TJvfzETz53ZXCk89ndqhj0+nuMUxPsB=NNT8kSZP-iwLm7A@mail.gmail.com>
Subject: Re: [PATCH v10 19/30] KVM: arm64: Add PKVM_DISABLE_STAGE2_ON_PANIC
To: Vincent Donnefort <vdonnefort@google.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_133204_008707_21FF0FC0 
X-CRM114-Status: GOOD (  27.83  )
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

On Mon, Jan 26, 2026 at 2:44=E2=80=AFAM Vincent Donnefort <vdonnefort@googl=
e.com> wrote:
>
> On NVHE_EL2_DEBUG, when using pKVM, the host stage-2 is relaxed to grant
> the kernel access to the stacktrace, hypervisor bug table and text to
> symbolize addresses. This is unsafe for production. In preparation for
> adding more debug options to NVHE_EL2_DEBUG, decouple the stage-2
> relaxation into a separate option.
>
> While at it, rename PROTECTED_NVHE_STACKTRACE into PKVM_STACKTRACE,
> following the same naming scheme as PKVM_DISABLE_STAGE2_ON_PANIC.
>
> Cc: Kalesh Singh <kaleshsingh@google.com>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Kalesh Singh <kaleshsingh@google.com>

Thanks,
Kalesh

>
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 4f803fd1c99a..6498dec00fe9 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -43,9 +43,27 @@ menuconfig KVM
>
>           If unsure, say N.
>
> +if KVM
> +
> +config PTDUMP_STAGE2_DEBUGFS
> +       bool "Present the stage-2 pagetables to debugfs"
> +       depends on DEBUG_KERNEL
> +       depends on DEBUG_FS
> +       depends on ARCH_HAS_PTDUMP
> +       select PTDUMP
> +       default n
> +       help
> +         Say Y here if you want to show the stage-2 kernel pagetables
> +         layout in a debugfs file. This information is only useful for k=
ernel developers
> +         who are working in architecture specific areas of the kernel.
> +         It is probably not a good idea to enable this feature in a prod=
uction
> +         kernel.
> +
> +         If in doubt, say N.
> +
>  config NVHE_EL2_DEBUG
>         bool "Debug mode for non-VHE EL2 object"
> -       depends on KVM
> +       default n
>         help
>           Say Y here to enable the debug mode for the non-VHE KVM EL2 obj=
ect.
>           Failure reports will BUG() in the hypervisor. This is intended =
for
> @@ -53,10 +71,23 @@ config NVHE_EL2_DEBUG
>
>           If unsure, say N.
>
> -config PROTECTED_NVHE_STACKTRACE
> -       bool "Protected KVM hypervisor stacktraces"
> -       depends on NVHE_EL2_DEBUG
> +if NVHE_EL2_DEBUG
> +
> +config PKVM_DISABLE_STAGE2_ON_PANIC
> +       bool "Disable the host stage-2 on panic"
>         default n
> +       help
> +         Relax the host stage-2 on hypervisor panic to allow the kernel =
to
> +         unwind and symbolize the hypervisor stacktrace. This however ta=
mpers
> +         the system security. This is intended for local EL2 hypervisor
> +         development.
> +
> +         If unsure, say N.
> +
> +config PKVM_STACKTRACE
> +       bool "Protected KVM hypervisor stacktraces"
> +       depends on PKVM_DISABLE_STAGE2_ON_PANIC
> +       default y
>         help
>           Say Y here to enable pKVM hypervisor stacktraces on hyp_panic()
>
> @@ -66,21 +97,6 @@ config PROTECTED_NVHE_STACKTRACE
>
>           If unsure, or not using protected nVHE (pKVM), say N.
>
> -config PTDUMP_STAGE2_DEBUGFS
> -       bool "Present the stage-2 pagetables to debugfs"
> -       depends on KVM
> -       depends on DEBUG_KERNEL
> -       depends on DEBUG_FS
> -       depends on ARCH_HAS_PTDUMP
> -       select PTDUMP
> -       default n
> -       help
> -         Say Y here if you want to show the stage-2 kernel pagetables
> -         layout in a debugfs file. This information is only useful for k=
ernel developers
> -         who are working in architecture specific areas of the kernel.
> -         It is probably not a good idea to enable this feature in a prod=
uction
> -         kernel.
> -
> -         If in doubt, say N.
> -
> +endif # NVHE_EL2_DEBUG
> +endif # KVM
>  endif # VIRTUALIZATION
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index cc7d5d1709cb..54aedf93c78b 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -539,7 +539,7 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr=
, u64 spsr,
>
>                 /* All hyp bugs, including warnings, are treated as fatal=
. */
>                 if (!is_protected_kvm_enabled() ||
> -                   IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
> +                   IS_ENABLED(CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC)) {
>                         struct bug_entry *bug =3D find_bug(elr_in_kimg);
>
>                         if (bug)
> diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/hos=
t.S
> index eef15b374abb..3092befcd97c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/host.S
> +++ b/arch/arm64/kvm/hyp/nvhe/host.S
> @@ -120,7 +120,7 @@ SYM_FUNC_START(__hyp_do_panic)
>
>         mov     x29, x0
>
> -#ifdef CONFIG_NVHE_EL2_DEBUG
> +#ifdef PKVM_DISABLE_STAGE2_ON_PANIC
>         /* Ensure host stage-2 is disabled */
>         mrs     x0, hcr_el2
>         bic     x0, x0, #HCR_VM
> diff --git a/arch/arm64/kvm/hyp/nvhe/stacktrace.c b/arch/arm64/kvm/hyp/nv=
he/stacktrace.c
> index 5b6eeab1a774..7c832d60d22b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/stacktrace.c
> +++ b/arch/arm64/kvm/hyp/nvhe/stacktrace.c
> @@ -34,7 +34,7 @@ static void hyp_prepare_backtrace(unsigned long fp, uns=
igned long pc)
>         stacktrace_info->pc =3D pc;
>  }
>
> -#ifdef CONFIG_PROTECTED_NVHE_STACKTRACE
> +#ifdef CONFIG_PKVM_STACKTRACE
>  #include <asm/stacktrace/nvhe.h>
>
>  DEFINE_PER_CPU(unsigned long [NVHE_STACKTRACE_SIZE/sizeof(long)], pkvm_s=
tacktrace);
> @@ -134,11 +134,11 @@ static void pkvm_save_backtrace(unsigned long fp, u=
nsigned long pc)
>
>         unwind(&state, pkvm_save_backtrace_entry, &idx);
>  }
> -#else /* !CONFIG_PROTECTED_NVHE_STACKTRACE */
> +#else /* !CONFIG_PKVM_STACKTRACE */
>  static void pkvm_save_backtrace(unsigned long fp, unsigned long pc)
>  {
>  }
> -#endif /* CONFIG_PROTECTED_NVHE_STACKTRACE */
> +#endif /* CONFIG_PKVM_STACKTRACE */
>
>  /*
>   * kvm_nvhe_prepare_backtrace - prepare to dump the nVHE backtrace
> diff --git a/arch/arm64/kvm/stacktrace.c b/arch/arm64/kvm/stacktrace.c
> index af5eec681127..9724c320126b 100644
> --- a/arch/arm64/kvm/stacktrace.c
> +++ b/arch/arm64/kvm/stacktrace.c
> @@ -197,7 +197,7 @@ static void hyp_dump_backtrace(unsigned long hyp_offs=
et)
>         kvm_nvhe_dump_backtrace_end();
>  }
>
> -#ifdef CONFIG_PROTECTED_NVHE_STACKTRACE
> +#ifdef CONFIG_PKVM_STACKTRACE
>  DECLARE_KVM_NVHE_PER_CPU(unsigned long [NVHE_STACKTRACE_SIZE/sizeof(long=
)],
>                          pkvm_stacktrace);
>
> @@ -225,12 +225,12 @@ static void pkvm_dump_backtrace(unsigned long hyp_o=
ffset)
>                 kvm_nvhe_dump_backtrace_entry((void *)hyp_offset, stacktr=
ace[i]);
>         kvm_nvhe_dump_backtrace_end();
>  }
> -#else  /* !CONFIG_PROTECTED_NVHE_STACKTRACE */
> +#else  /* !CONFIG_PKVM_STACKTRACE */
>  static void pkvm_dump_backtrace(unsigned long hyp_offset)
>  {
> -       kvm_err("Cannot dump pKVM nVHE stacktrace: !CONFIG_PROTECTED_NVHE=
_STACKTRACE\n");
> +       kvm_err("Cannot dump pKVM nVHE stacktrace: !CONFIG_PKVM_STACKTRAC=
E\n");
>  }
> -#endif /* CONFIG_PROTECTED_NVHE_STACKTRACE */
> +#endif /* CONFIG_PKVM_STACKTRACE */
>
>  /*
>   * kvm_nvhe_dump_backtrace - Dump KVM nVHE hypervisor backtrace.
> --
> 2.52.0.457.g6b5491de43-goog
>

