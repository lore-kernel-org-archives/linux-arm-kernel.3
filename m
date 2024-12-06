Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A86E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 18:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7buzdn3/PR+OZ7E9SojfZrudu0PKQFtLTRAFouRbM0=; b=V7p136ZsbGxkLYry3wUW9Gwsic
	tDkqjJAwvDmLGkUK+TWESImDVUKInTg17F3H/B4o7A/AxVOveZxoUExEcqjFd+H06Ry0SbK/smLz6
	IXRc2YbHQRkGxhrbmLSJpKW6A1vgwyX96+5SFqOisZzGA3IECyzmhRTSwHFYHB5YuxGe3VJsE1V6q
	t5SE6NstPmwfKmo93caFfN16gXSB2kGFHVKjQvOrWw252e3GeiRm446/OcF/AIZauanJqkazHCqIG
	IsQ0GUS422AaOVFImNxs6QDd3I4Ja5aFM2Dy+ZY4VCLnj8Uu4UumAXaj9Rvs18fIHRK64Lt+zTUPy
	I4PCSTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJd7f-00000002SB7-2jQA;
	Fri, 06 Dec 2024 18:32:15 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJd6d-00000002S7b-41uM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 18:31:13 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa6332dde13so84020966b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 10:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733509870; x=1734114670; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7buzdn3/PR+OZ7E9SojfZrudu0PKQFtLTRAFouRbM0=;
        b=OIgO002rrb48smjNiUcmrMnDv5PfYvKmzJIC3a64lxRcfitl1pqedtapWP2FYv9mo9
         e9VmgdsLoNI99xRGtdNI1odW3jSXRoRAvdEZiPYsT15mRuXH7etjAOjqQTnabZr1LZ4O
         L7WmNBPZ5agoO5WutdQFZCiE00KYVKYmJ8DILjY4AXv+VMCn8UuE/FHT7ATQ6XoA6IhL
         gNJIoS7NZnO1w4IBes/JQz5fQpCqbFTDyioa9emRZANlq9XayW9nMnT57eOThWZS4rkc
         xr4s8Ae0vRkxHWQ9PdngtqIyTQswdC7T9zPANL7UkvKBsRAauc0895uHewPNhOdH6Dx7
         +47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733509870; x=1734114670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7buzdn3/PR+OZ7E9SojfZrudu0PKQFtLTRAFouRbM0=;
        b=UQvgP6z1H4I3IlMTyrOaMJBpLF0f0/GhxWGen0jvWpN0JpJgVc62OYkehxwdU/Evgg
         W4SGZ5bOP1tyTufy3mH41HLm+xB2vvItH8CxHi8GetSajXCz5t3Ksv3gW7K1lCU4R+NE
         6Wt/Fp/IUv+qRTR+X2i0cIvikdQK1gZWo3+KZOPgAEMzBdKtyZpptLNrtNKWatAVpirF
         JYJdjgFFqHxwqZjO7Oe0lLW5sO0gM1IioUrDvlCEnZDvBgEodurNCnKazCsK82/bPdGq
         pOu2bJLhmvVTdfGymDFELPSgg1B/d0XXP7qbmn+/eX6/Ly+BKXq7Njn/6Lv6liYUP1Lq
         c4MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaJ92TJhNYG0uRMz665jzA5DmFlDZ8WSlnAlzUkgvEPLgJ5SDWZWP0MI90TLiuJup1eG/X1OkBJMVgYabW0vfn@lists.infradead.org
X-Gm-Message-State: AOJu0YzUFo6SzrXs02gE+4zW2rZmRw9hxi+2auffMtvqOunqPbC41M+B
	Q0UiLMftu849Tbj0+ry80yTlOKOmNGgkZqvEuClU3a+NbAZ/du4ygbfWaNt8S60bIPBF1Tnw6wn
	HKY5ZNh1sGF5IotUEirddoIYGxaY=
X-Gm-Gg: ASbGncuhA2yN9kv0GHOtd/SdvB7nasVN/uNC/TWHG9SMBANZl0NHlf2u8tmmDro/VeH
	5D1HL4dgMLywinOYLFYne2A0cMOH1PFU=
