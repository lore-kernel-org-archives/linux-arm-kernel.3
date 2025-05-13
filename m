Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36D6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVXXOZH7f0B33E9l5ZVHSDML8IjUVWi8Sv90AwCRorg=; b=WwfPRM90DH+Gq+BQZhjyQsDpuG
	kTTKc9l4L1HQMfd5Sm/bB/5dhmtGPnf3E1uQaxFe+P5usUhIzhVjgqLnVcw60blYePSoq5KUs/4Oh
	u5qM57I+TMW3IFIS7hQFl2+6BquXn/xtp1miU7LrZu5k1sdHP6BYoAw+JFpw2+rgY1gsQMLLtWU7i
	w+h6mfOIDYTAX4BcePGNP09Ld7R9FdMGiKJV8DI0Ue9NWljhGrKoV+bj1aM1n/usTBrJDZr/bbdco
	Cd45LO8YK4naI1XhGnDoBKHlZlmajmjU0nH9oTKUr5GUaHDPR4GE7sBGv7y0JhiVXQCdRezM/E2Mp
	0NP65MIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpf8-0000000CUEJ-2gyl;
	Tue, 13 May 2025 13:27:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpd0-0000000CToU-12uM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:25:04 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ad21a5466f6so807902466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142700; x=1747747500; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CVXXOZH7f0B33E9l5ZVHSDML8IjUVWi8Sv90AwCRorg=;
        b=Jie5MPsNxd8ceUH4EqN8z79+OUEz+xl+WSAFOfxf59zM33cGFz1nEa7FiefylOmcU2
         tKJSjhJAy/oWQfp1gM46ReLyn4GpxqsOuZhiD7qV6pE2qbbBREpn7CSZz0ONc0XQ4Ay/
         h8gXHZ/Syhz7nrfWFtSv6tM/jEjHeGbClKwhX8/iFJTEvxOorBhVboifi99sqLmHHV+s
         3CQQ0DdMBhPUgK0whL0UnBT9Orkl+ouVMb04lXhiAGF/ovmZnaxwXVYY1EWPyn7ScbSh
         qDeoe9GqdtcOHk/hr6G4pmW2vXLik713evnRs7fyvp/7aXHjT+/urwZhIIee/+pISIVf
         3Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142700; x=1747747500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVXXOZH7f0B33E9l5ZVHSDML8IjUVWi8Sv90AwCRorg=;
        b=qkmygBDqi7VSSTqe4wzbdQUoXU4tA8lJgyUpAy7wDH2On9Xp6r7xAUdCPdUOkT/+7N
         7nPUEjNH8LKqre0/yEHiYInZUozAY3NBSmSt7LCIN69LzXL5j85EGb+1Q5IodYCCM16j
         TT+GLr7UkexowPwIwqM5BMVcQBQX8nIdEHbAryeP0uMvoBa4Rs0iBA1MQe8xeYVYPWdR
         OP5MQcluS+FNsHx2FksjIQHossERIbPDj3ZWTJIRZ4fJrw3CrgMPY/BF8xewuJRZLwY4
         e8A5noWXCmRBO5NVyQgp01YG2p+2kgpWS0YyvotiLsbDl6bwReyElAS1Ns9Vo+w6j1/6
         ZeSw==
X-Forwarded-Encrypted: i=1; AJvYcCVp5b1cFlpHeBMcoNVZ3pJ8nkMwt3r5a4i3R5y7s7+AS02Tl9hehS5iHZ4Bb9NyoGkThzv4bU6Bu9UIZfbhyUAz@lists.infradead.org
X-Gm-Message-State: AOJu0YyLmAGgxRVgRRMnKxQ6AvnsrvPZL8BMHlS1CmF/aTAav3f37T7F
	CN/pDWk5XXMj0JwSPW6VS8kutYwmft3MMc35v1L3SfUZ4Z/eEQxg0e6WGrXJ1cE=
X-Gm-Gg: ASbGncsRT093d1tihuC8Z8utnR6Xegnepr5I4HbdcqiZ6G9AMy7YgIOVr1QdkHYEgmW
	igxqYJnD7jHQju3vb0GCAcl6ldEfcJa9Qjhe3n3lr4DRgDV1u6Flh5LdVv3ScLvVpju7vI/UKdy
	eQA1dnz9uykpgf4ahVvCVnWKQCJ8UwaXCrF2MNOlThAcHROpXNfgPafUw5vAyAVksehpnbmYc5S
	5WHisjOkQ5uVO21s/lO6yDTtea399VfsIV5mvr3nOiL5eW+cAXEWIrpNtplJ6+JS8vVHDDEWtWZ
	gpLdrXtv5KqJ49m4MjPLQj1FFkxcrSUpiADWEj/+6Z/BfOLlK6pbShVLsc0=
