Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6889CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osdPfu3X+WvVcN3qUZlA7PO/Is6NQe7OboBpnwUj8qo=; b=dh+ojjGc+0r7WE+Sso/lkw8zjF
	MP+78RpqNmxoxNXUvLrcUqqKtaODy1lsSTM1+PiLTR6rXW9BuFw8XqgGTTfLMbGwc899IATnIVQeL
	DHDcniilHqiachc4klQrZD8BOKjG63cuvXzZ0Huv4zSoJ4Hyd3LPTuvGS+gml+tC1E4PqyGjtZ5FV
	NaaU2BHEv0UShfft+TxPFLeyJkEYPTe9yy/sItK7idWMX17Uuby+M4ij88sow5RTD3jWjelDDDcE8
	j4NHBzx52bZ1+jZUd/UOFH8xHAbDAyXPj5YLhN1PjcwJGvFOtgcVfvS3aBZK823lv8P6YMrMJBZLO
	+PnZ2sUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquPi-0000000CDPq-28Z1;
	Tue, 26 Aug 2025 14:12:42 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqu0j-0000000C91k-3mR4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 13:46:55 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2445827be70so55993005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1756216010; x=1756820810; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=osdPfu3X+WvVcN3qUZlA7PO/Is6NQe7OboBpnwUj8qo=;
        b=EbLKI0AoZFoJEbPFAcgET9TkmmX8eZW+UqniB+pm9cfbMChkkme2tHpo+QKIxtvVHh
         f7sagGIJ7rGQhzi4F8RoB3k+d3y2u0CAxfm8rLiklNdp7Wm3hwFsC8Xv54SGXscjXgb/
         XRikbHrWOkuCH31O+cNtJ8V21G4hFdu8ExFGnNJTtlUtGqUKciBm2sCpaLKWefpePnNb
         56K6wopAoYB64n86dT2z67ZQKFtDqACZkWwCbsdd3a8Rrf0E8UI2fOAhKhujOUuflbOW
         UyvoF6rikfvVqxRkVKe1ubP9PLL/RZ8SkkDfG6Q9nsrAeN8cbKMYwqNRUFwQMirgSTJK
         CQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756216010; x=1756820810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osdPfu3X+WvVcN3qUZlA7PO/Is6NQe7OboBpnwUj8qo=;
        b=sOVRvwIaSvhSZhRdXyQMP37wP5WQXaCUorq9pR65jEDNST7XcvLpK3z2fOLb2TXmht
         XLai5FVlbmKRMxFHfmANWNUByILc7bI+OjiDGve6wcxiYHhScTvuPtMckOBvwQZG9TAK
         aVzMblSZrQoZE/mmgu4pzOo8gbIJAk+57gQoyTKAHc18I7wAvC9tWm7nOlHxG62x89yl
         SoQAS2I0Wnmzc0MmBtkuxX5qZGZC0etfp778s4ieZfrQ8RnevR1SQZSqb1HhzofxqX0L
         Oj5hL3EWpyULkHYRSE+YdwX2YhNFw/dJQtl5lfA2+9//EwGSwAviBJZ8waFLWiFI5hk6
         uyZQ==
X-Gm-Message-State: AOJu0YxCSGWii1OT77ObaSCb7r+TdBrO3nbtY54JBRRnc8syAVYiKWCC
	dMYR1B/e7KRWUQrk7RFTQb3/wpmAH4rPEH2nMJ/GM58zlM9yDqhjruh8Fuc6EieTFohXO9fHFEE
	uqmMKvc/1tIrosXtsVVCBowYpiX5R4EuxgS57EEN5I5RpjNEBBHvp2BmVkRXBLAEAcGjcRA==
