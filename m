Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00B6104BEC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9G3GwF7me9FsUvlcx2km6nfd0c02NVD1RLBApgqDjU=; b=TtEWKRGA/+UypANI1Rcn5TF2gY
	gw+NkkU4nFTbAytQ6o/zTUoXm7Pgz+vUuSDZ6W/l1hxklvi6xp/t6Lu/UWWxJqjA+9czoMI5TWJsL
	DR3qHea4snV7CpqqY0UX3Ra+5cLvAEXQziJPuyjNfC+RIWemnA12HhsTdDMWgxhhYvVw+EeJLccug
	AG5DdkgiWwD68kBh1LsNpp5p0lpaR4TGHe3H0PH0OfcfKA/eaQPlD64tWrfxLgqTxry1qHkImOpyA
	x/pDs8QG8dMZsumM3f2/kn1zUvokIDqzzNswSLEf2LgmgCXwWwIDL3p6zOCY5kXERtBn0LinrKSv+
	pZ0EvZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GXM-0000000BNJa-3IfH;
	Wed, 11 Mar 2026 10:11:32 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GXK-0000000BNJ4-450v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:11:32 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-509069a7a7fso505531cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773223890; cv=none;
        d=google.com; s=arc-20240605;
        b=eyOQ5QQPnd7wR14sWEUsTtz+2nWxpa4T5QKL7Uu0S14USOfUh63wdkvdVtIkqv4mEy
         +/TyEYThyP8cxFsCCicbR86WiyrUgOP2RuqXDVe+Cwv50WFtHzhpDw4veLCvK0DKdfjS
         xVrEdEehsEUN3TeyXo5zOlh+GPM+YgH/t3Kj/m2eqHF0UxWkkO1sF7vkg7VuRa2jtuVx
         +V4ea65tYN1dPGrp9La1aO3TjnEMBp3BNAkUnakSit+frrKbMPibLtt0TmlpLSx9J01z
         KHvb+WuWAt5L4TPxc5nNS2I5WjPDGnbuOXMDPzw8MDa8lWVjIPaR3CvFBBk6l0Spmy0k
         l9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S9G3GwF7me9FsUvlcx2km6nfd0c02NVD1RLBApgqDjU=;
        fh=rqHezY8rSscCxtEwV6ewH2//sm/btAf+I7/r9Oe6vSE=;
        b=Peq7PKOkp8MlJJUpgAbpY12oiR/JigWufOTJlE3U6cSAANJIzrxMIbfLdp82TlE3mK
         fVHc2Gkwh/wuOZHZA5lsNPFJmI/Twj7lXt/HsYl77tZwEkn7ay74wpngCZ9vlPO41zBi
         X2O/zaPtEpI5pGfrgqO2/lcurdbNTe/ChUNhEb8p9hbrcoeCIk16Jl1vIEGVgXKSZiPq
         H73+snOhCx7HIlrt5NDtYyqGs+uuAdn18qp9UFL79WKLH5AG+OMlTL9I+jezfJhJb37/
         OS4/GbTmWwcZpISTIhtb8bDl4GfmPzyI6G3f2KN249j18niG8vIiK/sfcvVZlaWklkxw
         XZ5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773223890; x=1773828690; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S9G3GwF7me9FsUvlcx2km6nfd0c02NVD1RLBApgqDjU=;
        b=lx9JyOnM+7it5zDsbGmH3TrxYxIFtupkVFZaQ9a9K+JqWSHvJ8xkhD11uApvb5u5K0
         jMYxpfBPWmoSkErmGep+LUsmqhihiZISbIsWfP+UP+XG36Pv9L2q5oAu64Sk2anVhCzr
         2dx0b2wN/13B7GIC4k9T/WBF/ICnp22rDKmb7Da7KHJKJ+VgrPG8QjWh5aZoxGPeFv0K
         iQaIDg1gwXPlvXUAAq1SujYNprXiZvtMa5zrGNdOz9tub53FUTd8Og8lzjCXrpAKH5X2
         lQogRV1jRnUCeZgjbHUhZsmwJVXNj6jvaNI5jzhqk1A23Vj5GLV3ty4NtUSTreh1Yszy
         4CLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773223890; x=1773828690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9G3GwF7me9FsUvlcx2km6nfd0c02NVD1RLBApgqDjU=;
        b=fxd4am4YjBvHY+vaSoSFwyJpmU/BpElEhf9oNZd+NZAqHyEPQf/qCS5goz8HcIMIh0
         jIuUGO7ijHhm6ZNkaKBZoIKytyuKpzaQS3OCs2njsQYCwlhHZADU5dlXpRCXXzENpGVX
         M/t4nS6y1+8HY+6OR2RCejjcWN3eUCj538F0y1qNt6Bq3MuntNkQnWF4d26laNCXXZJE
         EkPHUyQbfuqE/L+hAjS9ySYdKbxKUt0P4b7bH0Q/r4D+Xq0Psx6WC6Fw7vj05u6kjqTD
         vTasKI/CLBg+D+hU8tEhKkxX8+1AObhQaTqpGsnDwA2lhG6Nqlp4gxXj0Ij9ASf1mUvB
         J3zg==
