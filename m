Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18C8D6260D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1QYvSpFJq+CwTzl06kY5x2Cb2/9OVIPErNJn96LDwg=; b=ximHH1VYoPXZSyUYB1W88tLCv/
	1A4PLaKgMT7d4rjRiwrdMEg5CGI2wD6Iqy6vzwfbN1UwB1rjaxchOm4ObJYe4ivw+JEMRD3F7b9Ad
	kmE15nAnfc+VJVwGrL4lGqGo2OdPeeB1GUsEan4pVBNLEhvQGUBridq9csv9Iiqo52YkOjqhsee8k
	mtBMa3PWF2JxS0/Ka4DaWnMtnJUrjowQxJs8vKo9KO4EQR8fM+bJrZTzWZTU9nMqpG3zCm1/eMqJZ
	JiCbH9lqiz739g/zFjPKnZ2UOsXAhLRoUm8KYd7zfEcG+WGHnte+2me7SpBx6iVohPEPy2Qk48cFL
	0UfNwsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virjT-00000006oNT-04OJ;
	Thu, 22 Jan 2026 10:16:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virjO-00000006oLC-3vJf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29CB343FE7;
	Thu, 22 Jan 2026 10:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E6DC116C6;
	Thu, 22 Jan 2026 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769076962;
	bh=UnI8VlnfOqiebAjN7smnzWiOC/uYQMjCL6S2C/BEoa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDUrfZk0Xz0L6cy1p+/tMeRnBxCxxQZqLqls7r3CB9RMoU/2gqNttU93cDQkxwdQ1
	 8vuQfGDe1C8bTX1sDeQ1hEqGFkYPU1YJy1r2nB4CRUpm21q6XLniDoMY2YiiJB9JS3
	 7h7YHX1WHp1CBfBJfGLS4kWrY8gbieN05QyxPM5BMZgQwxEIWCItR6Et719vFiSz9+
	 /rhm3sig7evYY8e8pfrdo4iG9ydXyEDtMmZJM0+lmC+bda9zap/M6r6o4pTsVsFuCM
	 SoE2bcKbfdYE0l/2h/TJBf90eSTeUHRrVpLsbhPU6P/Pc1sZM3jAF/rvMdxn80zO1F
	 CfuO6rrEl0gfQ==
Date: Thu, 22 Jan 2026 10:15:56 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 3/3] arm64: Unconditionally enable EPAN support
Message-ID: <aXH43Dr-5OrXNOyy@willie-the-truck>
References: <20260107180701.2858276-1-maz@kernel.org>
 <20260107180701.2858276-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107180701.2858276-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_021602_998916_7144A179 
X-CRM114-Status: GOOD (  13.85  )
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

On Wed, Jan 07, 2026 at 06:07:01PM +0000, Marc Zyngier wrote:
> While FEAT_PAN3 is pretty recent, having it permanently enabled costs
> exactly nothing, and does help with exec-only mappings on these fancy
> ARMv9.2 machines that are rumoured to exist.

I'm not sure it's _entirely_ accurate to say this one costs us "exactly
nothing":

> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> index 177c691914f87..13c0fa54ea19f 100644
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@ -19,8 +19,6 @@ cpucap_is_possible(const unsigned int cap)
>  			   "cap must be < ARM64_NCAPS");
>  
>  	switch (cap) {
> -	case ARM64_HAS_EPAN:
> -		return IS_ENABLED(CONFIG_ARM64_EPAN);
>  	case ARM64_SVE:
>  		return IS_ENABLED(CONFIG_ARM64_SVE);
>  	case ARM64_SME:

as this means cpus_have_cap(EPAN) always ends up doing a test_bit(). It's
not exactly expensive, but it feels a little premature when compared to
PAN and LSE so I'll probably just take those changes for now.

Will

