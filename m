Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2849AEA71B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 05:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDoxCCxrGEpnif0U3GdL77JMYxIgwE31nWai8xD0wt8=; b=LlAF0K90/XMKHGLZ53j2fCkd9O
	npe7Zx5M6koEdNa3SO4ifjabm86/G0at9ZyBN/cH2bFRnxKoEpgLknHVZ4QUIIejQUzLVkkRB6GU0
	QbXEEWQ33BDadopFtI5Kb1/J9ybNh+0ToslhBeRqX43CKH35X2af4jnkMEBaiI7/GPyqEu6MqgCSe
	LttQyGFhtLmSIjFIY6VK+q84OlvpT1ccR91AFCljz8/z0UTXx+CMKnfRw98WRSvnSU2RXmtVVQYM7
	QTNr8+A8fzSursQeEp+/ZmSAULwOT44OiyHWP6/6Rixu524FWe2EOzIIq1vk5In2qRtE9rGEtBknt
	ps33bPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgmT-00000006QVd-42pm;
	Mon, 20 Apr 2026 05:02:45 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgmQ-00000006QUp-43ig
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 05:02:44 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-605823aec55so1759084137.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 22:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776661360; cv=none;
        d=google.com; s=arc-20240605;
        b=jSJn9kXNeEqF3hINAmdNpaDWx2JX38LY0anjAW6WgL3b9G3A628egAG/aCe7Zjv1fX
         dHSVAr+FJtLvPaXZ5ky3NFOidmuO644Sk+VkwP3fBkzpb4JrCNtlB2TMQH52J5NxckGY
         VSq3bGt8oh9AMVM1cW25vRYHBN4jXdZpI3cg8PJVzMr71IxpO71smJBq4R9/EHbBAWW2
         nbLNo/ir+uIRLFYRAopLHaxUA37Kya9INw8oZgus4u4zmsrD31fuPmr92QnCwCL1H2AF
         U+Q8ikkAjBIPkRdh7k3TuXs2P455IbwwjCVFqqiZ0YzIJQSIvLm23o9HHa0C74pdRzLK
         PMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GDoxCCxrGEpnif0U3GdL77JMYxIgwE31nWai8xD0wt8=;
        fh=iFtuLvTnLf1Bb4ZUt5rlD4F8TBSgcslAboMGfM58H8I=;
        b=OoALMUZpT6zTNYfF3X7oqiRFGezkll7JvnNWmKNUaLhDgrF9kBR5AG9KA37fVu3tkV
         mzBO2jAyhqzhv0+4XvsO16/CZl4LZNwB3tPqZVS+bko838YyJF4RumRzjTB75Nra8GTY
         A8JwX2xWRpYP6LL4nQ9vCgXltzRlQc7+oJKW+Y6w+QlJ0uPD2NNaAWeGfqDUMgRjNSdc
         bCBXD8ce2FELZ90STizDNEtXvrTkR0KyN+cHJgUWFJO2solFpn6coCdItLnArZhreIZR
         cR38IdeKY7FCZ8v1053oY4jTuMHSGTqWRRyvnfePkDQ9tV8lWEopl97NmAKafP/xZB9v
         zoNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776661360; x=1777266160; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDoxCCxrGEpnif0U3GdL77JMYxIgwE31nWai8xD0wt8=;
        b=nlHcx70o1FUHcru524TlxD6PfQv5D3tcLye70BpFvJYU2267zINYM8OrqmoIhnvUXd
         gwlI250tzumU3yC23FGGG32zCWFAdjkBuus3uGti9yYs4dZeZ8ck514GTmXqdl31F7N6
         n4RKYGAgBP+2WI5hSniNq5ZncjevT3kFWa0Wa4xtHN+KH7BeLuhC7EtA0OTbLuOGC7mh
         K9eHDwavqzG1BdpiY+U7JzMQM+nau+sqbE5I6cRkfhk4OhrIuOEQPPQ3u6LXifUGS68a
         3AQEsEQIamuPK1CZMbYjlgqsl0hvkemMiouGi8lQBV5e+4sBbfV5fcldSqnATtWSLiS2
         WkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776661360; x=1777266160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GDoxCCxrGEpnif0U3GdL77JMYxIgwE31nWai8xD0wt8=;
        b=siE2GERFsuKPOuqWz3tFm/79s9sv2JwOICpH5azcoebc3u+ZphVkE+1/DnEs9cf+Xv
         0RnBEvT77WhXX0/dLH3ma+GbbySP/2px+4Nle/QZmPDFg0ys4VopBZIJzaDX+ZwsG1VC
         RrAdqmGnuovgB5ECowZiOL6tOYdLvrWmQCBLqJh7Us5YMwNTSsQAOQ6GlYLHeOdJwkqX
         HkNsHsQkvr+YZtxrvY3oQ+zu1PLsFo099mHcTbhNvKBRli1MpnbsnR6irvbN6bxsPjEo
         scWcb1JWnH4d4P4uR0QsSrSgpz23Y0BY8j0Z1sCf0MOlCo6p3LAY/0fNf4RIk+fx4LD7
         frsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vS97NOfgtn6k7QpyZeacb+/28RXkI7uZSgnHMr2jKeZc+H7hPtAvnOQjoznrUDMgKOh7r26TgvxpZEEl0X54r@lists.infradead.org
