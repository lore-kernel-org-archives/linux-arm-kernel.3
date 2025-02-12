Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C86AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1leLfyKGbrtz9M9HgG+/vkImJZPVZb5hXYMP4HdeQCs=; b=JbuNAqvyH0I1VC
	/9rHgjevGGs/2ATQfJEq0kioygq3goPUJjix7IggOO+ZO+19bDDrvLOg/FbnNOntHM2f3wUW6fiPO
	074TdEFFC5atd56Q0j69zuQhQJHiwgljH4a6qAzEP/hl9xI/VkQFO7981hqD1tvZ9yvxKOoPWkW1U
	MCf7bW/gwDa2M05vLLYk9lgu6E+bW8cJLx9X3TSjrlW+AxrHaMASSsl2V/5ceAHbQjLmeGIXtFjWU
	DDJu9LSeQ3E85VIf6sMBgF8KIeJNsdIfK4y2rsmnSnvatVjSIkK86fDjCujDVFfBGnRWfzg5mx49E
	oY0ul06z65XG+lWny2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiH3S-00000008PXx-2muK;
	Wed, 12 Feb 2025 18:01:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiH22-00000008PLA-0eAs;
	Wed, 12 Feb 2025 18:00:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0502FA40F71;
	Wed, 12 Feb 2025 17:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10FEC4CEDF;
	Wed, 12 Feb 2025 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739383217;
	bh=hsK/ij+5FFV9WezWD6dLNN9TbHcCGeKOn7f2QjrIAkk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AGtzyqkY5Co/VF4YcoGd4mbPW4K3DlF88Nn+KcbRZZYwfHbIAU/PtcmPqp6Lzi+pK
	 BKmMjpBsoSlGwVNt9VUOF12rix04O9ZwrPNys5fomIAgHGX17hPA8EW+oLHFTdhxym
	 uF61M3wy/GQIRASKaWWcjpknlJK96XSga60FsKG1t2FsPtqrABGF/oBpmvbUJkmlD5
	 P6/Hr14Gh2j4Tsukl/XTN8qwfc32Lime8GfUzAb/90QZKvxOwg0odz6HvFp2mdxRzO
	 nE+t2k/51g1ziUM5tfp/LQETQycXrI/fHtbTDnDbIt/nJoonjhY9QJyQGNUVP+PO7N
	 JxGVUxvAcsJ/A==
Date: Wed, 12 Feb 2025 12:00:09 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 -next 05/11] PCI: brcmstb: Expand inbound window size
 up to 64GB
Message-ID: <20250212180009.GA85559@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120130119.671119-6-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_100018_259418_803A0C3D 
X-CRM114-Status: GOOD (  16.13  )
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

On Mon, Jan 20, 2025 at 03:01:13PM +0200, Stanimir Varbanov wrote:
> BCM2712 memory map can support up to 64GB of system memory, thus expand
> the inbound window size in calculation helper function.
> 
> The change is save for the currently supported SoCs that has smaller
> inbound window sizes.

If you repost:

s/save/safe/
s/that has/that have/

Otherwise we can fix these when merging.

> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
> v4 -> v5:
>  - No changes.
> 
>  drivers/pci/controller/pcie-brcmstb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 48b2747d8c98..59190d8be0fb 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -304,8 +304,8 @@ static int brcm_pcie_encode_ibar_size(u64 size)
>  	if (log2_in >= 12 && log2_in <= 15)
>  		/* Covers 4KB to 32KB (inclusive) */
>  		return (log2_in - 12) + 0x1c;
> -	else if (log2_in >= 16 && log2_in <= 35)
> -		/* Covers 64KB to 32GB, (inclusive) */
> +	else if (log2_in >= 16 && log2_in <= 36)
> +		/* Covers 64KB to 64GB, (inclusive) */
>  		return log2_in - 15;
>  	/* Something is awry so disable */
>  	return 0;
> -- 
> 2.47.0
> 

