Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E6AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 11:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQBUB18mwX4A4xTotkHj/u2lOJW8/CY/92F1uJiGKg4=; b=HTWhdvoT1RBb7GK92u3+fHGA98
	K/ExZRC14TaAz/v5LVvpdXZ+f5Wt5aTxCwGs10c3oyy89K1bULDIV6WPRW4DS41dGyrWxBYWHsj1Z
	dVV9DQEi+QiLKcY2P02YRKWhmETi8WYLaRus8L2rKMwcU6eUJt3kGSqlgaSNi8q0JI9lDnm0T0YgU
	dsQvVpbyggpQrz9Ai+I7i3mlj8tPVSFU9dPFM9anFzQAmF9Uj5uwxPP6z1MGFysA24ehH8bHwNAw0
	QwrP3/ZAJbLu4QSa6b9GP9Z7Aw9k2/C5w1k1H6Yjqx6RXCaI2KE18A0geSKtY5TAsHjH37Lb3NxLU
	oCBtTNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty85k-0000000DFgF-1sSM;
	Fri, 28 Mar 2025 11:41:40 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty840-0000000DFV1-1jL7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 11:39:53 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so2810373a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743161990; x=1743766790; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KQBUB18mwX4A4xTotkHj/u2lOJW8/CY/92F1uJiGKg4=;
        b=mX415jFBcJS4Uitiur3Y4P8I7Wf3w6TTBkE4IChmBwnIMZuXtOEA5hTJ+1n+rruPVy
         wP+4Uv2olP32TB4alev30X0NojZOI6woiEevy+oyq3WsTglGyCapV16yOvNKzx0gGkqa
         8gaNcmbcQ8VaaH7vQrngg+jh0a3hg2Z21MjRFedzz7EKEVJKToa7FHvjZ9I4zoDDDPeF
         rg99iDQNLOHptoLsWp9rDWNScH1YKMXYyLXdnmDk05TbSJQEK98z7wBfEAHjBOuaWFFB
         BFiVAAFCNK92QnIezXL9KvqGjX4CqnnFwNRVTP1+40ciiAR5GnUKz9QBtV2+pBCpwfDW
         xZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743161990; x=1743766790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQBUB18mwX4A4xTotkHj/u2lOJW8/CY/92F1uJiGKg4=;
        b=h1awiX22/4eSn+Oo3SyBSxRwfOCXiwuh1eud5ixu05Fcd3yRbMw2lEqIODhwneTDE7
         0NJzjnW2PN9v40pR546SFnDXImv/T6xoiFwG1P8lFZbtJnwh7ft+WV+pBfEbdm9p2gnq
         +UNl+AK9pu4aefpd+D4tNWV4ImydFa9tCMrGGg04fb8UucVLOovQmjGpvuBOnbBRsJlK
         ROW99GPwdbFYMYhV/jyYf+4v6cIuuLUj9AM3K/6l90ew0HSmQ/+ztjP6/XAz5iOX6FGp
         X3O2HvXWFN8NTMYx24UG3OnUIlWhhgvIoFsVl4VfAb0Jikx3HEHRsHIoOlfKfq66zWzb
         6t+A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ41+EfMB+quw5B1kaWZTPmmP0gWZDay30AB+i8Xlq831QOi8ZheZKmFRsAABWPHTPc97+W6/E53nsZiGereFf@lists.infradead.org
X-Gm-Message-State: AOJu0YzXvKJzRzxkuF7tYxMiJ9M9GlHa36373kbJG4pRmwgaD5DTBtV7
	T4NQZcz/DEi2NlVHhOxeDIVkpOqLYrVc1+ks7VtdXgyu8bSaxlslDkbyP9waEA==
X-Gm-Gg: ASbGncsTpsZfr9MYIdsc/yARqogOOSoPfKnjCo/gEQnbLT4k7sxMpuwiyuQElpRZllE
	sLu6OL7yyw6oZE+Fuh5gJimSvdsxFPeEfrPSVEyzmq0DNYtDjoZpJRJsaVhAQSJRu6GQqf6nGdH
	6VQ6Eh6pgdDhlD498yicAGX7u70chXz4XAdjkOS7dWIv9QkkH5MiUgGz1vafiYbWsQYfYSWeWtG
	KGJgOl38aUpOxMc/WtDQcbkE3U+NLICven6jMygq1sA4lnUEBSBH34bpKCyBXPaagquLt4fx5QP
	W8fAOrup0A/OnhqEfDuS086kINA/aQt/fx9dz7xheEGnKTL/hj17uHYUeOK+qkUPvZlE30CMpUt
	ynPc=
X-Google-Smtp-Source: AGHT+IGeYnm3vDHFpDSraEUf3HzDe65CWmKu1pd5dHmjPuvRy1baA8IV5n1Oel5kP1U7FdthFEYd6A==
X-Received: by 2002:a17:906:6a09:b0:abf:6f87:c720 with SMTP id a640c23a62f3a-ac6faf0959fmr756376266b.29.1743161989773;
        Fri, 28 Mar 2025 04:39:49 -0700 (PDT)
Received: from google.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719621b73sm145729266b.120.2025.03.28.04.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:39:49 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:39:45 +0000
From: Quentin Perret <qperret@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	will@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH v4 3/3] KVM: arm64: Release the ownership of the hyp rx
 buffer to Trustzone
