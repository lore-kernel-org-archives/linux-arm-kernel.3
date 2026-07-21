Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A38C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 04:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAwLmuYdWrUlYAh7whQjAX/qWjCdiDKUmzfyN31Aaio=; b=a7u0RbqRnJc6+x1M20Pqtyfc6z
	6VrTAf0aX3SHl4jweo7aRYwbqFGZujZ2NJIf1MfBKucnggpr9UesrbWQ4+TFFSa0BlyLryGC8dNNs
	/5qSTfV3f3GS56RRpN57hYKyjdKD2WXY3MztxJh75QcRsOI+ayloCBhECYYJdRoj+sisXW9aALVsF
	WaqqtQQvIC9w3Wh6RkgesghjJCCnYDB3L1ISAT8jo4sBSnpAW7ldxNfm9DiJbyC04ohbe86EGPKW/
	6EfAnyn5hIlDj0Nljgc/FuYqQFOChtUjaD9/mjqMIj9PWRxBjk/y6IeS2a6lIQYTBzIwKtXZuZNIP
	ZdjxNTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2PN-00000008OYA-3JE8;
	Tue, 21 Jul 2026 04:48:45 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2PK-00000008OXk-3rps
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 04:48:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0266111A6DB;
	Tue, 21 Jul 2026 06:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1784609318;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KAwLmuYdWrUlYAh7whQjAX/qWjCdiDKUmzfyN31Aaio=;
	b=G1NI3wBb6DHP3qj4bXWA8NeV3UGJAVRRyKjhkiVE3u4s6xxaXIDZ5mtri+aXg7LPeAIepM
	F1f7GU3EiBOXVbGxWWLM2O0qv8qHZdl5tVf2hZDaZriUlJxU4WmQW/RHAIdcyvKnlvCteo
	gEI1FjmfaBPMElZJaJp1GelIAEDxqu0Ftl24vhtnx1d+L9eN52h+o0NhT+ehCDqGwuNSxv
	Nyjhuk9haskb33o/Bp4l/9KoIBDN23rjEwCyIpYXxl8u1v0UWgupnzZ4s4K9Ccq7TJFmHx
	JQyq6OCJYFtnQznXjWhGFRp9/HAq40xBf2gPshqRwCQDkcddRWBfWn4ZQqiClA==
Message-ID: <658ce5d3-df8b-e443-7886-1b393657a135@nabladev.com>
Date: Tue, 21 Jul 2026 06:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
Content-Language: en-US
To: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org
Cc: linux-fpga@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Xu Yilun <yilun.xu@intel.com>
References: <20260716070020.4113618-1-hs@nabladev.com>
 <dad54c5f-34d1-4aab-bf7c-590ed5f638e6@amd.com>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <dad54c5f-34d1-4aab-bf7c-590ed5f638e6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_214843_268657_18FD161E 
X-CRM114-Status: GOOD (  25.49  )
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

Hello Michal,

On 20.07.26 14:40, Michal Simek wrote:
> 
> 
> On 7/16/26 09:00, Heiko Schocher wrote:
>> Add csi_b and rdwr pin support for the xilinx,selectmap driver.
>>
>> In current driver the pins are configured from DTS and set to
>> GPIOD_OUT_HIGH. This works in case you have one FPGA.
>>
>> Extend this to really implement csi_b and rdwr pin function in
>> driver, so it works with more than one FPGA.
>>
>> Tested on AM625 based board with 2 FPGAs connected to GPMC.
>>
>> Signed-off-by: Heiko Schocher <hs@nabladev.com>
>> ---
>>
>>   drivers/fpga/xilinx-selectmap.c | 20 ++++++++++++++++++--
>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
>> index d0cbb5fdfe3a..b5fbdedf8aec 100644
>> --- a/drivers/fpga/xilinx-selectmap.c
>> +++ b/drivers/fpga/xilinx-selectmap.c
>> @@ -19,6 +19,8 @@
>>   struct xilinx_selectmap_conf {
>>       struct xilinx_fpga_core core;
>>       void __iomem *base;
>> +    struct gpio_desc *csi_b;
>> +    struct gpio_desc *rdwr_b;
>>   };
>>   #define to_xilinx_selectmap_conf(obj) \
>> @@ -30,9 +32,21 @@ static int xilinx_selectmap_write(struct xilinx_fpga_core *core,
>>       struct xilinx_selectmap_conf *conf = to_xilinx_selectmap_conf(core);
>>       size_t i;
>> +    if (conf->csi_b)
> 
> Is this really needed?
> 
> 4023 int gpiod_set_value(struct gpio_desc *desc, int value)
> 4024 {
> 4025         VALIDATE_DESC(desc);
> 4026         /* Should be using gpiod_set_value_cansleep() */
> 4027         WARN_ON(desc->gdev->can_sleep);
> 4028         return gpiod_set_value_nocheck(desc, value);
> 4029 }
> 4030 EXPORT_SYMBOL_GPL(gpiod_set_value);
> 
>   398 #define VALIDATE_DESC(desc) do { \
>   399         int __valid = validate_desc(desc, __func__); \
>   400         if (__valid <= 0) \
>   401                 return __valid; \
>   402         } while (0)
> 
>   385 static int validate_desc(const struct gpio_desc *desc, const char *func)
>   386 {
>   387         if (!desc)
>   388                 return 0;
>   389
>   390         if (IS_ERR(desc)) {
>   391                 pr_warn("%s: invalid GPIO (errorpointer: %pe)\n", func, desc);
>   392                 return PTR_ERR(desc);
>   393         }
>   394
>   395         return 1;
>   396 }
>   397
> 
> You should be able to just skip it because validate_desc is checking it for you.

It seems this is possible yes, so I drop it!

>> +        gpiod_set_value(conf->csi_b, GPIOD_OUT_HIGH);
>> +
>> +    if (conf->rdwr_b)
>> +        gpiod_set_value(conf->rdwr_b, GPIOD_OUT_HIGH);
>> +
>>       for (i = 0; i < count; ++i)
>>           writeb(buf[i], conf->base);
>> +    if (conf->rdwr_b)
>> +        gpiod_set_value(conf->rdwr_b, GPIOD_OUT_LOW);
>> +
>> +    if (conf->csi_b)
>> +        gpiod_set_value(conf->csi_b, GPIOD_OUT_LOW);
>> +
>>       return 0;
>>   }
>> @@ -56,16 +70,18 @@ static int xilinx_selectmap_probe(struct platform_device *pdev)
>>       conf->base = base;
>>       /* CSI_B is active low */
>> -    gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_HIGH);
>> +    gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_LOW);
>>       if (IS_ERR(gpio))
>>           return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
>>                        "Failed to get CSI_B gpio\n");
>> +    conf->csi_b = gpio;
> 
> Isn't it easier to simply call to avoid it?
> 
> conf->csi_b = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_LOW);

Of course, will send a v2 and drop the local gpio variable as not
longer needed.

Thanks for the review!

bye,
Heiko
> 
> Thanks,
> Michal

-- 
Nabla Software Engineering
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Geschäftsführer : Stefano Babic

