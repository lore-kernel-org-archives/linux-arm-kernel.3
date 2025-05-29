Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0AFC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGJgxS1k4sjFLENCJ0R74UHOiVaE0JfhO0ApUNQ8FHM=; b=0tpWJTwUGzqCWA6hWPlR/fMkTJ
	bjqsyWCyyOmPEHfrnaHwuyKed8r+HRsHvw869eMvrgq9L7fkz9Y/wNl/lUfF8bTtgH2i+s3yq7H9H
	ryPcYdVBqoe/YIIN4yq2PJMLNvvaJDgI+Ut358O2roqfa4usy1pFbl0NoaQIgGItnU21lUkIPS65g
	iPyfmWCJ5BUdMtVIutgqGq2xsrTfsDJ0MLatNBXwddbKjEN1t3O8LAKwXV81YLMhpSDZNXYGDCUIg
	sJoalOUP3GIWMtJPfw3zQtpsgzGI6UcEvxbfkH0vAIm7CTiiQjnXDE23i/Xi5+OoYRf2qbDBYppAn
	aJ3QaMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdyY-0000000Fwfm-1GhJ;
	Thu, 29 May 2025 14:11:18 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdRt-0000000Fsdi-029H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:37:35 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-6045e69c9a8so1547924a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748525851; x=1749130651; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGJgxS1k4sjFLENCJ0R74UHOiVaE0JfhO0ApUNQ8FHM=;
        b=WhSSApACpMPNNKQwk2Nh4YIQ3P/Rvy3nSrDrzRjxSkZopBoLVuB9cx0wmRc0DDhvGe
         xz39s5c/kZmg+9RV9O6P5uLg80djdjMXp52rAqXhXyzoA09KLZDHjOxA67idO1ZFvLn/
         xRkrcPD8njd9dKZqjc5EpJrAE977JJB9Wro2G9wGOyuVvpGGU8rscKMQgMyTaPBIERf0
         PC3VBLoDhY5DdcjEM5i7h0nNqX9RC+TBg4HxG/UqLBCT2g5o7EtaeiZj5PwPltiWM0wI
         G+7BzQTNibzBlAKBOpAyLTBWSg7VkSDhUR7qkp9LM4KArJtELmkqGfCdNVJvFGhd86Um
         jx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525851; x=1749130651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGJgxS1k4sjFLENCJ0R74UHOiVaE0JfhO0ApUNQ8FHM=;
        b=wYDYeX/MYMCWIYbOKjI8imu4TywAnvbSM+QxPUs5lswmsMKhYOP0pOYNVBncsZ89LB
         XAut25/pvmvUM1NPVrwBzxKqk5MontsBzpf0ZPusoexeH+G6UZ6Th1lNYQr9omdWxMPO
         BASDAvH2DENCSgHF3prhywx/zuz4eRG8xzy/OS7PubxGg7PYIOGvR/QcEpTQGYXZx2FV
         jD2DLXdmcs3LbmlEiVJTbppMaGaDZ3ZY9KTBPwoW0zdVcjjgWH1nC2gugI68qtdf9AFi
         ioWrLzN3egVPaC7+9L+8QyUsJTaRmTGY/LrvCHIsbgSnRy4u+usbqLjaOxnj5vgdhO1G
         c8rw==
X-Forwarded-Encrypted: i=1; AJvYcCU7WpHuIRkwzIaG8juH/IN+PRz8kyDEexgI7Lf+i5UzzMz+THgc45IGoOyOQs+vjsjVNVpriJSt1gckTAUNy0ZI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw10JHA/DWPP5QGfBrxC/DtzfkFZyPRTHIkJIYznCQ440+3Rpc6
	9FtqeqJmxRbhRlzNWK22y72v12pnsokcMCMvk198/RjHDwlffFcFbyrdo7ZBx76KEP4=
