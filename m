Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A00DC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHLj/Q/sOaFpLIs3FEe17J8/SRfhLs+hrL+m95dT2SQ=; b=l6tH4O5TFH8CPgubi6qGkg/Ys+
	C77YJSXe+F/GdgHZnVyh+sWLe15yc2jK8QHFTzzLiV+vjQZ6IBdPg0jIr6xCvkUAheqkg5soFV0vX
	VGFc6aNjIDz7riF03WYF67B7mlD8Ef+tYseOfUJWTsxywXuJloXFKCy7rXWk5b50eiUyi95eaUl03
	CspnbqNDPmZ6UrLrAiL5tXC/K9pKLoN72DwpJmEhsuz3bZcr21lwBxlK6GXzue79bIlpauSTfmjxc
	OGfpoypHhEYzkPRilJkqXMYhsuirIfoJdlLBDhFw5XSQDBFy10iI3HbMV/q7k0Th3nJYLFR4JRDPi
	YDQPcd7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iu1-00000006NCY-0Qt9;
	Tue, 15 Apr 2025 16:12:49 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iOM-00000006HZR-10D6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:40:08 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so864563966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 08:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744731604; x=1745336404; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHLj/Q/sOaFpLIs3FEe17J8/SRfhLs+hrL+m95dT2SQ=;
        b=EVkGxmb8gchozsWCsx2CNLk5QfqCIbVzhIfu42ZzxbAtGj2vAuAwc/KlKqxrjk4YCt
         R2Jm/afNCZYiZEti6Vltszs7WL/uiQzZCkHqS3tGceVUpcdpIAxsm3x77otw0MphRWhd
         aT7qra6i0Ct10jk9Hq0uR1k7GzIPecpARJq0AqvRDeJqkJr/MbCvpzsCG7bPAyopNtHr
         qqzsY5G1xz9r/lSpYJsbxDGr/LrgZd9u2JoqN4EyS/S2Q4nfBfjxHPNblobbNC6MShVd
         sjrMoyjNH3DAwrXDDmGjKLyeKXVXw0R6l9Hu5YKz90frYyXUEzhRxM8nJcPD0o9jwOlQ
         /AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731604; x=1745336404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHLj/Q/sOaFpLIs3FEe17J8/SRfhLs+hrL+m95dT2SQ=;
        b=GXE9fkNgJ29cQlAW5tCxZcR46S1h1xZjkfL4mg4xOVtIc3dgYJ6Yyo6iizGfhru0UC
         etvf20Dj5i8K7SvRGeYY4awfnmbRDkk83YB259ZlF8sgprh/7oy3jJkxLjEWfdUHDFv6
         MvZtYzjEkmPmR1JLpRQd2qZYHdragk8Wzzt+4LqetqNqqZSCmdjKr2NXKFF+Sw8S6jKA
         85gdvx463JmnCVLyju4lGCPPA8QhnXlqJr0ndSZJBtWq/4ihOZj737XsOUznN9bbpZdJ
         AIlARc+cJBA0ux4ikOJVsByi/7lYcZlgC0y6oJTSz71dGVB2kcLMJbO9KIfK3yiBkXoA
         s5dw==
X-Forwarded-Encrypted: i=1; AJvYcCUA7yCjcU9eLyzio55aop62G6qooQbwAdw0Wpdp+kCq0ykCu1ysSsb0/YP0abKkZozPnMPcLH4xgTqFCx3P4TDt@lists.infradead.org
X-Gm-Message-State: AOJu0YxySPQsHPwGtYmI6auEmk7ahhl/HTil1xG80xLez2avPyFKKsjb
	xHPiB+zTvFIEP2fKcLvCa+M+cMhjSQUT4XjnXDyqjwo1Y7RhQIa3M1o0Cg1saaM=
X-Gm-Gg: ASbGnctJLebANz96JEKO9rNuv0i4TkkZn+eXPfeqNBj1Ez5ye6Jxu2JtG0V+EQej3eG
	KExH06yJDhAlKp7DbLMsBBG92jCmFBIUnVvfI1PwppiXTYbRiMirKPYYgmh7SqH3qYF/X6xBy1y
	cXslORVck30xbVjYUQ24/XelQDIbTp3Eii0as9CxBRl/GIlazr7xMaAMvX7nd4nRY6K4AaPW3wN
	KOJMB3tmtIIbiPjXK7jy0jvQ2h0FJZxlLsyEJZDnm2GeCsBancrkJxABPG2dLx0anY03mTQ7kCG
	B6t184XULByHP66rUSov6+hubM3FVobQ/0gzMlqFobGSjMjG7RI9Nk6Hfij+Zg6H6thTh0UGVjs
	OgVXDvQ==
X-Google-Smtp-Source: AGHT+IH7EkpxnEGrVDPA/wXcjxUS3uvn0zUd7xAOXnljoK+P5iXt632rg6oTgD9CrBhQ3HtW1Xsnmg==
X-Received: by 2002:a17:907:3f11:b0:ac2:7a6d:c927 with SMTP id a640c23a62f3a-acad36c7212mr1222248466b.50.1744731603735;
        Tue, 15 Apr 2025 08:40:03 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be8fcdsm1099687566b.46.2025.04.15.08.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:40:03 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 15 Apr 2025 17:41:26 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Andrea della Porta <andrea.porta@suse.com>,
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
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 08/13] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z_5-Jjbu6XoHGmxN@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <3fbc487bc0e4b855ffbee8ed62cfb6bf3b0592e8.1742418429.git.andrea.porta@suse.com>
 <2025041557-masculine-abrasive-c372@gregkh>
 <20250415165505.0c05bc61@bootlin.com>
 <2025041531-dubiously-duchess-276a@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041531-dubiously-duchess-276a@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_084006_274547_469ED370 
X-CRM114-Status: GOOD (  22.12  )
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

Hi Greg,

On 17:14 Tue 15 Apr     , Greg Kroah-Hartman wrote:
> On Tue, Apr 15, 2025 at 04:55:05PM +0200, Herve Codina wrote:
> > Hi Greg,
> > 
> > On Tue, 15 Apr 2025 16:06:43 +0200
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> > 
> > > On Wed, Mar 19, 2025 at 10:52:29PM +0100, Andrea della Porta wrote:
> > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > and others.  
> > > 
> > > So shouldn't this be using the auxbus code?  That's designed to "split
> > > up" PCI devices such that you can share them this way.
> > > 
> > > Or did that get rejected somewhere previously?
> > > 
> > 
> > It doesn't use auxbus probably for the exact same reason that the
> > one given for the LAN966x PCI device driver [0] and [1].
> > 
> > Avoid all boiler plate needed with auxbus whereas drivers already exist
> > as platform drivers. Internal devices are handled by those platform drivers.
> > Those devi just need to be described as platform devices and device-tree is
> > fully relevant for that description.
> > 
> > [0] https://lore.kernel.org/all/CAL_Jsq+1r3SSaXupdNAcXO-4rcV-_3_hwh0XJaBsB9fuX5nBCQ@mail.gmail.com/
> > [1] https://lore.kernel.org/all/Y9kuxrL3XaCG+blk@kroah.com/
> 
> I really hate creating platform devices below a PCI device, so I'll keep
> complaining about this every time people try to do it.

I agree with you, but as Herve has already pointed out this would mean incurring
in significant work to adapt drivers for all the peripherals (there are quite a
few), while with this approach they would be left untouched.

Many thanks,
Andrea

> 
> thanks,
> 
> greg k-h

