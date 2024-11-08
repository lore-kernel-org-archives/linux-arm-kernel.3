Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5748FD5E150
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 10:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zo9a3WX+AKY7z29IK1TOw93r3Q+54c84vMyZ0f7WcbU=; b=z++3d2YI8rnQzSgn5Qk+1pWj+E
	4KDxLAJFTL9UMqjYQoGFIJFqtwPhK/3/LWw5NjQ3a//HVf0ZiGr+MHbA1grgCiI6XF2KImEvlRxGk
	GVY0xbxKayefnsKC6+NcXXgNQmBtFAfDl6aaAFLAVgFBC2CwQpyN2eZWEU48QrTUm03IhIpF5gfQ0
	gfx9wbyMeFTPkLOdlQ21odJ4RLg8HM/pRExawnuUS6xrf/cQjUq9MuYfKkbs6i3Ouo4zWa5bNnuGt
	YBJqUpQVNxVQDFU1ADghYq6wUw+S528IkoWizSalVE2qvL6qe3ETfubdoW6Qo0EyNlEG5x933oCIg
	03ZYCqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9LyU-0000000A4Xq-13SA;
	Fri, 08 Nov 2024 10:12:18 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Lw5-0000000A4Cy-2QFZ;
	Fri, 08 Nov 2024 10:09:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A32631C0004;
	Fri,  8 Nov 2024 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731060583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zo9a3WX+AKY7z29IK1TOw93r3Q+54c84vMyZ0f7WcbU=;
	b=o7pO4ipdihEntoMdvZqFEKJjTRZ7/CeS3sgg7kh+laZ9rFh+g4vs5Sps91RvX9Vvuy0DVU
	+Fu3Am+YaWELSYw33/fpYLgb/sFnkcQF3P0w7jllmxDrVQ5bA/0b2g5TFhKrygAOPEFi5P
	WD3Lwb4z6eVmrjDHe8uYBFLQyZ0hXBeC+CUDP0ErV6zCzvvTSYDDyUq1c61/HEjPHydjzY
	cNEkSE+2xQ00+zc2gUacgr93r35achp3BRsCupJlsrBkrJAfVWpF49gK/8zBO4npsf9QCH
	54tRNmFjjkDcnBPe668b5XKqzVMMcu6Pec56U8mD2mUzXMQ8NZQu0a2VpkEX1Q==
Date: Fri, 8 Nov 2024 11:09:38 +0100
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
Message-ID: <20241108110938.622014f5@bootlin.com>
In-Reply-To: <20241108094256.28933-1-andrea.porta@suse.com>
References: <20241108094256.28933-1-andrea.porta@suse.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_020949_826321_D3007008 
X-CRM114-Status: GOOD (  11.83  )
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

On Fri,  8 Nov 2024 10:42:56 +0100
Andrea della Porta <andrea.porta@suse.com> wrote:

> When populating "ranges" property for a PCI bridge or endpoint,
> of_pci_prop_ranges() incorrectly use the CPU bus address of the resource.
> In such PCI nodes, the window should instead be in PCI address space. Call
> pci_bus_address() on the resource in order to obtain the PCI bus
> address.
> 
> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> ---
> This patch, originally preparatory for a bigger patchset (see [1]), has
> been splitted in a standalone one for better management and because it
> contains a bugfix which is probably of interest to stable branch.

Nothing to say for the patch itself.

Just here, you mentioned "see [1]" but you didn't provide the link.

IMHO, this is not blocking for applying the patch but, just for other people
looking at this email in the mailing list, can you reply providing the link?

Best regards,
Hervé

