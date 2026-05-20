Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E60CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=R0zqzL14QP54GH3jHTaO1SQNTYgp8+cLjLzjCAobAGk=; b=FAq+HZqVPDtcQc
	2ubkV1QEgH73erLYVh5weW6i4h+wlAoRJsLr9UzrY09ZS/p3Lu9L82wudc47g25ShZzQRJCGGOWFq
	VD4IcK3eqRLa7a+MZbMXvA6KDQjd3uIz5EITttzW/I5a4hWBZeSjLWBJdTWFlIqg5U2JkADU2m8wM
	3phCZmbLiKdLxNj1x1lnSFa0NzhnRTTiqfagpf8a3ewtGIGW79ImIVOpoExcmK4nJMnrBjDQ1orR0
	8OaLZZMsXYHjLzTBxhI0+Na34AoNBgwx1zyMwNSzpQCnIqadMHgLsZ9UGQ+6CGsMStkNFazjNMO0J
	s7/dNpnuWj1dYRosCXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPl3w-00000005M3E-1u1X;
	Wed, 20 May 2026 17:50:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPl3u-00000005M1u-1DbN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 17:50:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id AD974443FD;
	Wed, 20 May 2026 17:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 67E7F1F00894;
	Wed, 20 May 2026 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779299429;
	bh=R0zqzL14QP54GH3jHTaO1SQNTYgp8+cLjLzjCAobAGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=o04FxFSeEu2JsqhZx5OZM3BDhGPv6QRlZ3tyjx7QyJCNH4PgvpbY6crWRP0ySi/Bk
	 eoFlnOUTyjrv3TfWKUA17ZP154W66QqbDBz8+f8TimC+9g0o1DU/zBKtezMnpUJyiw
	 2D9ME/z+rrqUOp5eXspuvuC+1uS6d6LTPE2Pav4/DhwzGb+1h9RI5VlNl5KgvJ4D1O
	 bN++qKkiaa1yIh5e5QK1md2NiLHH4tSBGFwkXF2S7ihdKUJSh5EbNPF+E0vNfMR8JL
	 HG2/UCVDv7Cfwlg6DbemkAm9EBFvu6ow8EhGcaBk9grywLGOf6AW4ZlfQVkqHH/rEg
	 rl9W0y+gl3nAg==
Date: Wed, 20 May 2026 12:50:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com,
	bhelgaas@google.com, joro@8bytes.org, praan@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v4 2/3] PCI: Allow ATS to be always on for pre-CXL devices
Message-ID: <20260520175026.GA67027@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a8cf5e88051ab5c10417edb94df598ecbc810cf.1777269009.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_105030_354243_20B9536A 
X-CRM114-Status: GOOD (  15.01  )
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

On Sun, Apr 26, 2026 at 10:54:01PM -0700, Nicolin Chen wrote:
> Some NVIDIA GPU/NIC devices, though they don't implement CXL config space,
> have many CXL-like properties. Call this kind "pre-CXL".
> 
> Similar to CXL.cache capability, these pre-CXL devices also require the ATS
> function even when their RIDs are IOMMU bypassed, i.e. keep ATS "always on"
> v.s. "on demand" when a non-zero PASID line gets enabled in SVA use cases.
> ...

> +/* Some pre-CXL devices require ATS when it is IOMMU-bypassed */

I guess these devices are purely PCIe, with no actual CXL
transactions, so a hint here about what leads to the ATS requirement
would be useful.  It sounds like an actual functional requirement, not
just a performance optimization.

> +bool pci_dev_specific_ats_always_on(struct pci_dev *pdev)
> +{
> +	const struct pci_dev_ats_always_on *i;
> +
> +	for (i = pci_dev_ats_always_on; i->vendor; i++) {
> +		if (i->vendor != pdev->vendor)
> +			continue;
> +		if (i->ats_always_on && i->ats_always_on(pdev))
> +			return true;
> +		if (!i->ats_always_on && i->device == pdev->device)
> +			return true;
> +	}
> +
> +	return false;
> +}
>  #endif /* CONFIG_PCI_ATS */
>  
>  /* Freescale PCIe doesn't support MSI in RC mode */
> -- 
> 2.43.0
> 

