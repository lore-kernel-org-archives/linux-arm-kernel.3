Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CB4E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 19:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HB1D/kV+LS+wbR3JFN0rKIWFlL1hHHNzi40qmGJ0Urw=; b=mQG95MbMadBa4JNZV/CklCdRuC
	51ipCYY7iWyaKSRES8bpM++TGy9DYGHmvSu1zdIa7qOjZiVX7UTHvSz/Gfe1rU5bF4v57cAuICTE0
	KeaTAlfM6JxIteFCnFNSJHgn7kFlCVfsgubTThxconYCzbIjx4Nv//jHf/S4dsj5hP1ZfDK6/d9dD
	LgkLF2+tL4Xvu5E3LkWaJiNVMmPPFQNVNVbdCEYaPI5GWNvlUcnvNmMYLqPLh4oq0TGIT39hU6DbR
	vSqMuG6ms9uZDe88Bd/AqbfUWBRrK/Z/Gw05bH/zIXBgoNlmOGyipOm/KOVyyEM7TiHNztH34awjj
	BLPmN1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdpe-00000002Wdl-1FJs;
	Fri, 06 Dec 2024 19:17:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdnh-00000002WHn-1p5c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 19:15:42 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d1265ba5a8so2685964a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 11:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733512539; x=1734117339; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HB1D/kV+LS+wbR3JFN0rKIWFlL1hHHNzi40qmGJ0Urw=;
        b=GM42KmVd3OoKm/sfdGPhsGgOQFk4OfUxCmsN5ZG+W0kF64BMXIJTII8GNPKXFJT/6z
         0AKtbeHDlM0xIigzSCnttWFcbfd1f6JrNN/EvK4QDYlvTa84GzEJCkGInOTmJylocjlR
         dWQnXDjvdcsjlyQF10eu2dwXdgwwIjxHc6IHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512539; x=1734117339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HB1D/kV+LS+wbR3JFN0rKIWFlL1hHHNzi40qmGJ0Urw=;
        b=h7BGorpwKoeW5w8XVIO/Z0OYyUhftyu1gEZgA2zWZKhCeP7A4eD+4DVjdN6JQP5/69
         E2b/RS+jdGYgvvA2G4W+7+BO9Rt/2HqbC6Mr75Kvxrs1eREuYXebjAcdsK7cPOOhaekK
         rrUV201zSBRBAJjR1gqG2V+u/eHll0AbDyWskFSLXb5XrbRB9yvZqZtddIVPdtOlkZ1j
         NZLYsuqYZxqmPM27ItbnY8HuAEI7iU69lItfAkVwaZPPkA3Ol+rMTa55vV22I9Mi9eMW
         CGZc6w64GlPTI0TmAIx4fnGTUgIYQkz40ui2jBklE9vcmScmf4g68vpp+mlmoy/xVWOf
         G1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKorF126F0VrmM4o6SnGjcvH+ytz5x6IrvG4UH4xfhWxnVFN/Uunnh5vAzH4RbiLt030i/ALVeOASp44Wqfan7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq9G5wWRKA0kBWcLVBux2gpXehePWABCyjTRV0BTXPCOZVEzZz
	03JCbLp8T3KhKnO+Obh8iwyLeXaIcqTnFxt9yVEpJgcm/gAq5ilvmkZVVwbJEfPmR54BIMm+n+t
	ZZzD9ZA==
X-Gm-Gg: ASbGnctdDqBrB2yx6Pxg/ggpq/NFBsUWy9L0aAxrpIYb7urE3zwFxolsrQ9g0hZFHWS
	11OsKyyKmY9bkcflAydEwQ3M3Eyb26QQFeZGlh+/pKuRV5Mk3z1OIYVlAMz+7tiMZ/2S3mdhLkO
	pXxpOR5Yl4CQpQVbkfC5ZdkT53kgJGdgaTdijyepEwZwHpYJZVnlzMfpZ44xVe9t2zW1B/J+iCf
	HzIlINC4ZUrr9L7wMj4eA7tAwtcwN6sPAWb0AFKuzvgnybmvqPP7Rvw+zntgQqo+QeEhW9PnDkB
	PJAhO/J8qHgdA2kXWCWFZvws
X-Google-Smtp-Source: AGHT+IEI+O+gpuCbk7cemA9fZTWPV1qywjVSHkm1frbcxAiK8WjWb1vejcZ6f6H6vfxM2SAL4VHW/g==
X-Received: by 2002:a05:6402:3184:b0:5d3:d8bb:3c5c with SMTP id 4fb4d7f45d1cf-5d3d8bb3cedmr636671a12.12.1733512538727;
        Fri, 06 Dec 2024 11:15:38 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62601b5b5sm281009466b.98.2024.12.06.11.15.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 11:15:37 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa5500f7a75so321532766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 11:15:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFXGIc/GhmRwWuVn38seyuj8y3aBAACCbvASYrQBu1KfupoDKaPabqOR21laTKNUnb//UBjeVQyyLspdU8cgBw@lists.infradead.org
X-Received: by 2002:a17:906:4c2:b0:aa5:308c:3489 with SMTP id
 a640c23a62f3a-aa63a2519b0mr271057466b.58.1733512537212; Fri, 06 Dec 2024
 11:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com> <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
In-Reply-To: <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Dec 2024 11:15:20 -0800
X-Gmail-Original-Message-ID: <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
Message-ID: <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: David Laight <David.Laight@aculab.com>
Cc: Vincent Mailhol <vincent.mailhol@gmail.com>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"uecker@tugraz.at" <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_111541_587630_A06BF884 
X-CRM114-Status: GOOD (  11.79  )
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

On Fri, 6 Dec 2024 at 11:07, David Laight <David.Laight@aculab.com> wrote:
>
> I'm missing the compiler version and options to generate the error.

Just -Wall with most recent gcc versions seems to do it. At least I
can repro it with gcc-14.2.1 and something silly like this:

  $ cat t.c
  int fn(int a) { return (a<<2)?1:2; }
  $ gcc -Wall -S t.c
  t.c: In function =E2=80=98fn=E2=80=99:
  t.c:1:26: warning: =E2=80=98<<=E2=80=99 in boolean context, did you mean =
=E2=80=98<=E2=80=99?
[-Wint-in-bool-context]

> Does a '+ 0' help?  "(var << 2) + 0 ? 0 : 0"

Yeah, that actually works.

And "+0" is nice in that it should work in any context.

> #define const_NULL(x) _Generic(0 ? (x) : (char *)0, char *: 1, void *: 0)
> #define const_true(x) const_NULL((x) ? NULL : (void *)1L))
> #define const_expr(x) const_NULL((x) ? NULL : NULL))
> I send this morning.
> Needs 's/char/struct kjkjkjkjui/' applied.

Oh Christ. You really are taking this whole ugly to another level.

           Linus

