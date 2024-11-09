Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1CFD64076
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 00:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giiL/kmBTCVF3U8QV+/xjUjiPzMAGE0/2NFlz+o4GC8=; b=V267FJovzKBrip6n8O44hr3Mmb
	UPclwcHvEma4yPrP9DIRAG1zuZTP+x67bMrGydbG8WmbtKM/PKOcHGrfSbJW1pyIQhGhmLRLK9L0a
	aIiuhE2gU79JaLzDApgG6d4mrjS0IrDNNN8LQWr3EU8qNDW9R2jhCl8Ms0/WnTDqJQ1czfVMRTzMb
	rCge+cVOshFLOA/8t0pvybFzd8+APMBIhp8mFFhaoq16dflEAQZBbdsM0gGhCRfxMMLDNw9HKBDcW
	veH7KMu0aTST01N++5G0mAuJX3Wwj9L4WXbVp7hh2ihTjfE7+3JgGMt/zB7JXrsqXnY6d2jggUeT1
	9vUoCYbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZoZ-0000000COGA-2UjG;
	Sat, 09 Nov 2024 00:58:59 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Zmn-0000000CO89-2FCU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 00:57:10 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71e8235f0b6so2362190b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 16:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731113828; x=1731718628; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giiL/kmBTCVF3U8QV+/xjUjiPzMAGE0/2NFlz+o4GC8=;
        b=iIXA2QCkIgY8nSFgVNg4kFM71IDKHv/oQThtKIEucC8u1/wyu0wX8h7+9R5/y3N12B
         wN+m3q0aRbvwiEPB2GZ6yFUk/CnRIC+1Q6t4WWu5e3O2LlsUtPj29bUwYNA07tPfzrP5
         FfNdmUG9eX3LrvzC4eHhRIMf1sgrZMjhnu38SkXmayVj4Hn8eSyIAZqbqDF2Or+HxRjX
         5fiHO8MrEEZaDGlKH2GcOoF+h/cjtCUlsQ7ZtWr8BWvSHnDXEaiJWIAe6bn2QXwjX+63
         tVhWx/3XmqoYVq11TR++tzZcoYCNgCXbHRLG01OpTAg9O0WXtWqZwrWl15g/lJg85dxF
         3RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731113828; x=1731718628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giiL/kmBTCVF3U8QV+/xjUjiPzMAGE0/2NFlz+o4GC8=;
        b=oZ5/d5P7ssxyeHGLL/QtcCPH7RpZyDrmTfEe/3ieI6Xscjbg534LDBkJkCFBe6eCJP
         atklh39pQ+vwoi+TdV1jNIwR7y9q8CGG0vmp+Sf+d6UTuU14a8L+rNBSsuD6LBJjyQdx
         KLKt6BWEvSlRrb5CibdsTc3jDzDz/iEzPdeIWRMiv3T9SGjwN4e4wzeRxrsMtAfjJamH
         gP5q3IAqmFLgZ9TSmmRF9q7u8KIJwDg2n9cFSUXs7yUlskn5bV1Qb/ixH267aeTukhfz
         JylZSWkPTSNJ+5a+9LiNlM8W0SIZJA27KxkCps0oMEaEJBKOrkfSopYobaONcGztqkHZ
         lwnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8lohG1JUTqiXVOzy+NrosC39cUpN8RDNbug6StH3bR31j1y2CRTK2s2kXyt4RIaCtoHoEzhb3L8OeeaxmM+Tr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5U9wq0b2d4NqQvMTh1UeW9kJULgpQrR0gnZAt3EAe/cE5jU4k
	q30M7tpZ7u8sqvFKCdg1R67mewwFh91QQF9OdeGoCif6jNdB4go5WptxWnV+mJjf9yQg7sQPJ3o
	kAC9hTK+TAZtudd358vgKieRZG38=
X-Google-Smtp-Source: AGHT+IFCBsAPm88J58jQ3X5q6NhHTLb+ZI6Xoq5Upa8IQqpPBawMNUt3VLvT52CoHD2XFc2ek2esFaO+L1peVd03Wc8=
X-Received: by 2002:aa7:888c:0:b0:71e:634e:fe0d with SMTP id
 d2e1a72fcca58-724132c4b0dmr6649906b3a.12.1731113828160; Fri, 08 Nov 2024
 16:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
 <20241106090549.3684963-2-dario.binacchi@amarulasolutions.com>
 <4bix7me5vaoyhcuffyp4btajmhy7no6ltczoesopaz2fqupyaw@fensx4nn472u>
 <b7c1499b-8337-421c-9734-6e518d678ff8@kernel.org> <CABGWkvrYJL9=zrPSFuEAgKO+9gDHD6RmCJM6Br6Le_eh578ETQ@mail.gmail.com>
 <54dd6ae6-b992-451e-b1c6-8a1968955f4a@kernel.org> <PAXPR04MB8459BE3474EFD4FCC28E0E82885D2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <8c310eca-d695-418c-82cb-a89351d83887@kernel.org> <PAXPR04MB8459B6F8D5C623D19CCF6B39885E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459B6F8D5C623D19CCF6B39885E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 8 Nov 2024 18:56:56 -0600
Message-ID: <CAHCN7xLSw7sBywVJ0ZcoOy4ao8x8GxpVwg8=4h-HoOxEsz565w@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
To: Peng Fan <peng.fan@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>, Abel Vesa <abelvesa@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_165709_606843_5D42A7CE 
X-CRM114-Status: GOOD (  37.76  )
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

