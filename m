Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90616CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 18:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aURx7YzFLbTZqrSbDDMCtmVKwVlLZS1qp6m4gHZGZJg=; b=noJ1QjarRUVaD3DvcXW9kL5/O7
	XTvNr08rk44Q8xkt1QGsWdNvMU9OMNC2z/yUchyXf1Pdhnc1yGjQRipG/XroXaMTHNHMaotRH70+A
	M+Ek7Q+hAcoFdUZZzf6sWZqtOgShijY++i2rnTps9imPMVb9kYIkjU8f0C5zaIsoiHLsIeIAgiX89
	ZHKPk7LPB2/Asqrphbh+5Etts0/6EOhRAn/RpFIHm5rcHYxhM6grnFABYfjRDR3Ab+zsznTTUnfeX
	QOrwiE3c3Hy8wdsubDLbhdE4YemZZRejO5JmlVR25Gk7+1A3+dBFlJ33Le684WLEg0RsPnkcP0qKp
	rb1s7LJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6vfa-00000006wHP-3ioJ;
	Thu, 09 Oct 2025 18:47:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6vfY-00000006wGz-1WWl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 18:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C3D84325F;
	Thu,  9 Oct 2025 18:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CF6C4CEE7;
	Thu,  9 Oct 2025 18:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760035633;
	bh=ivEfJjQfgHVzt9APPBEebTAqsUUoYx7xt2ip5PmKFLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rp8AjoJg86r6iBIoiXsIAaAiHDGnJ0sI0dBT+DjtNnbE8hXpjulRkeuxuYpe3hT0v
	 JfKAh7Q7pLW15CAG9L6KbuUQF9M+TKg2Z/JaL6OzJoQQ06i9f+/mpFlE/o+u0Hsfre
	 SnrxeK9AzcMtsRkzkLjAXrZU8LGWuw55Qry6lPLDlSEcGITrWg8ZBaOb3kgDNfiwsy
	 DAQuilVdgBk2viPy7J/bU3upb0m2+k8YrZbB0q6wdHHr52o1Pl/JUkaVCqNZDtaOso
	 yUwyf9rncO0hG+TV4SKztW3LYBjXwGFYvSKOpLolfBdAzt7LQeBdq9xJxYFN8fc5OP
	 8yUOd7amoOrEA==
Date: Thu, 9 Oct 2025 11:47:09 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, bhelgaas@google.com, jingoohan1@gmail.com, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Ionut.Vicovan@nxp.com, Larisa Grigore <larisa.grigore@nxp.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, ciprianmarian.costea@nxp.com, 
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, Frank Li <Frank.li@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
Message-ID: <4kvo2qg2til22hlssv7lt2ugo63emr5c4hfjur5m3vnxvpdekx@jcbhaxb2d2j2>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org>
 <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
 <aOU0w5Brp6uxjZDr@lpieralisi>
 <4rghtk5qv4u7vx4nogctquu3skvxis4npxfukgtqeilbofyclr@nhkrkojv3syh>
 <eba7d968-209d-4acb-ba41-4bebf03e96ba@app.fastmail.com>
 <4143977f-1e70-4a63-b23b-78f87d9fdcde@app.fastmail.com>
 <2erycpxudpckmme3k2cpn6wgti4ueyvupo2tzrvmu7aqp7tm6d@itfj7pfrpzzg>
 <3d480f73-15b4-4fb8-8d2b-f9961c1736ca@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d480f73-15b4-4fb8-8d2b-f9961c1736ca@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_114716_445275_F32FD892 
X-CRM114-Status: GOOD (  23.24  )
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

On Wed, Oct 08, 2025 at 07:56:44PM +0200, Arnd Bergmann wrote:
> On Wed, Oct 8, 2025, at 17:19, Manivannan Sadhasivam wrote:
> > On Wed, Oct 08, 2025 at 10:35:34AM +0200, Arnd Bergmann wrote:
> >> On Wed, Oct 8, 2025, at 10:26, Arnd Bergmann wrote:
> >> > the physical addresses for RAM at 0x80000000 and on-chip devices
> >> > at 0x40000000. This probably works fine as long as the total
> >> > PCI memory space assignment stays below 0x40000000 but would
> >> > fail once addresses actually start clashing.
> >> 
> >> I got confused here myself, but what I should have said is that
> >> having the DMA address for the RAM overlap the BAR space
> >> as seen from PCI is problematic as the PCI host bridge
> >> cannot tell PCI P2P transfers from DMA to RAM, so one
> >> of them will be broken here.
> >> 
> >
> > No. The IP just sets up the outbound mapping here for the entire 'ranges'. When
> > P2P happens, it will use the inbound mapping translation.
> 
> That is not my impression from reading the code: At least for
> the case where both devices are on the same bridge and they
> use map_type=PCI_P2PDMA_MAP_BUS_ADDR, I would expect the DMA
> to use the plain PCI bus address, not going through the
> dma-ranges+ranges translation that would apply when they are
> on different host bridges.
> 

Right, but I don't get the overlap issue still. If the P2P client triggers a
write to a P2P PCI address (let's assume 0x8000_0000), and if that address
belongs to a an endpoint in a different domain, the host bridge should still
forward it to the endpoint without triggering write to the RAM.

Atleast, I don't see any concern from the outbound memory translation point of
view.

Please let me know if there is any gap in my understanding.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

