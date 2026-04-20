Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499F5F99C9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 05:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPEVhn8QEcx6wbVw5CO4dCCDD+tkmOF6Duo+IIAkxXk=; b=E2TMTAc25BStKcRNbTiMlbjEHy
	qZ3PJycfCLGgApiNN6VKHho+ahbFRJygo1o8ZmG/mEoeg4UOQ9Pa/EebVSrVkx09xb+A+NgMxnMwW
	n/CIeWVG1gd90q1zx7InkPyM2RK7KnxDQQLCFdTovPkQix6QjHpG0QsOgqzV5ebU2HosyVs9xn7EW
	1fqB9c3lp/XqORjv39ltezd6XCltcKIZMiz9W8d1EyNnmhlx4qIBd/pcYgRf9UrhZRQsesizRKrSt
	fLqboVSgF25fAt6Cw0eScvRLbFi0EqIlWSuE+Xgm3PcfWIjPQ878Oz/XJn2vbFu9uRGJ54qmUK11N
	53wZshuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhcf-00000006Sr4-3XN1;
	Mon, 20 Apr 2026 05:56:41 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhcd-00000006Sqj-1JoQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 05:56:41 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so2308433241.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 22:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776664598; cv=none;
        d=google.com; s=arc-20240605;
        b=cUyqJuIh6y0Z0wxv9hXEsZ/w3DPzzErzGgRVHxsLnIvM7wiVPkzNwmqWz1gQ5zGOxk
         Zbke1+TCHjwyOCl61eNkFvdqLMZoab6YbDSMfbZjE2sLbpBEi/1Qy/tQffjyiktVprqn
         TJ9pzZryUfQPkw5vB9ZuAZDfn44+SkpT5v5kSqL3R3odrTNcOR2mxZ+uuv7p4OOwE/MA
         tRtg64cLiXzcwULVPQka6agNRRtDxJQX9U2KhmZ8+jP+rBvkbh5eWBd4KD6Kb9ipY31s
         XAP+sHQmXq41hSybmb9dToEJiwu6O4A1G1qiB7JYZJd+r/qQwXBIo51PvOBUaWXik4Zr
         x8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BPEVhn8QEcx6wbVw5CO4dCCDD+tkmOF6Duo+IIAkxXk=;
        fh=r0NkE1ipdY94Drq4aJpV0ZqMxtvfTQ6r/0UkFaBptcU=;
        b=gnvTicHLvii/vuxec+inTQi/Ot3emK+yRqQBCst55JXXaKeqt5A3s8kEV5EXvmGgSV
         AGVVRx5xmYuQkYhF7dDUgZRHCtAaA9/C20fGMWZV3f0OpMlWS65pVfX3jTTZ/bStxeuO
         sgtB6B/1QhF8t3WDZvrZtk0cluQx5Qmk6F00V3c9iB4Qe+PYTpfzgf4PFVzq9r6iUTF5
         TA1cD1xiLYPBEN0DMtcPv3nqeFUqweYgSgjYAE/A21VZaSxt8fiX2qkI/q16uE72XduC
         TPnqa1Efa9zv8tQiHq4vCtsUuueeJHogtuzM9jUT8qCzP5agAX4KujO6v1QQ4hHLROlI
         2g8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776664598; x=1777269398; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPEVhn8QEcx6wbVw5CO4dCCDD+tkmOF6Duo+IIAkxXk=;
        b=EY7wTkw86Ai8cxloCp51N6jKQ4UpsHuyYSkZ4LmYISjTTjMZG4PgyTeOloN9KumXXH
         LgeYjOkWT3Ct+ZSlOyRzxD/tkNz3l6Ac5DdC2XJoIUYlEG4qGZQ/9s1D95Drd7aOrzpB
         r0kyUL6cWaW7qOkMMq0f8qJYWsMhUYjOH7WvDioo91LV/7Zlj3ZuaDlL1+N8/KGKKiOK
         vNtSthtSyzuU8LopTAJ1a/TLeFwBGCCCjW6vFNU8daWcZqlxm2g26v8P4b/hSg6MBHJB
         7Sk3sVkLA6Im7Avvr1Qwgj+1OpXJsfh7NTr1nwKuPsceX5SsKYcv7ni/x65l4GmgPYaf
         o4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776664598; x=1777269398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BPEVhn8QEcx6wbVw5CO4dCCDD+tkmOF6Duo+IIAkxXk=;
        b=ZMaSkAdmyMbPAdr3TCTsXzsJj1nIyDD+Mqu27WLPl6HnKaRC26OZdHUTtOByk3ZeYj
         VivlGp5thJXrNm+VtO9YVFtlO/rgP8Zza4KMxVCaZhvrsrEaBtl+xQmgD32W0Fzon/Lv
         g/X8s6tW97gfqVrR16LhNzWsqwjI0/jAD1yp2FqBjPabybRhAuKvh9UL6NY/FwxTktDx
         Ao8hQsGwxZWHmSPGvupb1GLyqPB1DeuDB/LGWMLmFvKa1Supj7ZdfqD75Cn073RF6JKy
         diuWi37iZbCmO6Cd7eAg6V3EMNLOJJn7ESx7p6hDU6vRli86JfNxDmfd4H652EF3lFKc
         W8ng==
