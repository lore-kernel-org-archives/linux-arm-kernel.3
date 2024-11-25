Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32BBD3B7F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg0D/GXC726IE1EJTMsV29mWCwy+CAcBXGOGjtO3CHw=; b=DKS3+lLyjoecOT8dcRCMs8DaP4
	EwBTKlqWJhWRCzZicsvrU7yEkLFWEmQewFmXiVs9CmPpj4PfzXHQePQpxyhsH2+UxxrxlDYDCGVcT
	uWQQE1NipPLYIWHX7IrNdjGTRb6bGtIr42o6UY4dStRL19W4jqsj5KbCXZvmUcKuAFJp2dTQMVvC0
	RyU+xTwifSBIHi5NCfNW3EnYLuWyZM71EjENwO82Byv4Ja7iomkHsoGDBMRAxabwYedTfPfAqPB/u
	v1UR94CRRbTH+eZq4nr6j9C4omvBMj8GgkhREtk/AhPJ3XDKt1PZrOenNMVZnuJmrewPmu60EhNiP
	d4N2OeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUdi-00000007QBH-2nRd;
	Mon, 25 Nov 2024 08:40:14 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUYL-00000007OgQ-2JxK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:34:43 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9e8522445dso599668266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 00:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732523680; x=1733128480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vg0D/GXC726IE1EJTMsV29mWCwy+CAcBXGOGjtO3CHw=;
        b=XiVkbDBuczbcc4LeWzX2o0r761vs5impooOdE2GYUqalQcWOfLWQ3TF/mepm4ny0Zs
         qgbdvslhxcxRANlFapA6M1BIwvV0jclG05GRxgRP9UO6dgdXB5CjWRVIk20Nhj8jLGib
         4ipl/NMdWq+tnyVRpbyBsBLaqWOpRyzS5EhG9k8Wyh/jx7R9EvSkzJbLZcG/GRwRJgAT
         UKyXeMfzjeJKt2iQNTg3KueUrdCznE5zgdKPLjU3tNORT2Qmo5OXNW00bcjyXqBr/My1
         QkJlivkVIldxhsd3xoS0CBe1LiIsA5/OYlqmL5SFAkiISPuolCqrhFmkJOOEZpvssOIk
         1aaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732523680; x=1733128480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vg0D/GXC726IE1EJTMsV29mWCwy+CAcBXGOGjtO3CHw=;
        b=mSpTisC1LKKZPiC4hvW7bxI9DaUr4qpLN9V+HE5w5ZpqQIkUHYDKdCgXDenr+PdjdS
         YwBUGevFbtsRbIYzgfIh6dqbGBaAct3iIRkD9G15Omk0Bl3qLm+jk3gd0BrPPQGgxRlq
         SWJCuzLcJeJcEkUyXg+bgC1UGeuqF7sUfa0H4klXISqkX7yRak/Z5JhlBAHXQrjvB5NB
         qF7DSf7XT7kdNPS8WiHCDhOtP9zhYg+516hpZULh2j/LIXx1DwVNn3bhlmTbPTQG1Aki
         wDWi9981VKYmOy1OLsAn6UQkXTVTC319uHVvbXicjIDumxq0aW7h78X/Is8DWngTlWnw
         ZsWg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/Pj4byMHhw7lRyIkcOuNlMMrUUlOVbFcG/9AlbICvXMl4OaZN5+aKysfQJjwZIKNZjFO1P2NULuiLISkMbyq@lists.infradead.org
X-Gm-Message-State: AOJu0YzJme7TQK0Ek68SEpy9+RmLvWEZUAjaN59i3RNrjj65eivT0RAC
	NHIaLf5gUcxE3nsBbf6drB2ZbTeXFAY1S5JMEIOyy+H1GQMCE/0hkily1x1s370=
X-Gm-Gg: ASbGncs4VMUO27pFDTBu9BpTk/JgsgtLxKtcfwhMMTBrSLi8kxQHbahT/0oVBvr9k4Z
	RpkTsyOehsjXUTlFMNwGUPyyuANu481l6uSN0bd8B6Pz56QBRDQeUIP+tgX6Kbvh6SrP1RHsLjQ
	ZnsG//XVQ2aSi5nAED3ijrwAOgF/xIduBZGxqVKvMwCiFWXqF2s5tuR86jve5oeEqqvZTuzG3Y6
	Ft1BTYFCzNVujZFK2FY/X/SY08WLAulLtj3V42XEY1xCes1DGLQ+OBbKwupdmreTflRYcNTwcVC
	RpuN+zacTdkeTFumycuN
X-Google-Smtp-Source: AGHT+IHTcfEoEYoZ9eKBklAA7GYxZ5kMOqK2yZ8KaAw01uPI3MZswrc9AVeFlfapHP8sHh0b3gsj9A==
X-Received: by 2002:a17:906:3096:b0:aa5:1d0c:3671 with SMTP id a640c23a62f3a-aa51d0c36femr719670166b.23.1732523679890;
        Mon, 25 Nov 2024 00:34:39 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b57c19esm433460966b.154.2024.11.25.00.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 00:34:39 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 25 Nov 2024 09:35:12 +0100
To: Andrew Lunn <andrew@lunn.ch>
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z0Q2wJBMdN1dyJWA@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <c48e6b9b178cdaa01b92ae82e8fd24c2ba5f170c.1732444746.git.andrea.porta@suse.com>
 <e57c9c8b-2534-4d3a-b762-ca9c1f7dac40@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e57c9c8b-2534-4d3a-b762-ca9c1f7dac40@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_003441_591569_96238314 
X-CRM114-Status: GOOD (  18.34  )
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

Hi Andrew,

On 20:33 Sun 24 Nov     , Andrew Lunn wrote:
> > +++ b/drivers/misc/rp1/rp1-pci.dtso
> > @@ -0,0 +1,8 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +/* the dts overlay is included from the dts directory so
> > + * it can be possible to check it with CHECK_DTBS while
> > + * also compile it from the driver source directory.
> > + */
> > +
> > +#include "arm64/broadcom/rp1.dtso"
> 
> This is probably O.K, for now, but really the tooling should be
> extended so that DT files can be checked anywhere in the tree. I can
> see more such embedded DT overlays appearing with time, and there is
> nothing actually arm64 specific here, it is architecture agnostic. It
> is just a PCIe device, there is no reason it could not be used on a
> S390, Risc-V, or loongarch.

I completely agree with you.

Regards,
Andrea

> 
>       Andrew

