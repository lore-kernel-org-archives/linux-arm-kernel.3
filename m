Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED5EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=LjR9q5M7TDaY6qH1NaGLKPiONQtKtqCDscjzoIwnNXk=; b=T2ATuDcQHmW6rs
	HMYHhkVUJ+ZvMSEo2rr7Pb2OFhnZEImCm/ctZSKS8OjgHHVD7TDMBItmy3gxliWP48tXGY/+RPxDa
	wEjrz9X09NgC1M5r1Q7yJIYVRMgKpDRYwpqHPmglw7DyfKk7JC/gPytpS4uq1XdyTpyG2IfQahg+c
	oz6+kMhapskFswQlSlgzFLCsQJyTvkaU/RxJUVIrxEDFyMeN7NA8kEucng6JVlAlL97wqxcM9SqvM
	WUvU28lmvgbj5GgqeLh8GDDuOtgGlX3omeATOtkRtK6eEUQDR95xLyroPLc4KtScTRadKHGVwa6F2
	feeGFykFR4XOF1eyrrtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYooO-000000032Ad-2kAz;
	Mon, 07 Jul 2025 16:35:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoLM-00000002y4F-3V0F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B3185C2732;
	Mon,  7 Jul 2025 16:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8D8C4CEE3;
	Mon,  7 Jul 2025 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751904324;
	bh=kVh12//YSMQ4B4jH4d5HEOfJcPY9d17U+Of7O6JlIQs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=mGe9GTfmVE7XJ8H87jr9KtM0uEO7HzuctE//hGNAUPHzRVH2JJP+5pJGZJhcHyXyw
	 eqh05iP4WZrABco7Q+tQimDbHjNmiOFfneAb4dVTf/o1E/LsS/cjSG4TfP3Faf8/Sy
	 YIMICeOjcoOOfq9JIBDHqBtOAS/lyIadQnvQrzse9XjUTpXD1f9/DLxsZ6hkJXCMNI
	 3wEUVvYrIKa6HhH5uy9ul/j1NJ+RsbsElUm9O7K3ONgd9SUZPBAZu/j6QWK1m7Cj+w
	 KISwYWqNcjvtRQLifs/JazUsitpHW5eH32y4u81gOAvXIr2RQZwe8s161Wk7KBymTA
	 CuAAO2ivLAQRw==
Date: Mon, 7 Jul 2025 11:05:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	mhklinux@outlook.com, tglx@linutronix.de, bhelgaas@google.com,
	romank@linux.microsoft.com, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	jinankjain@linux.microsoft.com, skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com, x86@kernel.org
Subject: Re: [PATCH v2 6/6] PCI: hv: Use the correct hypercall for unmasking
 interrupts on nested
Message-ID: <20250707160522.GA2086655@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1751582677-30930-7-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090524_948119_7819D112 
X-CRM114-Status: GOOD (  22.70  )
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

On Thu, Jul 03, 2025 at 03:44:37PM -0700, Nuno Das Neves wrote:
> From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> 
> Running as nested root on MSHV imposes a different requirement
> for the pci-hyperv controller.
> 
> In this setup, the interrupt will first come to the L1 (nested) hypervisor,
> which will deliver it to the appropriate root CPU. Instead of issuing the
> RETARGET hypercall, issue the MAP_DEVICE_INTERRUPT hypercall to L1 to
> complete the setup.
> 
> Rename hv_arch_irq_unmask() to hv_irq_retarget_interrupt().
> 
> Co-developed-by: Jinank Jain <jinankjain@linux.microsoft.com>
> Signed-off-by: Jinank Jain <jinankjain@linux.microsoft.com>
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> Reviewed-by: Roman Kisel <romank@linux.microsoft.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/controller/pci-hyperv.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> index 4d25754dfe2f..9a8cba39ea6b 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -600,7 +600,7 @@ static unsigned int hv_msi_get_int_vector(struct irq_data *data)
>  #define hv_msi_prepare		pci_msi_prepare
>  
>  /**
> - * hv_arch_irq_unmask() - "Unmask" the IRQ by setting its current
> + * hv_irq_retarget_interrupt() - "Unmask" the IRQ by setting its current
>   * affinity.
>   * @data:	Describes the IRQ
>   *
> @@ -609,7 +609,7 @@ static unsigned int hv_msi_get_int_vector(struct irq_data *data)
>   * is built out of this PCI bus's instance GUID and the function
>   * number of the device.
>   */
> -static void hv_arch_irq_unmask(struct irq_data *data)
> +static void hv_irq_retarget_interrupt(struct irq_data *data)
>  {
>  	struct msi_desc *msi_desc = irq_data_get_msi_desc(data);
>  	struct hv_retarget_device_interrupt *params;
> @@ -714,6 +714,20 @@ static void hv_arch_irq_unmask(struct irq_data *data)
>  		dev_err(&hbus->hdev->device,
>  			"%s() failed: %#llx", __func__, res);
>  }
> +
> +static void hv_arch_irq_unmask(struct irq_data *data)
> +{
> +	if (hv_root_partition())
> +		/*
> +		 * In case of the nested root partition, the nested hypervisor
> +		 * is taking care of interrupt remapping and thus the
> +		 * MAP_DEVICE_INTERRUPT hypercall is required instead of
> +		 * RETARGET_INTERRUPT.
> +		 */
> +		(void)hv_map_msi_interrupt(data, NULL);
> +	else
> +		hv_irq_retarget_interrupt(data);
> +}
>  #elif defined(CONFIG_ARM64)
>  /*
>   * SPI vectors to use for vPCI; arch SPIs range is [32, 1019], but leaving a bit
> -- 
> 2.34.1
> 

