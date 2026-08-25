Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EDEC61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeanF6wV5Vz38rcMNLwzqqdAl64h6z9Xktwn4H66zlo=; b=T3GW7MjIDYjHIJrwOY5gktPCdM
	gabrJbL7R+x9ZxSyDjtYcJzLPztnMvMqS2x0JyjbimNaG6K3Ra7RhQJPJRYfIxfWd72+CezclDQ1u
	Nx5AqYYQDqhOVbLDL3w9vwfom0CPqxIaJKL3mQYxnldqLH+B35ERiuY3aS+RGdwiKF+S3MGv4AKTe
	yvWZzoyI5vwA+B3Zs5/Jvjw8CfKx3fnBD7jJfjycM9x0lB9vF69E2Y/59Xz/2HlqJmRM0H26l1JR3
	KpSUWXsiSrqtYc7ulRq+64Pe//mPVvJOUb/sP3UXLAz2k6ESvkW3J1Sn4gVfe6idGbw9PPnaXh4At
	lLEYfPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylVa-00000000Haq-2rj3;
	Tue, 25 Aug 2026 07:23:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylUQ-00000000HTD-1SiE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 07:23:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so39168655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787642552; x=1788247352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AeanF6wV5Vz38rcMNLwzqqdAl64h6z9Xktwn4H66zlo=;
        b=jAN91jgciZEB2WhCHlibB925eDBqcnouGhIDdadL1ii2KxsfyO1g/kuRm2I63nc3PU
         Cx/hpeQq/rkjvuzUz2tTAJB/e6N9wVFAskEflGy4pMSRNBi4EHVUORMotK/yAQq38BVR
         NdoMXL/4jkHh29pbI2VK3hhHaa8GVqXIS56eLINRhENO2dUyQLcyPDg6rl/wpkkZZb9g
         1hxoBvF7U968KYTpJjDqZDueLuQvz5uvBg6GSrVa3rPKwtBn9iKQ3Fo8eirggrGYvzeQ
         3BIs1mdNMcVG8+CMZZAbPojReGfxvyi/N8eUDFE8MooUcPRC5wrb7QRvJLqFkhuMU543
         ACCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787642552; x=1788247352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AeanF6wV5Vz38rcMNLwzqqdAl64h6z9Xktwn4H66zlo=;
        b=baSxHXBX10ctKV3yp4Af4bzA95Bel7aPzzTg1jlVBXS7cytnI9Fd7Ly26cO5v1ETf3
         zgIVCGRHnuJrjHl+z/DDLBvBW6FQeCm98NtPx7nufxip3q8ccPRIFB5ZQP8LhqrwEcYo
         O5iHZUlMAWkGPCMdOARd3EUHbr5Y2KQnc+z7iy4LeA3QY/eKVO/HlpZnywhTWnRpve4y
         qoLMdgbioZD3vGtbByV2vNycGrJbkz9ONJUM2ShC4kqzU11vSFOtptgGqaKCd2Uy5S5I
         +TLhxyhfax9Y+bAdo93tWTO/UDDXg6EfefDepXOasOxm38C36kobPFhc1exuIkPKiImP
         V/4A==
X-Forwarded-Encrypted: i=1; AHgh+RoSiomTd86txJKiGOFDvAEs2h94fQmRizCaczffAjnW7arGe5OBRKh8GBrcZ79yr/lDTKEEZj6vXBo97hewNFSK@lists.infradead.org
X-Gm-Message-State: AFuF++kTcR9ZliFdR8DpTUc/YiGfaQ96HXGxCKV4+V2lCaQ39bdUM5i+
	/wtuhpGkNo4XSNG/No53zTt/8r2gyEtwSMzev3Y0YOMJ2ja95kvUWZrPiPdnkmH6FA==
X-Gm-Gg: AR+sD13XGamNH/2OUU0i9K0sHY1vYo8xRWC7ezZdxJFQUtieywNUW7RsZHaBu0ORBG+
	QLoGQj33YM7a8ldnqPNrUgrYB2SrCrnscv14Qzii9q08sa/ozN6X1qdkTWC0FF8WKcpzbjkUyNq
	khukCBFnOGp+HjqurosyB7ZnINg2hbxVvrPJAZ1OCZUhXz4FzvhpiaONWznwJknBquxZhjzzb1B
	Hhp/GVBFcIVnyT7oz2P9/5Q7LFOEBBYZoh+mDi4K0a6vo5msKQdvgQLTcuSyCtcOg0gRFDZ8zhn
	4N4UbeBLM2FdzFAGWCp1sgd7X1ENjsvj8LQea1u5qfwBPW2M016Ox/bDYAPGYPg/l9OUsjhKrA/
	F2wq+JI44TiCmmJ7qJWUz3Kajtj0hb+znq2wA6sVItkgYpVjyWWEKASjYUgyYZpGnH7uY8UnIA0
	Ghr0wxkIYTt98NSn4eslxOZ1c43+61vVVDoZCrz8hWVqCsPTlgO2M8IsiRH0BqbpM+G/dzYsffS
	6q6tyGxdHL/crby5d7OZ3Kr5AkPKNWX
