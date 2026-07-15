Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D549BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlILUyAolVrYPr256QI3OVnDWr9y23vDwbFMtoDV4O4=; b=LQm/AcTvDXczTVbgryTmDjSNuk
	8de5qdAkIqlobnStmj6o47ccAkwLipNrs5WB8eTKZkGruIMBRniqCLoFEPm756dQodhCefogXKEWq
	pii0Cl3cH+CpCMw2ejU/wyzJMrMF5gxw4LGOPdq6duX1XMHDjVk+9ED3j036YVjO3slt/psQUfX7O
	Xcrowx4dC+tVBdUVZg9DNTpmMGlt5UAbH6vIaKgi0Ys7yeFRLSxVu2vAk2OkAAStgQ8W06oCZU5cE
	H33M+y7Uo91A/54CO3UjhbhKO7rvMbPIlM2gF8mEIwtwirk1s/oYrqjqrb1g5RWNRO6YnvdMIdvcw
	4cdm5IbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2O0-0000000FSJi-1Op6;
	Wed, 15 Jul 2026 16:23:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2Nx-0000000FSIt-2CXN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:23:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB73F1477;
	Wed, 15 Jul 2026 09:22:55 -0700 (PDT)
Received: from [10.1.25.27] (e122027.cambridge.arm.com [10.1.25.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F1FC3F7B4;
	Wed, 15 Jul 2026 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784132580; bh=dg77XYklUbXh45Il0P/FqtiHFSzucVJ/8GhQ8vvAZAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jnIcFnKknQfFhH/ZSe16W7ygZ9aJlcMZzJmgb3/8BP5WJF38k0YQoe95evutPHZCY
	 wtUNge/F7+Qy/lksFoWFKTY9/JKrf9epMGp7oRwIUwWJ0gGWRvpL9pVmGLNcqUrn0X
	 oRgyjpzuCWM/MidzjoMBBdY108Dll4cKxIVKehFg=
Message-ID: <ca802162-43b7-478f-9d12-ee7bdc4c2088@arm.com>
Date: Wed, 15 Jul 2026 17:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 02/37] KVM: arm64: Avoid including linux/kvm_host.h in
 kvm_pgtable.h
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-3-steven.price@arm.com> <871pd45jmn.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <871pd45jmn.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_092301_654711_E4A1CD39 
X-CRM114-Status: GOOD (  12.46  )
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

On 15/07/2026 16:59, Marc Zyngier wrote:
> On Wed, 15 Jul 2026 15:28:04 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> To avoid future include cycles, drop the linux/kvm_host.h include in
>> kvm_pgtable.h and include the lightweight headers required for the types and
>> inline helpers used there. Additionally provide a forward declaration for
>> struct kvm_s2_mmu as it's only used as a pointer in this file.
>>
>> Both pgtable.c and kvm_pkvm.h relied on the indirect inclusion of
>> kvm_host.h, so make that explicit.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> New patch in v13
>> ---
>>  arch/arm64/include/asm/kvm_pgtable.h | 6 +++++-
>>  arch/arm64/include/asm/kvm_pkvm.h    | 2 +-
>>  arch/arm64/kvm/hyp/pgtable.c         | 1 +
>>  3 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
>> index 41a8687938eb..c2e4b29e605f 100644
>> --- a/arch/arm64/include/asm/kvm_pgtable.h
>> +++ b/arch/arm64/include/asm/kvm_pgtable.h
>> @@ -8,9 +8,13 @@
>>  #define __ARM64_KVM_PGTABLE_H__
>>  
>>  #include <linux/bits.h>
>> -#include <linux/kvm_host.h>
>> +#include <linux/kvm_types.h>
>> +#include <linux/rbtree_types.h>
>> +#include <linux/rcupdate.h>
>>  #include <linux/types.h>
>>  
>> +struct kvm_s2_mmu;
>> +
>>  #define KVM_PGTABLE_FIRST_LEVEL		-1
>>  #define KVM_PGTABLE_LAST_LEVEL		3
>>  
>> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
>> index 74fedd9c5ff0..a0f7a699d690 100644
>> --- a/arch/arm64/include/asm/kvm_pkvm.h
>> +++ b/arch/arm64/include/asm/kvm_pkvm.h
>> @@ -9,7 +9,7 @@
>>  #include <linux/arm_ffa.h>
>>  #include <linux/memblock.h>
>>  #include <linux/scatterlist.h>
>> -#include <asm/kvm_host.h>
>> +#include <linux/kvm_host.h>
> 
> nit: please keep the include directives in alphabetical order.

Ack.

Thanks,
Steve

> 	M.
> 


