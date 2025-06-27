Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28018C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siWhviHf5s5kb5i61JeksO/RFhcaUxLVRTQZ76XuioA=; b=2xPRkBbKvl4qfa1jelf7WKxhj9
	csrOtDnE2eYADsBnXdRoLIvMlLksTi/o8BPrOer7lOXZDtrowWhsDO18z7dT/V7AlJqJgRvTkzjn3
	TsmIk1CrZodoafp0PSYlAG+ChNaT/7ZOmhfhuaO+nEjEdWq3oHhEEErb/NJ/O/taEuvdn1LXqMrBD
	v41OJbXbdTg3yst9vrcMYtbbzz9pPCN4lQ8MkR+Rh6HixNlpbA+WDIwS9x9wyZXekdhH7FZwPw08i
	6Koh4U1ujsjtNkTG1O6YYX7kSOxK782rVjc9rfRLgPFNB1yP8lhd9lNJVEFisqF7oxbstnYiYecJ7
	OYaj98yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEmk-0000000Fdkx-00j8;
	Fri, 27 Jun 2025 19:30:54 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDzV-0000000FW2m-1uLB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 18:40:02 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-73972a54919so244277b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 11:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751049601; x=1751654401; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siWhviHf5s5kb5i61JeksO/RFhcaUxLVRTQZ76XuioA=;
        b=bFN8/CPZsEeeKwEdho8E7ilpC2f0pZNiGeeq0GzRG5LFIMpdSjtpkZnqiWN+OHvDT3
         GgU5AiGyw6rD0a+a6TBYWaHKVAaRq6czZCjxzW4SLvjupsGjaEr7uNDUfWx4VDrIo6Uz
         Gcroop1LnNHqQ8OLvy256vghYcDZDoI36KfDJd96tSKPMZmEJE3dxdBo0+rkddfZhqCB
         8KWN3EmBlPeGsm2utvFLgRyXq69GwsPVmoMSUqNtHTaWQdjh//sooKtrg2pzBxKUuwux
         n0SC1UoVrY01tynEljAE3Mw5PVyi7H1s390XGeTFVGbfVNx0PEnvxR2b8YddPhPP5Yeo
         A1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751049601; x=1751654401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siWhviHf5s5kb5i61JeksO/RFhcaUxLVRTQZ76XuioA=;
        b=csLv6SQd1B+hOeHQPdyWvJ3H85jO0hBTCQixVRjodiuc33MlP3Kb+zvnySQ9XSLnHD
         sojIXHv2rE7LuAnIune6C486tJz6u1+PEkN+8ME8bGioUsOZZSyEEyOfiRXtKfJMgeVM
         0+60Aa3lzewDEdA7PveUaBQuvSAgI9RIbjwr9H1JbYH+LgGaMGIMxQ9pu72vfNhXD7eK
         /ZCsBekdARnbpvc1TbRnaVjcdqZ5jxvLJUwYqweL/LAhPuaNRblFRdfQx7xOGM50GVpA
         RlluSLrkcTTPzMaEXqHQzJtvssm6mSnPdcAVNWBmnoVhCCT2GrMQfiOt4MrzUnPgqi75
         fx7Q==
X-Gm-Message-State: AOJu0YzEKvNzTxYjdHsB98WsJu45RLl/vcgrNzwPuA//uuixedmSf0GY
	4GBF/K2jszDq0qD2wKdR62ataFsJ/Fwy5TASwbYlphU1IM4u6XuhDvWphJ1SIGIB7u3wI0+SdG+
	aaB8/Hh+1YVt4qacb37NAjlMGoHCf6OVjut5O
X-Gm-Gg: ASbGncs1rc19aN/B3/ykfBB6C/geEdLayWocGwquawwJy5lDyHzTOJApSBbvzGUYTEl
	ZHCJICg03hSp4bw4J6YX13jLS5+CU06G0I3Dso8xx7k2gIwS6MA0RhDUrHhpBKvRfINY9jRB3Hy
	HRfBtiQ/WPuR0loMf2U1U+ETnuXpJncQ0H3k5kI4BvKuw=
X-Google-Smtp-Source: AGHT+IG7DXpgyz78HE/l0Kl92IMNPGEMkpBChVBoXCc4zEE1USg0kAy1xclBltkrt4z/w0HTXdSmRFpCE0CJy5cjrH8=
X-Received: by 2002:a05:6a00:9283:b0:736:3979:369e with SMTP id
 d2e1a72fcca58-74af6ee09d2mr5846339b3a.9.1751049600545; Fri, 27 Jun 2025
 11:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com> <CAJ+vNU0caeeC6in5dO_jkkbYNAnTL7drBZcmNBsstbrPWqUkHw@mail.gmail.com>
In-Reply-To: <CAJ+vNU0caeeC6in5dO_jkkbYNAnTL7drBZcmNBsstbrPWqUkHw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Jun 2025 13:39:48 -0500
X-Gm-Features: Ac12FXwEbq0LZniaWzZz7izf_58TqugWsShMRtxczDzTY_dudWpf8_R6poipXQI
Message-ID: <CAHCN7x++XGXu6DsPaOc2EpAbxzy+RZbDq5A5-j5a4roGDhv4fQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_114001_496580_A331627A 
X-CRM114-Status: GOOD (  27.35  )
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

On Fri, Jun 27, 2025 at 12:56=E2=80=AFPM Tim Harvey <tharvey@gateworks.com>=
 wrote:
>
> On Fri, Jun 20, 2025 at 2:52=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
> >
> > The reference manual for the i.MX8MM states the clock rate in
> > MMC mode is 1/2 of the input clock, therefore to properly run
> > at HS400 rates, the input clock must be 400MHz to operate at
> > 200MHz.  Currently the clock is set to 200MHz which is half the
> > rate it should be, so the throughput is half of what it should be
> > for HS400 operation.
> >
> > Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini developme=
nt kit")
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arc=
h/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > index 21bcd82fd092..8287a7f66ed3 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > @@ -294,6 +294,8 @@ &usdhc3 {
> >         pinctrl-0 =3D <&pinctrl_usdhc3>;
> >         pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> >         pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> > +       assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> > +       assigned-clock-rates =3D <400000000>;
> >         bus-width =3D <8>;
> >         non-removable;
> >         status =3D "okay";
> > --
> > 2.48.1
> >
> >
>
> Hi Adam,
>
> This caught my interest. Where in the IMX8MMRM do you see this and
> would it also apply to the IMX8MP? (You've patched your IMX8MM and
> IMX8MN boards).

My 8MP board already appears to be running at 400MHz, but I did check.
The reference I found was in the 8MM TRM, under 10.3.3.5 Clock
generator, there is a note:

CLK is different for the SDR and DDR modes.
- In the SDR mode, CLK is equal to the internal working clock (card_clk).
- In the DDR mode, CLK is equal to card_clk/2.

>
> Have you encountered any issues when running eMMC at HS400 due to this
> or is it just something you noticed in the RM more recently like with

One of my colleagues reported that the eMMC was running slower than he
expected, and I looked at the reference clock and noticed the 200MHz.
He asked if it needed to run 2x that since HS400 clocks on both edges.
I looked it up and found the note from above.  When I increased the
rate to 400MHz from 200MHz, the throughput doubled. I also noticed
some other boards, including the reference from NXP had the clock rate
set to 400MHz, so I don't think anything unreasonable.

adam

> my recent patch that lowers SPI clock due to an obscure RM note [1]
>
> Best Regards,
>
> Tim
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D=
965976&archive=3Dboth

