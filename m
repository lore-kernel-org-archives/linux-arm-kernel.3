Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5830C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JS/PGpJuLiY1jK1+omSpEY0K0qqk3DR8rQ10j7BYGLY=; b=O+QH6t7tGefFH2JrIbvDlkvYjn
	PA2LCT3EycmqVo5vmxb59HGkzsR56upeu84wPwXqqNZpbQjFflZdw7Hu+dZQ29T3WwI4+W3Eed5KJ
	U2XWMoX2nwRlWXfIulrEQQqwngt6c/xjA4BBAUQBV/8Bkr678NqRr4QlZyMSs+hTZZL4nzgFC4NuX
	Yp/HGTAN0IKmjC0ik+uPIqQOoEX6/zDppU0IZ/GFu3YjFHl5fvmomSCOnpvWqw21WB+KCqfgICOZL
	pL8HdlNomRsxcKpq2dL+nNoZwHnYWk00TLH32mMvNoTa1aR/Hto+feTTd8XM9x1NzUzIAv8yewMZ4
	yD9ph9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GpP-0000000Bctx-0KdX;
	Wed, 09 Sep 2026 11:50:59 +0000
Received: from out-122.mta1.migadu.com ([95.215.58.122] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GpL-0000000BctG-0zuo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:50:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=lhd4O74gwsv5JUZ/uKSFuctonDDlwjfg2EWm9I6bTEE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788954651; v=1; x=1789559451;
 b=nXmrx6hwuiZGIj2p09oVpWNf1UKQTt9ekvrofgLz5VEQS5BJUrCOHl2zTQww8BwivRjqHsJj
 cH1wRSNIOzp6lTWWHYiBx5y2q8/u5tvV9eXNmh8xJaUoLw938QJM0l1URPbwpZ2AP+K4hMsGRJF
 IEaueHwmrGPyJ68+/C1ten6k=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 568a2c91ca0c464d;
	Wed, 09 Sep 2026 11:50:51 +0000
X-Mizu-Trace-ID: 568a2c91ca0c464d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so6020e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 04:50:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6pytd/2BKj7umIRT9M6YX2aAz1CkJ7d6UJ2Ir6UqBAypTKTnaInrXO/lMozJAe32D+b4K+x8Ia0BecjfnK0mw@lists.infradead.org
X-Gm-Message-State: AFuF++nIYNKMotqVAEiZbkUNB0AawX2fjk4xskykfLBSecjv5tv8B8xq
	doBPSIVi4Cwg0oFXwkyFEiYlaq7MbKhWqWjNMJ5SFC0udogzE57biYaXgvDk5xSkrwgL+eoJsBU
	MPfm+Gjk/FUf+ZmQPY7sk7MQW/FEkeEkCLFpTOv5/
X-Received: by 2002:a05:6512:288:b0:5b7:78bc:ec07 with SMTP id
 2adb3069b0e04-5b778bcee15mr42626e87.14.1788954646115; Wed, 09 Sep 2026
 04:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com> <20260908162223.1683432-19-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-19-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 9 Sep 2026 12:50:09 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzxVTAMVkO5RaSmE72vgNpuZfX-51=46YDok+vHuwrROA@mail.gmail.com>
X-Gm-Features: AcwNN1WWLxfR9jlqCMbRmgHnokAuxADv4gMqiBhtQwGNJdoCg0QCSKPNnqFHjlI
Message-ID: <CA+EHjTzxVTAMVkO5RaSmE72vgNpuZfX-51=46YDok+vHuwrROA@mail.gmail.com>
Subject: Re: [PATCH v17 18/20] KVM: arm64: Reuse kvm_stage2_unmap_range in kvm_unmap_gfn_range
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_045056_364610_3BE99949 
X-CRM114-Status: GOOD (  15.19  )
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

On Tue, 8 Sept 2026 at 17:23, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> In preparation for adding VM specific backends for stage2 operation,
> switch to kvm_stage2_unmap_range() instead of __unmap_stage2_range()
> from the kvm_unmap_gfn_range(). Drop the bail out check for protected
> VMs and defer that to the one in kvm_stage2_unmap_range(). Later we
> would replace the logic in kvm_stage2_unmap_range() with VM specific
> backends.
>
> No functional changes intended.
>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/mmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9ba86450fe4af..67852acf7a6f8 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2436,12 +2436,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>
>  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
> -       if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
> +       if (!kvm->arch.mmu.pgt)
>                 return false;
>
> -       __unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
> -                            (range->end - range->start) << PAGE_SHIFT,
> -                            range->may_block);
> +       kvm_stage2_unmap_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
> +                               (range->end - range->start) << PAGE_SHIFT,
> +                               range->may_block);
>
>         kvm_nested_s2_unmap(kvm, range->may_block);
>         return false;
> --
> 2.43.0
>

