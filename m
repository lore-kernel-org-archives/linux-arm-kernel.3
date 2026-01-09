Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DE1D1A63D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PnH1kznkVXMxfKGNOYS4D3+d5D2CLopDWhz5IX94ds=; b=XH/aNJhM7KjIYJYreC5BiIfI1n
	rqqWQ0Bs9hyYseTxHC4SYlOKHtm471GY8dK2t0l/w8yFArlr6sjHzvl00Yj5XwSi1YTj3ZQNxQdnh
	6ExrvEYmrwQhkOQ4tIYMi5KVmE/7VNiZpqWi84HWQEPm4zNWNHYUrjJuy9xmc/XMmjtE+yKm5aaZP
	dIC5cxCqNDqQ4iQKJBC3CsiHZVL7s8g/HI1THrGudoDJt6Lua6l3S3tC3C2Y1ffISojx0SRHESIsE
	eAqa9AISrZ3TqGG72kECCY+y8GKK/ZoMNuB+Jk/oL4qf0VrsUE2S4Ma46YZpUw8oC9cWNRsqKIoVa
	uEe/8UiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDw5-00000002RWL-1Xi3;
	Fri, 09 Jan 2026 14:57:57 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDw1-00000002RVo-43L7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:57:55 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so3947079e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 06:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767970671; x=1768575471; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0PnH1kznkVXMxfKGNOYS4D3+d5D2CLopDWhz5IX94ds=;
        b=OnKeT9TOuiY/EJoKV3mLjlhuHHMp5Ll8woGxE8+lk07h1pfAnDN1jk6aL33H96GN+O
         lkxjna6YLbE13aknV1U/DPjTjIXNxwych5IhKFf9K0RhMb7vx50QbB5k2Gzk5YLf7J9+
         ESb6YEAzE8WgSTyhsJhJk5g7vTx1WOjaAiLonfwmLgBSkgqlWKXcxJ2mbQ0ZgZNjsH2J
         T4fu2Rr/Ep3QSyjNQSxXZr4uQlP7n35Sc/E2/ifF51VfKifognVGivDzPgYpVuznS92Q
         queCSVTBvO8m+OAOHBNiotxqQrE6aC+V8HNt+eN7BTnkyun9At7QKpxFIPjLODzrn3hM
         0keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970671; x=1768575471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PnH1kznkVXMxfKGNOYS4D3+d5D2CLopDWhz5IX94ds=;
        b=QICN2bz49E6wJfgdSpQt2cC2zEO8CD3RjFciLt4NM5DZWyiKzhWamNBDunATvweHjO
         jgzpUivccIUVtnCt7TEzNs4AXhYbx6a3aEKABiAPIjh0j5QuAqa30MmbIBT48rzbMZjJ
         5Ybz5j1CY7GARRQbWf9GpCzaISIU8wNUxN35bqLOYTRMqlqUziUcvWjc/siN6o3wjmhn
         CuHeMIOD9c8BOAOS9Nq+s9Gp3OoOotc4YdQRYP82ymJVKeooVHdraafqt5xRkXcsdKej
         akYiRvaBr+QE8SvK/yZrCn4YIN6n4JB+tDYVlcJ1pqg7AiD71LO8uC/uOUbMYjewcgQ0
         d0fw==
X-Forwarded-Encrypted: i=1; AJvYcCWNDSXzh6zIKMgoNBWBhRoDKbIAO8oiK72OUIokGW7Ui/RPJB3mjw8VEskTlvon9ys9oV5RbfttxxdFqS57sWcH@lists.infradead.org
X-Gm-Message-State: AOJu0YzC0+64eK1p8O0e14wPP6kiC9xg/Yt5S3cDVc2qGsklypoaoimP
	v/AVqNj1Gsl0PKC18AGSltr3RcbfdIy9O0VCi1nXWwlUjB9d2uMp9YrwbF8rubfxNQ==
X-Gm-Gg: AY/fxX58FDq/S8qtdcDqjnM5EGk82JlTJC/UUOt2HKnPFk0OrhlR0nNikhZ+YGoodaj
	LMd4fn4F3yxRKXF/JSUqibVXq1s+WYOcZQd+HH+5xDpDkTf+QamabRKTyUj2d8ZiCLloWQecoha
	Itot6s/GmDTfaQeFGUg07bx9OEyhF4kao6jXG78JjngRHUJjHXUdTATI5RAdT5U3P8WKkP8vJ0f
	uM3Y5WhgNcB8H24vdMzPrpW2mqiTrO4ZTDiaOFsrIN3IiY+K8G0pvWSmsnkmYf+uo4OKxD1zN+l
	jw7B/DrnDVKmfQ6Xf1T7r6nHg+lk6y4M1HTJqzxHdKotZEb0FxTybqySNuVwP+qQkN6fsSWiUIh
	CEQCp3jpWxpokduW8qg67DN7eqkGwxfP5lcrJUg4cmUsx+t/8p74L3TNV3FLMXvpk1W4rc9Uhcf
	JbCqGa6IPUomCv2/VZkzqrntWrm28itXVV8AofCBLRxDwuRh/A
