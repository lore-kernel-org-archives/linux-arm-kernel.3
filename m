Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35474E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 15:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXHUUtMJhw42ifbhB350SCKKtNQKr7a+mjsEg0ARJVE=; b=KpP3H6kHslDmlxf0Kyj9lu5W0G
	oBATYqmqmLvLLWyUKQdCPO8K4Z0Pga30+OjkfqSivEjMdnVlWofxDdB61Palz6gXJNMSbG+aBoC5G
	wH3OCxZ7VmHS2wmlF64ITcXgo6XtQOkTJBFV5dP6AxQC2yuE74Ma2r55NnDqcXQgElPUiNMpvJgZ+
	SNr/1i+bk4K85FMhpplc/7RptkyAfJNn3uRFUquVGLYNvm4728mXIbxBCIOtmdeYIEoU0wyzUP77c
	KZPQ59mNoQrGeEuxgPBjkjg3IJUnKqKZp4v4iKSuCFDNav7oS7HUCzPKUq8+reegAXFg7IFwiroDk
	RT8+cGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJwfi-0000000450E-3gjY;
	Sat, 07 Dec 2024 15:24:42 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJweg-000000044vb-29Mi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 15:23:39 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso487749766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 07:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733585016; x=1734189816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXHUUtMJhw42ifbhB350SCKKtNQKr7a+mjsEg0ARJVE=;
        b=Fl49fZfRTnOworNmi7glrt7/66t5fRrmc98n+Iz28yk8MtMTm7fgEkiuAwDLXjfN0y
         RXOrq+s/vssZi+MNkjoqlBheamacoXvZQGxXkbk8FRXUweJvf+fgTVmYTtD/ortRER1a
         5gKIl/xJjhIWBi1GlGghpDzudC6oACKzCJmtIo60uyAuJvByhzfp6cR0oKx/HHN0bN7w
         DPFBIn6ma35gmU0CPzVmbCGG7pJwd1IN1sL9WuXl4ttiZem1XcZXF7wHzb1KScwxUCfg
         1Y6K4ylbrGLINWUcSfx8mxnQNLuFPh5KFuoRM85CuKbm3ZuOvOTKDqnLiuxXjdMeJk5b
         ZAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733585016; x=1734189816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXHUUtMJhw42ifbhB350SCKKtNQKr7a+mjsEg0ARJVE=;
        b=ZrQu90GMAcyY6Cp0xi8+xvgxak8jHkGme52fFaLPDk++7WwvOe2dEPxT2cf6HG4xaj
         6Wf4tZlVRVnLbgbZkaAlBhWXPCUjnpfDsZE619W5bDh6zFcckPdBsdaYIAzfDyM9Y5r3
         eBHA5Qu9sBlvzfkIAgk9brbvPvFq9f2amNiA/Ur87ZMzj3eHZ3OFTIIjM2aG09ppOh/K
         zv/t50OUxRxixIsOmqz15a59JaUUBvzsWrnNbbkuQWxQiqDLoK3a4QN93W0Kfo+ei3Ou
         raHziorpgyLMDAZgcU4b6ln7CdCdmMl9qaS/G2IVkGCYRRiax4IgebgJ8J4AlCYCGXNK
         hYhg==
X-Forwarded-Encrypted: i=1; AJvYcCV8PW0zWPRd9ya6Yaa98z+RHwAtBs7lDP6hMnb5CemB6QcCnccAjDAnwpPjMh37iWsHaydNndC8BZ6mHvBi3QtB@lists.infradead.org
X-Gm-Message-State: AOJu0YzxzQyMz0qzK12IFB6qxKPvmYdkrY4hfZwGOZZb18CvNGHLpchF
	LHp+IsXPzUB61woC6riTfq3qhK2Iiiu60KvvaoU1t7P1pZ4HuvW2uchrmV0fU8jqUL8sdnH4Ms9
	E9Sf6yc8SvQpglbkaLbpXIr5Kw7k=
X-Gm-Gg: ASbGncuqIQB147iAKPi7Wbzu4JE9m/vwt6de0nIt9pgcO0+4QXq1dXrYoRkYEO51HfK
	UAGaaV2aj85tUPhQc2H9HaQPzIJlat7U=
X-Google-Smtp-Source: AGHT+IFjxVVDHtb5XUqKlxwjzwTutKQUzN2zumRBPx3EfKj4t3Mn5Sq/gwwPwX7tapi/bTH5lmwV1+4Ni4olRczdgm4=
X-Received: by 2002:a17:906:b3a6:b0:aa5:1661:1949 with SMTP id
 a640c23a62f3a-aa63a21bf7emr624479066b.40.1733585016096; Sat, 07 Dec 2024
 07:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de> <CAMZ6RqJGqBqvgxzp5yPFY1pk0WkkwEMM34qU-dZ3kXfsnKaqEg@mail.gmail.com>
 <429e7c6713ecc94494d9107e5f5a1f0c8e854f23.camel@gwdg.de> <CAMZ6RqL+iS6GVsY20=O6GdQakRpp7XdewZJsUbmE5OCsKaHR6Q@mail.gmail.com>
 <b3bd6d4ef485dbb5db4c784f4e42f76adce502dc.camel@gwdg.de>
In-Reply-To: <b3bd6d4ef485dbb5db4c784f4e42f76adce502dc.camel@gwdg.de>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sun, 8 Dec 2024 00:23:24 +0900
Message-ID: <CAMZ6RqJrAVVLDAJtNTA2U=UFVUJp1samoat+yfBmSpO-dCVcaw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_072338_593613_2923A87C 
X-CRM114-Status: GOOD (  19.81  )
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

On Sun. 8 Dec. 2024 at 00:10, Martin Uecker <muecker@gwdg.de> wrote:
> Am Samstag, dem 07.12.2024 um 22:50 +0900 schrieb Vincent Mailhol:
> > On Sat. 7 Dec. 2024 =C3=A0 22:19, Martin Uecker <muecker@gwdg.de> wrote=
:
> > >
> ...
>
> >
> > I was invited to WG14 this September. For now, I am only lurking. The
> > thing I have in mind right now is to write a paper to allow the use of
> > static_assert() in expressions (i.e. make it return 0 on success).
> > That should be a relatively small change, but would bring a nice
> > quality of life improvement.
> >
> > For context, look at this:
> >
> >   https://lore.kernel.org/all/CAHk-=3DwjLSEcZ5LdW+3C+9rtjvNPHZT6zdk0POj=
67T5k2ZpDbgA@mail.gmail.com/T/#m1ba33a804b4041154b72a1d0333f90ec7204c461
>
> What one can do is put it into a structure.
>
> #define const_assert(x) \
>     (sizeof(struct { _Static_assert(x, ""); }))
>
> but yeah, also a hack to work around a limitation of the standard
> feature.

If you scroll down a couple more messages, you can see that Linus came
up with that exact same hack :-)

It is now upstreamed in:

  https://git.kernel.org/torvalds/c/d7a516c6eeae

And yes, this solves the problem for the kernel, but I would still
like to change the standard to solve it for everyone else.


Yours sincerely,
Vincent Mailhol

