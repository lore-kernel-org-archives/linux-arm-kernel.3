Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E1BC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pw+Y5BshWhNb94U5zV1jdIqM6Bb94uu0DoTvWRycrlQ=; b=jcg+ZdZjazpDxlZj6TeQEgriCY
	/iRQR7XyVg8KnlOZBhA5fNOxwVBy7Do2iO05wD7WwQ43PtUkc+yxgvcFSQxNjxWN5ZvGdFrYXerfG
	YL/5kc2gV3kwwWz6/bDjmb1G/zyJcl/B7WseshuLML9VcDxnBejbUccSQJTJysrKzRO+6wcYly8NS
	WyMhvgwCiu/5K+cerWK1YNVyNvqeXRKuq2t+hjLEZ8XxIZ8VN9LK18TtxqZOgkec5aiZVmZeuwZAT
	pqQ6HJbdo95J/s6rTGS1dYXW2GJ6BZE6s6fGMx5GEXOHwKNGcbw0M1X7oLr9CWP3k4P8afNYXFb03
	jl3xzcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM02q-00000006wwe-147U;
	Mon, 02 Jun 2025 07:57:20 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM00c-00000006wgN-3jhC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 07:55:04 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso7893913a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 00:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748850900; x=1749455700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pw+Y5BshWhNb94U5zV1jdIqM6Bb94uu0DoTvWRycrlQ=;
        b=PYbD6t4nGke1QuAkK9EQMvdbp1bR7jEaqHsA+64vwBh1nq6klCU199yNU8B7n+xpN0
         2s+ps1hu43E+2Zh05eO2/V4apIVff4bDy0omYEAH/gcmx7l0X7Gu8Of0JBEiRDgTgb8V
         2z0WEjFx72W046svhK4VDgp8sX2oKrTAoXaqm/zQtxDmqc55Pt/GPOEvrFD+koxB4MyG
         n6ffeU091caxZWJHZ62u+uXwttRU0EYeZYqwV4knPCnDHRV31awg4/uTVM2y5Z3dK34r
         YviTZwBIzwEZE/rsRjmChGCylMhlE/0jK50ysX02TMZhmJZqX2hIXsUwqbOalSlAmWHf
         gtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748850900; x=1749455700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pw+Y5BshWhNb94U5zV1jdIqM6Bb94uu0DoTvWRycrlQ=;
        b=O+QovXdXvj0qVhEVPkneJIb5wEWBy3bEgDy4LEO2XVooopB9VWAMv28Wd/CfUaUzOM
         KoOa8aJg7K2SPYiNhvw/YywYf0G+IXjXI8xxnC0X7yOE/c1duzbguWrmEJFFIeKhsgmW
         9LrtWWj9kdoJJ3sw5oKbI1R8N2QFNmzv84N9Fg+elMnWui7cLWZ+AvsT0IzZKc+/doKQ
         DjXNEqN1wEPlBojf81sKrKiD0GKTYYF4kgwRfgEEydIcPtXczSci5GENhcojzs/Vk50R
         JC1ahR385lXTPiZ65fL5uV8aKljKVvbTKufQnU02boetvog9DOyapPaKgWJs4rfhR/tW
         5uzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTBwR8ktLS/Mg6K6I2E1Vs0bgEYg+/xIt2h5vCjnc0PETPOi3MZ0oLeKEkc3l8y575wkyQp4KqKbSHLni2xFPT@lists.infradead.org
X-Gm-Message-State: AOJu0YwVXH2XGr79gf0ij5hJvDFpU38C3x7dt2G0lsK1XhK8LL0XYuPH
	I5dGavG8DyAZ0MTFqrYJeSHROFeD/kJ8MDu6nYvkHaBYugK7b7qv2AY77z7yQrXTRgE=
