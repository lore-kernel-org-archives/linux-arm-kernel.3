Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE29CC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgKGnlqsv8JBCCBT4cAI1s7V8k61mCMe7HW1WOz7bZk=; b=bUdXG+gM0yx5OZfMAScFuipth/
	MzLqIRuISCnjFO4ICHmJjFYwz9oKZdnkf62kVNtW1Q8rf+LsoKEdJts52WQ0bMD29GxM5nizYaxVW
	1sIgX8lRXhwHlxw64xSe3QlpjvtDvPKKNMednVpvg5mR3ASstvG+9GEEvf+Dlan/rcIorVQfatrJh
	fTtqlSTg960/lgOAwMjoxj0/e5LHcbs8Ge4oOglbvbRiRPJ91war4N/E7sJxJxpzpm6UWRUTHSe2q
	1pJqohtTU03mZtcEjPHE5Jm3rxlvt/ZgkZCPzcFYzSHHHv8z3G5+hfQU+PlxO1OecZxPMcByQvLqv
	Rp2XrDpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBB4-0000000DgoB-0p2m;
	Fri, 28 Mar 2025 14:59:22 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAY3-0000000DZWi-14CP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 14:19:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4393ee912e1so51185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 07:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743171541; x=1743776341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgKGnlqsv8JBCCBT4cAI1s7V8k61mCMe7HW1WOz7bZk=;
        b=ieSVRAyrNRP6SnYUx0ujzYTFX+9zKrDxaSDefTSO7ovnCExb/bZfj3YR76B3myj/Ol
         0L1hGaDGXqVhGz4gOidEbzRp3vP+icpsrgEhic6OjqmZraxmOO8qD3BcfY7+BCLRo16l
         roJY9FGzKRR5A6XIRpIAvFdJWCVGkzfJMItdYo34zs1QRRvHStxat2m+XSYnGrA/i9D3
         kHr4VuGdGvOHooge++NCg/CcmS53846wZ9hZoQgJXx9uUTmCazFKiamV4zE/7bG6yFx4
         hl/u7U/qvYXA6UO61+shzPTuWCAYQzw2poEBeOys57TY3AKqn1+7mm+/pX/fuoRsmMKO
         LFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743171541; x=1743776341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgKGnlqsv8JBCCBT4cAI1s7V8k61mCMe7HW1WOz7bZk=;
        b=R4K7ZKNOvnTNdvyzPoO/uOhdemH0PEqiF4Z3ZopZRO4lDDPUxgOW+xPISJ5Vr27clI
         YObWWyAfDXrQYN7q8cMikwCQmzq4p36lOUtTBlZc/KMsU1cT0CNFXhz++YHezMkTM5RP
         bxzTVuqRR46HKZJCn8b2MRKZUYvsp/00Ap8a4vjFcNYRPRXC8Rq1W2IL5cQcGx9QFqWM
         M9+K0ymqOBAoqnz1sOc6qdwE8FtNkC2jos8nG+EuWqvrq1GWzKl2wN1MzSR7RgvDL/Fm
         7/C81zkZ2s+20UvCmr8s1MsZP/p4rCGBalhe3uZaHvQfCquSJAFoxxVxra+xEFjE5LgD
         3PrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf4nqIdU4DVSg0z/py0h5l/XS/ZUgt18/BrM07v5Djct7r33o1FT+Pl4auo9Cd9w2NvaAxrWVmlFCx3++pwOXG@lists.infradead.org
X-Gm-Message-State: AOJu0YyV+h1vm1AsCut4DWj9AthWsKA1iZz2YbwKlIUs4CcDAANk7S0s
	A4ZRPrAR/SnOF09I1Y3v23yXJcCVIKLUJ8CDu7Z3o983zHXCjf8cNlc2ujeYrg==
