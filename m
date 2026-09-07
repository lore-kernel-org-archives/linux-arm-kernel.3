Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40407C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 21:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqGnhl6w8Ni5Kld2HfPc1ZZ8s+9W6tdO/WiAGiGmxJo=; b=spfiDXSItofwXNqCT1pRi2dJBv
	wzPmr6Wn9Qjxy+qHVNbOFRaoWl42U12Txf1e1k84jA9xh+Vb5GE4bMwbPtABkmeMhCI5WX35Ck8Md
	oUHtVX5wPOANuHXFPxglkZWhrJaQTIY6/uMyylK2d3g/Sn7NDAoiNZJXLlsjn0p9A6xMxtBoFJQvb
	8iSgDL1g/wlrt7wfLS/QWjh4SAlrg8uDLFY+Indvqs45CqlE2PK3EH3zO3oUuDxQe4hC2ZHMlzX1W
	ENUKgqszQr/0y5VrOPg0cjL0VYPgo3TmCuT6InO8OTFfPrCyVIaBQSL7mD4DJQDbCsGDV5lSb4cSS
	0OVknjLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gps-00000007kuk-0BYG;
	Mon, 07 Sep 2026 21:25:04 +0000
Received: from esa5.hc1455-7.c3s2.iphmx.com ([68.232.139.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gpm-00000007kt8-1qpA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 21:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788816298; x=1820352298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sP6TqseWnq6F/rMwkPdxmagtSOyUxPFFpE+5Nu3dPv0=;
  b=auQde2F+bg1vN2nnKWZzFJwB7j3IMgci3+YngljZsP+p3Zfi4NH+qBzb
   80M3tXX+B3NhgV9R0NweaHMSy8mMfQ42JLqERZ7nCKBKg6lzFL7MZzq1t
   7mVhLePpCAOu8+0kSl5ddy81lq/+V1v81krmo0HFwzZ+fSvHMn+DQQNjB
   RoWuGewGQjbG81Kx47oye8IV6XjlsaFkS5JU1jktYF/kZ+fdh3u9u/Wat
   kQDQRNiVljXiReYT7cu7xqHACtf70hZOX3eX3qNK23XgBDjN2CCbUEO5T
   XOv/ivhnbo9kMtR2CrUfsTsLyaNF+JjOtJahKhWOh/2OGbjuJePlvcemi
   g==;
X-CSE-ConnectionGUID: Rc9SRwHOT8eph1M6CxdgJQ==
X-CSE-MsgGUID: QewJ6fBUSLycMXTGnMFo/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="252411951"
X-IronPort-AV: E=Sophos;i="6.25,268,1779116400"; 
   d="scan'208";a="252411951"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 06:24:54 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E3ABFC01B33
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 21:24:53 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9C218C0075F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 21:24:53 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 641E81800170;
	Mon,  7 Sep 2026 21:24:48 +0000 (UTC)
Date: Tue, 8 Sep 2026 06:24:45 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takayuki Okamoto <tokamoto@fujitsu.com>
Subject: Re: [PATCH 2/2] KVM: selftests: arm64: Add 52-bit VA guest modes
Message-ID: <ap8rnTINMJQqfYGL@sm-arm-grace07>
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
 <20260826-arm64-52bit-va-v1-2-14ec98211363@fujitsu.com>
 <CA+EHjTyJpPd8HjaWBw0V6pHF9UR0w2UFmaKDe7U3O+Sj8wiyPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyJpPd8HjaWBw0V6pHF9UR0w2UFmaKDe7U3O+Sj8wiyPg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_142458_985094_4D004B31 
X-CRM114-Status: GOOD (  22.15  )
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
On Fri, Sep 04, 2026 at 09:45:30AM +0100, Fuad Tabba wrote:
> Hi Itaru,
> 
> On Tue, 25 Aug 2026 at 22:18, Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
> ...
> > diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
> > index 9108e14a9b5b..bcdf670c9eb8 100644
> > --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> > +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> > @@ -46,7 +46,7 @@ static u64 pud_index(struct kvm_vm *vm, gva_t gva)
> >         u64 mask = (1UL << (vm->page_shift - 3)) - 1;
> >
> >         TEST_ASSERT(vm->mmu.pgtable_levels >= 4,
> > -                   "Mode %d does not have at least 4 page table levels",
> > +                   "Mode %d does not have >= 4 page table levels",
> 
> Patch 1 added this string one commit earlier. Could it go in with the
> final wording there?

Surely, will fix in v2.

> 
> ...
> 
> > @@ -298,10 +304,14 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
> >
> >         /* Setup mode specific traits. */
> >         switch (vm->mode) {
> > +       case VM_MODE_P52V52_4K:
> > +               vm->mmu.pgtable_levels = 5;
> > +               break;
> 
> This is now the deepest mode, so page_fault_test.c's sizing is stale:
> 
>    * VM_MODE_P48V48_4K is the mode with most PT pages; let's use
>    * twice that just in case.
>   pt_size = 26 * guest_page_size;
> 
> The margin still covers it. Could pt_size come from vm->mmu.pgtable_levels?

I'm not the author of the page_fault_test.c for arm64, but so I'm
guessing here; per the comment in the test, I dont think total number of
levels determines pt_size, rather by the addresses prepared for the
test.

This stress test does not require high virtual addresses, though should
we update the comment while at it?

Thanks,
Itaru.

> 
> Cheers,
> /fuad
> 
> 
> >         case VM_MODE_P52V48_4K:
> >                 vm->mmu.pgtable_levels = 4;
> >                 break;
> >         case VM_MODE_P52V48_64K:
> > +       case VM_MODE_P52V52_64K:
> >                 vm->mmu.pgtable_levels = 3;
> >                 break;
> >         case VM_MODE_P48V48_4K:
> > @@ -322,6 +332,7 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
> >         case VM_MODE_P48V48_16K:
> >         case VM_MODE_P40V48_16K:
> >         case VM_MODE_P36V48_16K:
> > +       case VM_MODE_P52V52_16K:
> >                 vm->mmu.pgtable_levels = 4;
> >                 break;
> >         case VM_MODE_P47V47_16K:
> >
> > --
> > 2.43.0
> >
> 

