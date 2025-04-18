Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C8FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 12:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8k3JMAls+GQlxYkbc31pLWubjNcA+n4tKYL4qcb01q8=; b=ykLTC6Dnl/rshUohhNv0+jM+T7
	lWTavqJOIMc74JzA63mAbNwzIgna57Bz3LJskNkIOJCTXtRUXU6u8xUvJj4ZX/K9YLKglp/KTYehf
	0WWlPFOD3nxO1nZP5O7M2jJV8yanokFg6cDY0D6FfGYNCXuyvvMbYFZuYT8bvYNiDXXVvon3hwr4j
	nv+02mwnvOYktN0VWdzXeC6QJocDjQNNnaSBQJU986IjMwW+E8x1soCYie6oYNbS9Ol6fJlX4wXlT
	Fswzx292BXzZKyQU/ynVMHp/rJXbW9ji6HGVWCQ5eLyct1jPN2lcv0V0yJGcfNRM7uTsEioIitE+v
	+lNiF2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kjh-0000000G3j3-0oG6;
	Fri, 18 Apr 2025 12:22:25 +0000
Received: from smtp-26.smtpout.orange.fr ([80.12.242.26] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5khn-0000000G3ZJ-0G3Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 12:20:28 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5khfuawZP2zsA5khiuLkN8; Fri, 18 Apr 2025 14:20:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744978824;
	bh=8k3JMAls+GQlxYkbc31pLWubjNcA+n4tKYL4qcb01q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=c3UDLAiNAdgLs93k5n13OjKXU1eQHkZjqRYCwDjFQw+hJZJbMhcK/Q2vEba2GECIH
	 jQ4C6zqdYrmkkDi7pwNdezlK7smSs4yzSj1rTs0jMUS1Hxou6Y/0HwPKaZaDD73A+b
	 ceSBDUulm6zB6g9E1tayiI2McCbCLGTPmREqzUbMjuGDpSyaoAs+eP4siDFK/np4iO
	 pO7elE6u7+2f6Z8aBd7joo7wnH7Ha/asmqLEpKSoc6srKHVRvf4O1w3zfjIO41idG9
	 cV54wdfcI8N85nLHUdhjYiwCKTWOpeDBydRNIYb4BVMFZIoJS8plNeBAYMrDqyV0se
	 dsZp2sO0Ms/CQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 18 Apr 2025 14:20:24 +0200
X-ME-IP: 90.11.132.44
Message-ID: <e148faa8-6ee0-45bd-8cd8-37ea42a1de2a@wanadoo.fr>
Date: Fri, 18 Apr 2025 14:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: stm32-ospi: Fix an error handling path in
 stm32_ospi_probe()
To: quic_msavaliy@quicinc.com
Cc: alexandre.torgue@foss.st.com, broonie@kernel.org,
 christophe.jaillet@wanadoo.fr, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, patrice.chotard@foss.st.com
References: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
 <72f49447-5c99-4028-90cf-3f5cc11e8b53@quicinc.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <72f49447-5c99-4028-90cf-3f5cc11e8b53@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_052027_238219_04403391 
X-CRM114-Status: UNSURE (   8.19  )
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

Le 18/04/2025 à 14:09, Mukesh Kumar Savaliya a écrit :
> 
> 
> On 4/18/2025 4:57 PM, Christophe JAILLET wrote:
> [...]
>> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
>> index 668022098b1e..9ec9823409cc 100644
>> --- a/drivers/spi/spi-stm32-ospi.c
>> +++ b/drivers/spi/spi-stm32-ospi.c
>> @@ -960,6 +960,10 @@ static int stm32_ospi_probe(struct 
>> platform_device *pdev)
>>   err_pm_enable:
>>       pm_runtime_force_suspend(ospi->dev);
>>       mutex_destroy(&ospi->lock);
>> +    if (ospi->dma_chtx)
>> +        dma_release_channel(ospi->dma_chtx);
> why can't you move to devm_dma_request_chan ? No need to cleanup.

Unless I miss something obvious, this function does not exist.

CJ

>> +    if (ospi->dma_chrx)
>> +        dma_release_channel(ospi->dma_chrx);
>>       return ret;
>>   }
> 
> 
> 


