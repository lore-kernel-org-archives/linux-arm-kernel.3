Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB54C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pu4y+xke+Ei5YHKQGwvxsQAQRaFWR++JyX6jGfeEWaE=; b=Ll1Ch1X2GdNc6koNg6ykxY9Wcy
	1ODipWcoju5AGP8Ds0j7qFqFZuBHa61qx2qd0QIDl0tPa9bNsG+ZKRle1buGkafW+5MfTILk6B1YU
	Nf2XyUj4b7+xN1CaozzrEluFeuqwT0eYKbMTvjXKBbHGK5RYd2JY65tY3pv2tDXvZQJ2CQIcHSWOu
	4t7aGHm9kJyDFd6v9RKDadetLyjv1MTHCo4tBthBOycRxcEV50UcyhQ7hH0xpfen1gKpn/a5KRel+
	i3O/ZfJaZCmgIX/j2v3lBeZZkjz9X2uZPfrb3AhqbAUu0YoZz+kEHrjyTxmWuaeuvQUQTxLY79KH2
	gSzOGhnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0VO-00000005xwY-0N0m;
	Tue, 11 Mar 2025 14:22:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0Tk-00000005xlb-4AwC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 14:21:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BCF51516;
	Tue, 11 Mar 2025 07:21:19 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53CB93F694;
	Tue, 11 Mar 2025 07:21:07 -0700 (PDT)
Message-ID: <d8d7c381-b3e6-4259-b1f4-ff06328df0a0@arm.com>
Date: Tue, 11 Mar 2025 14:21:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: Unexport iommu_fwspec_free()
To: Joerg Roedel <joro@8bytes.org>
Cc: will@kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, yong.wu@mediatek.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com
References: <36e245489361de2d13db22a510fa5c79e7126278.1740667667.git.robin.murphy@arm.com>
 <Z9A3WJSgUPjROev6@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z9A3WJSgUPjROev6@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_072109_082433_D1010289 
X-CRM114-Status: GOOD (  15.73  )
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

On 11/03/2025 1:15 pm, Joerg Roedel wrote:
> This patch triggered two compile issues on ARM32, which I fixed up in my
> tree:
> 
> On Thu, Feb 27, 2025 at 02:47:47PM +0000, Robin Murphy wrote:
>>   static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
>>   {
>> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>> +	struct iommu_fwspec *fwspec = NULL
> 
> Missing semicolon here.
> 
>>   	struct of_phandle_args iommu_spec;
>>   	struct mtk_iommu_v1_data *data;
>>   	int err, idx = 0, larbid, larbidx;
>>   	struct device_link *link;
>>   	struct device *larbdev;
>>   
>> -	/*
>> -	 * In the deferred case, free the existed fwspec.
>> -	 * Always initialize the fwspec internally.
>> -	 */
>> -	if (fwspec) {
>> -		iommu_fwspec_free(dev);
>> -		fwspec = dev_iommu_fwspec_get(dev);
>> -	}
>> -
>>   	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
>>   					   "#iommu-cells",
>>   					   idx, &iommu_spec)) {
>> @@ -476,6 +467,9 @@ static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
>>   		idx++;
>>   	}
>>   
>> +	if (!fwspec)
>> +		return -ENODEV;
>> +
> 
> Wrong return type here.
> 
> Please be more cautious next time and make sure to compile-test all
> changed files of a patch.

Oops, sorry, indeed that was a failure of my process - seems I need to 
be more diligent about COMPILE_TEST. Patch sent :)

Thanks a lot for the fixups!

Robin.

