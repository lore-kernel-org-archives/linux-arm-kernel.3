Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E48C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TokNH1Htr1RVPQd8EncDveS8lHW7ErFNLxi6svxi5ss=; b=MOq2HkAiPArzk96rtQ2LxZYOCE
	i1RzyPfKQhOrC1jvZAbBzfppcrDky9C/27IDvzv/C/QGTHAnfg+Q6YBdIlODuym/a+vIs+Rh6uwHQ
	SfAplxydFOH0DtYaPTdOSSlgGn7vX9l3ki/jBuwAs8EeZiKAu9aqXb8JA45nl2fJC30xGNUXHnEik
	uWybWWVi+7at4UR31GjORv1r3baZ8F2snqOpzHQRj0qmx0cNoFJnIcpPVJ0cDx9eTj5pHH5FDzrHr
	twxsBmLxM8MpemhXAiGhqurQmjM0ViwZ2DBjysDQI8PLfnTmW4Seg20Wa4OHlbhP5ceaRQ3iOlqjg
	2sWfFHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWVE-0000000A9AU-1Cjl;
	Mon, 12 May 2025 16:59:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWCq-0000000A57H-2SoI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 16:40:45 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-acb5ec407b1so813849966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 09:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747068042; x=1747672842; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TokNH1Htr1RVPQd8EncDveS8lHW7ErFNLxi6svxi5ss=;
        b=buxEkkbTy56uDRSv+GKJWk8tVPWpAuPrBT7GufkRF55bLE7xFFXIwGUbvIOmQUAA5y
         bSKQzNeZtTJ9Avy1knmq0owW2cC8zpD6Ga87IypYGQ76wJB4PPDjFbvnYIhXFl9dzVTC
         2YkCF5k6s3Tq3bF2kvDJ3Wj7lZSJ8V2FJWmyN/TWhegTySk4cKFPDxdSiF83WldXxazY
         v/yiSi1hiMRGYFC2j/Nx7JdlUN7DQeCNZtUIPHFBvf3tEF/JSELdQMWJbfI9hK0yQsQ6
         bF/U1xvVSI6pwZNJFZJKtg0zwHBO0ivuoZD+z7/+8xsHRvl419zglCFz67WtM216wFSh
         SqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068042; x=1747672842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TokNH1Htr1RVPQd8EncDveS8lHW7ErFNLxi6svxi5ss=;
        b=gJuN/rQEb2sjhboHtw7HjTjohg2JFIiAQHUqdNKLTO019WiEm8GOAeHoL127ZNlvwe
         8FZUagYj8aDiHOywskcZSQ/V+BSEw2KmZJyVfmPTeQf/rTK1ax2Twjuwq2RrKwvYHWqI
         GVC4VMfrlSeymQ8nQyCtrRKM1V/yLUFLiqlhHTQLra+czZtZ3pf1R2sfje3u99KiHkvu
         w1OIrenskVIo1BzrMmkR6Xk6nlcl3ZhN1tUXNTisXEfGPcunIp47vmhP+w2C48OAw/ep
         qsChU/K8BVG9vA2HtB+Hv+QNsiEhulC/1DVpUnGGNrvURzfNCrI3EkKIchCVKxJLjVVd
         wnDA==
X-Forwarded-Encrypted: i=1; AJvYcCWX+ILhEFRuOBaWlkPF2rdD5MX0mg++ynEFzSuGwuqSxKabfaVc8TMANRmmDUc2z2zMB+whPyPXrzGTOcc7TAiw@lists.infradead.org
X-Gm-Message-State: AOJu0YxoGESgI6qBoRedUMisI2Urx4oludNDYlJBSuRKBv67kvUyZDGi
	VZYImVZ5C9HD5MQY11dD9UtCganc1El3iETkg8+5pUfbmUZSPIU997IDZa9W9pc=
X-Gm-Gg: ASbGncvR3IGlScBfER04cBrWltJCo3+6q3er4ULPv8akj0T8WdzsjAFgpOoMoJb/k4Z
	BrtfPe7fLuRksssPT0ycI2ZLxZTiq9O1yaJ5wh6G60sNrTYutuBAVaBgdVbUjmERPbHpBo8egBx
	67WsFbkxBh92aVWEDMi+Srefbrs+CtM4xBT/mXFobzUnyW6SvYVCdt9PVv5fe7G1BZEGFcok0Cm
	0RgKFHCCYDsT/cyh9Jocup8ZIDtxG3fW0lGhJk22q6uNGibwT4YMi+uZOqOzhG2QKtkrbZD5sAH
	9ZM3yv7TiNOEEYaBYldc5n9qYVeOCPF/3Y6QkitAdvZ+2TiiLepW5qtzdPUFLjJZl17zh6npvB5
	zBPv/3Q==
X-Google-Smtp-Source: AGHT+IEe9HBXk5aMisXuJwzJQBcZUmggyJeRK/MRVhfeKfh2p+XusCVvgZz40RfLsmwKRD482heZsg==
X-Received: by 2002:a17:907:6c13:b0:ad2:2eb4:1525 with SMTP id a640c23a62f3a-ad22eb4166dmr823140566b.44.1747068042371;
        Mon, 12 May 2025 09:40:42 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21934d4d0sm636444766b.73.2025.05.12.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:40:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 12 May 2025 18:42:11 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
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
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
Message-ID: <aCIk40642nXZ3arz@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
 <CAO50JKVF6x_=MUuzjhdK0QotcdUgHysMb9v1g0UvWjaJF2fjDA@mail.gmail.com>
 <48AFA657-5683-42A4-888E-3E98A515F3B1@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48AFA657-5683-42A4-888E-3E98A515F3B1@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_094044_629228_60F700FC 
X-CRM114-Status: GOOD (  18.54  )
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

On 15:02 Mon 12 May     , Florian Fainelli wrote:
> On May 7, 2025 5:01:05 PM GMT+02:00, Andrea della Porta <andrea.porta@suse.com> wrote:
> >Hi Florian, to accept the patches, what would work best for you?
> >
> >1) Send only the relevant updated patches (maybe as an entirely new
> >patchset with
> >   only those specific patches)
> 
> Only the updated patches work for me. I don't think there is that much coupling between the DT changes and the non-DT changes (other than without DT entries nothing is activated)

It's a little bit more involved than that: 

- Patch 7 (misc driver) depends on 6 (RP1 common dts) which in turn
  depends on 1 (clock binding header). Should be taken by Greg.

- Patch 9 and 10 (board dts) depends on 6 (RP1 common dts) which again
  depends on 1 (clock binding header). Should be taken by Florian.

- Patch 4 (clock driver) depends on 1 (clock binding header) and
  should be taken by Stephen.

So patches 6 and 1 are in common between Florian and Greg, while patch 1
is in common between everyone in the pool.

If I uniquely assign the patches in common to one of you, the others
won't be able to compile their own branch because they will be missing
the dependent patch.

If, on the other hand, I duplicate common patches to each of you to
make the kernel compile for veryone, you should remember that there
will be conflicts due to duplicated patches among different trees
down the merge path.

Any advice about how to proceed is appreciated.

Many thanks,
Andrea

> 
> Florian

