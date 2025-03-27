Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7717C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 09:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIotJVVBD3/NnOnKPh1r2ow/aFL293MuBe0NVckPSv8=; b=Y2tdkU3EXh6zjBVC2xChKT4byO
	2HGGBhY979Iwy1G+dzWJmdFkUznK9J0UZLNG9IX/skJi0XFjpPqRp+Z4bsQN1TY/qNwgmkpr3koqI
	bFKh2LHP9wMUhhTD31/aIvS/aFvAGfftqO2SodkAd2aeqohXSjFsRIVOllixQXMaABxs7RA2lqrwH
	u5uB+DzdK/139KinhZtSQ8aInyp4jd6OCnDoSirycZ0eZ8xKiU5K5yqtwx1tCf0X8lIQJKPJ6OCmR
	wu3jrRvUa6+0cU/miTqDj+u4jxBJ/rX1TQIT9S7tAvT1TBt87LO6vt0HDTichJM/NUvf/eOVJgBNf
	Pi8NceaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjhx-0000000Ab5H-0Zdr;
	Thu, 27 Mar 2025 09:39:29 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjgE-0000000Aavn-0mSu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 09:37:43 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2240aad70f2so184235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743068260; x=1743673060; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIotJVVBD3/NnOnKPh1r2ow/aFL293MuBe0NVckPSv8=;
        b=0FwHNUxh2frZauR9+i9e+WCfWEL6Oi89ANi9FT1ag5taFvXzyNdZCmO8Exm1wiaAkS
         pVKsN2fzzjjKM4/bhstMt5BFcDnZHli38MjJ3/8ZuYNrfQ+/MZ30lcB+9oo3liHaAerY
         L+cbONGxa0zoxbgpQy7CYvqbjiY0Y791Bjk8AFSPd4aSwiGUDC+XXfwT9uenDRRnczFH
         3U+rJX/PALNTNstWwxjd+NLQZGkeZAvaMiBNm1iqXq8GN5eV76r9jQNKW8zfdCMeAb2k
         oiW+KnQGbiAhFhtTdCis+ADs9o7fc+JleQN5LaSI3F3gqK7tF1Ei3tdVbt45idURGsdc
         EL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743068260; x=1743673060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIotJVVBD3/NnOnKPh1r2ow/aFL293MuBe0NVckPSv8=;
        b=YKJ1zOFnXfikpP4ivR9+g0oT0mHbTjMz9LvQfxejhaul1VviRwbAikiqvlJjd6qOnk
         ZpxVuIAoAZKp8zJwyHj+gi3fXyQaZrjGcmLqQ6guZafEBEMrvVh149nTZgc8anSLwdks
         uuTiGjLkvcs9QE9oua3C9HPlOVW+99Qahqwl1/N7B8etEv+EEXX0d92TE/xwVmJ4RnA6
         2Drl3IhegS7lLCCxmndYYKvsskTtPg6dw9k5CptqxF4/aHLPnPpLjHD3Y7T0naOeVglw
         uKJbYoEf6lILas+6AlRUHg7NF7fFGop0JRmAKlZ/UBcnei/14GZvh42sDvX+B6Y9rfAD
         f8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeMUGxJX7xOwXYnhHjt8D2GmVtocQ9Vp43S6bZ+gLMqrEw5Twsx6hNU2vIopA9010BLgKnzQnWw6CfFh/QBOMC@lists.infradead.org
X-Gm-Message-State: AOJu0YxtRhFfmot211IeBykECsTtZmfYwgjkIWsoHDtwaO0TkagNO6hT
	3AtYTMt+S83tpSq42jC9gMJ28NbDHM3avCu741/n+3UwNmuwXSKKwdQozo2TJA==
X-Gm-Gg: ASbGncsle0Dnwxhmy/Eg4vP4zBWCO5qRocwNqmwlxKd5IbYQE+7/4gzop0nYczDy1nQ
	56Gh4Wo0Q8R93WZJgrAnmOjSousbQI28cc1kaNqgRmgWeXCadomvJ7sDHRgtOStbHEcbIY587lU
	kyr0ujEM0B/MSQSQLihFIIbr0gBT9izhlWoY9kfVXIVZelpqG2OyhrlWc2xScAf9YLU5aq1uoIB
	WLdHMdeUNGIfnR/JmkiYq+PTRfysqhawlEnVWay5WBZ6BayXJamgKfZ8wucHm0TfAy/b322CCDQ
	Rt7e36ugTgsiHIyZmeO25srJAwfeJ7zD6NU15jGZxkdFY3cnMCVcfPoZPSUre1JkEwgG+au8LoF
	TJHddZPXI7kjeBjIZ+l2J
