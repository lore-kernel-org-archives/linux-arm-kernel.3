Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83609E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 18:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/vNc5nALUWVUmfD8b/aC22BtPTbXjUkByw6MJHP530=; b=h9tBcWb7TXavNgI64rRZOBeodn
	28FfO7nvhlr+2aoR9zMDJGNCmt6BUgjsK5MvybVuIenbb6ibTQxVfdmR5P14+alLXgxq2Ti+3UxAC
	fjkjwYMbnbZk1AcD6sOJBrnow0UJLtP0U/T5ojoEpFESmDnSIkTqUfH2Jrxkh31WCuJauY0JMl9oo
	M9zD/mPZR/fSuYMdXBZJNIp8S0xU4XiobVauzVFNV1+KCjVMj4siFOsMej9jxfXfNl1ReiNPBPO/m
	nAbkHEzHV27KtEHijknKfxPymzo7On8ss5ju6j0vZhyGeLOAIEhR6mwqIrUd6spKdufSgIs++W2w7
	61bKL2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJzWY-00000004GQy-00kj;
	Sat, 07 Dec 2024 18:27:26 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJzVV-00000004GME-2rNl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 18:26:22 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa560a65fd6so561935566b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 10:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733595979; x=1734200779; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V/vNc5nALUWVUmfD8b/aC22BtPTbXjUkByw6MJHP530=;
        b=PsBoOBojTLiVRW89MAN7l/GBAdJCxJbhV0dSu6o0CGB2Na9Nn4D1awJZ2OqwJ7bpUx
         CWnzTPQguCL0MIGpJ0KgKcayHW64Z7JxCtUHVRNWPVpf/fP8coyuJtDszht6cq5t6Q3l
         qPVvI7rNgrH+d3gDtQs5nIYi8kGXe2RnUK2ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733595979; x=1734200779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/vNc5nALUWVUmfD8b/aC22BtPTbXjUkByw6MJHP530=;
        b=VUhN19tLJtw53n9waOejhBGo/lLeBesHQzF7ch+tHoqW2C4YpMcSlH7APNTTMzSMHu
         oJnkEvgRHkwXO6EsFjs2GspPpV1qOinkz7MHqiywnt2HzXNyJ2NyrwReB0ARD9XFbt/a
         mFzfHtGrj2LtQ0w3Z1jubEDU+KlHfuE0mK4Kmo+h2Ux2itdbUMrFYT2MfnN6uPnz7hU0
         QPf8YqmhIHO/rtcgrvTcBaw5WUWYYzqkGqLJLjbhNmEAYQTz+XBgNdsXzEla2qCfwvDR
         0z1ZvfmGVCQ1+Bu3giP7gUtILh0j7QYmnkfr9u9+M7b13TXquuZHaGD+Ys0rHZS160Ja
         U+yg==
X-Forwarded-Encrypted: i=1; AJvYcCXyjDA7tcxX2iMIE/ucw0bI+XeGEgVHv+bLSYv9dx8WtVeRNLevrCM4alnsWcECM14iYFjnO8nDBKH1BEzTaU83@lists.infradead.org
X-Gm-Message-State: AOJu0Yy72yj/JqNC3MceWXbnAk3Pg+NMOHzI/yDSB4+4xFVPeA32sn+/
	GnNYdYcxUbG/vH5ovjOFCRCxgMrt+i2UiHd66X7W+Rcdm4ajAix3GL/DQ7XIQsB+bXDYeaD3sLJ
	6YVdxtw==
X-Gm-Gg: ASbGncuLvklZr3+G1dm1iI4iKC7HV5T/em6/obxR7XnHwDX2L2rcrYvDDxFFp5yjN/R
	BUqKL50NKvqZT4OSylJiKxWR3bgEYqzsKESFDK5bNBCFLVgI+hWX+zFwctgmlgBSjQ32VwcHJjV
	BvaaBJS1ogHCwIrwH4voRkUEQ0YIfcFs4wmeGRv6Vfi+OLHMZno17zcVUhvku42ddvM5GP1c8V2
	5T/3kvEeCXqnToQ8yTeTLF1qMw/7ObLpmKxO9AUqsaDfyimGRUMR6y3eD3D5RWhG6DQhe5ubOM/
	xqxZQWEVR9l8Dzjpw9BzQFL+
X-Google-Smtp-Source: AGHT+IHRS3Wjxn29H+QXdNShIsCbYV/ogM0XFwIxLqTIH36MZ8yRGYPUkSjDUHN5KmQtmNh9BI3pzw==
X-Received: by 2002:a17:907:7e8d:b0:a9a:662f:ff4a with SMTP id a640c23a62f3a-aa61ff1fbf7mr1256942666b.0.1733595979566;
        Sat, 07 Dec 2024 10:26:19 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625ea28c4sm413557866b.79.2024.12.07.10.26.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 10:26:18 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so690987a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 10:26:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrNN8kntafbu9xjzKP+VTfc+TQZdK1Rk6q68wreYpZUoMjmz2a7Xh4NYmZ8j05Dd9Y8XEQC5wOeQw6VXbtGX/s@lists.infradead.org
X-Received: by 2002:a17:906:32c2:b0:a9e:85f8:2a3a with SMTP id
 a640c23a62f3a-aa6373494a2mr765427966b.2.1733595978237; Sat, 07 Dec 2024
 10:26:18 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de> <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
In-Reply-To: <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 10:26:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
Message-ID: <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_102621_731331_287B9061 
X-CRM114-Status: GOOD (  12.51  )
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

On Sat, 7 Dec 2024 at 05:07, Martin Uecker <muecker@gwdg.de> wrote:
>
> VLA use *less* stack than a fixed size arrays with fixed bound.

Not really. You end up with tons of problems, not the least of which
is how to actually analyze the stack size. It also gets *very* nasty
to have code that declares the VLA size using an argument that is then
checked afterwards - and if you have a strong preference for
"declarations before code", you end up with *horrific* issues.

And even if you are super-careful, and you solved the analysis
problem, in practice VLAs will cause huge stack issues simply due to
code generation issues.  The compiler will end up doing extra
alignment and extra frame handling and saving, to the point where any
advantages the VLA would bring is completely dwarfed by all the
disadvantages.

We went through this. We are so *much* better off without VLAs that
it's not even funny.

Now when the compiler says "your stack size is big", you just look
"Oh, that struct should be allocated with kmalloc, not on the stack".
Boom. Done.

            Linus

