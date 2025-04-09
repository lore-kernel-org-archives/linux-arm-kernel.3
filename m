Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4131C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X63LlIOy8rjdC5bLvYbU2XXDpERzuQXTgv0CKEjSzFI=; b=A77/lBq9WyccD1KABhByx0q3jX
	6UageH0yhrpfEo/MgIb7nFMszTfDLBAEveOgAsWk5mxzouhq9vZMOXfN31FBj664DXWYa+LRKC5KB
	bUvDQx7O6GOnXd8WJjOS2lOALOkjspKHNIPWkeqjQeJRjzH6gh/3P5AAMnMTHZ6vzvkG9Wdg9xU3r
	+80NU7cgtmFFgwSVrX4FYSJcYuxYLtu96/25w1g/dT5BIJ1fhO7JCKRDq79K0p4m16KprOqwB1PFc
	LmayZL7Xtgx7+c/OBmXbyaA87RUGBll0KzbYc7QDBB926be2S5MjZ9NHrk7Szlr6EqqUATv2aeHsk
	AmfQs74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2adS-00000008FMF-48SO;
	Wed, 09 Apr 2025 18:58:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2abg-00000008EzB-2dms
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 18:57:05 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744225023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X63LlIOy8rjdC5bLvYbU2XXDpERzuQXTgv0CKEjSzFI=;
	b=V6l5bphNJl9MFuk5ibsCEsPmLrq26hsIy5D2MbBoNii8P9NKjuzlYHFs8gbDGdFv5+3q5h
	ZUfEH8gbl233r0VNcC4STsyjJmwctYCG9qvBLc0oxIySG44XuUbVkgVEKn3q/7o7TcLsPu
	hELQBlPmpyAHZFLYPoqKre8juUQ/75JRqHmslX3hr3y2K1dGYn0Ct9zuKXRmFrbiR+MGAg
	2qFau1fEfORGcDVh9lEZmIQBM1He/KZzfBBoZNyS2wdtB/nJkyYDh0yiFAuz3fDbehaeS3
	CpZwNyiibTyM4RqvtBlEFLbtu3eUY2hdVJumgKXtqFFGhcUimx4D0hLqfZWHhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744225023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X63LlIOy8rjdC5bLvYbU2XXDpERzuQXTgv0CKEjSzFI=;
	b=qEOZxBUb3z4zRWExCXzuinLodmT3Sn+f0c4t/ZD0OICMa6J/iLia1SPcwa/QGy2qlkL4LY
	C9JMX1w5ogYN9lCQ==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 22/24] irqchip/gic-v5: Add GICv5 ITS support
In-Reply-To: <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
Date: Wed, 09 Apr 2025 20:57:02 +0200
Message-ID: <87jz7ttb7l.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_115704_805934_D8933AD5 
X-CRM114-Status: UNSURE (   7.89  )
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

On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> +	guard(mutex)(&its->dev_alloc_lock);
> +
> +	its_dev = gicv5_its_find_device(its, device_id);
> +	if (IS_ERR(its_dev))
> +		return PTR_ERR(its_dev);
> +
> +	ret = gicv5_its_alloc_eventid(its_dev, nr_irqs, &event_id_base);
> +	if (ret)
> +		return ret;
> +
> +	ret = iommu_dma_prepare_msi(info->desc,
> +				    its->its_trans_phys_base);
> +	if (ret)
> +		goto out_eventid;

As 0-day already complained, guard() and goto does not mix. the simple
solution is to do

foo()
        guard()
        return __foo();

Then you can put the gotos into __foo()

