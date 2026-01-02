Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD54FA3743
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDoZ5psuht5TlsJSJ2o2PqweQn7Z6SUTmbekda7Xm38=; b=SpZdw94P/K6iwiD0AbA5jo6tUv
	nAHGvadn8LO+x6KN0Qqv7tLw5eBXj/gV/NGQy8JfmMAW3E1aPMfXp4XvHRtn14iUI1DT7wiWXEI6E
	H+/AJXM8nprU3iSUqEijhGfmkd4qiu8bGVP4CiUeV7hNgf40WfKgjIMVDoWT7tWmRK43OE+LkSIH7
	eu/ZcvU/bXguV5E6vTtXGo4DSWjrB6mWJqxq5Hovn1IiwaaTuRkWN3eC+YIS+1gSCSH39b75ezMD8
	CvdzCkIabrANyOEGXqs0SptdU0CgaBCCy4BNOyS712+GajWjeECcgz7NEvGHG1e1BVy5YfJFrK0h9
	JV1RT3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeO4-00000008Cfb-1rkx;
	Fri, 02 Jan 2026 12:36:12 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeO2-00000008CfB-3TQH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767357368; bh=ZPiLUwdVlye8afoiIfEYHMA1gyQswktqXOTPVA6D4xw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qylc2llx7MD25mAPOtjGIs1Mn+IotLvRAitTTL9omKxD87i3CSkJosTvSCD1s17wr
	 b9UY0B/1zVjvTg0e+a8CQmC6CAaTsZem06c9Qjnde/ElzQ2jjjFkeWnJWWD8ziXqEi
	 oQW0JXUJNnnGbV9IUXEbh3P2Swu4BiVtE/bwBh4b3zzltCQ5ofFMMFZ7sdl1o9A8JO
	 MYk/e2qcPIcbPtcE0NO8SlLCsefXmkxhjsscgcG2Cg58AHGoHRM4hRxlUjqqFymYgp
	 MG3CNcXr6sqN4LPFHKHE3KaIWzdcBoUM6SI4uBEqxMQiVSkabCUedbEbSBMI9Q4vUQ
	 MVTVy3nNuSFoQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 7A1F93E9C54;
	Fri,  2 Jan 2026 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767357368; bh=ZPiLUwdVlye8afoiIfEYHMA1gyQswktqXOTPVA6D4xw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qylc2llx7MD25mAPOtjGIs1Mn+IotLvRAitTTL9omKxD87i3CSkJosTvSCD1s17wr
	 b9UY0B/1zVjvTg0e+a8CQmC6CAaTsZem06c9Qjnde/ElzQ2jjjFkeWnJWWD8ziXqEi
	 oQW0JXUJNnnGbV9IUXEbh3P2Swu4BiVtE/bwBh4b3zzltCQ5ofFMMFZ7sdl1o9A8JO
	 MYk/e2qcPIcbPtcE0NO8SlLCsefXmkxhjsscgcG2Cg58AHGoHRM4hRxlUjqqFymYgp
	 MG3CNcXr6sqN4LPFHKHE3KaIWzdcBoUM6SI4uBEqxMQiVSkabCUedbEbSBMI9Q4vUQ
	 MVTVy3nNuSFoQ==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 1F14F3E98AF;
	Fri,  2 Jan 2026 12:36:08 +0000 (UTC)
Message-ID: <eb9ef21a-c0b4-4c8d-b1b1-6c76f45c53aa@mleia.com>
Date: Fri, 2 Jan 2026 14:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: nxp: Add a simple NXP LPC32xx socinfo driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260101235647.2411062-1-vz@mleia.com>
 <20260101235647.2411062-3-vz@mleia.com>
 <accb4ab1-07fa-4e33-a74c-2c588ca415ac@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <accb4ab1-07fa-4e33-a74c-2c588ca415ac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260102_123608_519216_2FBB7741 
X-CRM114-Status: GOOD (  13.02  )
/bin/ln: failed to access 'reaver_cache/texts/20260102_123608_519216_2FBB7741': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_123608_519216_2FBB7741 
X-CRM114-Status: GOOD (  17.03  )
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

On 1/2/26 11:58, Krzysztof Kozlowski wrote:
> On 02/01/2026 00:56, Vladimir Zapolskiy wrote:
>> Add NXP LPC32xx specific driver to get unique SoC ID from System Control
>> Block registers and export it to userspace.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
>> ---
>>   drivers/soc/Kconfig           |   1 +
>>   drivers/soc/Makefile          |   1 +
>>   drivers/soc/nxp/Kconfig       |  16 +++++
>>   drivers/soc/nxp/Makefile      |   2 +
>>   drivers/soc/nxp/lpc32xx-soc.c | 114 ++++++++++++++++++++++++++++++++++
>>   5 files changed, 134 insertions(+)
>>   create mode 100644 drivers/soc/nxp/Kconfig
>>   create mode 100644 drivers/soc/nxp/Makefile
>>   create mode 100644 drivers/soc/nxp/lpc32xx-soc.c
>>
>> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
>> index a2d65adffb80..c21b0d2f58fc 100644
>> --- a/drivers/soc/Kconfig
>> +++ b/drivers/soc/Kconfig
>> @@ -18,6 +18,7 @@ source "drivers/soc/loongson/Kconfig"
>>   source "drivers/soc/mediatek/Kconfig"
>>   source "drivers/soc/microchip/Kconfig"
>>   source "drivers/soc/nuvoton/Kconfig"
>> +source "drivers/soc/nxp/Kconfig"
>>   source "drivers/soc/pxa/Kconfig"
>>   source "drivers/soc/qcom/Kconfig"
>>   source "drivers/soc/renesas/Kconfig"
>> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
>> index 47a3925ff84c..a04c21a8a5a4 100644
>> --- a/drivers/soc/Makefile
>> +++ b/drivers/soc/Makefile
>> @@ -24,6 +24,7 @@ obj-y				+= loongson/
>>   obj-y				+= mediatek/
>>   obj-y				+= microchip/
>>   obj-y				+= nuvoton/
>> +obj-y				+= nxp/
>>   obj-y				+= pxa/
>>   obj-y				+= qcom/
>>   obj-y				+= renesas/
> 
> Missing maintainers entry.
> 
> 
>> +
>> +static int lpc32xx_soc_probe(struct platform_device *pdev)
>> +{
>> +	struct soc_device_attribute *soc_dev_attr;
>> +	struct device *dev = &pdev->dev;
>> +	struct soc_device *soc_dev;
>> +	struct regmap *scb;
>> +	u32 serial_id[4];
>> +	int ret;
>> +
>> +	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
>> +	if (!soc_dev_attr)
>> +		return -ENOMEM;
>> +
>> +	soc_dev_attr->family = "NXP LPC32xx";
>> +
>> +	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
>> +	if (ret)
>> +		return ret;
>> +
>> +	scb = syscon_regmap_lookup_by_compatible("nxp,lpc3220-scb");
> 
> This is undocumented ABI.

What is the expected level of documentation for syscon?

The mfd/syscon.yaml states:

   System controller node represents a register region containing a set
   of miscellaneous registers. The registers are not cohesive enough to
   represent as any specific type of device.

This particular SCB has been documented, the review is pending.

> Anyway, you should look up devices via phandles.
> 

I may miss the context, was syscon_regmap_lookup_by_compatible() deprecated?

Most of drivers/soc uses syscon_regmap_lookup_by_compatible() variant over
syscon_regmap_lookup_by_phandle(), and overall

% git grep syscon_regmap_lookup_by_compatible v6.19-rc1 | wc -l
105

-- 
Best wishes,
Vladimir

