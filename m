Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98F5C44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 09:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSHGaIsWZ0YnveCWlqyCPygExtYlmBkZI3k+7sIdigs=; b=Gl8kdwZxEigjKtN05ppTPw0E0i
	M67tBVfaO9SQSCpWR8G+jTMeevYprysM5bGlrUGUpfoheE/P6Q+ulTbudvxYPeDwAv1TWjzRmOWQY
	MFbbdXgYUHaP/6vdPuybglZNg4aHYigrhIZhvvxg+oXa+ivSo1IvhBk5RDksUrKENuOMOKqbY2Fnz
	TFWEJD8bX8Uu/cPYEmrHx1HKGFvuJDdf055pCgJ/RaMU3IrhxbWd2idE6JAMFBTT9pjd6aWE54Uvw
	oVwDb/Of0wTWGXypScZKFsPytVooLpTlC6U2HbmvLqITINL9Bn/BL7c3VGLvACO42GqKa/x/n9KCr
	U3wAHFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUpX-00000005D8a-19gJ;
	Wed, 21 Jan 2026 09:48:51 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUpV-00000005D7D-0BZZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 09:48:50 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-121a0bcd364so8231916c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 01:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768988928; cv=none;
        d=google.com; s=arc-20240605;
        b=PVdPmdsID6uXyPLsO0jF0RbwYW+RT0oZehMhbQ8GffiHuZ88zH5IMGgzM3oyqhjJ1w
         M7a4NgKcTZ8lvafYlSlNxoXu2oFo5l5mR8T9zAR4fOJ7VxnZMwhCm6OWxCO6F8ZsVoTk
         GQIiWDysCanVCUQA4VogOFZLXLDyVDzubrMCYfnbqzu+CZCftpLkvEFS6Nujxl/ZkoMC
         HcYk52PFC3WOiJeJvfT3zSZvwvp903THrVgQ3BULUdoIvFQeWX1z2aEN+c7VkyNyeAgi
         KKfxsPPptVrkeCbRTCZxrcAWLe25q3oioLc5R/OfKpv9JD50GRVhuz3NG5AtNJY/RPts
         diDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GSHGaIsWZ0YnveCWlqyCPygExtYlmBkZI3k+7sIdigs=;
        fh=ItTUGNLE3p4dg+BHpYI2bYnC8FTeSQ29lMTHDcV3DZ4=;
        b=KmbpAM8ibks3OPt9kodffL9C33aReIs6aqty9UWOSLH6Y0FEKoqrjWkJS7te8f327Q
         2ybBWEHSDfSxlgLhnkkoiM9nTS3utpFZXRRjTTnlwT3lqCVW+3/b6kCMcQWUN1kyYfGt
         6dXZRdTaaf1A10Wbyi5I3hurVLz7IkL179RIvEbqW1CfKfdyoTH8K7Il55x78G7RqVHX
         8VvEYm4DtwjmOwEDxqk5HpM62oAnHXb9CBA6neBbfZtyX9WcDkHhdcH7PKo/yFK+ImcR
         hNhUodqGlHudTdettjOiAHhG6xBcCO0BFTwGr/bG/bdpplTAAPlgUfIfMHXK4JBB9400
         fcVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768988928; x=1769593728; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GSHGaIsWZ0YnveCWlqyCPygExtYlmBkZI3k+7sIdigs=;
        b=SsjJF1wSCGn/Z9A0bwdQEMfgbZuygqq+IH1fBJ2rdOO4rTEZ0AnHGMrH+OhiVSLR74
         CcYl8VffEjtSOwoAARf1g3hzZYeMuau1rJajxZNYq9qISrPqYkEnpmmUxrcEdY6HMdzM
         cHSUz113Mab8aQ6BFkXqgHoOX61eYnJoqwak5VgZZbpPdnQSoMEsynbMKzWPmgrOjbyo
         Ob1MqyS8WB6tKUnmGm8ipm5SlwUiOs4ELql9ODMF/6j8Medn0YAYksL98xI01XL2QLVH
         +rlVae8JFJKUpOVP8WIfCYNTzOxnla0ZKfivVOv3DbboLsl6Wjy132JfL/7Mbg8rORVD
         faUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988928; x=1769593728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSHGaIsWZ0YnveCWlqyCPygExtYlmBkZI3k+7sIdigs=;
        b=DHEc0HgeYivzU4npTfr38r6B0u1G68icIaPjADsz6zTTFOLq7uWbvvW+ECv/Nbw1RD
         4DpXBnCaFvamKhl+ehvtFKglt2pxI9th5wt+jhcDB8OvrA9tNK9feTtqQdKCeSqj4oQz
         NQAAP29tCw0biIeLqq1s8i4OrIuVo9bYRlMUSRhK6HA78530H32bO+xhLALYrFUwbSxT
         QXyfNg9ROeE8iIqn2cCj1pvnXesccyp6vnPUZtpX6sZ21RhryEixFvlVVWgcmG4bHNVc
         7Vb4gb1DWLoZKQRR9IYirsr6N92sDTSILc4iO2i4eqxi3dNNX72emqjwxpC0dHjL3Chb
         birA==