X-Gm-Gg: ASbGncumnAC42q+k+i1tSFce9EDPZr72VBma8F+ctv0xI/H/JjxaMc2tQ3wNkrQnZ/F
	yVZ1uwCs0TqPTPJeIG0ZF4gKKCW1TPDB+zEFsjN6e951wRlXAuI1pDFEORsFa93MmCuBmv5lk3D
	TEe7HXDFocsy4BeU+oBEzX3kUvb9thEc8kepPRTteEYE8k32KtwAtP2+IqfiFKF8/aOV03oAq5t
	TD8y83pdGUjN4pcNUW5CIb+kdym/VR6afd36DORZed+W7TVDHGJdj78vS+Kx3jMu41XglkW0ksk
	CJFRan1bwIvNhPQxFenGZu1VEEg8WklmsaDtILvFYw35w5U2R/LAiL4tWZKB7X+JlneZe+Rzb/D
	6MNWgVRxG9a2HdC76fHmoNg==
X-Google-Smtp-Source: AGHT+IHF9M9iH6tYPPh5MIhkY3Ci/eDAulcraBxUrXh9olFXnZZZyiItNIM7oMxNMVOCoyclD4K34g==
X-Received: by 2002:a17:907:d8f:b0:ad8:8eb7:1c7a with SMTP id a640c23a62f3a-adb36c0767emr1041585566b.52.1748850900474;
        Mon, 02 Jun 2025 00:55:00 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045bbsm749892766b.118.2025.06.02.00.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 00:55:00 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 2 Jun 2025 09:56:36 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"derek.kiernan@amd.com" <derek.kiernan@amd.com>,
	"dragan.cvetic@amd.com" <dragan.cvetic@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v12 0/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <aD1ZNAeB4tpMNTGZ@apocalypse>
References: <cover.1748526284.git.andrea.porta@suse.com>
 <0580b026-5139-4079-b1a7-464224a7d239@kernel.org>
 <aDholLnKwql-jHm1@apocalypse>
 <7934ae2a-3fc5-4ea2-b79a-ecbe668fd032@app.fastmail.com>
 <0e154ae3-e0ab-4a4e-aa39-999ea1c720ed@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e154ae3-e0ab-4a4e-aa39-999ea1c720ed@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_005502_936984_F6A09F4E 
X-CRM114-Status: GOOD (  31.24  )
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

Hi Florian,

On 16:46 Fri 30 May     , Florian Fainelli wrote:
> On 5/29/25 23:03, Arnd Bergmann wrote:
> > On Thu, May 29, 2025, at 16:00, Andrea della Porta wrote:
> > > Hi Krzysztof,
> > > 
> > > On 15:50 Thu 29 May     , Krzysztof Kozlowski wrote:
> > > > On 29/05/2025 15:50, Andrea della Porta wrote:
> > > > > *** RESENDING PATCHSET AS V12 SINCE LAST ONE HAS CLOBBERED EMAIL Message-Id ***
> > > > > 
> > > > Can you slow down please? It's merge window and you keep sending the
> > > > same big patchset third time today.
> > > 
> > > Sorry for that, I was sending it so Florian can pick it up for this
> > > merge window, and I had some trouble with formatting. Hopefully
> > > this was the last one.
> > 
> > That's not how the merge window works, you missed 6.16 long ago:
> > 
> > Florian sent his pull requests for 6.16 in early may, see
> > https://lore.kernel.org/linux-arm-kernel/20250505165810.1948927-1-florian.fainelli@broadcom.com/
> > 
> > and he needed time to test the contents before sending them to me.
> > 
> > If the driver is ready to be merged now, Florian can pick it up
> > after -rc1 is out, and then include it in the 6.17 pull requests
> > so I can include them in the next merge window.
> 
> I have applied all of the patches in the respective branch as we had
> discussed with Andrea and also merged all of the branches into my "next"
> branch so we can give this some proper soak testing. Once 6.16-rc1 is
> available, all those branches (devicetree/next, defconfig-arm64/next,
> drivers/next, etc.) will be rebased against that tag such that the patches
> that are already included will be dropped, and only this patch set plus what
> I have accumulated will be applied on top (if that makes sense).
> 
> As Arnd says though, this is too late for 6.16 so this would be included in
> 6.17. Andrea, thank you very much for your persistence working on this patch
> series, and sorry that the request to merge those patches came in during a
> time where I was away. The good news is that I am not doing that again
> anytime soon.

It was a pleasure, and many thanks for your patience too.

Andrea

> 
> Thank you!
> -- 
> Florian

