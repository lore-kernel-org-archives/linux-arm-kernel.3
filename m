Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC00E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 21:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8D8qHkNTgsq/hueRr7hAF5ECQldq13KAVXg/Zr3BLA=; b=TLbgMu0vdO2s1qqVCse21WpdRj
	GC5+FCDA+8tQgRgNfubcWqEL9Pin3FvzmRatA8aieysSOIa1uD3YSpUMIYa+H6T8kqXe6xQxP3rWs
	9SUdMgL79j04LzbZJI7kX8XJiHVtCRhBYWMKpwgCxPn4+RYx3mnia8SpTPT50kyAtJMsTRB2xy6Qe
	IYqoevU3hImy91oINSbNfQlHof7ViwK1eqMU6IhJPYzx+OtegLiX8qx2YG/fMVM9JmG1yNv4bWHjb
	aBCdqDANRjZfxBLPtHHmyuOS6szkSYvPAD4ZZm03t5lMAjGJGC76J/D3AWkBARcoYG9okVc9+IPgB
	rTrlDWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJfB-0000000HQT2-2Tfu;
	Thu, 05 Dec 2024 21:45:33 +0000
Received: from out-14.smtpout.orange.fr ([193.252.22.14] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJe9-0000000HQMO-0TAQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 21:44:30 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by smtp.orange.fr with ESMTPSA
	id JJe6tEE5wrVFvJJe6tkI5X; Thu, 05 Dec 2024 22:44:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733435067;
	bh=y8D8qHkNTgsq/hueRr7hAF5ECQldq13KAVXg/Zr3BLA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=HvKOR7/690zpeIxdS9AP5KhlOQ2aWz8HmiYYhWVY+9x4vlBNaNse2fSC8lZQewNKJ
	 yC+zrS+DJyYxJIWxgN3huugy4VaFa5p/46LI/EyZHz2DnN3UD2UwjDaSAleL3zQpdJ
	 iMvh32NUrxxOgn4lO+upJICffRmuE6ppdK3zj1RWJ1UjFLZ3n/QX0de9UnXxMeoPlH
	 N7DtOIsNrswe1LlJ+j3EG6yTDN8s90lzNbqlIaSkb9klfIMs6SgN7mrr3UfLKQzVSB
	 AIswNf4k9A8/KtGNT9fCLEgT0NU86Z/wPSZAl/3rsrNUUR+6sysLnuNy9KBohJKZxB
	 jvLdCz7jbxc5A==
X-ME-Helo: mail-ed1-f46.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Dec 2024 22:44:27 +0100
X-ME-IP: 209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8e52so2250244a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 13:44:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoqtF/YPxeTJ+a5EdQxgqXmAYyZB5PIMVcT2b7EqvlbWtp5yUPxgjILFI7In33WNFpATADSopO9bqWxXSrRk/k@lists.infradead.org
X-Gm-Message-State: AOJu0YyWnstoAMw+HrQacw3HDKdzmGhcFt2D1J5Qf0coQjKdO+O/Y9OE
	r/AlY9SwvAiY7Nz2ye/ZWyHQcFAu18AkRVYqJ9vDvCKRMEygCCccrbf+EzMSKuK50/zEZBAuICE
	2ExkR1nPC8md6o0sXHgi0psoCoUY=
X-Google-Smtp-Source: AGHT+IFZAC0AEpJ1/mPjmzfGhg/DetDbHXis2ssNehZ0yWdtCmcXanGc2R7Dja3wTy2rdkW6SAY6SvJBqtErDk3coGc=
X-Received: by 2002:a17:906:3295:b0:aa5:28af:f0e with SMTP id
 a640c23a62f3a-aa5f7d4edd1mr1018856966b.15.1733413793948; Thu, 05 Dec 2024
 07:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-4-4e4cbaecc216@wanadoo.fr> <dff4cdd543104e3792e4856375f310c1@AcuMS.aculab.com>
In-Reply-To: <dff4cdd543104e3792e4856375f310c1@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:49:43 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqLsiOF=5FZ=U2MtZ01iBYKZHtfZ5Zi4t3m=L5Oc4EPHGg@mail.gmail.com>
Message-ID: <CAMZ6RqLsiOF=5FZ=U2MtZ01iBYKZHtfZ5Zi4t3m=L5Oc4EPHGg@mail.gmail.com>
Subject: Re: [PATCH 04/10] linux/bits.h: simplify GENMASK_INPUT_CHECK() by
 using is_const_true()
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
X-CRM114-CacheID: sfid-20241205_134429_360084_EED70EA4 
X-CRM114-Status: GOOD (  11.24  )
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

On Thu. 5 Dec 2024 at 03:52, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> >   __builtin_choose_expr(__is_constexpr((l) > (h)), (l) > (h), 0)
> >
> > is equivalent to:
> >
> >   is_const_true((l) > (h))
>
> Change it to BUILD_BUG_ON_MSG(statically_true((l) < (h)), "error message")
>
> and then fix all the fallout :-)

BUILD_BUG_ON_MSG() is not suitable for GENMASK_INPUT_CHECK. We need
one of the variants that returns zero here.

But I agree that it is good to have a more meaningful error message
here. I will use __BUILD_BUG_ON_ZERO_MSG() in v2.


Yours sincerely,
Vincent Mailhol

