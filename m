Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCD9C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAnlR2dtGuXBbIrYg+IuvuLox4jTD1pnpks7H3lzGUg=; b=u5W9jv96VaRvHZcmErxqf1eJdx
	1D7aT8qe+6vV3olYNFy0dD22lwdbmlJ36x6UTSYJg2o4a5hjoKU+faMSHFARZRE7aHZwoCHjxHgIJ
	7+d4d9i0iul64OnqPkh9exElYoK31U44DKUYSK3Z290flnJo/O7w/UmClxwUcI8vNssNgD8Dp9egk
	uwPDI0YwoCdQWSYQSWAVDvvi3u08c9SUHxEL4j8Df2unzvgLN7HSQMrZoFQFWobgyWtlX+lUrkYyZ
	Dxb3dTERW3omEiYBwpzZXypuO6fUmQb4kzYtiXTGykM26BvMmvUJ7CroM37yXM6+OGrQN2Mc7qPdD
	moui6E4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Dv-0000000ArSH-1Ey0;
	Thu, 17 Sep 2026 08:12:03 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Dq-0000000ArQY-0yNn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:11:59 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so2432915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 01:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789632715; x=1790237515; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAnlR2dtGuXBbIrYg+IuvuLox4jTD1pnpks7H3lzGUg=;
        b=J0rEaQH0F2QxW3jH8XQ3sBa9QyriwdQBOTMI1uWukbldhHfHOdKJqjFgODdg5PU38x
         +A+Cc/CdRBQeYM47ClLhC9u25u2cH5PjKkDIpgTBqfs8CEENCEMTiK3BiDW4D3syh16x
         H5BQJxFRv2M/oQ1Ljs9PbRU68tD0/TxmOyRAbpQYuxi/NH89CnzWnoMAOxhIp+tEE3RX
         kEL4SPFjWQitghdE9u9brQP0n2srEbVdZ2HRd8S8zoYkaorTWM9FMNSG4uihGRpmfxD6
         8pW3JEDMB0wZwiKKvQeq4wN+4qRjrMEe7seoxKIm7nngTCF7qhtuccHVFt0imLwo3F0l
         ohkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632715; x=1790237515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fAnlR2dtGuXBbIrYg+IuvuLox4jTD1pnpks7H3lzGUg=;
        b=A4Nc4ZhlUGzp3evYQzzQwm2FRfy5zFTpkgGcmPi0kMyw7sfc5ZXp1UrHnZj5WFjz4y
         Ym9KdI316xp/CeGfPfD9ruQ1ZILbq44JiNzpw66CGKw7boze/ylZSz8/2uqdwx4eC4LO
         7eVj+cU+LMH55taCOa2EM6OBytb3qwxxZ3PetcSCaE3R4vPFWlI2row6KdGMPSVUYaWq
         ljSjOYz8X019gIXFTR3R103X5g9L3xMn0n+oW0U27vm3mnxd8KWhoVfD30Tygbg0xCsL
         6c9OZdF0Vo7v7gxVN/t59LIz4IX1z/v/CgpzwLAfdjRjOI3OFnm1Y4erW8eWTGi3XF1i
         0ukQ==
X-Gm-Message-State: AFuF++n2I+82HTHuNVvcotwCQttk6UowXaAFzuKj5mWD8oRaids9iYBe
	koG301KugaIJ0phzdidLvPjsWRiAuk5csV1gC24CZitGz2vYVt3XNhbtfQtnkC1dAw==
X-Gm-Gg: AYBFou3uLkgh1L6bEZqXAmOjpn3l7D3jKL6LUTIAIcP8I/lFXLvR7CtdfJhgd85PvXB
	hm1gJWBb1GFSOFJmeP0Z5VZDjN1SjjLis2gg1S5rleiT58e+iV+2sJ8+pwrs3W5Svxs1tyl4tvl
	vQfNbSvLtC5DlNa4WFMDSey4mylYBeQlVN7JEiM3Wj6N8LQtieqA5WYdj1HuikLF2y8gao6/MQu
	xL0/K2CDKSnx8HvV9d3uPHEaw/x0ZMJY/RxCyWCkp6de//CIEeDqBizq2aj5vyo3VT46Mm+9R3/
	Mj9UBi883aY70qjV5Eb2kkKiMXPTbFxWr3xVFgj874XG5lK7qI5oq4YfwWVm+W0OMELmkpKl1wm
	hoDlNO6HtOxFW3wfVJYgyJlrLbIAbfApjBB/cOUgxFurUaYE/Savst3vbJse4lpiZteVANZ8A+o
	yszoEWkneFXtT+oCrXiwwtrOcnOvNOH7snxpjyCY5Tq08qTkj03QDQ+I8Dtv4yJyrlj9JItWOin
	54aszkcFvpNcO4PYAGOE2y5vc+iXrZLmvejT5BsdEVE83zrKdBszg==
X-Received: by 2002:a05:600c:3b97:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49ebcc010d5mr137864965e9.15.1789632714827;
        Thu, 17 Sep 2026 01:11:54 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd22dbf2sm50558415e9.10.2026.09.17.01.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:11:54 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:11:50 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sashiko AI <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] KVM: arm64: ptdump: Check the page tables aren't
 freed when accessing
