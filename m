Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79769D68BC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 01:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3lPJkHRSCmKfOfDwhUgx/Hppf9Vk27dkhOuGa4j0X8=; b=ykY8zvEwSXBvOQ3sMKShnW2fTa
	X3o6aTfitzbq8r0xLcpkxY+x1jL2C1R6J0aapDDpFIx3cj0eqlq54y3HtZ2zhVifr1IIJKI1Y9EFB
	e8KWL0AEqZKtAGZBWFBnEKOVDOmD1biFMYoZwDkTujOnhuHmEPXp+P9dLVjv1ku6mPFv3ebmOH9vU
	Ff6rWkkrIbhCCzd5N/OdmARAqCos5PuGIMc8FfE0n0o8CDd9IvpyPgoZ31DWpy2yyDUXhKngT4TwR
	dP8ik76E55zgzgH8odisewCoHD+FH2NhZj30cl3RxFxtXFIocjJmtZE5qyb4Yd633trSPP6yK4C88
	Xj9H26QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2vG-00000007eqg-3HbM;
	Thu, 18 Dec 2025 01:35:18 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2vE-00000007eqD-0Are
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 01:35:17 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-34c3259da34so105755a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 17:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766021714; x=1766626514; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3lPJkHRSCmKfOfDwhUgx/Hppf9Vk27dkhOuGa4j0X8=;
        b=ood8VyF3m3e+SGNbiAkxfEbGGT96v0QylyCKyLI0nCAFMeEL3f3KpMOTAQbbp3zneK
         6Xa3Pq1KlFEUPxQ/z8seGPtuBBVqikBTGo7o4hXr/ZVcF8GeTKFBqg+m8L7p93Vh2IAj
         WcUsfAeor3NJZpYHnN0NKQZhJU0mZw82K5WQkl8w89PjVCrw0nJqlPm2bzU401kr7OnL
         IwYgZmitsch4qpLCvwC13Hn9nXOs1txFSYD2e2dJqQ9UVIojC4yU1Iq/lDg5dtqn3mwL
         KRQX84kledTxH6zZBMMOBO2U6LY2cBqDBDuy3Rs5sSwb2C+nMkzSynvuqWSqKeGo5iwt
         WrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766021714; x=1766626514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+3lPJkHRSCmKfOfDwhUgx/Hppf9Vk27dkhOuGa4j0X8=;
        b=FVWgT+Gze1uXoKoVDoLMsU81rEdB8eEiwiY301osV7CqH67KrFHtxdkBye2FsOBjyd
         rQKJxSwsXNMpvwhYPpw7W1zZJ0njTSBEzakyR2JYpchSJc/MyNZFslu5yKH8HP/byIQz
         yRVA+Ygh78N22X4mwA+O4Cz7QqpsM1jn6irnuM339wr9vm85YK+Xd4mBRarDX96giqX0
         vXn4wjUig11oTzictJmr+LjqvirqPOyPW9bFPWTR19nK39fjiqKfZkeSExNPnc1UWDqh
         eFNZrHx6RNpN/4BNvbhGX66Vpuw/rV5xivMhHN0s+K9vyA6FR5U1CuzDL4zralSNsdfq
         ycbA==
X-Forwarded-Encrypted: i=1; AJvYcCWAGT5fvjnwC1BKvH44gzAwRFpjPKZ1a23l0KvH0NciWF6wNBEvWtA4s6ZKQ+LnZ65aHvMb6B4eujrCi40F+cl/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0laRqdmDWruFRwwhYrRxt4qEzp7aGJUeUQEhYZjKYoOMu+r7U
	+jJMq0JcqxSdy29ASNWTdkahMawy89adDmHW+QtONGRBUdX0jXFo3dN/XW9LKPGhwmPuuleH68d
	ZHhETAsxTz/XR2tMkukpZYGefHcXhjzLdw45/2Sy0
X-Gm-Gg: AY/fxX6j38cKpRgYLxBliJLm3XI3hpI4zhvDKkvBZkc9xY97cuS7o5pe2j1ZOAjRrwW
	tzyvMPWRio9ackg0pH+jMN0jPuxWzL7CKes45xGwxdxoBkqOkGrAz7fLqC/riWqKOY4NGlbQCNd
	4udetHArMBqbbRdPargfTLaqAtyPZvAbK1aHMm9T5ezraholUyaEw4iRbIHgRrSwehUk0jUEmcC
	nsn4lmr+2n09I8O55rIsJiaUM1iDhjOx6xT2T93fF8p/c8fWzx1djekUxEADk7GzEYDJ0g9TUym
	BZyZqS3rF9TY293ZbfmZlhLTgA==
