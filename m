Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A999C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PKyiTW7t9VlHIC0Fir8qyHkI243/6y/pnmH8hpJckY=; b=LcS6lh04AIGwA0HskEVgWtsYE/
	05ivUZl2K8w2DWouBuUjIUzrWuRmF0ED3k++iIN8z3K93o5SI740z/nGtg1HaMxqXExJPeu9hQdyZ
	ctkmZNTgBVzdDfl0kN5uLELurFGmxAHi5gbxE0SgiJR1Ua+5T/+0uf27V0KKSWA83i9Ryk0QGkaPe
	HQxLTt7VFk0Zi1I5faQ030GvdVcJWBdQsvqrJv6laZ1lAtW5EL1jiHoBjVnob8B1ROKR56Fc0EwFR
	No235hW1s2ewxH4DDdCBnW0MP8nIKm+9UAdghYdL/lRCywGFrABfWatZxVk4K5sgZbMbugwY1Sddm
	+xSWQcbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCH0b-0000000Bq5P-0RoS;
	Tue, 06 May 2025 12:02:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEVc-0000000BLkU-3pEB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:22:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfe808908so47955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746523358; x=1747128158; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6PKyiTW7t9VlHIC0Fir8qyHkI243/6y/pnmH8hpJckY=;
        b=CBUypQgXCeY/o94BOaDuu4xZ8OVMQ4m4ZcfnXKtxdypwH4ADNSDpFV0CImR67wZpQX
         bWGtD8sBjwW3loRUqstjy5nXGqdvG3MFJhh2+eFQ6tqaY+gukGW+ajWUH6GuwVGTrL08
         3Ua3wVjN0iJfbt/sd86SpdNjBVf2FkniRLXpazq+T9Z1ezXEjb4kZnVPYQeybsiB8SG/
         Hm5RKFR2lBi0E0JEj+T0VJgwvcmueCAySsNxKU2zTObCc83rsbZDMmfGY707C0Vqmjad
         SaEGYCSc6GbdRJK+L3XWQcSuF3+YgPPXJz5fuHX93BF7oxSAToj0rhZFPe3z2n+qF5Qd
         1cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523358; x=1747128158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PKyiTW7t9VlHIC0Fir8qyHkI243/6y/pnmH8hpJckY=;
        b=M+l4Z8PO4Z2jF/1Vc/ZerF5dERL8W7bgLnSJ5xZlIKHNZRVV3qlwMQ5IVaimV+EUgl
         +gdSouzmekT45U99nphGbNqle6R/YTNWwNW10Ay87kV3/uYZBPkbTj+vtwTFZ4MEWvTa
         2TngJXem8aojeu6b88yQG2D8BN8FbOhK1xzjq6KpFXtgYNqncSMYpYwtM6R5pYbtsXQe
         /qBzAPQsq1E32+8MYONiuBF0moJhjNb/O1KLU2a5VnsU4rcHfPAgwMFP09FC9DkM9ek/
         5xZr23rlxMtYscYNPGVdPI/dU5nWwJsAUKINxDMH/G7UglyiBBHweP3bJrSOx3h2/RvZ
         6jKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcTLb6Pp/gXgb451zw3ks7ADrmr1LCVR8Vf3e0cub2/AmqJUHnO9x5iYZ8tW8LqbXAuZlx+M4vsVfbfHCotiIz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8vBa6O/M/pduCBRLKG61XUYBJICltcAuZ+ckiIDNbBObN4EkS
	wql9KF3VZvj4jfTwJJGJmyAtttvdEWovjPXmw9wO2aRoEMuElxTA8d/Hl3eAKg==
X-Gm-Gg: ASbGncsUviX8Jx2s6f/fNPMnIfMWBO4queXw81FbfkEabFm8BhCsrVMzG9m2T1liEZr
	aK4p6FYoNaGJxLLRRRckO5oCH8je2k4JWIEFzW3d6RcuXyqbz2ltFv9AFjjAGUep3DQQL7zxQZZ
	nmIIFVIwMJUGZ9WzpzFLamyE5c5wF7qfeXXkUnTp0bQIo7oOkFcfTynW4ZdM9o8lM6PPxqcPuQ3
	x15vCnzcbcmd1iqOMhBgUV30BOVGkv5JfymnQdVB3B4lx/4XCQDQJYRa8Y7abX0gqDfqAa0F/5U
	rC8oN/UMTMT/7b1Xqnz4zHI3657CtltF1R5c4uQUpQlYEqQSVZrfDYObrrOz/AdNefMxru/jA86
	qXoE=
X-Google-Smtp-Source: AGHT+IHDtwlAgJFzUnwiJ122yccBNhS4YJpQ3qlNsrd7r09OaCmmMYMxQB11yASqxuqK4r8lQg5APg==
X-Received: by 2002:a7b:c04d:0:b0:43b:bf3f:9664 with SMTP id 5b1f17b1804b1-441d123cfd5mr707515e9.5.1746523358264;
        Tue, 06 May 2025 02:22:38 -0700 (PDT)
Received: from google.com (202.88.205.35.bc.googleusercontent.com. [35.205.88.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b287desm208303605e9.38.2025.05.06.02.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:22:37 -0700 (PDT)
Date: Tue, 6 May 2025 09:22:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, qperret@google.com
Subject: Re: [PATCH] KVM: arm64: Fix memory check in
 host_stage2_set_owner_locked()
Message-ID: <aBnU2aXDvznmGU2l@google.com>
References: <20250501162450.2784043-1-smostafa@google.com>
 <86ikmegmw9.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ikmegmw9.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_022240_954329_DEA0F9EE 
X-CRM114-Status: GOOD (  24.49  )
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

On Tue, May 06, 2025 at 09:32:22AM +0100, Marc Zyngier wrote:
> On Thu, 01 May 2025 17:24:50 +0100,
> Mostafa Saleh <smostafa@google.com> wrote:
> > 
> > I found this simple bug while preparing some patches for pKVM.
> > AFAICT, it should be harmless (besides crashing the kernel if it
> > was misbehaving)
> > 
> > Fixes: e94a7dea2972 ("KVM: arm64: Move host page ownership tracking to the hyp vmemmap")
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 2a5284f749b4..e80f3ebd3e2a 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -503,7 +503,7 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
> >  {
> >  	int ret;
> >  
> > -	if (!addr_is_memory(addr))
> > +	if (!range_is_memory(addr, addr + size))
> >  		return -EPERM;
> >  
> >  	ret = host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt,
> 
> I vaguely seem to remember that there was an assumption around
> addr/size representing a single page, and therefore addr_is_memory()
> was doing the right thing.
> 
> Has this assumption changed? Or is this only a figment of my imagination?

From what I see, this might have size exceeding page size in the
following cases:
1- When creating a VM with 4K kernel as the struct pkvm_hyp_vm size
   is at least 0x1130 (without vCPUs)
2- When creating a VM and PGD size is bigger than one page (for cases
   with concatenation as 52 bits and 4K would have 64K PGD)

Thanks,
Mostafa

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

