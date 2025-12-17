Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFD5D609D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 00:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nStCldhYeJbsakQb9GL71otPBPnGKef27diqrwm9pSQ=; b=eBDFP38jQti+L5yRFmZ+19qQdW
	+f+A3ze9Wk3+yPfnhvxAI8Hf8pIZ3vnzN60lhogaAlhRGPIbqaAb1PjQ1Sgos5C2j9yyKt6O3cgP9
	RWxDVepl3LsElCTr6wVItMbBCefzcbW75UGutMDk5sLjM1n6kXRlERvXaWFFy6xJOeltYnkLR/NHQ
	+dbd/Tf8/pu5eUzq2UeohZc/h2BpPyE8zm7h3rfqFMHcjyTeiVCf22RvzyrFkgdMMj+dK6ryxsOJ6
	bM0AvtW8+u35EitFTeWRFBhUx6Ee7otSqQgUTm6lhk0fWxzIVrpvetjL600VxfQ26Ze47rTxfoEPi
	oggfdscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfMg-00000005zQm-2nbT;
	Wed, 17 Dec 2025 00:26:02 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfMe-00000005zQI-2LL0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 00:26:01 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c075ec1a58aso3051969a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 16:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765931159; x=1766535959; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nStCldhYeJbsakQb9GL71otPBPnGKef27diqrwm9pSQ=;
        b=3Q6MyONH/GCbclzi/MxHk2bkitMYIhP8boFnO+xNLv2qkebvbokuwnn6WT4UX5cxbz
         lVhXUumO2cyHA5Zkxi5xmHyvbF0Eei4ZarVcXiaGUOdR2CY8zS+sVlxw3aPxRByZxNNO
         pdZUGuqH1XZa7Yev5h/Qup1tiV26eYGrgTzWKDF81BO2f3kHRBN9HY3ZZnVvY0AWVAPE
         AW9hk1PR2AmkWvuGoXlBERVGTxUXWmvFmlqZM4JVHy2IPFhnGy4wDR8h/3WUT4p+a8sk
         xUozO8ThLO+E7EKJDdKlL48fzPrKOkiouPl15PC0LjoTlpP0VvvhH0cCp8IZYLMvqpp1
         foTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765931159; x=1766535959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nStCldhYeJbsakQb9GL71otPBPnGKef27diqrwm9pSQ=;
        b=xDUgpY3gqQfrrQiubmsGwbSzMG8nY7Ng3Yxtlp2cUKAnmrUZhj205N+nTI/wZSHNWE
         96iJF1LMdsCtYMun3bsPLnga77M9VrKAsIvOQK46DegD/S8Ol+e7p5bpPfJKmbE2yoZL
         u9yNfW93DdOeNAVEXEqVLfy/KiMgLbIIphxpkD6ZW4KeR6V+Nzir4EPk4mSN/XrEaip/
         nYsT1gwz+Kjykv5LuBm37t3gcTYaSvP3fokGclaWmcaMHkM5Ria9sbpHid/2nj51J0+e
         VhS2dP1gtA/uEMKySJ4SRIdzlFcw0Ay2Hu84zUMrKUp0/Vi1tuESlIPp0XbmlWsLMIPP
         B+tw==
X-Forwarded-Encrypted: i=1; AJvYcCW13dURRJ0S7ABNig8/iWCfyqAHEzDTyO9Pp7P803M7XEmuMkI5X5CaIkFMLZy+dmgZFoJidFCnf3sbq2QQ1G0r@lists.infradead.org
X-Gm-Message-State: AOJu0YxH/R9KfogGGSItPum9cGv8jydYHFrqAoE/AcoqHqG6FIaaLU/A
	q9dCMbZCHWZ3kGD9bQS1Nau2LoWlW2PU2VQHbuNK6NiFmFembhTuzCe/7YaWligaqs9aixq35GQ
	OD2BPPFipkXRbLR68OmzNg356FXAisAj07j3zDOis
X-Gm-Gg: AY/fxX5dHelt9C7VFmsCeCHGbWRsE4HFAcFir255dmCj2janCP4qgXquzUAY2eI7jZD
	payvUv5w5oLkAawCxFfePjDiteg0EczF4YZ/BZi71sSYLxixr22H8Lw9lQAo+qBgOTtf4k5x7Tc
	uMn/Zgf1ly3mrXaLJW3a0XpDIW3Drxkbs8f+vV26/cGTvRqm+0zi8PScTM97VSlQK3LCwZCvZdt
	ldvclYI8lCbeUWnbRbTDcHcfcpMdR2CBDy5ByB8OdUCzecH2FDc8eaNRT9DXbTz4iCGddtdX7wz
	+09yXQUWwcyywI8yFHZwuSa1+wUYwv6oKRna
X-Google-Smtp-Source: AGHT+IE72YZLvmMskEnRrYKXqAR/Z4B1+w1UCRGWDCS1wBfVqFBXKeWBfxxKkJ6DLO7fN/x56A6EPSj52vq8pdguqrA=
X-Received: by 2002:a05:7301:7015:b0:2a7:1232:f3a2 with SMTP id
 5a478bee46e88-2ac2f92967fmr10246834eec.0.1765931158534; Tue, 16 Dec 2025
 16:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com> <20251216233439.vqigcx2zs6taergz@synopsys.com>
In-Reply-To: <20251216233439.vqigcx2zs6taergz@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Tue, 16 Dec 2025 16:25:21 -0800
X-Gm-Features: AQt7F2r_jcpuKgHpjELMuIOr3JbsyWh8DSH9IaZ5PBx8OH-Ix2ElNBkBRfsI7ik
Message-ID: <CA+zupgxV0aHEXqmmHbe6cKSQUvYg1iFXjiDfG7wKdF7KKTo6iA@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_162600_603308_A30B277F 
X-CRM114-Status: GOOD (  29.40  )
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

On Tue, Dec 16, 2025 at 3:34=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Thu, Dec 04, 2025, Roy Luo wrote:
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
> > - Defer the whole patch series until ARCH_GOOGLE is
> >   present (I hope not).
> >
> > [1] https://urldefense.com/v3/__https://docs.kernel.org/kbuild/kconfig-=
language.html*menu-dependencies__;Iw!!A4F2R9G_pg!e-y2_BsSNhXF1v5K6tBJX-Oabg=
KJM9WVdvwyKoB6tg9ooCLVg8WiQ4UrStOF2YZQ_Zs6tC6HVh7wCpqkEfU$
> > [2] https://urldefense.com/v3/__https://www.kernel.org/doc/Documentatio=
n/kbuild/kconfig.rst__;!!A4F2R9G_pg!e-y2_BsSNhXF1v5K6tBJX-OabgKJM9WVdvwyKoB=
6tg9ooCLVg8WiQ4UrStOF2YZQ_Zs6tC6HVh7wHpoUlhY$
> >
>
> Hi Greg, Roy,
>
> Just checking, are we aligned here?
>
> BR,
> Thinh

Thinh,

Thanks for checking in. I'm still waiting on Greg's reply
regarding the Kconfig question.

BTW, I silently dropped your Ack-by tag in v8 due to the
changes in Kconfig and MAINTAINERS files, which I
should've noted in the changelog but I didn't. Sorry for
the inconvenience. Could you please review the current
version again and provide your tag if it looks good?

Regards,
Roy