X-Gm-Gg: ASbGnct6aTZue44utEOgVsMhoBb24i/qbC4V+HPu3OvMMpl6zeVC7qJFL4KIvoiws4C
	Exf4hzF1lIG5DnuOEuQHDLXJDoneBYcRWNWzR+keyCaBa0YLSUNB+DX759UrEZRVecyx1LaRHmv
	brfdDu5iRt7ZeSvtRthbi9MpKCgOdDJ+wivVQVAxKaVJbwoQ70Dxe/g9LHqhUPtWTqupBGDZ0yY
	qu3nhW5VWlBbFZidviD9RE/e1ivzJA6phWh6j2LwNuXfIcnXoqij/3OhlgPIVmg7OlQSUFhf0Hr
	A0tpcrwBTkmun9spn4lJxCeXXhU1Fxc0tMycuP1KIhL/ZpHbCJo7MHF68ePaxa7Uque4qnlphJ9
	AuMh3H764+y3KQvtbv6uOAA==
X-Google-Smtp-Source: AGHT+IE89jORsxIfrZ11Z2zrlUgtzpwgSWYSGzkctmVru6WV+L9ZxyVvE4uRFiUjC5dkQM82OICRVg==
X-Received: by 2002:a17:906:6a10:b0:ad8:a935:b8ff with SMTP id a640c23a62f3a-ad8a935c9b6mr508211266b.31.1748525851272;
        Thu, 29 May 2025 06:37:31 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff047sm146955766b.18.2025.05.29.06.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:37:30 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 15:39:06 +0200
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v11 0/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <aDhjehJxIxfNPwTr@apocalypse>
References: <cover.1748522349.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_063733_049699_3D3D3997 
X-CRM114-Status: GOOD (  40.84  )
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

Again, this patchset for some reason has duplicated Message-Id for 
patches 1 to 5, so they will result as clobbered up. Please ignore 
V10 and V11, I'll send V12 which should be, hopefully, the correct one.
Sorry for that.

Andrea