X-Forwarded-Encrypted: i=1; AJvYcCV9YvtY/6Odsp5rJhbQsPOnUt+VDO/9UEBXGWK3mgPLwizqQ9/qIZD95lfO2FqihyJ9tYWfgE2dagoOKBty5jW4@lists.infradead.org
X-Gm-Message-State: AOJu0YymNFDvnf/a1dcflvwaVEI9QKH+4NLlWIEkYpGNs2Usxm7u0d0x
	W8i7WaC3qVokXWaXjsYa+QmzAZkk/AZRkZ2Fxq1/+Ge+UxpIm0ycp3IITxUX1kVgB1fevWSzKvY
	ISA5j/V6DCtL++aFmccdxi6dwf+rA0pE=
X-Gm-Gg: AZuq6aJFMyeqhmDPHnstRFPSBYXpHPRduo2hT1q+qdB68fKAJKtxfLhpfDP099wqX0I
	eVqLoJinMU9xqWN3IWP1BjMaNekfp0jUWUWbodG43zC8EjT7mMn+fBRLXKiEJJglpTU2+HtGn8B
	0bbUyvXzKqRrioIxGejSPKjBMfpBnDUaqRFXzYcKgCIDTckFE7tHOpBxA0uF0/Y3vywaZmJQixu
	wLf1rhu2oQE547xhHaqEWxKfUsSaaS73ewEAReANDSBYD7TVuVHePGbnC6N1g8HTurfL4WJRjvq
	VENETkEs2voOml+EY0tdcepFQVhtVOW19d6GxROolmWwE5ZQjSmZYwqyhK8yR5iZp+TWiE/pAHW
	dKvK/jfnUJA==
X-Received: by 2002:a05:7022:1601:b0:11e:3e9:3ea2 with SMTP id
 a92af1059eb24-1244a791beemr14456344c88.49.1768988927959; Wed, 21 Jan 2026
 01:48:47 -0800 (PST)
MIME-Version: 1.0
References: <20260120102604.1989725-1-sherry.sun@nxp.com> <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810> <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <2394637b-f85b-47b7-ae30-f7ac2be49c59@kernel.org> <VI0PR04MB1211472ABF4E87D0323D5713A9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
In-Reply-To: <VI0PR04MB1211472ABF4E87D0323D5713A9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 21 Jan 2026 11:51:27 +0200
X-Gm-Features: AZwV_Qjqfx2U87Bv6XKadV2LQsP0YlPiUuwembG0uAps9TrGxLQ9lqFEOdimBZs
Message-ID: <CAEnQRZDCNXcAH7kBCPLJm2pPrJ9akXX+ZMW98H7MO8Hptjp3TA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
To: Sherry Sun <sherry.sun@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, 
	"dario.binacchi@amarulasolutions.com" <dario.binacchi@amarulasolutions.com>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, 
	"Markus.Niebel@tq-group.com" <Markus.Niebel@tq-group.com>, 
	"matthias.schiffer@tq-group.com" <matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>, 
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	"primoz.fiser@norik.com" <primoz.fiser@norik.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_014849_086567_EDFBCE95 
X-CRM114-Status: GOOD (  14.98  )
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

<snip>

> > >>> +              - fsl,imx93w-evk            # i.MX93W EVK Board
> > >>
> > >> Is 93w 11x11 or 14x14? can you add suffix to keep align existing one.
> > >>
> > >
> > > Hi Frank,
> > >
> > > IMX93W-EVK is the official board name, it basically reuse the  i.MX93
> > > 11x11 EVK board, as described in the cover letter and dts patch. I
> > > prefer to still use this name (imx93w-evk) to keep align with the board
> > official name.
> > It's second case, previous was frdm, with the same argument. I don't care
> > what you prefer internally. You must align to upstream and all NXP boards are
> > called soc-foo. Not socfoo.
>
> Hi Krzysztof,
>
> The soc name is imx93w, the board is basically reuse the i.MX93 11x11 EVK,
> so do you suggest we name it fsl,imx93w-11x11-evk or fsl,imx93w-evk?

As per my understanding from Krzysztof comment this should be  fsl,imx93-w-evk.
Like soc-foo not socfoo.

