Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B776D66B85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 19:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CK2xc4O1CWL3YyR5Jlk5dSHvCSo9+K5mz+4BdYDHf5E=; b=O5bdcCdqHtsjwXrsazBsRmJncB
	vQe4pemezSjUfiuIL6l4OePegkWYFYwn21FEhQGmiiUdhkr4TLEEZHwIuJsiMtzp7NBshdjewEdZH
	76WRar1snZASxSGNO6cZdvlv7w2OjTqzHSiyuFSrA6YY7+3hpTXXhP0b8KOcmiuR2TtVVxlAV/83t
	Sf2TreY3nV+RKwH39+f0ZeiMavbmWAJaYn8+K/JM4U1+89QIOpeb+xck1F9t1sMEz6kg3BNa4/Dth
	iXgtO8FM0R62GkBJ8lR/zYXxLvWqd2Pxw3xY+bCE2V2xlkD6ruH2xZu8OhNK80q+7CX6bLyFDr//n
	x6PotuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVx2M-00000007Jgv-15ap;
	Wed, 17 Dec 2025 19:18:14 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVx2K-00000007JgO-08TW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 19:18:13 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso5109586b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 11:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765999091; x=1766603891; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK2xc4O1CWL3YyR5Jlk5dSHvCSo9+K5mz+4BdYDHf5E=;
        b=Vtj5J/K0enmVw5buHxgIAzJ5IEDN2J4b51qWhYefHPJIPEosO1uUlWl00p9aRGv04N
         bFjkdFNEytxKbQDX3Ylapq8//IdBkXblnr4tehw8NijvXF13gwyxtgVCg+scuWk4tKMe
         MdOrMgi+oMAXk6OipUV7MWqklzQZV1pLW+0fI3/GUSM3+9drDYgVKzhrZxWnSog7ubj9
         RfXLabTMk4UPqXCuaC5v2bOxL/evS+Zqa6kDarJTsU4wwfBIo/bM3kSP78B0uoMPpnTm
         BgfmYmAvM8pJzO8P3mDMC4AnnFBI3sEzXXqEPqynGLew+9UabZgkQBoWyaxmeejaDYih
         YFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765999091; x=1766603891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CK2xc4O1CWL3YyR5Jlk5dSHvCSo9+K5mz+4BdYDHf5E=;
        b=tJvJOr+7DUcw97EFH+P0xqT5UpYKDL8A5Guo8vZEbO+k6cwNKWHaqQA9aeHy8wMP4A
         F7oaWhuJSEI3XMbmhCQiFLp2xpmbcwXAbKjeJQ5vYIfkd5zUja6J7EuoRaDWruqx4JFQ
         yaCm/2AAK9iqvaCUaONWGtiJCwqY5WEZlgvBEmyMnVDX4S6yjeesAYquLwwdzQKDnBTU
         nQwi2RatQn09vCW7efPFHNDbnisKjbnOIbqa997aEhHUIWLO1PsRjlUsAYbZ487s1gTD
         GNT7jNam4hKI4l9tJWUOXqssJKySzehFweH5FGWsg0hDPSxPteixsl2Zt8zEJN5F8oiQ
         HTiw==
X-Forwarded-Encrypted: i=1; AJvYcCVhPc68Nu978Ie2HKtF7+lgq7jd8GKGN2RP4qPKblcN8q94nWzqtpxoaSaOH1k8RftWCGYsQmRa3ckwiKo1qEvp@lists.infradead.org
X-Gm-Message-State: AOJu0YxAkK4nlP88DH17uDb5Xxe2867HpNJ6EwRiSA5/l/IgBnXf/whz
	VIuRP+kO7oS3rxox1feZetrfmT9ZZXuac8jr1foiMN3yKHh8D+1bRelaxFJYrkDD5PNq7sy6pdG
	gbolOMGasMrJhRfx17jby3qUY68YsgNu3SNsZXRRX
