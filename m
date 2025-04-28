Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8757C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 19:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBCJPzECeQ94pyLvoYBNYZYvuPQv+pUF49fQn7m2S6o=; b=xwSzVZoHQNtOYJhtUfkTt6+Xg1
	mZL0t1a7KVHiJhzaj59HIxOOqimX8wL73lquxf7kz3nFTpICBaXmne4xhMlajh2D+VWKHd6/OF4Kz
	m/Fc/aGr2kuDtI3Eu5wAogxIodzL5ASmkmugXlZnlOdvEaPGu98NNARQsOiGl1a0ZZKjuJUEIG65X
	JdL1h8eX0IJ+mQagzjani8r9ffG50Z5AA7eScZLfOaJitRjNiJz1yo+IdBOo1di+abwQIy2J1Y5MN
	VBWtOjQ56d8yToPsmz2KzMUbm/hUG5gA5D9y+3w3ZhndtIs50PhMgrlrnl6+vhtVwfmZTIQXs8r8T
	8YW1EloQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Tyw-00000007Jmh-3c82;
	Mon, 28 Apr 2025 19:17:34 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Twz-00000007JZI-057I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 19:15:34 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SJFQ4A3483992
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 14:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745867726;
	bh=lBCJPzECeQ94pyLvoYBNYZYvuPQv+pUF49fQn7m2S6o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=paY4TVDuTXutO7pM+NNIDs0LVN2B+hE4gQ/q8uG9n7nIZhh5fsJdClT60QCAGHPGn
	 MlmpvvzW8gdmibeUGN3BhVFEOypPNlhE1rHT6ZvXOfUxZY70/4pHV0WGoJsV2HHyUS
	 z91bBLmk4ul5PRMYkYDsxgUb0XaFst9rzXoglBpQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SJFQCM127901
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 14:15:26 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 14:15:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 14:15:26 -0500
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SJFPe6065459;
	Mon, 28 Apr 2025 14:15:25 -0500
Message-ID: <76193d4e-965b-4029-98ba-393870e5f86f@ti.com>
Date: Mon, 28 Apr 2025 14:15:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: ti_sci: Convert CPU latency constraint from us
 to ms
To: Nishanth Menon <nm@ti.com>
CC: <kristo@kernel.org>, <ssantosh@kernel.org>, <d-gole@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250425153754.2141984-1-k-willis@ti.com>
 <20250425190803.s7bag5fop7hsxcxe@sliced>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20250425190803.s7bag5fop7hsxcxe@sliced>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_121533_231904_FD39A7B6 
X-CRM114-Status: GOOD (  20.40  )
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

On 4/25/25 14:08, Nishanth Menon wrote:
> On 10:37-20250425, Kendall Willis wrote:
>> Fix CPU resume latency constraint units sent to TI SCI firmware.
>> CPU latency constraints are set using the PM QoS framework. The PM QoS
>> framework uses usecs as the units for latency whereas the device manager
>> uses msecs, so a conversion is needed before passing to device manager.
>>
> 
> If this is a bug fix (sounds like it), follow the stable kernel rules.
> 
> Also please do not expect reviewers in the community know what this
> means, I think you intent to point folks to the url
> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#tisci-msg-lpm-set-latency-constraint
> 
> If so, add the reference to your commit message.
>  >
>> Signed-off-by: Kendall Willis <k-willis@ti.com>
>> Reviewed-by: Dhruva Gole <d-gole@ti.com>
>> ---
>> Test log [1] shows entry to MCU Only low power mode by sending a CPU
>> resume latency constraint of 100000 us using PM QoS. MCU Only is shown
>> to be entered by 0x1 as the printed mode.
>>
>> [1] https://gist.github.com/kwillis01/059a2ca38232387b414bc6f4b87c7475
>> ---
>>   drivers/firmware/ti_sci.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index 806a975fff22..bc138a837430 100644
>> --- a/drivers/firmware/ti_sci.c
>> +++ b/drivers/firmware/ti_sci.c
>> @@ -3670,6 +3670,7 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
>>   	struct ti_sci_info *info = dev_get_drvdata(dev);
>>   	struct device *cpu_dev, *cpu_dev_max = NULL;
>>   	s32 val, cpu_lat = 0;
>> +	u16 cpu_lat_ms;
>>   	int i, ret;
>>   
>>   	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
>> @@ -3682,9 +3683,13 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
>>   			}
>>   		}
>>   		if (cpu_dev_max) {
>> -			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u\n", __func__, cpu_lat);
>> +			/* PM QoS latency unit is usecs, TI SCI uses msecs */
>> +			cpu_lat_ms = cpu_lat / USEC_PER_MSEC;
> 
> round_down or a round_up? I assume you intent round_down, please
> document that in the comments.
> 
>> +			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u ms\n", __func__,
>> +				cpu_lat_ms);
>>   			ret = ti_sci_cmd_set_latency_constraint(&info->handle,
>> -								cpu_lat, TISCI_MSG_CONSTRAINT_SET);
>> +								cpu_lat_ms,
>> +								TISCI_MSG_CONSTRAINT_SET);
>>   			if (ret)
>>   				return ret;
>>   		}
>>
>> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
>> -- 
>> 2.34.1
>>
> 

Thanks for looking this over, Nishanth. I will implement your comments 
in V2.

Best,
Kendall Willis

