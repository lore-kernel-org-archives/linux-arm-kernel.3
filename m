Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B20DFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PMPPhJBIoAFqbLK6IEcz3TJqi8NyQ/kg4mcMwJE+s4=; b=SSIyXBLxi+HnwNAb1MfUqWkKFe
	5VXkN3v91aOT9DLbzkdeTgzRcoAOQnVedHfHYekQq8MyfYpEZml85J5XWPICH25IPpCZu7EvcEXdC
	Ypmi9NcTRaqn4UM5IpKHdfhpmyacEhLzP5Dgcx7qc0sOzuT4TWXj8d0l/GJRJG+fx1eu52h3XQoW+
	rdIjR+WQDRTY0ji9z7iZUKltsR7okXLoBkiiBlyf5/SEM7pPiQzIa5pw+185L8zq+I6gDprXoNWKI
	2FoSJqXyyd3HuED08nnU+8pyRvysH2FrB/50HKcZ/ln4ZeFcwJvNIZ+L91HRUedFbRI8BdYyF6nmr
	qyxyqjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0q1-00000003HaO-49yP;
	Wed, 29 Apr 2026 09:04:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0pv-00000003HZi-12Jc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9229B442A8;
	Wed, 29 Apr 2026 09:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8E5C19425;
	Wed, 29 Apr 2026 09:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777453442;
	bh=GlS0SwwAWXqWj/7Jc6bpwhH0bZk5wVaKJDdB02OB62g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ti93xAMiLbMaMHonvVmLyQT0uIvkTKlNv0xaRHEBxrmRd5VjIbPfZ0KEU/CG3fqs0
	 vlnllUSlrwer2rVn7Kl3nhYyUcx3v5S7CfROlsqqxPItkeVidgYkXK76GUED4eCvPH
	 6BcfYEYaVeND0Z4goX05clzzSvaa0RM6z0VaqEbSg1cn4G0Zp9v0d2M212KLJT0TPi
	 6klFM3hjhapurXuRWCbRt6LrBEgFl79/ud5WBEC0jvWoFgjtxXqxquMHHAv8OA8YgN
	 bX/MRcupcMSUOzl9JUYQ+HDgsbahChlb6L43dRAtf/+q93ztefgKUHrA4iIXQR0upQ
	 9miKEWWI8iQDw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, sebastianene@google.com
Subject: Re: [PATCH v4 3/3] coco: guest: arm64: Query host IPA-change
 alignment via RHI
In-Reply-To: <afC8hZTJY6Cx8Liz@willie-the-truck>
References: <20260427063108.909019-1-aneesh.kumar@kernel.org>
 <20260427063108.909019-4-aneesh.kumar@kernel.org>
 <afC8hZTJY6Cx8Liz@willie-the-truck>
Date: Wed, 29 Apr 2026 14:33:55 +0530
Message-ID: <yq5awlxqyw78.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_020403_321748_F91EB902 
X-CRM114-Status: GOOD (  18.44  )
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

Will Deacon <will@kernel.org> writes:

> [+Seb for the ITS]
>
> On Mon, Apr 27, 2026 at 12:01:08PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> Add the Realm Host Interface support needed to query host configuration
>> from a Realm guest. Define the RHI hostconf SMCs, add rsi_host_call(), and
>> use them during Realm initialization to retrieve the host IPA-change
>> alignment size.
>> 
>> Expose that alignment through realm_get_hyp_pagesize() and
>> mem_decrypt_granule_size() so shared-buffer allocation and
>> encryption/decryption paths can honor the ipa change page-size requirement.
>> 
>> If the host reports an invalid alignment (when alginment value is not
>> multiple of 4K), do not enable Realm support.
>> 
>> This provides the host alignment information required by the shared buffer
>> alignment changes.
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  arch/arm64/include/asm/mem_encrypt.h |  3 ++
>>  arch/arm64/include/asm/rhi.h         | 24 +++++++++++++
>>  arch/arm64/include/asm/rsi.h         |  2 ++
>>  arch/arm64/include/asm/rsi_cmds.h    | 10 ++++++
>>  arch/arm64/include/asm/rsi_smc.h     |  7 ++++
>>  arch/arm64/kernel/Makefile           |  2 +-
>>  arch/arm64/kernel/rhi.c              | 54 ++++++++++++++++++++++++++++
>>  arch/arm64/kernel/rsi.c              | 13 +++++++
>>  arch/arm64/mm/mem_encrypt.c          |  8 +++++
>>  9 files changed, 122 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm64/include/asm/rhi.h
>>  create mode 100644 arch/arm64/kernel/rhi.c
>
> [...]
>
>> diff --git a/arch/arm64/mm/mem_encrypt.c b/arch/arm64/mm/mem_encrypt.c
>> index 38c62c9e4e74..f5d64bc29c20 100644
>> --- a/arch/arm64/mm/mem_encrypt.c
>> +++ b/arch/arm64/mm/mem_encrypt.c
>> @@ -59,3 +59,11 @@ int set_memory_decrypted(unsigned long addr, int numpages)
>>  	return crypt_ops->decrypt(addr, numpages);
>>  }
>>  EXPORT_SYMBOL_GPL(set_memory_decrypted);
>> +
>> +size_t mem_decrypt_granule_size(void)
>> +{
>> +	if (is_realm_world())
>> +		return max(PAGE_SIZE, realm_get_hyp_pagesize());
>> +	return PAGE_SIZE;
>
> No, this should be indirected via 'struct arm64_mem_crypt_ops' because
> there's nothing particularly unique to realms here. For pKVM protected
> guests using a smaller page-size than the host, we'd presumably need
> something similar for the ITS (where restricted-dma isn't used).
>

Sure, I will rework this to use struct arm64_mem_crypt_ops in the next revision.

-aneesh

