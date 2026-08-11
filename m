Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE245C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 00:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TU+gUe471oYilrCT6YTzzByDjScHGGMPSU9HnUH7Czo=; b=L0pBk6uXiF2UNnTo78voCVjCZf
	mt4suiV4IGLHACDVT+DLDia3V63WXQKGpxmtwzWAAN99/QN9dl2lHA6lKnxffdcCb4xxIcf1Bg55O
	/HQdBa3JoK8jELICOhRvJDuxeMwvO/fd5OyP0cZqCRNCU2wzr9urGIHYE7XzdB7z7g+tEuIVopuR3
	rMxhBaw66G3psHZAAKLptlSjAJmtgFWjBSwrB3tyepDz8baKvNfLrU0TapXZ8qZ3IJTf8ZlN+sjQd
	a1vUSMTZz02ly0ELRoKWHmxo9xSYUe9cJ9wEmcVkFB1zSUVBe+pqQgEReYo7jb9rFmz3oC69bsnFU
	AWVvuf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtaiL-0000000D5eM-1Zd2;
	Tue, 11 Aug 2026 00:51:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtaiI-0000000D5ds-2VHk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 00:51:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f7854678cso1657290f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 17:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786409488; cv=none;
        d=google.com; s=arc-20260327;
        b=s1BeWDo/IiTQNfItRCz2P9vmPL8kT/XsEHOTjVnNqeK0SC3Xufeqevm1sOUr54lR4h
         CQ7HAPSs+NWp89LZL8Z3jRzCRy7QyPpQYw4MUt0s6Lve/sPcifIyZxFIGRWwG7i7rT/3
         6qZ6xOsnzER3KR07PJN9Prb7plXyNo+QrEEhsy5JoE7OdubgODN1aK8PRx98CEu7Ia3T
         RVh7r12bd6ov6Au+errZ0JujRBCR+Rjx2uLUxooLq2uE4PVgs8WnmzPBQ0eNfjsmdg5R
         PBrjUAe/KbFPwRzW5b8ssA8/7QZui4ZJ3kjniDNsSvYF2ifIWCORAykIkVXy3Vxelc8U
         zL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TU+gUe471oYilrCT6YTzzByDjScHGGMPSU9HnUH7Czo=;
        fh=K7HT+kafDhf7Xc4EGhXmneKrI/DEuxsmnKh9vwik1LA=;
        b=glh/HIq4S+cT5dKlKnVazo856XojZwYqcn3fZnUxoDnjwchCIWpllhT6RPnOzaFRG3
         IbuzQYkvkIMOGQTUp57Wrrn7I8JNu5NzieR/kQzsI5aJ3tmf/6gSinhOMK0ZSMQ6DLMn
         o/JSlki0wjcS+uDgg5qGYCWebYOdFqfbrlKK7OtTq6L5aBLWhrhG5DNBbxrIHMAgOSTX
         4rUM+iYyMKJhSWALBg0D926vQUPuK6f9UduwQaLrAVR2KDfGkyoUK4Qtn387p+pwf0kd
         ioZR733pnVJrCnuBR+a6HehPbM8wJvr/p1/q9+q1Y/xydVZLXLLoSKuhuitK4DJ9RIBB
         SzPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bourg.net; s=google; t=1786409488; x=1787014288; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TU+gUe471oYilrCT6YTzzByDjScHGGMPSU9HnUH7Czo=;
        b=Vgm2pVe88YJW7Z9SmLO8KhK/Bi4OtUVo42eaOhFh885A9FDkuYKj0DHKp6I3LlXS65
         svrtq3U87Ggu6HehkJP6lTpfpKiEz81vYyK6ccN44UJ2IwoSgy5s6EESWK1FJgO3YO+G
         ZplcNhdHYfptsr56U7MEYocRUIPwoW/z5byE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786409488; x=1787014288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TU+gUe471oYilrCT6YTzzByDjScHGGMPSU9HnUH7Czo=;
        b=Np8GyUF10JiX1Ursy4A2dSqG9i3Dq5gU+qf3kUi1WcWwC384t6nC/NEo7btup9PtB/
         VALjxfNbviT3mukcgQ94lp9M6TNG3esSSC0gPG9/uzNkFtXPbdy2jAUq1BOPYlmR3KGa
         dogXeWzUYZ2AfANBpimOa3OIXc2+l6VYQwxBqtogoTeXy89SscpZS4UIDnNSbOMunqTU
         7Frh8GMhtvOIaA+D2Q84YTG6pDbdYBhvNa1X1L5rHK6HNAsmCa+DjM3N2r5QqG3peLBX
         E1NgxRTa0Y6blR0z3IFISkcyBMyddVC1Japr3bjPcC9hs5pRwaC307DjFwyYKVv9EdHO
         CjHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4OPtMc5J2Ee9ZdC3EpM6XqD4/G5YWo36AgFahBcSWmjqoVIJUFueO5tqKCvzi3uBtmYDClYZy+UApQLVTvGAH@lists.infradead.org
