Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27B0D6B6DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 22:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KF0Kmn9RfLVFl5d+nc887Jbm4zho3aMlnGh/BRkWbjg=; b=tXjJkH/s3hKGH9d5Ooqu4HJhip
	ACnjdUXuls4dZ8BhekkpWg6HLxEQosbGbjOb8eneTomZHF79IIgqV1u6EPNiAqvtiXkzQl7PggQgm
	4TwfrL1XM2HRSEeFme9eui0BveCA6FBQAxZdHCs0cB2Lrz48WtQcNT9uoflfG3B7xR2qhnUb76ku5
	jM7+EvMg+5cqpxBoXLlDC/9pY3HdTPiCCKBBo89mHIb+BQ4q9/w0BFpYCh56Npza/D8azCD7Gz1sx
	qTZypgb/pwha3tGBK6eWTueHipwPjz62kWjpGLzgasK/cWC2ow5p4t7jJpYWaXcFf221Pt6dmC02R
	GWslgbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6GkR-00000001wIT-1fou;
	Wed, 30 Oct 2024 22:01:03 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Gil-00000001wCr-3IJW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 21:59:21 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-288a5765bb9so39320fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 14:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730325558; x=1730930358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF0Kmn9RfLVFl5d+nc887Jbm4zho3aMlnGh/BRkWbjg=;
        b=H6pIMeV10b+ZmePbk7KQJCN7pXE60Z2l94Z16as9tip/vZcd79WCTpRsHBfwlU5956
         zRs8LF++Lr8meCjySOUwEadkBITQYFff35XIzZEg3UIUUwd9H7HY8GYfTzYbCKzF3QLX
         uHAK3O8+eXjx+ZUbKkibJaKAHJ+K/19FAIYL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730325558; x=1730930358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KF0Kmn9RfLVFl5d+nc887Jbm4zho3aMlnGh/BRkWbjg=;
        b=tWP8AWJvkQ8TnNSTIqyTGb0l7/TCGrNM6+bLYwyi8J4jbtN+qewToZp2Xh6VT26MbE
         3mgW/lcBONwh4fmAxxx80zibopMhcYfqccAlTDT21Ptm0ltipjpi7Q1HjIZt9XLUzKZr
         XEoDKZVDZw1ZwVJu7vr3DQTaw6ckNG7pld5ZyRlpvIHlVb98aNxISaLczFB9JbMB1EDZ
         mmY9060anKtwGDToDlKa2MHwW0ClSNYTe24uWJMWkz3ipoabCY1Rom/COz5FgRAjkbfQ
         kv6XjxM/Zbw6je4SnCOPaExBAsWzr1xnSMhQ0TCfOfckj/VAUnjS4Ph1A+s7Hl300Gci
         LCYQ==
X-Gm-Message-State: AOJu0Yxcs8QRxhIH+fw+lmkc/ZTnSeuE7Z9XYSaRbMrh38SbjEhm5VmU
	5JV7eWAzJc5NRpc795M1XiP1fkBe/KU1eSo0vodC/7CWrdrO2N5bBGRNBqN/8KkuyR/jDO0xPmD
	OSRx+UCYRUSjEFZ+MQD2WcH4QoPFk3okNZj1s
X-Google-Smtp-Source: AGHT+IF1wAKKjsN2iV3MTS8Pdrj+X9BWtdPUNQq1ShgB2qMvbD4fOXM5ZINa1FfnKg2bL289c/aWd/ZKah6jdjkF2+Q=
X-Received: by 2002:a05:6870:c088:b0:27c:a414:c22d with SMTP id
 586e51a60fabf-29051d59b42mr4505798fac.11.1730325557790; Wed, 30 Oct 2024
 14:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
In-Reply-To: <20241029144539.111155-1-kevin.brodsky@arm.com>
From: Jeff Xu <jeffxu@chromium.org>
Date: Wed, 30 Oct 2024 14:59:05 -0700
Message-ID: <CABi2SkW4Utuo3qGKodTQn7VuFrRa4hpwrik7WaorS4=wm_cS2g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Improve arm64 pkeys handling in signal delivery
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org, 
	anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com, broonie@kernel.org, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, Dave.Martin@arm.com, 
	joey.gouly@arm.com, keith.lucas@oracle.com, pierre.langlois@arm.com, 
	shuah@kernel.org, sroettger@google.com, tglx@linutronix.de, will@kernel.org, 
	yury.khrustalev@arm.com, linux-kselftest@vger.kernel.org, x86@kernel.org, 
	Kees Cook <keescook@chromium.org>, Jorge Lucangeli Obes <jorgelo@chromium.org>, 
	Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_145919_872000_B2074ADC 
X-CRM114-Status: GOOD (  36.75  )
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

+Kees and Jorge and Jann

On Tue, Oct 29, 2024 at 7:45=E2=80=AFAM Kevin Brodsky <kevin.brodsky@arm.co=
m> wrote:
>
> This series is a follow-up to Joey's Permission Overlay Extension (POE)
> series [1] that recently landed on mainline. The goal is to improve the
> way we handle the register that governs which pkeys/POIndex are
> accessible (POR_EL0) during signal delivery. As things stand, we may
> unexpectedly fail to write the signal frame on the stack because POR_EL0
> is not reset before the uaccess operations. See patch 1 for more details
> and the main changes this series brings.
>
> A similar series landed recently for x86/MPK [2]; the present series
> aims at aligning arm64 with x86. Worth noting: once the signal frame is
> written, POR_EL0 is still set to POR_EL0_INIT, granting access to pkey 0
> only. This means that a program that sets up an alternate signal stack
> with a non-zero pkey will need some assembly trampoline to set POR_EL0
> before invoking the real signal handler, as discussed here [3]. This is
> not ideal, but it makes experimentation with pkeys in signal handlers
> possible while waiting for a potential interface to control the pkey
> state when delivering a signal. See Pierre's reply [4] for more
> information about use-cases and a potential interface.
>
Apologize in advance  that I'm unfamiliar with ARM's POR, up to review
this patch series, so I might ask silly questions or based on wrong
understanding.

