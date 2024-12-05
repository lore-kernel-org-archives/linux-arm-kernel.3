Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC4CE7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 10:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fohnIjaGXi4erexWkQR0Ki8fkQHzJ2JQlgx+0ILcUhI=; b=X37BeB94x21UBom+Cf/iT3OM+B
	ZeA6I+hNMznlPuefRbu+gwF5QwVj50u/B7K/2SrvS0N20QvetsMjFOnMosfB2lDecSry2/BDurM23
	e62x5kSsek0rFrtAvXydoGIVwzJbLBt2HRCOb2KwcTX5P1DRPspOYzvcCKwP7N9r+khV21bgoPtph
	8fPIy8We0eOms3j6NsbxrC6nU8xaR3+dR/N2NZWOUOlR0j4c6vjrvT7dHrg1d2wql3GMBeJcg7fe8
	7flaFXJQ4taaloZyhvJOSrBlbmtB5nmLqNjwsx6sjdo/Ho+m4LrjsSOUqgKFF7ANxoZpnR5XhcWXq
	cl2khh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJrwJ-00000003oyQ-2pPo;
	Sat, 07 Dec 2024 10:21:31 +0000
Received: from out-13.smtpout.orange.fr ([193.252.22.13] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJrvH-00000003ouq-0pr9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 10:20:29 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by smtp.orange.fr with ESMTPSA
	id JrvDtsrgU3iIjJrvDtEB2k; Sat, 07 Dec 2024 11:20:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733566823;
	bh=fohnIjaGXi4erexWkQR0Ki8fkQHzJ2JQlgx+0ILcUhI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=mkdSsSePf0mVZ8bt49+haf9DUrQa3MF9jLXwqTNfTdWIU6K7oJ8n7hZYTKc3NTrOp
	 66NhIvHf3eJUN2krVUTYXgcBJUU19yYI8wyPEsm0aR+KqdYAafcSgL9sgTPPqBQdJI
	 AqYgHHp+uhYqmNqiGegbp87/Uh5c3UQVag8EzTYmMS2seyGlrv2zHvFwh4GkVXeRzX
	 ErcMHkpUBy8oPGi2VWx7JAOFIZEUDK57rO+H3dbrpNWMRfH/dsgSdrWOt29a3A3Zbu
	 4s4Uw60xEpSiE/+IZ92yMyGSA6UL2zDRA3h0rguO3PQdkBVt4j5+uR9dlKPI1pwmsE
	 ITdYPiExuwFrg==
X-ME-Helo: mail-ed1-f41.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Dec 2024 11:20:23 +0100
X-ME-IP: 209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso3351147a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 02:20:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjUwXVE+XaYJgKym4xhDFmekrRjYf5NM+peWx16JdQ3+e2APYtc88OwCt23vvhJVsh1DtH2v421ACLCb+/655i@lists.infradead.org
X-Gm-Message-State: AOJu0YyoPOKnyO9tcygGKtZgDFbx/baGTvRP/I53rgtkDw9pm47MTdsz
	pX26LX1BjiahZohZVT5Fd/0XKXFB4phHt5CerSqiCPw/7e+cnDlCNyMJu/9h3b+I2jivxzrzNiT
	5cJNwtz0/CS1TBIq5Fw7FnpS/Y2c=
X-Google-Smtp-Source: AGHT+IF7fNOJRtWBE8J5EkTB8RHD/J+PNwJHWESTQDWwz7k7Xwis6ssZjGPrSAnluvbW+xerUjreaR05tr055MdLvCI=
X-Received: by 2002:a05:6000:1a88:b0:385:df73:2f42 with SMTP id
 ffacd0b85a97d-385fd3f2e65mr9440939f8f.32.1733412345020; Thu, 05 Dec 2024
 07:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-1-4e4cbaecc216@wanadoo.fr> <e115a4245e5342a994a7e596cc6357fa@AcuMS.aculab.com>
In-Reply-To: <e115a4245e5342a994a7e596cc6357fa@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:25:34 +0900
X-Gmail-Original-Message-ID: <CAMZ6Rq+n0vG9zObF-kY-Xo+iP_Y3P8A6_nEfB8F=UhqeQBepRw@mail.gmail.com>
Message-ID: <CAMZ6Rq+n0vG9zObF-kY-Xo+iP_Y3P8A6_nEfB8F=UhqeQBepRw@mail.gmail.com>
Subject: Re: [PATCH 01/10] compiler.h: add statically_false()
To: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
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
	Martin Uecker <Martin.Uecker@med.uni-goettingen.de>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_022027_883082_FE507FC0 
X-CRM114-Status: GOOD (  16.03  )
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

On Thu. 5 Dec 2024 at 03:30, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >
> > For completion, add statically_false() which is the equivalent of
> > statically_true() except that it will return true only if the input is
> > known to be false at compile time.
>
> This is pretty much pointless.
> It is just as easy to invert the condition at the call site.

To start with, I will argue that:

  statically_false(foo)

is more pretty than

  statically_true(!(foo))

In addition, the simple negation !(foo) only works if foo is a
boolean. If it is an integer, you would get the -Wint-in-bool-context
warning. Thus you would have to write:

  statically_true((foo) == 0)

Anyone using this in a global header basically does not know what type
of argument they are getting. So, the (foo) == 0 trick is a must. But
because it is ugly, better to encapsulate it once for all. The
statically_false() is just cleaner and less error prone.

That said, I am not strongly opposed to removing statically_false(),
but in that case, I would also remove is_const_false(). For me, these
come as a pair, either we have both or we have none. Only having one
of these looked unbalanced.


Yours sincerely,
Vincent Mailhol

