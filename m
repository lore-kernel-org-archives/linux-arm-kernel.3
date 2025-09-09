Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C6DCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9rMoXP/QSewckjQCrhDlmtmRGislqHzoJn2eC5EdZQ=; b=Gcq9tY8jyYRQfxPHTAlnZVZRsb
	HjqF4HYoLBrbCAVuEIZyfbrEWYbn2WG+6AG64Uook24IRjH/ec84pSeIeH7xDtR4A0ZBdmQgTb3ba
	aGnDceu/0RVgwFYavO86F4t7sUtVNe9+8rrh/9PjY5d02PGspOI8mZ9dPZd6H7QJgHwko2+3FjYoE
	ewJbaD3JkOxi58RyjdQbBOhB7ScG3gCXEBVFtOiYt5WtQZm+tj1VpfJqyGtBxrAcinQaK4WKWVZyu
	B7HNk8ImMUG+mRJmJHQooV4uhZVBqi0+LqQ+InN8lN0CPrtuFc5Vp74LsYBZW+b6TOVM27pAUO5th
	LZUHyRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Ri-000000089o5-0LSm;
	Tue, 09 Sep 2025 15:39:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuux-0000000660f-0XdQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:45:40 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757411137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T9rMoXP/QSewckjQCrhDlmtmRGislqHzoJn2eC5EdZQ=;
	b=ncEC6C4M7MYGcs0VyDvSLd33omVS67MIT3m5ZkKIo+MO101yrk6yRna3TBb4mCzLhjLCWm
	2oKicf0VKU5XHVm0LHC8a7XRLBnNIX9yWeWf5PiPiY794tW+ScUevbOL9MJzf+9r8bIvSP
	AgKHe2lNIZU5tHY9/4LZnefGCpKVw3OsyKZSJEixnOFfKFhQ/u8xWN02fA+lZDC7DyfqWi
	PDRVfbP0sEsWqBPzG8FcaTsoC1dwJBH7PZKh5Ozer5E3R/ijX5uCwR8B4TNIuABPVKafyf
	AwdAb/pf17NRiUhDFsg3h0LpAo2/ldpSeM6fciDHlrFEs80i1wKu2l+VF26JDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757411137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T9rMoXP/QSewckjQCrhDlmtmRGislqHzoJn2eC5EdZQ=;
	b=0yAilcN6MbUxoWFzSDsuXfOFuwbjv7OcDJek+tCR08gD6uzz3zYNDYYGl5rZOfbXFmVr/Y
	LSHj9f2fNlkvNvCw==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
 <james.clark@linaro.org>
Subject: Re: [PATCH 14/25] genirq: Update request_percpu_nmi() to take an
 affinity
In-Reply-To: <20250908163127.2462948-15-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
 <20250908163127.2462948-15-maz@kernel.org>
Date: Tue, 09 Sep 2025 11:45:36 +0200
Message-ID: <877by8vu0v.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024539_368403_F9279916 
X-CRM114-Status: UNSURE (   9.32  )
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

On Mon, Sep 08 2025 at 17:31, Marc Zyngier wrote:
> @@ -2564,13 +2566,14 @@ int request_percpu_nmi(unsigned int irq, irq_handler_t handler,
>  	    !irq_supports_nmi(desc))
>  		return -EINVAL;
>  
> -	/* The line cannot already be NMI */
> -	if (irq_is_nmi(desc))
> +	/* The line cannot be NMI already if the new request covers all CPUs */
> +	if (irq_is_nmi(desc) &&
> +	    (!affinity || cpumask_equal(affinity, cpu_possible_mask)))
>  		return -EINVAL;

This check looks odd. What makes sure that the affinities do not
overlap?

Thanks,

        tglx

