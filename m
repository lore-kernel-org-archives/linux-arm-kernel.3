Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65B5C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TF2FBSAbA99rTI7hgd6XJ5POJVbB9v0L/f44ZOGfZAY=; b=qUXPYYIZverfO7BxSzxVzFuDoo
	6hI2NlegtI/9TTlyfyuY8z+iBCp+9F2BDRnWIEjNhpZJi9hvW5/9Dii6HqE7RnAtEiRXEP6aTZP2N
	4acmI5qGuHU5VO8/Bpd/96VQzIy6yjQ+34hjWMlbApile82qiZVuh/C3Su5cLmgCePT7SLc6fNh2H
	sVaNvDtWNzhLS4vStoJzfih2p0Eqpz77ta1hPgFsocERnbQ7XuVHqRpoZHrQOdtSFf6FGepzC7pRT
	IkQfAjpGEDUnh1j3JK+YdROtUAiJLqC4V8WQsGuUP04TSEt6i0Ia1Vm7HSb6ODz5VcBT4S/sVS9nJ
	fxHLh1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vUh-000000095W3-2nlP;
	Tue, 08 Sep 2026 13:04:11 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vUg-000000095Vb-03K2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:04:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so7256176a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788872648; x=1789477448; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TF2FBSAbA99rTI7hgd6XJ5POJVbB9v0L/f44ZOGfZAY=;
        b=eUhdkaOorIqbE8EqjZiS9V5lhykYevhEQJ98Sft3ojzvYCxLlapk8TOV6YZcicqLaM
         Z0yAcNY/eWqUS8UGw7DhgN34Wn0t0dAO6wZYNbIeJ+URxQR1jL+9AumhuyqWj+5L+1Kk
         xgrMHiJ1NNIZ51UzeQcvVrCLST6mrQGsWkMEpWAAC2uAeyvyu3aXAnzkKKa7TB/4AEdR
         tSwVQ9FrRWKiYJflOq+tPaq0MOa7VI/PEpjGgeeWnzGjC0gBI0v6ofrgzly1FlHHhrpf
         T9vTZ2zIgKEO+KFNtU+3eF9cvnHMvrkM9dS8fPVXQCmM6oywTJHBBtMfPNPxpejuimWC
         jnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872648; x=1789477448;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TF2FBSAbA99rTI7hgd6XJ5POJVbB9v0L/f44ZOGfZAY=;
        b=Ezo9R028mtRqmiCIFEOqW5z/ukZEyAOxFrhC9vJuan0QpVF7AAindAyGo+9fwmBO9g
         4SB/MBY80qPVm85ZFQaUpE2iOKXuPwRX0aolIc5YKpKtYOp66Io4BpLrk9L7f24Pdq88
         VmGTaXEQnZjCX+8+PsRlaY7ukHdkJgNjQBsTFpWK9DsoEj9LwMx1H+/ULbz/sm0eZs+Z
         weCIdemLspiLCohSw836koqz2SYd+Ye7YNT7Xdd5S4936uu/hKsiu0KuN+06nTTWAB8U
         w/xO4uDAhaT8m0Bslt7CBIUqOmpYoyk5290mCkz92XtmxNKI1+Era6vG0NlrA1uK3ZD7
         PBKA==
X-Forwarded-Encrypted: i=1; AKwUvBx+5X1xBiUa0WwSkHFYvYrlN/2KuraOtg0klfdxjOBXvwBbARTtVhePGO/biI/PoPOdYG656wjTwAoK0e/JoDwa@lists.infradead.org
X-Gm-Message-State: AFuF++ncEEFAiRscVYxNITZN9lXb84yWfhl5k9N4F3naa1EhuZhcVVIw
	yU4KmFeVl+D/59N7VRnwfC06ulIYLBeDQqDlYdy/RWllJ2ZZ0YViJvrj7aSf2/EjfA==
