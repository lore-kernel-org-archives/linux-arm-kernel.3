Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB601E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 19:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FRoHoQWpZzbjWYvjotIUGh9Pf5+Jx2FZlKpO4hH6NM=; b=1s97HrrxcjTUMgFpcVtvB5fVvK
	/ZijM9C0bWdt48U8yIHp6ujdA7JutMsTpEkg3FgL68Pf82vrckkSYZnSfEOQlG9//mHZglBmugOdD
	uy7DGQ10F9tVLGZ578Xp5RFCANOwui11MYmx1ZrA/HivlgzIUPyO7trdYgYTSxLYjI15Epwy1hAtV
	Vqdw4vQJvmd/4SX+cVU8LT65dtDkKSTK7DBfRlMlQlyg0vobVkSVDy4gSv2uIrqcMFVwDPTfMWCgo
	5/lFEfd7gnUkaQsTvYR2nT9t3JxSrjVjL8Xte5d4F7aHLrphUUVt+TejnEcKozhgdEvzwtKV/oIjr
	d32aJ90A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHei-0000000HDgN-2ePu;
	Thu, 05 Dec 2024 19:36:56 +0000
Received: from out-14.smtpout.orange.fr ([193.252.22.14] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHdE-0000000HDMV-46Y2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 19:35:26 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
	by smtp.orange.fr with ESMTPSA
	id JHdBtTGq6zLhcJHdCtzdGP; Thu, 05 Dec 2024 20:35:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733427322;
	bh=1FRoHoQWpZzbjWYvjotIUGh9Pf5+Jx2FZlKpO4hH6NM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=hgY4IWBLVXTxJ1NJ99f4Zc4KjrymtaQRRIsvNFk07dAxGe0PFcSM7kw/ga9Uceuhx
	 0YT6ZVRNzY34+PD1XV2lmkdj6szbmgXGZoqVJ3SgUXQ1CK1mlgcghAXXlzcGIZ5C1s
	 dZ1037ZfqZgi67BYIPxWJ8A2lYPa5zaZb/y3hiMSIvSWfutX3KYYqIhwuQCf6+PZvz
	 d8YOno0q7huxHxJ9D7Zhsmv8qI3Lxhu7c5WNGHAtZWu48d99BHsGoPEY9PCMovcCqK
	 IEwXbmu/G86c8ckJhj4Bw4z33Xos5gSY0La4M/99plLYDxXqVlEeXe9+Eppen9MbVp
	 82pUVd5fVocQQ==
X-ME-Helo: mail-lj1-f179.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Dec 2024 20:35:22 +0100
X-ME-IP: 209.85.208.179
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ffa8df8850so14373781fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 11:35:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkmAeTc+byvq/VDkA7K6xM9Teu23h+yWggSnTLl9iETHVQg8mIJTC2h100CibAWAYKkFtRuMhw9wopdHEuYGJp@lists.infradead.org
X-Gm-Message-State: AOJu0YwuLFVsPuvrupB+k6IPp/zLmfH/PsUGz9XZk9MQH727+vyMGFh+
	e8QjDsMIxHuieChvrGkamUA6wJ1SXHRDvJnHTfwbyyrf9W5UCYUVDIdbgLSWY23WTrXjNf0NmNS
	pTDl4rbbQUZTJR+zjBYRTCkWNLrg=
X-Google-Smtp-Source: AGHT+IFYWIvr/wb1ttWAqU3XdgmdbVRXgljv2wGXYHxZGru+z8zfXAuY4J7uLgYbwqJhFyewdEilCwKv6EaVf4E+2bE=
X-Received: by 2002:a17:907:270f:b0:a9e:b5d0:e5c with SMTP id
 a640c23a62f3a-aa5f7f6f2f8mr768523566b.61.1733414207483; Thu, 05 Dec 2024
 07:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-8-4e4cbaecc216@wanadoo.fr> <6597979088eb4ee7b98cfb99815a402e@AcuMS.aculab.com>
In-Reply-To: <6597979088eb4ee7b98cfb99815a402e@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:56:35 +0900
X-Gmail-Original-Message-ID: <CAMZ6Rq+XhOb+yn5A1dHD=qkbB1_FQXMA7_ydBB4nPTSnys3jkA@mail.gmail.com>
Message-ID: <CAMZ6Rq+XhOb+yn5A1dHD=qkbB1_FQXMA7_ydBB4nPTSnys3jkA@mail.gmail.com>
Subject: Re: [PATCH 08/10] drm/i915/reg: replace __is_const_expr() by
 is_const_true() or is_const()
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
X-CRM114-CacheID: sfid-20241205_113525_150490_E2F21318 
X-CRM114-Status: GOOD (  15.21  )
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

On Thu. 5 Dec 2024 at 04:00, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:34
> >
> > Most of the use of __is_const_expr() in i915_reg_defs.h are just to
> > test whether an expression is known to be true. Because those checks
> > are all done in a BUILD_BUG_ON_ZERO(), replace those with
> > is_const_true().
>
> Another place that could use statically_true() and BUILD_BUG_ON_MSG().

Here also, BUILD_BUG_ON_MSG() is not suitable because it does not
return a value.

__BUILD_BUG_ON_ZERO_MSG() could be used; but there is less benefit to
do this at a driver scope. In this i915_reg_defs.h,
BUILD_BUG_ON_ZERO() is used 20 times. Adding an error message each
time will just make things ugly.

If we want more readable error messages here, the solution for me is
just to redefine BUILD_BUG_ON_ZERO() to print a more meaningful error
message by default. But this is not the scope of this series. I sent a
separate patch for this:

  https://lore.kernel.org/all/20241205151316.1480255-2-mailhol.vincent@wanadoo.fr/

Concerning statically_true() instead of is_const_true(), let me test,
and if this works, then I will replace these in v2.


Yours sincerely,
Vincent Mailhol

