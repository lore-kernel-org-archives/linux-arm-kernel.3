Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE932C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYgnp2PSg9KL11tldQ485cPxrLluqoPttc4PhTteUa8=; b=Ll9/RN1t2NlGSncbuSVxoWBrs9
	rAGezWT5OrJRSd7B+RZri/+t1ynPFYfbT/bB8vBN7L6b2cO8s0OhO12bVbjNl5qah+ga2T0G4dLSe
	+5rd9oZZnbVu6vvfUqRtDz1XnpLfHDfr/yVmgK3QJrZnovCQozW1+sIvmMlT0P1uuKS4/JnL4p8qC
	C19IiWYiTV7kCg0Bo8/6oEUmuICbGaos73qLY+igvmPxx7OmF97C7r2UU7FURpr+EwK7pu83Bf+eZ
	aAi94vNGAtJq4OYF1WDeAOtB24xIoCXblcHAf0+R8sGhX0omV5rPBZxvpw1bewNSpRfrK0/IaBfbe
	fZGuOKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6G6-00000001aJI-26BQ;
	Thu, 08 May 2025 18:46:14 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD66P-00000001Yr8-3yE2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 18:36:15 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52934f4fb23so880426e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 11:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746729372; x=1747334172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYgnp2PSg9KL11tldQ485cPxrLluqoPttc4PhTteUa8=;
        b=Qeeje1uRbegg3IfxGZ6l7q8aL8Nc5qVv0l4MdMT2pWl1CTciwrXDU2kfCGEK1zihqD
         93V2nirUpMDEgEcfZSTxxpIjr21GrOAKReDz16j30HbBPQrWbVTxrH/ysN8fOlZCUFm+
         9rPteQvFL1fx5TuQAi6Ns008SYHmpDlW+yGcR0psLY5u66KfjQH2knKM/c3qKjtUUbyK
         FtgXsP6BxlxndtUKvBIZFrVuyXXgxsVrl7IPH4ubZW87R2CQ3bhpU/3w9US9gzypGxGC
         rCDOmpAvYZqrqNbOEFAAYtHEIZFgnfnjzBgHzRbVfup5OMlAMcNg/7UYng3tBHD5/Z+8
         +xqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXadcPx1d1td5szCA6U4nnD8/nVnO5xcF5JH/FXXkD/kJgiVuyAzIgnnzNGzIFHvRHeCj/UNw5hpijXie3pk7Sm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc+ZfSb26wFVIOH57QOFNHpEubH+SAXzWUl2kwqd6TFOYBjONT
	R6MrEvRe5u3ioXo1downYJNJHrxJuMl3vdcKxIoSLAiped+g09NtJXesNKJc
X-Gm-Gg: ASbGnct7UiZ7y3p7L/N/qnSswK81IroPed+33BdJGsbVqMY0yAfO4WC45Kt07gtF/VA
	Nb64pQGZSjuLPNS/y9BzZqPesVYRzyJn/xQkBGIRhXiDn/prchp05U+XMgR/AWAkXgkLs+infQm
	0PTLWn7yLQGUGS8aJKaMAIsQMxUF5RDew1+EH8+JaY6ntVsw5HFv7K7XXJf3JyfxH0+ISOOXnYr
	bTerfNM2tKqnHADTBkfDv087MqQbXGqpv9IvcASQk47wS4WR6f2vaQuU3okjB2ObnYoAZlIDaj2
	WjbVjCPJQK+LcNdrNMdu+1eRax+re47IAdbyeH9gBbzFuTo2pllrChT6Nwuf9CtEDK5v3SO2bmy
	Us2xwk3M=
X-Google-Smtp-Source: AGHT+IFGyOIzGp3/LgTKZR0P0qbMKQSAOHTDORwmoj7JKRsy/jqeVWgM7SAsnofrjg1AhK98V0f/IA==
X-Received: by 2002:a05:6102:2b99:b0:4bb:e36f:6a35 with SMTP id ada2fe7eead31-4deed36f807mr592626137.14.1746729372479;
        Thu, 08 May 2025 11:36:12 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f613b1absm143956241.3.2025.05.08.11.36.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 11:36:12 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52403e39a23so776298e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 11:36:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrM7D8/RFFwb3k33lc2t8zJMEk376rErylRfznBYcPsCCwfJijUZ0bKfXiICQz8DvVJdYwKKUzsHaZaeg94NIi@lists.infradead.org
X-Received: by 2002:a67:e7cc:0:b0:4dd:b037:d23d with SMTP id
 ada2fe7eead31-4deed36f9ddmr542907137.12.1746729371961; Thu, 08 May 2025
 11:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-13-herve.codina@bootlin.com> <aBz4gxUlnSgEtHn8@smile.fi.intel.com>
In-Reply-To: <aBz4gxUlnSgEtHn8@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 20:35:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe9XKDvszbkz9jx=qcyLufFMnoG3BcTpbyay6cQZAJ0A@mail.gmail.com>
X-Gm-Features: AX0GCFvrzDOY8sW8kwNxuZ1_3pAgsil5zL802IfBcD5409O6It8refjLWt5eRkA
Message-ID: <CAMuHMdWe9XKDvszbkz9jx=qcyLufFMnoG3BcTpbyay6cQZAJ0A@mail.gmail.com>
Subject: Re: [PATCH v2 12/26] PCI: of: Set fwnode device of newly created PCI
 device nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_113613_985123_C8C5AF94 
X-CRM114-Status: GOOD (  20.92  )
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

On Thu, 8 May 2025 at 20:32, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, May 07, 2025 at 09:12:54AM +0200, Herve Codina wrote:
> > Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> > node are created and filled based on PCI core information but the
> > fwnode device field is not set.
> >
> > When later an overlay is applied, this consuses fw_devlink. Indeed,
>
> consuses?

confuses

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

