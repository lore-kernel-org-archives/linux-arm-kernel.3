Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD49D2D8E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpxQmfY9VK7T+Y3W6DWNgC6rQuK+Ld0siGTt5w9irRg=; b=0etJNBlguA5DvXVpc/U4twmkfs
	R6VVLTrDxEipY/97ZIzdBsom+pUEadpM4GkiQZNg5mHBDQ2N1lo+s0gDjt6FzTspF4QOmX7LLGzUH
	S0Nq+7FGVJA9Br7/Eyc8HV+xhfO5dlpXgFTogybZRNX8Of7r/I0sQvV1uWBXmD8jnMaC8bK6RRZ6E
	1TJQMJ4BtIEW6ENjR4m8+3GVzigIyQnmkxXZv2d7hwoqOYUDbT+OKEGgYv57LqcNdGtr0hAEoLqn3
	u6ZVNlVeBCeD1zDY0vvGZUX/IBm0t+C+5q1vEbjFzrerG4FcnzbKN1NJpgTyoYaCbyaFGMU2/hGa4
	RdxNgp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfzc-0000000E1V5-0vf8;
	Tue, 27 Jan 2026 10:08:16 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfzZ-0000000E1Th-1U7d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:08:14 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-65378ba2ff7so8282705a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:08:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769508491; cv=none;
        d=google.com; s=arc-20240605;
        b=NvUznoaUn6ysGDCJhqjJVuNrbexJTO5LgEpc9p63q0SSfZTQGdukaqakz/gtT7XI0B
         Uh/Oqv7LfIGDaOgZHmlw3ZNXtJ370TEuX0dzXp/gFgCeb95uYYn5iPi21AeulGw+/R6O
         yKrAqaIVnHo7vVtgeVZQew5e8oCg2cA5fcGSVDWwIPvemLkmDn7+pPDvyp7/SK7rIo1l
         7i+Lh2egaUXq1ul0+TXL2rhDk79vXuq9S9MrHwHqRdk9IJIvJAOqn/aAWf1lCJnWGSeq
         D+C6mkkb/LI0UYWoddeFfhBkCJ5Zgfva345XPQbbplOCYuygQK+duToRp2NnYHnxbr3d
         DDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bpxQmfY9VK7T+Y3W6DWNgC6rQuK+Ld0siGTt5w9irRg=;
        fh=t/mCJwXTpkYV3G5MRt97+PqfGa5kh2wPI93hiSugcBU=;
        b=LWnAhwB8J01pj675h3Y8EV9Hjvj9jZpb9+CPhaTMHi871GmVn9iznG+iUbQOGGVOt1
         X6XxOLnp5GCzdJDYrZfRFy3KqVY0Ta4Ps8G5e3tFrHRw5KdmW30/oJsJ6nVNUPA+Uj/j
         KKYnt1NuXRueKCU5pkL8uuUSImxNoUhky3xGRoi1M1xMJSPLgRTuiYyLo3we/99MHLW4
         CbZp7l6NHeqSu/rUBB2dTaVnydt1D/K6SVVhkZy87Ln2zgyz4d15K0BQMq+PVNEk7AYu
         XRoH+CVuerw3NaHDEaHk7QQyMB5Fo77U7VVxEj20/stT+nBV4ZnrBfQ5MSUrwHEUZ9fC
         PVxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769508491; x=1770113291; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bpxQmfY9VK7T+Y3W6DWNgC6rQuK+Ld0siGTt5w9irRg=;
        b=aVSSXOGel9E6hwNsNG9fePrBVGRlZ6QNvKhq4b5zx135d8Q0VE4mHoRgr3c+MtkuvQ
         BnMOGLcMXSqG461GBKezdkpLCmZMVPr58GuRd4T5LIjNds+xLMihqHhc9CV2svf0znAE
         ppSUPaMCjBYVyYaqIXw1fAnUexgls3T7bzCoXntADJOPZwJo33wPPb5x9OPeMCnUDdXU
         MuHSCtuazRAwELuyR9Tf9G50I9qTGUUBBAFshPTlqWJcLf5X+n7/4vA1W9SW+J6MqNmA
         zSMuWIf633AWNvT/7rkaVovG+TIQnj7w+XHkOw6q7e5L/Gt/2F3N6Jz6c0EaSBsfGTdM
         C2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769508491; x=1770113291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpxQmfY9VK7T+Y3W6DWNgC6rQuK+Ld0siGTt5w9irRg=;
        b=S35c3AU26PvFDeJeLzJzvGfWL16e1Enyet6qkjrjZ8q1ZLT+WOgAeRWFly4Q+7x7CM
         YnX5Ju5BddLSLXLeMaJ+eBZ+1jneuMovZoxSWlqskatX5YOIL3XoPYoXr7Q/XFwNvO5T
         mlad+VrP3J2kgT7FDEbNWzBbqXWPbVsTLCHnlgP6WXnx9t6vZRi9l8xigKudpmdUNiK7
         YqSpiDxmLcgrJ81GU/MRUqYhzZwC2d/TBtvhouvtOIVppNRbme+zpI/qcWQ5ZHt0QeZg
         tgLlEu59HSpUSbdJyoO6rSZvDG1mFhxUV0tpgsk3n2ofIO36CL1cauFPwilmZA1aot6Q
         dulQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7nICrKfDyGCo0rolQZZrepZUr7SohrZs8HbhQ0JWxWpMv6SqBwmRe/++d98r1UYlliG8dsrZNs0xKNzBLlVJv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1C3ILfbvkbnYqeSKKH+y8zBF25DS48bdm+97bQDMVURL2GKiS
	ODAtQIRJyeOEBuNr9wEc+qfbmYf8DjLFAcNRDvA2HJQ2ruAh5Cj+lyDzn45PUPLpg1rOwLZOXM3
	hnuPfycjiqlJ75z66DQTHqow6RojddMW4/v88YI0D4g==