X-Forwarded-Encrypted: i=1; AFNElJ8ScVhDfO5Zp7iackfTv1xJ2Jc+3BfD7SekS2y4GNOm7i6uFttK5DKBd9jTdcPWxGwUvPVAuRU+WyzWrF1eb4tF@lists.infradead.org
X-Gm-Message-State: AOJu0YwbQwzP95o8XXkJYyJmdXXsqbWzvh69KSoF9/g6n0CmDnUCQxqb
	aVbJy+SxxJcXqjK53HF6k6C4PNwXy8TLlxG2wUhiI2QtxKxWIDa28r4xuCL6qEbTyis1aQ17sGR
	IuaSX9mn0jwC6CCHlju9WmnpspuuqoHwHIexEH1T+
X-Gm-Gg: AeBDieuSG/qT+OIyhy1QDoSFXJAzuRIUSVR/58ra76FCAII9HQ+zOuDVGz2kxnW4mFR
	LqAQ7BqAr/Xhe7y1FsGGPWILlYResANFHdTkNxKw3xU3Ui8WSsau0yIvYeWuP4Y4iYsmafKaMUc
	bLY2ItRlqak8EiebotSFQitUNDI30gZf90G8hda53wGVDTDKB2mpaMv7rdlP3tXBuUe1UYyw8AE
	y7zr7BP+8W1J/p9+OGJcTPc9dI5AkC1GX5kk5DZ8IQHHCenWwaZLSvR8hw6jxIQ+2zFWnq1OIPw
	NkuquC/zmqtnREUALuHcKQh2SQK/
X-Received: by 2002:a05:6102:38cf:b0:5ff:e10e:b9fb with SMTP id
 ada2fe7eead31-616fbea2311mr3560618137.4.1776664597392; Sun, 19 Apr 2026
 22:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260406185000.1378082-1-dylanbhatch@google.com>
 <20260406185000.1378082-9-dylanbhatch@google.com> <95f9d11a-dd92-433e-a8db-cbebe94e1611@linux.ibm.com>
In-Reply-To: <95f9d11a-dd92-433e-a8db-cbebe94e1611@linux.ibm.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Sun, 19 Apr 2026 22:56:25 -0700
X-Gm-Features: AQROBzAWlVd0Pik6ECU4Kd-qXgzCf38HreKoJT7my4kpOuBpU6_tq6UEX8EHlO0
Message-ID: <CADBMgpwjDf44p0ApR1=XVStCyN-0Q6tuywJ4ixLcbaLZOSjjBg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] unwind: arm64: Use sframe to unwind interrupt frames.
To: Jens Remus <jremus@linux.ibm.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_225639_469066_E7540E7B 
X-CRM114-Status: GOOD (  27.66  )
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

On Fri, Apr 17, 2026 at 8:45=E2=80=AFAM Jens Remus <jremus@linux.ibm.com> w=
rote:
>
> > +     case UNWIND_CFA_RULE_FP_OFFSET:
> > +             if (state->common.fp < state->common.sp)
> > +                     return -EINVAL;
>
> I wonder whether that check is valid in kernel?  Looking at
> call_on_irq_stack() saving SP in FP and then loading SP with the IRQ SP.
> Is that condition always true then?

Good catch. I will double-check this.

>
> > +             cfa =3D state->common.fp;
> > +             break;
> > +     case UNWIND_CFA_RULE_REG_OFFSET:
> > +     case UNWIND_CFA_RULE_REG_OFFSET_DEREF:
> > +             if (!regs)
>
>                 if (!regs || frame.cfa.regnum > 30)
>
> > +                     return -EINVAL;
> > +             cfa =3D regs->regs[frame.cfa.regnum];
>
> In unwind user this is guarded by a topmost frame check, as arbitrary
> registers are otherwise not available.  Isn't this necessary in the
> kernel case?

It is necessary, though as you point out the way I wrote the check is
not as obvious as it probably should be.

