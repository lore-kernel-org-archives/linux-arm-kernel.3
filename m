Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A7FE6C5FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 04:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZiLn0fNXNUQNsxbGJtC50AjyGfClD9qv9AZMF0zfcU=; b=s0exkK9XGuyUh3onbhuc/jA0WN
	Qya065lTh5bSIyss+R/HEYWd15LvEkslIg8d/G9MH5GDco+2uhuqguTmX7slubNoHFXjsOVQA8Qpv
	4DktSOV/enRRy7HldFnLk/bq0YGX+uTW3Qi9mzX4KLpHX3i4jbG6rFr6jEwIHjsexgReueLOQ5DMr
	NzRuMwBzj6pwCCOJ5eILl27CKFYpxZEJXAgey0fDWwNWqiCK5QuX7cWYu/zfLy9tdMdXvX6aLMFib
	QR6Oye/9PEAqUrLQ06M0ZEJ4fZ+C0ujkQWYs80YX5yuLLmWPgxB6eOnGxhoTqpwBJAfQX/cmuR+k0
	g1n0fZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIKdx-00000008EN1-1Ijl;
	Tue, 03 Dec 2024 04:36:13 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIKcw-00000008EEO-3jED
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 04:35:12 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B34Z1we1580937
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 22:35:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733200501;
	bh=XZiLn0fNXNUQNsxbGJtC50AjyGfClD9qv9AZMF0zfcU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=S8vtJOIHnehJpTz1k+Eg39H1Gtv3IkGRhaO81a+sWpxXmuxVeKMdNZwj2qNuP7wWA
	 wNbp3jUJccZoqpmk/9C0QUuMazIJd2SyG7+NgVXE/zrTUf+kC1AevcH9aF7/C7RKjn
	 /SqF5nBfaeZjepc2E6k6jKxyN/9DhdrpGvz3oX5g=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B34Z1el019282
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 22:35:01 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 22:35:00 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 22:35:01 -0600
Received: from [10.24.72.152] (uda0132425.dhcp.ti.com [10.24.72.152])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B34YwkB055318;
	Mon, 2 Dec 2024 22:34:59 -0600
Message-ID: <ffccf100-469f-4e5b-a32c-5c06e196aacd@ti.com>
Date: Tue, 3 Dec 2024 10:04:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: dma_request_chan_by_mask() defer probing
 unconditionally
To: Robin Murphy <robin.murphy@arm.com>,
        Enric Balletbo i Serra
	<eballetb@redhat.com>,
        Vinod Koul <vkoul@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>, <nm@ti.com>
References: <20241127-defer-dma-request-chan-v1-1-203db7baf470@redhat.com>
 <4dd1caa7-4b95-4e06-a5ac-e2d33ce88d04@arm.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <4dd1caa7-4b95-4e06-a5ac-e2d33ce88d04@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_203511_114634_C4392B69 
X-CRM114-Status: GOOD (  20.81  )
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

Hi Enric,

On 29/11/24 22:14, Robin Murphy wrote:
> On 2024-11-27 8:23 am, Enric Balletbo i Serra wrote:
>> Having no DMA devices registered is not a guarantee that the device
>> doesn't exist, it could be that is not registered yet, so return
>> EPROBE_DEFER unconditionally so the caller can wait for the required
>> DMA device registered.
>>
>> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
>> ---
>> This patch fixes the following error on TI AM69-SK
>>
>> [    2.854501] cadence-qspi 47040000.spi: error -ENODEV: No Rx DMA
>> available
>>
>> The DMA device is probed after cadence-qspi driver, so deferring it
>> solves the problem.
> 
> Conversely, though, it does carry some risk that if there really is no
> DMA device/driver, other callers (e.g. spi-ti-qspi) may now get stuck
> deferring forever where the -ENODEV would have let them proceed with a
> fallback to non-DMA operation. driver_deferred_probe_check_state() is
> typically a good tool for these situations, but I guess it's a bit
> tricky in a context where we don't actually have the dependent device to
> hand :/


+1. There is no explicit dependency that can be modeled (via DT or
otherwise) for memcpy DMA channels. And the IP (cadence-qspi) is not
specific to TI platforms. Its very much possible that a non TI platform
may not have memcpy DMA channel at all. Wont this end up breaking such
platforms wrt using SPI flash using CPU bound IO?

> 
> Thanks,
> Robin.
> 
>> ---
>>   drivers/dma/dmaengine.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
>> index
>> c1357d7f3dc6ca7899c4d68a039567e73b0f089d..57f07b477a5d9ad8f2656584b8c0d6dffb2ab469 100644
>> --- a/drivers/dma/dmaengine.c
>> +++ b/drivers/dma/dmaengine.c
>> @@ -889,10 +889,10 @@ struct dma_chan *dma_request_chan_by_mask(const
>> dma_cap_mask_t *mask)
>>       chan = __dma_request_channel(mask, NULL, NULL, NULL);
>>       if (!chan) {
>>           mutex_lock(&dma_list_mutex);
>> -        if (list_empty(&dma_device_list))
>> -            chan = ERR_PTR(-EPROBE_DEFER);
>> -        else
>> -            chan = ERR_PTR(-ENODEV);
>> +        /* If the required DMA device is not registered yet,
>> +         * return EPROBE_DEFER
>> +         */
>> +        chan = ERR_PTR(-EPROBE_DEFER);
>>           mutex_unlock(&dma_list_mutex);
>>       }
>>  
>> ---
>> base-commit: 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
>> change-id: 20241127-defer-dma-request-chan-4f26c62c8691
>>
>> Best regards,
> 

-- 
Regards
Vignesh
https://ti.com/opensource