X-Gm-Gg: AY/fxX4Z4/vhaIYFEgrsz9Fl1GdNyHQz6lJqOk6wDFmmbvFakcSC9Ds+4P4HvsBTmk6
	yLM8L1eaVsI8fE4isWtc5/ZXpgIesQC2gc73N2sb+E/QhS6ewm1TIQVK79R4jUVPr6P+d6iEerZ
	98zheKY8VJgbD+v/8N+9t20OvRkvGeWigCswEDVuTBsa7Pn8x6YVgWoYre6a2QrfNV7JMdcN+/Z
	dSD8Sib+4UBNLhgdwHw5eRFFdaLyPH9JQrP0ClOi6QlomZHxbCeCmiqVgSQcbatyZFDEzSQEuM+
	2hRFk+9DAlmBlHTP4FOQ/IJY5A==
X-Google-Smtp-Source: AGHT+IHU2vpetQSDEWGYm+Y16+Q+hMrDA20ASiwjGw22PJF4oOT0FZWKdk6jDg2jAFGB5cCqYCpdKNR8qXBpSDUqoaU=
X-Received: by 2002:a05:7022:7e09:b0:11b:a892:80a5 with SMTP id
 a92af1059eb24-11f349c5953mr12769514c88.13.1765999090603; Wed, 17 Dec 2025
 11:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com> <2025121728-reliably-crabgrass-2601@gregkh>
In-Reply-To: <2025121728-reliably-crabgrass-2601@gregkh>
From: Roy Luo <royluo@google.com>
Date: Wed, 17 Dec 2025 11:17:34 -0800
X-Gm-Features: AQt7F2pRcbJChuQijr6nIYQ6eCnDyo-nRUDl_79j5YJBIy8PmN9l851-QlzkUmI
Message-ID: <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_111812_075953_471E5075 
X-CRM114-Status: GOOD (  29.00  )
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

On Wed, Dec 17, 2025 at 5:24=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
> > On Thu, Dec 4, 2025 at 10:05=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > > > +config USB_DWC3_GOOGLE
> > > > +     tristate "Google Platform"
> > > > +     depends on ARCH_GOOGLE || COMPILE_TEST
> > >
> > > There is no ARCH_GOOGLE in the tree now, so how is this supposed to
> > > work?  Shouldn't tools that check for "invalid config options" trigge=
r
> > > on this?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Hi Greg,
> >
> > The menuconfig looks like the following and it doesn't complain:
> > | Symbol: ARCH_GOOGLE [=3DARCH_GOOGLE]
> > | Type  : unknown
> > |
> > | Symbol: PHY_GOOGLE_USB [=3Dy]
> > | Type  : tristate
> > | Defined at drivers/phy/Kconfig:104
> > |     Prompt: Google Tensor SoC USB PHY driver
> > |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=3Dy]
> >
> > According to Kconfig documentation [1], the unknown symbol
> > would simply be evaluated as an "n", which is what we want.
> > "Convert the symbol into an expression. Boolean and tristate
> > symbols are simply converted into the respective expression
> > values. All other symbol types result in =E2=80=98n=E2=80=99."
> >
> > In a different Kconfig documentation, an environment variable
> > "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
> > undefined symbols in the "config input", but I can't find one that
> > catches undefined symbols in the Kconfig tree itself.
> >
> > That is, the tool seems to allow this.
> > However, if this turns out to be a major problem. I think we
> > can either:
> > - Remove ARCH_GOOGLE and leave COMPILE_TEST as
> >   the only dependency. Then add ARCH_GOOGLE back
> >   later once it's in the tree.
>
> Please do this.  I do not want to take patches that purposfully add
> dependencies on config options that might, or might not, appear in the
> future.  Please just remove all of the dependancies for now, as they are
> not needed, right?
>
> thanks,
>
> greg k-h

Greg,

Yes, we can remove ARCH_GOOGLE for now.
To clarify, we're not removing all of the dependencies, we still want
to keep COMPILE_TEST for build tests, right?
Please let me know if you think otherwise.

Thanks,
Roy

