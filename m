Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E1D1093188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=te7Xho+l2M4XyF2VhG3APGIPAEOtC9hgA22fVNJ7X3E=; b=mF7nxouN5bnXR1DAAL+qibDj+5
	KGO9KuPzMJFb7gI2yESichrLewUUFXg3KbO/5UQ/fZafhqgY5OhpkcMm113kOsZ16LkGQWdbN9Qze
	KSt32SSJQDJQKaTFVtI9OHC2CtOj7H0NM4kD8YDlaQndelkT0c9xZRl5OVJi0gBbNPCZcg6qlPqHf
	mioEac79lFhtxrTvFr7oo6tXq2+ncRYCdTmWrUIvAh3/XogXveYI59znaZj8XzwUyvR/enZhloYst
	okgSwpMs3bqPOR9ua/HKqn3dxhGIwmfyv2b9KLMKf0NdvSbwL9+4l8gpS30Ord+Ryc+PvxeGqLF1T
	6zMnvnpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VAF-0000000CL32-0Pd2;
	Fri, 20 Mar 2026 08:25:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VAC-0000000CL29-2V2R;
	Fri, 20 Mar 2026 08:25:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80C284456C;
	Fri, 20 Mar 2026 08:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE54C2BC87;
	Fri, 20 Mar 2026 08:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773995099;
	bh=5sQNvmWQfpu+8Hr47TI2X8prZ8bvsa2R1XHx8VD2x8U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CzS5eoM0f2loHEf3GLYkghCyVQ2yYnMGqfDIRbO7GCqBNLBsQ20/Qo2IFO//yQjkP
	 L96R3cHLc0svMwur92gnB0/OMaBzF3mSeJdJp4zo5wqxfI9egzkjCXOs6lPnRexoGt
	 CGNUxpBADXLcD31k7tJNxqHxKv76QzAl1ebIPfaFSTVTR8e5ENh5uztgarug6VMKVa
	 IEKKMDfDDTO8UfULyEPLHWQeRnQHBVMBPq8NFPRGq+JeRhykAGDLox6sCMXO+BMHoP
	 sFgUAoEfG2zm6WrxHo8hYJFF4zEdDKxD3/6xhLEoUw06ZsXSpCkKd8Snq6ZXvqw/K1
	 BRzE7vr5n8D4A==
From: Thomas Gleixner <tglx@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: aspeed: Add
 AST2700-A2 support
In-Reply-To: <20260306-irqchip-v2-1-f8512c09be63@aspeedtech.com>
References: <20260306-irqchip-v2-0-f8512c09be63@aspeedtech.com>
 <20260306-irqchip-v2-1-f8512c09be63@aspeedtech.com>
Date: Fri, 20 Mar 2026 09:24:55 +0100
Message-ID: <87tsualxgo.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_012500_655627_9FE6427F 
X-CRM114-Status: UNSURE (   8.25  )
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

On Fri, Mar 06 2026 at 16:07, Ryan Chen wrote:

> Introduce a new binding describing the AST2700 interrupt controller
> architecture implemented in the A2 production silicon.
>
> The AST2700 SoC has undergone multiple silicon revisions (A0, A1, A2)
> prior to mass production. The interrupt architecture was substantially
> reworked after the A0 revision for A1, and the A1 design is retained
> unchanged in the A2 production silicon.
>
> The existing AST2700 interrupt controller binding was written against
> the pre-production A0 design. That binding does not accurately describe
> the interrupt hierarchy and routing model present in A1/A2, where
> interrupts can be routed to multiple processor-local interrupt
> controllers (Primary Service Processor (PSP) GIC, Secondary Service
> Processor (SSP)/Tertiary Service Processor (TSP) NVICs, and BootMCU
> APLIC) depending on the execution context.
>
> Hardware connectivity between interrupt controllers is expressed using
> the aspeed,interrupt-ranges property.

Gentle reminder. Can the DT folks please have a look at this so we can
make progress here?

Thanks,

        tglx


