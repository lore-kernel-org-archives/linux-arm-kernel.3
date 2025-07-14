Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41ACC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 21:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdQ7wO/JRGgWx4qUXQxXpyLZ2vVfBTl337MYXCiXXn4=; b=PDuqw1lQHZZyRlNfMhjPBRigfN
	7gvVoSMTfjbQUevvaxwhVIwRmDKGHyeDcehTXQwBfoQxSHF99snWuYTQTV1Pu3igKxd+rdpPS52d4
	flCfTFo0FrZqqnjMOyMJgTTMMAC0d3ECEpuhbjEqTG2G+IPpduIok9qGj/7klIiR5PiWm7qKPtjtu
	PUCZQg0Q+5ajvofIJQiFhx3XLPFUEIxw7l4kG030zr9Cguzo36MpTQusnkJaGjqy3bcLFxKBVmAUu
	gSJ7g75+I5hBQLpviSK6WOCrNucEfMr0z3c8FyaJP7F4MRjT9OyafjKU+3P6Yp93jTXJo7Cc7PAEO
	6YVixoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQnO-00000003JhD-2TMy;
	Mon, 14 Jul 2025 21:33:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQkx-00000003JaS-1sRY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 21:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7B71A573EF;
	Mon, 14 Jul 2025 21:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6178C4CEED;
	Mon, 14 Jul 2025 21:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752528637;
	bh=aVMDG6JzIpk4Eo+Pl5FCirxkYzovLZhgl/i7XFV8zEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fv8PUTR1NHH8rdlrIjssAdpWfw5mwtJ5DNRFbgoL21MHikLHTctDgj9m0l+s1TTfJ
	 3BVuVhpqRyhET2DfZzstugtlJYK+gTnoH0jlrdmr4aw+TXw8qUcvWxXdhdtzuVqADS
	 gAAIaJdjfQj8CBTI2HWzg77kqTUNtE3t2Jyq8cFjOcq1zWCXB3OFqr1/XpErYaA9xZ
	 iccXCBDDcU1nFwRBlALl/HO7lhlehm3BVg9R+f5dEVGTatn44j2PCIhstp2YGdFgtV
	 w5VUxZHUlkklM4rw6xqa4wDxGZEMEqYc9FFQL0F36x7Q4fhf63uOmQbpJGBi8jIXuU
	 7x4FxFWjww8SQ==
Date: Mon, 14 Jul 2025 23:30:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: aspeed: change debug level in irq handler
Message-ID: <bhgxk2qopxguthrismqwif4d7xiqals7kwqq2nxvioxr7wriib@b5ee654pfxnm>
References: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_143039_556118_3E929252 
X-CRM114-Status: GOOD (  15.74  )
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

Hi Jian,

On Wed, Jun 18, 2025 at 06:21:48PM +0800, Jian Zhang wrote:
> In interrupt context, using dev_err() can potentially cause latency
> or affect system responsiveness due to printing to console.
> 
> In our scenario, under certain conditions, i2c1 repeatedly printed
> "irq handled != irq. expected ..." around 20 times within 1 second.
> Each dev_err() log introduced approximately 10ms of blocking time,
> which delayed the handling of other interrupts — for example, i2c2.
> 
> At the time, i2c2 was performing a PMBus firmware upgrade. The
> target device on i2c2 was time-sensitive, and the upgrade protocol
> was non-retryable. As a result, the delay caused by frequent error
> logging led to a timeout and ultimately a failed firmware upgrade.
> 
> Frequent error printing in interrupt context can be dangerous,
> as it introduces latency and interferes with time-critical tasks.
> This patch changes the log level from dev_err() to dev_dbg() to
> reduce potential impact.

this change doesn't fix any issue. This might improve it in your
system because maybe your printing level does not include debug
messages. But if you increase the printing level you would
immediately fall into this same issue.

...

> @@ -665,7 +665,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  
>  	irq_remaining &= ~irq_handled;
>  	if (irq_remaining)
> -		dev_err(bus->dev,
> +		dev_dbg(bus->dev,
>  			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>  			irq_received, irq_handled);

I agree that this is excessive logging and in my opinion you can
completely remove this line. But what other error are you
hitting?

Andi

>  
> -- 
> 2.47.0
> 