X-Gm-Gg: AYBFou1aLGPDBrMhAvpD2ho09isQMLkBlEB9a80GC2mZx6xRd/XFVmopSM1UNACZtZd
	MWECg0GTgCZlcO3PuIobqosugCYbj2/aHyw8oDQM9N1IjTneoxrumvuNrkg/5jqK0MiewbPBEaU
	tswoXACYljyHK3Jx88is4NAYl7VUOaLwXbs4bWY+z/WgYTXPqV1q9KRi/oJ7/LKcVuYwETzrgKK
	ZCjlezbzQhzwxkwhMP1rFO20KyBXRPc0O0oyPA68LoTCs1dXSh5ehhULSAhkWlTU5mf7Kzlb1sS
	Ah6Lbin6J8htVluw5Hlo/f9nx/lpRy4vF7W0zqi/0cwzIfN5BHO0RnW4P2cXZEs9aMn/z3C9gBI
	q7rqaAyWt7QOHkyTLTvGrF1cn4k+FWJqd08IGBLmvVrWXeJYx/ikzZcBImxubEPj6ecZ88FdV77
	mBBzj6S50QbSGcAldXkCTUf0Qvf58zpRgOaDxSovXqO1fLaHgLqtl6rAwcEuScYXm3F0fTa4RcQ
	OPkG/6r4uYInjqSIFg0fIEE5Gl/VesV
X-Received: by 2002:a17:907:c081:b0:c25:6230:dfcd with SMTP id a640c23a62f3a-c260c9e3320mr1176298766b.15.1788872647225;
        Tue, 08 Sep 2026 06:04:07 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d582304sm623294966b.43.2026.09.08.06.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:04:06 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:04:03 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>, Keir Fraser <keirf@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Quentin Perret <qperret@google.com>,
	Hiroyuki Katsura <hk590@cam.ac.uk>, Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] KVM: arm64: Fix host access to the EL2 stacks
Message-ID: <aqAHw8Is0bNBbXUl@google.com>
References: <20260908110713.1540304-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908110713.1540304-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_060410_131381_D71E0474 
X-CRM114-Status: GOOD (  23.43  )
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

On Tue, Sep 08, 2026 at 12:07:09PM +0100, Fuad Tabba wrote:
> Hi folks,
> 
> The per-CPU EL2 stacks are initialised as host-owned after pKVM init.
> fix_host_ownership() walks only the linear-map alias of each memblock
> region, and the stacks, mapped in the private VA range for their guard
> pages, have none.
> 
> Patch 1 is the fix, and it needs none of the other three. Patch 4 adds
> the check that would have caught it and would catch similar instances
> in the future: once the transfer is done, walk the private VA range and
> fail init unless every valid leaf is hyp-owned, or is hyp text mapped
> without write access.
> 
> Patch 2 is a fix in its own right, but to a different bug.
> fix_host_ownership_walker() matches hyp text on its stage-1 permissions,
> and that test hasn't matched on a non-hVHE host since 7.0, so hyp text
> is donated there rather than left read-only. Nothing crashes, but the
> instruction dump on hyp panic reads a page the host can't access, so
> the Code: line comes out as question marks. It matches by physical
> address instead, which is what patch 4 needs too. Patch 3 splits the
> start of the range from the allocation cursor, with no functional
> change, so patch 4 knows where the range begins.
> 
> Based on Linux 7.3-rc2 (df2908090cda3).
> 
> Cheers,
> /fuad
> 
> Fuad Tabba (4):
>   KVM: arm64: Transfer the hyp stack pages out of the host stage-2
>   KVM: arm64: Match hyp text by physical address in fix_host_ownership()
>   KVM: arm64: Move the private VA allocation cursor to __io_map_next
>   KVM: arm64: Check every private mapping is hyp-owned at pKVM init
> 
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
>  arch/arm64/kvm/hyp/include/nvhe/mm.h          |  1 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 20 +++++
>  arch/arm64/kvm/hyp/nvhe/mm.c                  | 79 ++++++++++++++++---
>  arch/arm64/kvm/hyp/nvhe/setup.c               | 16 +++-
>  5 files changed, 108 insertions(+), 10 deletions(-)
> 
> 
> base-commit: df2908090cda368b01ff43709f51890076c56157
> -- 
> 2.39.5
> 

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent

