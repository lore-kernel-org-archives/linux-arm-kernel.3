Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC11C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyipMtgB4ZyCJEZ0e7KmuMxjF6Di1Z8fq9/5bVP2+K4=; b=IAgN2BH7BJGGx4bK3IzOys2lcv
	PHz5JEd9yLwUo9+IOcr0hZd2I8ecajxpx7cvTF2yeuq3g3O7bLEM1mGfGUOdPGWUoBr2ae5x214Hg
	Erf813+ZH7tmaCE3l1+D8DMvoudexLo6ocbp/YrjIFzhfYYztYuKHUf9701Zov5fZqisIfaJQzPwu
	kijU44YL9eZbMcnJolwbA8b6qJTEXffb7DzOzHOMfOJwgG5rGXQY+AVoU92bXaP2HxHBJRQtgyAtE
	6bMrjdPgnt9zjjk8+WuXpsay7tYmV+tSp/nPauCnmScrgaMBXM8sOkK5etnbmijEYW3gCRD3Hbdao
	GmaETXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOul-0000000BiFQ-3atU;
	Mon, 10 Aug 2026 12:15:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOuk-0000000BiF3-2TFB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 12:15:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 904B760052;
	Mon, 10 Aug 2026 12:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BA21F000E9;
	Mon, 10 Aug 2026 12:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786364133;
	bh=eyipMtgB4ZyCJEZ0e7KmuMxjF6Di1Z8fq9/5bVP2+K4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Un/FAx7j6a8Tv4Qu69dqE6Obb/zXK2tm191FllFfVmceQt6S/WwdjwVYTLuEGeyvi
	 qSIHVn40c2QF8K25OCs30fALn3cHCfP5u0AUfugA275ApwRLHQCariclHrM2XtXNL+
	 Nn+dPPC5Io2XmFZQaFIpJ6CLbiGNHY/W4ORQ9UbfJ5Llf3SHzD6wdyOrqlO2mTgiO5
	 ++yombrOSzh6N0slpNLX5YU3ajjNhP22F0K74fWXLYQNMMcMbudOpTNsZXgpqjbZHg
	 TjAUpAe/RjHNAq/RrB5jRNhSiTSojaGD3OxRff8oJkIV65JUJPM6jMOprBXnp4OHv+
	 +AT1utjlBqA2Q==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 4/7] arm64: realm: Move Realm memory encryption ops
 to RSI code
In-Reply-To: <baa99d81-7979-4654-a030-a550ba57bb58@arm.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-5-aneesh.kumar@kernel.org>
 <baa99d81-7979-4654-a030-a550ba57bb58@arm.com>
Date: Mon, 10 Aug 2026 17:45:24 +0530
Message-ID: <yq5apkzqi337.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 05/08/2026 07:32, Aneesh Kumar K.V (Arm) wrote:
>> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
>> registration with the RSI initialization code instead of pageattr.c, which
>> only needs to provide the low-level page-attribute transition helper.
>> 
>> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
>> the Realm-specific encrypt/decrypt callbacks and warning policy.
>> 
>> No functional changes in this patch.
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>   arch/arm64/include/asm/mem_encrypt.h |  3 +--
>>   arch/arm64/mm/pageattr.c             | 38 +---------------------------
>>   drivers/firmware/arm_rmm/rsi.c       | 34 +++++++++++++++++++++++++
>>   3 files changed, 36 insertions(+), 39 deletions(-)
>> 
>> diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
>> index f03b9d7b83b4..ef8b8463e52b 100644
>> --- a/arch/arm64/include/asm/mem_encrypt.h
>> +++ b/arch/arm64/include/asm/mem_encrypt.h
>> @@ -16,8 +16,7 @@ int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops);
>>   
>>   int set_memory_encrypted(unsigned long addr, int numpages);
>>   int set_memory_decrypted(unsigned long addr, int numpages);
>> -
>> -int realm_register_memory_enc_ops(void);
>> +int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt);
>>   
>>   static inline bool force_dma_unencrypted(struct device *dev)
>>   {
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index bbe98ac9ad8c..14b2a3801f40 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -275,9 +275,7 @@ int set_direct_map_default_noflush(struct page *page)
>>   				 PAGE_SIZE, set_mask, clear_mask);
>>   }
>>   
>> -static int __set_memory_enc_dec(unsigned long addr,
>> -				int numpages,
>> -				bool encrypt)
>> +int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt)
>>   {
>>   	unsigned long set_prot = 0, clear_prot = 0;
>>   	phys_addr_t start, end;
>> @@ -321,40 +319,6 @@ static int __set_memory_enc_dec(unsigned long addr,
>>   				      __pgprot(PTE_PRESENT_INVALID));
>>   }
>
> This calls "rsi_set_memory_range_protected/shared(). Should we add call 
> backs for those too in the arm64_mem_crypt_ops and take those away too ?
>
> something like :
>
> 	pre_enc_dec_phys_range(start, end, bool encrypt) ?
>
> and implement that in firmware/arm_rmm/rsi.c ?
>

__set_memory_enc_dec() is a helper that is only used for realms. We do
have a check:

if (!is_realm_world())
	return 0;

(We should probably change the return value to -EINVAL.)

The only reason it is in arch/arm64/mm/pageattr.c is that it calls
__change_memory_common(). That function is more of an internal helper
for the page table update routines. I wasn't sure whether we want to
expose this API which can also be used for updating linear map
attributes.

Currently, we restrict such updates to vmap mappings, with the only
exception being the Realm use case through __set_memory_enc_dec().

-aneesh

