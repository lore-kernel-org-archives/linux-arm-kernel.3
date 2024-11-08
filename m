Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EC8D64070
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wXXDImCnc6pQjrZ2OgHsat9AJYpKVTMO7hsTNMtIm2I=; b=kW1nWCFI3soasN
	HZ5F+yNSJASlI3UKqZmsvarZqXdSiW2dCLgz6P9NmTCjFI/xOZQiLFZNj83cn6ewddpaR0XJbaYB8
	J8Jyhjr3rmkp6TjyxVm8x9J1pqPBkGX2lzK/T4fitODEA1bR4SKQDdQiyFjtgUEIVaZbgDnZ9yB8k
	vaQzQeHyJNik6TVm5j5o8ioOfUE8AiE/1wq7qR805yQvSXujBGXe15//SIFTFtN4uQrT+ILK9r/Qa
	oNtSxzpcjFZeBECv8Z/lXPw2O5TFgA0/OOBAt4VCbM767WQEt8cmUWdso+hDuihIOjaUnxCu8DktI
	mYX0SWB4HUePBoemmkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SVF-0000000BKdX-1OkF;
	Fri, 08 Nov 2024 17:10:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rz4-0000000BGHi-48iO;
	Fri, 08 Nov 2024 16:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7728E5C5A37;
	Fri,  8 Nov 2024 16:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D89FC4CECD;
	Fri,  8 Nov 2024 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731083837;
	bh=IskPDZRNmSgoLqb5hsNNc0juBISKvOEdc7mLaJ7QrxM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fw4s3bn0Wf29S1jkpjQYrM2FmwnLA3NrRni74cKk1allD2DKXhvpLMFDPiHQb2DNj
	 1SCvHJVrnvyQRuR59J2x0DUKD5myQTB/wsH0RI+0JXsL2DGFDtxd2jHJAuCfZvBYQ+
	 9FnKBNfqNaK2oMfg09BrLS/8Lj6/5Wmw2PLt1imvcc78QQSYBfmwuwrpmgBGSIAYGb
	 ikdADitO57K7jIongS0VAdg5rcrzn7zazTKNNzIwDyHaTqm+2LqVlT8je4acK1vcW5
	 UmcjN3iWAE9IehTpIW8dDhOslCNDUxf5C9xt8cGJzGGtmsuzj2WN7FMtiQhmps9w3R
	 dFiQyX4LDHDXA==
Date: Fri, 8 Nov 2024 10:37:16 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "lorenzo@kernel.org" <lorenzo@kernel.org>
Cc: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Message-ID: <20241108163716.GA1664097@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy3OTQ5CwPqtaeLU@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_083719_118204_9A56E056 
X-CRM114-Status: GOOD (  20.49  )
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

On Fri, Nov 08, 2024 at 09:39:41AM +0100, lorenzo@kernel.org wrote:
> > On Thu, 2024-11-07 at 17:08 +0100, Lorenzo Bianconi wrote:
> > > > On Thu, Nov 07, 2024 at 02:50:55PM +0100, Lorenzo Bianconi wrote:
> > > > > In order to make the code more readable, move phy and mac
> > > > > reset lines assert/de-assert configuration in .power_up
> > > > > callback (mtk_pcie_en7581_power_up/mtk_pcie_power_up).

> > > > > +	/*
> > > > > +	 * The controller may have been left out of reset by the
> > > > > bootloader
> > > > > +	 * so make sure that we get a clean start by asserting resets
> > > > > here.
> > > > > +	 */
> > > > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > > > +				  pcie->phy_resets);
> > > > > +	reset_control_assert(pcie->mac_reset);
> > > > > +	usleep_range(10, 20);
> > > > 
> > > > Unrelated to this patch, but since you're moving it, do you
> > > > know what this delay is for?  Can we add a #define and a spec
> > > > citation for it?
> > > 
> > > I am not sure about it, this was already there.  @Jianjun Wang:
> > > any input on it?
> > 
> > This delay is used to ensure the reset is effective. A delay of
> > 10us should be sufficient in this scenario.
> 
> ack, so we can introduce a marco like:
> 
> #define PCIE_RESET_TIME_US	10
> ...
> 
> usleep_range(PCIE_RESET_TIME_US, 2 * PCIE_RESET_TIME_US);

Unless this corresponds to a value specified by the PCIe base spec or
CEM spec, this macro should be internal to pcie-mediatek-gen3.c.