X-Google-Smtp-Source: AGHT+IGvcyO+atFMG40EK+LXFzuEE58sYgxepefDuuFDeJNb4XXiKi+RzM8fyWk9RSGm3Ityaatl5SIXnMbRo8k0DJM=
X-Received: by 2002:a05:7022:f686:b0:119:e569:fba9 with SMTP id
 a92af1059eb24-11f354cc907mr17457322c88.24.1766021713688; Wed, 17 Dec 2025
 17:35:13 -0800 (PST)
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
 <2025121728-reliably-crabgrass-2601@gregkh> <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
 <CAD=FV=U63F-wxwKDo9be6_X2P2zp6aTBjNghZRbXX1rn4jFNyg@mail.gmail.com>
In-Reply-To: <CAD=FV=U63F-wxwKDo9be6_X2P2zp6aTBjNghZRbXX1rn4jFNyg@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Wed, 17 Dec 2025 17:34:37 -0800
X-Gm-Features: AQt7F2rkORh0Ym1VQOfQeQf2IHUEB9pEt5kMbxWWeEa9-paUYGoUbCv0CV7TpLY
Message-ID: <CA+zupgyG4Nov0=jihSApp_3_0hy6YNZMkfOp6Q4-zmERFm10Ag@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Doug Anderson <dianders@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_173516_095053_63E7F432 
X-CRM114-Status: GOOD (  36.68  )
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

On Wed, Dec 17, 2025 at 12:14=E2=80=AFPM Doug Anderson <dianders@google.com=
> wrote:
>
> Hi,
>
> On Wed, Dec 17, 2025 at 11:18=E2=80=AFAM Roy Luo <royluo@google.com> wrot=
e:
> >
> > On Wed, Dec 17, 2025 at 5:24=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
> > > > On Thu, Dec 4, 2025 at 10:05=E2=80=AFPM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > > > > > +config USB_DWC3_GOOGLE
> > > > > > +     tristate "Google Platform"
> > > > > > +     depends on ARCH_GOOGLE || COMPILE_TEST
> > > > >
> > > > > There is no ARCH_GOOGLE in the tree now, so how is this supposed =
to
> > > > > work?  Shouldn't tools that check for "invalid config options" tr=
igger
> > > > > on this?
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h
> > > >
> > > > Hi Greg,
> > > >
> > > > The menuconfig looks like the following and it doesn't complain:
> > > > | Symbol: ARCH_GOOGLE [=3DARCH_GOOGLE]
> > > > | Type  : unknown
> > > > |
> > > > | Symbol: PHY_GOOGLE_USB [=3Dy]
> > > > | Type  : tristate
> > > > | Defined at drivers/phy/Kconfig:104
> > > > |     Prompt: Google Tensor SoC USB PHY driver
> > > > |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=3Dy]
> > > >
> > > > According to Kconfig documentation [1], the unknown symbol
> > > > would simply be evaluated as an "n", which is what we want.
> > > > "Convert the symbol into an expression. Boolean and tristate
> > > > symbols are simply converted into the respective expression
> > > > values. All other symbol types result in =E2=80=98n=E2=80=99."
> > > >
> > > > In a different Kconfig documentation, an environment variable
> > > > "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
> > > > undefined symbols in the "config input", but I can't find one that
> > > > catches undefined symbols in the Kconfig tree itself.
> > > >
> > > > That is, the tool seems to allow this.
> > > > However, if this turns out to be a major problem. I think we
> > > > can either:
> > > > - Remove ARCH_GOOGLE and leave COMPILE_TEST as
> > > >   the only dependency. Then add ARCH_GOOGLE back
> > > >   later once it's in the tree.
> > >
> > > Please do this.  I do not want to take patches that purposfully add
> > > dependencies on config options that might, or might not, appear in th=
e
> > > future.  Please just remove all of the dependancies for now, as they =
are
> > > not needed, right?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Greg,
> >
> > Yes, we can remove ARCH_GOOGLE for now.
> > To clarify, we're not removing all of the dependencies, we still want
> > to keep COMPILE_TEST for build tests, right?
> > Please let me know if you think otherwise.
>
> I think you'd just remove all of them. Normally COMPILE_TEST just
> allows folks to compile stuff even when they don't want the ARCH. We
> can can add ARCH_GOOGLE back in later once the config exists.
>
> -Doug

Doug,

Thanks for chiming in. I'm hesitant to remove COMPILE_TEST
because Greg specifically requested its inclusion in v7 [1].
Also it seems beneficial to get some build coverage before
ARCH_GOOGLE is officially added to the tree.
Greg, could you clarify?

[1] https://lore.kernel.org/linux-usb/2025112144-claw-recolor-49c3@gregkh/

Thanks,
Roy