X-Google-Smtp-Source: AGHT+IFnd7xj5Pq9akTxmspxJbkFJbmmIA03mUFW2B6h+sDDSyh+/NdbCh8gBxT6LtqsX9b+RXGKw/QASht5Itx+9Lw=
X-Received: by 2002:a17:907:7703:b0:aa5:46d3:4d88 with SMTP id
 a640c23a62f3a-aa639febbbfmr329138866b.15.1733509869483; Fri, 06 Dec 2024
 10:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
In-Reply-To: <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 03:30:57 +0900
Message-ID: <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <David.Laight@aculab.com>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, uecker@tugraz.at
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_103112_000196_318CAC08 
X-CRM114-Status: GOOD (  28.89  )
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

Grrr, I just realized that my emails are bouncing=E2=80=A6 Didn't happen
before, I guess this is because my smtp server is unhappy with the
many people in CC.

Resending using another address (and, while at it, redacted two
messages to combine them in one and added more details).

My deep apologies for that, really sorry. Also, maybe the bouncing
messages will finally find their way out? In that case, please just
ignore them, and sorry for the noise.

On Fri. 6 Dec. 2024 at 15:14, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, 5 Dec 2024 at 18:26, David Laight <David.Laight@aculab.com> wrote=
:
> >
> > From: Vincent Mailhol
> > > ACK. Would adding a suggested--by Linus tag solve your concern?
>
> I'm genberally the one person who doesn't need any more credit ;)
>
> > I actually suspect the first patches to change __is_constexpr() to
> > use _Generic were from myself.
>
> Yes. And David was also I think the one who suggested something else
> than "!!" originally too.

Ack. Then, I will add a suggested-by tag to credit David!

> I may have liked "!!" for being very idiomatic and traditional C, but
> there were those pesky compilers that warn about "integer in bool
> context" or whatever the annoying warning was when then doing the
> "multiply by zero" to turn a constant expression into a constant zero
> expression.
>
> So that
>
>   #define is_const(x) __is_const_zero(0 * (x))
>
> causes issues when 'x' is not an integer expression (think
> "is_const(NULL)" or "is_const(1 =3D=3D 2)".

But 1 =3D=3D 2 already has an integer type as proven by:

  #define is_int(x) _Generic(x, int: 1, default: 0)
  static_assert(is_int(1 =3D=3D 2));

And regardless, __is_const_zero() performs a (long) cast, so
__is_const_zero() works for any other scalar types. Even the u128
works because after the (0 * (x)) multiplication, you are left with
zero, preventing any loss of precision when casting to (long).

Here are some tests to prove my claims:

  https://godbolt.org/z/beGs841sz

So, it leaves us with the is_const(pointer) case. To which I would
question if we really want to support this. By definition, an
expression with a pointer type can not be an *integer* constant
expression. So one part of me tells me that it is a sane thing to
*not* support this case and throw a warning if the user feeds
is_const() with a pointer.

By the way, currently, __is_constexpr(NULL) returns false:

  https://godbolt.org/z/f5P9oP9n5

and the reason this went unnotified in the kernel is because no one is
using it that way. So instead of complicating the macro for a use case
which currently does not exist (and which goes against the definition
of an ICE in the C standard), why not say instead that this is not
supported by just leaving the constraint violation in is_const()?

> Side note: I think "(x) =3D=3D 0" will make sparse unhappy when 'x' is a
> pointer, because it results that horrid "use integer zero as NULL
> without a cast" thing when the plain zero gets implicitly cast to a
> pointer. Which is a really nasty and broken C pattern and should never
> have been silent.
>
> I think David suggested using ((x)?0:0) at some point. Silly
> nonsensical and complex expression, but maybe that finally gets rid of
> all the warnings:
>
>      #define is_const(x) __is_const_zero((x)?0:0)
>
> might work regardless of the type of 'x'.

If we *really* want to go beyond the C standard and extend the meaning
of integer constant expressions in the kernel to also include constant
pointers, then what about:

  #define is_const(x) __is_const_zero((x) !=3D (x))

As established above, comparaisons return an int, thus making this
pass all tests:

  https://godbolt.org/z/f5zrzf44h

And it is slightly more pretty than the ((x)?0:0).

(...)

Side question, Linus, what do you think about the __is_const_zero()
documentation:

  https://lore.kernel.org/all/20241203-is_constexpr-refactor-v1-2-4e4cbaecc=
216@wanadoo.fr/

Do you think I am too verbose as pointed out by David? Some people
(including me and Yuri) like it that way. But if you also think this
is too much, I will make it shorter.

Thanks,


Yours sincerely,
Vincent Mailhol

