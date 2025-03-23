Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7D0C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 11:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iP6s7RJZTq9P1esZphsb8AleCV4Kmq3vN6x3kTIwGs=; b=MB4bi5UcEkPqxiReGuH/W/DdQU
	yHp+80o/ttfj3ouiepRUDlctLsTeU2niJo6q067TJfJ+UMvZU2tVylkp3NOlooe5Mu4K6zLvT26/i
	VaX3Zuvc6Xc7WsirzZtUjOPrj7lGCG/WQJJmyxjKvoAhIx1Z1HuKteVLbjAPUAkBzUs8ATFuJkQZZ
	4YC5Snmc94OHPF0CYbpvhBF2+bU++OgM74SyxOEB6lEYp6V4L3krGls8SBZ51IfL5crmJA27/9YSV
	MX6Zq+Slreh23eU2Rjq4YXBiXufyf6uiWGSCiURS65ArVfk1FwZOmedWqbdB3UPurZSSP2ynqEYpQ
	WAEdv+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twJxe-000000018mg-43il;
	Sun, 23 Mar 2025 11:57:50 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twJvx-000000018cB-2Hp4;
	Sun, 23 Mar 2025 11:56:06 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225df540edcso87232115ad.0;
        Sun, 23 Mar 2025 04:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742730965; x=1743335765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iP6s7RJZTq9P1esZphsb8AleCV4Kmq3vN6x3kTIwGs=;
        b=VT13vrjZF3NFAHDnQldWcCQO75YAWuDFXVyClGR4A0Icx9QG1Mv7a+kq8abnps+11Y
         3KvrrfajzEVa5scDAu15wIugnn4bITSg7jyssQo9ZqdZkWh80HMtONQEM1OCwgJAdXbZ
         FeejnNngeHSZEWDsahWNFNAnQsrDOcG8dWNM4kbIAEd+zLUeDBsU5o++PkwqN6PuBF5m
         4Voy+6J9/zhUpCtEkvsQNeOyaDVRSrkU5XJAQddUIK+LEfYeGOsA44f7Jb4wLxFJIRcm
         JPzPnbZzZEkJt+JpCASIXjnzcXtUJyTGQJGzSY3xV/VfHjC96SrZ3E8kcHcr5Ry1OIfK
         6Gbw==
X-Forwarded-Encrypted: i=1; AJvYcCXTglQCl6TyUbnKGACr9gc7/SJVBKFLTn3Cu3VUe3OpXtIHizARoWgaUYlyI2Ep9x+m6z70zu/sWpVYSQsh71Sm@lists.infradead.org, AJvYcCXWbdJiKh7BcMs+QVIPMH7LJOWqju4nT3VlZBOLIYCl4hEAl7211z9xPnyvamcOOwd8NxHfHGZr9I2kxYPmUZVH8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEDODbXQ1E1depgZ5/Z+sVPL3glOuGgL31fgllqe+xFJIs8HMX
	Q3KhCmo3YqdWgQ69ZgHxqNbEMcJp6WPzJY+X88UhIch5u74i/AbA
X-Gm-Gg: ASbGncvdIYy8spmeEfCNy67QFKthlnh+aJkHtrSuZDl8DYg6pqrKWpCUzIldTwKgQ0M
	wvC9fD5z0z4TDx9I4GX4ZuIDhcuGnsJMV1NJazFP8hxmGo4WFas5jgy/bqQOKRmVrals5t61uY1
	T9oyiku/2zf1RQbqzHo3/HlJwoFfOeIV27pgnHhXRArgkasEJHgW1v7IkTLHBMb73yTdSLPO7u1
	mwohUnU8kNEnxVp6SAUAI99sDIaMPacdcJP5jPIj2XyIvpJteBENBNXlPbunJU2CNlPXJjHVlSN
	N1DWtxAWhx1+UMs5ulxnqE2U3ZzCLqV2X/ecS2JIZDpAR16/bduoRRh1AvXRzN7EY3K3j6/zJSJ
	bxrc=
X-Google-Smtp-Source: AGHT+IGFrPrOjm1ltZW+6Dht1zMb++j1BuTfrfYxmMgOcEiQGmIANrOACm+sR9E2VHw4F5IauWW82A==
X-Received: by 2002:a05:6a20:7288:b0:1f0:e2a9:fb2a with SMTP id adf61e73a8af0-1fd085563b1mr18959356637.4.1742730964522;
        Sun, 23 Mar 2025 04:56:04 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-af8a2a4f585sm5062513a12.73.2025.03.23.04.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 04:56:03 -0700 (PDT)
Date: Sun, 23 Mar 2025 20:56:02 +0900
From: Krzysztof Wilczynski <kw@linux.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 08/11] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <20250323115602.GE1902347@rocinante>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <d1362766e3e966f78591129de918046a4b892c18.1738963156.git.andrea.porta@suse.com>
 <20250314083730.GC234496@rocinante>
 <Z9lA31gBjpIRHm6y@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9lA31gBjpIRHm6y@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_045605_581820_71B31597 
X-CRM114-Status: GOOD (  13.16  )
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

Hello,

[...]
> > Or, something like this over this the function name.  Perhaps exposing
> > error code could be useful to the end user? If so then something like this:
> > 
> >   return dev_err_probe(&pdev->dev, err,
> > 		       "Failed to allocate MSI-X vectors, err=%d\n", err);
> 
> dev_err_probe() should already print the err code, no need to add it.

Ahh...

I did a copy-paste of the code from above purely for illustration, sorry
for the confusion here!

> > Here and other errors where appropriate.
> 
> I've changed dev_err() to dev_err_probe() in cases where the error code
> is not evident (i.e. hardcoded) from the source.

Makes sense.

> Thank you so much for your review!

Pleasure!  Thank you for all the work here!

	Krzysztof

