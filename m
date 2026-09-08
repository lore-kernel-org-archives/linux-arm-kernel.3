Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B1FC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brbC7XUVPcpNDcEU3J/bE1H0WQaqvxyajzcgWf6nVhs=; b=AALY3bz0p+iqNjSjY8THhHznlL
	iCH9aMebxedFNJtC8L8N3SSvOpies07axMRUrMqe8y0zUSIYukwi2NGGTS6lB+/jZ7BZIcs72crah
	0c/QJbXH39Ts3oyHdswXUg0xg/Fb0NmbsP5f0vK59lc2d69GkD2teHcdN00M/RO1wLu7K1q7fWvcm
	arHc08asdmoTmB9/kvXZAJNmsD5rZ3fnt3stXfLuritqqcchXMme2YA+QTpU6sPg1FNKr7zPGM6WA
	e0JFAk3LErk37ey6l8O6Ggw//wmA7rJUInW+TlNPf8at9wpUOE9VpHXy5Mrx3LtlXGc93SrhEQGFH
	rEHVxjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qsu-00000008Lvv-2m5J;
	Tue, 08 Sep 2026 08:08:52 +0000
Received: from out-201.mta1.migadu.com ([2001:41d0:203:375::c9] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qss-00000008Luw-1P44
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:08:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XGg4zKBZIdsYlLMLs2Et22MQ6qSUt/Oz2PZF17USj98=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788854928; v=1; x=1789459728;
 b=PW5oRweem8GeyMypPghAsF8yOYdprzqwcpCNqj2H1YCHFtk4yFCnQgTMXl9f9KZ2x7raaXhx
 lVT8er8/V87WyzRGK74wpGygH6Ev/w6qOkJfBWhZ594B3A0v8r+ro8CwrDr0YYtx/2Nr/mqklCU
 ABQmv6A2OSSA9Xmt4crvjd2s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 65cb1aa034d88cd4;
	Tue, 08 Sep 2026 08:08:48 +0000
X-Mizu-Trace-ID: 65cb1aa034d88cd4
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so14289e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 01:08:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/5URxuyWTStYL4K5hzKd4sIR/bI96qJ7J/lxBo4AWsaF0gdOkq3cRzF3YoA7QtOInbqjNX8lDBLTAknLlncKt@lists.infradead.org
X-Gm-Message-State: AFuF++lcPSKOCnEDWSWHaZAUUwr3YSIYDkOWCWnag8e64dTn8hIDYgbd
	IIBTIXRgu7ct8JC1/uTTfSEqGXif0uIkjTDjag42uLf1wcVabhuW+6Pd2BRBTtVBZiyDyp1HNIS
	G8ZWcSpmIPTJaDhY2Vm8AG4yjpnNi00+mBBD3U2jp
X-Received: by 2002:a05:6512:1344:b0:5b6:186e:682f with SMTP id
 2adb3069b0e04-5b751a5bf63mr134070e87.0.1788854927331; Tue, 08 Sep 2026
 01:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
 <20260826-arm64-52bit-va-v1-2-14ec98211363@fujitsu.com> <CA+EHjTyJpPd8HjaWBw0V6pHF9UR0w2UFmaKDe7U3O+Sj8wiyPg@mail.gmail.com>
 <ap8rnTINMJQqfYGL@sm-arm-grace07>
In-Reply-To: <ap8rnTINMJQqfYGL@sm-arm-grace07>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 8 Sep 2026 09:08:11 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwhoZEORBjJcUb1WQbFT1TtX8x=BeeMJAcdpEBVJJ265Q@mail.gmail.com>
X-Gm-Features: AcwNN1UAtKldnq8E5xQ_R8tgfkqEMJun_timebwDOYCwtGlMYwbA3T-yjMp633c
Message-ID: <CA+EHjTwhoZEORBjJcUb1WQbFT1TtX8x=BeeMJAcdpEBVJJ265Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: arm64: Add 52-bit VA guest modes
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Takayuki Okamoto <tokamoto@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_010850_543761_590EDA28 
X-CRM114-Status: GOOD (  24.93  )
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

On Mon, 7 Sept 2026 at 22:24, Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
>
> Hi Fuad,
> On Fri, Sep 04, 2026 at 09:45:30AM +0100, Fuad Tabba wrote:
> > Hi Itaru,
> >
> > On Tue, 25 Aug 2026 at 22:18, Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
> > ...
> > > diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
> > > index 9108e14a9b5b..bcdf670c9eb8 100644
> > > --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> > > +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> > > @@ -46,7 +46,7 @@ static u64 pud_index(struct kvm_vm *vm, gva_t gva)
> > >         u64 mask = (1UL << (vm->page_shift - 3)) - 1;
> > >
> > >         TEST_ASSERT(vm->mmu.pgtable_levels >= 4,
> > > -                   "Mode %d does not have at least 4 page table levels",
> > > +                   "Mode %d does not have >= 4 page table levels",
> >
> > Patch 1 added this string one commit earlier. Could it go in with the
> > final wording there?
>
> Surely, will fix in v2.
>
> >
> > ...
> >
> > > @@ -298,10 +304,14 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
> > >
> > >         /* Setup mode specific traits. */
> > >         switch (vm->mode) {
> > > +       case VM_MODE_P52V52_4K:
> > > +               vm->mmu.pgtable_levels = 5;
> > > +               break;
> >
> > This is now the deepest mode, so page_fault_test.c's sizing is stale:
> >
> >    * VM_MODE_P48V48_4K is the mode with most PT pages; let's use
> >    * twice that just in case.
> >   pt_size = 26 * guest_page_size;
> >
> > The margin still covers it. Could pt_size come from vm->mmu.pgtable_levels?
>
> I'm not the author of the page_fault_test.c for arm64, but so I'm
> guessing here; per the comment in the test, I dont think total number of
> levels determines pt_size, rather by the addresses prepared for the
> test.
>
> This stress test does not require high virtual addresses, though should
> we update the comment while at it?

You're right, pgtable_levels alone wouldn't capture it: what sizes
pt_size is the granule and how much the test maps, not the depth.

So just updating the comment is enough: name VM_MODE_P52V52_4K as the
deepest mode. At 5 levels it's the deepest any 4K mode uses, so the 2x
margin holds and the constant won't need revisiting.

Cheers,
/fuad


>
> Thanks,
> Itaru.
>
> >
> > Cheers,
> > /fuad
> >
> >
> > >         case VM_MODE_P52V48_4K:
> > >                 vm->mmu.pgtable_levels = 4;
> > >                 break;
> > >         case VM_MODE_P52V48_64K:
> > > +       case VM_MODE_P52V52_64K:
> > >                 vm->mmu.pgtable_levels = 3;
> > >                 break;
> > >         case VM_MODE_P48V48_4K:
> > > @@ -322,6 +332,7 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
> > >         case VM_MODE_P48V48_16K:
> > >         case VM_MODE_P40V48_16K:
> > >         case VM_MODE_P36V48_16K:
> > > +       case VM_MODE_P52V52_16K:
> > >                 vm->mmu.pgtable_levels = 4;
> > >                 break;
> > >         case VM_MODE_P47V47_16K:
> > >
> > > --
> > > 2.43.0
> > >
> >