X-Gm-Message-State: AOJu0Yye4KoPAzplq1WbxQaSuZaSj/AA8LETLEOVl6LcDbrISC/yv4S+
	XYdmrbRmD+BVftKusmuzlUk+bTW9GY47onw/YU1L8wLqtSwCZBMi9GnFNtGooManXsOPad245hu
	r8FJb1XVloEbJHMY/JgPwHULkaK5sTNiUZPFOEaJQ
X-Gm-Gg: AeBDieu1AUtK8uPMyj8CiCSyuj0WVIhBTpxN4MQEyFupojI/4o4FhEToFKoRaYmU9c1
	fxv3DHWtZDdv/zJ5ZfuMwM7ojvg9fTKF8VdpYVS7ROe6vuBTB+IQYMdbbOfpbz/y/NBwcATM6lv
	2k4hZVCvNRqzsmsGrg2ALaDSgG+kWujaFDtKa06hYSJsCuUtI6nJMhJaZndqQ1g3E7keYKKczdx
	1VcgxtcqkJlulKGcMbnIcWIRw6XiGvM+o2DQPdtpqw4nWMhRyjgfOyyP+arzoYTLzT6m2TwwZTL
	cBErp2CSQi9SyypVjqppn/bSikS1
X-Received: by 2002:a05:6102:4429:b0:602:9977:a4f5 with SMTP id
 ada2fe7eead31-616f7841746mr5442363137.27.1776661360013; Sun, 19 Apr 2026
 22:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260406185000.1378082-1-dylanbhatch@google.com>
 <20260406185000.1378082-8-dylanbhatch@google.com> <de7bd273-3650-4378-8fd8-a51217e7284b@linux.ibm.com>
In-Reply-To: <de7bd273-3650-4378-8fd8-a51217e7284b@linux.ibm.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Sun, 19 Apr 2026 22:02:28 -0700
X-Gm-Features: AQROBzCBNcOyW-40KDswAXPsMnzMW6-8REr7qR9V4RNPB3Nxd-zNK2Keg1pi2tU
Message-ID: <CADBMgpzbEGTm-sZ71a5hvFOHbu5VgSR406F3NsMLF1+oDWbO6A@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] sframe: Introduce in-kernel SFRAME_VALIDATION.
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
X-CRM114-CacheID: sfid-20260419_220243_124149_308A5E3D 
X-CRM114-Status: GOOD (  26.83  )
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

On Thu, Apr 16, 2026 at 8:04=E2=80=AFAM Jens Remus <jremus@linux.ibm.com> w=
rote:
>
> Hello Dylan!
>
> On 4/6/2026 8:49 PM, Dylan Hatch wrote:
> > Generalize the __safe* helpers to support a non-user-access code path.
> > Allow for kernel FDE read failures due to the presence of .rodata.text.
> > This section contains code that can't be executed by the kernel
> > direclty, and thus lies ouside the normal kernel-text bounds.
>
> Nits: s/direclty/directly/ s/ouside/outside/
>
> Could you please explain the issue?  How/why does .sframe for
> .rodata.text pose an issue for .sframe verification?

__read_fde checks that the fde_addr it extracts is within the bounds
of sec->text_start and sec->text_end. In the case of the vmlinux
.sframe section, this is _stext and _etext. However on arm64, there is
an .rodata.text section that lies outside this range. From
arch/arm64/kernel/vmlinux.lds.S:

        /* code sections that are never executed via the kernel mapping */
        .rodata.text : {
                TRAMP_TEXT
                HIBERNATE_TEXT
                KEXEC_TEXT
                IDMAP_TEXT
                . =3D ALIGN(PAGE_SIZE);
        }

So __read_fde fails for functions in this section. Under normal SFrame
usage for unwinding, we should never need to look up a PC value in
these functions because they will never be executed by the kernel.
However, we still hit this error when validating all FDEs.

I think ideally we might prevent sframe data from being generated for
this code (maybe from the linker script somehow?), but I don't know of
a simple way to do this. Alternatively, we can check for FDEs located
in .rodata.text during validation, but this seems to only be present
in arm64, so maybe we would need an arch-specific hook to do this? I'm
open to suggestions.

>
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
>
> > diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
>
> > @@ -690,6 +699,13 @@ static int sframe_validate_section(struct sframe_s=
ection *sec)
> >               int ret;
> >
> >               ret =3D safe_read_fde(sec, i, &fde);
> > +             /*
> > +              * Code in .rodata.text is not considered part of normal =
kernel
> > +              * text, but there is no easy way to prevent sframe data =
from
> > +              * being generated for it.
> > +              */
> > +             if (ret && sec->sec_type =3D=3D SFRAME_KERNEL)
> > +                     continue;
> >               if (ret)
> >                       return ret;
> >
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

