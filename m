Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BCBC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=gYico9MqOG/kwCFHxAoko3jccsDh08QzF8G1EJ66AB4=; b=QmOap+d4GyoIEi
	xuYxO/oW5EssD7H1yMhN1gH47BlNbM2CE75OIlT/lu/EvjlShL4PS1xRownmoKyK0nE2ujXOa+aRE
	nKQo/wBB/sUb5BgF1tELp+ahyqpQ3/ppxnyiucjQIIOgBIPKGwOD4aAVdj8+NxBE/kO49CPTC+onW
	iCKtZ9njbcYKP61A1Yxv4j3dmDAkj6aseFtIcR9xuTQkbZqG/8fAi+cgYIh31+IeODeqgevzejDfs
	SoAMXU2jXYXfKoRNaxMMxMbpwM2WvraYsugKZgTFChhm1CV/ErVJJ91iW3Lp6uYL/QocpMFsjsZ2a
	nfJ2EFp0gnwEeMup8Ykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5iS-00000006zj2-2P5C;
	Thu, 06 Feb 2025 17:31:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5h3-00000006zMv-2gpd;
	Thu, 06 Feb 2025 17:29:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 525B85C66EF;
	Thu,  6 Feb 2025 17:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3A1C4CEDD;
	Thu,  6 Feb 2025 17:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738862976;
	bh=ZFUgiEXBwBsq3cq1cnrV8wXRIbWYk/FzOHDXWiMPIuo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LjldJCd1N9i6F2+at+s8vw0UYjW1hZLi57idJMOjzMxFeT4puhC5nOo/zQbwL1vJ2
	 7u/TX3Cy6iIfP3iLdZHOuHL4VvCH04iI4FehKGJJAziJmjjfe3mpNTuG5RGnVFwWuO
	 sjJcCSj+6facGTP/+OOSpRQQ8oEuPXJqWvmG5VzAHWJmycziliimQjwFT8qVUiYTG7
	 pBsRHA7avRWoZf/lMX3EhDLaF/a6LQaGz+yEvsayHlCGPglJlXeJIJmifPvEunADF9
	 VazugdRiewd1sVVTgAgvt27p9fVn+w7MUoxYZn/6RHL4IkSZcTHLEYGru8EhTmPRbh
	 Zu5CyshDpgWZQ==
Date: Thu, 6 Feb 2025 11:29:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/6] PCI: brcmstb: Fix error path upon call of
 regulator_bulk_get()
Message-ID: <20250206172935.GA990026@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205191213.29202-3-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_092937_720755_3A46439A 
X-CRM114-Status: GOOD (  20.58  )
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

On Wed, Feb 05, 2025 at 02:12:02PM -0500, Jim Quinlan wrote:
> If regulator_bulk_get() returns an error, no regulators are
> created and we need to set their number to zero.  If we do
> not do this and the PCIe link-up fails, regulator_bulk_free()
> will be invoked and effect a panic.
> 
> Also print out the error value, as we cannot return an error
> upwards as Linux will WARN on an error from add_bus().

Wrap all these commit logs to fill 75 columns.  No point in leaving
unused space when most things are formatted to fill 80ish columns or
more.

> Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index f8fc3d620ee2..bf919467cbcd 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1417,7 +1417,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
>  
>  		ret = regulator_bulk_get(dev, sr->num_supplies, sr->supplies);
>  		if (ret) {
> -			dev_info(dev, "No regulators for downstream device\n");
> +			dev_info(dev, "Did not get regulators; err=%d\n", ret);
> +			sr->num_supplies = 0;
>  			goto no_regulators;

I think it might have been better if we could do the
regulator_bulk_get() separately, before pci_host_probe(), so that if 
this error happens, we can deal with it more easily.

Setting num_supplies = 0 is an unusual way of handling this error, and
if this pattern of managing PCIe regulators spreads to other drivers,
we might trip over this again.

Not asking for a redesign here, and maybe it wouldn't even be
possible, but it kind of fits with thinking about splitting Root Port
support from the Root Complex/host bridge support.

Bjorn

