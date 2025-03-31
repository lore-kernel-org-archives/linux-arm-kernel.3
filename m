Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F9FC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkzLnbFVOYDObQyUvRiCdFcMVyW9LHfEzzCWp7sSsRM=; b=aNOwZU7oH/lPabz/7v9tUWRhaZ
	0GLEV6KukY8n4RU+/se0QKO9yn1URdC5+BeXqxnzw6S3npbPV/7jk3eKLXsVP8ubQXKWtpO+lXmmj
	0uBr3h8nMEIE8XrEgSzdWX3NOnxC2r8KPfX5eg8Bq0OplaLlEZIc4funm8otBBx49u9XovI0T+lST
	3tXNR0gu4fHBaR8QHm2F9Z5e35pfKlWeVHvqW4HgWqLxkYvIP2ML4NMxjWHMY3Lfv3wY/kgMd7iHu
	lFcIpDOJ1DPmXX/5kl5kNfxFpX/IZlDlkp7N6N47A/tNNbKm/Egfvc0KFc1TUvaBSv+BFpVOEwfxE
	k6HiJGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBLV-0000000HVIa-31qz;
	Mon, 31 Mar 2025 09:22:17 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBJm-0000000HUqP-1lNX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 09:20:31 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so7170025a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 02:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743412829; x=1744017629; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vkzLnbFVOYDObQyUvRiCdFcMVyW9LHfEzzCWp7sSsRM=;
        b=QHDfP+G6/sztNoh7nv42ce9RQiONZRQIRc8FOOPOSCJsfn65pVVhHR4JkCWeB/iuOn
         kal7ZjUJ9Ww79A0N1oIKzljPfbkBs0JVbzpr5dpRz2LqJOLS8pVQY2kctz9UYXsut9lC
         Z891EVAHkk1jd+Frdbv0kkQSYUc2cOl6B3TU1s1t7iozgcnEVXxGsobo76EaZ/EiqZ83
         2dz96aOQOW1WVWMPCyHIqCsXcFHoQZzoeZbVrvuO5qJNi90qbr8L/9GKMJyxrWMiVFM2
         kV8xhs6mGp2hY0NaJ7WAusUG7bVk/H/z+AhkzGFiDTGSfm68D7HEt+tt3QG5+u9HDzQk
         o6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743412829; x=1744017629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkzLnbFVOYDObQyUvRiCdFcMVyW9LHfEzzCWp7sSsRM=;
        b=mUFhcn07UxfXKzyUt4mthskkOS3FjwHHcZJmnNbhkcSmyUyj0NAJAVnNE+Uydfl4es
         bQGDEiY4BZPuHIaUprOlsag2HtBqG+UipWF6DvNsigUTvu4Re4klS/i8HAyL3Kro8Sa5
         BmX0/8lnToIkGHk96IGFkSVKDelmWAUu7Oe77Q1x2teS8sDqC3WnAWQUKJ7txnw2M1MZ
         TRBICFNVDG2H+ONGVgAYkLRPiF+dV7DvF2HFFxByyJRQPgQBxTDEREBVCAor65+1T5Ga
         g/LwKJwqc1l85Pr6W1jTJYH5aHjlWg7XShb5NnMaULVbS4GVXSRTKzbAbePwt6YbhTh3
         lHJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4dnrYIg4bdex7jogUEt7J9Fy/Zbl676pCBJwhORc5C7HAKQmCUkwu8PrqpNXkShiVApIrdzLcSgRlhbs3v6YC@lists.infradead.org
X-Gm-Message-State: AOJu0YxIdwXqSQ6Jju+ogZMEdnfM5TQQXKWyyOliQwCw7guUTXz53F9f
	X4LLfHEa7JCzgP1BEXCiiSIcp2Hu/+Z5BMMgThl5TCPyitJCRnvV7Y9U5bi/Op4=
X-Gm-Gg: ASbGncuGEOlVciw20femrSNvS0Qbyv1MGXAdJy/sPAfTDbWo/ka0StddfO51AaryUYx
	3gSebwwedjHCKck49crechVTt3WcgKM+hr1TFzFcjknQ51IZfgHXJL7YwKnKdwV+74LUNq4V7Un
	e87gAWekZYTYTinuT330sQhaizQONReSLxh5HAYt78PrIghLftWNxPpYa0I+G4BTZF0QJg0Uo6O
	I5PoldcuARXqimT+fJlKtyVCfovnffLO8S2ITdmwwa5EZOmAtHviCMPeQIuiy3+g/TibADAyb2S
	zxFxG500CihYlKZ7irblOEGzQqEs8l1/h0vEM5BcQhq2QrrsAyWOC2Fi+OcghDWGaxWsEqgnRVQ
	ir8uu5bsY/m9wGVAbEbx1dRo=
X-Google-Smtp-Source: AGHT+IFw4ZQBM4RCOBDHsaOKEO0WJ/K/tqyXI3QtId7X55gIJKhmKgjgqUxtnj7DaAzH7tFUE8PTlQ==
X-Received: by 2002:a17:907:8686:b0:ac3:ef11:8787 with SMTP id a640c23a62f3a-ac738b910e3mr830432866b.54.1743412828665;
        Mon, 31 Mar 2025 02:20:28 -0700 (PDT)
Received: from localhost (host-87-5-222-245.retail.telecomitalia.it. [87.5.222.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7192f0c66sm591000666b.78.2025.03.31.02.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:20:28 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 31 Mar 2025 11:21:45 +0200
To: Krzysztof Wilczynski <kw@linux.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
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
Subject: Re: [PATCH v8 08/13] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z-peqcNpvIbKa1MT@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <3fbc487bc0e4b855ffbee8ed62cfb6bf3b0592e8.1742418429.git.andrea.porta@suse.com>
 <20250323114945.GD1902347@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323114945.GD1902347@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_022030_458039_7E7909E8 
X-CRM114-Status: GOOD (  12.54  )
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

Hi Krzysztof,

On 20:49 Sun 23 Mar     , Krzysztof Wilczynski wrote:
> Hello,
> 
> Thank you for sending new version.  Appreciated.
> 
> > +	case IRQ_TYPE_LEVEL_HIGH:
> > +		dev_dbg(&rp1->pdev->dev, "MSIX IACK EN for irq %u\n", hwirq);
> > +		msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK_EN);
> > +		rp1->level_triggered_irq[hwirq] = true;
> 
> [...]
> > +		if (!irq) {
> > +			dev_err(&pdev->dev, "Failed to create irq mapping\n");
> > +			err = -EINVAL;
> > +			goto err_unregister_interrupts;
> > +		}
> 
> A small nitpick: "IRQ" in both of the above.  Not a blocker, though, so
> feel free to ignore this feedback.

Ack.

Many thanks,
Andrea

> 
> 	Krzysztof

