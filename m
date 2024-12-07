Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5986DE7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHFw9+ZFS/5kCWej9Q2r4cNs9qWMsdVVVFbrLzYifFk=; b=Xr3o9rNzkiI1IssOTOw0SfQBm2
	+OlfoEbUaJxMvDARr3QZhPehFDrNRRn251s/lgVOVDNuub3yiZuT6M8DpCc/mS/tGMvt0uHztgInZ
	moNdJsTlXtCgMQJBPK+EIG9xFw7U9fRyTra7DKPy+8YEEq6aIkmsKPBnB6ZPSnRrtRDrnLkLRluka
	zNcWp8F8gvRZLVmTxJB3OfWyidCGCwsYN9Zzozfsg7ObmZqS1EkRqxp4WjX4pmyVObK6dOnbG/Jv7
	oZ+wTKdhSNuBnM1RQWp69KnLjY9oe/Zvmsuk/vn1siBgI9B1QVAkI9o+IBMi96y55nDcm8qg7wnFz
	vn5WPauA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJvDz-000000040Qh-2SCs;
	Sat, 07 Dec 2024 13:51:59 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJvCx-000000040Mh-1ODo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 13:50:56 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso3484498a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 05:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733579453; x=1734184253; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHFw9+ZFS/5kCWej9Q2r4cNs9qWMsdVVVFbrLzYifFk=;
        b=ErblTwFwjZjHZ7oXPUSk5kaWcI7FIk5Yq1WfZsQ4KW03cLrBkCi2le0q7BNftkwlsR
         aVZeRpiR0Ah45GrnMXy4PumjMupUYJHNQfrmxFT4ifV5oR/Aa7F+/s4dA0XIZwcmb60W
         dgPQ73yDcAq8ZKYD/t5NFeiuigcOrNMdl9gsI7csF9qw/WAFvBQqiOQpLHgyLnek4bzZ
         djGr6aLpgVcdbr6wwHZ4TkTEx/pMp5iH5k3xP5VZ5NdmnHPUiskTM6pmMRyrSzF7ACON
         ad9i8hNbIgwujEUGAsG4jA/cQPAl4uQ9Z5it+c6K0EIB/tiuwqhxes1Ra0ZdebnNAKkT
         XZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733579453; x=1734184253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHFw9+ZFS/5kCWej9Q2r4cNs9qWMsdVVVFbrLzYifFk=;
        b=kA7eTQs933r7c3A6Ku+1tVr2Utc6Dk1+Q6cHUZAo9nXQ/dP0ng3v9csJhv7tL2TAEW
         zxygBJSxde/OoPGxsxTInu7BCSzFN2zr9As6wnkn3HKY5PieEUJjoUf9lWGDeFjthr4x
         90YzJtTbMYydnAQPj/gl0/nXmoPP3kP3xv1CIHaJEMYjDFZhOF5dnmLZIRjHE+GQVhRf
         /2XrBh8C6gAl0YMOU5CjdHtGOzFQCZ7yFrsRPG0KDV6XVqrmLG3YsOGelmG6LFmdmp5R
         DAnKQC5AUpGjQPrJxTmzb+7dMJaOoR9jqSZhhYKWjv0E5sua4dkZG2LaGFqI8SvFFs2Q
         3n1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmPd+y0E8DyBVrpDKKwboNxcP401jTNT4seT4xAwKShtSWR0SJyPi5kk2X0/rFncWm39Pm6vyaZEO9L6Wl8OYU@lists.infradead.org
X-Gm-Message-State: AOJu0YxeKCGsIvAQsZrlWTEntRP5FQ9Hod35TFTCXzoKd8JgRTOOA/cE
	Cs5TXBXFfdXDG8rOnLCSXVg6DMcJW4klj71hMdsZjcuf/hdw61l2NOUx17vOO+SQzSSG+PQX0Ae
	qEPJWHbnYBK7d9l0Kt9I6dh3kwgM=