X-Received: by 2002:a05:600c:6088:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-499c19977e0mr323691785e9.3.1787642551487;
        Tue, 25 Aug 2026 00:22:31 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d638fc8esm18764925e9.11.2026.08.25.00.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:22:30 -0700 (PDT)
Date: Tue, 25 Aug 2026 08:22:26 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v4 10/17] KVM: arm64: Add a shrinker for pKVM
Message-ID: <ao1CspwFUHyhj0dE@google.com>
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-11-vdonnefort@google.com>
 <CA+EHjTxU2GCpSR587oR_EaMOvXfu+teCnfC2KCg=vpOtf4sgRA@mail.gmail.com>
 <aoxzjag7xr_emuvX@google.com>
 <CA+EHjTxraCfN1bfZ9ygRiyxxyEPeHw4mg6f6O0qzPBpFi165Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxraCfN1bfZ9ygRiyxxyEPeHw4mg6f6O0qzPBpFi165Qg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_002234_452520_A69B5A1D 
X-CRM114-Status: GOOD (  31.87  )
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

On Mon, Aug 24, 2026 at 07:10:37PM +0100, Fuad Tabba wrote:
> On Mon, 24 Aug 2026 at 17:38, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > On Tue, Aug 18, 2026 at 04:28:38PM +0100, Fuad Tabba wrote:
> > > Hi Vincent,
> > >
> > > On Fri, 31 Jul 2026 at 15:36, 'Vincent Donnefort' via kernel-team
> > > <kernel-team@android.com> wrote:
> > > >
> > > > Integrate the pKVM memory reclaim interface with the host's memory
> > > > management subsystem.
> > > >
> > > > This allows the host to automatically recover unused memory fom the
> > > > hypervisor's heap allocator when the host is under memory pressure.
> > > >
> > > > Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> > > > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > > >
> > > > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > > > index d28422f5c3d6..bfbb1266491d 100644
> > > > --- a/arch/arm64/kvm/pkvm.c
> > > > +++ b/arch/arm64/kvm/pkvm.c
> > > > @@ -115,7 +115,7 @@ static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
> > > >         return ret;
> > > >  }
> > > >
> > > > -static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
> > > > +static unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
> > >
> > > This is the first caller of these, so it is where reclaim starts
> > > running against a concurrent top-up.
> > >
> > > Nothing marks the pages a top-up just put in allocator->mc as spoken
> > > for, and hyp_allocator_reclaim() ends with an unbounded drain of it,
> > > so a shrink with target 1 hands back the lot. Land that between a
> > > top-up and the retry it was for, and the retry asks again, and
> > > pkvm_call_hyp_req() goes round.
> >
> > Sorry, I am not sure I follow here.
> >
> > IIRC, the shrinker will only reclaim half of what is available. So the pressure
> > should be proportional to what is available and limit races with topup!
> 
> It's the ordering, not the amount.

Do you think we should first try to reclaim from the mapped pages before
draining the allocator->mc? 

Mapped pages are more valuable hence why I have started with allocator->mc.

But, it is true it might make sense. It is unlikely to have pages left unused
into that mc. If that mc has been topped-up that's because it is about to be
allocated from...

> 
> topup and its retry are separate hypercalls, lock dropped between
> them, so a shrink on another CPU can slip in, right? .
> hyp_allocator_reclaim() drains allocator->mc, where the topup pages
> sit, before any chunk, so half still comes out of them first: a target
> of 1 fails the retry.

I do not see where a target == 1 fails.

> 
> >
> > However now looking at it. I wonder if I don't want to ratelimit here the number
> > of pages reclaimed in one go to limit the time spent at EL2. Especially we do
> > all that with the allocator lock taken...
> 
> Ratelimiting would cap the time under the lock, but it wouldn't stop a
> concurrent shrink from taking the topup pages, would it?

Yes, my only intent is to avoid blocking at EL2 for too long.

-- 
Vincent

> 
> Cheers,
> /fuad
> 
> 
> >

[...]