Message-ID: <Z-aKgXVjp4nNJcLd@google.com>
References: <20250326113901.3308804-1-sebastianene@google.com>
 <20250326113901.3308804-4-sebastianene@google.com>
 <Z-Qv4b0vgVql2yOb@google.com>
 <Z-UcW32Hk6f_cuxc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-UcW32Hk6f_cuxc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_043952_470203_676BE3C3 
X-CRM114-Status: GOOD (  45.29  )
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

On Thursday 27 Mar 2025 at 09:37:31 (+0000), Sebastian Ene wrote:
> On Wed, Mar 26, 2025 at 04:48:33PM +0000, Quentin Perret wrote:
> > On Wednesday 26 Mar 2025 at 11:39:01 (+0000), Sebastian Ene wrote:
> > > Introduce the release FF-A call to notify Trustzone that the hypervisor
> > > has finished copying the data from the buffer shared with Trustzone to
> > > the non-secure partition.
> > >
> > > Reported-by: Andrei Homescu <ahomescu@google.com>
> > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/ffa.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > index 6df6131f1107..ac898ea6274a 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > @@ -749,6 +749,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> > >  	DECLARE_REG(u32, uuid3, ctxt, 4);
> > >  	DECLARE_REG(u32, flags, ctxt, 5);
> > >  	u32 count, partition_sz, copy_sz;
> > > +	struct arm_smccc_res _res;
> > >  
> > >  	hyp_spin_lock(&host_buffers.lock);
> > >  	if (!host_buffers.rx) {
> > > @@ -765,11 +766,11 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> > >  
> > >  	count = res->a2;
> > >  	if (!count)
> > > -		goto out_unlock;
> > > +		goto release_rx;
> > >  
> > >  	if (hyp_ffa_version > FFA_VERSION_1_0) {
> > >  		/* Get the number of partitions deployed in the system */
> > > -		if (flags & 0x1)
> > > +		if (flags & PARTITION_INFO_GET_RETURN_COUNT_ONLY)
> > >  			goto out_unlock;
> > >  
> > >  		partition_sz  = res->a3;
> > > @@ -781,10 +782,12 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> > >  	copy_sz = partition_sz * count;
> > >  	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> > >  		ffa_to_smccc_res(res, FFA_RET_ABORTED);
> > > -		goto out_unlock;
> > > +		goto release_rx;
> > >  	}
> > >  
> > >  	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
> > > +release_rx:
> > > +	ffa_rx_release(&_res);
> 
> Hi,
> 
> > 
> > I'm a bit confused about this release call here. In the pKVM FF-A proxy
> > model, the hypervisor is essentially 'transparent', so do we not expect
> > EL1 to issue that instead?
> 
> I think the EL1 should also issue this call irrespective of what the
> hypervisor is doing. Sudeep can correct me here if I am wrong, but this
> is my take on this.

Agreed, but with the code as it is implemented in this patch, I think
that from the host perspective there is a difference in semantic for
the release call. W/o pKVM the buffer is essentially 'locked' until
the host issues the release call. With pKVM, the buffer is effectively
unlocked immediately upon return from the PARTITION_INFO_GET call
because the hypervisor happened to have issued the release call
behind our back. And there is no way the host to know the difference.

I understand that we can argue the hypervisor-issued call is for the
EL2-TZ buffers while the EL1-issued call is for the EL1-EL2 buffers,
but that's not quite working that way since pKVM just blindly forwards
the release calls coming from EL1 w/o implementing the expected
semantic.

> I am looking at this as a way of signaling the availability of the rx
> buffer across partitions. There are some calls that when invoked, they
> place the buffer in a 'locked state'.
> 
> 
> > How is EL1 supposed to know that the
> > hypervisor has already sent the release call?
> 
> It doesn't need to know, it issues the call as there is no hypervisor
> in-between, why would it need to know ?

As per the comment above, there is a host-visible difference in semantic
with or without pKVM which IMO is problematic.

For example, if the host issues two PARTITION_INFO_GET calls back to
back w/o a release call in between, IIUC the expectation from the
FF-A spec is for the second one to fail. With this patch applied, the
second call would succeed thanks to the implicit release-call issued by
pKVM. But it would fail as it is supposed to do w/o pKVM.

I'm not entirely sure if that's gonna cause real-world problem, but it
does feel unecessary at best. Are we trying to fix an EL1 bug in the
hypervisor here?

> > And isn't EL1 going to be
> > confused if the content of the buffer is overridden before is has issued
> > the release call itself?
> 
> The hypervisor should prevent changes to the buffer mapped between the
> host and itself until the release_rx call is issued from the host.
> If another call that wants to make use of the rx buffer sneaks in, we
> would have to revoke it with BUSY until rx_release is sent.

Right, exactly, but that's not implemented at the moment. IMO it is much
simpler to rely on the host to issue the release call and just not do it
from the PARTITION_INFO_GET path in pKVM. And if we're scared about a
release call racing with PARTITION_INFO_GET at pKVM level, all we should
need to do is forward the release call with the host_buffers.lock held I
think. Wdyt?

Thanks,
Quentin

