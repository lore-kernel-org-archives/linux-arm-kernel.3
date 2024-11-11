Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A34D2E9F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rm3BImctwtqWjbORyBrsavb1u/lJM8uC19lQxWeLcEc=; b=nLtbe0DhD1SRWbfeZlkYHFlEKn
	KvAPVXNRE6YsMubApCeydspo85xELr6g4wJivsgQgPy6BByWpOY+28whn49vlgJDlcQgg8UDKx52L
	oAlwGL0IOPFI3ok3xxYrZA3i+SeYNb7tsq8LgO+YTSMqPAPqOMLxX7oX8/DYuXagkMXsI69x2aSOO
	JsJqNhGDfwJuI1rusZa7pIcNGFkActf8rGTV2w51Tj4YzQQ97SaG+0Hz3O9sM/N62jDzf18EWYmMj
	Aspl7aOdCeeb25br7b9mHjDUFYnYimSj4blBLdZVxtu3WS2mHlxXoJAjc90juzolafx6hq8r/+YLC
	5V+W4qbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUlY-00000000DLK-1KyQ;
	Mon, 11 Nov 2024 13:47:40 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUjk-00000000D7i-3JHn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 13:45:50 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6ea7c26e195so44895257b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 05:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1731332747; x=1731937547; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rm3BImctwtqWjbORyBrsavb1u/lJM8uC19lQxWeLcEc=;
        b=SuvwJFZ98SI0Mp5kOv5/wicNda/tuZBXKMR6NizCepquaSNPOkITz/A+n7AqQEyGSr
         J2qG3u5p0BrsH4uyoiQKJ1JBDW3euFsQ7V9tF05mIBn+Vld30R0PLYwDM/asYmCe0A4Q
         bWSoemp4yCj8Ik9Jj1Lgr5xUQ3j+wmNo2jfvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731332747; x=1731937547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rm3BImctwtqWjbORyBrsavb1u/lJM8uC19lQxWeLcEc=;
        b=Pas/U+lBpapdyoQq83jUPI+jI82dRswPIC2JhtYaejoy55HyYAGaWdP0XCqsymYVqe
         6/wdV5wpTcA1C6QfTQu946WRMUMLse/TfkFDCirR6qOQTTRNEx7PBJ/+LWQnh/2ArcVZ
         UzzBQKbVwCeMO36Xc3jHtdojDUQ8YxUQYTj9uJ1t5bHz33yTIBIDxdFA8Ed5ow9HWFh/
         AN1lwVSvmVGbK6BVphNqLFLxFFEwkyUmOnkZEdlG+MSKjlXCjxunLeaqN/xoSdIIf5Io
         n764ANrCBGkLDaeozyx9i4wpqXpofDRSfWbTJ4SZtP22aZnoY+gOofRE/URkmIRCQMmp
         Az2A==
X-Forwarded-Encrypted: i=1; AJvYcCUo1yt/65Ao4AIfos2svGLc4nepf1WiwP7bgv7DE5qg+voQfRh0YXaa0JuFchgdpuA4h107G6hIwyMNGaOWuZLv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4pyuBXga8KNI0pGPd4Zz4NGT5asrMRA1NLssn+UgsTAaLdGu1
	YPyXuSeRAweV65AZwCeOns744OaKjh1bs/+Fpabvf68cP8cXL5JtflskC3X4SB3mb2RSvmoa81H
	wgeUVbCKHY2X9zElnLi1Wpy6N1XhcVUPqJGkn9A==
X-Google-Smtp-Source: AGHT+IFfas91t+lW7XnXNqsTwzeayIn+Qyj/NGlB149wN0USrAE3ytPby0ys5kySfPd9nSoYixCu9Zu87WuCEygU7Rs=
X-Received: by 2002:a05:690c:710a:b0:6e5:e714:3be0 with SMTP id
 00721157ae682-6eaddd725f0mr112372177b3.1.1731332746787; Mon, 11 Nov 2024
 05:45:46 -0800 (PST)
