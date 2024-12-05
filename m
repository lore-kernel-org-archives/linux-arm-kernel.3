Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A413E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Sob8jML2a9sfY47l90QZhBAyozcID3U7Li8+UA7roI=; b=Mnchefw5qURjW9g3NWWNckdhRw
	pvyMdJG7AoHcMDFJVIF19nwQs5yNm1srzsxpDW2FHx3LhXRmIamMUNzqngw9SKNy0DnNQfnWIuBJL
	3Xmc6zo0wBXEaYfSY30DiUNC0e+/5lX8UKsWGKNzxJWc5359zsjRv+4wmqTXcs85ATYjysSoxFxvV
	9hAp1jUb/XdnTp3KQ293z21Dhx8389w7AZ0aoD1nCpID25CsPXlTvAwUMV7ix9mHFq7Ohk1FV7R6C
	q5SAEj9Mv3iBNsn5JHMg/wMs4xM4zjxLWg4iKZ0EZsQV8PIoYQHYD9eupcAWao11SGRrhCuAA2vsp
	AlkTjFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJfaL-00000002kJ0-1B0m;
	Fri, 06 Dec 2024 21:10:01 +0000
Received: from out-17.smtpout.orange.fr ([193.252.22.17] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJfZI-00000002kG3-2i9f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 21:08:58 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by smtp.orange.fr with ESMTPSA
	id JfZDtuCoZhfQMJfZDtqfgA; Fri, 06 Dec 2024 22:08:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733519331;
	bh=5Sob8jML2a9sfY47l90QZhBAyozcID3U7Li8+UA7roI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=NznUb2HPlkYwDxss/RE21LgqU82JUG6A4+vqKLH9kwhaP6rZZwo2qk8TW1P3sely+
	 FZe2qctUaf1QuyINgTXJmjvV3BvZPxYhuz5LZlhtHw1lr/c6nnRF8uZD9+kGjILlkk
	 zxYAVBA1SrhBTTn615EPQYyt7c6gnGwikBTO2O45/6oTJPlLKRH4jwXuAQmDOIleFo
	 kupFau3/7KZ1vrzP4XKKtWCcf7Ia9TT7aMcpOMGrHM3TDUzDaaSZ75ukJFzK1iadD0
	 b6kE4iroW8cQpIj+o5d9myAR9KO/Y+YHiuxYbrIv1Au9gfV0RYMnHXv76/9oqTahDW
	 4rGaLbT0cHvQA==
X-ME-Helo: mail-wr1-f49.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Dec 2024 22:08:51 +0100
X-ME-IP: 209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862a921123so893675f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 13:08:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUu0/mChFcBujZn2JgUHV2LYUiVuZaxXVqfc2gOe/Lr8W8OAI81UR3PAnyaet/q8+S6ecuDF+bGB5YWrWJAoPyI@lists.infradead.org
X-Gm-Message-State: AOJu0YzaIYp2etKYUFxFq5cyQYHZzumlJAT8E6jrD9cBUcwohn8hxzez
	rP8NF2KL/kv3vcZy4qnwPMrNS9YHS+WByhNivnNfgjSL6G5QlU2IghIcHoZaWCRy8TSUAFTT2Z6
	ZhCT6XwiR+bXYGQw87ThLIFpy+cw=
X-Google-Smtp-Source: AGHT+IFTPODU6RGdJMXff+75tOD6Nj3x2Mn/gdl5NWtqQnJzhnFZgI0m0ZroaJ8Q+jvxJuILOkW0ziN/Pe9Qt29xALE=
X-Received: by 2002:a05:6512:32c8:b0:53e:28dd:a9d1 with SMTP id
 2adb3069b0e04-53e28ddb7bcmr693951e87.24.1733412111008; Thu, 05 Dec 2024
 07:21:51 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr> <FBEB24FF-5885-4938-8D1C-9B7BA9071FB9@kernel.org>
In-Reply-To: <FBEB24FF-5885-4938-8D1C-9B7BA9071FB9@kernel.org>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:21:35 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqLSiTfTNQrcje06MbSxvM2k16MgqG1YTCufe6j9FhupEw@mail.gmail.com>
Message-ID: <CAMZ6RqLSiTfTNQrcje06MbSxvM2k16MgqG1YTCufe6j9FhupEw@mail.gmail.com>
Subject: Re: [PATCH 00/10] compiler.h: refactor __is_constexpr() into is_const{,_true,_false}()
To: Kees Cook <kees@kernel.org>
Cc: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <David.Laight@aculab.com>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	Martin Uecker <Martin.Uecker@med.uni-goettingen.de>, linux-sparse@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_130856_949577_787F5F0E 
X-CRM114-Status: GOOD (  20.59  )
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

On Thu. 5 Dec. 2024 at 08:58, Kees Cook <kees@kernel.org> wrote:
> On December 3, 2024 3:33:22 AM GMT+10:00, Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org> wrote:
> >This series is the spiritual successor of [1] which introduced
> >const_true(). In [1], following a comment from David Laight, Linus
> >came with a suggestion to simplify __is_constexpr() and its derived
> >macros using a _Generic() selection. Because of the total change of
> >scope, I am starting a new series.
> >
> >The goal is to introduce a set of three macros:
> >
> >  - is_const(): a one to one replacement of __is_constexpr() in term
> >    of features but written in a less hacky way thanks to _Generic().
> >
> >  - is_const_true(): tells whether or not the argument is a true
> >    integer constant expression.
> >
> >  - is_const_false(): tells whether or not the argument is a false
> >    integer constant expression.
>
> But why make this change? Is something broken? Does it make builds faster?
>
> > 7 files changed, 97 insertions(+), 84 deletions(-)
>
> It makes the code larger too. I don't see what the benefit is, and given how much time has been spent making sure the existing stuff works correctly, I feel like we should have a clear benefit to replacing it all.

It makes the "code" larger because patch 3 ("compiler.h: add
is_const_true() and is_const_false()") adds two new macros with 20
lines of comments to explain the pros and cons. So the added "code" is
only comments. If you ignore the comments, you can see that I am
actually removing a few lines of code.

As for the clear benefit, sorry, but I have nothing more to offer
other than code simplification. The reason why a lot of time was spent
to make __is_constexpr() work correctly is just a testimony of how
complex the thing is. That alone can be a reason to simplify it, now
that new tools (_Generic()) are available.

Of course, modifying __is_constexpr() is not strictly needed to
introduce the new is_const_expr(). My previous series:

  https://lore.kernel.org/all/20241113172939.747686-4-mailhol.vincent@wanadoo.fr/

 did it that way. But I was rightfully pointed out for my macro being
ugly. Maybe I can suggest that you give a look to the above thread and
tell me if you still disagree with David and Linus's comments after
reading it?


Yours sincerely,
Vincent Mailhol

