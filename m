Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1CBC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nANItJ3n9rHzK0lPnEVgoGoN0BgH3bisoRcHmb6FsOY=; b=hCEn5Z/Zm3GzB9sWPIhPgYB33h
	2DeKGqIv/vkA3k1IoiQLd2mYRZrDxp3HrqdLOxicr/5mVEqYNlSU+k+mr9vBDP0f7HPhCnS3RT3jf
	tOJcjstWgjcYAXE97C6WGUAfN9KRJbl7TEUGr6hG79o3bvT9W5NYOHsMFkUONvHdQKpZZfvsUyss0
	EZPVjt+xRW8Wg5JJUELe7cZCZIeFT6/WhZSMw3mwjzAMLEdwHQ9RPZuKyaf0zLRW0B01ntyetlS3U
	x34Ajz9Y27q2YyPNqcpdlC3a0EsKxab/G0vnARGTP/bWS3to77RFWDXlGsyuJ61kBKqQpGdI8nkyz
	nzT61fpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrv4-0000000DwWE-2wgS;
	Wed, 04 Jun 2025 17:28:54 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrqv-0000000Dvkl-0JTx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 17:24:38 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e694601f624so100595276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 10:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749057876; x=1749662676; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nANItJ3n9rHzK0lPnEVgoGoN0BgH3bisoRcHmb6FsOY=;
        b=LgwW9kcFVk2/cXfJ+qYcjPlrmfFarDVkKoxrMhlmE7IVdylDwxMZ5xitFAktMtWA5R
         cuZ1v53Mpgj1Kj7GsBbG5FfhWZ/YzTst61VLu/kGRRyxa29ZRbA/1Oy86fBmVvSasYOx
         PHUf5MFKPO7Ldjvop4SzPCd9c7BaEgG2BySv/dYqQDJEF0CLMZ1mUXH5oz93WnnBEvwN
         /JwG4gAE05wrGJM019LKBMthtGCNEL5abrnxlaBAK61hF2qPD27SYWuQsprIlsW0hrfx
         hH1709ND2jPmDLUbfyp8L0/x30lVfAM9KEoOGBbBbf+GxjHLF/yMrOtuxnOHB0xyLTiJ
         UN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057876; x=1749662676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nANItJ3n9rHzK0lPnEVgoGoN0BgH3bisoRcHmb6FsOY=;
        b=cPO8XuLO1khdvvSIpW9PISHkFBMYIIRKDMkFntQAdklaa6cuO8zDfEdxRJhtP6izQY
         NvXmaHjEo/vqV+6difLCbj0eTUZwAznOapnvPRGcAjXq6XxF/2YIJZ+n31W8kditNM/r
         LgpT2Y56a6WPfUKdT3gQ7N+0kslVOrw9CEnTipMRNVnS9DsYNYLksuvx8xSLXj5ZFQUQ
         TNUwzwj/AjTYS4yQXRZbeFfIROoKNP0fn8eGMiKAAU82QaKWkgNNOD1nDvhtWMStVgon
         IxOtOyd2ElMz89sas68oO+B6PsQgmoWU6v00FjtgdY2Xk1AdFsgo7Tz/QMXjDDVqkbZz
         Kb5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCMYb6EC7QaX/a43K5l8OtpAuRJu7BouAqVtJEzDwQKK+2CXu+TWq0J9llXgXlfnVh3kIUq6OdW9UH4MwoEVPM@lists.infradead.org
X-Gm-Message-State: AOJu0YyCtRcCPx3GKuiDqHmx8FQFQu80aTUhrVPMyoRPziElh5drJCjJ
	JHNKsaaBFC8UI5dwJG6FYUY8CCMPMdj52uoy+YDX0/gwVZi5bFXJSovOnBJnfasSLo8RopGfHUz
	t91vcU3O9kEMd05stW51VfxV329lrysM=
X-Gm-Gg: ASbGnctyu2DGU/5CHNZYGb7eZshCCB8rJU1A+751Bd/LMHS2Bg8+1ixhCbOP3H/qoS8
	pZGA7+PL4kwOlsKeDLyuvGiohIbbKHZ2gDwhlYHclBbdeLmdiWkMoSUX1UpY2LoiyqQAKo+tlJb
	+tHbiabklNA7jV4X3m4zOf246NpQqLHn4JqAJ4lx2I2w==
X-Google-Smtp-Source: AGHT+IFqkrIQksf+ZagsLNKprT5D9Gkx/ZIPUPXWNL3tQVC5N49QOKwKG+17ubQNHdTkJZuEZwnE8mYB9j3MltCsOrE=
X-Received: by 2002:a05:690c:4988:b0:70f:87c5:5270 with SMTP id
 00721157ae682-710d9afc82cmr54862237b3.19.1749057875817; Wed, 04 Jun 2025
 10:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250604153510.55689-1-stefano.radaelli21@gmail.com> <92e4de77-07da-4583-bf0f-46891101c327@lunn.ch>
In-Reply-To: <92e4de77-07da-4583-bf0f-46891101c327@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 19:24:19 +0200
X-Gm-Features: AX0GCFsi-0DPQCLx4D-kw5G9NJPOyVhmZhQWfWIPFkfSiLFQtS5JLkD2hBDD0uQ
Message-ID: <CAK+owogo4+R+DM9rM_-ZqKRPX1wV6Vhdjrh6KWM71pqjQpYNuQ@mail.gmail.com>
Subject: Re: [v2] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, othacehe@gnu.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_102437_119531_C449B733 
X-CRM114-Status: GOOD (  11.05  )
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

Thank you Andrew,

would it be ok to add your Reviewed-by tag in v3 after applying also
the corrections suggested by Fabio Estevam?

Best,
Stefano

Il giorno mer 4 giu 2025 alle ore 19:16 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> >  &eqos {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&pinctrl_eqos>;
> > +     /*
> > +      * The required RGMII TX and RX 2ns delays are implemented directly
> > +      * in hardware via passive delay elements on the SOM PCB.
> > +      * No delay configuration is needed in software via PHY driver.
> > +      */
> >       phy-mode = "rgmii";
>
> For this part only:
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
>     Andrew

