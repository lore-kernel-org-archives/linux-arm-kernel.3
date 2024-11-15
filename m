Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329FBD6DDF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqEZZaXWIaNRK9OLE5Wx827F0bUtvaOZcgVtTnimPxg=; b=gYOTQKOFPWv4qBUigm8wSMz64n
	7e3WAOxzZSe5wX94vCqpAZ4mNHZ2NtSMgekH4+9nqgf1+dflXYURBA961LsK/dQtdPf9zWBhG08kM
	0FR/Blxt+A600cdTaje2eYC//ZijimjWv8bf16MLp4SHzwzPS5hEfWwUumysj8Lus/cm8GLFM8ugD
	9jLJ9aKgHdaHPWvc84YgSV9R/RrDQLM6PFDZCiXHO59WFgZR6BWYkMbt4dbUMcIgVopOyG4e/LoVh
	l+LTjU0haEK1eIMH6r5A+UK9XX/JqeRcrKuwf3taL65+iLys0wUit+ZyVKBptFRvi9IrDOr+z6C7R
	R9I99QwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBtyN-00000002R5S-0GvZ;
	Fri, 15 Nov 2024 10:54:43 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBtxR-00000002QvC-28Am
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 10:53:46 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso4509231fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 02:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731668023; x=1732272823; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqEZZaXWIaNRK9OLE5Wx827F0bUtvaOZcgVtTnimPxg=;
        b=EUUeHZTJIQj/aETrfVRp/0G95EzOgHbYaCDLcXAkchBDyyotlZozD3Q1GJ1iaQwaXP
         9o/aIvt3TN6yIWB43RrlC6kwn8eQBae8RTNfyAUh2I+hUf5KxiJeNpdbvdN9Rw6qEN+I
         nXoADgPfzP6kN5v4cIqZq3mAxUE9CcdFiPEANrE4U8sltQH91Vfd/0ibUlKNf5ttZpDp
         AMh/EhZkDhOeDrOvTzbvRtQdDYEP3hm/MW9wJrh2VgQbgtatHYMcUumd4pVBJulZJaeZ
         /XBqZfjCFNLXyKtVGbWoMxb0bcoyBkH5Kml85SeEANDaoKbhacH5CTV1tmnVjIt7fc4Z
         du7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731668023; x=1732272823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqEZZaXWIaNRK9OLE5Wx827F0bUtvaOZcgVtTnimPxg=;
        b=bjY8SqTdimj/FUJUFTTgTIhsSRcDko42ZY28ONr1cp6WK5NS2SrJ1jhGxdrIK88uOq
         970huIddQM/cMfhbzPKTf/H1FDz1q7FJVNcnHqcHcKPtcUXDhMyWDKtHxl2gH0v0QP2N
         vjKq2eWamv0i4h+sLcW8uWA+7MoH5eAtaTcsl89X8gd8k8lflJpuneijqke8ap/6mwNu
         tXWgeFwW3ztkz/UozeI8/SbIiMCWaMEm/gqYTAFlFKe06Gy8sXxVTkkqqXh7HUNLD6/q
         mCdEFmizrDRxNEZj7YpRnQZqipasNYU1k9T4FTSQQitLd84sWXeInCEn/psQlFwwckmV
         5Z2w==
X-Forwarded-Encrypted: i=1; AJvYcCXhjFr/zmAvSLspWHkzp0KDx2qnuI1kiOzCIdnKVu6/8WFT/EPMd9Oi7dnQeFYHR1OQ+wjS6q3SOuGITksvPdxd@lists.infradead.org
X-Gm-Message-State: AOJu0YyEFTcXG0eO/Yx0mQPRyN7eip5HquctVbWT5GlAV3M4CvGd+0XS
	JpKl8JTQpc73Q5vvqyPDTlNqeJHzZ2jdXCSbAAK3dSAOxgZkuE6aYYdQiI+bvQY=
X-Google-Smtp-Source: AGHT+IFHVLZ9JHkGOvekL5vmiZxKEfDLHTUYv8vjzg0FSLM0sIjZA/dYE3eiUJZBbLbHkNSDwDDmVw==
X-Received: by 2002:a05:651c:245:b0:2fa:c59d:1af3 with SMTP id 38308e7fff4ca-2ff606933a3mr12846531fa.20.1731668023447;
        Fri, 15 Nov 2024 02:53:43 -0800 (PST)
Received: from localhost (host-79-19-144-50.retail.telecomitalia.it. [79.19.144.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf9010b12bsm531260a12.41.2024.11.15.02.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 02:53:43 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 15 Nov 2024 11:54:11 +0100
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
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] of: address: Preserve the flags portion on 1:1
 dma-ranges mapping
Message-ID: <ZzcoU8ckE7wXWC8w@apocalypse>
References: <ae3363eb212b356d526e9cfa7775c6dfea33e372.1731060031.git.andrea.porta@suse.com>
 <20241108165654.GA1665761@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108165654.GA1665761@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_025345_559839_2708D6AB 
X-CRM114-Status: GOOD (  26.04  )
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

On 10:56 Fri 08 Nov     , Bjorn Helgaas wrote:
> On Fri, Nov 08, 2024 at 11:39:21AM +0100, Andrea della Porta wrote:
> > A missing or empty dma-ranges in a DT node implies a 1:1 mapping for dma
> > translations. In this specific case, the current behaviour is to zero out
> > the entire specifier so that the translation could be carried on as an
> > offset from zero.  This includes address specifier that has flags (e.g.
> > PCI ranges).
> > Once the flags portion has been zeroed, the translation chain is broken
> > since the mapping functions will check the upcoming address specifier
> > against mismatching flags, always failing the 1:1 mapping and its entire
> > purpose of always succeeding.
> > Set to zero only the address portion while passing the flags through.
> 
> Add blank lines between paragraphs.

Ack.

> 
> > Fixes: dbbdee94734b ("of/address: Merge all of the bus translation code")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Tested-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/of/address.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 286f0c161e33..72b6accff21c 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -455,7 +455,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
> >  	}
> >  	if (ranges == NULL || rlen == 0) {
> >  		offset = of_read_number(addr, na);
> > -		memset(addr, 0, pna * 4);
> > +		/* copy the address while preserving the flags */
> 
> Not knowing the surrounding code, it seems strange to say "copy the
> address" when the memset() fills with zero and does no copying.
> 
> The commit log says "set address to zero, pass flags through," and I
> could believe *that* matches the memset().

Ack.

Many thanks,
Andrea

> 
> > +		memset(addr + pbus->flag_cells, 0, (pna - pbus->flag_cells) * 4);
> >  		pr_debug("empty ranges; 1:1 translation\n");
> >  		goto finish;
> >  	}
> > -- 
> > 2.35.3
> > 

