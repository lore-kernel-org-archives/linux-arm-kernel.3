Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC906C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 22:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ritVIo6/pizYmJa/ItJGi3Xo7T9ZQHS7lp34Yj6k3Y0=; b=kf7PYokcYA81Swj8g37MlJtrRf
	60M77VAuftwhp2qjcF4iklaOKI513NtPaEddQMWflioMO4dFMp5PAe9eWzhUmVG/mwjFIXUfGbn+v
	GBb2K/GjHEGnZj/gyGdmfWAXJaHDwxF6/yqJt9w/EJdrcOnN9O9KR5oDeZrKkyyiOPGdE+vuBAtxn
	ehtnj7y4sH7iJUAq09R3PEV0CAv27pljrDs+QeOVOIA+ka+/IP+wGyxZTJo6IwvTNgp17YOBVqSUl
	rAg9R5yYI5tiIH3qs25cahhYXt3n70lvKg/2kTZ0uzA4r+F2oXrsSaoBRtmOpnSe1Qf50agByA8lu
	1DX8hV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7yd-000000021A6-3uzW;
	Fri, 30 May 2025 22:13:23 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7wT-000000020xG-1rJL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 22:11:12 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4e700699dffso17882137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 15:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643068; x=1749247868; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ritVIo6/pizYmJa/ItJGi3Xo7T9ZQHS7lp34Yj6k3Y0=;
        b=TbTndsS0UDbLoociYyEt8rVRorPRNp9zfryuG1cSmYU6wYmlttEuuSfRVF28I1SKa9
         oOOpZp5FaIyVlvcCUzgNQi+goPjlAtf8RNghmlZ9TF41qbGa5IEUGjKVreozxV618ECA
         ms04VXxRrwSPxWZl89ll0L8hqlOCPcxoJBiIS9Mje5vDfMirrGlJ5qP6FN6CK5gxrZMX
         1CNM3OkN26kDbzV89QB8zJQ4SM6U5NviqMj9ksdaiRPZlBT1DBwdMgvovojTl4ckWh/Z
         pEIWS5l5jXdsk4HffnzjGnAKPT9bRqwZZQdybqQu3dYGPMK1GoBjyIImxP11qvSZT8ow
         qehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643068; x=1749247868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ritVIo6/pizYmJa/ItJGi3Xo7T9ZQHS7lp34Yj6k3Y0=;
        b=W94NTE4WGndvQ9/wyAV4QZwr6TrxaVXiJ1S6Lz6N/7BAmC3zQWkN3OO5yIr1Yf2TOR
         oI7X4snIBWRlwaK3TBhlDlVMYNyO8w68vN+IfQI3tmAaQJuz/+THl7TQe7zFqXVxJ10F
         2yXwM7a/RbC/nQ9KV06kyZCi906a3pOsbeFCowgYNVbqOmDoAq/kQAonirPQhxunB5r+
         cFaWkyB7aXSronYvHdyl6U1Eu59upSJMBwnWbPNoEuoKtpfc7xd0cIm1cP9J/ic65nGN
         11kj6ONTOW6/h8EvBWaQgn8/SHK5BiAK84zKcVfLp9BhYqK+PEGs+9r0wjAFY3mzZQzX
         7Zfg==
X-Forwarded-Encrypted: i=1; AJvYcCVmUvjjxTbXQym9iw6CmcTmFxx0qDigGagnvBUoP/Pn+S7AWk/a8fMeiqtozWBI6DHIiVEsWFbktECNsORByvRl@lists.infradead.org
X-Gm-Message-State: AOJu0YyKoXgbq00D50ppBn67XBGZcZ8LvJRANbXM4T8LDf4N+6sv0n2i
	DnpHwTgQ/mPRg8fjDjTse5xN+2grPEvUB1ZBp/ZeqNeTlFoJUDwyoFO5j71S9HEbY1WPWQzYkCG
	X4Depcq6jexq2AjzGXt7DyZAuJsAk6Uk=
X-Gm-Gg: ASbGncsCT722GH4wYd4XYvJlJJ5ydUUS3Pzhy04mxuCf2fqZyxhi5yOe2dX0rS9yvYF
	QpNjY+D+oDal5KUDuraDnVt2+eD+cqI2QF9FazSxG/uYfIa1E+VUNmXtRrpkBP/Y2dO7FSgZLSI
	B8CzDNvX/3JcOQXpQZ2kzhl6eNUMLlX3lH6A==
