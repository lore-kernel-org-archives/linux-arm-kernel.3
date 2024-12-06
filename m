Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D15E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FIX3GE2Cphszv8rtvt9crE9ghdCcm+668GDkaRhBU4=; b=iMaxvn+xvLWGRTlfeo/yOAj5Au
	KJnZX5k6PLVXuLLbOoWN1gYn27ff2GjmAEdFczXNqomRYbN/c/oDXmhCGbXbQLX3831ewSWyAOPkK
	Fl3GvLPky6cvBYIzXzCOWV42meWWq4pgaFBqLCEE0zdR1b+LreIrxK6MW/AitFw6VHk/qWVCFz8ds
	nraMZC5XR6W/h2I8C4vm1mBlBqPZAgaAqU/nNVXOydGdirpSA92ZvmLJ6IjYkAx5nhwDghCN1b0P7
	oHzde7j7A7lEGbZSWP1JbaWm+pcDluQf1l1dUSGSOMdwf9y6bv6G2IQ93dJkQdem4pbXIemQOTWYv
	qFsSL9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUHw-000000011QA-0vk0;
	Fri, 06 Dec 2024 09:06:16 +0000
Received: from out-13.smtpout.orange.fr ([193.252.22.13] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUGt-000000011Ee-0LwH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 09:05:13 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by smtp.orange.fr with ESMTPSA
	id JUGntHME3gEASJUGntdRFj; Fri, 06 Dec 2024 10:05:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733475905;
	bh=5FIX3GE2Cphszv8rtvt9crE9ghdCcm+668GDkaRhBU4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=uAppuN40DasNXXQJMdRcTI3wI90rK6g/+b/qh0VMKvnCosl3lme8pdc6ikAuraw60
	 si7nprTlY+7ruLnRUq0zdf4JjDcXekjY74wVBuYLWawdTz1KUjcPfJvbzyfKaoJBOc
	 NjSg8i7KTgz/5estW92ClwNf5nJEQYA19wtaQGkTwCt4klbTKcIjNDM1ZEDyTfAZEh
	 HkaPg8PrD/M9DUvMCyWtmN7D/A9J/scSX8Jzu8q7R0Ii9FzEz1lJ2vfqWidbsKwvq4
	 B4WFjezzLzWdK+GvYhdYPs3R1qChh/ZOkGat1RiWXcnNAcR33vdv5DVFwPSHKOeLqc
	 LH6tgbPrtff5Q==
X-ME-Helo: mail-ed1-f50.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Dec 2024 10:05:05 +0100
X-ME-IP: 209.85.208.50
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so1084657a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 01:05:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTvjsqEyRX5tOUaHgnTXl5+OEHJRMw+8N5Dnwo+4o+k368e+GAVHmXbVCWDtd1P48KXEo5QBA+H52AVvE/Xxye@lists.infradead.org
X-Gm-Message-State: AOJu0Yx02POZd4yyaE8y8ZjQcPH+NtANTghGpvG+sQT4PkQeXpDF+s4E
	A5m1O5tR9POg8VF0klUEiQorpgMt8WA+uOTGVrv2fTebDQWOY4jaFLcC5qN/S+po12nKm+wMHGU
	IdaEtlOu4r/OACQdlUnAIxs0oAfs=
X-Google-Smtp-Source: AGHT+IHtHlVyoW+nRFmP2KVhABtFl5ikoWMC68HCGMKZEPnxOyfyDUMalss4BKk3XOGNHnTjXwFKxuaBrlfCMkC7FxE=
X-Received: by 2002:a17:906:9895:b0:a9a:238a:381d with SMTP id
 a640c23a62f3a-aa63a2c64eamr136036766b.52.1733469982863; Thu, 05 Dec 2024
 23:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
In-Reply-To: <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 16:26:11 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
Message-ID: <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: uecker@tugraz.at
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Martin Uecker <muecker@gwdg.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_010511_396457_2FF66CE2 
X-CRM114-Status: GOOD (  15.09  )
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

On Fri. 6 Dec. 2024 at 15:40, Martin Uecker <muecker@gwdg.de> wrote:
> Am Freitag, dem 06.12.2024 um 02:25 +0000 schrieb David Laight:
> > From: Vincent Mailhol
> > > Sent: 05 December 2024 15:31
> > >
> > > -CC: Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
> > > +CC: Martin Uecker <muecker@gwdg.de>
> > > (seems that Martin changed his address)
>
> My current one is this: uecker@tugraz.at

Ack

(...)

> > > > > + *
> > > > > + * Glory to Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
> > > >
> > > > IIRC Martin has agreed in the past that the accreditation can
> > > > be removed - especially since it refers to the 'sizeof (void)' trick.
> > >
> > > I tried to look for such message:
> > >
> > >   https://lore.kernel.org/all/?q=f%3A%22martin+uecker%22+__is_constexpr
> > >
> > > but couldn't find it. Do you have the link?
> > >
> > > @Martin, do you agree that I remove the accreditation?

So, do you agree to have the accreditation removed in compiler.h?
Personally, I do not mind. I am also OK to remove you from the
documentation and add you to the CREDITS file if you'd like to.


Yours sincerely,
Vincent Mailhol

