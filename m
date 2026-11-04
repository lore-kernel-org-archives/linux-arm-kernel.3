Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D8D606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bq943YNM;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=f3KMWRYV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sVm5vm53TcuuiHKOjBSbO/ogRlTrTCzTLWf1Fg0Jk+M=; b=bq943YNMaE1Az7
	/bObZNnlKWdxyg0gRHKVxAjevZkUNMs2WtcuyP+834R7IQnH9ZsztH0cJMCKLeuCGu6+NV8CGRfXv
	JOR2/oAraJYrdlovcfw7GaNyzNTrnfwvt5N7DTCem+qXDsAqCB7S1323LSHyAIyVh/WRBmTHEMkiH
	R43eBfTTxcgmHxUK385GZLNH4ovgACsrC/UMGYI0xZHjjmPLbCXiZiuVTW8Ld3hGkbT2Pcj3KbRqo
	y5d0DfSaGtZatmIk/WF+0OjhSBVSxSWgUQXCu1NGWyFYjrXaL4LgcGXvog9q9GhhJ0a5YX1PR9ZSO
	2nm9JmE+t6Kf8K3QcbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOevY-00000006FBu-3KDL;
	Wed, 04 Nov 2026 17:37:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOevW-00000006FBC-0DGJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:37:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EBD71BB2;
	Wed,  4 Nov 2026 09:37:30 -0800 (PST)
Received: from [10.57.90.115] (unknown [10.57.90.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F4203F673;
	Wed,  4 Nov 2026 09:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793813853; bh=FBb/TbKhVIoXQAmd1m4CKiunRWfUuceXTHGcjdsZEyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f3KMWRYV1SWzQkyLugtLAI/c/yVkDJFoo0FBPJWCCNqunjwaTJZv9YIFhry9sQReZ
	 JRCNFuz5tkzhe7L/UuGVwWe5P2DVL8shSKujBCwo0MzH8ibadvS1hHNL1S16G1MNHH
	 1OwhC3wXS4Eir2T7Pwe9p3CwjycllOaPL76mnxLk=
Message-ID: <e5ce1693-6f03-4a66-84da-7f64f48ef691@arm.com>
Date: Wed, 4 Nov 2026 17:37:29 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] irqchip/gic-v5: Release ITS MMIO region on DT probe
 failure
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-10-743b61626fc5@arm.com>
 <auikDS0RE5E13z8I@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <auikDS0RE5E13z8I@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_093734_136729_E7FDE070 
X-CRM114-Status: GOOD (  15.65  )
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



On 02/11/2026 14:54, Lorenzo Pieralisi wrote:
> On Mon, Nov 02, 2026 at 01:33:03PM +0000, Sascha Bischoff wrote:
>> of_io_request_and_map() reserves the ITS configuration frame region.
>> If ITS initialisation fails after mapping it, the error path only
>> unmaps the registers and leaves the region reserved.
>>
>> Keep the resource description and release the region on that path.
>>
>> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> ---
>>   drivers/irqchip/irq-gic-v5-its.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
> 
> A minor note on coding style below, other than that:
> 
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>>
>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
>> index c0f3982229194..91abe63cb5cf9 100644
>> --- a/drivers/irqchip/irq-gic-v5-its.c
>> +++ b/drivers/irqchip/irq-gic-v5-its.c
>> @@ -1188,6 +1188,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
>>   
>>   static int __init gicv5_its_init(struct device_node *node)
>>   {
>> +	struct resource res;
> 
> FIR tree ordering.

Argh, yup. Missed that one when making this change. Fixed!

Thanks,
Sascha

> 
> https://docs.kernel.org/process/maintainer-tip.html
> 
>>   	void __iomem *its_base;
>>   	int ret, idx;
>>   
>> @@ -1197,6 +1198,11 @@ static int __init gicv5_its_init(struct device_node *node)
>>   		return -ENODEV;
>>   	}
>>   
>> +	/* Save the region to release if ITS setup fails after mapping it. */
>> +	ret = of_address_to_resource(node, idx, &res);
>> +	if (ret)
>> +		return ret;
>> +
>>   	its_base = of_io_request_and_map(node, idx, of_node_full_name(node));
>>   	if (IS_ERR(its_base)) {
>>   		pr_err("%pOF: unable to map GICv5 ITS_CONFIG_FRAME\n", node);
>> @@ -1213,6 +1219,7 @@ static int __init gicv5_its_init(struct device_node *node)
>>   
>>   out_unmap:
>>   	iounmap(its_base);
>> +	release_mem_region(res.start, resource_size(&res));
>>   	return ret;
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>


