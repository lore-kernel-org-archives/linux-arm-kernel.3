Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C5FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 19:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnspTgT+QlMaq72RnxBUxeYja+eFoihpXPIoDsPSZVk=; b=V4p5v5mzMWxrneT2TriX8oDrXb
	qzhp4vlRmJxPEqDyiXdxF3H48p2YbVAtLlDx8S3ZR+b9ZTlxGm75FwY1pIq5TGBk3ZMp+vP01RQcb
	8HrbBEndl0TQMTEJNk9Ufu70WX++7N5x+c7Bt9DB3r8gF4BL1LTObpPT7Q5UHesCXO1L/23yTuPPv
	9tPUHqL8YerVsNXZJsVTKW9YKOP2HU956E215uQj/+0oyWqOTp+rCcVgmehCfYYPjtG18WYZ1EfvW
	SFOAkeHQna52zIWWXzji16dc1aMmMs76pNYpAxk436Bc/cPzOorfY46DS/QdqpKRHDHIClO2TA1/5
	h46IBOZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdca-00000002VGH-2jac;
	Fri, 06 Dec 2024 19:04:12 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdbY-00000002V84-3d7Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 19:03:09 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5cece886771so4409981a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 11:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733511786; x=1734116586; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CnspTgT+QlMaq72RnxBUxeYja+eFoihpXPIoDsPSZVk=;
        b=LdHtCdMdOfbMOIzM8eplr6yOoHMpu+IxquN6dF+cUvYiTDwCYJLB4TpSEX8K/2kcZk
         kfRx/awdtskyN3qLqkTKoDdBaKXA+DTdPQhFH9CHxSs86uX9ZLv1e3ULRml305d8VM2F
         KL6x00f6fVUYPWlCUPUFsMKp8DADe+YeuCsIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733511786; x=1734116586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnspTgT+QlMaq72RnxBUxeYja+eFoihpXPIoDsPSZVk=;
        b=LAi/3LWsfmls2bmylsfD5RJUJSpgr1EGijTl9z+NQyxaP5HJLZSdT1tFNPC7vNma11
         8Vgj4De2WMt6XoKMFKbIm0oh9KDVuEZ41EupH0r5VFz7LkVLertt8+05nL7uYplKin1n
         G42TW0Kd6PCWrH0Iir2AzoN6NKCmonqZCCm2w6EraZyWDSV35E3OQgVMkGrwctfphv2n
         AYKqfBhN/lWHrButNb1cEhnzYh9H4STnzm8mUuJqAWQ6R7YDl0P+y5Ot8pIIA5OGYVTE
         KnJW9tgCV3n+mK/VyaR/s81AFnAYC1LHCLZ2oFuFvQ4D7YGQ9c6hkRjEcp/cr70hDqNH
         9jCA==
X-Forwarded-Encrypted: i=1; AJvYcCV4D5OyTwnUDNX2n4KuYwQuPqx9AreD5uqpG4AyPM4tOieZfK182D8WKHKWNPu2P7t0qX2NEUWDUPPIZ0uDVala@lists.infradead.org
X-Gm-Message-State: AOJu0YzRH2//gxHNk6C0GDwM68LAaeAUbunZo4p5M1QCD4n6dM5J5sUH
	vmOdX3EY6Q/ih3rn9XJJP0gI/2QNBj0alxkG37mDS3vOuBxI/B3efTaCzlPNyUHlW5WpL9jRQN7
	zsPhC3w==
X-Gm-Gg: ASbGncuhY2Iw7vABl7fYhFUpII7VGl8Tgw0B7rVEIQDwBtc/ZW6nwi0uxGshYKBVVac
	OOgMCtapitXowVJX+YdFzXKVpcFDJ8v77vWuTkmMFkzL7+Tf0gFQZNVURVhCXZgGtaINJP97yrZ
	DP6GE5FGa9b4SjAOcANeuSanmKRkvI8q3eBSoTXEvFA5g40rDD2+/43eTyHxWB6JNn+TuDuzrD5
	udE9tlyrR9ePvFwnWU2KQYiUuXkb5WVTlhq2c1ZK/4nASeEYxtZml00izY1XstVzULABaNwIwpp
	Fnrtm/MpQIhW6pzgvQcYvAmp
X-Google-Smtp-Source: AGHT+IGP/ocxhWVM0VjhHyyK2qw4pEdquHeax3P19qBsKacUGQRb4nTf8mPbSecMPOHrldQcSA/WKw==
X-Received: by 2002:a05:6402:430e:b0:5d0:9867:a6aa with SMTP id 4fb4d7f45d1cf-5d124d6c718mr8170103a12.6.1733511786536;
        Fri, 06 Dec 2024 11:03:06 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c798fbasm2512580a12.59.2024.12.06.11.03.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 11:03:05 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa560a65fd6so423813166b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 11:03:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhtBmn9eMvti6FIVSuyoIn+TA5sTk6GAP7SG86jFMzX9d8Zb5Fb0nAUfNqry2CwHYw7rGDsISy7Y/DLlkueSO5@lists.infradead.org
X-Received: by 2002:a17:906:9c18:b0:a9e:b5d0:4714 with SMTP id
 a640c23a62f3a-aa6375f5cd6mr310802966b.21.1733511783880; Fri, 06 Dec 2024
 11:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com> <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
In-Reply-To: <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Dec 2024 11:02:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjk_thfjRnAYRoGX7LjJ8AyiPTmBqjJEPu6JiKDLG2isg@mail.gmail.com>
Message-ID: <CAHk-=wjk_thfjRnAYRoGX7LjJ8AyiPTmBqjJEPu6JiKDLG2isg@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Vincent Mailhol <vincent.mailhol@gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_110308_902903_DE8F3435 
X-CRM114-Status: GOOD (  10.76  )
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

On Fri, 6 Dec 2024 at 10:52, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> This may be a case of "we just need to disable that incorrect compiler
> warning". Or does anybody see a workaround?

Hmm. The "== 0" thing does work, but as mentioned, that causes (more
valid, imho) warnings with pointers.

And it's not necessarily require that a pointer expression actually be
marked as a constant, as for the fact that these macros often get used
in various arbitrary contexts where things *might* be pointers, even
if "not constant" is a perfectly fine answer.

We do actually consciously use __builtin_constant_p() on pointers.
It's very convenient for format strings in particular, where
__builtin_constant_p() is a good test for a constant string, which
sometimes gets treated differently.

And in fact, dealing with NULL pointers statically might be worth it
too, so I do think it's worth keeping in mind.

               Linus

