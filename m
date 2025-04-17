Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA968C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tkf5fQhiQh/YIIyCMZKHz3rsbVF+Y8xcwtqk69ZSgPg=; b=ezwn065hdTjJQnsIdok9TEWwy5
	FyJPSJ8sBFnFk1nV3Ue/21/jAC7jMd9/dxIycXfDVpLbP6mqDy8kI1fTFWX41Y1wnRLDbGgLyw9Y1
	E4Qq1Fxrof+5aOiGF531DphDbbi7EtpbmBbmL8yyLHoS5I4u9jlfObLjHeqOgJ4cmWhhZfb+AV6Iy
	5pGmdICF6EnLdCcLmRKGj9dRST34VcAeVyTOQ6ADWNQ67T/dO3rio2W9hC9od1mN7BMmskmDp2wqW
	7fBuSt9SbJRbnelkYuJ0+3czFgR+ElQ43Lo+dKUa2O9Lmh7cWyZDBxh5P0YJGQIMFrRSetZXT92sg
	t9PWUZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MrR-0000000ChRU-3NJd;
	Thu, 17 Apr 2025 10:52:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MXM-0000000Ce82-14C1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 10:32:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso5282845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744885923; x=1745490723; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkf5fQhiQh/YIIyCMZKHz3rsbVF+Y8xcwtqk69ZSgPg=;
        b=YyrSUzffksYp7QO1N9rpRguk/atraB0945BIEwe1eyVspYLnZnHDALpEyAGPQKovdX
         6I+2QWwb4eqgVEOSaL3xZGkudhF3o1nQ0bZGPeDLZ5eOfjiY4uSziVB7UXgqBZBLCsJi
         zAD10TbrIegLMpe6kpuyN2zUWmIWL3J09745iM9dW0787S8OnWMCXvUJl8RJ77slUtMi
         g8zMo0uHrJ8cHFmulFLqfcTa4PW7+unxNykTtof/X8BcDBJetwNzyeWGVGgGfWESc5OZ
         qXyZcxesflENWtbAmICghEio0hMmiOtfA5JyvmRJFbPaebxfE9LzxMgTJpJjJLglGy0R
         TH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744885923; x=1745490723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tkf5fQhiQh/YIIyCMZKHz3rsbVF+Y8xcwtqk69ZSgPg=;
        b=HNVzpuSk/bkMxE+FuSpiaVULiqlry+oa6/+hlImKRQzTMoGNk5Sz5+hBTgRfUtc9/B
         Xpcl7ldj4UoMHn736y9xsjgpQWfxggnZ0FxdtEE1YasHJNFakcXR9+K3pnSiWOuxZmYj
         PINh4oei4oZ4ihODVdbG3GAst5TzbYEdXwUYUXfgd1oUnnphc1IMK7n8sJ0bYAyIKzL2
         FXymQEDQT5g39pzkElGVliRxvEMd64vgYhWL0em4e74mUmmUJ3G0U+hw8itUhwz8+URH
         f08twB92TyOmEqYkStWu4EZdyDC9N5FZbJvfvsoOKYWbxxCck+iMe4XeQ1edWelTE1es
         Bl7w==
X-Forwarded-Encrypted: i=1; AJvYcCX6+1JkbpU9SIHMXO19wnBq8GBdiqTtTzRZTLh7SmqQ01fGyZP+S0NCj8pQ8ZerB2bSJWUTjrDUoS5Qp4xmUPYO@lists.infradead.org
X-Gm-Message-State: AOJu0YxXCwXbzZKOs9HPwfDdSVxhEh5JPESlA22L363IYYW0zVC8rtC8
	Lj8XhdyhUpYSDptbTQuLWe+QYWd2sZb+nsT8i3bqXzrQbWzAVdVdQK4MOiC/rF4=
X-Gm-Gg: ASbGnctl3Ny4Q3kIwfe3CIqQzQiiiNvj+RQCLZy1dlc5TQynz3F6rIFvYx+jLZ8Y2J9
	Lwp4jStMGQgCu9xK8YjqbY17ZmaZtArmUgbXUuse/NYSRHyRPwOl18EEvpK3EWNVacKP65WjsZh
	Zw3RZicW0NNI/FIsphOWGLnmbysvnqwEka4Dy6jRpfpxsMVKIx1agg8pObIU0P4jdMadMH1yaXN
	eto+AZ33EjKmBz+s32mLTY5mSjf2NLrxUH5I8hCEEFj2u42uUPnX39mOLX5/qUY/DpKgdtcliU3
	MOoY8MDEn5yJD47EomWychvrgkm9n/VZViJRftlIAqdcl2yMbiuaAhaFua9Ijsrq51AV0Es=
X-Google-Smtp-Source: AGHT+IE6usGaresLBjX0+vm/8v6ChKOAsLs9MaVE8DopJjuApE+hTsGgNSyU080dBby5dOeKbC+ieA==
X-Received: by 2002:a05:600c:3b07:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-4405d61cfd3mr48465285e9.11.1744885922759;
        Thu, 17 Apr 2025 03:32:02 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8188sm49137285e9.5.2025.04.17.03.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:32:02 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 17 Apr 2025 12:33:25 +0200
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 07/13] arm64: dts: rp1: Add support for RaspberryPi's
 RP1 device
Message-ID: <aADY9Ye5ok14m3F2@apocalypse>
References: <99269f7762ec0124315e0e8977d9ca4f469f89ce.1742418429.git.andrea.porta@suse.com>
 <20250416192905.GA78240@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416192905.GA78240@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_033204_293058_DFA6047A 
X-CRM114-Status: GOOD (  14.89  )
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

Hi Bjorn,

On 14:29 Wed 16 Apr     , Bjorn Helgaas wrote:
> On Wed, Mar 19, 2025 at 10:52:28PM +0100, Andrea della Porta wrote:
> > RaspberryPi RP1 is a multi function PCI endpoint device that
> > exposes several subperipherals via PCI BAR.
> > Add a dtb overlay that will be compiled into a binary blob
> > and linked in the RP1 driver.
> > This overlay offers just minimal support to represent the
> > RP1 device itself, the sub-peripherals will be added by
> > future patches.
> 
> Would be nice to have a blank line between paragraphs.

Ack.

Thanks,
Andrea

