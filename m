Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7959ECA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wl8U8qEevNauiC6J2pbvxkX7VYWlgHKM2aJW6iFkDQ=; b=CQ+k9/U2L9C9RAOQBjCdT9Ncpk
	nYnqJuVKffWXmc9apbYWtOOhGA8TBWnpW9Rd8YLWE3NhjcDmT7XuR5kLPkY5piZQzCr0U9euo48Yn
	ATA1RxGh79LW3QG7PlwJeUHierZnf+3EuQ/9riH7WCPmMMcwbmzMMGXqgbqfBLisyEjkSIeq0PZ+e
	XmHqWaugFE7F5f+a0AyvWbzBbtT6N4P+6ffvGW6EnSP5Y+2cwI3fPAJBS02SIwyYcnwt4UsMpDCmB
	5dDaJps2hDAn7lODQZRC20TppbEfCBvUp7ftCn6gRe1Z8p4bBkJd4CPPx86vQag7X3v9jdUA+Twz0
	5ixC/KVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE530-00000000q9T-1tv6;
	Tue, 06 Oct 2026 13:17:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE52z-00000000q99-0WBZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:17:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FBA9601E4;
	Tue,  6 Oct 2026 13:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E04B1F000FF;
	Tue,  6 Oct 2026 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791292652;
	bh=1wl8U8qEevNauiC6J2pbvxkX7VYWlgHKM2aJW6iFkDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LtHD/eHL3+f7Xjm+LpgVK4iEZwvZMs30aWje1TC6Rw7auT+o//+/5FhXSlE/t0N6k
	 6H5rpCXKXDrvWESqmJF/yMebWW8oRaSZwLivBEE2hy5RMsf8T4oTpcv0udvRDFBz6P
	 M+oPcyIa/szygwa7tTUBTPvBrxvMiJAAaRPFNj7sWd288Yf7WPxqcnoWo35x+7kdNM
	 3xhA6lnJIDbCaq/BhmNfkDUW6a7Klw5dB9q4LrpfbdlZ5AzAU3aogIKkg8Z4NPpO05
	 2QRM36Ma/E/BSvDFk5/wUqBEAVmHB5pZRSvqQBBsRu2sot4oUKKzKxSasKD3R4SvyR
	 zOszerDR11zUg==
Date: Tue, 6 Oct 2026 06:17:26 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com
Subject: Re: [PATCH v4] KVM: arm64: selftests: Check the pending SError state
 in external_aborts
Message-ID: <asT05hZqkMvVVnze@kernel.org>
References: <20261006092841.2202109-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006092841.2202109-1-fuad.tabba@linux.dev>
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

On Tue, Oct 06, 2026 at 10:28:41AM +0100, Fuad Tabba wrote:
> None of the external abort tests look at the vCPU events once the guest
> is done, so an SError left pending after the guest took it, or dropped
> while the guest had it masked, goes unnoticed.
> 
> Read the vCPU events back at the end of every test that runs the guest.
> The SError must still be pending in the masked case, with the injected
> ESR when the vCPU has RAS, and no SError, injected or spurious, may be
> pending in any of the others.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