X-Gm-Gg: AZuq6aKNHLAzhbv1vHQZ0spxa8eJ0lC/zeOCShmogXf0tlTL25jdgPvc6Tk15diT0lF
	ruxI+1i0WaCNPZtVNHerPeSEy3FKIk5fJPuz/Q3Cv3hzK9wv8pHzAwzn07v36OvA32saZLl+Bb4
	tYJ0ZP+bBr7mdvZu9NzLAqTm+QfjmTeloOyEv7/henIbOMf8gcy4xCk45DsX/OZhZ01r8c7Oi2U
	KgOpxTh/9CRUyySuK6FvJhV+ZTsxwXfSwt0ysJIckciUIaWbJVK90MCKiaJcIRIR/AkROwh28Cz
	hMSaET1OiYFQ885205XAj6qQ
X-Received: by 2002:a05:6402:1d50:b0:64b:6e44:217 with SMTP id
 4fb4d7f45d1cf-658a5f8e7cdmr891417a12.0.1769508490979; Tue, 27 Jan 2026
 02:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-3-vincent.guittot@linaro.org> <69592713b7bd419e23df458734ca78070a83e8ac.camel@pengutronix.de>
In-Reply-To: <69592713b7bd419e23df458734ca78070a83e8ac.camel@pengutronix.de>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 27 Jan 2026 11:07:59 +0100
X-Gm-Features: AZwV_QiOrd8cMHRoDNLhWiUkjdTQ9Am6xMiRSspZlgdv4qBzTDeeYROI1wjEMTk
Message-ID: <CAKfTPtD+EZ+apAnS7tccY5UrQx3EWXb4j33F_5SkHY80akxz-A@mail.gmail.com>
Subject: Re: [PATCH 2/4] phy: s32g: Add serdes subsystem phy
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com, 
	linux@armlinux.org.uk, ghennadi.procopciuc@nxp.com, 
	bogdan-gabriel.roman@nxp.com, Ionut.Vicovan@nxp.com, 
	alexandru-catalin.ionita@nxp.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_020813_405651_F4CF8088 
X-CRM114-Status: GOOD (  17.62  )
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

On Mon, 26 Jan 2026 at 14:11, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Mo, 2026-01-26 at 10:21 +0100, Vincent Guittot wrote:
> > s32g SoC family includes 2 serdes subsystems which are made of one PCIe
> > controller, 2 XPCS and one Phy. The Phy got 2 lanes that can be configure
> > to output PCIe lanes and/or SGMII.
> >
> > Implement PCIe phy support
> >
> > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > Co-developed-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
> > Signed-off-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
> > Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Co-developed-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
> > Signed-off-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  drivers/phy/freescale/Kconfig               |   9 +
> >  drivers/phy/freescale/Makefile              |   1 +
> >  drivers/phy/freescale/phy-nxp-s32g-serdes.c | 569 ++++++++++++++++++++
> >  3 files changed, 579 insertions(+)
> >  create mode 100644 drivers/phy/freescale/phy-nxp-s32g-serdes.c
> >
> [...]
> > diff --git a/drivers/phy/freescale/phy-nxp-s32g-serdes.c b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
> > new file mode 100644
> > index 000000000000..8336c868c8dc
> > --- /dev/null
> > +++ b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
> > @@ -0,0 +1,569 @@
> [...]
> > +static int s32g_serdes_get_ctrl_resources(struct platform_device *pdev, struct s32g_serdes *serdes)
> > +{
> [...]
> > +     ctrl->rst = devm_reset_control_get(dev, "serdes");
>
> Please use devm_reset_control_get_exclusive() directly.

Okay

>
> [...]
> > +static int s32g_serdes_get_pcie_resources(struct platform_device *pdev, struct s32g_serdes *serdes)
> > +{
> [...]
> > +     pcie->rst = devm_reset_control_get(dev, "pcie");
>
> Same here.
>
> regards
> Philipp

