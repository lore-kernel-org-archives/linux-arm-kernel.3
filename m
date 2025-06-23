Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6020CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6DcYddt5wym2Xskxe6KfcsdaZsVhnmiyQICeoOHbM8=; b=HrolP/NsAY30ZCLm0BCODiNPxk
	ga4MuIo9RTEAwc8zaM0Rq+kTZbolhepv1mpe5ISlPootzMaPBwuWZFvKUcNzsAvXvGY5aaVPFB0aV
	W3XB2UHztfcYAxYkVxDJQlhm3BClr75u0Al3xOTUhKmqlfIaOVRQvIxvwHD8Ym8DWIV9B8jGtE6NA
	pCx0IEOi2htizXNYSicqkD3G0AG4SznNS1bpHzn8wIcbM0xVJgE0UTWacaL8HuKCHR23vPPZzCq2C
	4EzPGAWE6oKbHN/autQ3x5HMoHcQ9Mw4xLkhMdUDW84aIXzP9jF4JVLaXZh1lU9ZEclrfel62qQJz
	ZpxlAnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrag-00000004GpP-0Blj;
	Tue, 24 Jun 2025 00:32:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTmTR-00000003lxn-3RFj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 19:04:59 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750705495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6DcYddt5wym2Xskxe6KfcsdaZsVhnmiyQICeoOHbM8=;
	b=Wq8P8oSOSnrEFmyK5tBA94+ro+F6vK1BDqjUoE2cyXQ7+BV/JEjWO58VVuAZ1TfKjH+64f
	WqMXCGXHSNX07tPREailSfueUDYo2DFKi5TrXV1mokTpLI+TnIybDSvX3Zg6RMMhvqPfaC
	9X0mPgCp0A74LFynqgJE9znnOlfXksasKZfK4BOi5Higm6dCMf7kj3KvYJrxjsfeDueYAV
	LSs8H2jtQYcdk9VPUaDlP3cm5DT6EgWEq0xhz0uHXSzszsZx+JgilzK4NQ6XP5RqlsPMH1
	DpyBg6RJKWxlRJUD32Rz6uK5YHRWPKhJFvOBNZlTL/ggRfmRqEMCh0ikudVXsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750705495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6DcYddt5wym2Xskxe6KfcsdaZsVhnmiyQICeoOHbM8=;
	b=bJ3uGDEsaB26JP9V7UX1Jlx1g4wZEoUxaRVea7vzQCcQzJlekZks5lMZkgtZUr16gahBgA
	SNi+iyrrJuUoCwBQ==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Timothy Hayes
 <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Peter Maydell
 <peter.maydell@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Jiri
 Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v5 24/27] irqchip/gic-v5: Add GICv5 ITS support
In-Reply-To: <aFkd0cigSKOSqUQI@lpieralisi>
References: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
 <20250618-gicv5-host-v5-24-d9e622ac5539@kernel.org> <87y0tmp6gn.ffs@tglx>
 <aFkd0cigSKOSqUQI@lpieralisi>
Date: Mon, 23 Jun 2025 21:04:54 +0200
Message-ID: <87ms9ynusp.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_120458_002033_A74E83B0 
X-CRM114-Status: GOOD (  19.02  )
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

On Mon, Jun 23 2025 at 11:26, Lorenzo Pieralisi wrote:
> On Fri, Jun 20, 2025 at 09:18:32PM +0200, Thomas Gleixner wrote:
>> Just add a MSI flag and set it in parent_ops::required_flags and extend
>
> I added that but it does not work (not if we use d->flags as below), it works
> if I add it as an
>
> IRQ_DOMAIN_FLAG_*
>
> and set it in irq_domain_info in the msi_create_parent_irq_domain()
> call in the GICv5 ITS driver when creating the domain.
>
>> the lib with
>> 
>>         struct fwnode_handle *fwh;
>> 
>>         fwh = d->flags & MAGIC ? fwnode_get_parent(fwspec->fwnode) : fwspec->fwnode;
>
> Here we are using the domain flags and I think that's what we want.
>
> If I go with parent_ops flag, I believe here we need to use the parent
> msi_domain_info::flags - I don't think that's what we want.
>
> It is a property of the IRQ domain so I think that adding an
>
> IRQ_DOMAIN_FLAG_FWNODE_PARENT
>
> is the best option.
>
> Please let me know.

Obviously. Doh :)

