Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39254CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bAP0jFBI8WAL+VDXYWXzcPI8IjLkXvZH2SutsFfuipo=; b=Akv6BFWOlkQFOYoj8LHEIGTBPp
	L6go6pio42NL4lhFrzaZFoNoaeddJmWnCfgc8ck+SdF7a0eD7bQ+DjEloINTJIx5swjiUsgVAPsal
	9gOWKNHSHExmf0E1/+vJo1e8BTQBYRYpt2Py2o03cq3+Y1tmvj9fIOfIjeg3keKWt0kooYhZlvXHw
	ZyCIsXY9aJGyLDom+trNMH7aDPqDI4lWjpAPY5F7WFwnhYHBjtjh9gRfO0/wUiq7o4lIF2+f/sIJa
	SRIjcID08lhf/sgAshBLc2oKUt1vmcvja5ENqCPJabSMmeLt3WbZFmLJj+3jEUgT+bqFnm5TWPpjh
	ndMXZy8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH04-0000000HAeF-1h6z;
	Thu, 15 Oct 2026 08:39:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH01-0000000HAdK-2tzR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:39:42 +0000
Date: Thu, 15 Oct 2026 10:39:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792053579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=bAP0jFBI8WAL+VDXYWXzcPI8IjLkXvZH2SutsFfuipo=;
	b=cH7wevxJoqYgrOYPPcVpz1mXa17o3t6H5ZnOsS6sjw1dpVIaZxU2ngfODWwZFwo/vmCxJA
	eGnLvO/WBiw4/EiEXuyA9D3GZuXgsdU35tnaL8xCz/YCUjxsZkMRNyXHAQ7H14yZcljvnV
	N/KX9/XAZihSlQsqmYOTlVdi4OF85MJw5CLI82EGF/yWzM32+vFDetwVR87DZCajcKOlbv
	IXN0wwrbbX3Sampb+W1FPG7b2Q53YwriFA4O4kr25vBLMf5XmrZXjprkighBQIpSyGi4Qi
	nJeXDqJsxa/Og19RBgtub90tRQgzWIrP5Q1ub5/s351/DZZlddQN6bC7l+QVUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792053579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=bAP0jFBI8WAL+VDXYWXzcPI8IjLkXvZH2SutsFfuipo=;
	b=JBxjdmKaAHPCOWINepCeoqlvfCr2GJ2vjheYVcFtESuxFM/2BxXPJ4dhpZTkDKvtcKMNwv
	CU5ppBAO/ex+CyDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Harini T <harini.t@amd.com>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Saeed Nowshadi <saeed.nowshadi@amd.com>
Subject: [Q] zynqmp-ipi-mailbox and SGI interrupts
Message-ID: <20261015083937.8SDbdK8P@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_013941_871136_B2D22A2F 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

Hi,

The ZynqMP IPI Mailbox driver supports two bindings of which
xlnx,versal-ipi-mailbox is not present in any kernel dts file and
xlnx,zynqmp-ipi-mailbox is used in two .dtsi files.
For the per-CPU interrupts the irq-type should be 2 (which would
correspond with GIC_ESPI in the dts, no?) which I can't find.
Before the IPI_IRQ_TYPE_SGI it used to check for the value less than 16
I also can't find this in the two available dts file.
I did browse over the "AMD Versal Virt" but it also looks not present.

My question is whether this is used or just a development step that
never got somewhere. 
My guess is that the device tree here is preconfigured from the boot
firmware.
So is this SGI-IPI a thing or not?

Sebastian