X-Gm-Gg: ASbGncuPWP8qBi7jQJMO5KlB4FDwxqin7LbWb+H48XqrCO6P7PW6gl9iRj9IJ8N7tHt
	ts2SqH0GvBST9Qlbilp0ouuXNh9y4+0b31qG4KXatuRlB7tQy8PlqnpJXUu/ztNIw10iGSBNzuu
	T+82AG4J8mB1/pWZxkUjhu7REvZJrNxRDyxRcRY+NEEfN5+fpzXsmzDoaZ/C/rpUfxVC4/CE5AV
	urC/c5mSRMnZahKGk9s+H+obl6afOhwJAXH/prcvbp+x1ixmsEpjCYF/oBM4IQCHdwaJ+OLO0TT
	wz85ID2zyVLQTxJ7s8NJhcXcrZ4rB9msgiNDMZfJIDA1gqwysvyc7tl78giNdWtpllnQW+zhV5n
	MPhcVMOGI0A==
X-Google-Smtp-Source: AGHT+IHxOKuumMNh+x8OQRqeAYCAeaAh/X2iaTKV9NNyWp8l9Mpc74sAcjSgUeJ0CBhJSW8k13LnEA==
X-Received: by 2002:a05:600c:4793:b0:43b:bf3f:9664 with SMTP id 5b1f17b1804b1-43d9182811fmr778435e9.5.1743171540532;
        Fri, 28 Mar 2025 07:19:00 -0700 (PDT)
