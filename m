Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081FFC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTbyL4rDqJd0LCAW+KvoiiMK8wPz1NsF8UcJJ8cPhiw=; b=TjUy2tZFbJE2QejnXFQsl/keyw
	wvI1pDeydu3tbPpt37hnYQACnUcgyiX/QGraOTpsloJq05ben82Tn6XuGLaafFjLIFCNwbDzHEXrS
	3uz5lhzkJL6oHJMsFEtz+VeS+Q7u39lEDZwLo2z+nV7SzTjJsBEZ8wJcoZq9R5wnhJ1emn8zafmkV
	yQbHLRmmAxk2bu1r7qpNMvKzWiYOarFnTIUzO4JjYqyL7Kq31qRV/f7hJjjSmI7FJB6fBllCjrq7M
	431ZpFAxOL8b6saO6AxDTfNeA95CdCGOk3Cfd9Y8xx6h67MhwKWhq8ZN++FWPsAAtlnaffDC2JVaD
	WDnhe3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD54j-00000001QZn-0k2j;
	Thu, 08 May 2025 17:30:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD513-00000001Pwz-3RJZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 17:26:39 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746725192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hTbyL4rDqJd0LCAW+KvoiiMK8wPz1NsF8UcJJ8cPhiw=;
	b=IsQL30ONrI4jH8NVOxem46kLDCMzP/Nm59W11WHMUP8KJlzwrFVIEHrxLI3VEWTLPUeH8Y
	7XOJpnHiBRo/pb4bhe2U4Mpp+M+mJODfTGP9oz9U0HzUgvvphMZt3MK0I33CvXIDScyri/
	ElClzkI1fJpAvrE3LiRiB/hmMDZM2pdMTfhEOmcNJRV3MKiEu06cyWI8dUvMiUVdnePZra
	BRfX9LIVEdizlZoEkFEIb0JIz2bbCy/2UAB1ibYG8keWY3Dp5dIjuVv0w6Jm3T0SF3PJ+M
	lo/W7BklVcGLQjCFreaswevbzJgusPpmB2aTsBXhKZd2kGQNc9dkLdEiN7/0Nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746725192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hTbyL4rDqJd0LCAW+KvoiiMK8wPz1NsF8UcJJ8cPhiw=;
	b=H9CLw99fBJ7LF0HxwGGI1SpmPdzd7KGDyNshq8EBwNjUWLVEH9JYnBjbnl2w0aefJsI9yq
	Of9gn2t7UEx8NSCA==
To: Frank Li <Frank.Li@nxp.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Anup Patel
 <apatel@ventanamicro.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan
 <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob
 Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v18 00/15] PCI: EP: Add RC-to-EP doorbell with platform
 MSI controller
In-Reply-To: <20250414-ep-msi-v18-0-f69b49917464@nxp.com>
References: <20250414-ep-msi-v18-0-f69b49917464@nxp.com>
Date: Thu, 08 May 2025 19:26:31 +0200
Message-ID: <87y0v7ko8o.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_102637_996623_E56DD45E 
X-CRM114-Status: UNSURE (   9.26  )
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

On Mon, Apr 14 2025 at 14:30, Frank Li wrote:
> This patches add new API to pci-epf-core, so any EP driver can use it.
>       platform-msi: Add msi_remove_device_irq_domain() in platform_device_msi_free_irqs_all()
>       irqdomain: Add IRQ_DOMAIN_FLAG_MSI_IMMUTABLE and irq_domain_is_msi_immutable()
>       irqchip/gic-v3-its: Set IRQ_DOMAIN_FLAG_MSI_IMMUTABLE for ITS
>       dt-bindings: PCI: pci-ep: Add support for iommu-map and msi-map
>       irqchip/gic-v3-its: Add support for device tree msi-map and msi-mask

I applied the interrupt related changes in the tip tree. They are on a
seperate rc1 based branch and contain no other changes so that they can
be pulled into the PCI tree as prerequisite for the actual endpoint
changes. This can be pulled from the following tag:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-platform-msi-05-08-25

Thanks,

        tglx