On 14:43 Thu 29 May     , Andrea della Porta wrote:
> *** RESENDING PATCHSET AS V11 SINCE LAST ONE HAS CLOBBERED SEQUENCE NUMBER ***
> 
> RP1 is an MFD chipset that acts as a south-bridge PCIe endpoint sporting
> a pletora of subdevices (i.e.  Ethernet, USB host controller, I2C, PWM,
> etc.) whose registers are all reachable starting from an offset from the
> BAR address.  The main point here is that while the RP1 as an endpoint
> itself is discoverable via usual PCI enumeraiton, the devices it contains
> are not discoverable and must be declared e.g. via the devicetree.
> 
> This patchset is an attempt to provide a minimum infrastructure to allow
> the RP1 chipset to be discovered and perpherals it contains to be added
> from a devictree overlay loaded during RP1 PCI endpoint enumeration. To
> ensure compatibility with downstream, a devicetree already comprising the
> RP1 node is also provided, so it's not strictly necessary to use the
> dynamically loaded overlay if the devicetree is already fully defined at
> the origin.
> To achieve this modularity, the RP1 node DT definitions are arranged by
> file inclusion as per following schema (the arrow points to the includer,
> see also [9]):
>  
>  rp1-pci.dtso         rp1.dtso
>      ^                    ^
>      |                    |
> rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b.dts
>                                                ^
>                                                |
>                                            bcm2712-rpi-5-b-ovl-rp1.dts
> 
> Followup patches should add support for the several peripherals contained
> in RP1.
> 
> This work is based upon dowstream drivers code and the proposal from RH
> et al. (see [1] and [2]). A similar approach is also pursued in [3].
> 
> The patches are ordered as follows:
> 
> -PATCHES 1 to 3: add binding schemas for clock, gpio and RP1 peripherals.
>  They are needed to support the other peripherals, e.g. the ethernet mac
>  depends on a clock generated by RP1 and the phy is reset through the
>  on-board gpio controller.
> 
> -PATCH 4 and 5: add clock and gpio device drivers.
> 
> -PATCH 6: the devicetree node describing the RP1 chipset. 
> 
> -PATCH 7: this is the main patch to support RP1 chipset. It can work
>  either with a fully defined devicetree (i.e. one that already included
>  the rp1 node since boot time) or with a runtime loaded dtb overlay
>  which is linked as binary blob in the driver obj. This duality is
>  useful to comply with both downstream and upstream needs (see [9]).
>  The real dtso is in devicetree folder while the dtso in driver folder is
>  just a placeholder to include the real dtso.
>  In this way it is possible to check the dtso against dt-bindings.
>  The reason why drivers/misc has been selected as containing folder
>  for this driver can be seen in [6], [7] and [8].
> 
> -PATCH 8: add the external clock node (used by RP1) to the main dts.
> 
> -PATCH 9: the fully fledged devictree containing also the rp1 node.
>  This devicetree is functionally similar to the one downstream is using.
> 
> -PATCH 10 (OPTIONAL): this patch introduces a new scenario about how
>  the rp1 node is specified and loaded in DT. On top of the base DT
>  (without rp1 node), the fw loads this overlay and the end result is
>  the same devicetree as in patch 9, which is then passed to the next
>  stage (either the kernel or u-boot/bootloader).
>  While this patch is not strictly necessary and can therefore be dropped
>  (see [10]), it's not introducing much extra work and maybe can come
>  in handy while debugging.
> 
> -PATCH 11: add the relevant kernel CONFIG_ options to defconfig.
> 
> -PATCH 12: enable CONFIG_OF_OVERLAY in order for 'make defconfig'
>  to produce a configuration valid for the RP1 driver. Without this
>  patch, the user has to explicitly enable it since the misc driver
>  depends on OF_OVERLAY.
> 
> -PATCH 13: collect all changes for MAINTAINERS file.
> 
> This patchset is also a first attempt to be more agnostic wrt hardware
> description standards such as OF devicetree and ACPI, where 'agnostic'
> means "using DT in coexistence with ACPI", as been already promoted
> by e.g. AL (see [4]). Although there's currently no evidence it will also
> run out of the box on purely ACPI system, it is a first step towards
> that direction.
> 
> Many thanks,
> Andrea della Porta
> 
> Links:
> - [1]: https://lpc.events/event/17/contributions/1421/attachments/1337/2680/LPC2023%20Non-discoverable%20devices%20in%20PCI.pdf
> - [2]: https://lore.kernel.org/lkml/20230419231155.GA899497-robh@kernel.org/t/
> - [3]: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/#t
> - [4]: https://lore.kernel.org/all/73e05c77-6d53-4aae-95ac-415456ff0ae4@lunn.ch/
> - [5]: https://lore.kernel.org/all/20240626104544.14233-1-svarbanov@suse.de/
> - [6]: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
> - [7]: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
> - [8]: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
> - [9]: https://lore.kernel.org/all/Z87wTfChRC5Ruwc0@apocalypse/
> - [10]: https://lore.kernel.org/all/CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com/#t
> 
> CHANGES IN V11
> 
> 
> PATCH RELATED -------------------------------------------------
> 
> - Patch 10,11,12: Added: Reviewed-by: Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> - Patches reworked to apply cleanly on broadcom/stblinux branches:
>   patch 1,2,3,6,8,9,10 -> devicetree/next
>   patch 11,12 -> defconfig/next
>   patch 4,5,7 -> drivers/next
>   patch 13 -> maintainers/next
> 
> - Patch 13: new patch gathering all changes for MAINTAINERS
> 
> 
> RP1 CLOCK DRIVER ------------------------------------
> 
> - Dropped some WARN_ONCE() lines that are basically useless
> 
> - rp1_clock_set_parent() now returns EINVAL in case the parent check
>   is failing. As a result, rp1_clock_set_rate_and_parent() has also
>   been adapted to return rp1_clock_set_parent() retcode.
> 
> - Return an ERR_PTR from rp1_register_clock() instead of just NULL
> 
> - Dropped some unaesthetic blank lines
> 
> - Disabled the builtin locking in regmap since we're already dealing
>   with concurrency in the code
> 
> - rp1_clk_probe(): dropped dev_err_probe() as redundant due to commit
>   12a0fd23e870 ("clk: Print an error when clk registration fails")
> 

