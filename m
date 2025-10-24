Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CF4CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayS/hPhHa3w6hYPISCaYx/oDTyl7uN0nb1YQdBf2ckY=; b=AypCUAVOsl3qeTtePe08AR7j5N
	KjJkSEQPD2YB1rkx84yz8Qr3JPt+1BUcNFw+GEVfCpfU9lHuGlP6rGwBHLRdFS46+bXdOfxMBj6tj
	nZVP6kmPb2ffiW+he9S5dIJtEWbgBkkSWYCWlSo6OmXap3KahpL7fiR3bJSS+6P7cqCUhJsNdD0Gu
	u0JTtm//YHQfxMXaYfbZypRJ0ETKGl/irpaz8aeTv54F96ptU5BkbuUSDkaep6v04R2rMXvvwUh8H
	JUIZ5ypOZHk0FILDi099/ObFAEMb39vypf74xBY7Lr7mOt6KXU641PmtDr9WKt62KquN2TnEPi0Y2
	DyERwkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGSf-00000009IGz-37YP;
	Fri, 24 Oct 2025 12:00:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGSf-00000009IGL-05UJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71BCA604ED;
	Fri, 24 Oct 2025 12:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5EFC4CEF1;
	Fri, 24 Oct 2025 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761307200;
	bh=mwXxLlHwcTHyM39SvUYMrdYLE2o4P2lXhNWijwv5uq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FSe3k1NFXHPKQGhrD1pTPUz+eNo4YkXPh1bOXFukxY8C2TvbOhEbdv2AoPs2Qsbne
	 NJkHZUvDBmKLslbfnBN3JgTveIzXRuroLurG3kH9dqPSJofu8F36qGRGI7coUoNyhf
	 tQlpocd4JqT620SXPVx6TD/uk7fFHGVPZS8HcrGoi5ZQ0GJ/rxTGqzU12CPKL+g0jD
	 bzsuNV+BeSGM4r5wcZVQj7U+EigEXJOVExaRGYfg1W/ZEnmTlT7skjPl2R33OLdK4X
	 QnWboqn7EkTChJauIZ2+HqhnzHJwOQFV8M7yMuKfA+QGyx9+7Geoa4lhQEaP447R8+
	 OxFCsgPjUJYew==
Date: Fri, 24 Oct 2025 17:29:45 +0530
From: "mani@kernel.org" <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Stefan Roese <stefan.roese@mailbox.org>, 
	"Musham, Sai Krishna" <sai.krishna.musham@amd.com>, "Havalige, Thippeswamy" <thippeswamy.havalige@amd.com>, 
	"Bandi, Ravi Kumar" <ravib@amazon.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"Simek, Michal" <michal.simek@amd.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Sean Anderson <sean.anderson@linux.dev>, 
	"Yeleswarapu, Nagaradhesh" <nagaradhesh.yeleswarapu@amd.com>
Subject: Re: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
Message-ID: <ykzvrzxjv4pyosmz6nus4h35hpwcjt3kemugo3m5zl5g3xwbhb@ugcy2exwshi5>
References: <9c7e43c3-24e9-4b08-a6ce-2035b50226f4@mailbox.org>
 <20251023161100.GA1297651@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023161100.GA1297651@bhelgaas>
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

On Thu, Oct 23, 2025 at 11:11:00AM -0500, Bjorn Helgaas wrote:
> On Thu, Oct 23, 2025 at 09:03:07AM +0200, Stefan Roese wrote:
> > On 10/23/25 08:35, Musham, Sai Krishna wrote:
> > > > -----Original Message-----
> > > > From: Stefan Roese <stefan.roese@mailbox.org>
> > > > On 10/22/25 14:48, Musham, Sai Krishna wrote:
> > ...
> 
> > > > > > > We even don’t need ravi patch, as we have tested this at
> > > > > > > our end it works fine by just updating interrupt-map
> > > > > > > Property. We need to now understand the difference in
> > > > > > > design.
> > > > > > 
> > > > > > Ok, please let us know with your findings. In the meantime,
> > > > > > I'll keep Ravi's patch in tree, as it seems to be required
> > > > > > on his setup.
> > > > > 
> > > > > We tested on Linux version 6.12.40 without applying either
> > > > > Stefan's or Ravi's patches.  Instead, we applied only the
> > > > > following interrupt-map property change (entries 0,1,2,3) and
> > > > > verified that legacy interrupts are working correctly.
> > > > > 
> > > > > interrupt-map = <0 0 0 1 &pcie_intc_0 0>,
> > > > > <0 0 0 2 &pcie_intc_0 1>,
> > > > > <0 0 0 3 &pcie_intc_0 2>,
> > > > > <0 0 0 4 &pcie_intc_0 3>;
> > > > > 
> > > > > 38:       1143          0  pl_dma:RC-Event  16 Level     80000000.axi-pcie
> > > > > 39:       1143          0  pl_dma:INTx   0 Level     nvme0q0, nvme0q1
> > > > 
> > > > Okay. Same here. I don't need Ravi's patch for the INTx bit
> > > > enabling.
> > > > 
> > > > I understand that you want us to change the interrupt map in the
> > > > auto- generated device-tree from Vivado. Which is IMHO a bit
> > > > "suboptimal".
> > > > 
> > > > I would prefer to have a solution which works out-of-the-box,
> > > > w/o the need to manually change DT properties. Is it planned to
> > > > change / fix this interrupt map in pl.dtsi generated with a
> > > > newer version of Vivado?
> > > 
> > > Yes Stefan, this will be fixed in the newer versions and the
> > > auto-generated device tree will include the correct interrupt-map
> > > property entries.
> > 
> > Understood. And thanks the update on this.
> > 
> > @Bjorn & Mani, this patch can be dropped then.
> 
> Just to confirm, we can drop both of these patches:
> 
>   https://patch.msgid.link/20250920225232.18757-1-ravib@amazon.com
>   https://patch.msgid.link/20251021154322.973640-1-stefan.roese@mailbox.org
> 
> AND there are no DTs in the field that will need to be updated for
> things to work?
> 

There are no upstream DTs making use of this driver. Also, the upstream binding
example seems to be correct:

            interrupt-map = <0 0 0 1 &pcie_intc_0 0>,
                            <0 0 0 2 &pcie_intc_0 1>,
                            <0 0 0 3 &pcie_intc_0 2>,
                            <0 0 0 4 &pcie_intc_0 3>;

Moreover, if any DTs were using different 'interrupt-map' property, then INTx
wouldn't be working for them. So most likely they were all using MSIs as we
haven't received any reports up until now.

Hence, IMO we should be good to ignore the patch from Stefan. Though, I still
have a concern on whether the hardware is enabling INTx by default or not [1].
Until that is concluded, we should keep Ravi's patch.

- Mani

[1] https://lore.kernel.org/linux-pci/DM4PR12MB6158C6E6D6CC8BBCD5F6C3B1CDF0A@DM4PR12MB6158.namprd12.prod.outlook.com/

-- 
மணிவண்ணன் சதாசிவம்

