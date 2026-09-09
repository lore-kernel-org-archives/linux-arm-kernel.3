Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DE5C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6IuatuoMNsJEDfnmm/pQKwUCZUlZ/dQXHzRIsViejI=; b=MhahL/np+++5VeZwWMqjTKRKZb
	dl1Grh53YlDI33zYW9bJCmYLXdh8O2AiUHf2I8EfmnjLMzia143iQrVLhKLkVNMq4J+b4thEvsT/4
	fZ+VlFHZ0iL3rtGjWWWzOmLUxaF5S6T5A9wUycJS3V6M7TZS+kbyX91mm5hP9FSO4XdXu5aN9Fenz
	KR83vPA2ijhUmgJezIPRltAIJdzshPh5hE25EMf+NZ4USULIL0qAMU2eOzXt9MMWmr8AZN5faxXZJ
	ywNJILtm6M2SPVhTa8FmQFoWRdyDsl/VJBxqTNsi0iXUz2YX8QCpEonYtS/epqcMf539TFbeQqCae
	2r4U0GQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GO7-0000000BYVn-3yaK;
	Wed, 09 Sep 2026 11:22:47 +0000
Received: from out-227.mta1.migadu.com ([95.215.58.227] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GO4-0000000BYUi-48Wv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:22:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/JaBLDLeB9M4GD012hVnmAtxky5w5FAwuCSELvPTyb8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788952960; v=1; x=1789557760;
 b=QJr9KPu6qeHFDLgvJa4iULMOm1WRuA5+YUd0dn/m5XzPIwNx/dsIwwJ/Upoz0FylrThKP2/F
 YQTCkcFVkfgZB6tqDeyqR1E1qOoeLM81eTnBu4oYe9cwVJaiC7WhHI5aMtlw0WYipy1XZ8UZuF2
 wSevHKO3XdA+ts444EI67hoo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 460ffa2ee4b56209;
	Wed, 09 Sep 2026 11:22:40 +0000
X-Mizu-Trace-ID: 460ffa2ee4b56209
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so5859e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 04:22:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwyIoLbr+6d7NFykdOz0qcrxvTNvxK74X8O4+KR7rU8HjL/MN+8sMeBiTYOlNb2owiWz4TdEVCg/7DV/3dHiVQC@lists.infradead.org
X-Gm-Message-State: AFuF++lb2g2AYVk69FD47DIehmI7HA+Dmte6hhC0/6GcjJz84gH7rcZq
	VTtzCt9egngsBPxCv2d6Vea5bACWxFlBTg2MGEbqTl+eCIIc61b/ugxnAS/166F41mdDR/F9SWc
	3MN3VshQapYwzlk+2GfEHNwLAhEUJq4dhjDFPbAh4
X-Received: by 2002:a05:6512:2509:b0:5b6:4ad:d6ba with SMTP id
 2adb3069b0e04-5b76588da4bmr83683e87.15.1788952959425; Wed, 09 Sep 2026
 04:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com> <20260908162223.1683432-3-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-3-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 9 Sep 2026 12:22:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzGeHCWV=ooEv-P79NNqTDi-A+7y5BFvZRR0z8RwavoeA@mail.gmail.com>
X-Gm-Features: AcwNN1WOpbR1SFkQp2TefrPio8hkFdw4pDq7cjhhozRa2ggqEwHORcn6flp9uPk
Message-ID: <CA+EHjTzGeHCWV=ooEv-P79NNqTDi-A+7y5BFvZRR0z8RwavoeA@mail.gmail.com>
Subject: Re: [PATCH v17 02/20] KVM: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h
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
X-CRM114-CacheID: sfid-20260909_042245_173088_27D0423D 
X-CRM114-Status: GOOD (  18.22  )
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

On Tue, 8 Sept 2026 at 17:22, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> From: Steven Price <steven.price@arm.com>
>
> To avoid future include cycles, drop the linux/kvm_host.h include in
> kvm_pgtable.h and include the lightweight headers required for the types
> and inline helpers used there. Additionally provide a forward
> declaration for struct kvm_s2_mmu as it's only used as a pointer in this
> file.
>
> Both pgtable.c and kvm_pkvm.h relied on the indirect inclusion of
> kvm_host.h, so make that explicit.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch in v13

Is this meant to be here (the "New in patch 13")?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 6 +++++-
>  arch/arm64/include/asm/kvm_pkvm.h    | 2 +-
>  arch/arm64/kvm/hyp/pgtable.c         | 1 +
>  3 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 41a8687938eb6..c2e4b29e605fc 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -8,9 +8,13 @@
>  #define __ARM64_KVM_PGTABLE_H__
>
>  #include <linux/bits.h>
> -#include <linux/kvm_host.h>
> +#include <linux/kvm_types.h>
> +#include <linux/rbtree_types.h>
> +#include <linux/rcupdate.h>
>  #include <linux/types.h>
>
> +struct kvm_s2_mmu;
> +
>  #define KVM_PGTABLE_FIRST_LEVEL                -1
>  #define KVM_PGTABLE_LAST_LEVEL         3
>
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index beea00e693a0a..54a618d887fa4 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -7,9 +7,9 @@
>  #define __ARM64_KVM_PKVM_H__
>
>  #include <linux/arm_ffa.h>
> +#include <linux/kvm_host.h>
>  #include <linux/memblock.h>
>  #include <linux/scatterlist.h>
> -#include <asm/kvm_host.h>
>  #include <asm/kvm_pgtable.h>
>
>  /* Maximum number of VMs that can co-exist under pKVM. */
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index b74dd5ce1efd3..f48253b9d88b5 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include <linux/bitfield.h>
> +#include <linux/kvm_host.h>
>  #include <asm/kvm_pgtable.h>
>  #include <asm/stage2_pgtable.h>
>
> --
> 2.43.0
>

