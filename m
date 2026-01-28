Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D86D3F073
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qcD0Ijhne47v7V35QjhE/iTNN45mWkQXezDde3oqYU=; b=ZtZrGn+zwqrVknve/pHpg4QPAJ
	c61U0hAJ13ibMR883MbLTUbCNalwU61Z8ccTjRBQhdUnEpxuSDQrsRDPsf4bHk4oHQksK4gjD5UId
	tWZXmxdXjhHsl+OhQXSiF28+0uYvr0ig26u5ZT8TAoeBwi2Vqfo64tP+EEBeXuO/wu1osU1VR0KfP
	XK6X4dTNotACkMNz7kot70nVikX+N2DpqGQyiM7NC8M7QddXzBhfrtUWZWlR1Pdwupm0+m+54Api8
	H0PyabWOVi334tJipEfFlFX+V92QiXiCmp8T+wCnYfzJL3d3PJSkEmKqbS5Qo1oIGvJEzVfCbrb7o
	h9ua3A5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6er-0000000GBU8-2ABj;
	Wed, 28 Jan 2026 14:36:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6ep-0000000GBTt-1uNS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BB6460007;
	Wed, 28 Jan 2026 14:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DEBC4CEF1;
	Wed, 28 Jan 2026 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769610994;
	bh=w7RrBBzZIuz8xqrWdZPUre+AvVJylwUW9queAH7gzkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLgYQaz3hk08B66xJru+tcLyUXLfa2syE5i0+ySVr5hp2pTvBHFoYfN2RUqzL63xr
	 TnXnJYFbFmIqK0F84CfWyeINuD4unEvDN9HxQVQpR/uTo8mtdSMIA6pEe+dNcxk18+
	 GJWNXS6LU16HcUVNJhaTri8i7hdJOaZhFOZIGyFlK0gMlXsenBJFkcC3m/5zQ2SFWZ
	 +B/2/0DdD9Gu9ZhaCDQ83hv55zLYP27Yhesox8Sh5yOEZs5Yoo8RrDJpPH27u9fRnr
	 t222h4hNov3WoLGJ3NJjV9LL8kcHxUjOdj1AeqOS02hJaBhsfWFJNWnVbZiExRrfSs
	 w+hRuUqcOcsYA==
Date: Wed, 28 Jan 2026 20:06:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, 
	linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arch@vger.kernel.org, kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	hpa@zytor.com, joro@8bytes.org, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de, 
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com, romank@linux.microsoft.com
Subject: Re: [PATCH v0 10/15] PCI: hv: Build device id for a VMBus device
Message-ID: <323krpkmg4zmswo567ccah2g7ymprs66nfei3eo6saobl2azda@35jdfloq5g3g>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-11-mrathor@linux.microsoft.com>
 <aXAAH4G9ztAGDWuy@skinsburskii.localdomain>
 <a2e54fff-3cbb-e332-c35e-7520c36eceed@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2e54fff-3cbb-e332-c35e-7520c36eceed@linux.microsoft.com>
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

On Fri, Jan 23, 2026 at 04:42:54PM -0800, Mukesh R wrote:
> On 1/20/26 14:22, Stanislav Kinsburskii wrote:
> > On Mon, Jan 19, 2026 at 10:42:25PM -0800, Mukesh R wrote:
> > > From: Mukesh Rathor <mrathor@linux.microsoft.com>
> > > 
> > > On Hyper-V, most hypercalls related to PCI passthru to map/unmap regions,
> > > interrupts, etc need a device id as a parameter. This device id refers
> > > to that specific device during the lifetime of passthru.
> > > 
> > > An L1VH VM only contains VMBus based devices. A device id for a VMBus
> > > device is slightly different in that it uses the hv_pcibus_device info
> > > for building it to make sure it matches exactly what the hypervisor
> > > expects. This VMBus based device id is needed when attaching devices in
> > > an L1VH based guest VM. Before building it, a check is done to make sure
> > > the device is a valid VMBus device.
> > > 
> > > Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
> > > ---
> > >   arch/x86/include/asm/mshyperv.h     |  2 ++
> > >   drivers/pci/controller/pci-hyperv.c | 29 +++++++++++++++++++++++++++++
> > >   2 files changed, 31 insertions(+)
> > > 
> > > diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
> > > index eef4c3a5ba28..0d7fdfb25e76 100644
> > > --- a/arch/x86/include/asm/mshyperv.h
> > > +++ b/arch/x86/include/asm/mshyperv.h
> > > @@ -188,6 +188,8 @@ bool hv_vcpu_is_preempted(int vcpu);
> > >   static inline void hv_apic_init(void) {}
> > >   #endif
> > > +u64 hv_pci_vmbus_device_id(struct pci_dev *pdev);
> > > +
> > >   struct irq_domain *hv_create_pci_msi_domain(void);
> > >   int hv_map_msi_interrupt(struct irq_data *data,
> > > diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> > > index 8bc6a38c9b5a..40f0b06bb966 100644
> > > --- a/drivers/pci/controller/pci-hyperv.c
> > > +++ b/drivers/pci/controller/pci-hyperv.c
> > > @@ -579,6 +579,8 @@ static void hv_pci_onchannelcallback(void *context);
> > >   #define DELIVERY_MODE		APIC_DELIVERY_MODE_FIXED
> > >   #define HV_MSI_CHIP_FLAGS	MSI_CHIP_FLAG_SET_ACK
> > > +static bool hv_vmbus_pci_device(struct pci_bus *pbus);
> > > +
> > 
> > Why not moving this static function definition above the called instead of
> > defining the prototype?
> 
> Did you see the function implementation? It has other dependencies that
> are later, it would need code reorg.
> 
> Thanks,
> -Mukesh
> 
> 
> > >   static int hv_pci_irqchip_init(void)
> > >   {
> > >   	return 0;
> > > @@ -598,6 +600,26 @@ static unsigned int hv_msi_get_int_vector(struct irq_data *data)
> > >   #define hv_msi_prepare		pci_msi_prepare
> > > +u64 hv_pci_vmbus_device_id(struct pci_dev *pdev)
> > > +{
> > > +	u64 u64val;
> > 
> > This variable is redundant.
> 
> Not really. It helps with debug by putting a quick print, and is
> harmless.
> 

Such debug print do not exist now. So there is no need of a variable, drop it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