X-Gm-Gg: ASbGnctak1BKmPj+LjisZomfnhHA9u7FibpXZ/U3JRg0eTNvlPGN7Qjs6uO+jx+kqW8
	V73qXcroKBPaUh8ZorRJnMnj6nvwqzYA=
X-Google-Smtp-Source: AGHT+IH6k2GyIlgxnGFl/g0StSGsvarnhcm9pbDRqjwA6P99KliYB7aZHWQfO50sclN4sezlsrdFqfGV/df1a3TMj88=
X-Received: by 2002:aa7:cf83:0:b0:5d3:d7c2:ca58 with SMTP id
 4fb4d7f45d1cf-5d3d7c2cad3mr7104642a12.24.1733579453216; Sat, 07 Dec 2024
 05:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de> <CAMZ6RqJGqBqvgxzp5yPFY1pk0WkkwEMM34qU-dZ3kXfsnKaqEg@mail.gmail.com>
 <429e7c6713ecc94494d9107e5f5a1f0c8e854f23.camel@gwdg.de>
In-Reply-To: <429e7c6713ecc94494d9107e5f5a1f0c8e854f23.camel@gwdg.de>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 22:50:41 +0900
Message-ID: <CAMZ6RqL+iS6GVsY20=O6GdQakRpp7XdewZJsUbmE5OCsKaHR6Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241207_055055_373858_2C7FEF98 
X-CRM114-Status: GOOD (  27.29  )
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

On Sat. 7 Dec. 2024 =C3=A0 22:19, Martin Uecker <muecker@gwdg.de> wrote:
> Am Samstag, dem 07.12.2024 um 21:45 +0900 schrieb Vincent Mailhol:
> > On Sat. 7 Dec. 2024 at 17:39, Martin Uecker <muecker@gwdg.de> wrote:
> > > Am Freitag, dem 06.12.2024 um 16:26 +0900 schrieb Vincent Mailhol:
>
> ...
>
> > > I find it amazing how much time the Linux kernel community spends
> > > revising code to make it work perfectly.
> > >
> > > Still, I am wondering whether some of this time and effort should not
> > > be targeted at C compilers and language work to make these macro
> > > hacks unnecessary?
> >
> > It seems to me that the long term solution to this problem are the
> > constexpr functions.
>
> How would constexpr functions help here?  (I am a bit sceptical about
> constexpr functions.)

I was thinking of some of the "side features" of constexpr functions. Namel=
y:

  - std::is_constant_evaluated
  Link: https://en.cppreference.com/w/cpp/types/is_constant_evaluated

  - if consteval
  Link: https://en.cppreference.com/w/cpp/language/if#Consteval_if

I did not try it, but looking at these, I believe that this would
allow us to rewrite most of our macros into some constexpr functions.

> > But the core issue is that before getting this support in Linux, we
> > have to wait for this to be added to the C2Y draft, then implemented
> > in the compilers (probably just reusing the C++ constexpr functions)
> > and finally wait maybe one more decade for the C2Y support to reach
> > the kernel. For reference the kernel supports C11 only from 2022=E2=80=
=A6 So
> > maybe we will see those in the kernel around 2037? Meanwhile, we have
> > to deal with those hacks.
>
> If we do not collaborate on proper solutions, then you might have
> to wait much longer.

I was invited to WG14 this September. For now, I am only lurking. The
thing I have in mind right now is to write a paper to allow the use of
static_assert() in expressions (i.e. make it return 0 on success).
That should be a relatively small change, but would bring a nice
quality of life improvement.

For context, look at this:

  https://lore.kernel.org/all/CAHk-=3DwjLSEcZ5LdW+3C+9rtjvNPHZT6zdk0POj67T5=
k2ZpDbgA@mail.gmail.com/T/#m1ba33a804b4041154b72a1d0333f90ec7204c461

And I will definitely follow the progress of constexpr functions in C2Y.


Yours sincerely,
Vincent Mailhol

