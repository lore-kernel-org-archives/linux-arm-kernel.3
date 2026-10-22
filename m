Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD636606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4/4cIl4f;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YJ2pynxc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bWeRZDGg5wgEIXQ2Q3Dog5Qq8cFNbVZQXYdNdnbIBxo=; b=4/4cIl4ffRLe3V
	Ps8YZV+T2O2ylhmgihmklOB1R9AEYajjOJhvp5gRIBe3m9IKMn3sv1HnzyvBqvfdhjdIbyrj2jbs6
	KNTiddtGHnEvNXj5m6gMtudAdKbTOzoRn2xQ19lqkhzwGyGmZGdtbEKHMeOQBW6Jv1cBd6cTKWy0Z
	zycLXm+Lzo8SyWneQ0cy/YfU5EQhXi1J/BIEojJqTDY0t9GysiIunYK0meb6NqiHbQZQvaemRocmb
	kG+zEECWmRNwrj/RHQrujP0fXqG9TWcXw6uwG0LHsO+rcMrDbbi+4tvvIVRejdX0TZJSKEeIv4SlW
	nWdGmsrqZdJbOBMPLebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsbF-0000000E9c2-00Sc;
	Thu, 22 Oct 2026 13:12:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsbA-0000000E9bC-2B9I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:12:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1B622C34;
	Thu, 22 Oct 2026 06:12:42 -0700 (PDT)
Received: from [10.0.129.145] (Suzukis-MBP.cambridge.arm.com [10.0.129.145])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 041FF3F673;
	Thu, 22 Oct 2026 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792674766; bh=D+1s1qGz4upJyB30Lz7rpPwzUA1TglIBkh6n3/mG9JE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YJ2pynxcE4vfMZ7QttDPP2sI6JxzDHVm9lVgFn+frTUeMehwdXSm7LUIPYh2pCght
	 VexFKqRbbXZx6Nr2WT7apXYQ1MW/rme9O4ZqnwBWnNTX1K6tYuOhC2deGdz5kdLAdT
	 Eji8POU3FseNWV3rSXDBS4I2vRpLVVcaFFFQHjOQ=
Message-ID: <a25c3ec1-ef58-4d70-b7c9-c1e213680541@arm.com>
Date: Thu, 22 Oct 2026 14:12:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Return on kvm_gmem_get_pfn() failure in
 gmem_abort()
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 Wei-Lin Chang <weilin.chang@arm.com>, Fuad Tabba <tabba@google.com>
References: <20261022123054.31729-1-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261022123054.31729-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_061248_858591_F01ACFCF 
X-CRM114-Status: GOOD (  15.40  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/10/2026 13:30, Fuad Tabba wrote:
> The kvm-arm64/mmu-fixes-7.4 merge dropped the return from the
> kvm_gmem_get_pfn() error path in gmem_abort(). Both parents of the
> merge keep that return. On a failed kvm_gmem_get_pfn(), gmem_abort()
> then carries on with a zero pfn, and on a nested stage-2 it uses the
> mapping it has just freed.
> 
> Restore the return.
> 
> Fixes: 65f95b2874a15 ("Merge branch kvm-arm64/mmu-fixes-7.4 into kvmarm-master/next")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>      I went through the rest of the merge's conflict resolution with
>      git show --remerge-diff, and this is the only line it dropped.
> 
>   arch/arm64/kvm/mmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index a48f3f531e827..ba4fe58222ad5 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1802,6 +1802,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
>   						      s2vi.vma_pagesize, write_fault, exec_fault,
>   						      false);
>   		kfree(mapping);
> +		return ret;
>   	}
>   
>   	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))

Thanks for fixing this ! Looks correct to me.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


