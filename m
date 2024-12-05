Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C50E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 18:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDV0uoUPSeCM4ycVbpiYzkI+GBIJXljO1W7VncV40gg=; b=XAlImGGOYvqU82dcKFV7n+ZhnT
	BjDV4+M57V8cmNwmRMK7G0m1PoQmECGfPv2Tigl9jxj5eKurv/VY/C2XgrqHqJCNO3cjiq/eaVTco
	xdQ/TLAzYWezTl/MiMI3Kn/AE9pYqhUMPeMplIajBMzB6jnBE7UKbfGYZoYgb5gmXehq5sKN6Y1x4
	wkvZINTU4tYEyCqN+nWOqZi7L6mbruh2xic1SgMW64NhKPkG9ALgKPbGzOCqBqOOZNWfdOauzMRLr
	RwGe8tLuFMC/imlwLgrExygukR3JvpuGE38hBHDiMuwgwLe93ampV+HUavWsfPTA0UbWayIR1yBti
	L0ztQDYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJd5C-00000002Rxw-3r8g;
	Fri, 06 Dec 2024 18:29:42 +0000
Received: from out-12.smtpout.orange.fr ([193.252.22.12] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJd47-00000002Rmu-2OSK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 18:28:37 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
	by smtp.orange.fr with ESMTPSA
	id Jd41tCf2T32OGJd42tXH2w; Fri, 06 Dec 2024 19:28:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733509710;
	bh=EDV0uoUPSeCM4ycVbpiYzkI+GBIJXljO1W7VncV40gg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=CzKFRYytz9CyM8YhrKzo0rHkqef9VNh8PtLzwUM+aXrVLQ1Pu4renlkxjGcbMocCc
	 6Kg2mW403f40h57v+BmFSQSzYU0wM+FSEYr7xps6HHabh508+IHtFmvAgWb32pVCGA
	 Ta+2QASAdYG5cktrz1TzOMiJ6aFxOh1zP9Wpt9cKzxddzLtIej0ai37YDDvI8lNe3c
	 SZLghdOLQy4xcvNMN2wWax1AuMzIbsuLmnm0C8lZ77FszF3ATbvYbPT1Gb3F6ed6Z4
	 8B5fqyZooK7sBMtZnrWPrCTdgyQpXC6qyPojOgUp1jo+RdE0jilNJet+a0chY88oJN
	 GBQwMXSasUf5Q==
X-ME-Helo: mail-ed1-f48.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Dec 2024 19:28:30 +0100
X-ME-IP: 209.85.208.48
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5cece886771so4355173a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 10:28:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvLjuxRJFDYl9pmLFVKFCR1W36MhJe2cvrmbgZMcRwZlXzQ+OhUV7uWcxhL73qNjN7cgODeMcD2Zjp44WnDPNU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0NhoLCeK/Xro1qXpRm1yeN/Os0Frl2q7TnS7ciJ8iMXrTMdE/
	EVp7RlXcLNKIVMPJqm3FYdWl/SvjqoWC3TOjnzDgYupxQqgywZXiEgZk3eP2FHDrNpcBaMx8xba
	DnHhh7Kr6YCElqOHdDAunky3PN4E=
X-Google-Smtp-Source: AGHT+IEENKH5q363NsvaDS9r/FGBH4NT8jK2UDZzhmMDEw1YQ0vbbHzKVnWBLQ5cMhIKh2zINR9br+tBOM6tHUnfBmY=
X-Received: by 2002:a17:907:7759:b0:a99:5f45:cb69 with SMTP id
 a640c23a62f3a-aa6202f3295mr391454866b.4.1733413951191; Thu, 05 Dec 2024
 07:52:31 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-5-4e4cbaecc216@wanadoo.fr> <8b8262389bd6484586007d749132346f@AcuMS.aculab.com>
In-Reply-To: <8b8262389bd6484586007d749132346f@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:52:20 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
Message-ID: <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
Subject: Re: [PATCH 05/10] minmax: simplify __clamp_once() by using is_const_false()
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
X-CRM114-CacheID: sfid-20241206_102835_742711_BABAB32C 
X-CRM114-Status: GOOD (  11.56  )
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

On Thu. 5 Dec. 2024 at 03:54, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> > In __clamp_once(),
> >
> >   __builtin_choose_expr(__is_constexpr((lo) > (hi)), (lo) <= (hi), true)
> >
> > is equivalent to:
> >
> >   !is_const_false((lo) <= (hi))
> >
> > Apply is_const_false() to simplify __clamp_once().
>
> There is already a patch 'for next' that changes it use BUILD_BUG_ON_MSG()
> and statically_true().

Found it!

  https://lore.kernel.org/all/34d53778977747f19cce2abb287bb3e6@AcuMS.aculab.com/

I think the easiest would be for me to cherry pick this patch. So that
regardless which series is merged first, no conflict will occur, the
patch will just be skipped the second time it is encountered.

Does this work for you?


Yours sincerely,
Vincent Mailhol

