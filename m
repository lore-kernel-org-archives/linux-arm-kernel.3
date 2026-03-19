Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34D71090240
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pX8AWi3+fAkBpCvrvefx9HGhVqqVpnvrhHpID+luKag=; b=1eokEAHrGM50XoMBj8SNv8sDSq
	5xfmrlBcWVgsRcCmTfv4Y6aWU9YAEuijGRlq+WYYRMj8aO2bV2vi09r+UDPkT3M4Ym7toUJC1cs5F
	iYo+vM+ca+1gl8hXaV93Gv8kMBI4Cf7XrQMvAUCnntSZb/L+jU1MZvJb+clYAhYVjY7kB7ud2Eh5i
	HsT5Lus30wZ7cUN/6XEaeYzp9p+XjY7GexGS9m+mxSx1C/JE7oTgFXWd1kK+AJtjPFP0L7XvIuRUb
	tIzD3aq8mliSuWVEV2UlNv7+V4hlWchU+yzfVJW93IGU8HdzriCUt6gkb9s/WggWl8+FxZzs5EypZ
	eCuQ/Lzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FRF-0000000AvXu-0QmH;
	Thu, 19 Mar 2026 15:37:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FRC-0000000AvXI-2QDp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:37:31 +0000
Date: Thu, 19 Mar 2026 16:37:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773934645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pX8AWi3+fAkBpCvrvefx9HGhVqqVpnvrhHpID+luKag=;
	b=kOZk19s1v2DEUr0b3Z8YeKeFLvJkX5pi1vT3c4JceWhd3Qz2EdAmR/IPTTQ4IhvCjH5VyV
	x6AZleKCWh76JCiuzTZvHsDMuF4b7u770GTvKLcVh594mbwV8wbEEi+u8RERk5Tz/uuCzb
	w7zaYlvW5R4zMh7BBkyQuOqOMIl93UqWtSmERjQtazJSazewftrCt82xsnSyd6NoBFc/o3
	8ubiXMA3tmZrghON2x/1s1wml0TfSd7GpRxfEgeB1PfB0AK3W+tYPzTlZuvunswn7YUWCd
	qG9s71m5sUTn2vT7/R4okc8EFf0WC5hy63jEWeFpqEbYO81lMaBO6aqdx1Cy8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773934645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pX8AWi3+fAkBpCvrvefx9HGhVqqVpnvrhHpID+luKag=;
	b=knSRbQsHw49orwgVo+tZK3OebtUmiMv8RvvGqbQ9DPLYxHh7gYiD/ePbV0mqauiiIMdt9D
	OxuwvxflbyArFRDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 0/6] ARM: cleanup fault handling
Message-ID: <20260319153724.Aqs8brxQ@linutronix.de>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
 <20260302105735.Roqcqp6h@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302105735.Roqcqp6h@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_083730_762260_414DF34B 
X-CRM114-Status: GOOD (  12.76  )
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

On 2026-03-02 11:57:37 [+0100], To Russell King (Oracle) wrote:
> On 2026-02-27 15:18:26 [+0000], Russell King (Oracle) wrote:
> > Hi,
> Hi,
Hi Russell,

> > This series cleans up the 32-bit ARM fault handling:
> > 
> > 1. ensure a consistent IRQ state in the user fault processing path.
> > 2. split vmalloc fault processing in a similar way to x86
> > 3. move is_..._fault() to the local fault.h header file
> > 4. update the FSR deifnitions using BIT() and GENMASK()
> > 5. move LPAE/non-LPAE specific FSR bits/masks along side users
> > 6. get rid of #ifdefs within is_..._fault() by providing a LPAE
> >    and non-LPAE versions.
> 
> Thank you Russell. With this series (notably #1) the PREEMPT_RT support
> can be enabled. Would you mind adding "ARM: Allow to enable RT" from
> 	https://lore.kernel.org/all/20260226111742.3598421-3-bigeasy@linutronix.de/
> 
> to the series/ merge it with it? Or should I just send it to your patch
> system?

Russell, any suggestion how to move on here?

Sebastian