X-Forwarded-Encrypted: i=1; AJvYcCU9SWqUidMDy7BLu6Eh/+oe4qEyXd032o0hMGeKeIS3D1Mow/0Qy786yJuC0z+t7k/4uUd4XJTmYwRb3fuFlUr3@lists.infradead.org
X-Gm-Message-State: AOJu0YzYeMkuQK2osvD+vSfF2mCqiUY5iH4EAHz0dZmDOo6vAvlnSMGK
	bcl1IuLcebMJz6W5DenY2sG82MvsMqReSPdg56OL6kRLJfF+FjfMA1kIxosb2tABTE7vTsxf7x0
	naHwuMb6l00jELHzdFGJmE7nu7G+oVfz/IHL3Xhuk
X-Gm-Gg: ATEYQzzy9I54l01N1ESFbgq+WS56da814R9sySQLLGRp1E00dtnWur69Wiqd4IsUi6u
	nNZj+aBCkQE7y6NFiZWcf2Sl13hsMQOccgLQpbZsYYxJFdFpC47EWqiS4Yg/3l7gM8Tglf6EjEP
	8kIVBBSJ6UKe+dzrKq/uxCVU8Vk3l18Y4I1NMwn+a3wfswcoDwaugbw/Ar66uKPwM7LPFsWloB1
	hyCzV1zcHAzi7+7QDU70xc/tqx3SD3MDSZfGbmKTqCjUbx0YwV1suu7PZlTpw7X796fqjtYq/KE
	tqR8kIS+TqQr29sV6d9o7T72av5D9oQNfSEk8A==
X-Received: by 2002:a05:622a:649:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-5093801c297mr11760731cf.0.1773223889091; Wed, 11 Mar 2026
 03:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-10-will@kernel.org>
In-Reply-To: <20260305144351.17071-10-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:10:51 +0000
X-Gm-Features: AaiRm51wLLcqX-yQ2yuchM8-vCLVMN2vS0uhjH_pET-oWf_5OhyyEHXhYTChr_s
Message-ID: <CA+EHjTw54G1GO775CCGC=C0X6s=4Srg2mJ6uJT6RKJFjfGOpNQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/36] KVM: arm64: Ignore -EAGAIN when mapping in pages
 for the pKVM host
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_031131_046143_9CF4BED5 
X-CRM114-Status: GOOD (  26.67  )
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

On Thu, 5 Mar 2026 at 14:44, Will Deacon <will@kernel.org> wrote:
>
> If the host takes a stage-2 translation fault on two CPUs at the same
> time, one of them will get back -EAGAIN from the page-table mapping code
> when it runs into the mapping installed by the other.

I ran into this while porting the Android patches, and this patch
fixed the issue. Thank you.

Reviewed-by: Fuad Tabba <tabba@google.com>

/fuad

> Rather than handle this explicitly in handle_host_mem_abort(), pass the
> new KVM_PGTABLE_WALK_IGNORE_EAGAIN flag to kvm_pgtable_stage2_map() from
> __host_stage2_idmap() and return -EEXIST if host_stage2_adjust_range()
> finds a valid pte. This will avoid having to test for -EAGAIN on the
> reclaim path in subsequent patches.
>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 38f66a56a766..7b0f8ad7b20f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -461,8 +461,15 @@ static bool range_is_memory(u64 start, u64 end)
>  static inline int __host_stage2_idmap(u64 start, u64 end,
>                                       enum kvm_pgtable_prot prot)
>  {
> +       /*
> +        * We don't make permission changes to the host idmap after
> +        * initialisation, so we can squash -EAGAIN to save callers
> +        * having to treat it like success in the case that they try to
> +        * map something that is already mapped.
> +        */
>         return kvm_pgtable_stage2_map(&host_mmu.pgt, start, end - start, start,
> -                                     prot, &host_s2_pool, 0);
> +                                     prot, &host_s2_pool,
> +                                     KVM_PGTABLE_WALK_IGNORE_EAGAIN);
>  }
>
>  /*
> @@ -504,7 +511,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
>                 return ret;
>
>         if (kvm_pte_valid(pte))
> -               return -EAGAIN;
> +               return -EEXIST;
>
>         if (pte) {
>                 WARN_ON(addr_is_memory(addr) &&
> @@ -609,7 +616,6 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
>  {
>         struct kvm_vcpu_fault_info fault;
>         u64 esr, addr;
> -       int ret = 0;
>
>         esr = read_sysreg_el2(SYS_ESR);
>         if (!__get_fault_info(esr, &fault)) {
> @@ -628,8 +634,13 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
>         BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
>         addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
>
> -       ret = host_stage2_idmap(addr);
> -       BUG_ON(ret && ret != -EAGAIN);
> +       switch (host_stage2_idmap(addr)) {
> +       case -EEXIST:
> +       case 0:
> +               break;
> +       default:
> +               BUG();
> +       }
>  }
>
>  struct check_walk_data {
> --
> 2.53.0.473.g4a7958ca14-goog
>

