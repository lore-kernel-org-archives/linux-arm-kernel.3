Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE448E67805
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 17:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niemCpBaWtNTD33HK4hY7EmVvjCf6wQeZoDXMitV7Gw=; b=EAn+PhUGLvwl0tuPJi2nwZyKzf
	X3fjE+uq0yFBocmzhnhDsyUtyd4oeZvkf6EtwgRRP/rT/K1yCaSIjBoID/NmHAaU97jw6VnrDhoi8
	wlZBKtA3ZPtpVu+WI3AVUSvP9sr40KqsnIE0KL+wC3g+2vqZGfy2bs4IrNz/g5/TTTVPXwjZhEe0Z
	QI5VfrZpPiFt4+p1hKRPGy6Qzm9GMboWae+v0XXx4C1p3iyS6yWsl10U1vB7WpxKBk6BeDVenQMIs
	McJ7QCmpxFUmiGH0mwnDwPPUSaC1zDIbYEKZpJ2f8tCT5NSnhPDgt5nxgKYoOtB8C4yehGEN1Nx9q
	KjbG7bwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7HeZ-0000000A5Wv-37bB;
	Sat, 02 Nov 2024 17:11:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Hcu-0000000A5LJ-3uNl
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 02 Nov 2024 17:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=niemCpBaWtNTD33HK4hY7EmVvjCf6wQeZoDXMitV7Gw=; b=iSoNH2Ss40efHMNUsUGNEEfFDo
	Ap+FvLVe4VvLZv7dpA/BTxwzIaZDhDNu1HFpGTig1VGyLJrM/BZ4SoAF71uiQcPwxDQm1btH/4UIo
	Zh/xq7SlKyXVI1iXFsKJBWghfpEJI+MFNgshfkA3bKfn65a1KRCXW8YMUTkP48BWEcOos9z044Wta
	H8PapqY3dBTo9dmP23bDlhDFFMXib0IW47oWkJoF5vsyEZiCKeZeddeP7KF1sWwuTXsgDYKmrUw0b
	sBEbPOGX2U1UfeUNdXIdFBF5lGHhtKBiiXyoOui/U2ibzZXHHVnD0XJD8gOI52O/H6GpvQqzdRaeS
	gTgHTKBA==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Hcr-0000000Aygz-0MCs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 17:09:27 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso2074954a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 10:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730567361; x=1731172161; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=niemCpBaWtNTD33HK4hY7EmVvjCf6wQeZoDXMitV7Gw=;
        b=fwc/6LjUjxsLppHZS0Fo/i4vir29uoqXHYxzWzXB4P5qX3JJs2rwHH3gzehdydfnLv
         i+X19QNhn1wvYWjAVPgknvjCzl0L8zQ4iQMmYjqP1xzMcWhQtqjvR0xdw6hI/uSt2UwN
         pwvbTnI1Wp3nSoAPlYCVD5KVB0loX/tViw6WRiAV1I8dhVClMKC/MBXVqcPwpa1gI15X
         ZeAnEMbwvPPbt18E1T5IxFmoDZBjIzI0+jsz/voOksw1FJJtboV1NOqfNKwHvus++Y3M
         lg4TIWkQZNL7iom+OSC+CS/yUWy19uA9CYZPnzvxGrsh6rsXhNysUJerGoMACKqbN3hS
         E8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730567361; x=1731172161;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niemCpBaWtNTD33HK4hY7EmVvjCf6wQeZoDXMitV7Gw=;
        b=TNuoy3n3ps4Eci6DxOcJdhiF92Ph+XaiW5p8W6ILcWck1ofxD5wsOT41XMH2/auuJR
         TPQQv/BQj5rohB+/YvnPq5kYQt+emJfC6fDV0mcdHQoZ0cNh2IMeUXLfp1LgIUw6P6R8
         qZeKJROJ+9kR0ljxiZNuEcTHFd+p0Glq1HhKUwR9QT7H5Ha0a3Shid4rQ3n2/0UJJ713
         +8o8JZpx94NQKL7WWyt2UvDHpam40u02JRLP3p4d/UTMwZpFxVI+JesqmzN5WEnm2pH+
         WxjZyZcE9ryO4O3o1rjpnzzebcCTssw3vHNgMEElPnjioh3Rff3LwyWwThTf9mNlcSFs
         C1ww==
X-Forwarded-Encrypted: i=1; AJvYcCWGjHvRb2CCFVZrdNGEYa9ciJch4eqHNihm4TwWeAW6B5ZvfbVMaUmCNRNDytv3idqAhCIzJPNd23nLoSsG7cl0@lists.infradead.org
X-Gm-Message-State: AOJu0YxOOifVsU0SD6XvtivZbfLXyrEBpVsFt4h66ozit5oVNWZO78M7
	Mdnt//XPxJQrnZPcMh8Zark82qq2SY4LDjYo/FF4SPpU2OpcgQfbS4nCjld8cQ==
X-Google-Smtp-Source: AGHT+IE57YiawuzlnoPc/P8d7TUPT1NkGH0WXOgqoMFowdmCtN7jxWsbHJCr+a/Z5Z8OOuUwKEUShw==
X-Received: by 2002:a17:902:e810:b0:210:e8b7:58c5 with SMTP id d9443c01a7336-210f76ff16fmr219810025ad.56.1730567361173;
        Sat, 02 Nov 2024 10:09:21 -0700 (PDT)
Received: from thinkpad ([220.158.156.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ed8efsm35882265ad.55.2024.11.02.10.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 10:09:20 -0700 (PDT)
Date: Sat, 2 Nov 2024 22:39:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
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
Subject: Re: [PATCH v3 05/12] PCI: of_property: Assign PCI instead of CPU bus
 address to dynamic bridge nodes
Message-ID: <20241102170908.fa5n6pz5ldxb66zk@thinkpad>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_170925_465870_41C70EF2 
X-CRM114-Status: GOOD (  19.42  )
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

On Mon, Oct 28, 2024 at 03:07:22PM +0100, Andrea della Porta wrote:
> When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
> incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
> bridge, the window should instead be in PCI address space. Call
> pci_bus_address() on the resource in order to obtain the PCI bus
> address.
> 

of_pci_prop_ranges() could be called for PCI devices also (not just PCI
bridges), right?

- Mani

> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/pci/of_property.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
> index 5a0b98e69795..886c236e5de6 100644
> --- a/drivers/pci/of_property.c
> +++ b/drivers/pci/of_property.c
> @@ -126,7 +126,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
>  		if (of_pci_get_addr_flags(&res[j], &flags))
>  			continue;
>  
> -		val64 = res[j].start;
> +		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
>  		of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
>  				   false);
>  		if (pci_is_bridge(pdev)) {
> -- 
> 2.35.3
> 

-- 
மணிவண்ணன் சதாசிவம்