X-Google-Smtp-Source: AGHT+IGe9QuDt1/NJDvUYE/tjx2via43ds8qBVHWx3t/0Dqv3eSdih6PDSJnuV+jJVbn7hXnVy62Fg==
X-Received: by 2002:a05:6512:68b:b0:59b:79e8:248d with SMTP id 2adb3069b0e04-59b79e826aemr1791074e87.38.1767970670434;
        Fri, 09 Jan 2026 06:57:50 -0800 (PST)
Received: from google.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7a50c7sm23096221fa.15.2026.01.09.06.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:57:49 -0800 (PST)
Date: Fri, 9 Jan 2026 14:57:46 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 14/30] KVM: arm64: Hook up reclaim hypercall to
 pkvm_pgtable_stage2_destroy()
Message-ID: <lbidorn37ndyu22bg4zjbcqcsrmbyrakcqml2yts4z6uriyno2@ftmjy7dguf6g>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-15-will@kernel.org>
 <bc246bvbf3cg7scut2dcey7tynxqzclyceqv4hhooqacsdzti7@hcaqfbnvebt2>
 <aWESTd5Scyna_3nc@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWESTd5Scyna_3nc@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_065754_024330_1AB0D140 
X-CRM114-Status: GOOD (  25.64  )
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

On Friday 09 Jan 2026 at 14:35:57 (+0000), Will Deacon wrote:
> On Tue, Jan 06, 2026 at 02:59:19PM +0000, Quentin Perret wrote:
> > On Monday 05 Jan 2026 at 15:49:22 (+0000), Will Deacon wrote:
> > > During teardown of a protected guest, its memory pages must be reclaimed
> > > from the hypervisor by issuing the '__pkvm_reclaim_dying_guest_page'
> > > hypercall.
> > > 
> > > Add a new helper, __pkvm_pgtable_stage2_reclaim(), which is called
> > > during the VM teardown operation to reclaim pages from the hypervisor
> > > and drop the GUP pin on the host.
> > > 
> > > Signed-off-by: Will Deacon <will@kernel.org>
> > > ---
> > >  arch/arm64/kvm/pkvm.c | 31 ++++++++++++++++++++++++++++++-
> > >  1 file changed, 30 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > > index 1814e17d600e..8be91051699e 100644
> > > --- a/arch/arm64/kvm/pkvm.c
> > > +++ b/arch/arm64/kvm/pkvm.c
> > > @@ -322,6 +322,32 @@ int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
> > >  	return 0;
> > >  }
> > >  
> > > +static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64 end)
> > > +{
> > > +	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> > > +	pkvm_handle_t handle = kvm->arch.pkvm.handle;
> > > +	struct pkvm_mapping *mapping;
> > > +	int ret;
> > > +
> > > +	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
> > > +		struct page *page;
> > > +
> > > +		ret = kvm_call_hyp_nvhe(__pkvm_reclaim_dying_guest_page,
> > > +					handle, mapping->gfn);
> > > +		if (WARN_ON(ret))
> > > +			return ret;
> > > +
> > > +		page = pfn_to_page(mapping->pfn);
> > > +		WARN_ON_ONCE(mapping->nr_pages != 1);
> > > +		unpin_user_pages_dirty_lock(&page, 1, true);
> > > +		account_locked_vm(current->mm, 1, false);
> > > +		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
> > > +		kfree(mapping);
> > 
> > Nit: this might take a while, worth adding a cond_resched() in here?
> 
> Commit 4ddfab5436b6 ("KVM: arm64: Reschedule as needed when destroying
> the stage-2 page-tables") breaks the destruction operation up into
> chunks so we now reschedule from the caller in stage2_destroy_range().
> 
> Do you think we need an additional reschedule?

I would intuitively think so, but I've also just realized we already
don't have that resched for np guests, so this patch is absolutely fine
as-is.

It's just that knocking down a whole 1G (assuming 4K pages) will be
significantly faster for normal KVM than for pKVM. It's one call in
pgtable.c with possibly a single deferred TLBI vs 1 hcall and 1 TLBI per
4K page. But I guess this is really performance tuning, so this can
always come later. Feel free to ignore :)

