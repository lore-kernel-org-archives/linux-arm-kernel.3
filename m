Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF616CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmN/KQqhDysu6yJpzL+qWj82uBta8m5aZ09t+O4xLBI=; b=bEJu6g7rbe2LoAZrwteHwcsnI5
	/VMJrCgmfrvlLriJCDUJMRw+sREs6TjYJ9y6G3DQhjSqLH3BtMSSXZGpCxRkdhy08kACoNi0xZ47s
	vBYJ+BsE56C0O4Z6NfpTe2eQBUHPCEbSodwyI4uNLfVU2Pg/jsAbocxhM5ZuXrC+9ILTGOBpIVIfl
	RcdM5aDQAqhdJcZo13BodLhBtAtbgv+UhGnMCbEIXt44oP4Ln187gPrHZGOEcB0B9lja+MLvOgAOo
	xQeCIspnrYW+syzd5QHsoi3oFs/ydyOBWU4n/Uyw8+L3VQ57BUn9EJ1xXr9kLXkQJPCyRhWCJvG+D
	IlbwpO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSizd-00000006So5-38aq;
	Thu, 28 May 2026 22:14:21 +0000
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSizb-00000006Smm-0Jh8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780006459; x=1811542459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FWIBzXhLkf8QASpXt/e0kLaIXQ8j42MXyINrPuFKZF0=;
  b=VpfM0/fVDSX7OLkafJHWyD20gy1K1BmxLWCA+1bUpZlWxl7tyNbZW+Y3
   WeOjrAlTnau3TT14DU3h/fF0+bQjOkxTyOoS9HRnBSXxmXOKhlADvp59L
   IkLEDLfQuabWW3+05qKBsIQrtuK/jb+MT1VboxSyAV/pcG+eXACkZm108
   aDj4ppRh7HsoX48XHcIBqimtxpyWGBpxijTLCO0IHFmxAaU/Bga6S1DRl
   WXfMLo4NiHo6OUhuupKwY53r50NTaGvlyova5cE0T8moTf7vlC3Og/is/
   jiprTtKHcxMjp9/PA7NFOPKiXSBvyKwEHqWs0MMBPFh12IPIV4Wwv3U4R
   w==;
X-CSE-ConnectionGUID: iU7Q0/POQnWabhD6VonQIQ==
X-CSE-MsgGUID: 4QeSNgCrQeaBsuX1ID62PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="242224464"
X-IronPort-AV: E=Sophos;i="6.24,174,1774278000"; 
   d="scan'208";a="242224464"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 07:14:16 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9EF5D1C000F1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 22:14:15 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5595F19DF694
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 22:14:15 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 1348B82C235;
	Thu, 28 May 2026 22:14:09 +0000 (UTC)
Date: Fri, 29 May 2026 07:14:07 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
	shuah@kernel.org, suzuki.poulose@arm.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: selftest: arm64: Run shadow_stage2 varying guest
 modes
Message-ID: <ahi-L_HQXkxPuCYL@sm-arm-grace07>
References: <20260516183003.799058-6-weilin.chang@arm.com>
 <20260528045930.450339-1-itaru.kitayama@fujitsu.com>
 <r2dui45c3mp2qzns6dplqj6pfima5tq7huhvbwus225xamuccn@aw753ihdimz5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r2dui45c3mp2qzns6dplqj6pfima5tq7huhvbwus225xamuccn@aw753ihdimz5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_151419_677539_2FD8AB62 
X-CRM114-Status: GOOD (  21.45  )
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

On Thu, May 28, 2026 at 05:02:30PM +0100, Wei-Lin Chang wrote:
> Hi Itaru,
> 
> On Thu, May 28, 2026 at 01:59:30PM +0900, Itaru Kitayama wrote:
> > Refactor main() to use for_each_guest_mode() helper to create
> > a single VCPU VM with a guest mode ID.
> > 
> > Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> > ---
> >  tools/testing/selftests/kvm/arm64/shadow_stage2.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/arm64/shadow_stage2.c b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
> > index 5bce55abdea7..05acca22eafe 100644
> > --- a/tools/testing/selftests/kvm/arm64/shadow_stage2.c
> > +++ b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
> > @@ -105,7 +105,7 @@ static void guest_code(void)
> >  	GUEST_DONE();
> >  }
> >  
> > -int main(void)
> > +int run_test(enum vm_guest_mode mode, void *unused)
> >  {
> >  	struct kvm_vcpu_init init;
> >  	struct kvm_vcpu *vcpu;
> > @@ -114,7 +114,8 @@ int main(void)
> >  	gpa_t gpa;
> >  
> >  	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
> > -	vm = vm_create(1);
> > +	vm = __vm_create(VM_SHAPE(mode), 1, 0);
> > +
> >  
> >  	kvm_get_default_vcpu_target(vm, &init);
> >  	init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
> > @@ -163,3 +164,7 @@ int main(void)
> >  	kvm_vm_free(vm);
> >  	return 0;
> >  }
> > +
> > +int main(void) {
> > +	for_each_guest_mode(run_test, NULL);
> > +}
> > -- 
> > 2.43.0
> > 
> 
> Thanks! I think this is valuable.
> I can add your patch into the next version if you don't mind?

No, I would not, for the record your test rans with all the available guest
modes without an issue (ie ended DONE!) on QEMU in tcg mode.

Thanks,
Itaru.

> 
> Thanks,
> Wei-Lin Chang

