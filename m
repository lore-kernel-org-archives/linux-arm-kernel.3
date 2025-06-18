Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8C0C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmBUUlB56xcm9Ql+UlWKGN1q8aIpGrCvJy+32fsOzZQ=; b=KaIR2G3Q/viExRIdGDUtI/7WOv
	CUsrPHXnT4Keu6t+aO/oqzzGgFMBYL++ux2XgqP5/+ostSMt2NOrpKOZgGpkMnF1y1FCaqb7y9owe
	65tMZDjHYkxBZV21MygTquZmsDPbASKmI/ATkU/MuT/Z+357cFP8z5EiDD7K3OHCuG1sTXdYTSI0O
	cUnwtNZEmj09lSm4ZzEsIZU+GBdRezts8ARfcLN7sDqhhKU3hgvP3zattyp+6QiJMH6WElSnN83dD
	bMQVkZptqF3m4McpWxP6pKg/XDvZdQDumAQ+G/FgxkWd68hSxKpFOfvvyMTCzgStFz56Fj04ZhvQD
	zIEyxi7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRywU-0000000BHhq-2AHr;
	Wed, 18 Jun 2025 19:59:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyu8-0000000BHPt-34iA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 19:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23E0B4A62C;
	Wed, 18 Jun 2025 19:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEE1C4CEE7;
	Wed, 18 Jun 2025 19:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750276622;
	bh=LODV13BAO/vPV1KR/ZrA48zSFSV7rhVVCDbvUO9rbCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5hCWJOq4BPeCPXNeDRpGBKL2aPnSMqJBqxjXFAR2SRBa5EnDn9dkzuxqDQNbEvyn
	 fBe9dyKKEvuzysSk8KQ23rW2e7DLfVl9W5bfq+MXDQ2Ekk2CLxIjwOSoJXi6Te+TBl
	 7C7XaAGn751Ko9xb2RGqAgP++GyMpDvi45jTrj7Gu9DNQMrl5OeFEzN2kVcrOODzc3
	 RgCEUVqJMI0ocsFhgdbB/HSfQ/5Axvz1EE9TR+bE74oNsRAZn/zPC0vcN8fzSP6w4r
	 Zk7b15ng+BIjJxGmbqNZXFT54eLakscZ6nBXx0fgBDNjo9rIXEJK5DhLmHgahFpL5P
	 2T7sA59b8j31w==
Date: Wed, 18 Jun 2025 21:56:54 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v5 24/27] irqchip/gic-v5: Add GICv5 ITS support
Message-ID: <aFMaBlByS8xPq6kc@lpieralisi>
References: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
 <20250618-gicv5-host-v5-24-d9e622ac5539@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-gicv5-host-v5-24-d9e622ac5539@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_125704_794035_398EDFA2 
X-CRM114-Status: GOOD (  17.97  )
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

On Wed, Jun 18, 2025 at 12:17:39PM +0200, Lorenzo Pieralisi wrote:

[...]

> +static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
> +				  int nvec, msi_alloc_info_t *info)
> +{
> +	struct msi_domain_info *msi_info;
> +	struct device_node *msi_node;
> +	struct pci_dev *pdev;
> +	phys_addr_t pa;
> +	int ret;
> +
> +	if (!dev_is_pci(dev))
> +		return -EINVAL;
> +
> +	pdev = to_pci_dev(dev);
> +
> +	msi_node = pci_msi_get_device_msi_ctlr_node(pdev);
> +	if (!msi_node)
> +		return -ENODEV;
> +
> +	ret = its_translate_frame_address(msi_node, &pa);
> +	if (ret)
> +		return -ENODEV;
> +
> +	of_node_put(msi_node);
> +
> +	/* ITS specific DeviceID */
> +	info->scratchpad[0].ul = pci_msi_domain_get_msi_rid(domain->parent, pdev);

Heads-up: it turned out I was too optimistic and reusing

pci_msi_domain_get_msi_rid()

on GICv5 does not work (or better it works incorrectly).

It calls (for DT) of_msi_map_id() with the IRQ domain of_node (why, I am
not sure but for GICv3 it works because the phandle in the msi-map and
the IRQ domain of_node are equivalent). This does _not_ work on GICv5,
I failed to spot it because in of_msi_map_id() if the IRQ domain of_node
and msi-map phandle do not match a 1:1 translation is carried out, which
ironically is what the RID<->DID translation looks like in the test
platform. Sigh.

I have already patched the code to augment:

pci_msi_get_device_msi_ctlr_node()

so that it grabs the msi-controller of_node pointer in msi-map AND maps the
RID->DID (and to be honest that's what I should have done but I wanted to
reuse pci_msi_domain_get_msi_rid(), it does not work for GICv5 unless I
change it but I fear I could break platforms, we don't fix what it is not
broken).

Long story short: apologies, I missed this snag for the reasons above, I
will update it for v6.

Thanks,
Lorenzo

