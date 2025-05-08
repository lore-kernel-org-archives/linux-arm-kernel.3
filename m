Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7E2C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCDiRMnhh5NRGE6kDeKql7Kl5Sr5vQvd1G2z+pchMa0=; b=3xycyAdJllrufXDerrwba2VzDr
	vgjU/NLZpMEQbRHFCFznhWYazx3b33b3lIY1kCSthIEL4fmBtvvAgBSQRlNR3LCVxl2idkplps+Rp
	rTCzoNWiA3l1VEKTlIj5f8f57/9aP7Uo7zxUut6y9JscU7bIMyEYDZq9Wp37hJmXUUB0u2+Ieb5nu
	GQVns/vmMd6YjHaZAjg5f/Yd3ceLkzPG4aVIgzKuZqvJSIHISHPIJ1m94I7pW8AiIn6JFiHXC5CHG
	MZrkQimO3M+/MVFgZUJV/zs3z9dtmir45pNv1LdBfB1zlQvgy8bxCBIIo598zwzf5kJ2PjsyAEo0y
	JKUERxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvmN-000000000nR-1iod;
	Thu, 08 May 2025 07:34:51 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvXC-0000000HZZb-1MaK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 07:19:11 +0000
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c59e7039eeso99317685a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 00:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688748; x=1747293548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCDiRMnhh5NRGE6kDeKql7Kl5Sr5vQvd1G2z+pchMa0=;
        b=GsPAeFrDPuCoFcR9lyuep+qusOcRL62Iqh7s5EJTB/KVmu9zzxf7beR3+AT80dNONX
         LDKrWLQIvU6RKX3YfBBSV60b0C9rZ3J+DLgoXSjEZ7awNH/gwk5rlgxrg9FKkzWpitP7
         Svw/zlM5GsQel9sB7slO/C+oucmtNqSCYF0oxm+G4m3Jqqu2Z5Ycx6qqY8xKR4LodA+d
         s/oqMfPgV6i/IOn130iKqo9YYE7/c7QC1SAlPVkX8OKaObS+EAo3dY3kbs3O9rMz7S8W
         zkPXUZWuTpBA7t+SwMoqTo5JlnBOm0H+aCXeVBIefewrDZA9pFrY8CAz/shoHHfhLEMd
         gPMA==
X-Forwarded-Encrypted: i=1; AJvYcCUwalzdY3m2NX9wk5JC6rMNURkyjYAuBcJ4FtPeTd0JM5unbSpN91CucOnRrQLEIlXz8qTUINCqPzFuIOE2G6ls@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5lTB1WvzN5mzr+3dTpY580nDoKe71Bz+KOOdaSi+6zT8uSufn
	Y4X8hohDIoBfCK1zg62WvCUK5xQDUtvMlSYGWOAjvbqOvyj3v/GXxLdv0Q97
X-Gm-Gg: ASbGncsZ6hoO1crB2CV3yy8Ai9ijqJ7epdlu6F2OsVwDpzLpppzh4i5kf5o+ZVcl7CJ
	WhdpYpuBtLYRwG6wGdH0wyMtEuUJPGQI3/sQspveV3vVzhcQs3eYZGRyILrLxswFUQHa/Ryny4W
	vzMEfUBEQIznn6IBYBmNOYVmGAWQmS0HEihQbYz6G3IHY90mJjoTbS2yx9H5AuXis2GCjwHe96R
	kD7DTjSEdlsznCx0oaYb4tHd5zMT/YIjWL/vK0N07Ce7bm6maKmu3QucbLIrYj+lBEbkeZ9OCQP
	VaW2MPwWBVHCEgf1s4hM4fSUZp9QhccsjySXWXLsmhVgYmMjPXJaEGIUlbJYlqU7+ZtEw6l8nKQ
	5/NY=
X-Google-Smtp-Source: AGHT+IE9kqG3wKu9nKh1EJvxo1TMe9H7FUN2VkQKhrTnVRU22IMbPsJRfj8ElRHcqJkG8FkxFocgKQ==
X-Received: by 2002:a05:6214:c46:b0:6ea:d033:2855 with SMTP id 6a1803df08f44-6f542a8107fmr84339576d6.26.1746688737849;
        Thu, 08 May 2025 00:18:57 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7caf75377a1sm321235085a.63.2025.05.08.00.18.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 00:18:57 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so9350076d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 00:18:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtGtl9N4JuzULE1FbglxU+ZW/Q/UKsMo4PraKut9nbrWjnK0fQJq5l5EAdurDm0wqO3dGzYF+IhQEsTF6K+WC6@lists.infradead.org
X-Received: by 2002:a05:6102:2c87:b0:4c1:c10d:cf65 with SMTP id
 ada2fe7eead31-4dc738bc3famr5378135137.25.1746688425863; Thu, 08 May 2025
 00:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-24-herve.codina@bootlin.com> <8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
In-Reply-To: <8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 09:13:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVvOMavxSAKaSMOwj_zXR=5h8KrrqNg4RS2Yaw3WXpKg@mail.gmail.com>
X-Gm-Features: ATxdqUHmcSjbjZfHI-fr6cqBy9DRd_HkLObPFwa-nuGiyXHv4iNIliDKKGB_NdU
Message-ID: <CAMuHMdUVvOMavxSAKaSMOwj_zXR=5h8KrrqNg4RS2Yaw3WXpKg@mail.gmail.com>
Subject: Re: [PATCH v2 23/26] misc: lan966x_pci: Introduce board specific data
To: Andrew Lunn <andrew@lunn.ch>
Cc: Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20250508_001910_364694_C66CBD67 
X-CRM114-Status: GOOD (  29.94  )
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

On Thu, 8 May 2025 at 00:24, Andrew Lunn <andrew@lunn.ch> wrote:
> On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:
> > Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
> > and this overlay is directly referenced in lan966x_pci_load_overlay().
> >
> > This avoid to use the code for an other board.
> >
> > In order to be more generic and to allow support for other boards (PCI
> > Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
> > it to PCI Vendor/Device IDs handled by the driver.
> >
> > This structure contains information related to the PCI board such as
> > information related to the dtbo describing the board we have to load.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>
> How big is the dtbo ?
>
> This is going in the right direction. I'm just wondering if each dtbo
> should be wrapped in its own very slim PCI driver, which simply
> registers its lan966x_pci_info structure to a core driver. Only the
> needed dtbo will then be loaded into memory as a module, not them all.

Alternatively, the dtbo could be loaded through request_firmware().
That could lead to a generic support option in the PCI core, which would
fallback to loading pci-<vid>-<pid>.dtbo when no driver is available.

> Pretty much all the pieces are here, so it can be done later.

Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

