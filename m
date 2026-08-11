Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F63C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4As2mFA8aWYhfLWWIWRMoWPqMew/xqk5MDSmOKH9xs=; b=YI1VF4GNLtbIq3Xzcsop7WFg4c
	qbx3Ws+LPNs1sh1UWdNyyIkMz0weK0YD/hguDmb4u7Pi3gxFbLGFeCGr/+KMOephBDi6DBny5p+n/
	lSSBhLogBX144E2dWzhZOxqRdpe/TFuVtYkv0e7LCOOHqp8gY+9kbXu7jpV0R+MQZBZOnL3WFhxyq
	5Rye5/CaIw5UaLpOIPXq+SxN0rWRdz9NjQ8QyRTgb5yogEb2J66oIdLNTafuHlCCRBYRMWlZN06HY
	Sdg5jU1BeLLPRUemhAuMQNP5gSKXZQ1UwPE++p8Tj7Jhkc4criCerFIHbcFkSVJu2cmkR1JUr+Q9C
	vWDoakOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpie-0000000EYuQ-1fxa;
	Tue, 11 Aug 2026 16:52:52 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpic-0000000EYtf-0bbY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:52:51 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so9430266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786467167; cv=none;
        d=google.com; s=arc-20260327;
        b=mc+GaIT17wT9ne+I45MUV+TScNKU9EZK+P2auuqPjvkNvjWBd57BRek/olfzNr8rdP
         cTHgLhUnG5QJ/Uxl/OQRK5IwvPR26rxdzSQyI/KbSwlVftsipH+cRyAyPxTF5nBELwka
         aI2c+ox/hLN01tc4Jh8TH7PkZLpGGw3umIhhNLWs6MqmIirW3T4Uc0h0Mi3foDu2LHlU
         DTQyMXcinIbsZeg2UREkxjFTiI1XT8wYfrVvZtB+eWcyAbdeKbBC8n/2SnJg9+Z0bgrL
         gXYSXIVO40EL5xE7KONsmasIN5IyruyQnxQew2a/FxB4fTP2kox5Drnfij8Fn7gL2JCH
         4EwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S4As2mFA8aWYhfLWWIWRMoWPqMew/xqk5MDSmOKH9xs=;
        fh=WpXO0uZuMiqwRd32bWaOIqL0K1L8dV40tBp3UHeVNwI=;
        b=WbbPGBL5Chh7beXWt5arcaBsa9J6XglKdKxFMdNZikAOfNymTdNLMW7iN78dM4jza4
         +1Hbqx9YNLqDc3ket7/IYH3aY8AZPKrElLkTvQ08pz2YoiZa/NJK4jnSIYs4P1XJ6tGx
         Q9DbSo24tr9oVPZdNGnMSs7AAiowzhoPYYTt7AxCYWxACnF+egozF84HjF3Onx3A/I+v
         cMg1kHXncmYeBTr3owkjCKQZzlCT7ZzQq7IwxhpTG0UwFv/qIfjaqknZ7QyyZym9n1om
         tfneTSyO09hDA5hzNolLN5OGeEjT+AdbxFClwagqHV/POwe44lLPfBVyKSpOeEOLi4Hd
         W80A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786467167; x=1787071967; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S4As2mFA8aWYhfLWWIWRMoWPqMew/xqk5MDSmOKH9xs=;
        b=j5lYgOgqaDjYf0dPrAU2df8bey7JP8zRCPwJm1AEYDm/FQdUXdbjzf6v3qHkcUEbxD
         zWxEUYKZIWn0iONxd9f5hZ1EkX/65BlGDZ5cgkZfmH5HgggrqcApT/A6QglvpgBbiY8W
         9O8ut+OC/ZZeseNpIJ8XB0y88VtCfOtAWDYtYLnOiijkCFCzeVjoo/FrxYjqIfM1gY+5
         87TbytPA4Gtl+ZF9RbLCmEjzyJGyekPW0/Jybk5Tnjo9iFrjTKXEk/BPQEBF+O+dwLUj
         I0vO0Vw+lFqNBX41ImMjUT6B2V9RxEymLAThAvh/gVcT15xiJ13dAHevnUTS49Aucnv9
         qi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786467167; x=1787071967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4As2mFA8aWYhfLWWIWRMoWPqMew/xqk5MDSmOKH9xs=;
        b=iwMxT54cxyWir6mTkGIE9uGERGLPxjwhr0iOH2CsVEOb+4kWnV1vIqvTBxVuxJqOnD
         HiW0ubZ7Ltd2PFWu4CGCWYrUa5meiLis7+sgTGClFvoYB4MxZF9xLikS5AEay8fK4t8W
         OkwegjUHVFifT3C3Gm7nFN4TKcRC7zzDHcbaGodAF6oR43XU2g8aC9ddOnP5VpMo3uxZ
         WBKiMoQ1a9XIyq68q/y0+WZPE9g9zjcjLBh8iHswokyszuqAaWF5MdJgrgjAjXHwKumL
         RGmnt3tvgl9mbPDVz0t/5rM27xxnOOfqyoDmtpuVaNr1WMpp6Ybd1KfYHQC6geP5zkrW
         Zc4g==