X-Gm-Gg: ASbGncvoknOyRCMrui3kr2Xz8j12hmV10k4YHK6zo0ulOmcUEWFShaI0DqmkDCQfI3/
	vSbuncyhLX2yZqxogLiXREE9WO4NhfQ87jbu1gSczlIJtPtwGxy7Jx8Ilpk+0XqEgZwz0Ioz0nr
	y+ul9mNWyp3oVIio0MV+xzuOoQFDs/QFiGYu8HAjyMYorvAHvNY5/BBIibQrQm6rTMCzZcM7GnY
	0Wa64CPwgDVMI+no/UsZja/AIez7PaC+KNhp3keqNchKnv08d2HYhtzlawhIMtpcmOB/ANaPQ+4
	sLDyegXOPUWTWrQ4CCutA0z6IxXLIFoMAWNF/p8Pe84dUzIciznoun+HkZpVOugyx9/SqUv/PAb
	eXn1Q9/bMD9kHvYCra8CoQLuAfsQj/zUDT0MAI2kNLVS4lpasS8AAkJQB+A==
X-Google-Smtp-Source: AGHT+IEapx+qUYn+gnSfpFGolofqtYLrq6ffT2yt159qZt5g4CsSb6AqyhXzJhjpuNXlfxvFnyc/wA==
X-Received: by 2002:a17:902:c94d:b0:245:f002:d67c with SMTP id d9443c01a7336-2462eeb6325mr197352005ad.30.1756216009581;
        Tue, 26 Aug 2025 06:46:49 -0700 (PDT)
