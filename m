Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCD5D767D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypveLFvkaXf1wJtqmx/51pwj85CYlxVe18qe346szto=; b=WJTidcSUDx+XqoyUOgcnpUZWkr
	aESnsCLMwaQzX9eZkL2GZZLXswWXVmmjh7fT9Y2jWMYTkEly+YHJGG9GI4oT09wc+g6toeDjrOqle
	D9zi2CoX6khAx4ab0JLdypEuhtaAFPXWlwvG4YFhV/ehRgxn4jq/FZuPg4TEHSqK+WUQqatG4bDCj
	NyM1Lzr0S4xYeks3TJw7jfeHcWx+ppjt7p4h01IDSlWttTeloavYjSp4Q1MiyGT+zKbSGSYYEbNOK
	z0u1nMaFFS1PByCWLk0ljH1TutS4gNa5RFNJcmzN7YNEOnAKu3W1rOlDWv2tUANOVglCvS4GsJgr5
	JlaAJaHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WU0-00000003s5c-15KA;
	Thu, 31 Oct 2024 14:49:08 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WRR-00000003rJv-1FAi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:46:30 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9a16b310f5so142639466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 07:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730385987; x=1730990787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypveLFvkaXf1wJtqmx/51pwj85CYlxVe18qe346szto=;
        b=PeCUB2+4d2OKUz5x6/8ZP/ORnalM3+uXWm435KHzTBeziogaWyjol0mH2y6Su00RCK
         AavTlB6sIt3XCOqUiCFpTfUq5Zvct2bk1jxsUMpf3V+Kvv7jFJI65WckRorVDAz7VFSJ
         J5sdRikgYMRV3u8dBPEdxzHGuSrCtb0+Bx6sBpZp/jPHKel9B5QlTqpnGQ/D85cXLR9K
         JWv3EHAKoqe37Cy9Axozc7PMFwiWa35esRaRLgcxeAQ6g4L/kD5UX3U4noOhxsT5QWYP
         66g840JFs1npCPTNJUUbrDxh4+dI/Aet9E4uZNf+NrlEz80/lFpdO1l+nbuzq0uj/3eW
         x4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730385987; x=1730990787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypveLFvkaXf1wJtqmx/51pwj85CYlxVe18qe346szto=;
        b=dqnqrgyQBq4FGLig1QrjbMamPtne2BQCSU3wJ3iYbB3OQscdTYVemW261CH6X15847
         Z3Vr0V7cdTmvpLF8SGH+rVIkuSnlMXMY7ftr1UNJn11AC7Eat6+MRLFpcXykfGWTCo0/
         KurSfnn+NteC97WIBf28OW3uqDylmxLevXZ1g7l4z9Bl3VG3RfTmgOZDXIjYwGMRl+IJ
         4p4kKpSoe2Ib3ZDMrsP/x3O+Wa1U5H07VV53X6TP7GX1U8BTCiJirXLlmY0tt2mMfgCz
         rR3CLXy48nvlVXvt7Pvh8hTl0Dv2W3eWakbkaIgBFRsl7hp4lUHLJO0JA1wtUCe9t3+3
         reXA==
X-Forwarded-Encrypted: i=1; AJvYcCXdUk1Udilfllh0pE4+SOuBo2xX8UnKbGgVRpmfYzZfjMtZ2GbR67WweMya2YNqlLIoKJrlro0hSPe9l+gV0gvE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs7eQTEEtpgo3vMRDSmd1fim8qm+cfgkWMAlzBlTzzgN22TALH
	yfscXB9luOTGXVYsQh7cXucjWN9w76YirUbs+6xRbpjbxNfmaMwaq9dJ5fl0wl4=
X-Google-Smtp-Source: AGHT+IHO0u8NI+kPpq4+Wzny8mwJitAvu47tgJQ19gV0TI9gjpe3yY4DuzAFhy8aDC6EsCh5Rx123g==
X-Received: by 2002:a17:907:3f9f:b0:a9a:2afc:e4d7 with SMTP id a640c23a62f3a-a9e50b948d0mr315152266b.44.1730385987116;
        Thu, 31 Oct 2024 07:46:27 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c6150sm74717766b.81.2024.10.31.07.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 07:46:26 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 31 Oct 2024 15:46:51 +0100
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v3 11/12] arm64: dts: bcm2712: Add external clock for RP1
 chipset on Rpi5
Message-ID: <ZyOYWxZZWkGnGknI@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <13ad41f172cc8605cb9b324ea0f22296c4c97033.1730123575.git.andrea.porta@suse.com>
 <eb1b630a7ee8222322d213f72ceb1c23.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb1b630a7ee8222322d213f72ceb1c23.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_074629_364341_7E6DC577 
X-CRM114-Status: GOOD (  12.07  )
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

Hi Stephen,

On 13:49 Mon 28 Oct     , Stephen Boyd wrote:
> Quoting Andrea della Porta (2024-10-28 07:07:28)
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > index 6e5a984c1d4e..efdf9abf04c4 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > @@ -38,6 +38,13 @@ clk_emmc2: clk-emmc2 {
> >                         clock-frequency = <200000000>;
> >                         clock-output-names = "emmc2-clock";
> >                 };
> > +
> > +               clk_rp1_xosc: clock-rp1-xosc {
> 
> The node name is preferred to be clock-50000000 now.

Ack.

Many thanks,
Andrea