X-Google-Smtp-Source: AGHT+IGB0Vi5pWlDgQqZ4uKyMwBPu6nja3HHv+BqBDGefnFIarUTyd7UM+7yrEZbE7LmEsV4/0FJxQ==
X-Received: by 2002:a17:902:f645:b0:223:f479:3860 with SMTP id d9443c01a7336-22806dd46f8mr2324225ad.18.1743068260152;
        Thu, 27 Mar 2025 02:37:40 -0700 (PDT)
Received: from google.com (28.140.38.34.bc.googleusercontent.com. [34.38.140.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73907b36bfasm13626302b3a.2.2025.03.27.02.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:37:39 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:37:31 +0000
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
Message-ID: <Z-UcW32Hk6f_cuxc@google.com>
References: <20250326113901.3308804-1-sebastianene@google.com>
 <20250326113901.3308804-4-sebastianene@google.com>
 <Z-Qv4b0vgVql2yOb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-Qv4b0vgVql2yOb@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_023742_230158_C17B83C6 
X-CRM114-Status: GOOD (  29.64  )
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

On Wed, Mar 26, 2025 at 04:48:33PM +0000, Quentin Perret wrote:
> On Wednesday 26 Mar 2025 at 11:39:01 (+0000), Sebastian Ene wrote:
> > Introduce the release FF-A call to notify Trustzone that the hypervisor
> > has finished copying the data from the buffer shared with Trustzone to
> > the non-secure partition.
> >
> > Reported-by: Andrei Homescu <ahomescu@google.com>
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 6df6131f1107..ac898ea6274a 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -749,6 +749,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> >  	DECLARE_REG(u32, uuid3, ctxt, 4);
> >  	DECLARE_REG(u32, flags, ctxt, 5);
> >  	u32 count, partition_sz, copy_sz;
> > +	struct arm_smccc_res _res;
> >  
> >  	hyp_spin_lock(&host_buffers.lock);
> >  	if (!host_buffers.rx) {
> > @@ -765,11 +766,11 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> >  
> >  	count = res->a2;
> >  	if (!count)
> > -		goto out_unlock;
> > +		goto release_rx;
> >  
> >  	if (hyp_ffa_version > FFA_VERSION_1_0) {
> >  		/* Get the number of partitions deployed in the system */
> > -		if (flags & 0x1)
> > +		if (flags & PARTITION_INFO_GET_RETURN_COUNT_ONLY)
> >  			goto out_unlock;
> >  
> >  		partition_sz  = res->a3;
> > @@ -781,10 +782,12 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> >  	copy_sz = partition_sz * count;
> >  	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> >  		ffa_to_smccc_res(res, FFA_RET_ABORTED);
> > -		goto out_unlock;
> > +		goto release_rx;
> >  	}
> >  
> >  	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
> > +release_rx:
> > +	ffa_rx_release(&_res);

Hi,

> 
> I'm a bit confused about this release call here. In the pKVM FF-A proxy
> model, the hypervisor is essentially 'transparent', so do we not expect
> EL1 to issue that instead?

I think the EL1 should also issue this call irrespective of what the
hypervisor is doing. Sudeep can correct me here if I am wrong, but this
is my take on this.

I am looking at this as a way of signaling the availability of the rx
buffer across partitions. There are some calls that when invoked, they
place the buffer in a 'locked state'.


> How is EL1 supposed to know that the
> hypervisor has already sent the release call?

It doesn't need to know, it issues the call as there is no hypervisor
in-between, why would it need to know ?

> And isn't EL1 going to be
> confused if the content of the buffer is overridden before is has issued
> the release call itself?

The hypervisor should prevent changes to the buffer mapped between the
host and itself until the release_rx call is issued from the host.
If another call that wants to make use of the rx buffer sneaks in, we
would have to revoke it with BUSY until rx_release is sent.

>What would otherwise prevent that from
> happening?

> 
> Thanks,
> Quentin
>

Thanks,
Sebastian

> >  out_unlock:
> >  	hyp_spin_unlock(&host_buffers.lock);
> >  }
> > -- 
> > 2.49.0.395.g12beb8f557-goog
> > 

