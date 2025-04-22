Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49262C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=kWKcWrivgeB0MocX44dS5ldhuwd8EQLxMTmgAzy209I=; b=axnBX+MgGPiNyZ
	zkVG/rd2z2KsaEIcTk4qWUkKUouvok+wZYnUkunB+uAGDHrv1N7pVhRQsRVVGXA8vmyczAl9cKBqO
	3xD491yvPd5ViEPVbcLhEyKVVrdoWLKKh7kCnirIlFoI+VStqMpu3u6p9w42BcZ8Oq7E3FJn2blYQ
	B0aDCqpR3sNnxi1kDHN1Xty9STQCAoUf+98a4IJPh1YRmk/OA7WL36a3U3GWjNsAHququvbJz2NMu
	08Vn834Saer7r6mrpMKOfyHNgMh/3I5xOAHdu8Y2ZUprk44Xv3rM2XvRE64GG94D/HiVocW+2bGOi
	YLbG4a8SYZoyxPHLXMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jb2-00000008MRy-2HLe;
	Tue, 22 Apr 2025 19:47:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Hd9-000000082hA-0U9J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 17:42:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 650215C5B4C;
	Tue, 22 Apr 2025 17:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E667CC4CEEB;
	Tue, 22 Apr 2025 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745343718;
	bh=uq0jfSz7h0BjZ8ZpTqc6CuX5FFVkIxfTxureh4fqZro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EEy8WRQF134ZRnLUMOw1REGAnSr4h7t7LjozRR5uQeOga6pLqJEu1PNtpK8GPajFl
	 9Ms6+eK1MG0lhpVUfrsu6XvmlV0spw7EkWxSWHzFeS/9AROv/bwK9hWOAQbh9TMkPF
	 wLLNeRjdwbYllVfX2HhxzMFR4xjJtIOkcRWFSkwiet3LrnUydheQeTT4x2cBvz9stP
	 7nTq13b2DziCDxdrS24IX4ym45xns+8p3Qc0zSTiQBMYZyN0qtEZRuMYzDasCWgPyA
	 nKw7Mm9mm9Fx5JJsfl69eBCH5LZwjPAJL9Drv3ToeU2X5r350VTnL6Aha7Q0ZxBCMF
	 JljBFb4XcfggA==
Date: Tue, 22 Apr 2025 12:41:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 07/13] PCI: apple: Move away from INTMSK{SET,CLR} for
 INTx and private interrupts
Message-ID: <20250422174156.GA344533@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401091713.2765724-8-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_104159_194741_B89DE667 
X-CRM114-Status: GOOD (  11.59  )
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

On Tue, Apr 01, 2025 at 10:17:07AM +0100, Marc Zyngier wrote:
> T602x seems to have dropped the rather useful SET/CLR accessors
> to the masking register.
> 
> Instead, let's use the mask register directly, and wrap it with
> a brand new spinlock. No, this isn't moving in the right direction.

> @@ -261,14 +262,16 @@ static void apple_port_irq_mask(struct irq_data *data)
>  {
>  	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
>  
> -	writel_relaxed(BIT(data->hwirq), port->base + PORT_INTMSKSET);
> +	guard(raw_spinlock_irqsave)(&port->lock);
> +	rmw_set(BIT(data->hwirq), port->base + PORT_INTMSK);

sparse v0.6.4-39-gce1a6720 complains about this (and similar usage
elsewhere):

  $ make C=2 drivers/pci/
  drivers/pci/controller/pcie-apple.c:311:13: warning: context imbalance in 'apple_port_irq_mask' - wrong count at exit
  drivers/pci/controller/pcie-apple.c:319:13: warning: context imbalance in 'apple_port_irq_unmask' - wrong count at exit

But I guess we just have to live with this for now until somebody
makes sparse smarter:

https://lore.kernel.org/linux-sparse/CAHk-=wiVDZejo_1BhOaR33qb=pny7sWnYtP4JUbRTXkXCkW6jA@mail.gmail.com/

Nothing to do, just "huh".

Bjorn