X-Forwarded-Encrypted: i=1; AHgh+Rq/GEGN8uSMIQH3P8RazeY6qUuXMLkRHeHjH5dH/c++Li67vH8PYAbSN/k0D2zQQ8LMH5cyjLMT7CjTOsWL0w7h@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc2WvYq9OrpYO0vXAjPu9JXV4nIN4fwp5dF5anQWnhm2rJjU0F
	nZvNYx2bIqRrluqNJxI56fmcOdvnXkhLBxLnsyDs06yO3v2SuvAxXJUyZHrDybSCGWjnsaypt9b
	G3Nn5Z7sGHHNTU6w01ViKFTIhkZ9vci5qwmvIZMGN
X-Gm-Gg: AR+sD10Ee6ZEA2mmWiGK03JIVq55LmXT3yRJfINpv51AJXhHSQN03gRrAl0vRsmHXPR
	p/JWtBeRV79TqIYWj1B1BzAisEG2BKgjp6kL6jUbtta6DuAeEay8xjlwoD4RSKo+3n02thegeF3
	LGumGf/BKe6+GEkCz0/cXiLTc4dqJF0ve7rFpBffo7P9IkZXuGNDOu3OgpN9KPDTEg5F53YqgHB
	v8MYjGdQmiKoyMsqYsP54ie97OiTrSWeYLmAQeLd1loIAzPOdI/Cz2485Bjpcm34MdJxxt79EPD
	moIsrHbwBys/3MFo3fJBsHo/B5X4dEaz7YlpqKhoTkxwnp8afNYAhmaUT1bWd/WVwPv/MoBCnz8
	QhiVom4URWUuKZi0alV0NgVorBPw0NU2NudW7cUkzF+dAPHNpit1I6fvL
X-Received: by 2002:a17:907:724f:b0:c20:6d47:34ee with SMTP id
 a640c23a62f3a-c20e6056af9mr215890166b.7.1786467166490; Tue, 11 Aug 2026
 09:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <anmobvJXiBQqWn6S@willie-the-truck> <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com> <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck> <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
 <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com> <answWdRpVQLtIzIj@willie-the-truck>
 <CAKwvOdkrxJ_9qjaBNQS+o=+_m_f3e9k6jMEmXB-S3+nXGoLV7w@mail.gmail.com> <buq25tpmdjlvskzfvlit6swc6tsjuzbdnjfix4w6af6247zads@ka44wuolomci>
In-Reply-To: <buq25tpmdjlvskzfvlit6swc6tsjuzbdnjfix4w6af6247zads@ka44wuolomci>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 11 Aug 2026 09:52:34 -0700
X-Gm-Features: AUfX_mzCq3u81v06vYARR0AyhIU67S0yPka865w-1u9RG5j9RiVHj-bgtj-BOcg
Message-ID: <CAKwvOdkS5ZaBGaoiLwcXqCBjcOXLXE88VD3bj5ES1sssKFf4HA@mail.gmail.com>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, 
	Song Liu <song@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_095250_216666_4E1F02E2 
X-CRM114-Status: GOOD (  24.47  )
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

On Tue, Aug 11, 2026 at 9:41=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Tue, Aug 11, 2026 at 09:27:28AM -0700, Nick Desaulniers wrote:
> > On Tue, Aug 11, 2026 at 7:23=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Tue, Aug 11, 2026 at 03:18:17PM +0200, Ard Biesheuvel wrote:
> > > >
> > > > On Tue, 11 Aug 2026, at 14:02, Ard Biesheuvel wrote:
> > > > > On Tue, 11 Aug 2026, at 11:44, Will Deacon wrote:
> > > > >> On Mon, Aug 10, 2026 at 09:41:35AM -0700, Nick Desaulniers wrote=
:
> > > > >
> > > > >>> Sure, but let's replace this with a link to a bug report in llv=
m's
> > > > >>> issue tracker?
> > > > >>
> > > > >> Yes, please! I can apply the patch once we have the bug number.
> > > > >>
> > > > >
> > > > > I can look into that.
> > > >
> > > > https://github.com/llvm/llvm-project/issues/215547
> > >
> > > Thanks, Ard. I've ended up with the patch below.
> >
> > What's the extent that HAVE_LIVEPATCH will be used?
> >
> > Does this penalize kernels built with BTI in favor of HAVE_LIVEPATCH?
> >
> > For example, with my Android hat on, if we have a kernel that's built
> > with ARM64_BTI_KERNEL=3Dy, and _dont_ use HAVE_LIVEPATCH, we're going t=
o
> > turn off BTI for a feature we're not using?  But maybe we _do_ intend
> > to use HAVE_LIVEPATCH, and my assumption was wrong?
>
> The problem isn't specific to livepatch, livepatch just makes it easier
> to hit.

Rereading Ard's report, let me see if I can articulate _how_ and tell
me if I'm still not getting it.

Let's say we have code in .init.text that calls code in .text. If
.text was placed large enough away from .init.text, we get a veneer
inserted by _the kernel_ (not the linker).  This veneer has an
indirect call to the destination. No landing pad. Boom.

Is that precise?

>
> --
> Josh



--=20
Thanks,
~Nick Desaulniers

