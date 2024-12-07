Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4021EE7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 20:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ms7Dj4PhpQjQO3I96MAeIgwapri0gFHpEAP0IFi7Ea0=; b=YJqB1AnA02QKQbO1R8L0DIECHM
	1vBuVo877JXCRycjejzGp5Nm2u8m2vyXA3lqtB2GF3saCAyZ1OH2b+/KnyEtZYw44ifx85h9Y1YRE
	uR8cenfgcPaSFnx0H7eoKhI9G/etF2Y6Z9i4z8lQrK8lKTibn/s/nt2bnYIx9nNnlg5T/BL8k5bqS
	P1g06y0P/1tYBWr3xtwdkAgyk7Wx6H4vXkiug/uyWiTn8r6WGIbEXcBB53PKsjEa3opoc9Ej5saQg
	3KjdYtvXXQ75SraOSiFu6UYP1UpppneSVK8pugINCNFjgks04tJIAst2vSiAb7ieShRTdggH+3XBc
	3bykg9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK1bF-00000004Nbh-3n4a;
	Sat, 07 Dec 2024 20:40:25 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK1aE-00000004NYJ-0WC0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 20:39:23 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30037784fceso15594041fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 12:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733603960; x=1734208760; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ms7Dj4PhpQjQO3I96MAeIgwapri0gFHpEAP0IFi7Ea0=;
        b=QCdN8a2dubGPkf5wfNvwt6CaWfdKbbQZZFLUTkDqWGQ13MPt9yTfRcQja93wSaWHu7
         QvvNfPYZTBM3Pso/OiSRTI7ajW4GSJ4bPFEy6/HM8kK1XGJSORLAJOgz0xUF/dYONFOW
         fIDmEPxTx8j+RRGszIUbc1AfAL420JDN/lOQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733603960; x=1734208760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ms7Dj4PhpQjQO3I96MAeIgwapri0gFHpEAP0IFi7Ea0=;
        b=h9dlSznIapxgWdW3epLON6R+YKfPX2Liga7vwPYaM6EwtMcS699lBHqpDAFc9NRUG2
         A6WyT9B37q0c4Wl67yOU8szftYP1Q3UhpoLFCkD/KNGiUiZok6huko+uYOXjodqL+pJj
         6lT3siUdSduUWz9oZmYC8obUtYkl93VVBxG6pyu0EvvBLx2ecR1T7bP8fSVnA+/viMUr
         R891UFxgqvIYkRwNsv6+L03+QECwPG1sySteboOzW+kS1UBp2vXxXBin0X87JUDpRHnb
         qsSc61snwrW6VtgStLFTxIXpAc7vuTjgqZMnFIRf7ycfB0/ljhGn2Gnfen1azdTkvVRa
         +vdA==
X-Forwarded-Encrypted: i=1; AJvYcCVFlfa615RFIM8mmSb1L14iuFuKOwIC/joDN6GAgEmajTbVpNBx1KADWPwKnixkSlnDxXCzwKcRJvqDeAUwPZel@lists.infradead.org
X-Gm-Message-State: AOJu0YzO/YUdKibfLSnPrnh/leU3R4jS978sCTMCxwB7lw6tPPD/Jjhv
	gU1WwxVvBHkTUNHEyieBLMwEH0M6uEvSn+ARjBedcyZt3ftmzZbtACfCyZ31mTKRMVAquLQwdIH
	Rxq43DQ==
X-Gm-Gg: ASbGncs2JzEvQtFn1698lr7NP5xXO5KHYiOT1lRPjUUKuvzf7GvizHNW3pjw0C8DNBI
	Mr8ffZDYJdFRHl+EeErmBVbJfy3ozUTSOfGE3OQ4eOz76YXGJvslrOpp9U2/N/YNfxm0trS7TkK
	Pv05TFDJaeD/2Uq8Mfv838k6I2u07OCNi4bEwk6HOM7aFWc4H0/GCgjzdrMcFnTLdxuNd950L9Z
	/To9BkJIwqMCCrJyV9sZ9xNW8wFMwxRQAE/gCc4khwTcprVRNsE/MiMp4afN4J3eOIgc8H4Sgg6
	JKwzTWEwo4l4hZxzDiPQllw+AEf6
X-Google-Smtp-Source: AGHT+IEfcSeva1OEU8Ly5qXsd2XebrAfmrQhCMGFPkHKxDcdNFLJqmH64sJqMxzzCoON5aQeJnEBKg==
X-Received: by 2002:a2e:bcca:0:b0:300:17a3:7ae7 with SMTP id 38308e7fff4ca-3002fcc60e3mr40257881fa.36.1733603959762;
        Sat, 07 Dec 2024 12:39:19 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e20c14sm8001351fa.92.2024.12.07.12.39.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 12:39:18 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so29082331fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 12:39:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgKtfDhbTWKAZwsBMFo8Be1UMNi+Gxy4ZkTAePEns0O+/uiOCj6M4mmGont4Zd2Q9y42XOlX3HkvEFSuRDwR9F@lists.infradead.org
X-Received: by 2002:a17:906:328b:b0:aa6:326a:bcb9 with SMTP id
 a640c23a62f3a-aa63a10fe42mr541173966b.33.1733603485779; Sat, 07 Dec 2024
 12:31:25 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com> <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com> <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
 <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
 <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com> <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
 <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com> <6b8c9b942ba6e85a3f1e4eef65a9916333502881.camel@gwdg.de>
In-Reply-To: <6b8c9b942ba6e85a3f1e4eef65a9916333502881.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 12:31:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=whzFAaksqMdYeYC=T82tny1HnGGcYu_xJTXZF1OZwVziQ@mail.gmail.com>
Message-ID: <CAHk-=whzFAaksqMdYeYC=T82tny1HnGGcYu_xJTXZF1OZwVziQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: Vincent Mailhol <vincent.mailhol@gmail.com>, David Laight <David.Laight@aculab.com>, 
	"w@1wt.eu" <w@1wt.eu>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20241207_123922_153999_88CD0085 
X-CRM114-Status: GOOD (  15.55  )
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

On Sat, 7 Dec 2024 at 11:51, Martin Uecker <muecker@gwdg.de> wrote:
>
> Am Samstag, dem 07.12.2024 um 10:19 -0800 schrieb Linus Torvalds:
> >
> > If there is one feature of C I would have liked it is "allow inline
> > functions and statement expressions with constant arguments as
> > constant expressions".
>
> There exist proposals along those lines for C2Y.
>
> From a more near-term solution, I wonder if making it possible (or
> easier) to return integer constant expressions from statement
> expressions and allowing a restricted form of statement expressions
> at file scope would help?

Even a more limited form of this would have been useful several times,
but as mentioned, the problem tends to be that we end up supporting
compilers for many years.

So then we end up having to work with older compilers without that
feature, and can't actually clean stuff up until many years after the
fact.

We're currently still accepting gcc-5.1 as a compiler, although it's
time to look at that and probably (judging by what stable distros use)
upgrade to something like gcc-8.1 as the minimum supported compiler
version.

            Linus

