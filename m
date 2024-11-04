Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D51D1CA0C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 23:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=62+1oaniGB38i4azIhxvIseFWIxPMlN+0ETaSWquqpg=; b=BdqBVoaQVGZN2q
	4sjlsIlSRnh6BEuSlZZ3LyRpL2b3RGk1w3EnpldxteycnGXAoRk0rAU2fooRMooGdS94WL1sz7hau
	ExMvfbQcA3BOBvoyYsZiGo5MjAHwwOeuY/q8WXRT/NpgUHfH1pim2i/LUNJxit71WWIjyytJiJH46
	s3Gan0BW60FfPxpOftpKcR+HVH6lreemMS3SL0lzfsTAxv5snc+B2TwpuXYj+EIN3P7BY9Pc02F2o
	FPluIStY/pnwC0iUL3OzutFFKV4JOSQeryNL56npSJA8qCX7z56ZHg1NZySQTbgR3djVFfbtAuDhL
	hw6u5+Y8o6t/NiM8mRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t86r0-0000000FQXE-1S2c;
	Mon, 04 Nov 2024 23:51:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t86pI-0000000FQGa-36QS;
	Mon, 04 Nov 2024 23:49:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1BA22A41AEF;
	Mon,  4 Nov 2024 23:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3E8C4CECE;
	Mon,  4 Nov 2024 23:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730764178;
	bh=iYZ8xQtA17SG7eVmEIV4S/I2ob0ny1CVlXDrXQZre+c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ntrz21As60vacLFu5p1uAmxmcX96c07NNHqwAPllOOJB9RJXakyrOXNdt4fbBnjUm
	 DV1PpoHYRCz1U5qcb4iU4W17QW/fCzR0CO/c+y6/IZYExhQq+wESmOvX3jZyHl72DG
	 wxwE5FARzswPmdhMRSY+monukJehqVG7Et9RHSf3aO0Qwy1N1ppG8tSBMV3PkZbqms
	 2ZZqYtYByX9TfJTPlUtGAes7++oKDqQVSGVDp7m0JWypWvGw8UHnrPwduSWpiBhj2o
	 EN1anG73X1epeNiI1zoJE7//PnviSJH5pFTTFJ5hYGwgsPutn7QyP3uBWPS03aAmzh
	 lVNPTZyXfzscQ==
Date: Mon, 4 Nov 2024 17:49:37 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
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
Message-ID: <20241104234937.GA1446920@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104150521.r4hbsurw4dbzlxpg@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_154940_924439_6E146538 
X-CRM114-Status: GOOD (  18.78  )
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

On Mon, Nov 04, 2024 at 08:35:21PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Nov 04, 2024 at 09:54:57AM +0100, Andrea della Porta wrote:
> > On 22:39 Sat 02 Nov     , Manivannan Sadhasivam wrote:
> > > On Mon, Oct 28, 2024 at 03:07:22PM +0100, Andrea della Porta wrote:
> > > > When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
> > > > incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
> > > > bridge, the window should instead be in PCI address space. Call
> > > > pci_bus_address() on the resource in order to obtain the PCI bus
> > > > address.
> > > 
> > > of_pci_prop_ranges() could be called for PCI devices also (not just PCI
> > > bridges), right?
> > 
> > Correct. Please note however that while the PCI-PCI bridge has the parent
> > address in CPU space, an endpoint device has it in PCI space: here we're
> > focusing on the bridge part. It probably used to work before since in many
> > cases the CPU and PCI address are the same, but it breaks down when they
> > differ.
> 
> When you say 'focusing', you are specifically referring to the
> bridge part of this API I believe. But I don't see a check for the
> bridge in your change, which is what concerning me. Am I missing
> something?

I think we want this change for all devices in the PCI address
domain, including PCI-PCI bridges and endpoints, don't we?  All those
"ranges" addresses should be in the PCI domain.

Bjorn

