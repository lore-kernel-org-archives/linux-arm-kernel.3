Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0452ED111BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3ntq14sieQxa1nhBG/basKlbuGIdYqCF0ESPB8PElU=; b=ftVxfYC4jx0E9xMUAxLclDYbpb
	yovjIi8Oh6VaswBfl6fxEPsJDD9hdn2BFjxz4FVWlkCEndgfe5R4A811BIXRdLXP2RTarf/fhMJea
	3ktF4baVCdfIRRAxorSuC78AByF0M0NGmhgE3sfN/qA/mSRYf0/2lGr8uM2l+XFoeJ5/wjW5MqpW3
	WQt72UOacU5ZGT3tmlmkxnDtABlHgr3+SM3qphTbZFrI85K3WaIPFvGvpcXarGAUUgSUPXG2LA8o3
	A8gUStSl51cfaH4V59djGM5L9PGys4j/LbZW2/5UMSN0zVPP/Q62+QBhASh66oGiAFMNg7EZhKEfp
	P+N2riTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7s9k-0000000CvwV-05xQ;
	Mon, 04 Nov 2024 08:09:48 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7s6a-0000000CvQL-0LUI;
	Mon, 04 Nov 2024 08:06:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FA7DC0006;
	Mon,  4 Nov 2024 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730707587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3ntq14sieQxa1nhBG/basKlbuGIdYqCF0ESPB8PElU=;
	b=WZTLngU33wA/P1ULCFNo2JgdIohqG7zwdBL8zM67L7WMw9uEJiGJ9vs/OEHt1kdDHJa3QH
	1RDHwkC98KU6BybAQtrUfrhAa/EyKK7JFMlLJ1jVtsenVJZXYmui7HcXnZRUyksclcqJnP
	8Kxn7QV/GcKQat03HHpO1AUb86XPr0H8Kmt31fxqcq3vxWSwm3lGDQ0aUWlv3Wa45ECESx
	fLoTMGLcZQEE66wwOMWKZkgmalP6q6Xix7rUtKvVYj5nQGbsZLApYLepj0aGZStJ78Bb6t
	AkKE3j/Lt/y/SNGcvYbq8UX14Bj/rv1riWsKEyNWSVzs0YnpwrMeLhHeIgT7KQ==
Date: Mon, 4 Nov 2024 09:06:23 +0100
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
 <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 05/12] PCI: of_property: Assign PCI instead of CPU
 bus address to dynamic bridge nodes
Message-ID: <20241104090623.53f73d75@bootlin.com>
In-Reply-To: <f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
	<f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_000632_597455_B6E6805D 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

On Mon, 28 Oct 2024 15:07:22 +0100
Andrea della Porta <andrea.porta@suse.com> wrote:

> When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
> incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
> bridge, the window should instead be in PCI address space. Call
> pci_bus_address() on the resource in order to obtain the PCI bus
> address.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Tested ok with my LAN966x PCI device.

Tested-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

