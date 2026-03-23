Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEB2F483DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ODxfnF5Y2pwSOzwqAyPL/19n5GjpOckcssol2+LCgaE=; b=GZs8+gRfNBsb61VOUfkz8lD6Ee
	SAfaLNzjj3mey+YMkNMQf4v7TPUkSlbZsTMROUCzMDnq4Zr392CgUjU6LXuQWFq8pnBW4pNAX3cRb
	2hGY+ZmGyf2G7zOY8vBUXEbUBRwC2bKsjDwltgWM2OjQAUcqUzL1tnM7t+HLmMPAvuis7ApViMGol
	axbffXhjDdElhxtbCAnYVkM5qJ7eI/YhjRQOIAQNNBhh7ZDFIue816JYHDHGeu0R3/7XnTFjmzB2/
	V/dNFczsM8ty/yV/8NgqXw6fDGz4mLYK9FmDsyu3SwVpBxoRWB0hvltCvuIIkHvw/C7OhBGDqbbt8
	uiz5d1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4j1I-0000000HDsG-270D;
	Mon, 23 Mar 2026 17:24:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4j1F-0000000HDrZ-2DLi;
	Mon, 23 Mar 2026 17:24:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BFAE4457F;
	Mon, 23 Mar 2026 17:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE3DC4CEF7;
	Mon, 23 Mar 2026 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774286688;
	bh=3b/Pf+efs6DwZxI9LgoT1yaJxrb4aklVz4R/Q630Z94=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rXPfHXzxduQHADzoMNap8OhCb4omlnhmjF+TLKEANg3hJUcF9KhWLRvAVSdWGsczq
	 QAJv1Ad14K5pq7/eKchcxy2yyb+VmPkvCTYao8zeoulJQcW0I4t137BXVfJB1zU+fw
	 KwVcpHBSKhVHjO6LxvWqc5QUhxtpY/LH2unZ/McagPFgp/5q5iMXXc5jWyMkEBrwwz
	 Sygmx+KEt3pnHptuoTih+PutfpNiA7HU6fhbRMjFTg8vdBLoFGiY7bCDRkldH+a564
	 iOgjn8QVERZJWKMyHKmiENSkheJk7fEbt6SWvb1crmfhkGUF6Aoi9EpKLvrw14+d9l
	 kIGzbUsttPoGw==
Date: Mon, 23 Mar 2026 12:24:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek-gen3: select PCI_PWRCTRL_GENERIC correctly
Message-ID: <20260323172445.GA880803@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wlu2o3hx6yvpzs54mxsf24gmqwwudkixx7aylv4dkey744yify@eufscwyqiyhk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_102449_588057_C0A00B59 
X-CRM114-Status: GOOD (  22.50  )
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

On Mon, Mar 23, 2026 at 05:26:47PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Mar 23, 2026 at 11:55:06AM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The PCI_PWRCTRL_SLOT option was renamed to PCI_PWRCTRL_GENERIC, but a new
> > user showed up using the old name, which caused a build failure when
> > both conflicting patches are merged:
> > 
> > aarch64-linux-ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_remove':
> > pcie-mediatek-gen3.c:(.text+0x137c): undefined reference to `pci_pwrctrl_power_off_devices'
> > 
> > Use the correct symbol as intended originally.
> > 
> > Fixes: ff124bbbca1d ("PCI/pwrctrl: generic: Rename pci-pwrctrl-slot as generic")
> > Fixes: 073a7e1b7bcc ("PCI: mediatek-gen3: Integrate new pwrctrl API")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Bjorn, should I squash this fix with 073a7e1b7bcc so that pci/next will build
> properly?

If you squash this into 073a7e1b7bcc, I think the 0-day bot will
comlain about the resulting pci/controller/mediatek-gen3 branch
because it doesn't include ff124bbbca1d.

I can resolve it by hand when merging pci/controller/mediatek-gen3
into pci/next.

> > ---
> >  drivers/pci/controller/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> > index e72ac6934379..686349e09cd3 100644
> > --- a/drivers/pci/controller/Kconfig
> > +++ b/drivers/pci/controller/Kconfig
> > @@ -222,7 +222,7 @@ config PCIE_MEDIATEK_GEN3
> >  	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
> >  	depends on PCI_MSI
> >  	select IRQ_MSI_LIB
> > -	select PCI_PWRCTRL_SLOT
> > +	select PCI_PWRCTRL_GENERIC
> >  	help
> >  	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
> >  	  This PCIe controller is compatible with Gen3, Gen2 and Gen1 speed,
> > -- 
> > 2.39.5
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

