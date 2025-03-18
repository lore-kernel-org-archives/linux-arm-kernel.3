Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80395C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=is8WhR9m8WQE+4k9i/DT+FdMHQKk7RaZk/UQmejRp3g=; b=XNRgv89PZhglvWK6+sKosk7hcS
	yNyn98Y4JGjP9MngMnpmys23hkonM4vZHV5QdosfkiweMat5T1DXdrk7RKibTvwGEtYeLKLk1Vd16
	NDn4hf139zShF8KOyN58bHWfaj5LZJoYKbJV8s6ODB4DBvHzzRvAc1HohKEzuSfEkMAbqYOaKwH6W
	RkZJ1nlRF7Uyjmjap64jOOIcz+aSOrZgZ56bpBZizhOQ8kUk9yFhwbgey1vWhvTV+5U78awUuGuMV
	XF8IYtg9tf6wmyR0ocsvLzXolrCn9GZSuHH2diNEZHNnCjkrOuj8CgqGzpo2qo8e6ZrQHz6xMwR2m
	AdePaWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUrM-00000005fGB-0NWX;
	Tue, 18 Mar 2025 11:11:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUjq-00000005dYM-0XN2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 11:04:03 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abf3d64849dso903083266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 04:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742295840; x=1742900640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=is8WhR9m8WQE+4k9i/DT+FdMHQKk7RaZk/UQmejRp3g=;
        b=J4voJzbGJOtqL6hV4uhfcUPfG1a8VLKp54HFzKPLIJULiTzs4AGrrusg9XHabBW5tz
         +Bdv1K4szN4TnElKuMP85xV+5YqW82TZvu7GG5A0quJ5+zW2tiYXyq3I4k67cN67tEiQ
         oL3jNJR5VZGkU7WbjvmuiNEWGhQh30z4F7fn3mdpxfUcqzaG3ItQV98pQowQ2aC8WWg9
         wx4eYhAYfVjdNaaknbnKLXynQebYxXApne4cGHTUKC7RgItAgbxZbtde9uLxd+mLWOKK
         VaHIOTNRPzjPhaqpAiLUbI4nangob93xzphR1WcKhGnyOlIE57AGWFWAQoTXSFVL4Tu4
         pDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742295840; x=1742900640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is8WhR9m8WQE+4k9i/DT+FdMHQKk7RaZk/UQmejRp3g=;
        b=N3Gmkk1M0MI16rzEPcLE+2H6/rS6JrFXMIH1TvttYv6zqSwIioaj1JoFrtO6py2304
         YI/e6vtRNS2uuh95eMTPORjbn85FUJtfDYdY6oD6GbFVjRSJUuWSWJVLmLNCJTj2NtW6
         1kNjNXTyXEYyScNcnAkk6zfV0FjMdr9wrrteZobcFwV5x4muO+3xQPsvfmydgtwvYNot
         dWB9o4Fy588NNVEQoo4ffF1EfHajBYAYSo/tOSNIQQwSefaPMBLXMAs/NUNwnCSpsF8X
         z87Vm6UDE7h8SVJnjicFwHrXvA91oZcKWdhsZFHZj8RI6CeC0lWSY7yqQDXd82kzdXyq
         J/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxYFI8G4e8wg5O2sissF2DO2hc1m8mqSB9PixaXVUCLd0Jcyy92AzyK66a4w/8UiScAgEJAYcnsGicoUOAd82A@lists.infradead.org
X-Gm-Message-State: AOJu0YyjlxAD4pKxuwHyJyr2d4f1VIVxmDC0d1QKtcbHeIhtv6N/Lp+9
	FVv1h5+VyE34fTyzvrjfQku4H5srgW/Y4EVQKqf+85Ixl0leZdrimTSka+mwZoc=
X-Gm-Gg: ASbGncsabeTVcNRWtF6C9OekCyzU8KdDcWJVpMQf4R3xeksPenMUi3B2hdu1LjuTYRo
	L2KgFFNOOLuNFgyJRoUP3hTd996fyNkonFBSrOJ7MAPbSgwoD8PuevEEADBFcSH2fxVeIDbW9wS
	bJ4R1MA6fmNKxjt0x9SX1b10yBAjKfvHLxkGY1319i3aOt88fMQRHUuSVC22v+8kgfV30FHIJtr
	FhC4Oljr3jLmiNcsj98Wcf68S9GsS60kkVer5CSeS0XFf9olhiRvjOLNMUeHwZi4QXwxr03v1LC
	btXHMhBFzcn0Gzg5Z2wI0oB33VW0eMWYYKowP0ZfFErpTuhp0VzcKRBBzBZRX4Is1rwHWzKLx9L
	m74jFiSalw7mYzpU=
X-Google-Smtp-Source: AGHT+IHSFIas9nSr0GTvP8XDNoyPypRdkL0u01Zf6bNvQk2jQCXUoByUBqIy6f605R78yLU5u1JN+Q==
X-Received: by 2002:a17:907:3e0d:b0:ac1:de84:dec0 with SMTP id a640c23a62f3a-ac3302d3694mr1426644966b.26.1742295840401;
        Tue, 18 Mar 2025 04:04:00 -0700 (PDT)
Received: from localhost (host-80-117-53-131.retail.telecomitalia.it. [80.117.53.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aea4csm828388566b.33.2025.03.18.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 04:03:59 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 18 Mar 2025 12:05:12 +0100
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Stefan Wahren <wahrenst@gmx.net>,
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
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 08/11] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z9lTaKsbLND4i3Ir@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <d1362766e3e966f78591129de918046a4b892c18.1738963156.git.andrea.porta@suse.com>
 <87525350-b432-40b3-927c-60cd74228ea4@gmx.net>
 <Z7dnnW4npJmfOVE0@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7dnnW4npJmfOVE0@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_040402_167200_C33467DD 
X-CRM114-Status: GOOD (  16.34  )
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

Hi Stefan,

On 18:34 Thu 20 Feb     , Andrea della Porta wrote:
> Hi Stefan,
> 
> On 15:21 Sat 08 Feb     , Stefan Wahren wrote:
> > Hi Andrea,
> > 
> > Am 07.02.25 um 22:31 schrieb Andrea della Porta:
> > > +		msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK_EN);
> > > +		rp1->level_triggered_irq[hwirq] = true;
> > > +	break;
> > > +	case IRQ_TYPE_EDGE_RISING:
> > > +		msix_cfg_clr(rp1, hwirq, MSIX_CFG_IACK_EN);
> > > +		rp1->level_triggered_irq[hwirq] = false;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > It would be nice to document why only IRQ_TYPE_LEVEL_HIGH and
> > IRQ_TYPE_EDGE_RISING are supported. In case it's a software limitation,
> > this function would be a good place. In case this is a hardware
> > limitation this should be in the binding.
> 
> All ints are level-triggered. I guess I should add a short comment in
> the bindings.
> 

Quick errata: s/level-triggered/active high/

Thanks,
Andrea

