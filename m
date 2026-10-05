Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75108CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOUDEDfbIuhsdU9SMlqRtqsOKmFkLusGahJcyhTqJsA=; b=I7RR9hnUfHMr2jqBz7i4R/ahET
	ETUdmy6k6xH9FfjL+5Jsc1MTkKSG6oBrBHpVHL7O3KWhRz71RGVWOyNYlsz4i+iRbdgG91rTM/4H+
	M0MA2EqP5xos4ZL9mNcFFMu9V5n9l7eFX61UAojBMTvb1tQfxQATMB6JKBwSRfvvHrCRGaJXhCUsH
	jFcgv3kn67i3DjX00c4Ap7vUavk4vx0MAB9b/U6RpJqk8vEi6YxBA3WpRKRUE8UoFDnQVqKBnvisM
	HqSdnjfzKPTcGFdEl1qqb373PWx+kJ5W65IF+YkHWpQ0ocNdZnIZBJnl3NNJJZJmnvOKq1HqDDPRq
	NSNbGl+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdsr-0000000FrVZ-0Rko;
	Mon, 05 Oct 2026 08:17:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdsp-0000000FrVS-31Ui
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:17:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA52E6022A;
	Mon,  5 Oct 2026 08:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A371F000FF;
	Mon,  5 Oct 2026 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791188234;
	bh=LOUDEDfbIuhsdU9SMlqRtqsOKmFkLusGahJcyhTqJsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gvOMKerVLu6ANJO/Dzr1bSj3L6JSMCZ9duOUYPtB4ZW58O+tUaPSe4KMitx4ROu7n
	 r/orIXgLCdvlt/jk/DGlVcB/6xbezs6hrr0tGmVFn72NEPkKlfX/41U85N51HNE2Cj
	 80jrS3NP88l4TdQTKj1G7UmIo1rzrbJY13FIBKr1U7e+fUWi9GPhAVpeOZEnT7dRCL
	 TS5+2M2ZFvbv7G+nRTS8INQjg4ucv8HvlMXK811bc6v4jWh/ebKF6zbKOSMWqM9qO+
	 EavxJFIIk/Bw1ceQJG2n7P7QqYhvJl9tTHrkAqS1e8Q2ItaFUSpD5RmlzI8k7pRxAa
	 i+PN9tuh9XW7g==
Date: Mon, 5 Oct 2026 01:17:05 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com
Subject: Re: [PATCH v3] KVM: arm64: selftests: Check SError is not pending
 after delivery
Message-ID: <asNdAXGkxagm88Su@kernel.org>
References: <20261005050349.836795-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005050349.836795-1-fuad.tabba@linux.dev>
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

Hi Fuad,

On Mon, Oct 05, 2026 at 06:03:49AM +0100, Fuad Tabba wrote:
> test_serror() never looks at the vCPU after the SError is delivered, so
> a stale pending SError goes unnoticed. Read the vCPU events back and
> check the SError is no longer pending.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> The fix from v2 was applied [1], but not this test.
> 
> Changes since v2 [2]:
> - Dropped the fix, now in kvmarm/next.
> - Rebased on kvmarm/next.
> 
> [1] https://lore.kernel.org/all/20261001135711.1640520-2-fuad.tabba@linux.dev/
> [2] https://lore.kernel.org/all/20260921101030.1231605-1-fuad.tabba@linux.dev/
> 
>  tools/testing/selftests/kvm/arm64/external_aborts.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
> index 7836756a38a6c..c35b0c87250a1 100644
> --- a/tools/testing/selftests/kvm/arm64/external_aborts.c
> +++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
> @@ -239,6 +239,7 @@ static void test_serror_guest(void)
>  
>  static void test_serror(void)
>  {
> +	struct kvm_vcpu_events events;
>  	struct kvm_vcpu *vcpu;
>  	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_serror_guest,
>  							unexpected_dabt_handler);
> @@ -247,6 +248,11 @@ static void test_serror(void)
>  
>  	vcpu_inject_serror(vcpu);
>  	vcpu_run_expect_done(vcpu);
> +
> +	vcpu_events_get(vcpu, &events);
> +	TEST_ASSERT(!events.exception.serror_pending,
> +		    "SError still pending after the guest took it");
> +
>  	kvm_vm_free(vm);
>  }

Can you add coverage for the vCPU events state to all the test cases? In
addition to the case where the SError is taken, it'd be good to assert
that the SError remains pending if the guest masked it.

Thanks,
Oliver

