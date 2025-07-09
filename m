Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DEFC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzAk93GWfLjEN7IUai4BO+vczlN+4495jIU1AA/MGwc=; b=2DzKuKMQpHXSAS+f8s3kYGHJUT
	uAMyQ7fNXF8RWkQVzvx2WCuIdAzP8KUkCtFJe2Sc46XPXhNZzj55YwXnekmFIp4JH04DLrCm7ERoq
	Y3CXjHdnXEe/CHj8eSPBvP6S22XhU/lzjtmnRaKfrGnqbfLNwZOB0cTEJ/zYf6P3isqQjiAOCubgi
	IzACSztwhZOjAhdLu6WwQj0OG3d3snFVxU55fhJUJK3Hdp8CR9WH/dA8lxV6v7x8Y4aMIX4ii0MAK
	wSOsut+22aMA7UH88AGbLBXecVq/C6Sw050hshDDjQzrXpXXSZPEIkND69DDi6Fo7cyMUJZ88Q3h7
	Bxn0yizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWO8-000000096II-06FX;
	Wed, 09 Jul 2025 15:07:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTyq-00000008eP5-1vtJ;
	Wed, 09 Jul 2025 12:32:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4AFC445BF;
	Wed,  9 Jul 2025 12:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6DCC4CEF4;
	Wed,  9 Jul 2025 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752064375;
	bh=k7oBzbUjKiMJ0Q6br+E4o5sLW0SuJMJPvvMOS+TTwB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRo2ZBknsQXEL2PqhpkMfov9GoHoVLEFK+mGaAD/zykvYjQoxAFBbWBESB7gT+Afe
	 4vJlGVe6oDN8cTQoK6+nMdRNbw4zpfcOKW7McKj1ZhrlHnGWc2C9F6oajfHdpTq2fE
	 45o/gKZGbTQfWpXwiwblIFd90+riYbc8NM1+apOYwxTpwnirc7co5q6qt90GhXMZYA
	 H5F02DWDnqeMDqfrcEnJ/NNdQoQAtpioxpjGgqIKnvvryLVFAUVMrPkxnw+VDb/YtI
	 bsNGtm/53f4RO28Z+SbrhhMTL/jmEm02GocgFDe02LFwK1LUuOadkd4WvSydBZwQp2
	 XajktGCcknU9A==
Date: Wed, 9 Jul 2025 18:02:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Zhou Wang <wangzhou1@hisilicon.com>, Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <fpb23ogxfppvrkbr7mwk5jinq3m5bswzzepkt4hqpchycvttfl@o72xdeqm3eia>
References: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
 <20250530113404.GA138859@bhelgaas>
 <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
 <aGuqA92VDLK8eRY1@ryzen>
 <aGuvkkeVkezGJWXn@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGuvkkeVkezGJWXn@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_053256_515425_27F1F20C 
X-CRM114-Status: GOOD (  21.59  )
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

On Mon, Jul 07, 2025 at 01:29:22PM GMT, Niklas Cassel wrote:
> + Mani's kernel.org email.
> 
> On Mon, Jul 07, 2025 at 01:05:39PM +0200, Niklas Cassel wrote:
> > Hello Mani,
> > 
> > On Fri, May 30, 2025 at 09:39:28PM +0530, Manivannan Sadhasivam wrote:
> > > On Fri, May 30, 2025 at 06:34:04AM -0500, Bjorn Helgaas wrote:
> > > 
> > > > I think pci_host_handle_link_down() should take a Root Port, not a
> > > > host bridge, and the controller driver should figure out which port
> > > > needs to be recovered, or the controller driver can have its own loop
> > > > to recover all of them if it can't figure out which one needs it.
> > > > 
> > > 
> > > This should also work. Feel free to drop the relevant commits for v6.16, I can
> > > resubmit them (including dw-rockchip after -rc1).
> > 
> > What is the current status of this?
> > 

Thanks for the nudge!

I couldn't respin the series as I lost access to the hardware I was testing on
due to job change. I'll figure out a way to test it and respin it asap.

> > I assume that there is not much time left before 6.17 cut-off.

Mid of -rc5 is not that bad ;) Let's see how long it takes.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

