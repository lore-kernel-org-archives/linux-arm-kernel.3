Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA5ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaEn7dbgaH6iPMCO5J8FjdiEUHJuBFLTI9dORD5tRcM=; b=GA134iMHtCCkf27ONj2d5TPJN2
	Y3uvvmwKlHtoRKxYD+pPpqoTC4kZsYI6dqbbJ7TtVr1T6pjw8sSIYa0lWxeIm7tMXTQZDQBb8um1l
	K/oouaMTIhNwK8BaNxy0mGy3DKfqG++Vui+I+2Ttf6Qi9PkdZONuKUyX4I9VWJx8eNFoKf7OX7JR8
	JjethP0DZ94C+ojxCpTBnlArWlFxFoiOkDsJrQeIYYQ9CkQtQmCIggwmIW9+oAC+j4FspKbEC1O5P
	gJj7NRA+b3QOj/EHXXfROdumOWNXmgoAMRWG2ito1hYtJrFpGZVngc0grjHcq9CK/O9mk5KyElhlv
	du0nv+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnT4-0000000GuF3-2rKE;
	Tue, 12 May 2026 13:48:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnT1-0000000GuE7-23dO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:48:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F6641655;
	Tue, 12 May 2026 06:48:05 -0700 (PDT)
Received: from [10.57.33.240] (unknown [10.57.33.240])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6BD63F85F;
	Tue, 12 May 2026 06:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778593690; bh=OOEl7Ee3v2lvVmXZkjR9vENiJNiSv2BYwxgLSf9hiw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DjNptRD3V6bvItp9OSAF88zx5I9jZmWvqzrzPUdgdrZLNcdLQDqA6SIjnlcVWL4fc
	 eKpZpYKfRC4U2FugcbGB5KReWOFqR2VFf1k1tc6M0CxzT+uoTaXPzAOLWw1YAetIbp
	 3VvkIpQmXGEexpxJQ5U4KpIRTM6KMebD8HElYdIQ=
Message-ID: <7e073ece-4fd6-4c36-ac2f-7604ccd38fff@arm.com>
Date: Tue, 12 May 2026 15:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
To: Jonathan Cameron <jic23@kernel.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maksim Kiselev
 <bigunclemax@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
 <20260510-sunxi-a523-gpadc-v1-2-4f6b0f4000fb@mmpsystems.pl>
 <20260512125106.718d48d9@jic23-huawei>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260512125106.718d48d9@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_064811_577672_75BAB5B1 
X-CRM114-Status: GOOD (  16.91  )
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

On 5/12/26 13:51, Jonathan Cameron wrote:
> On Sun, 10 May 2026 14:57:23 +0200
> Michal Piekos <michal.piekos@mmpsystems.pl> wrote:
> 
>> A523 differs from existing sun20i-gpadc-iio by having two clocks; bus
>> clock and module clock.
>>
>> Change driver to enable all clocks.
>>
>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> I'm expecting this to change given comment on not being quite compatible so
> I'll wait for v2 before reviewing.

Yes, we need a v2, but just for adding the new compatible string. 
Otherwise I think this patch is a neat solution, because we don't need 
to further differentiate between the different SoC's number of required 
clocks.

Cheers,
Andre

> 
> Thanks,
> 
> Jonathan
> 
>> ---
>>   drivers/iio/adc/sun20i-gpadc-iio.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gpadc-iio.c
>> index 861c14da75ad..dd4c7e6e3d76 100644
>> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
>> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
>> @@ -180,7 +180,7 @@ static int sun20i_gpadc_probe(struct platform_device *pdev)
>>   	struct iio_dev *indio_dev;
>>   	struct sun20i_gpadc_iio *info;
>>   	struct reset_control *rst;
>> -	struct clk *clk;
>> +	struct clk_bulk_data *clks;
>>   	int irq;
>>   	int ret;
>>   
>> @@ -205,9 +205,9 @@ static int sun20i_gpadc_probe(struct platform_device *pdev)
>>   	if (IS_ERR(info->regs))
>>   		return PTR_ERR(info->regs);
>>   
>> -	clk = devm_clk_get_enabled(dev, NULL);
>> -	if (IS_ERR(clk))
>> -		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock\n");
>> +	ret = devm_clk_bulk_get_all_enabled(dev, &clks);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to enable clocks\n");
>>   
>>   	rst = devm_reset_control_get_exclusive(dev, NULL);
>>   	if (IS_ERR(rst))
>>
> 
> 