MIME-Version: 1.0
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
 <20241106090549.3684963-2-dario.binacchi@amarulasolutions.com>
 <4bix7me5vaoyhcuffyp4btajmhy7no6ltczoesopaz2fqupyaw@fensx4nn472u>
 <b7c1499b-8337-421c-9734-6e518d678ff8@kernel.org> <CABGWkvrYJL9=zrPSFuEAgKO+9gDHD6RmCJM6Br6Le_eh578ETQ@mail.gmail.com>
 <54dd6ae6-b992-451e-b1c6-8a1968955f4a@kernel.org> <PAXPR04MB8459BE3474EFD4FCC28E0E82885D2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <8c310eca-d695-418c-82cb-a89351d83887@kernel.org> <PAXPR04MB8459B6F8D5C623D19CCF6B39885E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <bc02327b-dea8-48c9-b036-4a0eda0c4cb9@kernel.org> <9f6b243b-0642-41db-85ed-d020bfa3e6e2@kernel.org>
 <PAXPR04MB845978F4D3C6E887E0DE8D5488582@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CABGWkvqXOg=Y7K+oc6Q-3UWGC-WLEK_tmQzyRBW6x0fvQTsqvw@mail.gmail.com>
In-Reply-To: <CABGWkvqXOg=Y7K+oc6Q-3UWGC-WLEK_tmQzyRBW6x0fvQTsqvw@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 11 Nov 2024 14:45:35 +0100
Message-ID: <CABGWkvqPFq0gnCVEKY6SV_K71F30TFGXa-xHjvG5BikeHQNyCQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
To: Peng Fan <peng.fan@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
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
X-CRM114-CacheID: sfid-20241111_054548_900216_EFDA0A65 
X-CRM114-Status: GOOD (  65.52  )
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