X-Gm-Message-State: AOJu0YxRhGUJuvJgfQmudn6jNkNhY9DXRT5yCigpOBMvYIgJImlO6A3K
	y1A3KXUS1yBbj9XM/P/1Qe82cmF4rHzuHcMtTsQbqpogcjKnoEH2rFxjjHzgD9EHiiKJtSjBxit
	zjbJ4/BjyqOgxgfWg3dVsO/iXcNHngsnpI+Dirtyyf6o7rVKxru2FoHDzrA==
X-Gm-Gg: AR+sD11wu6Rr7MlIXhii1RItL3HVIl0oyRi7wgxdZnBw2OWtIZaD9wxCo3rIoLPJ9Tk
	mFcdGutO+iDIwli+G0gvRzW5ydOAR/XzRgWIAc+aWLBzos+rrl8lgBGzGrVK3IJHFlMHRe7nv//
	rnceAac7CzQflaEjIAxTOcAEElxKGbtcHca0gPEx2U06IhS9UDQl9KGP/g9SZLrPLFvnwQ/bodt
	yXcMfxt1umOgCsoEqOWmGE1YnD8uZA56urBRzzA8lSy4tObtHPt86DfxC35wvsC0EIw7fYAyMkk
	eHU8wIEpjC7d0b1ucDthA5wl8WhGYE1eqJl8Cheyo/fRMeX48Vr0lcNA/Aa4I4hCidN1ZpDyL+w
	z
X-Received: by 2002:a05:6000:25f5:b0:47f:8810:cc64 with SMTP id
 ffacd0b85a97d-48130ee5cafmr34643521f8f.19.1786409488054; Mon, 10 Aug 2026
 17:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260806000144.3388823-1-gus@bourg.net> <anXMug2_-vZl_pZ7@willie-the-truck>
 <30c5499e-8041-4e39-933b-c5220d53be77@app.fastmail.com> <anmwTDnFR2cgxkqR@willie-the-truck>
In-Reply-To: <anmwTDnFR2cgxkqR@willie-the-truck>
From: Gus Bourg <gus@bourg.net>
Date: Mon, 10 Aug 2026 17:51:16 -0700
X-Gm-Features: AUfX_mwbCQk-FDI59ImICq7SHb4tBkCUGzUKvFPt1wRrD1_jDiCNvRoPevXtuBc
Message-ID: <CAKL=SEpvBqMjw2Ts4ODYHCJz0K1axwmtrUGKQEJeb_rvuAQk0A@mail.gmail.com>
Subject: Re: [PATCH] arm64/efi: Do not call EFI runtime services preemptibly
 under SW PAN
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_175130_757666_5DA2C7B1 
X-CRM114-Status: GOOD (  31.68  )
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

