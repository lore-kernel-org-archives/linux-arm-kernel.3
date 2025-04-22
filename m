Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5864C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khCnrYtXFJ9lttnDquf+t6ap+7zewLGSeJLb1TKx5Nc=; b=QusCeY5JtjbjZdfGsg5hyF704y
	vaj4v8J8+n8g+KkQcVRKegdLdEGshI2dDuj5onU/iunQ++srZghVPHvPZgcVQ0C/KlwiPR6KONz/x
	tD1QLzSSI/1kQFbMR3lpJ2fhKQRiL/R5/UpeOCAifA45HBg7y0ju4sPY/B4uaMQsl3o0mPp/zpdu7
	O3rwExnH6tq26806/35XlV4K0bhoFqaloe/TQ6jJVLm9cA8rtvVUzbdMeFG/TOW6XXE+P1x1r3qMV
	j6cW59g7SVXsJGuzyl9896Rd7LrXWIoMi03F4ipwNDsAEwd9VaFA/vCs0JJfvxsAzacfGzbmwNe7o
	ed98BCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jb4-00000008MW6-3g5A;
	Tue, 22 Apr 2025 19:47:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7HkR-000000083T4-0VjW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 17:49:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4EC1AA44625;
	Tue, 22 Apr 2025 17:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A13EC4CEE9;
	Tue, 22 Apr 2025 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745344170;
	bh=NMUrajeGaevk9etR13v+Zo0jMwWofA3IhBlD3NT/Bow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DDHtQWjSQTxmMHgS3ri1MQSyvjg61Egx4BhiC1VwdoRitk5GEOHPa/2KkpYSWFYbW
	 QoJuCcmAYrtToxX8CYvWKtjJJ9SE3lH08QQQdU0VURSnEjhJmLm+c4O3u5GndJbYle
	 ZAsz+XFa2VqkPPVYyLyXt/LGQB5caYC2STVCUzECoRUWVsqMdHeYEfdECSEFWq8WDT
	 b0zOYmlfaSSlsbW8wsw9SK3PEjv/3PpGqYT+nuo68MR1Kbp1a78qdWDCALzVWsUnI0
	 cuCmGa3aqrg4y0zJ9P1DbmhOQ0FD7IcEIfIuwnyuTZuYlHuVxLAD/zWBzJZYzswu1k
	 RG37+XA8DK1Dw==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u7HkN-007ihb-Jq;
	Tue, 22 Apr 2025 18:49:27 +0100
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 18:49:27 +0100
From: Marc Zyngier <maz@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne
 Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, Sven Peter
 <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 07/13] PCI: apple: Move away from INTMSK{SET,CLR} for
 INTx and private interrupts
In-Reply-To: <20250422174156.GA344533@bhelgaas>
References: <20250422174156.GA344533@bhelgaas>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <739728922cbf097aa87dc41265478dfc@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: helgaas@kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, mark.kettenis@xs4all.nl
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_104931_292799_1889024D 
X-CRM114-Status: GOOD (  14.32  )
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

On 2025-04-22 18:41, Bjorn Helgaas wrote:
> On Tue, Apr 01, 2025 at 10:17:07AM +0100, Marc Zyngier wrote:
>> T602x seems to have dropped the rather useful SET/CLR accessors
>> to the masking register.
>> 
>> Instead, let's use the mask register directly, and wrap it with
>> a brand new spinlock. No, this isn't moving in the right direction.
> 
>> @@ -261,14 +262,16 @@ static void apple_port_irq_mask(struct irq_data 
>> *data)
>>  {
>>  	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
>> 
>> -	writel_relaxed(BIT(data->hwirq), port->base + PORT_INTMSKSET);
>> +	guard(raw_spinlock_irqsave)(&port->lock);
>> +	rmw_set(BIT(data->hwirq), port->base + PORT_INTMSK);
> 
> sparse v0.6.4-39-gce1a6720 complains about this (and similar usage
> elsewhere):
> 
>   $ make C=2 drivers/pci/
>   drivers/pci/controller/pcie-apple.c:311:13: warning: context
> imbalance in 'apple_port_irq_mask' - wrong count at exit
>   drivers/pci/controller/pcie-apple.c:319:13: warning: context
> imbalance in 'apple_port_irq_unmask' - wrong count at exit
> 
> But I guess we just have to live with this for now until somebody
> makes sparse smarter:
> 
> https://lore.kernel.org/linux-sparse/CAHk-=wiVDZejo_1BhOaR33qb=pny7sWnYtP4JUbRTXkXCkW6jA@mail.gmail.com/
> 
> Nothing to do, just "huh".

Huh indeed. Pretty sad to see a useful piece of tooling being left
on the curb.

GSoC project?

         M.
-- 
Jazz is not dead. It just smells funny...

