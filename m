Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF4AC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 16:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9G3PGYTwXSaI5o+L1LNZwV67zKiKrYWIiEvzZvfIMQ=; b=qGY61xafLGXPNJ0BxsKGBjU+sc
	loggA/SP6OAfAjK0pf0E7DikMqaLQWh41yN0CGpIyigecNuKrUWbTqGx/Nw32o0URiE36I9TRiocT
	lCHPlIng1py3eodwmRobJKuUQR/PtQkgVjY6++Z4BNA9He2lOoo7IR7nPK7Z+cvFBbe2QKutCP0E3
	53P4ovngc5TMuG98NHA4As791smwoq6mlqrp7rfXIjIT1poz1Y7ffjJFmrHa8s4ImN2XzbDOlj0DO
	evux8hCIVQlENyh7TRagINWAMX6kg0KHk/SRR6XY/bYaSZrGw2c6zPgz1PCRk/VLYddb7h36G1um+
	AMAwBjWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiGS-00000005hzt-0qnS;
	Tue, 15 Jul 2025 16:12:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgjp-00000005OQX-2PVK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:34:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B13FA5C5C6D;
	Tue, 15 Jul 2025 14:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240B7C4CEE3;
	Tue, 15 Jul 2025 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752590072;
	bh=PYwhKe0GMvp7ihfIzBAq9SNNQepK3AlS2xPSvBMLHqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DUDcufFZ69Kj9Mg4obHeLJ1tqjVc4h81VF8IhZ0URP0Vsi6lLmBn8IYUPKptjuoAs
	 urAIFYKgUEAFIKwEOmgeBlL3njUCYEZC9JjRn+41vFX0QUtiMcRmyLqd8xJ2JrppeG
	 A3timXh4aoqwQetsAL3YoePXI0FLfw6X6LN2uDZ4pSHspKIFINZmg+UqFEDafkXveQ
	 adt+smXAdoyYGIq6LR3QDWlgxQ7jcLBG+/4dAWpw39BDvENsW8hzAySzM4X35NxUCV
	 7QYSunSoNxoCJKlhitjXAvMMhrqmeNYylYknPE8U+MYS/rTrrSBrmL2jr0g0Yq9xTP
	 wWWE2fWP1DytA==
Date: Tue, 15 Jul 2025 16:34:24 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
Subject: Re: [PATCH v7 18/31] arm64: smp: Support non-SGIs for IPIs
Message-ID: <aHZm8BsqV1ighJ+2@lpieralisi>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
 <20250703-gicv5-host-v7-18-12e71f1b3528@kernel.org>
 <7mhnql75p3l4vaeaipge6m76bw4wivskkpvzy5vx3she3wogk4@k62f5hzgx5wr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7mhnql75p3l4vaeaipge6m76bw4wivskkpvzy5vx3she3wogk4@k62f5hzgx5wr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_073433_694765_76682AB1 
X-CRM114-Status: GOOD (  21.52  )
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

On Tue, Jul 15, 2025 at 07:10:29AM -0700, Breno Leitao wrote:
> Hello Lorenzo, Marc,
> 
> On Thu, Jul 03, 2025 at 12:25:08PM +0200, Lorenzo Pieralisi wrote:
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index 3b3f6b56e733..2c501e917d38 100644
> 
> > @@ -1046,11 +1068,15 @@ static void ipi_setup(int cpu)
> >  		return;
> >  
> >  	for (i = 0; i < nr_ipi; i++) {
> > -		if (ipi_should_be_nmi(i)) {
> > -			prepare_percpu_nmi(ipi_irq_base + i);
> > -			enable_percpu_nmi(ipi_irq_base + i, 0);
> > +		if (!percpu_ipi_descs) {
> > +			if (ipi_should_be_nmi(i)) {
> > +				prepare_percpu_nmi(ipi_irq_base + i);
> 
> I am testing linux-next on commit 0be23810e32e6d0 ("Add linux-next
> specific files for 20250714") on a Grace (GiCv3), and I am getting
> a bunch of those:
> 
> 	[    0.007992] WARNING: kernel/irq/manage.c:2599 at prepare_percpu_nmi+0x178/0x1b0, CPU#2: swapper/2/0
> 
> 	[    0.007996] pstate: 600003c9 (nZCv DAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	[    0.007997] pc : prepare_percpu_nmi (kernel/irq/manage.c:2599 (discriminator 1))
> 	[    0.007998] lr : prepare_percpu_nmi (kernel/irq/manage.c:2599 (discriminator 1))
> 
> 	[    0.008011] Call trace:
> 	[    0.008011] prepare_percpu_nmi (kernel/irq/manage.c:2599 (discriminator 1)) (P)
> 	[    0.008012] ipi_setup (arch/arm64/kernel/smp.c:1057)
> 	[    0.008014] secondary_start_kernel (arch/arm64/kernel/smp.c:245)
> 	[    0.008016] __secondary_switched (arch/arm64/kernel/head.S:405)
> 
> I haven't bissected the problem to this patch specifically, but
> I decided to share in case this is a known issue, given you are touching
> this code.
> 
> I would be happy to bissect it, in case it doesn't ring a bell.

Thank you for reporting it.

Does this patch below fix it ?

-- >8 --
diff --git i/arch/arm64/kernel/smp.c w/arch/arm64/kernel/smp.c
index 4797e2c70014..a900835a3adf 100644
--- i/arch/arm64/kernel/smp.c
+++ w/arch/arm64/kernel/smp.c
@@ -1093,7 +1093,7 @@ static void ipi_setup_sgi(int ipi)
 
 	irq = ipi_irq_base + ipi;
 
-	if (ipi_should_be_nmi(irq)) {
+	if (ipi_should_be_nmi(ipi)) {
 		err = request_percpu_nmi(irq, ipi_handler, "IPI", &irq_stat);
 		WARN(err, "Could not request IRQ %d as NMI, err=%d\n", irq, err);
 	} else {

