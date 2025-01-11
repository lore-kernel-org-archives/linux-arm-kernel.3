Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76692E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cK+ir40XqZyP/Z5JsHxvXISG9sG7Id4my1/WXQAQcM=; b=VKiJ56A4dQfzK2dPdPsoi2hg3q
	CDu9kCRvzEVL7Chs4OH8gob5VKUCNx7IOuL55CCtmwkLj9DTGJ3TSQqhf1U2kK0yVlUb6tOCzeVLp
	4w4NQr2bS28Y8Bp8vxAiHxSOfnG9W7xhaaNq49wc/4qDl9mActPVWCz16JW8XZ0bVo7nSoauUg1JG
	dppxkIMFxWpNLpKckgUt+iHKHP9/sozoLOODGPVrfYVkmPYxjy2T0yHy5TQJr+nMNRwGX7FJCjr8B
	RB38BGV5HN1VG0PqfkQBS8r+zWDCj2Uv0QF9k6IAMRO11jWhczvfmx5+JUJcZzrM9h3Fwjff3LxGz
	JXJgxsgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWbQY-00000000qCV-0Nzo;
	Sat, 11 Jan 2025 13:21:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWbPK-00000000q62-1vXO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 13:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 590235C4A62;
	Sat, 11 Jan 2025 13:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF449C4CED2;
	Sat, 11 Jan 2025 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736601605;
	bh=fG66nWrGM/6PKKdN96pf+ez5Xk8Ie0mSxd7kZ9d9Bw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lXsffBe9KjcI63HpkBhTvXaY/EH8m/VFeZc3qjATDk8+a5FETP8h75tIzzPNL86qT
	 O7cSStyrG7g2RCJEFeMypeC9wMMXGw87m29lds0vmE8cIi1fUXQ1vuU2Yuaf4uvulM
	 5Yb7bfEgJ0ugBSccNuW9P0e7Ow8Z9MRFHkVmxQDtxGLuDISWxOm8rgGEdK175IurTR
	 FMPsLfKenDc8larSgUoxA3U1CDfMEEXOnueJ2vAGMkR40xJpg5mTF3rlomwOU1CPwg
	 dki3CNqsfnlKHAKDtgnT8cWkUDuVA5vnk02/l0FwI1Aa5DgTtuVTI+vWSNuDbx3wKq
	 JxCxvuLDvRYoA==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 5/7] KVM: arm64: MTE: Use stage-2 NoTagAccess memory
 attribute if supported
In-Reply-To: <Z4Fk58k8YptDkVgm@arm.com>
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
 <20250110110023.2963795-6-aneesh.kumar@kernel.org>
 <Z4Fk58k8YptDkVgm@arm.com>
Date: Sat, 11 Jan 2025 18:49:55 +0530
Message-ID: <yq5amsfxtrlw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_052006_540188_76E1E466 
X-CRM114-Status: GOOD (  13.65  )
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Fri, Jan 10, 2025 at 04:30:21PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> Currently, the kernel won't start a guest if the MTE feature is enabled

...

>> @@ -2152,7 +2162,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>>  		if (!vma)
>>  			break;
>>  
>> -		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
>> +		if (kvm_has_mte(kvm) &&
>> +		    !kvm_has_mte_perm(kvm) && !kvm_vma_mte_allowed(vma)) {
>>  			ret = -EINVAL;
>>  			break;
>>  		}
>
> I don't think we should change this, or at least not how it's done above
> (Suzuki raised a related issue internally relaxing this for VM_PFNMAP).
>
> For standard memory slots, we want to reject them upfront rather than
> deferring to the fault handler. An example here is file mmap() passed as
> standard RAM to the VM. It's an unnecessary change in behaviour IMHO.
> I'd only relax this for VM_PFNMAP mappings further down in this
> function (and move the VM_PFNMAP check above; see Suzuki's internal
> patch, unless he posted it publicly already).
>

But we want to handle memslots backed by pagecache pages for virtio-shm
here (virtiofs dax use case). With MTE_PERM, we can essentially skip the
kvm_vma_mte_allowed(vma) check because we handle all types in the fault
handler.


-aneesh

