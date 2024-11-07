Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6CCD5AE75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDS79c1EbW77w8pj3qSP6QnMmTuMvK8jjpykFUSlOEE=; b=EhyaMaBAHod7mGAkAfWaF6pAPK
	K+08sUwrhNzEVU7w5lTDD/Z0XL0KfmgPRwu7m0Qg9JLmtSK0eWYchRsVQ5lx8v7mI4DHRlEUDTBAy
	nuDZJgy0WuwdOxNoDKJIKFy7q+V2DEyzznqzDNnoFkpy+h6Gd7WtH9ODcf7wqMkSMBAU2XtRHvYMF
	TRRrwZUZF5x1/VYY7hogiiuJHG5GlAZCj5Bf4Q+w80mRjj2oFOt8rijn6nb9eDGhsc1T2YTK+CBm5
	qqxnCcK75zbjuhtlQX3fj6VeY2z7BzK2Nckjjc/eD9FkQD7vEJMn7NZoRv6eFj3iYheMV/vfjZQvW
	LkdnYxYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yXr-00000006FrD-47LN;
	Thu, 07 Nov 2024 09:11:15 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yTE-00000006F57-2n3s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 09:06:30 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a99e3b3a411so313243966b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730970387; x=1731575187; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LDS79c1EbW77w8pj3qSP6QnMmTuMvK8jjpykFUSlOEE=;
        b=Jc8QHOY7PJ3IYM80d8rwMEGuyzwltfyTH+srUPNkHzRDXKueDLndZtkUOphVq6wt3m
         3f4dDcpJUJHoUg+4krVWYdTSPBBI4q4QDJ2F6rUDA23t9MwWejR9SniaWJhL60TLyMa8
         FZJv9anDiqy5eeHiPN6TUPCau2tza+y+47PXa08UmsUSsrvFgDo7UyuxxQ/5FkGv/HdV
         /oOhfWa+IJyuM4F1WxMhfh783NzoayPo8N+9mgpDKdktyhEYbFi6zTxG58YwZmJjpqFz
         nygcQNID/F9+fRgunRP20WQ9BW4PnOpTTveykraLi290G8O7wFtaIbohUmQprGxq3O/D
         fH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730970387; x=1731575187;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDS79c1EbW77w8pj3qSP6QnMmTuMvK8jjpykFUSlOEE=;
        b=S6LMhIVqtoG8VhGR/WLbyBgcpZ8wyXceWt2suXdHFTGjEQbpnnOS1emMFedj3gam1j
         GxhWuOFGalH9mBqbmOHg5S3gG0x51fWO/94pJHiax02W6RJKs7H5qVcUzyndwsEfpNQH
         vSbGfu5Y015yAzag9WhTRcYtlr01AbOKW5bZzqCY7G1SK0gfYV8cteMBJjIeLzpQyV8f
         QX2tds27AXnr5QQsxFbzb5OugRmIyvueD9Ebb/n+leMcJftONeWchFHfY269xNtuzAbz
         B4/ta5SUkOcR3gLtlQw4mkzay0d+v+3qaD31Fpyj/KvGSSyIVDMSwEu4UfKM5ZxeSGnI
         DR1g==
X-Forwarded-Encrypted: i=1; AJvYcCVT6C63n44/nXWwq9DlLWStB3e89QPc5N6ttSmLQWZpcuVIRBmnj7vqEEvhk/70FbcXDvFtjAa67riCvG2n3etN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3JUVQxJ0WhZS3YzXtQY9a5iIhAfgg4xF/SC9XGSFqyMw3sTM5
	gthUOkWi/y1pW6Odm4BsN4epT87IHZqpS1JVvywBELuocqEK13LOyRxyoChRc5w=
X-Google-Smtp-Source: AGHT+IFON3UoYGa4dZUjWhusmO+MQQIyUIBnD4omw89HENTEvvSMRWoF17W5/XTmfi7sq10ML4ePGw==
X-Received: by 2002:a17:907:930d:b0:a9a:ca:4436 with SMTP id a640c23a62f3a-a9ed4cb3071mr214594766b.13.1730970387092;
        Thu, 07 Nov 2024 01:06:27 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0defba9sm63637066b.165.2024.11.07.01.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 01:06:26 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 7 Nov 2024 10:06:53 +0100
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <ZyyDLaWsikcNw4wT@apocalypse>
References: <20241104150521.r4hbsurw4dbzlxpg@thinkpad>
 <20241104234937.GA1446920@bhelgaas>
 <20241106143511.2ao7nwjrxi3tiatt@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106143511.2ao7nwjrxi3tiatt@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_010628_759079_67AA9399 
X-CRM114-Status: GOOD (  29.42  )
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

Hi Manivannan,

On 14:35 Wed 06 Nov     , Manivannan Sadhasivam wrote:
> On Mon, Nov 04, 2024 at 05:49:37PM -0600, Bjorn Helgaas wrote:
> > On Mon, Nov 04, 2024 at 08:35:21PM +0530, Manivannan Sadhasivam wrote:
> > > On Mon, Nov 04, 2024 at 09:54:57AM +0100, Andrea della Porta wrote:
> > > > On 22:39 Sat 02 Nov     , Manivannan Sadhasivam wrote:
> > > > > On Mon, Oct 28, 2024 at 03:07:22PM +0100, Andrea della Porta wrote:
> > > > > > When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
> > > > > > incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
> > > > > > bridge, the window should instead be in PCI address space. Call
> > > > > > pci_bus_address() on the resource in order to obtain the PCI bus
> > > > > > address.
> > > > > 
> > > > > of_pci_prop_ranges() could be called for PCI devices also (not just PCI
> > > > > bridges), right?
> > > > 
> > > > Correct. Please note however that while the PCI-PCI bridge has the parent
> > > > address in CPU space, an endpoint device has it in PCI space: here we're
> > > > focusing on the bridge part. It probably used to work before since in many
> > > > cases the CPU and PCI address are the same, but it breaks down when they
> > > > differ.
> > > 
> > > When you say 'focusing', you are specifically referring to the
> > > bridge part of this API I believe. But I don't see a check for the
> > > bridge in your change, which is what concerning me. Am I missing
> > > something?
> > 
> > I think we want this change for all devices in the PCI address
> > domain, including PCI-PCI bridges and endpoints, don't we?  All those
> > "ranges" addresses should be in the PCI domain.
> > 
> 
> Yeah, right. I was slightly confused by the commit message. Maybe including a
> sentence about how the change will work fine for endpoint devices would help.
> Also, why it went unnoticed till now (ie., both CPU and PCI addresses are same
> in many SoCs).

Sorry for the (admittedly) confusing explanation from my side. What I would
have really liked to convey is that although the root complex (that is itself
a bridge) is the ultimate 'translator' between CPU and PCI addresses, all the
other entities are of course under PCI address space. In fact, any resource
submitted to of_pci_set_address() is intended to be a PCI bus address,
and this is valid for both sub-bridges and EPs.

> 
> Also there should be a fixes tag (also CC stable) since this is a potential bug
> fix.

Sure. I think it could be better to resend this specific patch (and maybe also the 
patch "of: address: Preserve the flags portion on 1:1 dma-ranges mapping", which
is also a kind of bugfix) as standalone ones instead of prerequisites for the RP1
patchset, if it's not a concern to anyone...

Regards,
Andrea

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

