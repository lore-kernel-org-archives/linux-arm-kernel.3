Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30018CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 22:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hF7n4MxMlgN+yI/qlPr4vsS5UraBfXpeEUdNSal42Ds=; b=NrWisNGrQT43GLgVmw6YgLBYEQ
	D3I3Yhdb38GRYz6I3OJ155fifk+8tyISsFgAQbto+sxlM9Jc5rhHBWAEojvM2awChMQ4ncG8xIMWS
	ZOI3iupk1HHrxIC46wMcs9PivqiCG7RZ0DM93w+Ffd5Tj3UHyEZfDWD1+B9HMATUaBIjDj5SZUxjy
	TbcqLDg1fJP3JFf9KjM4eLrD7Qu/M4ytr23gNCJZrZsUylogHfbZRpNONTwBkoCTuxF09FcU1fQP7
	ehf+ISeyJaYr1HUKB6omTV5dxvuBko++udd5bTP3weJ0pNZgLbz6jvke+aWgMyzUPLspQHJoWJyZC
	C6xHfPVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pLl-0000000Bfqi-1oum;
	Mon, 22 Sep 2025 22:49:37 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pLi-0000000Bfo4-1CDY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 22:49:35 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso7767756a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 15:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758581372; x=1759186172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hF7n4MxMlgN+yI/qlPr4vsS5UraBfXpeEUdNSal42Ds=;
        b=MVlwFxq3HyTnqt0EVpt8lMXaA+6HI/uMeKznkskPCEq0eznysfPLRUp/5pu1ApRXMB
         tWwU3CdbUO04IxzJ9o378xNuhUiiECsKldb4vka8AXj6qREtNv8HOywsq7bFY47PjWQA
         qKDrMUmPyqP3b15SF0yI9ePgUIb4R+rblf5JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581372; x=1759186172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hF7n4MxMlgN+yI/qlPr4vsS5UraBfXpeEUdNSal42Ds=;
        b=a1uG+i6hCuZSIW3H26UE+Tcq/R0s0luWvZjxMm/n56d5X4jCJaCYM/tow8I2KS5Q29
         YvzP16fMJjsCeUlD5H0BbSLK5oaZczsTVH3PKThRTM6kXcKm2y6HqSGFka0/dxn3p5Ma
         hMA3LnHBKEnl7R3MI6/QPfRM++q/oTRrWqdfmIvd+jYa32ODni9Lp7wO6EAr4V9vPqzv
         LdzfIsm/re/2vv4rQoIBYKo64qDag5n8tAZt5dDzXF71JymF5woPFNFPGIGF5Cmiqjiv
         vU/clyTIbbvZ2mwstlVh7fuaCJunlTv7bYjOqbsAl5Bsbzqr2IYyJSVCh0AsyGBMitAj
         auiQ==
X-Gm-Message-State: AOJu0YzxNWTNeQtu8f/hSFY8vUyXqN5YtiW1hoMPfWx37UxJqxmpdXSN
	QGr7K74hQiqB4KMETbFDHLoM6x3o3QeDJLCqpjDB/ASMRIyJsUWuOXmaqJkeMJAHT4zJ/SDH3Zq
	EjwmFgP9D9f/xm9AP4Qq70O01q7jalY6qxFoaVVW9
X-Gm-Gg: ASbGncvk03bJQ3PgcO1takB0gY63LOPc0v7Vi8ojySGnwcbwhUkfYBIy95dz4hOjwPJ
	XH8abXvjzjUbUKlNXzCXXscdziJCQyyQElcnwUdB0XJFuw6CxWhj1AoUV6oUzFg4jKmmydTX4+C
	MUUrmzfaySd2j0Go5UKq1MF63dherbq92Z4/5s1z8kdmpUck3pWwf4KJ4lcaak/vLE1Xo5rOEEZ
	xw6EtY9
X-Google-Smtp-Source: AGHT+IHbZn5OHKIeP1nsOAwVTqRzYRAfH9tmRuufJiUJb0Kj876VvOf28w57UjKHjpksGXr6nZqyuuLgkcwi7yyxhJw=
X-Received: by 2002:a17:907:72cb:b0:afe:d590:b6af with SMTP id
 a640c23a62f3a-b3026c84e0cmr28141466b.20.1758581372388; Mon, 22 Sep 2025
 15:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250919224639.1122848-1-sjg@chromium.org> <20250919224639.1122848-2-sjg@chromium.org>
 <aM_T9mtmEdAGNpLi@probook>
In-Reply-To: <aM_T9mtmEdAGNpLi@probook>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 22 Sep 2025 16:49:20 -0600
X-Gm-Features: AS18NWDs90BMyBNurGn6-wf-BQsjRp3Qx4vhBwf3ekxo6QmIQw9nCTDVVqaMP0k
Message-ID: <CAFLszTirQa0tt91aa1m8x3j7_m457F_5HkAD0b22datwZe11rg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] scripts/make_fit: Speed up operation
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: linux-arm-kernel@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_154934_328858_1AF0C6F8 
X-CRM114-Status: GOOD (  24.20  )
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

Hi J,

On Sun, 21 Sept 2025 at 04:31, J. Neusch=C3=A4fer <j.ne@posteo.net> wrote:
>
> On Fri, Sep 19, 2025 at 04:46:25PM -0600, Simon Glass wrote:
> > The kernel is likely at least 16MB so we may as well use that as a step
> > size when reallocating space for the FIT in memory. Pack the FIT at the
> > end, so there is no wasted space.
> >
> > This reduces the time to pack by an order of magnitude, or so.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> >
> > ---
> >
> > (no changes since v1)
> >
> >  scripts/make_fit.py | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> > index b4caa127d2c3..904f45088978 100755
> > --- a/scripts/make_fit.py
> > +++ b/scripts/make_fit.py
> > @@ -100,7 +100,7 @@ def setup_fit(fsw, name):
> >          fsw (libfdt.FdtSw): Object to use for writing
> >          name (str): Name of kernel image
> >      """
> > -    fsw.INC_SIZE =3D 65536
> > +    fsw.INC_SIZE =3D 16 << 20
> >      fsw.finish_reservemap()
> >      fsw.begin_node('')
> >      fsw.property_string('description', f'{name} with devicetree set')
> > @@ -330,10 +330,12 @@ def build_fit(args):
> >
> >          entries.append([model, compat, files_seq])
> >
>
> > -    finish_fit(fsw, entries)
> > +    finish_fit(fsw, entries, bool(args.ramdisk))
>
> It seems like this line should rather go into the previous patch.

Ah yes, will fix in v3, thanks.

>
> >
> >      # Include the kernel itself in the returned file count
> > -    return fsw.as_fdt().as_bytearray(), seq + 1, size
> > +    fdt =3D fsw.as_fdt()
> > +    fdt.pack()
> > +    return fdt.as_bytearray(), seq + 1, size
>
> The rest looks good to me. Easy optimization, big win :)
>

Regards,
Simon

