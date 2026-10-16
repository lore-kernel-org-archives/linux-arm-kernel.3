Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E734CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=FtiGdjgqtjT1pvwqeEY6y9aTlaYLGZB6OmGXYll3xpI=; b=QL6I1qGO7pUnYO
	jAWbGRKhaJI80PETAoqOG8Mve6xDfw0cz6QyJ7N6zO4iCgJeKtiCYvTfyt7ol3JlYPqXNLkzHPXQk
	+hraMVo+XSOn7yn6kGffZSMz6nO7NzNV9p/pvsQd7zk22iKStCFJsx7Ckard8Irx7vb5Nn31lMk99
	O2bUIhAhcniRRR75ZmEOwMjp66vGyfCgVpHJn0TaOR7vm2itIj/dMbMxzuuu04rDfswFAW0gQ3Yog
	ZSE3XEn2VUTqXYf/Y8XJ5oauoJcbpeMYtr6utpFuZLiF5ijMAQo27VCCOfkD6GzM6Av8sHDMooazy
	JSyylF+36jIp0Z9RjtLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmYb-00000003eJ1-0Vsl;
	Fri, 16 Oct 2026 18:21:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmYZ-00000003eIm-24qD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:21:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7457A43267;
	Fri, 16 Oct 2026 18:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26CB01F000C4;
	Fri, 16 Oct 2026 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792174886;
	bh=FtiGdjgqtjT1pvwqeEY6y9aTlaYLGZB6OmGXYll3xpI=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Ru5sFJDIojnoKUslABrY/JiS9gVMLdFF+C6MPIMI4ixlj6hyIKP8xDr/FB+iNQog4
	 t13WWgvXQQSY5wkHVZ9bshp2LLRGLN5S58md1dn8fawhIGs3+G7FYPwN59D6s4Tgis
	 WiWMX+qVuwLiSNR0r1Kw87MxAG5Usxd6XhaxMZqLq9Fe+skj+F0JEEbi/O8nOZ6XSR
	 Xka4+4l83bYE9AJ+TjeZTd0Q8lqQ5I/j+eADQhZ0lNjlKw3AkVD4fLDxPIzF0fiq/W
	 BlRoXKw8UG+a4XV7eo+ti6DlMIudETfY7emrUvSm4IOImIuCYB36pHI8DFZGswhRJG
	 lDILvsAIjPXuw==
Date: Fri, 16 Oct 2026 13:21:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Eugen Hristev <ehristev@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: iproc-msi: Bound events handled per IRQ
Message-ID: <20261016182124.GA1884550@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-iproc-irq-v1-1-ebaaf027f29e@kernel.org>
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

On Fri, Oct 16, 2026 at 03:18:53PM +0300, Eugen Hristev wrote:
> Limit each iProc MSI parent IRQ to 16 event-queue entries.
> 
> A continuously fed queue could otherwise keep the chained handler running
> and starve other work. The budget still drains pending events and lets the
> next parent interrupt continue processing, improving fairness and bounding
> interrupt-handler latency.
> 
> Without this starvation avoidance, one CPU can stall indefinitely
> in the loop and not serve other interrupts, timers, etc.
> 
> While testing it with an Ethernet NIC,  when too many MSI interrupts
> come in, CPU might get starved:
> 
> Connecting to host 192.168.30.1, port 5201
> [  5] local 192.168.30.2 port 52586 connected to 192.168.30.1 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec   240 MBytes  2.01 Gbits/sec    2    334 KBytes
> [  5]   1.00-2.00   sec  63.2 MBytes   531 Mbits/sec    1   1.41 KBytes
> [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  177.568497] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [  177.568913] rcu:     0-...!: (1 GPs behind) idle=28ac/1/0x4000000000000002 softirq=28922/28930 fqs=1
> [  177.569457] rcu:     (detected by 1, t=5256 jiffies, g=21629, q=819 ncpus=4)
> [  177.569870] Sending NMI from CPU 1 to CPUs 0:
> 
> With this bounded approach, IRQ handler will complete and continue
> to serve MSI events on the next handler invocation.

Is there something unique about iproc that makes this an issue, or do
we need to worry about this in every MSI interrupt handler?

> Assisted-by: Github Copilot
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
>  drivers/pci/controller/pcie-iproc-msi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/controller/pcie-iproc-msi.c
> index 9ba242ab9596..6649807822d2 100644
> --- a/drivers/pci/controller/pcie-iproc-msi.c
> +++ b/drivers/pci/controller/pcie-iproc-msi.c
> @@ -29,6 +29,9 @@
>  /* Number of entries in each event queue */
>  #define EQ_LEN                         64
>  
> +/* Bound parent interrupt handler such that a queue cannot starve CPU. */
> +#define IPROC_MSI_MAX_EVENTS_PER_IRQ   16
> +
>  /* Size of each event queue memory region */
>  #define EQ_MEM_REGION_SIZE             SZ_4K
>  
> @@ -326,6 +329,7 @@ static void iproc_msi_handler(struct irq_desc *desc)
>  	struct iproc_msi_grp *grp;
>  	struct iproc_msi *msi;
>  	u32 eq, head, tail, nr_events;
> +	unsigned int event_budget = IPROC_MSI_MAX_EVENTS_PER_IRQ;
>  	unsigned long hwirq;
>  
>  	chained_irq_enter(chip, desc);
> @@ -360,9 +364,11 @@ static void iproc_msi_handler(struct irq_desc *desc)
>  			break;
>  
>  		/* process all outstanding events */
> -		while (nr_events--) {
> +		while (nr_events && event_budget) {
>  			hwirq = decode_msi_hwirq(msi, eq, head);
>  			generic_handle_domain_irq(msi->inner_domain, hwirq);
> +			nr_events--;
> +			event_budget--;
>  
>  			head++;
>  			head %= EQ_LEN;
> @@ -373,6 +379,8 @@ static void iproc_msi_handler(struct irq_desc *desc)
>  		 * head pointer.
>  		 */
>  		iproc_msi_write_reg(msi, IPROC_MSI_EQ_HEAD, eq, head);
> +		if (!event_budget)
> +			break;
>  
>  		/*
>  		 * Now go read the tail pointer again to see if there are new
> 
> ---
> base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
> change-id: 20261016-iproc-irq-9c58cfe39158
> 
> Best regards,
> --  
> Eugen Hristev <ehristev@kernel.org>
> 