It seems that the patch has the same logic as Aruna Ramakrishna
proposed for X86, is this correct ?

In the latest version of x86 change [1], I have a comment if we want
to consider adding a new flag SS_PKEYALTSTACK (see SS_AUTODISARM as an
example) in sigaltstack, and restrict this mechanism (overwriting
PKRU/POR_EL0 and sigframe)  to sigaltstack() with SS_PKEYALTSTACK.
There is a subtle difference if we do that, i.e. the existing
signaling handling user might not care or do not use PKEY/POE, and
overwriting PKRU/POR_EL0 and  sigframe every time will add extra CPU
time on the signaling delivery, which could be real-time sensitive.

Since I raised this comment on X86, I think raising it for ARM for
discussion would be ok,
it might make sense to have consistent API experience for arm/x86 here.

Thanks
-Jeff

[1] https://lore.kernel.org/lkml/CABi2SkWjF2Sicrr71=3Da6H8XJyf9q9L_Nd5FPp0C=
J2mvB46Rrrg@mail.gmail.com/



> The x86 series also added kselftests to ensure that no spurious SIGSEGV
> occurs during signal delivery regardless of which pkey is accessible at
> the point where the signal is delivered. This series adapts those
> kselftests to allow running them on arm64 (patch 4-5). There is a
> dependency on Yury's PKEY_UNRESTRICTED patch [7] for patch 4
> specifically.
>
> Finally patch 2 is a clean-up following feedback on Joey's series [5].
>
> I have tested this series on arm64 and x86_64 (booting and running the
> protection_keys and pkey_sighandler_tests mm kselftests).
>
> - Kevin
>
> ---
>
> v2..v3:
> * Reordered patches (patch 1 is now the main patch).
> * Patch 1: compute por_enable_all with an explicit loop, based on
>   arch_max_pkey() (suggestion from Dave M).
> * Patch 4: improved naming, replaced global pkey reg value with inline
>   helper, made use of Yury's PKEY_UNRESTRICTED macro [7] (suggestions
>   from Dave H).
>
> v2: https://lore.kernel.org/linux-arm-kernel/20241023150511.3923558-1-kev=
in.brodsky@arm.com/
>
> v1..v2:
> * In setup_rt_frame(), ensured that POR_EL0 is reset to its original
>   value if we fail to deliver the signal (addresses Catalin's concern [6]=
).
> * Renamed *unpriv_access* to *user_access* in patch 3 (suggestion from
>   Dave).
> * Made what patch 1-2 do explicit in the commit message body (suggestion
>   from Dave).
>
> v1: https://lore.kernel.org/linux-arm-kernel/20241017133909.3837547-1-kev=
in.brodsky@arm.com/
>
> [1] https://lore.kernel.org/linux-arm-kernel/20240822151113.1479789-1-joe=
y.gouly@arm.com/
> [2] https://lore.kernel.org/lkml/20240802061318.2140081-1-aruna.ramakrish=
na@oracle.com/
> [3] https://lore.kernel.org/lkml/CABi2SkWxNkP2O7ipkP67WKz0-LV33e5brReevTT=
tba6oKUfHRw@mail.gmail.com/
> [4] https://lore.kernel.org/linux-arm-kernel/87plns8owh.fsf@arm.com/
> [5] https://lore.kernel.org/linux-arm-kernel/20241015114116.GA19334@willi=
e-the-truck/
> [6] https://lore.kernel.org/linux-arm-kernel/Zw6D2waVyIwYE7wd@arm.com/
> [7] https://lore.kernel.org/all/20241028090715.509527-2-yury.khrustalev@a=
rm.com/
>
> Cc: akpm@linux-foundation.org
> Cc: anshuman.khandual@arm.com
> Cc: aruna.ramakrishna@oracle.com
> Cc: broonie@kernel.org
> Cc: catalin.marinas@arm.com
> Cc: dave.hansen@linux.intel.com
> Cc: Dave.Martin@arm.com
> Cc: jeffxu@chromium.org
> Cc: joey.gouly@arm.com
> Cc: keith.lucas@oracle.com
> Cc: pierre.langlois@arm.com
> Cc: shuah@kernel.org
> Cc: sroettger@google.com
> Cc: tglx@linutronix.de
> Cc: will@kernel.org
> Cc: yury.khrustalev@arm.com
> Cc: linux-kselftest@vger.kernel.org
> Cc: x86@kernel.org
>
> Kevin Brodsky (5):
>   arm64: signal: Improve POR_EL0 handling to avoid uaccess failures
>   arm64: signal: Remove unnecessary check when saving POE state
>   arm64: signal: Remove unused macro
>   selftests/mm: Use generic pkey register manipulation
>   selftests/mm: Enable pkey_sighandler_tests on arm64
>
>  arch/arm64/kernel/signal.c                    |  95 ++++++++++++---
>  tools/testing/selftests/mm/Makefile           |   8 +-
>  tools/testing/selftests/mm/pkey-arm64.h       |   1 +
>  tools/testing/selftests/mm/pkey-x86.h         |   2 +
>  .../selftests/mm/pkey_sighandler_tests.c      | 115 ++++++++++++++----
>  5 files changed, 176 insertions(+), 45 deletions(-)
>
> --
> 2.43.0
>

