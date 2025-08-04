Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203E5C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNi/CsW6KxQCXcA0osGFfPKtPNHFi8UvJA9hLkVQmzg=; b=yqWaq3u2Vm5WqHxvb0WYvlNoxG
	ALYDUAP4ByqjfApSGIrf/H9iuEHcK7ck73kX+EH0H2R2OQ6yp68vL8H/saQljGTLF/Ea51z6aw4MA
	nA3FL5TffW/5+57BjVpDvef6wxiIop9GzbCULqjL4YpPjlcTyGaOYuE9Apjun+pAmi2a2RfcAMcdC
	3vu8DcELYJj6nI8cI8Jp6nGI3oxwGOyPeNHAqftmUk6G+zIwgrWJwTIPmNdJiiyPzRpAQBPCfgCE+
	BNKo7dVQb0q8SM+ZTOGDeTjap7/avlrT7b3QWiFaTS5XfTlkdcCdPEFTNhG91uZ+XC8pDw4ZegcGz
	W19490mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisj0-0000000ADNb-4AIi;
	Mon, 04 Aug 2025 10:47:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis6O-0000000A9ed-0Q14
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:07:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A60712FC;
	Mon,  4 Aug 2025 03:07:21 -0700 (PDT)
Received: from [10.57.87.210] (unknown [10.57.87.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41A6A3F738;
	Mon,  4 Aug 2025 03:07:27 -0700 (PDT)
Message-ID: <ac76c5f5-ead1-4d17-9ef0-0f8068cf8d8d@arm.com>
Date: Mon, 4 Aug 2025 11:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: mm: support large block mapping when
 rodata=full
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250724221216.1998696-1-yang@os.amperecomputing.com>
 <20250724221216.1998696-4-yang@os.amperecomputing.com>
 <0e86671e-18bb-4f3b-9294-c583299ad49e@arm.com>
In-Reply-To: <0e86671e-18bb-4f3b-9294-c583299ad49e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030732_180587_B2E920C4 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

On 01/08/2025 15:35, Ryan Roberts wrote:

[...]

>> @@ -1366,7 +1648,8 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>  
>>  	VM_BUG_ON(!mhp_range_allowed(start, size, true));
>>  
>> -	if (can_set_direct_map())
>> +	if (force_pte_mapping() ||
>> +	    (linear_map_requires_bbml2 && !system_supports_bbml2_noabort()))
> 
> So force_pte_mapping() isn't actually returning what it sounds like it is; it's
> returning whether you would have to force pte mapping based on the current cpu's
> support for bbml2. Perhaps it would be better to implement force_pte_mapping()  as:
> 
> static inline bool force_pte_mapping(void)
> {
> 	bool bbml2 = (system_capabilities_finalized() &&
> 			system_supports_bbml2_noabort()) ||
> 			bbml2_noabort_available();

Sorry that should have been:

	bool bbml2 = system_capabilities_finalized() ?
		system_supports_bbml2_noabort() : bbml2_noabort_available();

> 
> 	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
> 			   is_realm_world())) ||
> 		debug_pagealloc_enabled();
> }

