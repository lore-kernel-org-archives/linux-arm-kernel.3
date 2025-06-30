Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE48FC83036
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cMl/Vu5U3rMzqr8SnZN9XgY1uyD/r7E/BhCMyKw6bR4=; b=urdXysfhvgDeeh
	jutAbplpI2h19l3uzI2dj5G1NOY+dmVAbadMUatKdHSMxUfLM97PaEtY5u3huKu3pmneNk94groZz
	BJOJdEM/jZ2H7d24paE25deYpyDTNFS0bD5L3e8gSSud6pR1zLOVQYDC/+oc3/s3BD0h4ol4wq9iv
	HhTXLEb53AoufQXV/koVausBIw9aLaareGcMBuJIC6ce05nZVjHsremXlqI+Vn8cZ1H4zThi8x5m0
	B/IYdeHrJu5UQGG5YMBcmrrYJMAjRb7ZEgQRZ2f9SFrPg2BSKewUls4ltURVBQfoHe8iGQFz31TG9
	hE47EX5FNfxvGJrka0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ1W-000000039do-0K7K;
	Mon, 30 Jun 2025 18:14:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHxD-0000000321a-1ghp;
	Mon, 30 Jun 2025 17:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFC2846092;
	Mon, 30 Jun 2025 17:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809A9C4CEE3;
	Mon, 30 Jun 2025 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751303162;
	bh=YS1h67nHopU5jEDVPXIholPcSs4LOSkc7OQ/xawugyw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hV9AGgVdssVMQd1wnnDfmJ0GOhvJ+r/NtVR9vxunWsbWGlijCdQnQw1Z3LMXp3Ord
	 tOMaOM6uC0Gp1V9N5x+SfFkqYP0PTcshgQ4gsFokjlEqTQi43h7iXhvIHaQsEmkIkE
	 nhxr1yMj7FMimmZvTFk+Z31JuUN8RHKfUwqoY/uR1Zo+o4N0QqpoWQnLe59E82OoeY
	 SBnNXOrBdaE5MO+3csoUYVUZKSvbEm4THrxRTvgLL9lqSGkvFT/LR53/hPoh6s0Cd5
	 e50UN0lWjypg109AU0g1KPpzav8hadhQ4dnbZG7l69POuCPcie6p71hvo/AVEtRkJ6
	 SRPj4laswAyfQ==
Date: Mon, 30 Jun 2025 12:06:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] PCI: host-generic: Fix driver_data overwriting bugs
Message-ID: <20250630170601.GA1785925@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625111806.4153773-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_100603_469891_202F3A15 
X-CRM114-Status: GOOD (  20.76  )
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

On Wed, Jun 25, 2025 at 12:18:03PM +0100, Marc Zyngier wrote:
> Geert reports that some drivers do rely on the device driver_data
> field containing a pointer to the bridge structure at the point of
> initialising the root port, while this has been recently changed to
> contain some other data for the benefit of the Apple PCIe driver.
> 
> This small series builds on top of Geert previously posted (and
> included as a prefix for reference) fix for the Microchip driver,
> which breaks the Apple driver. This is basically swapping a regression
> for another, which isn't a massive deal at this stage, as the
> follow-up patch fixes things for the Apple driver by adding extra
> tracking.

Is there a bisection hole between patches 1 and 2?

  1: PCI: host-generic: Set driver_data before calling gen_pci_init()
  2: PCI: apple: Add tracking of probed root ports

If so, would it be practical to avoid the hole by reordering those
patches?

> Finally, we can revert a one-liner that glued the whole thing
> together, and that isn't needed anymore.
> 
> All of this is candidate for 6.16, as we have regressed the Microchip
> driver in -rc1, and that fixing it breaks the Apple driver.
> 
> Geert Uytterhoeven (1):
>   PCI: host-generic: Set driver_data before calling gen_pci_init()
> 
> Marc Zyngier (2):
>   PCI: apple: Add tracking of probed root ports
>   Revert "PCI: ecam: Allow cfg->priv to be pre-populated from the root
>     port device"
> 
>  drivers/pci/controller/pci-host-common.c |  4 +-
>  drivers/pci/controller/pcie-apple.c      | 53 ++++++++++++++++++++++--
>  drivers/pci/ecam.c                       |  2 -
>  3 files changed, 51 insertions(+), 8 deletions(-)
> 
> -- 
> 2.39.2
> 

