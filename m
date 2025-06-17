Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0EEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4vJ4WUJydWruG0dqtzkAwR+nhnVb7UMToyievYWDJ8=; b=yBNyYSZO1gwr/dNvIJp/eqyKGT
	mydB1MBQLkrGUg0YmGg6xaxGwTyyzZ7ALIY3AeR1UzysY7hLnBxyqFuMjz8iu9laDu5EwznJqA7/f
	wE6/aJoGSuHuvUcNjgDEGz6KGdljopA5d28jGtwCEZpnkj5ZdM82ncWBLbaCTdQ7jDbHI3NbpiRhE
	nz93tbEF4O477FSJdvPZ6j87mJ/bk/0Dl1dsNmd9B5Y3aNrOP3j+CLqq5GxONcGzpS9aNXEVJBpWf
	M8QFfYJJmB1NMi2Y75wvKT0RLS/dHH8hhGs/lVd+c2rugeDwNtvcWbLwUe5d4cG/qxxKQsnqshu8j
	T3IfsDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXFJ-00000007Xll-0Kjz;
	Tue, 17 Jun 2025 14:25:05 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWg7-00000007Q1v-32LO;
	Tue, 17 Jun 2025 13:48:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750168101; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RYsbxIlGajViXkOxtq2KEf8LaUDJCjs2cfVNQMck7jnzD0YFELOk4Xa46PPdaQdzez7xix5UJzDIKv5M4VIq9ujJICGT/zBOvItqnwiwbWLoNMhca/69lAZwnBzh4o35yTrisvCjwiUZSLVy4SVE7nSHjeDZ/MFXKZTr7z4ZQBs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750168101; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D4vJ4WUJydWruG0dqtzkAwR+nhnVb7UMToyievYWDJ8=; 
	b=IUmQzhrEo9hCGLNL4aD8A9gDxDumRgxrWh98mcRcJWaUN32W0PTlhuCxL2T0CeSSlVKE/0kXdq1cd3kWF7olhpFizl095mF29IPa32ApSMw6xH+7UC7mGpfD4ef1kTiLV3+ARZXvMJN9gBeWQ0OPKNAIyeOFKWZ0RvAzeA/dIHQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750168101;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=D4vJ4WUJydWruG0dqtzkAwR+nhnVb7UMToyievYWDJ8=;
	b=O/Im1XKgABAsdhserORFX21ekFxftRdla9wGdCm60WC/2lpb522k498YpEm5afgi
	mAFRVWgct5SGPHMqENFUj6LbKkABgB/mrCWGJGi3mRzgYfZ7dreoOlKfpdfGzlnYxCx
	3immDWE3ee1SBTfTjqMhhmEPTZb1EDF7/c6i9lik=
Received: by mx.zohomail.com with SMTPS id 175016809925542.787085547648644;
	Tue, 17 Jun 2025 06:48:19 -0700 (PDT)
Message-ID: <2596fddc-aa76-4234-b182-1159c14b7cf8@collabora.com>
Date: Tue, 17 Jun 2025 15:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
To: Diederik de Haas <didi.debian@cknow.org>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-4-benjamin.gaignard@collabora.com>
 <DAOTVW4YEC5Q.STXG6APE0YGN@cknow.org>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <DAOTVW4YEC5Q.STXG6APE0YGN@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_064843_829089_5F4824F0 
X-CRM114-Status: GOOD (  22.81  )
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


Le 17/06/2025 à 15:04, Diederik de Haas a écrit :
> Hi,
>
> On Mon Jun 16, 2025 at 4:55 PM CEST, Benjamin Gaignard wrote:
>> Verisilicon IOMMU hardware block can be found in combination
> Can there be only 1 hardware block or is multiple possible?
> If only 1, then I'd start with "The Verisilicon ...".
> If more then one, then I'd use "blocks".
>
>> with hardware video codecs (encoders or decoders) on
>> different SoCs.
> This makes it sound like it can also be used with non-Verisilicon codecs
> and based on the DT binding description, I get the _impression_ that
> that is not the case?
> But it's actually not clear to me if that's the case or not.

Only one hardware block exists on rk3588 and it can only be used
by Verisilicon AV1 codec.

>
>> Enable it will allows to use non contiguous memory
> "Enabling it will allow us to use non ..." or "Enable it to allow [the]
> use of non ..." or "Enabling allows the use of non ..."
>
>> allocators for Verisilicon video codecs.
> And the wrapping of the whole commit message is not following the
> standards.
>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/iommu/Kconfig     |   8 +
>>   drivers/iommu/Makefile    |   1 +
>>   drivers/iommu/vsi-iommu.c | 900 ++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 909 insertions(+)
>>   create mode 100644 drivers/iommu/vsi-iommu.c
>>
>> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
>> index 0a33d995d15d..4cf4504dcc25 100644
>> --- a/drivers/iommu/Kconfig
>> +++ b/drivers/iommu/Kconfig
>> @@ -383,4 +383,12 @@ config SPRD_IOMMU
>>   
>>   	  Say Y here if you want to use the multimedia devices listed above.
>>   
>> +config VSI_IOMMU
>> +	bool "Verisilicon IOMMU Support"
>> +	depends on ARM64
>> +	select IOMMU_API
>> +	select ARM_DMA_USE_IOMMU
>> +	help
>> +	  Support for IOMMUs used by Verisilicon video decoders.
>> +
>>   endif # IOMMU_SUPPORT
>> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
>> index 355294fa9033..68aeff31af8b 100644
>> --- a/drivers/iommu/Makefile
>> +++ b/drivers/iommu/Makefile
>> @@ -34,3 +34,4 @@ obj-$(CONFIG_IOMMU_SVA) += iommu-sva.o
>>   obj-$(CONFIG_IOMMU_IOPF) += io-pgfault.o
>>   obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
>>   obj-$(CONFIG_APPLE_DART) += apple-dart.o
>> +obj-$(CONFIG_VSI_IOMMU) += vsi-iommu.o
>> diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
>> new file mode 100644
>> index 000000000000..f2fa1197916c
>> --- /dev/null
>> +++ b/drivers/iommu/vsi-iommu.c
>> @@ -0,0 +1,900 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
> No copyright statement? (or an informational header block?)
>
> Cheers,
>    Diederik
>
>> +#include <linux/clk.h>
>> + <snip>

