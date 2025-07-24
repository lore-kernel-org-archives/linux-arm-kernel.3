Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537E3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 05:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feWzxxtMhUW/xoBFPV3+36AjZRM2dS3U+W52VijVCRw=; b=ZU0t78I9O0I4jMqZtVaCQWkx/w
	MsPYNyfj+Ri8N3NVKUt+lk1WO2H4XxH4/ARm9VGq6y/cdmaVK8YYxfhlszzX2qYfwZCLMYPQRaJ6N
	VUn1fU59lQ7tYSDfEAH5O3+adQbGP4l6uXg4jyIexImV2elHKSkvp4msZpGPbtdZOTkCD7cDtQoLr
	xz8XgDGts+FaSb0dfloFa9Wts+uLSwZkhe/6U4vB9vLyFokkgddeVbneR8ikxI1Np852q+EHONTMl
	N6mAvj6DyIS4ps/T9h2/1Gb38d0qbxe7Z7HBt09GTRMdYux68SgXskjCPG5wVMvYsVodQARfP/peE
	/5z+eeew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoby-00000006WeD-0oEl;
	Thu, 24 Jul 2025 05:35:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoX3-00000006VkW-2KRO;
	Thu, 24 Jul 2025 05:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 908325C557C;
	Thu, 24 Jul 2025 05:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3469FC4CEED;
	Thu, 24 Jul 2025 05:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753335016;
	bh=ISXdQZ3kB+W0hUweuwCNwLolV+g7Yo//dJ0hlqxAC0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sNedDR55x4+Sp5CqV3RRfyuKADcZPDY7YyZPtWIuQOH60C+zNPuSm9viRmif/bLfo
	 NsFm4J4q+ZZcM9ZED/jxSstX2X4Pgyv1k17y8+SM0XQuoBQr6vY3rqk4lEM3fxAa1u
	 ABhBaDpL96ZIPtJTWvkU9dp2YpVIQMGOwH9XuG46TgW7pZtZ4v+HULgkZqpEWmo8kQ
	 Qfev9GG7It4NBGZznP7FJzLkwtD7zgyTAqAcbUtx3SabjvqTYj0qaMOgTij7WJYbYd
	 Vt8/nLOyO6jeeDlbxuedgbMbzDO4Xj9XmOG2BbyxhnqoKrchC9IKqliIAiQd/MY5Xo
	 ct2H4wCgyMG6w==
Date: Thu, 24 Jul 2025 11:00:05 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <tujurux64if24z7w7h6wjxhrnh4owkgiv33u2fftp7zr5ucv2m@2ijo5ok5jhfk>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aHoh1XfhR8EB_5yY@ryzen>
 <aHokdhpJUhSZ5FSp@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHokdhpJUhSZ5FSp@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_223017_673614_7215E49B 
X-CRM114-Status: GOOD (  15.63  )
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

On Fri, Jul 18, 2025 at 12:39:50PM GMT, Niklas Cassel wrote:
> On Fri, Jul 18, 2025 at 12:28:44PM +0200, Niklas Cassel wrote:
> > On Tue, Jul 15, 2025 at 07:51:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > 2) Testing link down reset:
> > 
> > selftests before link down reset:
> > # FAILED: 14 / 16 tests passed.
> > 
> > ## On EP side:
> > # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
> >   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> > 
> > 
> > [  111.137162] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x4
> > [  111.137881] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x0
> > [  111.138432] rockchip-dw-pcie a40000000.pcie: hot reset or link-down reset
> > [  111.139067] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> > [  111.139686] pci-endpoint-test 0000:01:00.0: AER: can't recover (no error_detected callback)
> > [  111.255407] rockchip-dw-pcie a40000000.pcie: PCIe Gen.3 x4 link up
> > [  111.256019] rockchip-dw-pcie a40000000.pcie: Root Port reset completed
> > [  111.383401] pcieport 0000:00:00.0: Root Port has been reset
> > [  111.384060] pcieport 0000:00:00.0: AER: device recovery failed
> > [  111.384582] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x3
> > [  111.385218] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x230011
> > [  111.385771] rockchip-dw-pcie a40000000.pcie: Received Link up event. Starting enumeration!
> > [  111.390866] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> > [  111.391650] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> > 
> > Basically all tests timeout
> > # FAILED: 1 / 16 tests passed.
> > 
> > Which is the same as before this patch series.
> 
> The above was with CONFIG_PCIEAER=y
> 

This is kind of expected since the pci_endpoint_test driver doesn't have the AER
err_handlers defined.

> Wilfred suggested that I tried without this config set.
> 
> However, doing so, I got the exact same result:
> # FAILED: 1 / 16 tests passed.
> 

Interesting. Could you please share the dmesg log like above.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