On Mon, Nov 11, 2024 at 12:57=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> On Mon, Nov 11, 2024 at 2:49=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote=
:
> >
> > > Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support
> > > spread spectrum clocking
> > >
> > > On 09/11/2024 11:05, Krzysztof Kozlowski wrote:
> > > > On 09/11/2024 01:37, Peng Fan wrote:
> > > >>> Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock:
> > > support
> > > >>> spread spectrum clocking
> > > >>>
> > > >>> On 08/11/2024 13:50, Peng Fan wrote:
> > > >>>>> Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock:
> > > >>> support
> > > >>>>> spread spectrum clocking
> > > >>>>>
> > > >>>>> On 07/11/2024 15:57, Dario Binacchi wrote:
> > > >>>>>>     clocks =3D <&osc_32k>, <&osc_24m>, <&clk_ext1>,
> > > <&clk_ext2>,
> > > >>>>>>                   <&clk_ext3>, <&clk_ext4>;
> > > >>>>>>     clock-names =3D "osc_32k", "osc_24m", "clk_ext1", "clk_ext=
2",
> > > >>>>>>                              "clk_ext3", "clk_ext4";
> > > >>>>>>     assigned-clocks =3D <&clk IMX8MN_CLK_A53_SRC>,
> > > >>>>>>                                   <&clk IMX8MN_CLK_A53_CORE>,
> > > >>>>>>                                   <&clk IMX8MN_CLK_NOC>,
> > > >>>>>>                                   <&clk IMX8MN_CLK_AUDIO_AHB>,
> > > >>>>>>                                   <&clk IMX8MN_CLK_IPG_AUDIO_R=
OOT>,
> > > >>>>>>                                   <&clk IMX8MN_SYS_PLL3>,
> > > >>>>>>                                   <&clk IMX8MN_AUDIO_PLL1>,
> > > >>>>>>                                   <&clk IMX8MN_AUDIO_PLL2>;
> > > >>>>>>     assigned-clock-parents =3D <&clk IMX8MN_SYS_PLL1_800M>,
> > > >>>>>>                                              <&clk IMX8MN_ARM_=
PLL_OUT>,
> > > >>>>>>                                              <&clk IMX8MN_SYS_=
PLL3_OUT>,
> > > >>>>>>                                              <&clk IMX8MN_SYS_=
PLL1_800M>;
> > > >>>>>>     assigned-clock-rates =3D <0>, <0>, <0>,
> > > >>>>>>                                          <400000000>,
> > > >>>>>>                                          <400000000>,
> > > >>>>>>                                          <600000000>,
> > > >>>>>>                                          <393216000>,
> > > >>>>>>                                          <361267200>; };
> > > >>>>>>
> > > >>>>>> The spread spectrum is not configurable on these clocks or,
> > > more
> > > >>>>>> generally, may not be configurable (only 4 PLLs have this
> > > >>> capability).
> > > >>>>>> Therefore, I need the "fsl,ssc-clocks"
> > > >>>>>
> > > >>>>> No. That's not true. You do not need it.
> > > >>>>>
> > > >>>>
> > > >>>> i.MX8M clock hardware is similar as:
> > > >>>>
> > > >>>> OSC->ANATOP->CCM
> > > >>>>
> > > >>>> ANATOP will produce PLLs.
> > > >>>> CCM use PLLs as input source.
> > > >>>>
> > > >>>> Currently there is no dedicated ANATOP driver in linux.
> > > >>>> The CCM linux driver will parse the ANATOP node and register
> > > clk_hw
> > > >>>> for the PLLs.
> > > >>>
> > > >>> I do not know what is CCM and how does it fit here. What's more, =
I
> > > >>> don't get driver context here. We talk about bindings.
> > > >>
> > > >>
> > > >> CCM: Clock Control Module, it accepts PLL from anatop as inputs,
> > > and
> > > >> outputs clocks to various modules, I2C, CAN, NET, SAI and ...
> > > >>
> > > >>>
> > > >>>
> > > >>>>
> > > >>>>
> > > >>>>> First, the clock inputs for this device are listed in clocks *o=
nly*.
> > > >>>>> What is no there, is not an input to the device. Including also
> > > >>>>> Linux aspect (missing devlinks etc). Therefore how can you
> > > >>>>> configure
> > > >>> spread
> > > >>>>> spectrum on clocks which are not connected to this device?
> > > >>>>
> > > >>>> I not understand this well, you mean add clocks =3D <xx
> > > >>>> CLK_IMX8MM_VIDEO_PLL> in the ccm dtb node?
> > > >>>
> > > >>> Yes. Let me re-iterate and please respond to this exactly comment
> > > >>> instead of ignoring it.
> > > >>>
> > > >>> How a device can care about spread spectrum of a clock which is
> > > not
> > > >>> supplied to this device?
> > > >>
> > > >> I hope we are on same page of what spread spectrum means.
> > > >> spread spectrum of a clock is the clock could produce freq in a
> > > >> range, saying [500MHz - 100KHz, 500MHz + 100KHz]. software only
> > > need
> > > >> to configure the middle frequency and choose the up/down border
> > > >> range(100KHz here) and enable spread spectrum.
> > > >>
> > > >> device: I suppose you mean the Clock Control Module(CCM) here.
> > > >
> > > > I mean the device we discuss here, in this binding. Whatever this
> > > > device is. CCM or CCX
> > > >
> > > >> CCM does not care, it just accepts the PLL as input, and output
> > > >
> > > > Takes PLL as input but you refuse to add it as clocks? Are you real=
ly
> > > > responding to my question?
> > > >
> > > > I asked how can you set spread spectrum on clock which you do not
> > > > receive. Why you do not receive? Because you refuse to add it to
> > > > clocks even though I speak about this since months.
> > > >
> > > >> divided clock to various IPs(Video here). The video IPs care about
> > > >> the spread spectrum of the clock.
> > > >
> > > > So which device do we talk about? I am not a NXP clock developer
> > > and I
> > > > care zero about NXP, so keep it simple. We discuss this one specifi=
c
> > > > binding for specific device which is called "imx8m-clock" - see
> > > > subject prefix.
> > > >
> > > >>
> > > >> The clock hardware path is as below:
> > > >>
> > > >> OSC(24M) --> Anatop(produce PLL with spread spectrum) -> Clock
> > > >> Control Module(output clock to modules) -> Video IP
> > > >>
> > > >> From hardware perspective, Clock Control Module does not care
> > > spread
> > > >> spectrum. Video IP cares spread spectrum.
> > > >>
> > > >>
> > > >>>
> > > >>> Why would you care about spread spectrum of some clock which is
> > > not
> > > >>> coming to this device?
> > > >>
> > > >> device, I suppose you mean clock control module(CCM).
> > > >>
> > > >> There is no 'clocks =3D <&ccm CLK_IMX8M_VIDEO_PLL>' under ccm
> > > node.
> > > >> Because in current design, ccm is taken as producer of
> > > >> CLK_IMX8M_VIDEO_PLL, not consumer.
> > > >
> > > > I don't understand now even more. Or I understand even less now.
> > > Why
> > > > binding references its own clocks via phandle? This makes no sense
> > > at
> > > > all, except of course assigned clocks, but that's because we have o=
ne
> > > > property for multiple cases.
> > >
> > > And BTW if that was the point then the example is confusing because
> > > the &clk phandle is not the device node in the example but it should.
> > > Neither description says which device's clocks are these.
> > >
> > > This is expressed very poorly in the binding, look:
> > > "Phandles of the PLL" - it clearly suggests some other clocks, not it=
s
> > > own, that's so obvious I did not even think of asking. Patchset goes
> > > slow also because of poor explanation, lack of diagrams and expecting
> > > me to remember your clock hierarchy.
> >
> >
> > Dario may improve the patchset in new version. But let me just try
> > to explain a bit more about the hardware logic, I hope this could
> > give you some knowledge on i.MX clock and we could get some
> > suggestions on next:
> >
> >
> > OSC will generate 24MHz clock to Anatop module.
> > Anatop module takes 24MHz as input and produces various PLLs.
> > Clock Control Module(CCM) takes PLLs as input, and outputs the final
> > clocks to various IPs, saying video IPs.
> >
> > The Anatop module could produce PLLs with spread spectrum enabled.
> > The Clock Control module just divides the freq and output the end IPs.
> > The end IPs cares about spread spectrum for high quality clock, the
> > Clock Control modules does not care. Now back to binding,
> >
> > There is a imx8m-anatop binding fsl,imx8m-anatop.yaml for anatop
> > and a imx8m-clock.yaml binding for clock control module.
> >
> > I think the patchset is to enable spread spectrum of a PLL globally,
> > not for a specific device saying video IP here. So the patchset put
> > the properties under the clock control module.
> >
> > For example, there are VPU_JPEG, VPU_DECODE, both will use
> > video PLL with high quality. So the clock producer just produce
> > PLLs with Spread Spectrum(SS) enabled, and put the SS properties
> > under CCM or anatop node, not video IP nodes.
>
> Thank you Peng, for the information.
>
> Do you think it would make sense to add the PLL nodes with SSCG to the
> anatop node?
>
> anatop: clock-controller@30360000 {
>     compatible =3D "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
>     reg =3D <0x30360000 0x10000>;
>     #clock-cells =3D <1>;
>
>     clk_video_pll1_ref_sel: clock-video-pll1-ref-sel@28 {
>         compatible =3D "fsl,imx8mn-mux-clock";
>         #clock-cells =3D <0>;
>         clocks =3D <&osc_24m>, <&clk_dummy>, <&clk_dummy>, <&clk_dummy>;
>         fsl,anatop =3D <&anatop 0x28>;
>         fsl,bit-shift =3D <0>;
>         clock-output-names =3D "video_pll1_ref_sel";
>     };
>
>     clk_video_pll1: clock-video-pll1@28 {
>         compatible =3D "fsl,pll14xx-clock";
>         #clock-cells =3D <0>;
>         clocks =3D <&clk_video_pll1_ref_sel>;
>         ...
>         fsl,ssc-modfreq-hz =3D <6000>;
>         fsl,ssc-modrate-percent =3D <3>;
>         fsl,ssc-modmethod =3D "down-spread";
>     };
> };
>
> This example only considers the video PLL, so to be complete, it
> should also add the clk_audio_pll1,
> clk_audio_pll2 and clk_dram_pll nodes. It is based on an RFC series
> that I sent about a year ago,
> which was not accepted. In this way, the SSCG properties (i.e.,
> "fsl,ssc-modfreq-hz", "fsl,ssc-modrate-percent"
> and "fsl,ssc-modmethod") would be added to the relevant nodes, and I
> would take only the essential parts
> from that series. This would still mean implementing the PLL driver
> ("fsl,pll14xx-clock") and its mux ("fsl,imx8mn-mux-clock").
>
> These clocks can then be added to the "clocks" list of the "ccm" node:
>
> clk: clock-controller@30380000 {
>     compatible =3D "fsl,imx8mn-ccm";
>     ...
>     clocks =3D <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
>                   <&clk_ext3>, <&clk_ext4>, <&clk_video_pll1>,
>                   <&clk_audio_pll1>, <&clk_audio_pll2>, <&clk_dram_pll>;
>     ...
> }
>
> >
> >

Next the series I forgot to reference in the previous email:
https://lore.kernel.org/lkml/20230101175740.1010258-1-dario.binacchi@amarul=
asolutions.com/

Thanks and regards,
Dario

> > We could have a talk on IRC if Dario, Abel and you are available to
> > discuss on this topic.
>
> Yes, I am available.
>
> Thanks and regards,
> Dario
>
> >
> > Thanks,
> > Peng.
> >
> > >
> > > Best regards,
> > > Krzysztof
> >
>
>
> --
>
> Dario Binacchi
>
> Senior Embedded Linux Developer
>
> dario.binacchi@amarulasolutions.com
>
> __________________________________
>
>
> Amarula Solutions SRL
>
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 042 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

