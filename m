Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBEC105F797
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Treo8+ILHQ1M2ArKnaNpioch/szegt3Svu0aZTIh4xM=; b=OPezHpa8f8ViOcb2Q3OPc+2iHf
	atzH2bfVrxf7fJrvCTES/jbIvjhlohSsng9rDrw+Kivc7jU5p937SYeGz0chU6KPPKHk3oJGvmlbL
	FvnKXd7MthAcjGIlrt/Yrh98/EmeN26gcBtsLZV60+WZCUiEAQT+b8WkGZVZMT7CCjAaSIbSyQcn3
	iF/die1JVeLrFZMKAwQqplRWMceouZ6tCvvAVKR+JueLoDj8ICgb4X/fxkhhdqahHI3XoDyXNbnHQ
	j+ZiZHzom3FA21oiwPce+HdIVlinRbKQNf0u9TIk5AAn3NcEX1ydPcKHkOxqDDiJdORbLPL4MLTnb
	o5BvMAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Mr-0000000HZYI-36P8;
	Fri, 13 Mar 2026 11:07:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Mp-0000000HZXx-0GJq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:07:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so17031175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773400060; x=1774004860; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Treo8+ILHQ1M2ArKnaNpioch/szegt3Svu0aZTIh4xM=;
        b=C9cq1bWLZppg9vEceGgnhqAOfWiTC0CeE772G/vVIp0JBVLCU3VeQTNRZYO4s1Y2R2
         tZzWSiYea9hMWuBC+JDKlUKyg1LsnfoRyGjB2hJhOE3Ci31ZDGqiL+wYk9eXFo5wpW9i
         VVsVccN3I1oIaUpGVO7mfUGyMZ0m0QfaES5142pySIm3fvGvFOGoby5VeWyPbuAXPG5S
         J481e3TDbmlcmno2k5h/krPirqksRBuCiDak16/qgww+OL/8qPO3JbcCGrBexx7nzuFr
         sb67D32aPmA3z2VGjFDZsjD4iF6DDBbFV1ZwjupZuDI1dsIOgHLnWGgivyn9Tbxs0gdB
         Rgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773400060; x=1774004860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Treo8+ILHQ1M2ArKnaNpioch/szegt3Svu0aZTIh4xM=;
        b=Lx+2f5XVsCJ3zFYA1So4/RAB151Z6+Zz+VI8ALpfyHJbTw106NlYHxgUPVICAr3dR4
         U4p9Xt3k3+qbgUysPms2MxmPVEr2cyeFjOwHrmPA7MCM3LtNx2FHVizag24WwLBPsIZH
         HMj4sQwnXA8jWouUxsntT/yZWYpL5IHleRWYy2l1wJJMvJX+qPvkIus2GIkhQcMJaChC
         jjrkdmUw8a1mRWgWVt+yIX0rDi+MRsWLGSEowI/j+3rhtrj4rJwMD5AWJvPuUMNS7bg9
         AKHNXACgJbp1CRZ+8WOAhbSJS2fFw1LLzOQJROiFQ/5iS7naR1Lzf6Ec6LHQivpebFkP
         4JcA==
X-Forwarded-Encrypted: i=1; AJvYcCXaarezV61nnGjJVqO77Y8luZH8ls6atFLqTBl5gdFJpoRBkFI5g5rJ4u5YZ5bTOLvDICSsy/VDk6DwOKfVNOUv@lists.infradead.org
X-Gm-Message-State: AOJu0YyzBSilikASKKAOnoercC4C5smGCnSJ41m2kIEy7eKKdVE9eZXN
	k5tKw4zpX2f6e7QJyyn/45TSSUp1Yv7BPFE0e/lwLkCiVsmh8gHkTuMMc50Fftds4w==
X-Gm-Gg: ATEYQzxLnaOg/UXSOzVqUC7y2h1sLaJqEDhDzScLMwpwoRNV8D32qz2ULrkrhq+5fPe
	s0aHDot9V5yF37tFuHcfHvsvakEl2X6EC/+KFHyeWBvLEGs5zQXouDU06vCwXDlJvrsp1pEjdXg
	81gxn2LJgvPBm5FH/ebnl50wncc1KH60h9C8+2a2oWaFkj7qYqu6saxXBHQ0TIR3BsKYI0bMiDm
	UvU9dye8EbaYlEGuLJcWM1YUHfkNGiwnLBNH+w5iu7+qEkkRXUsKXjZBpZMmvuiS64C1RV5LkUo
	0bOeIRG9SocVuM3KnD+41Datbgh6jsX9YSH0yEfnQuRa1aCQ5YZ5IlPEQfxjSNfzFX2ebhyUZL4
	Swol825lu1vna6Vf87l+Ja/WeJmG7xI1qg1C5LJz9Zr1QHjds/fLWc1HjDQL7vATSR4HfxPE2M+
	LU/oXkz/hIpEItqH9Zf8l/4xccz+oGPE9p5dEXVit0p3jzyFKg8nFYgDxNsU7ThPX4dWs=
X-Received: by 2002:a05:600c:a09:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-485566e1a4cmr47428785e9.14.1773400059656;
        Fri, 13 Mar 2026 04:07:39 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6ece3sm18109795e9.29.2026.03.13.04.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 04:07:39 -0700 (PDT)
Date: Fri, 13 Mar 2026 11:07:35 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: avoid unused-variable warning
Message-ID: <abPv9_8F38yEiAQ9@google.com>
References: <20260313094925.3749287-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313094925.3749287-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_040743_169554_F4382CDC 
X-CRM114-Status: GOOD (  20.13  )
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

On Fri, Mar 13, 2026 at 10:49:16AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The 'cpu' variable is only used inside of an #ifdef block and causes
> a warning if there is no user:
> 
> arch/arm64/kvm/hyp_trace.c: In function 'kvm_hyp_trace_init':
> arch/arm64/kvm/hyp_trace.c:422:13: error: unused variable 'cpu' [-Werror=unused-variable]
>   422 |         int cpu;
>       |             ^~~
> 
> Change the #ifdef to an equivalent IS_ENABLED() check to avoid
> the warning.
> 
> Fixes: b22888917fa4 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/kvm/hyp_trace.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> index c1e28f6581ab..8b7f2bf2fba8 100644
> --- a/arch/arm64/kvm/hyp_trace.c
> +++ b/arch/arm64/kvm/hyp_trace.c
> @@ -424,17 +424,16 @@ int __init kvm_hyp_trace_init(void)
>  	if (is_kernel_in_hyp_mode())
>  		return 0;
>  
> -#ifdef CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND
>  	for_each_possible_cpu(cpu) {
>  		const struct arch_timer_erratum_workaround *wa =
>  			per_cpu(timer_unstable_counter_workaround, cpu);
>  
> -		if (wa && wa->read_cntvct_el0) {
> +		if (IS_ENABLED(CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND) &&
> +		    wa && wa->read_cntvct_el0) {
>  			pr_warn("hyp trace can't handle CNTVCT workaround '%s'\n", wa->desc);
>  			return -EOPNOTSUPP;
>  		}
>  	}
> -#endif
>  
>  	hyp_trace_init_events();

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

>  
> -- 
> 2.39.5
> 

