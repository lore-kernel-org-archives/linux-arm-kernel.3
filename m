Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C20CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 10:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cRgp7Kc3/ev10BqeC/Hyj5uuQ9SERtntEd44mPwyR0=; b=KSGaVQ3G6zWSS6yAa3JkbOJVO+
	ScC4d/f5RxYHxQkGt9NpoSr7exCUpeteLxOaKI5d8OdhVylNKpr4zvA4fI3itl1Y1rTAgqZwBvs7D
	+sTJXijGCXVLwBObcdSESTOygCyEJee7TBmDGTYToSDGhE07fUWkBPmTdACMs45rVEIbstgRka5dN
	TDcv06XXGo908wBEN5ueBRJI5TGm6+l9nUeNunipHIxA9Anm/y1G11KX5W2W43wIBy5iIadvZv9Nf
	z7s8XTvvCDSiGR7DVkUFHicVeOhnSA9228yPmzcrTt71qGXOHgaOTts4LJH59q3Ccqfpmz7Wn/OMH
	vTb847/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9e0-0000000131n-2xYn;
	Thu, 18 Jun 2026 10:06:44 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9dy-0000000131D-2V0o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 10:06:43 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-69170548d0eso1079595a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 03:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781777200; x=1782382000; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1cRgp7Kc3/ev10BqeC/Hyj5uuQ9SERtntEd44mPwyR0=;
        b=aL59XDcOMm9L9YFE6GvxygFmyO9HLveY0H9AC6rAETc3xpGHCQU2wATJRUg2K4QVRq
         msD2VySqW41t27M36sNwSvD/b2L/vOYU+jJJfdQYY8z675rhA6/k2Cpraw92B669Fu6I
         lJjaczWGnZSxGhBnh/aniKk0IUG2wpsUdEgvyYPXu5wUGrxAyT10fnsv+QCJ7MweH4QW
         qDvcE2coXTN+DNxkgjFqnJ/2r/msvoN3gPDy8NUK5OzBH2bBOi6kUiJOtHbXDHUbJQPm
         olT5fxzhYkJJjQoG4eIB2osNfgcRe/tOc9MIZG+K+xodOhR7hmu781Uaq5xJMvTvc6UB
         4JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781777200; x=1782382000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cRgp7Kc3/ev10BqeC/Hyj5uuQ9SERtntEd44mPwyR0=;
        b=GN6SPvgZNySWlJQEoT3kQ/jJ2xKi8v2i0fpa6M/7J1QOAQWUHKVbkwRjQdT+8Bd+5K
         Ehn7o6oJ4TOuW4Z1xxdp3wyGn3IcY0RbnPlwgesRBBsvjzVW7EtHJK7XMsFKdXHUTZ9A
         STcwcTuGZdb+fxCHBZMP8CUZYnyUzBMPc39GZabBmsaro9P95VaApxHrhlNRnwDFQvIr
         OIiRxlRv9IEeLAdobApWU/iWyCQEYSs3k+P1ce/IYx5bIPG+3dyVbvQzd22o5UPjM+EZ
         s8jWt2J4kr9PKKQ/625R6rLIShPite0rS7VxMsi/rN0HWqO1JCro/ey7dV4TlcNTSHRd
         xoUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+r5eM+ieliKCJSS1GsN5t4ksaP+9ZR6pSVYr1WTc2eWhKd2+W7UyymUHs4Sy1oNpOZWLcaRsIGWaZhdmX5HJff@lists.infradead.org
X-Gm-Message-State: AOJu0YxB7tyhilMiOj3YkrSM/JPZMWdW3Ga3uyAAx+RBUYncon6YvAkc
	v3AdxGHzprjVQZFHY8nxqp77GJcwymTR+K7qe6rrXIqyntBv235EEhaojIXvDi4Z3w==
X-Gm-Gg: AfdE7cmJ3MfQRUwkDyULXAl2tyCut+f3/EJdJKSP62dynu76goAPJb4dN1qjpSpwYlx
	ZL496wweLkDrB9NIZx6VyvKx9qbD34hyeXAOUL9AaDrCg3iTGM+wO7DLyK+nurhMTDgCTUDkHBq
	7qHyoltKFsTcwCie0DOIUlJeCe6dYKJio4nq8cZs1RxVSypeKuXovR6XqJRWaLcyqLrVni0sqhE
	7wlYgJ5oOMbgdHHZ8QBqBVEV5sp5Z1l1bEdfVWPrJkN3gWP+fRavroSXsHZShpgVFVagaDGkgC6
	LRPkgA75otPICJfRb01wFbxLE5QhnlwmvNfysKEoX0VNJdXaOEgX14olrUByt2NS4jvUBFDRu5q
	v0PUe5PHAGKV2oLuvSYNOF4Ikb9vZ28DctLywf7bLHj7RPyGeP5tt9valWYJAZa0hWnHBskKdSB
	omJu+Vd3SQv9YCZ4nX4TkWeoTXpmvket/xtWi9nI2+PNv6
X-Received: by 2002:a05:6402:348b:b0:68e:4c0:f5b1 with SMTP id 4fb4d7f45d1cf-695bb1abd61mr1501371a12.2.1781777199202;
        Thu, 18 Jun 2026 03:06:39 -0700 (PDT)
Received: from google.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937949bcbfsm7548192a12.24.2026.06.18.03.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:06:38 -0700 (PDT)
Date: Thu, 18 Jun 2026 10:06:33 +0000
From: Keir Fraser <keirf@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] KVM: arm64: pKVM is_created cleanup
Message-ID: <ajPDKYHxnletCV9s@google.com>
References: <20260618090128.3913688-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618090128.3913688-1-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_030642_653761_104AF550 
X-CRM114-Status: GOOD (  15.81  )
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

On Thu, Jun 18, 2026 at 10:01:25AM +0100, Fuad Tabba wrote:
> This small series tidies up the host-side kvm->arch.pkvm.is_created flag,
> which tracks whether the hypervisor-side (EL2) VM has been instantiated.
> 
> It comes out of the ongoing pKVM (protected KVM) upstreaming work and runs
> in parallel with it. The changes only remove dead or redundant code around
> the flag, not any of the functional paths that work touches, so there is no
> dependency in either direction and the two can be applied in any order.
> 
> is_created stays: the pKVM handle is reserved early (so host MMU-notifier
> TLB invalidations have a valid handle before the first vCPU run), so a
> non-zero handle no longer implies the EL2 VM exists. is_created is what
> distinguishes "reserved" from "created", and the teardown path relies on it.
> Only the cruft around it goes.

For the whole series: Reviewed-by: Keir Fraser <keirf@google.com>

> Cheers,
> /fuad
> 
> Fuad Tabba (3):
>   KVM: arm64: Drop the unused EL2-side is_created write
>   KVM: arm64: Remove unreachable early checks in pkvm_init_host_vm()
>   KVM: arm64: Drop redundant READ_ONCE() in pkvm_hyp_vm_is_created()
> 
>  arch/arm64/kvm/hyp/nvhe/pkvm.c |  1 -
>  arch/arm64/kvm/pkvm.c          | 13 +++++--------
>  2 files changed, 5 insertions(+), 9 deletions(-)
> 
> -- 
> 2.54.0.1189.g8c84645362-goog
> 