The saved state->regs is set when the current frame is recovered from
the saved PC of a struct pt_regs, and then immediately set back to
NULL after the next frame has been recovered. In other words, the
state->regs is only ever set when it is relevant to the current frame,
which occurs when state->source =3D=3D KUNWIND_SOURCE_REGS_PC. This only
happens when the topmost frame is recovered from a pt_regs, or when a
pt_regs is recovered from the stack due to an interrupt.

I can make this more readable by adding an explicit check for
KUNWIND_SOURCE_REGS_PC in addition to state->regs !=3D NULL.

>
> > +             break;
> > +     default:
> > +             WARN_ON_ONCE(1);
> > +             return -EINVAL;
> > +     }
> > +     cfa +=3D frame.cfa.offset;
> > +
> > +     /*
> > +      * CFA typically points to a higher address than RA or FP, so don=
't
> > +      * consume from the stack when we read it.
> > +      */
> > +     if (frame.cfa.rule & UNWIND_RULE_DEREF &&
> > +         !get_word(&state->common, &cfa))
> > +             return -EINVAL;
> > +
> > +     /* CFA alignment 8 bytes */
> > +     if (cfa & 0x7)
> > +             return -EINVAL;
> > +
> > +     /* Get the Return Address (RA) */
> > +     switch (frame.ra.rule) {
> > +     case UNWIND_RULE_RETAIN:
> > +             if (!regs)
> > +                     return -EINVAL;
> > +             ra =3D regs->regs[30];
>
> Likewise: Topmost frame check not required to access arbitrary registers
> (including RA/LR)?  Furthermore, provided don't have a thinko, LR may
> only be in LR in the topmost frame.  In any other frame it must have
> been saved.  Otherwise there would be an endless return loop.
>
> > +             source =3D KUNWIND_SOURCE_REGS_LR;
> > +             break;
> > +     /* UNWIND_USER_RULE_CFA_OFFSET not implemented on purpose */
> > +     case UNWIND_RULE_CFA_OFFSET_DEREF:
> > +             ra =3D cfa + frame.ra.offset;
> > +             break;
> > +     case UNWIND_RULE_REG_OFFSET:
> > +     case UNWIND_RULE_REG_OFFSET_DEREF:
> > +             if (!regs)
>
>                 if (!regs || frame.cfa.regnum > 30)
>
> > +                     return -EINVAL;
> > +             ra =3D regs->regs[frame.cfa.regnum];
>
> Likewise: Topmost frame check not required to access arbitrary registers?
>
> > +             ra +=3D frame.ra.offset;
> > +             break;
> > +     default:
> > +             WARN_ON_ONCE(1);
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* Get the Frame Pointer (FP) */
> > +     switch (frame.fp.rule) {
> > +     case UNWIND_RULE_RETAIN:
> > +             fp =3D state->common.fp;
> > +             break;
> > +     /* UNWIND_USER_RULE_CFA_OFFSET not implemented on purpose */
> > +     case UNWIND_RULE_CFA_OFFSET_DEREF:
> > +             fp =3D cfa + frame.fp.offset;
> > +             break;
> > +     case UNWIND_RULE_REG_OFFSET:
> > +     case UNWIND_RULE_REG_OFFSET_DEREF:
> > +             if (!regs)
>
>                 if (!regs || frame.cfa.regnum > 30)
>
> > +                     return -EINVAL;
> > +             fp =3D regs->regs[frame.fp.regnum];
>
> Likewise: Topmost frame check not required to access arbitrary registers?
>
> > +             fp +=3D frame.fp.offset;
> > +             break;
> > +     default:
> > +             WARN_ON_ONCE(1);
> > +             return -EINVAL;
> > +     }
> > +
> > +     /*
> > +      * Consume RA and FP from the stack. The frame record puts FP at =
a lower
> > +      * address than RA, so we always read FP first.
> > +      */
> > +     if (frame.fp.rule & UNWIND_RULE_DEREF &&
> > +         !get_word(&state->common, &fp))
> > +             return -EINVAL;
> > +
> > +     if (frame.ra.rule & UNWIND_RULE_DEREF &&
> > +         get_consume_word(&state->common, &ra))
> > +             return -EINVAL;
> > +
> > +     state->common.pc =3D ra;
> > +     state->common.sp =3D cfa;
> > +     state->common.fp =3D fp;
> > +
> > +     state->source =3D source;
> > +
> > +     return 0;
> > +}
> Thanks and regards,
> Jens
> --
> Jens Remus
> Linux on Z Development (D3303)
> jremus@de.ibm.com / jremus@linux.ibm.com
>
> IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsra=
ts: Wolfgang Wendt; Gesch=C3=A4ftsf=C3=BChrung: David Faller; Sitz der Gese=
llschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
> IBM Data Privacy Statement: https://www.ibm.com/privacy/
>

Thanks,
Dylan