Message-ID: <aqugxlnqegPzMpB-@google.com>
References: <20260916230337.4162485-1-weilin.chang@arm.com>
 <20260916230337.4162485-2-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916230337.4162485-2-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_011158_332330_2BB65B17 
X-CRM114-Status: GOOD (  28.28  )
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

On Thu, Sep 17, 2026 at 12:03:36AM +0100, Wei-Lin Chang wrote:
> An open debugfs file keeps the KVM structure alive, but does not prevent
> mmu notifier release from freeing the stage-2 page tables when the VMM’s
> address space is torn down. Therefore page tables belonging to the mmus
> could have been freed when a thread opens or reads the ptdump files.
> Take the mmu_lock and check mmu->pgt is still alive before accessing the
> page tables.

As Sashiko said, the read_lock is probably enough, including the existing one in
kvm_ptdump_guest_show()

With that change:

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>

> 
> Also for the ipa_range file and stage2_levels file, switch from keeping
> the pointer to the page tables to keeping the pointer to the mmu.
> 
> Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")
> Reported-by: Sashiko AI <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/kvmarm/20260623144054.B91D21F000E9@smtp.kernel.org/
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/kvm/ptdump.c | 43 +++++++++++++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> index 69899797dbad..4ead856c181a 100644
> --- a/arch/arm64/kvm/ptdump.c
> +++ b/arch/arm64/kvm/ptdump.c
> @@ -115,15 +115,28 @@ static int kvm_ptdump_build_levels(struct ptdump_pg_level *level, u32 start_lvl)
>  
>  static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm_s2_mmu *mmu)
>  {
> +	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>  	struct kvm_ptdump_guest_state *st;
> -	struct kvm_pgtable *pgtable = mmu->pgt;
> +	s8 start_level;
>  	int ret;
>  
> +	/*
> +	 * We only need the pgt start level to initialize the ptdump, get it
> +	 * while holding the mmu_lock. It's fine if the pgt gets freed
> +	 * afterwards, we'll check again when doing the actual dump.
> +	 */
> +	scoped_guard(write_lock, &kvm->mmu_lock) {
> +		if (mmu->pgt)
> +			start_level = mmu->pgt->start_level;
> +		else
> +			return ERR_PTR(-ENOENT);
> +	}
> +
>  	st = kzalloc_obj(struct kvm_ptdump_guest_state, GFP_KERNEL_ACCOUNT);
>  	if (!st)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = kvm_ptdump_build_levels(&st->level[0], pgtable->start_level);
> +	ret = kvm_ptdump_build_levels(&st->level[0], start_level);
>  	if (ret) {
>  		kfree(st);
>  		return ERR_PTR(ret);
> @@ -149,6 +162,9 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
>  	};
>  
>  	guard(write_lock)(&kvm->mmu_lock);
> +	if (!mmu->pgt)
> +		return 0;
> +
>  	st->parser_state = (struct ptdump_pg_state) {
>  		.marker		= &st->ipa_marker[0],
>  		.end_address	= BIT(mmu->pgt->ia_bits),
> @@ -211,17 +227,27 @@ static const struct file_operations kvm_ptdump_guest_fops = {
>  
>  static int kvm_pgtable_range_show(struct seq_file *m, void *unused)
>  {
> -	struct kvm_pgtable *pgtable = m->private;
> +	struct kvm_s2_mmu *mmu = m->private;
> +	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
> +
> +	guard(write_lock)(&kvm->mmu_lock);
> +
> +	if (mmu->pgt)
> +		seq_printf(m, "%2u\n", mmu->pgt->ia_bits);
>  
> -	seq_printf(m, "%2u\n", pgtable->ia_bits);
>  	return 0;
>  }
>  
>  static int kvm_pgtable_levels_show(struct seq_file *m, void *unused)
>  {
> -	struct kvm_pgtable *pgtable = m->private;
> +	struct kvm_s2_mmu *mmu = m->private;
> +	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
> +
> +	guard(write_lock)(&kvm->mmu_lock);
> +
> +	if (mmu->pgt)
> +		seq_printf(m, "%1d\n", KVM_PGTABLE_MAX_LEVELS - mmu->pgt->start_level);
>  
> -	seq_printf(m, "%1d\n", KVM_PGTABLE_MAX_LEVELS - pgtable->start_level);
>  	return 0;
>  }
>  
> @@ -230,15 +256,12 @@ static int kvm_pgtable_debugfs_open(struct inode *m, struct file *file,
>  {
>  	struct kvm_s2_mmu *mmu = m->i_private;
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
> -	struct kvm_pgtable *pgtable;
>  	int ret;
>  
>  	if (!kvm_get_kvm_safe(kvm))
>  		return -ENOENT;
>  
> -	pgtable = mmu->pgt;
> -
> -	ret = single_open(file, show, pgtable);
> +	ret = single_open(file, show, mmu);
>  	if (ret < 0)
>  		kvm_put_kvm(kvm);
>  	return ret;
> -- 
> 2.43.0
> 

-- 
Vincent

