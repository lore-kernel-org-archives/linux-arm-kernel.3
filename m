Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D145CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQwrZxqyoHyICGEO55fpGrtqL15BWzrycz8MwG+Cgn8=; b=r1gsPSTHkC8XqDuYTAM2XQcRxe
	f9rPek1Unr/rnwKeUjeLLVBoqzgv5QOjiNSSXZzxsGaCTI+tzbzHpfqkRxYJY+eYYdSFWMT+ITfMW
	/dsnIPTPyFiN4ncaKmYLXlFUeukrNQ3sEb1L222A7+FrLNighpbckkNlw6pTRI9HMiZgISMUDxPdY
	NBwbuo5H9n485kC3wW0PF0ehh7xcsD4aIxsxygbkNd2s2a8E1Z99WapaR9NiLXEsIFp6hs+fiwy/4
	7+Fe9c+dgfGvwxIrepGLRXZSIp6YiSUraLQb5SoKUWmPuTuKx7/J+o1h01qdxFr4gUWblbfLOGtv2
	JqVo1iYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ53V-00000008Gcx-3Ew2;
	Thu, 21 May 2026 15:11:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ53N-00000008GbP-1tlz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:11:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9E3D3D45;
	Thu, 21 May 2026 08:11:10 -0700 (PDT)
Received: from [10.1.32.22] (e122027.cambridge.arm.com [10.1.32.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE6733F7B4;
	Thu, 21 May 2026 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779376275; bh=17SV5z5QGm0EPYvenc3ZyU1VB2Jpu5XaWYSZ8c+4UfI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q1fQaVqG1pgFhZuo/6+BbaCC5IHBqImNA7lInXrGxB8wBvwLmnlLQ4tqvV7BLJHNE
	 6qi1FGOJ5WLVEoMHlJxEy4ojbou8VB09apk1qIMu3NRf2grUfkrS4RVwe+TcJ9FkH6
	 HdytOzUEdPW3q554cDTWtfOGg391lFP/6QYGk71A=
Message-ID: <0ab59213-6bad-4062-a2b8-84fb2120f45d@arm.com>
Date: Thu, 21 May 2026 16:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 02/44] kvm: arm64: Avoid including linux/kvm_host.h in
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
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-3-steven.price@arm.com> <86ik8hvz2f.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86ik8hvz2f.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_081120_537529_C9C7C60E 
X-CRM114-Status: GOOD (  15.05  )
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

On 21/05/2026 11:26, Marc Zyngier wrote:
> On Wed, 13 May 2026 14:17:10 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> To avoid future include cycles, drop the linux/kvm_host.h include in
>> kvm_pgtable.h and include two _types.h headers for the types that are
>> actually used. Additionally provide a forward declaration for struct
>> kvm_s2_mmu as it's only used as a pointer in this file.
>>
>> Both pgtable.c and kvm_pkvm.h relied on the indirect inclusion of
>> kvm_host.h, so make that explicit.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> New patch in v13
>> ---
>>  arch/arm64/include/asm/kvm_pgtable.h | 5 ++++-
>>  arch/arm64/include/asm/kvm_pkvm.h    | 2 +-
>>  arch/arm64/kvm/hyp/pgtable.c         | 1 +
>>  3 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
>> index 41a8687938eb..e4770ce2ccf6 100644
>> --- a/arch/arm64/include/asm/kvm_pgtable.h
>> +++ b/arch/arm64/include/asm/kvm_pgtable.h
>> @@ -8,9 +8,12 @@
>>  #define __ARM64_KVM_PGTABLE_H__
>>  
>>  #include <linux/bits.h>
>> -#include <linux/kvm_host.h>
>> +#include <linux/kvm_types.h>
>> +#include <linux/rbtree_types.h>
> 
> I'm surprised by this. Where is the rbtree_type.h requirement coming
> from?

struct kvm_pgtable has a "struct rb_root_cached" for pkvm_mappings.
There's definitely an argument that that's a bit ugly - but this seemed
the cleanest fix from a include perspective.

Thanks,
Steve

> 
> Thanks,
> 
> 	M.
> 


