Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3D5C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 21:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=qR23SM+wdC4VPobpFg46mMI8gUD+nT58htc8LS1fEmw=; b=bMIKv/AW6Aj5gD
	ewfD7bEHl2M8bqXQFK2AXT3G5EHmc15jIkjSp1ypEclJZZ1yXnvvZ1GZe3pahX2/EFhsXqHTEOYDa
	OVW8PXHfTd5JF0f08JGvTSUfVjRGm2TN8P0iyBkQs2Z55e6Zhq79n2jD1BrU0XkCW0fFlT6LKgGbB
	9Puvqb6dKc4WtijQOOnsFPa7YcD9TGQI/yNQUSQEkcWtda31sPyVaBFJMj/zsS8KOf1BonU2PbXrM
	UNFOBxQkTp+XIIzD7GMUY5OMwezzY/KSB+dTHdO4LwIowtPVLshhJCWcb3l8wOpB79LFlZJHh9zZN
	qQHmdTnLp6TnAeq88uoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlamg-00000006wKa-0wOO;
	Fri, 21 Feb 2025 21:42:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlalC-00000006w2q-0T6M;
	Fri, 21 Feb 2025 21:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B5DE5C6E0E;
	Fri, 21 Feb 2025 21:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CE8C4CED6;
	Fri, 21 Feb 2025 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740174037;
	bh=9fvV1HXHQezyHbGraYC4O5PEEvTUXe//QLm/vAzf9a0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lrqIfVBfJONAREehMa52UNOot1th/3/B4a+NqS7b7TbT6xuGaqMSF+ZmHZCxPviuV
	 7Um77DfVykXYaoZq8gRPEqdq/uKufY0jYKWnHxvED2bVEbD4s25RcmVlRRNsBZsNCC
	 43fLjUiyeYIEAJm45P3gmC/obYuYwjvlhj5Xuv6Idpv/IByGD34GihwIyyNA9McwKI
	 vS4FhoFMR5QivgpnLAcIAnYl9KyMhH1EdIuu+jctszitd/I+xKFQyXh+tNsH8boub6
	 ucH21pL8TXW0/zv6SD+iZfBIWvyEmZQ1oZhVNsrDY4dCjtnS0c6rPkBbH75GrCDmGn
	 NJnrEjFyAjvdw==
Date: Fri, 21 Feb 2025 15:40:35 -0600
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
Subject: Re: [PATCH v5 -next 08/11] PCI: brcmstb: Adding a softdep to MIP
 MSI-X driver
Message-ID: <20250221214035.GA362971@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120130119.671119-9-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_134038_201655_DB493446 
X-CRM114-Status: GOOD (  17.23  )
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

On Mon, Jan 20, 2025 at 03:01:16PM +0200, Stanimir Varbanov wrote:
> In case brcmstb PCIe driver and MIP MSI-X interrupt controller
> drivers are built as modules there could be a race in probing.
> To avoid this add a softdep to MIP driver to guarantee that MIP
> driver will be load first.

Maybe this one too?  Should this be moved to after the irq_bcm2712_mip
driver is added, but before brcmstb will claim bcm2712?  I just want
to avoid bisection problems when possible, and it sounds like if we
lose the race, interrupts might not work as expected?
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---
> v4 -> v5:
>  - New patch in the series.
> 
>  drivers/pci/controller/pcie-brcmstb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 03396a9d97be..744fe1a4cf9c 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1997,3 +1997,4 @@ module_platform_driver(brcm_pcie_driver);
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Broadcom STB PCIe RC driver");
>  MODULE_AUTHOR("Broadcom");
> +MODULE_SOFTDEP("pre: irq_bcm2712_mip");
> -- 
> 2.47.0
> 

