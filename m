Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0B8D68B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 15:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVd4FspoJAAUQaVK/sgQzSkqs6EdCPL13NCZ5VJz7fw=; b=zhCeRHvIEPF+PuZt5T6aYv5rDM
	C2ghql4GbFrvHQxwDbtziqMEUBKiGWBMpl0cjTK5PMTlhQrN3KQdyifdlOWODbzXVHsHbkKSWDkaq
	GvGQTLbJiluPP2mUrOiA2TQIjgsRgBpDajmhAi07COM3HhPXxBUI27s4abjMwGMs5vl3P+esdNrmp
	QoS1jGi2frwEZJMEeBJOpJbCMb9TfZ36XtLRIm+dJnQP5H53OoYKADzF843rKQxEW9AqEoISHpNQM
	az9godlQZ+9L4LbAIXiFSKMQ/bbVsVGK/eBHSRON0jlV996Yq6nco5iWAwdzPswbgTG1vp3Po7H2p
	FCuj3RSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc3f-000000009uv-3daK;
	Thu, 14 Nov 2024 15:46:59 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc2g-000000006or-4ArO;
	Thu, 14 Nov 2024 15:46:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEE96240003;
	Thu, 14 Nov 2024 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731599155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PVd4FspoJAAUQaVK/sgQzSkqs6EdCPL13NCZ5VJz7fw=;
	b=k86e9dLWi4x6VwQGxiSQmmGbjdenEI5HBux7FE811k8PyybyCldwAMpyPuqWzwDU2Lbrho
	UCNzU7O+/ZTUoNfquKTMmylkmIOHrPl26ZTsLBnKx+asr2x09Co4u5vNxgvNCQnRNhDnWG
	rP4b1xH0xRIEr4RMwgM3W2c7Om/R0rRdfFnCbzYWzMXQMYE9KmayoQoqy6htuEteElsEaW
	jzn2NLBRtT1oIoazJGbNRdNJnNn0yPJmkDlI+Koz96A73l89zgJ+8R9w4fJjDDU4cCpus+
	zpwTzL7aNZvPKLHp/kCJfB0t/CVPqcvSFIssh2fwzvOdLJe0nt1igDDesUFfJA==
Date: Thu, 14 Nov 2024 16:45:51 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Linus Walleij <linus.walleij@linaro.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, Dragan
 Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 stable@vger.kernel.org
Subject: Re: [PATCH] PCI: of_property: Assign PCI instead of CPU bus address
 to dynamic PCI nodes
Message-ID: <20241114164551.46664f5d@bootlin.com>
In-Reply-To: <ZzYWso5jLkUMehQ6@apocalypse>
References: <20241108094256.28933-1-andrea.porta@suse.com>
	<20241108110938.622014f5@bootlin.com>
	<Zy3koxz4KnV39__V@apocalypse>
	<ZzYWso5jLkUMehQ6@apocalypse>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_074559_338031_C4C18485 
X-CRM114-Status: GOOD (  23.43  )
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

Hi Andrea,

On Thu, 14 Nov 2024 16:26:42 +0100
Andrea della Porta <andrea.porta@suse.com> wrote:

> Hi,
> 
> On 11:14 Fri 08 Nov     , Andrea della Porta wrote:
> > Hi herve,
> > 
> > On 11:09 Fri 08 Nov     , Herve Codina wrote:  
> > > Hi Andrea,
> > > 
> > > On Fri,  8 Nov 2024 10:42:56 +0100
> > > Andrea della Porta <andrea.porta@suse.com> wrote:
> > >   
> > > > When populating "ranges" property for a PCI bridge or endpoint,
> > > > of_pci_prop_ranges() incorrectly use the CPU bus address of the resource.
> > > > In such PCI nodes, the window should instead be in PCI address space. Call
> > > > pci_bus_address() on the resource in order to obtain the PCI bus
> > > > address.
> > > > 
> > > > Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > > > Tested-by: Herve Codina <herve.codina@bootlin.com>
> > > > ---
> > > > This patch, originally preparatory for a bigger patchset (see [1]), has
> > > > been splitted in a standalone one for better management and because it
> > > > contains a bugfix which is probably of interest to stable branch.  
> > > 
> > > Nothing to say for the patch itself.
> > > 
> > > Just here, you mentioned "see [1]" but you didn't provide the link.
> > > 
> > > IMHO, this is not blocking for applying the patch but, just for other people
> > > looking at this email in the mailing list, can you reply providing the link?  
> > 
> > Thanks for pointing that out, sorry about that. Here it is:
> > 
> > [1] - https://lore.kernel.org/all/f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com/  
> 
> Do I have to resubmit the patch with the referenced url fixed or is it
> ok as it is?

This reference is after the '---' marker line and so will not be present in
the changelog once the patch is applied.

For this reason, I don't think you have to resubmit the patch.

If you need to resubmit the patch for any other reasons (resent because
the patch was applied, modification needed, ...) resubmit it with the
referenced url fixed.

Best regards,
Hervé

