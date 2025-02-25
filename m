Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9F2C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8pXNgHdOvilbub1Wjunm7F/Fda/A61e8Jt5JOr1F1s=; b=yEVMOBXSWf/4DE5/1IDEhg8RWI
	1eDGQMWF/qndhKMOZVkxN2RWfIbS2O/fbnIgOV8u6uKBGP4UCXA7s6gf17JbrPtBTkDPI9z8o1y2S
	UvkZxOv3uu4tvzZQ3Eu8pTq2W+6BnlgD794sq5kzB8bhVFwWllkLtEmAhl6nDa3ma0zu0YmvHHCgO
	G5Zxn08xIMRrplDNTO12X9knEZgbipeAcaq7VAvZ2nr4gFoh85MncjG+oW5F5P2ms6uKNqtoQbwGQ
	5Mej5isQzwfG+4TZPs+HgmqGSKH1F/47Hie9xbeNKfMFC1vMV4170YqXD4lzF22lvtkxlhTJICDPh
	1Y7Kdy5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuYD-0000000HHmG-2OdL;
	Tue, 25 Feb 2025 13:00:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmu2U-0000000HD7w-28PX;
	Tue, 25 Feb 2025 12:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F0F85C661C;
	Tue, 25 Feb 2025 12:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E52C4CEDD;
	Tue, 25 Feb 2025 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740486473;
	bh=2ncFbmwvUgcbSappvhge9nJXN6LJwl6EsNRd1xDptck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6/PcmnM0ttEbTSsdffPDQRNk95br50C45yPJLrv44lgxoyS89N6KrJTnU+hdEVny
	 Gglujib8J6ld8Esi7AubTzFM2cz/2mTZ2Z4Ye9Et64G+bUBW9iaWl9z1Ms7kNtqEhD
	 v3i1Oz8Gde7IBiGBcsRm6a9UpaRLs3lYbdbTLAiXFUqbdPQjOoOm/ROHYmLT8UrSKa
	 oMreYhsCZgbAYQ0z9hWhBQ6v3SvoaW0w97yfwCHutoIa4T0fqQI+2v7CyYaRBac6Zh
	 axoAN6V4Xa4VSQRn87pHDcHDNA/wk4821aRwXHfr7Rhqj8GZq8ZOfLfqGTZbjyvd0k
	 DKTkcnrcsrcag==
Date: Tue, 25 Feb 2025 13:27:48 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dw-rockchip: hide broken ATS capability
Message-ID: <Z723RNjC2pYYqAHn@ryzen>
References: <20250221202646.395252-3-cassel@kernel.org>
 <20250221202646.395252-4-cassel@kernel.org>
 <93cdce39-1ae6-4939-a3fc-db10be7564e5@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93cdce39-1ae6-4939-a3fc-db10be7564e5@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_042754_664365_F5C820AD 
X-CRM114-Status: GOOD (  19.90  )
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

Hello Shawn,

On Tue, Feb 25, 2025 at 09:35:22AM +0800, Shawn Lin wrote:
> On 2025/2/22 4:26, Niklas Cassel wrote:
> > When running the rk3588 in endpoint mode, with an Intel host with IOMMU
> > enabled, the host side prints:
> > DMAR: VT-d detected Invalidation Time-out Error: SID 0
> > 
> > When running the rk3588 in endpoint mode, with an AMD host with IOMMU
> > enabled, the host side prints:
> > iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT device=63:00.0 address=0x42b5b01a0]
> > 
> > Usually, to handle these issues, we add a quirk for the PCI vendor and
> > device ID in drivers/pci/quirks.c with quirk_no_ats(). That is because
> > we cannot usually modify the capabilities on the EP side.
> > 
> > In this case, we can modify the capabilties on the EP side. Thus, hide the
> > broken ATS capability on rk3588 when running in EP mode. That way,
> 
> Niklas, Thanks for reporting this issue. It's been a while before
> getting confirmation from the design team. Now I can confirm the ATS support
> for RK3588 is only available running as RC but I'm still
> requesting erratum about this issue if possible.
> 
> Acked-by: Shawn Lin <shawn.lin@rock-chips.com>

Thank you for confirming!

Considering that rock5b running in RC mode:
# lspci -vvvs 0000:00:00.0 | grep Capa
        Capabilities: [40] Power Management version 3
        Capabilities: [50] MSI: Enable+ Count=16/32 Maskable+ 64bit+
        Capabilities: [70] Express (v2) Root Port (Slot-), IntMsgNum 8
        Capabilities: [b0] MSI-X: Enable- Count=128 Masked-
        Capabilities: [100 v2] Advanced Error Reporting
        Capabilities: [148 v1] Secondary PCI Express
        Capabilities: [190 v1] L1 PM Substates
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
        Capabilities: [2d0 v1] Vendor Specific Information: ID=0006 Rev=0 Len=018 <?>

and rock5b running in EP mode:
# lspci -vvvs 0000:01:00.0 | grep Capa
        Capabilities: [40] Power Management version 3
        Capabilities: [50] MSI: Enable+ Count=32/32 Maskable+ 64bit+
        Capabilities: [70] Express (v2) Endpoint, IntMsgNum 8
        Capabilities: [b0] MSI-X: Enable- Count=2048 Masked-
        Capabilities: [100 v2] Advanced Error Reporting
        Capabilities: [148 v1] Secondary PCI Express
        Capabilities: [178 v1] Page Request Interface (PRI)
                Page Request Capacity: 00000001, Page Request Allocation: 00000000
        Capabilities: [188 v1] Latency Tolerance Reporting
        Capabilities: [190 v1] L1 PM Substates
        Capabilities: [1a0 v1] Dynamic Power Allocation <?>
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
        Capabilities: [2d0 v1] Vendor Specific Information: ID=0006 Rev=0 Len=018 <?>
        Capabilities: [2e8 v1] Physical Resizable BAR

already exposes different Capabilities (depending on the mode the PCIe
controller is running in), I would say that it slightly confusing that
Synopsys chose not to hide the ATS Capability when the PCIe controller
is running in EP mode.
So, I would guess that there is an errata for this.

But I think that your confirmation is enough.
Will take a while before I can send out a V2 though, but quite confident
that we can get something merged in time for 6.15.


Kind regards,
Niklas

