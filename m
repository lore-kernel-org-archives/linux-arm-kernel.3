Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F08D5E151
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnVZ0emV6bVkYUAc532QwJ4he0bCKDKGP+zZEkPy81k=; b=18sYayvnR63CkQ/OoUA1+EiP8M
	hjOjG0Tx400D9yxx2u5+YFrqe4EcCM4FY05M3161rvzVgvDZ7LB6JKQZCo/pyMjtQY+AYU2Mm4hgv
	EaN/6oZG/oU5jIRNCM1c6voMqOljTGZb+Y8hWx4nEYLD7z/5o0NonCzqh8kcWEa/buVLMGpdAR6Ah
	kCBEW/gW75hilE8Jl3ZtuDK2WbZcXXogtED9qismlwn51QZ4iivRK2tSNPKcLtKZHARngsWy9Bz16
	PsLkTFetv4wQfpiBddoTyoNFJFE62WW4KWDsO1Tk55n64x6fBorfpet+bKPfpKdfc/v+VIEnJSBuK
	JjY7Xk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9M2S-0000000A5Gj-0A2G;
	Fri, 08 Nov 2024 10:16:24 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9M0g-0000000A53r-35FN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 10:14:36 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5c9362c26d8so5304027a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 02:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731060873; x=1731665673; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SnVZ0emV6bVkYUAc532QwJ4he0bCKDKGP+zZEkPy81k=;
        b=IF3EUZ+r0/Ubbvf99+2xpWYxbEIRPuLQ3+f6JQK0if7gds/VS8YFWLOLWmRrRe64jO
         +ah1zpX+wUiCRTYWKHVUbVwQdHRpTZbjVZY29pySBtJ3NBKSxDsjS3DqMzCUMqJo/njy
         WvizGemB066QSTMAyXKznjBtfqYPgziX7RtaaGzhldfDxdNufO0F0nHsHubMaejmChS7
         /8hurWOzsx5+9tvi0KwkWwl6eHZgsCkvs5lhZVRuSjYFBvtpeixiDgdhylXsI6xx5On0
         PCcFpsiVO1VjWuTbdqz/1GfCtFjxwPhW6KLx42MNmkE61cit47D4vq5tleQtKQLEM1yc
         CxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060873; x=1731665673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnVZ0emV6bVkYUAc532QwJ4he0bCKDKGP+zZEkPy81k=;
        b=wNlCHQR2/FOKr+nXzH4DXaHSWROvURAQMW65v79RgO8u449S0EsxLVxIEzBtOJbYvm
         Ksd3ooSJd6+YF+ti/c1iQlf+uuPzNfzYiCNxIjRwwMLzlJpwIJvmInWKA679r8zStdtB
         fyULuFPcppTVemv8E+RT00gDo5q+5oSjti72pM1bba6Ruv1r9mtTSvWc9Dm1R5K6yZxf
         m1uZG2nYa+uP+p3PyVoMcZ9ZkI0aeJRu74Y7mVHud9osp3xmyw/x1B58gOQencAaQddu
         fppX0trAVfMRDIDWsAVXN7JlE66CL0QbsqX9s8uc0Hp9jEkfOcHLsQEKnby4suXNi4JE
         S3iA==
X-Forwarded-Encrypted: i=1; AJvYcCWHTY4rXacPaVGppUgAqbv/eTG0E3wYbFEEZE+4MMQay22rsmLKGsO+greV+GeXDIKmuEGB4uyizFU3EeMMGlSV@lists.infradead.org
X-Gm-Message-State: AOJu0YzpWdooyEVYtlYH90CmnSl0MAN6r2+TM3vz0pLNQrB8By6yjYsb
	y/IvhetG1g96l6NaFv5Pi64VwCr71RdXdN3lbmyRJ+mZEj/cotIMTWQzV8NiYwI=
X-Google-Smtp-Source: AGHT+IGMkZNj149mgtvYpa+dcdi+Hv2GUHkHisgCOmyCoj4UxPuG3y0YVKFRG6NnyfhzAQT2cBQMhA==
X-Received: by 2002:a17:907:9455:b0:a9a:b818:521d with SMTP id a640c23a62f3a-a9eec9cf03dmr279872866b.18.1731060872701;
        Fri, 08 Nov 2024 02:14:32 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc4c7asm210184166b.96.2024.11.08.02.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:14:32 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 8 Nov 2024 11:14:59 +0100
To: Herve Codina <herve.codina@bootlin.com>
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
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: of_property: Assign PCI instead of CPU bus address
 to dynamic PCI nodes
Message-ID: <Zy3koxz4KnV39__V@apocalypse>
References: <20241108094256.28933-1-andrea.porta@suse.com>
 <20241108110938.622014f5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108110938.622014f5@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_021435_060565_4EEA3312 
X-CRM114-Status: GOOD (  20.35  )
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

Hi herve,

On 11:09 Fri 08 Nov     , Herve Codina wrote:
> Hi Andrea,
> 
> On Fri,  8 Nov 2024 10:42:56 +0100
> Andrea della Porta <andrea.porta@suse.com> wrote:
> 
> > When populating "ranges" property for a PCI bridge or endpoint,
> > of_pci_prop_ranges() incorrectly use the CPU bus address of the resource.
> > In such PCI nodes, the window should instead be in PCI address space. Call
> > pci_bus_address() on the resource in order to obtain the PCI bus
> > address.
> > 
> > Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > Tested-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> > This patch, originally preparatory for a bigger patchset (see [1]), has
> > been splitted in a standalone one for better management and because it
> > contains a bugfix which is probably of interest to stable branch.
> 
> Nothing to say for the patch itself.
> 
> Just here, you mentioned "see [1]" but you didn't provide the link.
> 
> IMHO, this is not blocking for applying the patch but, just for other people
> looking at this email in the mailing list, can you reply providing the link?

Thanks for pointing that out, sorry about that. Here it is:

[1] - https://lore.kernel.org/all/f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com/

Many thanks,
Andrea

> 
> Best regards,
> Hervé

