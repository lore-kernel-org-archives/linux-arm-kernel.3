Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F9D606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s1VWEoGk;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Fwty6efh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=08rccn60fEOYc981H9C1ltNpnqL6fJwW23BZtUgvjTE=; b=s1VWEoGk/e3Wf+
	ZN6GYplfo3rs769GYt0UE31CpVQIPNoErOUlJGd1n21qtYUydZA1KpNae14kokZyWAqpbiA70X6Kx
	/ogt92/9bM3vD49x3NUEL6/pqk10TDGtrUpoyMr8290cDd1N5G3tkzYEY9gg/earLjb4ij/oxO4pi
	aLuAiZ28vrIz6ig6e7NwCoHzdyddsKw+HOS4kc8rQM2lR0M8fb9DKoRfkq5VTM9/LtNLCIHc6LUMV
	+PfXZxhOZ4Vb3kDGN0FYznQBOvqn/TG4+jr5jk7BWzmNKClFitwnRVSKgX05DTRRA1i4rp3n+c+tS
	FZhW22ucBeDw6wZqrHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOegE-00000006B0O-2pz4;
	Wed, 04 Nov 2026 17:21:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOegC-00000006B04-0bxH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:21:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E2301BB0;
	Wed,  4 Nov 2026 09:21:40 -0800 (PST)
Received: from [10.57.90.115] (unknown [10.57.90.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CF5A3F673;
	Wed,  4 Nov 2026 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793812903; bh=SrqOHDbmlFGl5iJGPMkhsoS6OaPeU5qzTVxZubmsEOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fwty6efh0ml2t0oFiC9NHJQBOIP9Z2//15K9Gi44mqkE4wOlF23vPnQ+bb15z5d4k
	 4xOw2LHT54TLHhxBLFB/bz3Ukf7pdGT8JmPYKXsB4AE4WveGvGeNtMPfldE/IpaPHI
	 D0VuvEGncIDo7VYX4F14d494BWAEZ1FgiK+Fv+28=
Message-ID: <09b353d2-3615-4462-abe1-8e3c5a992a67@arm.com>
Date: Wed, 4 Nov 2026 17:21:39 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] irqchip/gic-v5: Clean the allocated linear device
 table size
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-9-743b61626fc5@arm.com>
 <auiiK0ksqPMbHAmX@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <auiiK0ksqPMbHAmX@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_092144_227338_E5D5EA24 
X-CRM114-Status: GOOD (  20.72  )
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

On 02/11/2026 14:46, Lorenzo Pieralisi wrote:
> On Mon, Nov 02, 2026 at 01:33:02PM +0000, Sascha Bischoff wrote:
>> When the linear device table exceeds the kmalloc limit, the driver
>> caps the DeviceID width before allocation but keeps the original size
>> for cache maintenance. On a noncoherent ITS, this cleans beyond the
>> allocated table.
>>
>> Recalculate the size after capping the DeviceID width.
>>
>> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> ---
>>   drivers/irqchip/irq-gic-v5-its.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
>> index 4de07bbdc4923..c0f3982229194 100644
>> --- a/drivers/irqchip/irq-gic-v5-its.c
>> +++ b/drivers/irqchip/irq-gic-v5-its.c
>> @@ -601,6 +601,7 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
>>   		pr_warn("Limiting device ID bits from %u to %u\n",
>>   			device_id_bits, device_id_cap);
>>   		device_id_bits = device_id_cap;
>> +		sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
>>   	}
>>   
> 
> Or sz = KMALLOC_MAX_SIZE;
> 
> that's what we are doing after all.
> 
> I wonder whether moving:
> 
> sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
> 
> after the capping out of the if and do:
> 
> if (BIT_ULL(device_id_bits) * sizeof(*devtab) > KMALLOC_MAX_SIZE)
> 
> to check whether mem alloc should be capped makes this any easier
> to read.
> 
> Regardless, this patch is a fix and it is right to make it as small
> as possible:
> 
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 

I've reworked this a bit to make it clearer. Hence, I've left off your 
Acked-by tag on v2. I hope that's OK!

Thanks,
Sascha

>>   	devtab = kcalloc(BIT(device_id_bits), sizeof(*devtab), GFP_KERNEL);
>>
>> -- 
>> 2.34.1
>>


