Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F73DC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Imnp0d+dE81H1pBJO8FP2xfuY7SEn2GDS6aOUwfQXVs=; b=Sqpx/lST2Cdj9/nyHPhOno7JHM
	BKFx66VRWEIFNCQo4de5wnnDwTdTcybBhPYNst33tjRebSzjMZ6m1sjA7De0NKM+iVYfp2/3D93an
	nzACpT6jCtqvncimdovmUh79cNwevRK+EEvDVSXhsRTOv5iKPrrp3IM4RlZTXqQLXTFUeu+DIwhXX
	JQjkls6PkqZ7+4CVCMqoBSefra14X7yKKoxQY6iUSX6y/s+KX2/ewVU4gqS1zz5VqB/aGMTwvKoIe
	514MtA+xlUk1e2pU1XbHjf056/x0flVlIBTOya3uN0PmuwQViUTDbMr1z4xKLz5IXUme8bGE645Le
	OYtb6ADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPoh-00000003Iuk-3xVQ;
	Thu, 31 Jul 2025 09:43:15 +0000
Received: from mail-m83230.xmail.ntesmail.com ([156.224.83.230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPm3-00000003Iko-1vrp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 09:40:33 +0000
Received: from [192.168.1.94] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id dee002b7;
	Thu, 31 Jul 2025 17:40:26 +0800 (GMT+08:00)
Message-ID: <5b4dc6a3-f6fd-4bf7-a84e-3d79db8d062e@easystack.cn>
Date: Thu, 31 Jul 2025 17:40:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: samsung: exynos-srom: Fix of_iomap leak in
 exynos_srom_probe
To: Krzysztof Kozlowski <krzk@kernel.org>, alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250731083340.1057564-1-zhen.ni@easystack.cn>
 <aa6ad382-dc2a-4f63-be11-7d331027af66@kernel.org>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <aa6ad382-dc2a-4f63-be11-7d331027af66@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a985fdab9b90229kunm51918700f3967
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDShkZVkgZHk9NT08aHk8fT1YVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_024031_792046_C1379CB8 
X-CRM114-Status: GOOD (  23.79  )
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

Hi,

During static analysis with Smatch, I identified the following issue:

```
drivers/memory/samsung/exynos-srom.c:155 exynos_srom_probe()
warn: 'srom->reg_base' from of_iomap() not released on lines: 155.
```

Problem analysis:
1. In exynos_srom_probe(), the reg_base resource is acquired via of_iomap()
2. The of_platform_populate() call at the end of the function has a 
possible failure path:
```
root = root ? of_node_get(root) : of_find_node_by_path("/");
if (!root)
      return -EINVAL; // Failure return point
```
3. When this path is taken, reg_base is not released, causing a resource 
leak

Verification:
After applying the patch, the Smatch warning is resolved


Best regards,
Zhen


在 2025/7/31 17:06, Krzysztof Kozlowski 写道:
> On 31/07/2025 10:33, Zhen Ni wrote:
>> The current error handling in exynos_srom_probe() has a resource leak
>> in the of_platform_populate() failure path. When this function fails
>> after successful resource allocation, srom->reg_base is not released.
>>
>> To fix this issue, replace of_iomap() with
>> devm_platform_ioremap_resource(). devm_platform_ioremap_resource()
>> is a specialized function for platform devices.
> 
> Don't explain us kernel code. Drop sentence.
> 
>> It allows 'srom->reg_base' to be automatically released whether the
>> probe function succeeds or fails.
> 
> It's obvious.
> 
>>
>> Besides, use IS_ERR() instead of !srom->reg_base
> 
> I don't understand this. You keep explaining the code and this suggests
> you made change here not related to original case. Can you return
> srom->reg_base here? No?
> 
> 
>> as the return value of devm_platform_ioremap_resource()
>> can either be a pointer to the remapped memory or
>> an ERR_PTR() encoded error code if the operation fails.
>>
> 
> Missing fixes and cc-stable.
> 
>> Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
>> ---
>>   drivers/memory/samsung/exynos-srom.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/memory/samsung/exynos-srom.c b/drivers/memory/samsung/exynos-srom.c
>> index e73dd330af47..d913fb901973 100644
>> --- a/drivers/memory/samsung/exynos-srom.c
>> +++ b/drivers/memory/samsung/exynos-srom.c
>> @@ -121,20 +121,18 @@ static int exynos_srom_probe(struct platform_device *pdev)
>>   		return -ENOMEM;
>>   
>>   	srom->dev = dev;
>> -	srom->reg_base = of_iomap(np, 0);
>> -	if (!srom->reg_base) {
>> +	srom->reg_base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(srom->reg_base)) {
>>   		dev_err(&pdev->dev, "iomap of exynos srom controller failed\n");
>> -		return -ENOMEM;
>> +		return PTR_ERR(srom->reg_base);
> 
> How did you test it?
> 
> Best regards,
> Krzysztof
> 
> 

