Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BABCCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pi/t7YkNDmbk/F2qjW7hI53RWpw2lxVXNHcYNrayOdI=; b=ciA1BnDKMns2cx9ipnpSNAIaL+
	ULOgCeSKuTHNDbyn9iwxtlizVN6T/m6wZaHwXDbShvP3DW39Lht4tUUHfsk1tc9aP/pBk+adoVtKR
	oWI8m4dJqNXNJN8/MaIzW+vq8FAEPt/mmz6kAI4BaeVEjIj4PYWzB7Cmvi5eABElxHW003/5C0ZC4
	1HawtNxIQDoZMbxlpQ5F0MCPQmqwdjZ2zf25yOrpivykVGXr21i3uVQITzbVF1NAhdhMypgPqhwMz
	y3bONM0mVKWICYmy+r3Pv3h2mTS5/v0I8O2903+zgzaFWaGV1gON9jeZztz8MB0NxdpWb1MsDupUI
	9Ssu5AAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUVr-00000004NSy-1KEI;
	Thu, 30 Oct 2025 15:24:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUVp-00000004NSL-0LgN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:24:30 +0000
Date: Thu, 30 Oct 2025 16:24:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761837867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pi/t7YkNDmbk/F2qjW7hI53RWpw2lxVXNHcYNrayOdI=;
	b=PKcyx326D3+6GEI9BgzdYGpKGr1M3DTsKJUZUJDpfu+2OYWLb5hosf54uJfao4ZFZ9k1/H
	tS25ImM+z+iwPAK0cBSVCrKbt4LmIwqmGFegjsdDynWaj+U8u3LDrp3nbrO3ZjvY2Ehya4
	snO+unzlBbIteNp3qnKHZdeQuCRPqkDSTbx/VUTkAqRoyqrtiod3uUleQAdsJp/0JMPWOt
	ciEDS6KQDg8t7Wy5Zl4Av35PEPk+3ZGzTZLdAu80a4Nv5TXUUBitdD4JHcGvJm4ERLSnJV
	DCcrKX06JfA3QOnKxCunQ8ArxxJZrr8z6zC36WjwLX4aH3kjBRaXPJ2YS3W0jw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761837867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pi/t7YkNDmbk/F2qjW7hI53RWpw2lxVXNHcYNrayOdI=;
	b=cDdEynsJkm+iNs3BWvcN4anqDWDDygdDuSlxxaxsuCZFAbGofLkfpGrpQM9/5Tab2UGHkR
	V7ueWyLJUTmYZPAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 3/5] ARM: Disable FAST_GUP on PREEMPT_RT if HIGHPTE is
 also enabled.
Message-ID: <20251030152425.TXa7Vocb@linutronix.de>
References: <20251029155918.503060-1-bigeasy@linutronix.de>
 <20251029155918.503060-4-bigeasy@linutronix.de>
 <324652fe-b5b8-45a6-9c57-096813e9092c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <324652fe-b5b8-45a6-9c57-096813e9092c@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_082429_260374_B5D5A8F2 
X-CRM114-Status: GOOD (  10.38  )
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

On 2025-10-30 16:15:42 [+0100], Arnd Bergmann wrote:
> On Wed, Oct 29, 2025, at 16:59, Sebastian Andrzej Siewior wrote:
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -105,7 +105,7 @@ config ARM
> >  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> >  	select HAVE_EFFICIENT_UNALIGNED_ACCESS if (CPU_V6 || CPU_V6K || CPU_V7) && MMU
> >  	select HAVE_EXIT_THREAD
> > -	select HAVE_GUP_FAST if ARM_LPAE
> > +	select HAVE_GUP_FAST if ARM_LPAE && !(PREEMPT_RT && HIGHPTE)
> >  	select HAVE_FUNCTION_ERROR_INJECTION
> >  	select HAVE_FUNCTION_GRAPH_TRACER
> >  	select HAVE_FUNCTION_GRAPH_FREGS
> 
> I would still prefer the version I posted previous at
> 
> https://lore.kernel.org/all/20241210160556.2341497-3-arnd@kernel.org/
> 
> disabling HIGHPTE when PREEMPT_RT is enabled.

I did remember that we shifted something I just wasn't sure what it was.
I will update for v2.

>      Arnd

Sebastian