On Fri, Nov 8, 2024 at 6:37=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support
> > spread spectrum clocking
> >
> > On 08/11/2024 13:50, Peng Fan wrote:
> > >> Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock:
> > support
> > >> spread spectrum clocking
> > >>
> > >> On 07/11/2024 15:57, Dario Binacchi wrote:
> > >>>     clocks =3D <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
> > >>>                   <&clk_ext3>, <&clk_ext4>;
> > >>>     clock-names =3D "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
> > >>>                              "clk_ext3", "clk_ext4";
> > >>>     assigned-clocks =3D <&clk IMX8MN_CLK_A53_SRC>,
> > >>>                                   <&clk IMX8MN_CLK_A53_CORE>,
> > >>>                                   <&clk IMX8MN_CLK_NOC>,
> > >>>                                   <&clk IMX8MN_CLK_AUDIO_AHB>,
> > >>>                                   <&clk IMX8MN_CLK_IPG_AUDIO_ROOT>,
> > >>>                                   <&clk IMX8MN_SYS_PLL3>,
> > >>>                                   <&clk IMX8MN_AUDIO_PLL1>,
> > >>>                                   <&clk IMX8MN_AUDIO_PLL2>;
> > >>>     assigned-clock-parents =3D <&clk IMX8MN_SYS_PLL1_800M>,
> > >>>                                              <&clk IMX8MN_ARM_PLL_O=
UT>,
> > >>>                                              <&clk IMX8MN_SYS_PLL3_=
OUT>,
> > >>>                                              <&clk IMX8MN_SYS_PLL1_=
800M>;
> > >>>     assigned-clock-rates =3D <0>, <0>, <0>,
> > >>>                                          <400000000>,
> > >>>                                          <400000000>,
> > >>>                                          <600000000>,
> > >>>                                          <393216000>,
> > >>>                                          <361267200>; };
> > >>>
> > >>> The spread spectrum is not configurable on these clocks or, more
> > >>> generally, may not be configurable (only 4 PLLs have this
> > capability).
> > >>> Therefore, I need the "fsl,ssc-clocks"
> > >>
> > >> No. That's not true. You do not need it.
> > >>
> > >
> > > i.MX8M clock hardware is similar as:
> > >
> > > OSC->ANATOP->CCM
> > >
> > > ANATOP will produce PLLs.
> > > CCM use PLLs as input source.
> > >
> > > Currently there is no dedicated ANATOP driver in linux.
> > > The CCM linux driver will parse the ANATOP node and register clk_hw
> > > for the PLLs.
> >
> > I do not know what is CCM and how does it fit here. What's more, I
> > don't get driver context here. We talk about bindings.
>
>
> CCM: Clock Control Module, it accepts PLL from anatop as inputs,
> and outputs clocks to various modules, I2C, CAN, NET, SAI and ...
>
> >
> >
> > >
> > >
> > >> First, the clock inputs for this device are listed in clocks *only*.
> > >> What is no there, is not an input to the device. Including also Linu=
x
> > >> aspect (missing devlinks etc). Therefore how can you configure
> > spread
> > >> spectrum on clocks which are not connected to this device?
> > >
> > > I not understand this well, you mean
> > > add clocks =3D <xx CLK_IMX8MM_VIDEO_PLL> in the ccm dtb node?
> >
> > Yes. Let me re-iterate and please respond to this exactly comment
> > instead of ignoring it.
> >
> > How a device can care about spread spectrum of a clock which is not
> > supplied to this device?
>
> I hope we are on same page of what spread spectrum means.
> spread spectrum of a clock is the clock could produce freq in a range,
> saying [500MHz - 100KHz, 500MHz + 100KHz]. software only need
> to configure the middle frequency and choose the up/down border
> range(100KHz here) and enable spread spectrum.
>
> device: I suppose you mean the Clock Control Module(CCM) here.
> CCM does not care, it just accepts the PLL as input, and output
> divided clock to various IPs(Video here). The video IPs care about
> the spread spectrum of the clock.
>
> The clock hardware path is as below:
>
> OSC(24M) --> Anatop(produce PLL with spread spectrum) ->
> Clock Control Module(output clock to modules) -> Video IP
>
> From hardware perspective, Clock Control Module does not
> care spread spectrum. Video IP cares spread spectrum.
>
>
> >
> > Why would you care about spread spectrum of some clock which is not
> > coming to this device?
>
> device, I suppose you mean clock control module(CCM).
>
> There is no 'clocks =3D <&ccm CLK_IMX8M_VIDEO_PLL>' under ccm node.
> Because in current design, ccm is taken as producer of
> CLK_IMX8M_VIDEO_PLL, not consumer.
>
> >
> > Please address these precisely because we talk about this for weeks in
> > multiple places.
>
> Sorry for coming into this feature in late stage.
>
> Dario, thanks for working on such feature, good to see. Spread Spectrum
> is indeed good feature what makes clock quality high.

I am also excited to see the spread-spectum clocks enabled.  We've
struggled with EMC testing in the past, and I want to reevaluate at
least one board with the spread-spectrum enabled to see how it
compares.
Thank you for working on this.

adam
>
> Thanks,
> Peng.
>
> I finish with this patchset if you do not provide such
> > context.
> >
> > Best regards,
> > Krzysztof
>

