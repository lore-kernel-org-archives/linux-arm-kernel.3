Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B65C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=aIqiJfBaap59+OJd3uvKSkdj5j/eFaObw33Wwj5CgGM=; b=VZXKSJmqUd0dAV
	abloX8AnrbdpAljnO64PFYJw2OlOcsQuZpFm48yPiFFO1eD4LoBqt4ebY+rOhpHtrDGguIGe5+5sz
	iKPL4RaM9xwztKpmkB3gZixsVImmUa/CA2iNlzM/WZ1PdKWsdeRXgTDtkXu8hWvge9CtKHJafzHCp
	LV6AeVeCThiQR8j/bIKtZvGmbL1OyGCzr9lVrDs9Li9BYSNEUeZrlhGeU0MFtiIwrBVSXXrgdr/kt
	MWcAibCRLL7z2xu4LEmedLNPAJYnprtNepqqry5i3BzozULlCJbiqTOqSuWrvohtHnDpFm45rz6QJ
	KgfFqQ6lz79ABkUir/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9Ne-00000008fr7-2Rel;
	Wed, 16 Jul 2025 21:09:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8mc-00000008cBo-25yt;
	Wed, 16 Jul 2025 20:31:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 46073A575A9;
	Wed, 16 Jul 2025 20:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B453BC4CEE7;
	Wed, 16 Jul 2025 20:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752697876;
	bh=kRiXunSKIWhECmgIaCZqujGPFLD5IyiabiwSwI/oAUw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=efF0hPcZqjnO64wo0iSK/h4ZKrebfuyFzwH7mVu+6WyNJq9lz4t6ieWUVVRTRmp1k
	 ZyUQlnPJBXrf36cVsIwM+lr5rw4JmHHyPSnxIxc+sMTR5nc+fov+3HTPN8Zz+/It7N
	 nFhVdmof/TLwUmuR5wv2Z5SYP1YMaekWd9SRe52KrMJtXOrqM7TWHLN/FIuuNQPx5Y
	 IBpazzdB+v05g2NH6+eI5Egja4tj22kqB5+MXf7a0C48d9Z0SHsuEtTUrYuhEPtBT4
	 DZmGj5yCLKi0JGd+KmWsm+B2IIr4Fk/I4kdlrhDnCNII0vLcGpI6DyGqXSw8zwSesI
	 2ECRq60OVgk5g==
Date: Wed, 16 Jul 2025 15:31:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Antonio Quartulli <antonio@mandelbit.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 16/16] PCI: vmd: Switch to msi_create_parent_irq_domain()
Message-ID: <20250716203115.GA2553753@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716201216.TsY3Kn45@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_133118_667464_DE6D60FE 
X-CRM114-Status: GOOD (  22.40  )
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

On Wed, Jul 16, 2025 at 10:12:16PM +0200, Nam Cao wrote:
> On Wed, Jul 16, 2025 at 09:52:05PM +0200, Antonio Quartulli wrote:
> > Hi Nam,
> Hi Antonio,
> 
> > On 26/06/2025 16:48, Nam Cao wrote:
> > [...]
> > > -static void vmd_msi_free(struct irq_domain *domain,
> > > -			struct msi_domain_info *info, unsigned int virq)
> > > +static void vmd_msi_free(struct irq_domain *domain, unsigned int virq, unsigned int nr_irqs)
> > >   {
> > >   	struct vmd_irq *vmdirq = irq_get_chip_data(virq);
> > > -	synchronize_srcu(&vmdirq->irq->srcu);
> > > +	for (int i = 0; i < nr_irqs; ++i) {
> > > +		synchronize_srcu(&vmdirq->irq->srcu);
> > > -	/* XXX: Potential optimization to rebalance */
> > > -	scoped_guard(raw_spinlock_irq, &list_lock)
> > > -		vmdirq->irq->count--;
> > > +		/* XXX: Potential optimization to rebalance */
> > > +		scoped_guard(raw_spinlock_irq, &list_lock)
> > > +			vmdirq->irq->count--;
> > > -	kfree(vmdirq);
> > > +		kfree(vmdirq);
> > > +	}
> > 
> > By introducing a for loop in this function, you are re-using vmdirq after
> > free'ing it.
> > 
> > I can't send a patch because I am not faimliar with this API and I don't
> > know how to fix it.
> > 
> > However, the issue was reported today by Coverity.
> > 
> > Any idea? :-)
> 
> Thanks for the report. That was indeed a mistake from my side.
> 
> I hope PCI maintainers don't mind squashing the below diff.

Squashed, thanks!  Updated commit:

  https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?id=4246b7fccf26

> diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> index 48a6096cbbc0..50f0c91d561c 100644
> --- a/drivers/pci/controller/vmd.c
> +++ b/drivers/pci/controller/vmd.c
> @@ -280,9 +280,11 @@ static int vmd_msi_alloc(struct irq_domain *domain, unsigned int virq,
>  static void vmd_msi_free(struct irq_domain *domain, unsigned int virq,
>  			 unsigned int nr_irqs)
>  {
> -	struct vmd_irq *vmdirq = irq_get_chip_data(virq);
> +	struct vmd_irq *vmdirq;
>  
>  	for (int i = 0; i < nr_irqs; ++i) {
> +		vmdirq = irq_get_chip_data(virq + i);
> +
>  		synchronize_srcu(&vmdirq->irq->srcu);
>  
>  		/* XXX: Potential optimization to rebalance */
> 