> ---
> The check that no SError is left pending after the guest took it is
> what fails without commit 3708f6342f01 ("KVM: arm64: Sync HCR_EL2.VSE
> back to the host vCPU under pKVM"), in kvmarm/next.
> 
> Changes since v3 [1]:
> - Check the SError pending state at the end of every test that runs the
>   guest, and assert it is still pending, with the injected ESR, in the
>   masked case (Oliver [2]).
> 
> [1] https://lore.kernel.org/all/20261005050349.836795-1-fuad.tabba@linux.dev/
> [2] https://lore.kernel.org/all/asNdAXGkxagm88Su@kernel.org/
> 
>  .../selftests/kvm/arm64/external_aborts.c     | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
> index 7836756a38a6c..1a858d0d82968 100644
> --- a/tools/testing/selftests/kvm/arm64/external_aborts.c
> +++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
> @@ -75,6 +75,17 @@ static void vcpu_inject_serror(struct kvm_vcpu *vcpu)
>  	vcpu_events_set(vcpu, &events);
>  }
>  
> +static void vcpu_assert_serror_pending(struct kvm_vcpu *vcpu, bool pending)
> +{
> +	struct kvm_vcpu_events events;
> +
> +	vcpu_events_get(vcpu, &events);
> +	TEST_ASSERT_EQ(events.exception.serror_pending, pending);
> +
> +	if (pending && vcpu_has_ras(vcpu))
> +		TEST_ASSERT_EQ(events.exception.serror_esr, EXPECTED_SERROR_ISS);
> +}
> +
>  static void __vcpu_run_expect(struct kvm_vcpu *vcpu, unsigned int cmd)
>  {
>  	struct ucall uc;
> @@ -134,6 +145,7 @@ static void test_mmio_abort(void)
>  
>  	vcpu_inject_sea(vcpu);
>  	vcpu_run_expect_done(vcpu);
> +	vcpu_assert_serror_pending(vcpu, false);
>  	kvm_vm_free(vm);
>  }
>  
> @@ -162,6 +174,7 @@ static void test_mmio_nisv(void)
>  
>  	TEST_ASSERT(_vcpu_run(vcpu), "Expected nonzero return code from KVM_RUN");
>  	TEST_ASSERT_EQ(errno, ENOSYS);
> +	vcpu_assert_serror_pending(vcpu, false);
>  
>  	kvm_vm_free(vm);
>  }
> @@ -185,6 +198,7 @@ static void test_mmio_nisv_abort(void)
>  
>  	vcpu_inject_sea(vcpu);
>  	vcpu_run_expect_done(vcpu);
> +	vcpu_assert_serror_pending(vcpu, false);
>  	kvm_vm_free(vm);
>  }
>  
> @@ -212,6 +226,7 @@ static void test_serror_masked(void)
>  
>  	vcpu_inject_serror(vcpu);
>  	vcpu_run_expect_done(vcpu);
> +	vcpu_assert_serror_pending(vcpu, true);
>  	kvm_vm_free(vm);
>  }
>  
> @@ -247,6 +262,7 @@ static void test_serror(void)
>  
>  	vcpu_inject_serror(vcpu);
>  	vcpu_run_expect_done(vcpu);
> +	vcpu_assert_serror_pending(vcpu, false);
>  	kvm_vm_free(vm);
>  }
>  
> @@ -288,6 +304,7 @@ static void test_s1ptw_abort(void)
>  	*ptep |= bad_pa;
>  
>  	vcpu_run_expect_done(vcpu);
> +	vcpu_assert_serror_pending(vcpu, false);
>  	kvm_vm_free(vm);
>  }
>  
> @@ -313,6 +330,7 @@ static void test_serror_emulated(void)
>  	vcpu_run_expect_sync(vcpu);
>  	vcpu_inject_serror(vcpu);
>  	vcpu_run_expect_done(vcpu);
> +	vcpu_assert_serror_pending(vcpu, false);
>  	kvm_vm_free(vm);
>  }
>  
> @@ -356,6 +374,7 @@ static void test_mmio_ease(void)
>  
>  	vcpu_inject_sea(vcpu);
>  	vcpu_run_expect_done(vcpu);
> +	vcpu_assert_serror_pending(vcpu, false);
>  done:
>  	kvm_vm_free(vm);
>  }
> @@ -395,6 +414,7 @@ static void test_serror_amo(void)
>  	vcpu_run_expect_sync(vcpu);
>  	vcpu_inject_serror(vcpu);
>  	vcpu_run_expect_done(vcpu);
> +	vcpu_assert_serror_pending(vcpu, false);
>  	kvm_vm_free(vm);
>  }
>  
> 
> base-commit: fa22cd9947fc245d71bc40482f7f78eb0d5a4af0
> -- 
> 2.39.5
> 