X-Google-Smtp-Source: AGHT+IH4q71GfWDFPWIs43SZZ2VdNWpSIEScBi0c6x4nUnbwHEPiOXUunt+jRyisi7xmv6r4dIDz9Q==
X-Received: by 2002:a17:907:7e84:b0:ad2:3d34:e2a7 with SMTP id a640c23a62f3a-ad4d4e211abmr343040266b.14.1747142700043;
        Tue, 13 May 2025 06:25:00 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2198505fdsm774854166b.168.2025.05.13.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:24:59 -0700 (PDT)
Date: Tue, 13 May 2025 16:24:57 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v12 16/19] dt-bindings: clock: imx8m-clock: add PLLs
Message-ID: <aCNIKZrJmbpmeX+7@linaro.org>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-17-dario.binacchi@amarulasolutions.com>
 <20250509162546.GA3704130-robh@kernel.org>
 <CABGWkvq4a73hvCWG-P_+arc3R-pnr5NVfcGPDTGEoW1doPt2qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvq4a73hvCWG-P_+arc3R-pnr5NVfcGPDTGEoW1doPt2qg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_062502_301755_89AB7D47 
X-CRM114-Status: GOOD (  28.51  )
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

On 25-05-09 20:22:18, Dario Binacchi wrote:
> On Fri, May 9, 2025 at 6:25 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Apr 24, 2025 at 08:21:46AM +0200, Dario Binacchi wrote:
> > > Though adding the PLLs to clocks and clock-names properties will break
> > > the ABI, it is required to accurately describe the hardware. Indeed,
> > > the Clock Control Module (CCM) receives clocks from the PLLs and
> > > oscillators and generates clocks for on-chip peripherals.
> > >
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >
> > > ---
> > >
> > > (no changes since v11)
> > >
> > > Changes in v11:
> > > - Fix conflict while rebasing on master
> > >
> > > Changes in v7:
> > > - Add 'Reviewed-by' tag of Krzysztof Kozlowski
> > >
> > > Changes in v6:
> > > - New
> > >
> > >  .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
> > >  1 file changed, 21 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > > index 4fec55832702..e83f08abd44c 100644
> > > --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > > @@ -29,12 +29,12 @@ properties:
> > >      maxItems: 2
> > >
> > >    clocks:
> > > -    minItems: 6
> > > -    maxItems: 7
> > > +    minItems: 7
> >
> > Increasing the minimum entries looks like an ABI break to me. The .dts
> > files not being in linux-next confirms that (from 0 warnings in
> > mainline):
> >
> > arch/arm64/boot/dts/freescale:859:50
> >     122  clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
> >     120  clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
> >      61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
> >      61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
> >      60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
> >      60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
> >      36  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
> >      36  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
> >      32  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
> >      28  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
> >      26  clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
> >      17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
> >      17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
> >      14  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
> >      14  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
> >      13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
> >      13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
> >      12  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
> >      10  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
> >       8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
> >       8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
> >       8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
> >       8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
> >       8  bcrmf@1 (brcm,bcm4329-fmac): $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'
> >       6  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42], [43], [44], [45], [46]] is too short
> >       6  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
> >       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[43], [44], [45], [46], [47], [48]] is too short
> >       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[40], [41], [42], [43], [44], [45]] is too short
> >       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[36], [37], [38], [39], [40], [41]] is too short
> >       4  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
> >
> > Please fix the binding or drop what's been applied so far.
> 
> Abel and Shawn are already aware of the issue:
> 
> https://lore.kernel.org/all/CABGWkvqfyH=dcuw6EDZaFVVebj8SZhJF0P944+mmzL5YK3-Pug@mail.gmail.com/

So Shawn suggested I pick up the dts patches from this series as well.

I'm waiting for another -next to get merged and if there are still
issues, I'll ask Stephen to ignore the pull request I already sent.

> 
> Thanks and regards,
> Dario
> 
> >
> > Rob
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