Received: from zenbook (1-162-83-231.dynamic-ip.hinet.net. [1.162.83.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466887198dsm96470935ad.110.2025.08.26.06.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:46:49 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:49:27 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] KVM: arm64: nv: Allow shadow stage 2 read fault
Message-ID: <djypsyratk63ovzv3flzb2tmunqtcoryzserwhsaaq5nuogsrx@u3uuwynnafbj>
References: <20250822031853.2007437-1-r09922117@csie.ntu.edu.tw>
 <87a53rk83s.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a53rk83s.wl-maz@kernel.org>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_064654_221959_118C29F3 
X-CRM114-Status: GOOD (  52.98  )
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

Hi Marc,

On Fri, Aug 22, 2025 at 10:40:07AM +0100, Marc Zyngier wrote:
> Hey Wei-Lin,
> 
> On Fri, 22 Aug 2025 04:18:53 +0100,
> Wei-Lin Chang <r09922117@csie.ntu.edu.tw> wrote:
> > 
> > We don't expect to ever encounter a stage-2 read permission fault,
> > because read permission is always granted when mapping stage-2. However,
> > this isn't certainly the case when NV is involved. The key is the shadow
> > mapping built for L2 must have the same or stricter permissions than
> > those that L1 built for L2, hence opening the possibility of mappings
> > without read permission.
> > 
> > Let's continue handling the read fault if we're handling a shadow
> > stage-2 fault, instead of erroring out.
> > 
> > The following illustrates an example, vertical lines stand for either
> > L0, L1, or L2 running, with left: L0, middle: L1, and right: L2.
> > Horizontal arrows stand for traps and erets between them.
> > 
> > '''
> > L0                               L1                               L2
> >                                                L2                 |
> >                                                writes to an L2 PA |
> > |<----------------------------------------------------------------|
> > |
> > | L0
> > | finds no mapping in
> > | L1's s2pt for L2
> > |
> > | L0
> > | injects data abort
> > |------------------------------->|
> >                                  | L1
> >                                  | for whatever reason
> >                                  | treats this abort specially,
> >                                  | only gives it W permission
> >                                  |
> >        eret traps to L0          |
> > |<-------------------------------|
> > |
> > |      eret back to L2
> > |---------------------------------------------------------------->|
> >                                                                   |
> >                                                    L2             |
> >                                                    writes to same |
> >                                                    L2 PA (replay) |
> > |<----------------------------------------------------------------|
> > |
> > | L0
> > | finds mapping in s2pt that
> > | L1 built for L2, create
> > | shadow mapping for L2,
> > | but only gives it W to match
> > | what L1 had given
> > |
> > |
> > |      eret back to L2
> > |---------------------------------------------------------------->|
> >                                                                   |
> >                                                    L2             |
> >                                                    writes to same |
> >                                                    L2 PA (replay) |
> >                                                    success        |
> > |<----------------------------------------------------------------|
> > |
> > |
> > |------------------------------->| L1
> >                                  | for some reason, relaxes
> >                                  | L2's permission from W
> >                                  | to RW, AND, doesn't flush
> >                                  | TLB
> >                                  |
> >        eret traps to L0          |
> > |<-------------------------------|
> > |
> > |      eret back to L2
> > |---------------------------------------------------------------->|
> >                                                                   |
> >                                                     L2            |
> >                                                     read to L2 PA |
> > |<----------------------------------------------------------------|
> > | stage-2 read fault
> > |
> > '''
> > 
> > Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> 
> Excellent detective work! Bonus points for the ASCII art -- I'm not
> sure how practical it will be to keep it in the final commit, but this
> definitely helps understanding the issue.

Thanks, I tried to make it clear for those that aren't familiar with NV,
including myself :P

> 
> > ---
> > 
> > I am able to trigger this error with a modified L1 KVM, but I do realize
> > this requires L1 to be very strange (or even just wrong) so I understand
> > if we don't want to handle this kind of edge case. On the other hand,
> > could there also be other ways to trigger this that I have not thought
> > of?
> > 
> > Another thing is that this change lets L1 get away with not flushing the
> > TLB, but TLBs are ephemeral so it's fine in this aspect, however I'm not
> > sure if there are other considerations.
> 
> Well, it depends whose TLBs we're talking about. The CPU TLBs are
> definitely ephemeral. But the KVM-managed TLBs (aka the shadow S2) is
> pretty static, and I am a bit worried to relax this.
> 
> What would happen on actual HW? L1 would take a S2 fault, because the
> TLBs are out of sync with the S2 PTs. And yes, maybe the TLB pressure
> woulds make it so that it works *sometimes*, but there wouldn't be any
> guarantee of forward progress as long as EL2 doesn't issue a TLBI.
> 
> I reckon we should implement that particular behaviour whenever
> possible, and handle permission faults early, possibly ahead of the
> guest S2 walk (the way we handle VNCR_EL2 faults is IMO a good model).

The parts above make complete sense.

> 
> This would imply taking the guest's S2 permission at face value, and
> only drop W permission when the memslot is RO -- you'd then need to
> keep track of the original W bit somewhere. And that's where things
> become much harder, because KVM can decide to remap arbitrary ranges
> of IPA space as RO, which implies we should track the W bit at all
> times, most likely as one of the SW bits in the PTE.

But sorry, I struggle to understand this paragraph after reading it many
times, probably my experience with the code isn't enough for me to make
the connection. Why are we talking about the W bit suddenly?
If you don't mind, can you reword what's discussed here?
I only very vaguely get that there will be 2 W bits, one from what L1 set,
and one from the L0 memslot, if I didn't completely miss the point..

> 
> We'll need exactly that if we ever want to implement the
> Hardware-managed Dirty Bit, but I have the feeling we need an actual
> design for this, and not a quick hack. Your approach is therefore the
> correct one for the time being.
> 
> > 
> > ---
> >  arch/arm64/kvm/mmu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 1c78864767c5c..41017ca579b19 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1508,8 +1508,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >  	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> >  	VM_BUG_ON(write_fault && exec_fault);
> >  
> > -	if (fault_is_perm && !write_fault && !exec_fault) {
> > -		kvm_err("Unexpected L2 read permission error\n");
> > +	if (fault_is_perm && !write_fault && !exec_fault && !nested) {
> > +		kvm_err("Unexpected S2 read permission error\n");
> >  		return -EFAULT;
> >  	}
> >  
> 
> Honestly, I'd rather kill this check altogether rather than adding
> another condition to it -- I suggested it to Fuad a while ago. This is
> the first time we ever see it firing, and I don't think it is bringing
> much.

No problem and agreed. Let me prepare another version.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.