Received: from google.com (28.140.38.34.bc.googleusercontent.com. [34.38.140.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663573sm2853690f8f.33.2025.03.28.07.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 07:18:59 -0700 (PDT)
Date: Fri, 28 Mar 2025 14:18:55 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Quentin Perret <qperret@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	will@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH v4 3/3] KVM: arm64: Release the ownership of the hyp rx
 buffer to Trustzone
Message-ID: <Z-avzxyyOiaIk3-C@google.com>
References: <20250326113901.3308804-1-sebastianene@google.com>
 <20250326113901.3308804-4-sebastianene@google.com>
 <Z-Qv4b0vgVql2yOb@google.com>
 <Z-UcW32Hk6f_cuxc@google.com>
 <Z-aKgXVjp4nNJcLd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-aKgXVjp4nNJcLd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_071903_314147_FACC8201 
X-CRM114-Status: GOOD (  62.85  )
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

On Fri, Mar 28, 2025 at 11:39:45AM +0000, Quentin Perret wrote:
> On Thursday 27 Mar 2025 at 09:37:31 (+0000), Sebastian Ene wrote:
> > On Wed, Mar 26, 2025 at 04:48:33PM +0000, Quentin Perret wrote:
> > > On Wednesday 26 Mar 2025 at 11:39:01 (+0000), Sebastian Ene wrote:
> > > > Introduce the release FF-A call to notify Trustzone that the hypervisor
> > > > has finished copying the data from the buffer shared with Trustzone to
> > > > the non-secure partition.
> > > >
> > > > Reported-by: Andrei Homescu <ahomescu@google.com>
> > > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > > ---
> > > >  arch/arm64/kvm/hyp/nvhe/ffa.c | 9 ++++++---
> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > > index 6df6131f1107..ac898ea6274a 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > > @@ -749,6 +749,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> > > >  	DECLARE_REG(u32, uuid3, ctxt, 4);
> > > >  	DECLARE_REG(u32, flags, ctxt, 5);
> > > >  	u32 count, partition_sz, copy_sz;
> > > > +	struct arm_smccc_res _res;
> > > >  
> > > >  	hyp_spin_lock(&host_buffers.lock);
> > > >  	if (!host_buffers.rx) {
> > > > @@ -765,11 +766,11 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> > > >  
> > > >  	count = res->a2;
> > > >  	if (!count)
> > > > -		goto out_unlock;
> > > > +		goto release_rx;
> > > >  
> > > >  	if (hyp_ffa_version > FFA_VERSION_1_0) {
> > > >  		/* Get the number of partitions deployed in the system */
> > > > -		if (flags & 0x1)
> > > > +		if (flags & PARTITION_INFO_GET_RETURN_COUNT_ONLY)
> > > >  			goto out_unlock;
> > > >  
> > > >  		partition_sz  = res->a3;
> > > > @@ -781,10 +782,12 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> > > >  	copy_sz = partition_sz * count;
> > > >  	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> > > >  		ffa_to_smccc_res(res, FFA_RET_ABORTED);
> > > > -		goto out_unlock;
> > > > +		goto release_rx;
> > > >  	}
> > > >  
> > > >  	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
> > > > +release_rx:
> > > > +	ffa_rx_release(&_res);
> > 
> > Hi,
> > 
> > > 
> > > I'm a bit confused about this release call here. In the pKVM FF-A proxy
> > > model, the hypervisor is essentially 'transparent', so do we not expect
> > > EL1 to issue that instead?
> > 
> > I think the EL1 should also issue this call irrespective of what the
> > hypervisor is doing. Sudeep can correct me here if I am wrong, but this
> > is my take on this.

> 
> Agreed, but with the code as it is implemented in this patch, I think
> that from the host perspective there is a difference in semantic for
> the release call. W/o pKVM the buffer is essentially 'locked' until
> the host issues the release call. With pKVM, the buffer is effectively
> unlocked immediately upon return from the PARTITION_INFO_GET call
> because the hypervisor happened to have issued the release call
> behind our back. And there is no way the host to know the difference.

I understand your point that you are trying to make the hypervisor
transparent, but it is not behaving in this way. One example is that we still
enforce a limit on the size of the ffa_descr_buffer for reclaiming memory.
Letting this aside, I am curios (maybe on another thread) what do we
gain by trying to keep the same behaviour w/o pkvm ?

> 
> I understand that we can argue the hypervisor-issued call is for the
> EL2-TZ buffers while the EL1-issued call is for the EL1-EL2 buffers,
> but that's not quite working that way since pKVM just blindly forwards
> the release calls coming from EL1 w/o implementing the expected
> semantic.
>

I think blindly-forwarding the release call is problematic and we should
prevent this from happening. It is wrong from multipple pov: the host is not
the owner of the hyp_rx buffer and you are asking TZ to release the
hypervisor RX buffer by forwarding it. Do you agree on that ? I think
like this patch should include this.

> > I am looking at this as a way of signaling the availability of the rx
> > buffer across partitions. There are some calls that when invoked, they
> > place the buffer in a 'locked state'.
> > 
> > 
> > > How is EL1 supposed to know that the
> > > hypervisor has already sent the release call?
> > 
> > It doesn't need to know, it issues the call as there is no hypervisor
> > in-between, why would it need to know ?
> 
> As per the comment above, there is a host-visible difference in semantic
> with or without pKVM which IMO is problematic.

If we apply what I suggested earlier we won't have an issue with the
semantic for this call but it would make the code a mess. I don't think
for this particular call keeping semantics really makes a difference.

> 
> For example, if the host issues two PARTITION_INFO_GET calls back to
> back w/o a release call in between, IIUC the expectation from the
> FF-A spec is for the second one to fail. With this patch applied, the
> second call would succeed thanks to the implicit release-call issued by
> pKVM. But it would fail as it is supposed to do w/o pKVM.
> 
> I'm not entirely sure if that's gonna cause real-world problem, but it
> does feel unecessary at best. Are we trying to fix an EL1 bug in the
> hypervisor here?
>

This was most likely observed from an issue from the EL1 driver (by not
calling release explicitly), it was reported by Andrei Homescu
<ahomescu@google.com>. it appears that we also have to do something
in the hyp about it and we agreed with Will and Sudeep in the previous version of
the patch:
https://lore.kernel.org/all/20250313121559.GB7356@willie-the-truck/

> > > And isn't EL1 going to be
> > > confused if the content of the buffer is overridden before is has issued
> > > the release call itself?
> > 
> > The hypervisor should prevent changes to the buffer mapped between the
> > host and itself until the release_rx call is issued from the host.
> > If another call that wants to make use of the rx buffer sneaks in, we
> > would have to revoke it with BUSY until rx_release is sent.
> 
> Right, exactly, but that's not implemented at the moment. IMO it is much
> simpler to rely on the host to issue the release call and just not do it
> from the PARTITION_INFO_GET path in pKVM. And if we're scared about a
> release call racing with PARTITION_INFO_GET at pKVM level, all we should
> need to do is forward the release call with the host_buffers.lock held I
> think. Wdyt?
>


> Thanks,
> Quentin

