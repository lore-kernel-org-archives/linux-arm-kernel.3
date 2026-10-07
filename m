Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86F1CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 02:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xf7pjI4M1bd+NCDOJ5NJCM6NxqZXtiNtvFxx4JcqVsc=; b=2i4HVVGfK3wPZXgddN9HCvi8X5
	fJiyVdA95dHj6BCUuG5M7+rkPl7+KvBlvNOs+dyzXQwFmAPXoSH+9l/ZzqcaIJdB1NHKTlobi4xfx
	J0g3XqL0Rg5UELBl5iNq2AVSt7g9nkra61Yt8uP4cZZj9m81L9NblIQEeCY1wvXwYEvikBNMRFxCe
	Z1x+1Lrbph4Jb/ui74bqSdREY3v2T8XfugociZ59q83zT3MoEhEtnhPzgfulXsiPyZIswZ23IoMex
	+4S0owetGGIGdY101PhnZIWyA09FZvXDcHh1sqAG9RN2hgE3+XnpC3UzU/9jm4xLeoStC41hhK8RN
	jhb+AKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEHON-00000001dog-2SSs;
	Wed, 07 Oct 2026 02:28:27 +0000
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEHOI-00000001dnb-2gMs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 02:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1791340102; x=1822876102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oeddAg8h/XfSj3W7DeYIWZ+00v/T5CKvwZTOXBtFeTg=;
  b=r8AO9MWztydq1vdyFBZXZqgD6tHuaZoedrvplYL+2yCYMIdntBLIPqZI
   KxsDwLKxBuSFyHduDH5heQu0KE7vX9ueiLP8kleF9XCk8fIfuzwNEEEHB
   YG3tsZO50sBb4057ew3bG9wTIU+VzWSW+6MKicGvsfdCmTZ4SFLH+puyC
   zjCsvuh6JVRua9ituXO+vzIWzCjxWkUzp/loHmZKhe/nh22j5eTshHxPK
   hK4ZXl7LL2cdVhlGmkVjl6GOOs5QYH309Mj2Kf3T3WiGarMbxWZQw02wL
   XyX4MRqj5R2Zpt9KT6I3iB/neXa/u0jaw4OYLe0whe81udcXv2K3LuGAy
   g==;
X-CSE-ConnectionGUID: tPNprqJ3SOOktw/z2KfHzg==
X-CSE-MsgGUID: AlSPv+gNQ0yduC/GIjz3Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="256931193"
X-IronPort-AV: E=Sophos;i="6.27,144,1786978800"; 
   d="scan'208";a="256931193"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 11:28:17 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BB634406C4C
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 02:28:17 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6F54AC01292
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 02:28:17 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 27BE2405EC0;
	Wed,  7 Oct 2026 02:28:11 +0000 (UTC)
Date: Wed, 7 Oct 2026 11:28:09 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com
Subject: Re: [PATCH v4] KVM: arm64: selftests: Check the pending SError state
 in external_aborts
Message-ID: <asWuORRZlOQR1N6B@sm-arm-grace07>
References: <20261006092841.2202109-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006092841.2202109-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_192823_167627_A34D6F75 
X-CRM114-Status: GOOD (  23.13  )
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
> ---
> The check that no SError is left pending after the guest took it is
> what fails without commit 3708f6342f01 ("KVM: arm64: Sync HCR_EL2.VSE
> back to the host vCPU under pKVM"), in kvmarm/next.

Applied this fix cleanly on today's kvmarm/next and did run
extranl_aborts on a NVIDIA Grace system booted with the proper ACPI tables,
the program finished quietly.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks,
Itaru.

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