X-Google-Smtp-Source: AGHT+IHzU5e3+BukHOvx+czHuPsxPzSVV3StE6Piq/rti0jxoP/U9Qsb4vkWD0Qj7gz+dT6vcb/MLbNN3LzHVVtpN64=
X-Received: by 2002:a05:6102:32ce:b0:4e6:a33d:9925 with SMTP id
 ada2fe7eead31-4e6ecd2e650mr3314960137.5.1748643067916; Fri, 30 May 2025
 15:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
In-Reply-To: <20250530152445.2430295-1-ryan.roberts@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 31 May 2025 06:10:55 +0800
X-Gm-Features: AX0GCFuerSCdleMd9iVUh5m59BRXLMYcUa_g0jM2554oQo_Ee5We9c3qLJaJPAw
Message-ID: <CAGsJ_4wW2ABkeG_FNN-wvbkdg3fQY1MfkUrxX_57sUdLj=Y=rQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_151109_489595_1B1F1CA9 
X-CRM114-Status: GOOD (  33.88  )
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

On Fri, May 30, 2025 at 11:24=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
> a parallel reclaim leaving stale TLB entries") describes a race that,
> prior to the commit, could occur between reclaim and operations such as
> mprotect() when using reclaim's tlbbatch mechanism. See that commit for
> details but the summary is:
>
> """
> Nadav Amit identified a theoritical race between page reclaim and
> mprotect due to TLB flushes being batched outside of the PTL being held.
>
> He described the race as follows:
>
>         CPU0                            CPU1
>         ----                            ----
>                                         user accesses memory using RW PTE
>                                         [PTE now cached in TLB]
>         try_to_unmap_one()
>         =3D=3D> ptep_get_and_clear()
>         =3D=3D> set_tlb_ubc_flush_pending()
>                                         mprotect(addr, PROT_READ)
>                                         =3D=3D> change_pte_range()
>                                         =3D=3D> [ PTE non-present - no fl=
ush ]
>
>                                         user writes using cached RW PTE
>         ...
>
>         try_to_unmap_flush()
> """
>
> The solution was to insert flush_tlb_batched_pending() in mprotect() and
> friends to explcitly drain any pending reclaim TLB flushes. In the
> modern version of this solution, arch_flush_tlb_batched_pending() is
> called to do that synchronisation.
>
> arm64's tlbbatch implementation simply issues TLBIs at queue-time
> (arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
> trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the end
> of the batch to wait for all the issued TLBIs to complete.
>
> Now, the Arm ARM states:
>
> """
> The completion of the TLB maintenance instruction is guaranteed only by
> the execution of a DSB by the observer that performed the TLB
> maintenance instruction. The execution of a DSB by a different observer
> does not have this effect, even if the DSB is known to be executed after
> the TLB maintenance instruction is observed by that different observer.
> """
>
> arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
> requirement because they are called from the same task (either kswapd or
> caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU or
> if the task was migrated, __switch_to() contains an extra dsb(ish).
>
> HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented as
> a dsb(ish). But this may be running on a CPU remote from the one that
> issued the outstanding TLBIs. So there is no architectural gurantee of
> synchonization. Therefore we are still vulnerable to the theoretical
> race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
> potentially racing with a parallel reclaim leaving stale TLB entries").
>
> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending().
> This aligns with what the other arches that implement the tlbbatch
> feature do.

Thanks, Ryan. I=E2=80=99m not the ARM expert on this modification,
but your explanation seems reasonable to me.
I=E2=80=99ll leave the judgment to Catalin, Will, and Mark.

>
> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown durin=
g page reclamation/migration")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/t=
lbflush.h
> index eba1a98657f1..7d564c2a126f 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(struc=
t mm_struct *mm)
>  }
>
>  /*
> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
> - * synchronise all the TLBI issued with a DSB to avoid the race mentione=
d in
> - * flush_tlb_batched_pending().
> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need to=
 ensure
> + * all the previously issued TLBIs targeting mm have completed. But sinc=
e we
> + * can be executing on a remote CPU, a DSB cannot guarrantee this like i=
t can
> + * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>   */
>  static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>  {
> -       dsb(ish);
> +       flush_tlb_mm(mm);
>  }
>
>  /*
> --
> 2.43.0
>

Thanks
Barry