On Mon, Aug 10, 2026 at 4:04=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Fri, Aug 07, 2026 at 04:56:00PM +0300, Ard Biesheuvel wrote:
> >
> >
> > On Fri, 7 Aug 2026, at 15:16, Will Deacon wrote:
> > > On Wed, Aug 05, 2026 at 05:01:44PM -0700, gus bourg wrote:
> > >> From: Gus Bourg <gus@bourg.net>
> > >>
> > >> When PAN is emulated by switching TTBR0_EL1, arch_efi_call_virt_setu=
p()
> > >> installs the EFI mm into TTBR0_EL1 via uaccess_ttbr0_enable(), and o=
nly a
> > >> return from exception ever puts it back: check_and_switch_context() =
skips
> > >> the register write by design ("Defer TTBR0_EL1 setting for user thre=
ads to
> > >> uaccess_enable() when emulating PAN"), and __switch_to() does not to=
uch it
> > >> either. switch_mm() updates only thread_info->ttbr0.
> > >>
> > >> Since commit a5baf582f4c0 ("arm64/efi: Call EFI runtime services wit=
hout
> > >> disabling preemption") the runtime call is preemptible, so the EFI w=
orker
> > >> can now be scheduled out inside that window. An involuntary preempti=
on is
> > >> harmless, because __swpan_entry_el1()/__swpan_exit_el1() save and re=
store
> > >> the state around the exception. A voluntary reschedule is not: it pe=
rforms
> > >> no return from exception, so the worker resumes with another task's
> > >> TTBR0_EL1 - or reserved_pg_dir - and the next efi_mm access takes a =
level 0
> > >> translation fault.
> > >>
> > >> There is such a preemption point in arch_efi_call_virt_setup() itsel=
f,
> > >> immediately after the TTBR0 install: __efi_fpsimd_begin() ->
> > >> kernel_neon_begin() -> put_cpu_fpsimd_context() -> local_bh_enable()=
 ->
> > >> preempt_check_resched().
> > >
> > > Hmm, can we move the ttbr0 toggling until after __efi_fpsimd_begin() =
so
> > > that this preemption point doesn't interfere?
> > >
> >
> > Either that, or tweak the logic so that the switch is done eagerly in
> > this particular case (untested):
> >
> > --- a/arch/arm64/mm/context.c
> > +++ b/arch/arm64/mm/context.c
> > @@ -266,7 +266,7 @@
> >          * Defer TTBR0_EL1 setting for user threads to uaccess_enable()=
 when
> >          * emulating PAN.
> >          */
> > -       if (!system_uses_ttbr0_pan())
> > +       if (!system_uses_ttbr0_pan() || mm_is_efi(mm))
> >                 cpu_switch_mm(mm->pgd, mm);
> >  }
>
> I think I'd prefer to avoid special-casing this, if we can. I was just
> thinking of the diff below.
>
> Will

Tested the v2 approach (__efi_fpsimd_begin() before
uaccess_ttbr0_enable()) on the board that originally reproduced the
oops: Khadas VIM3, Amlogic A311D (4x Cortex-A73 + 2x Cortex-A53, no
FEAT_PAN, so CONFIG_ARM64_SW_TTBR0_PAN is in use), EDK2-based UEFI
firmware, v7.0.12 plus this change alone (my prior workaround removed).

Both firmware description modes were exercised (DeviceTree and ACPI
boots of the same system):

  - 3,000,000 GetVariable calls (three concurrent readers) plus
    200,000 GetTime calls per mode, under sustained CPU contention
    (busy-loop load on half the cores to force scheduling in the call
    window) - i.e. 6.4M calls total across the ACPI and DeviceTree
    boots of the same system
  - SetVariable create/write/delete round-trips in both modes
  - ~15 reboots/power cycles (ResetSystem) and clean shutdowns across
    the session

Zero efi_call_rts faults and zero "Unable to handle kernel access to
user memory" events; efivars and the EFI RTC remained functional
throughout, and poweroff/reboot stayed clean. Under the unpatched
preemptible path the same board faulted within thousands of calls with
comparable contention, so this comfortably clears the reproduction
threshold.

Tested-by: gus bourg <gus@bourg.net>


>
> --->8
>
> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index 30cd7f804398..0ec90fd1754e 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -184,6 +184,8 @@ void arch_efi_call_virt_setup(void)
>                 efi_virtmap_load();
>         }
>
> +       __efi_fpsimd_begin();
> +
>         /*
>          * Enable access to the valid TTBR0_EL1 and invoke the errata
>          * workaround directly since there is no return from exception wh=
en
> @@ -191,8 +193,6 @@ void arch_efi_call_virt_setup(void)
>          */
>         uaccess_ttbr0_enable();
>         post_ttbr_update_workaround();
> -
> -       __efi_fpsimd_begin();
>  }
>
>  void arch_efi_call_virt_teardown(void)
>

