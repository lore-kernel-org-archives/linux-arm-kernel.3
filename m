Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C139AC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNXHKgY/p/PBj8nWmVezncK3qsEuUPE+7qreXPSODDI=; b=MZ8MvjJB2e+aB62WE7I98PF+7y
	n6pOd1NTjUKoDfGE6qY0BVA+l6IHHHWUQM41BgYJaYMY49XAKde3i+bGYdQhnOHdta1Rm1qx9RLwh
	lAfcAC2grHMpTCW9GhyZWXaoymJhsIJci2Tdtxrxa327EYVoBiNEzIgvsoHrT0H7mGz3uPGnpIz5H
	3e1yY7FI5OoC9+ZTE0FQ2nClWNO5++Nsr9r6sCzAegXCUigvLZdgDgdbH1TXCGjgqUWYFbdyDLob3
	d+m32unLDa+IMTe/j/Fok+jsoUjeBdBp+GCYcTka2QHJmJyvvHExKtIo4IpWoujBYMpUcGryHw7mp
	Np3Vd5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsU1-000000039lG-0B7c;
	Fri, 16 May 2025 10:40:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsQH-000000039It-0ZNp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 10:36:15 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747391769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FNXHKgY/p/PBj8nWmVezncK3qsEuUPE+7qreXPSODDI=;
	b=1RLxPr1Q9YViq4P+Jja3DlqdCVwBVmWrMrNcUPXvUM4KIlrHHK35QAQKQmJ+GMSHh17VD4
	JdB0bNnjpgEO4rPTed52PZWfl/IjnniVQMUmZ0jMLj7b0f+eK/SUvhs3RCdxdBGIbkJECX
	fHAv6ttd9E9MPHKU/BkNXnRX1bAF8rg8YRZXAZL7NHm2UhmhQe9PLUD0ZmgyviJorKbEsx
	/RLCosFge+POjP2rFVlevwcREJ7zypSc31JDoV6OTuBui7LUMjVdJeJKCp7I2htFire8gX
	agjaLYLAfVoAGIjD7tWFHS9m/xDCXAD3Z71oC/XsIbWvOKttr+gOntew0viVRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747391769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FNXHKgY/p/PBj8nWmVezncK3qsEuUPE+7qreXPSODDI=;
	b=0oLKTdzYeoyAQaupzKJHMQaqCATV4QiFRcxE/YtfoE7dRBBu+UjOGl26a4IIutckivtwUL
	x+oxx97OFqNxVrDg==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Toan Le <toan@os.amperecomputing.com>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 3/9] irqchip/gic: Convert to
 msi_create_parent_irq_domain() helper
In-Reply-To: <20250513172819.2216709-4-maz@kernel.org>
References: <20250513172819.2216709-1-maz@kernel.org>
 <20250513172819.2216709-4-maz@kernel.org>
Date: Fri, 16 May 2025 12:36:07 +0200
Message-ID: <87h61kj10o.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_033613_311055_29C0B860 
X-CRM114-Status: UNSURE (   8.92  )
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

On Tue, May 13 2025 at 18:28, Marc Zyngier wrote:
>  	if (!v2m)
>  		return 0;
>  
> -	inner_domain = irq_domain_create_hierarchy(parent, 0, 0, v2m->fwnode,
> -						   &gicv2m_domain_ops, v2m);
> +	inner_domain = msi_create_parent_irq_domain(&(struct irq_domain_info){
> +			.fwnode		= v2m->fwnode,
> +			.ops		= &gicv2m_domain_ops,
> +			.host_data	= v2m,
> +			.parent		= parent,
> +		}, &gicv2m_msi_parent_ops);
> +

This really makes my eyes bleed. 

 	if (!v2m)
 		return 0;
 
-	inner_domain = irq_domain_create_hierarchy(parent, 0, 0, v2m->fwnode,
-						   &gicv2m_domain_ops, v2m);
+	struct irq_domain_info info = {
+		.fwnode		= v2m->fwnode,
+		.ops		= &gicv2m_domain_ops,
+		.host_data	= v2m,
+		.parent		= parent,
+	};
+
+	inner_domain = msi_create_parent_irq_domain(&info, &gicv2m_msi_parent_ops);

That's too readable, right?

No need to resend, I just hacked up a few lines of coccinelle script to
eliminate this offense.

Thanks,

        tglx

