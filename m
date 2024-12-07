Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAE9E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 12:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGQkzKFSDY9TmwP9AaO3pZHfF41YjBH8/yCe8njtTKs=; b=znjAiVDK1s23cNBIL0fIjX2qkZ
	EPaIrjhn0eYuuYfC4eIq53oJ9OYgIGa+DCt8gY+Me6e8jmcq1XYZPFxld6js+KD4HhBj4mm0JO3zb
	u/ETBtjdaYpYFBxU+Ir3fbQugFhYRQohhxuwkjgMH3z8Yu3BQbxXR/E+GSTMiI/iv+gmxyVxvcCDZ
	p0jkQO7MC7Ky+QnR6qclaET/X+797QPx0TSS1G3bMjCk51uzY3FwT+A6zrwSKxVuDh3L4alWQC4ba
	VjBta53JksLjnQ9JkiHGQ9oxhQJba9CNeZq4s/UNRDIL8dY4ZGQTCY8Z2bO2bx3+4uiXzmS4HvtBK
	jfvP5KDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJuCV-00000003wXP-2KT3;
	Sat, 07 Dec 2024 12:46:23 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJuBT-00000003wTQ-16Xa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 12:45:20 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa636f6f0efso264753566b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 04:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733575517; x=1734180317; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGQkzKFSDY9TmwP9AaO3pZHfF41YjBH8/yCe8njtTKs=;
        b=S0V4VqgzoJDCzlJ8KW6r47LTsuwmF+/AL+uzUu7UfZrHeJJPaMNpPO6V7lopyQf4mI
         p6YCxdbtnlPvoju1wS6GKpM+auG+XIq3YHL8H5Nanr25Pacj3bZoUK0hm4mNgv0oTdzI
         L77jZC/jG1Z7Hzh1JYV6PyBE+8FnIiEGPmBfgQIwLFJtwmPxD1hnAPL6qDkkSJdrzz2i
         8b6MTou1vJXVmcGENHUeGrulDDatCdbB2ah7myqAp6mm8FjEqj9T8hcjt6FFfGIBbaI4
         OiWVsu1WC06uHUGRmMZKHYOvwpM5FdUMAjk6khnLZqw+HqxuM0nT5JDJRx6lPBBioVgb
         u6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733575517; x=1734180317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGQkzKFSDY9TmwP9AaO3pZHfF41YjBH8/yCe8njtTKs=;
        b=Bf7R3kEgZ4HKOLeJfKRWFYROF8t3jHAJrzbB+DPdGj03wqpUFN3wJhe3sffgTHful2
         /pf3GzoYJklPxrvcsHqmg6ytBinDIUE31dM2apVkQeEOBDbi2350ax1IE468UMr6ixb+
         EEsAswyn24dvCkR/+u+UPF5TV1+NaJkKacQu8O7izZ/BcROrubGth6NLhYc1e96sz7kb
         LsnNqpwsDxYOLfyV/gko+4zWF/xlgYoQvdiufDlTyGVfG6TGLhVA4Mkr8WBI92LcQmzz
         o3oCaEzVoGHOGvR6jgnlQcN076zh2WEKOmxk4Ijg21c9wt/iEPYJuIgthDidVwqjF7xv
         wtyw==
X-Forwarded-Encrypted: i=1; AJvYcCU/sOjhgmDA64ZMYKB64D39H04D03vKS6fWBLl0vWnplplz6yBAXDjRIyByK4lUy22WiicZu9X8Dz5gTwg9JNgc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz2OsmP1lx9ZQvaomdapcf06FFsDkgphqhC+jYDQWV8isfQgD5
	+RhXh2nSFCDw1EU6DYxZYJWozUu0+kxlAP3LxyubwISk/JZVoqxrGKjm4NttuDUIEtEtfgCLskf
	KSvZOP2O9lYNt82k+4m78EiuaAow=
X-Gm-Gg: ASbGncs6hUPzRs0eVsw3H3CKcsjH0xO6CtQTtfQcn15YqJoDf+ZF8Y/8ZE42l/J0G7L
	nMR5qYLH8JivWhEf1xZPB5mZE+TPWsQc=
X-Google-Smtp-Source: AGHT+IFKLT/0vBLq8e4+Q9cBsFCmjYKYarCQPpvMXUHvXes9qzmJwCAEBQoHpEZanqb6oPfHlcskXKrazzFRS2f9zhw=
X-Received: by 2002:a17:907:9516:b0:aa6:1ee0:c111 with SMTP id
 a640c23a62f3a-aa63a33cbf7mr437084566b.42.1733575517044; Sat, 07 Dec 2024
 04:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com> <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
In-Reply-To: <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 21:45:05 +0900
Message-ID: <CAMZ6RqJGqBqvgxzp5yPFY1pk0WkkwEMM34qU-dZ3kXfsnKaqEg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241207_044519_388440_64E2D602 
X-CRM114-Status: GOOD (  23.00  )
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

On Sat. 7 Dec. 2024 at 17:39, Martin Uecker <muecker@gwdg.de> wrote:
> Am Freitag, dem 06.12.2024 um 16:26 +0900 schrieb Vincent Mailhol:
> > > On Fri. 6 Dec. 2024 at 15:40, Martin Uecker <muecker@gwdg.de> wrote:
> > > > > Am Freitag, dem 06.12.2024 um 02:25 +0000 schrieb David Laight:
> > > > > > > From: Vincent Mailhol
> > > > > > > > > Sent: 05 December 2024 15:31

(...)

> > > > > > > > > @Martin, do you agree that I remove the accreditation?
> > >
> > > So, do you agree to have the accreditation removed in compiler.h?
> > > Personally, I do not mind. I am also OK to remove you from the
> > > documentation and add you to the CREDITS file if you'd like to.
>
> Sorry, I somehow didn't read this part. Please do whatever you think is
> most appropriate (but please update my email to the new above if it
> still appears anywhere).

OK. Then I will remove the accreditation from the  compiler.h
documentation and instead add an entry in the CREDITS file in a
separate patch. I think this is the most appropriate way.

> I find it amazing how much time the Linux kernel community spends
> revising code to make it work perfectly.
>
> Still, I am wondering whether some of this time and effort should not
> be targeted at C compilers and language work to make these macro
> hacks unnecessary?

It seems to me that the long term solution to this problem are the
constexpr functions.

But the core issue is that before getting this support in Linux, we
have to wait for this to be added to the C2Y draft, then implemented
in the compilers (probably just reusing the C++ constexpr functions)
and finally wait maybe one more decade for the C2Y support to reach
the kernel. For reference the kernel supports C11 only from 2022=E2=80=A6 S=
o
maybe we will see those in the kernel around 2037? Meanwhile, we have
to deal with those hacks.


Yours sincerely,
Vincent Mailhol

