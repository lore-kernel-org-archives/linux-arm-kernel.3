Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16C5C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 21:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsB3pN9BQv4DpfHkiX5eiA//lEFGbcJJHnUld0yEYFc=; b=1COB0lu8z3YH9ax/LqyZx+pUp5
	F1sC5j6ewUl0NiDhAez7KP8YTiTDZo+svq4IHfDCLqSYbn21ofImbO0oW6bhJImgvLmLIM+DiNnGD
	HE1BdzIrOSTN6XbiOHI/7mxb5QoCsbsYYmF4g6qFCnMPh4uJ/dDhPbYRtC/IUB98PMYMQAAzMAbL+
	JuLilFKEDcRpK1dZOVwKF6zH4etKI7KAI1d9a8JLkh7uUntketUQKvd4pNwE2QgFLBvJwzETh/SoC
	EdbaRRd2LkcYZ7itWCvV9mKaVyOUAlvU4oNQvUFAQXzuSldw2emCqtydjUu6uVoWPt0XsRF+FDkG2
	2T5BL2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9Ip-00000008fUF-2Rnl;
	Wed, 16 Jul 2025 21:04:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8UI-00000008aBl-1eCH;
	Wed, 16 Jul 2025 20:12:23 +0000
Date: Wed, 16 Jul 2025 22:12:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752696738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XsB3pN9BQv4DpfHkiX5eiA//lEFGbcJJHnUld0yEYFc=;
	b=0iMAgNn+c/kCnByEs8UgRRPA18M+uD9wAaFSuobsvit7xfmdRQSbBav0+R+cyQdTKlATk5
	Vn497KWdlGQNFc1V6oa8MTrZFVG0mmvtMDZPSoub+gmU+kRj6TVUGsrpHsKELQgGLXpPn2
	XYdVPop5ISRobjC4HIZxUdmQgGd/H6T48xu+GoLy7117KeNomdpomup7EDjdSK/D3epwba
	RTBFSYuIRSzAxYgm/Tc9PpoPrGgrfgiRl4R4uPkk06XZy7/4A/MyDtlEhoPRSBOeLVlGZU
	j78xr90jcjZD1FLRZeQuN93FMC9oFa1dBvTarvUvI/ixexZPa1s9odpdq/6gSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752696738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XsB3pN9BQv4DpfHkiX5eiA//lEFGbcJJHnUld0yEYFc=;
	b=uxWnWyuKJVvzspABpfi/gXCuMAXydr0WBKa104KKmTR1BllVXpBkb3lsibrME6nMIPgslH
	iQpjtEr0b8TO10Dg==
From: Nam Cao <namcao@linutronix.de>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
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
Message-ID: <20250716201216.TsY3Kn45@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
 <de3f1d737831b251e9cd2cbf9e4c732a5bbba13a.1750858083.git.namcao@linutronix.de>
 <7d8cfcf5-08db-4712-a98f-2cbfb9beeb85@mandelbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d8cfcf5-08db-4712-a98f-2cbfb9beeb85@mandelbit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_131222_571242_C75006BC 
X-CRM114-Status: GOOD (  17.46  )
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

On Wed, Jul 16, 2025 at 09:52:05PM +0200, Antonio Quartulli wrote:
> Hi Nam,
Hi Antonio,

> On 26/06/2025 16:48, Nam Cao wrote:
> [...]
> > -static void vmd_msi_free(struct irq_domain *domain,
> > -			struct msi_domain_info *info, unsigned int virq)
> > +static void vmd_msi_free(struct irq_domain *domain, unsigned int virq, unsigned int nr_irqs)
> >   {
> >   	struct vmd_irq *vmdirq = irq_get_chip_data(virq);
> > -	synchronize_srcu(&vmdirq->irq->srcu);
> > +	for (int i = 0; i < nr_irqs; ++i) {
> > +		synchronize_srcu(&vmdirq->irq->srcu);
> > -	/* XXX: Potential optimization to rebalance */
> > -	scoped_guard(raw_spinlock_irq, &list_lock)
> > -		vmdirq->irq->count--;
> > +		/* XXX: Potential optimization to rebalance */
> > +		scoped_guard(raw_spinlock_irq, &list_lock)
> > +			vmdirq->irq->count--;
> > -	kfree(vmdirq);
> > +		kfree(vmdirq);
> > +	}
> 
> By introducing a for loop in this function, you are re-using vmdirq after
> free'ing it.
> 
> I can't send a patch because I am not faimliar with this API and I don't
> know how to fix it.
> 
> However, the issue was reported today by Coverity.
> 
> Any idea? :-)

Thanks for the report. That was indeed a mistake from my side.

I hope PCI maintainers don't mind squashing the below diff.

Sorry for the troubles so far,
Nam

diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index 48a6096cbbc0..50f0c91d561c 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -280,9 +280,11 @@ static int vmd_msi_alloc(struct irq_domain *domain, unsigned int virq,
 static void vmd_msi_free(struct irq_domain *domain, unsigned int virq,
 			 unsigned int nr_irqs)
 {
-	struct vmd_irq *vmdirq = irq_get_chip_data(virq);
+	struct vmd_irq *vmdirq;
 
 	for (int i = 0; i < nr_irqs; ++i) {
+		vmdirq = irq_get_chip_data(virq + i);
+
 		synchronize_srcu(&vmdirq->irq->srcu);
 
 		/* XXX: Potential optimization to rebalance */


