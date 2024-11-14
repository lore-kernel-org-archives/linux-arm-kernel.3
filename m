Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752D0D65C79
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1ywcfO9i+71hVtdY/0qw/C0oczY0VIwKb/fx6QJHw4=; b=rJjofbLjz1Zb/o6kzMtSDQCGuX
	0CuaD2BCoP1kmRTGomPLTEDK31B/yRMDAC7RFlOwyioKV1yO7TkxM7kQggjUkn9DKaSe+DFWKCcMK
	LdZ9/o1RDl1K2dABUwv5QJPuiPiL7D680VmQVJtp60UJbp9CVE1QuePKDJc3KZSfvBziMOljgt9hV
	2O99k5C2wVNIMfSzl8zFWKd3CwvwO20ds/fHZh1bjLSfn3df3zgLJgYxqs+5eLxr6jE81pDceEQ8k
	0nR3erLTcDyJnguV+Vqgob8cPRQxFaDOifik/l2hrqQ21gWbeFAyMOV7m8jyVOwR5BmoZxgsrDg4M
	QFffP6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXwY-00000009iRI-2nNk;
	Thu, 14 Nov 2024 11:23:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBX5W-00000009XMl-35OS;
	Thu, 14 Nov 2024 10:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731580111;
	bh=jwgoRarckGp4IApZV/vwQhGXTbYx/T8btKhE/KN4R5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KmBePFObGzJgBODqO4RvBUcOJ3Ht5iDtLOxqgfoEDG5hoURFynp5E3MajsZ2TC7ps
	 rN03pIh0Ij7fD/1jernHXeJUZdHyjrc7zVGnvzrfw/TSxtYZEjvlhpKxJPgS+1J9Xq
	 4ILH3JweUJkbhrTeWaYhubsFiiIssUIEbrVzEr3EqRW5oBoftdrhDyBAisqQt3QwD+
	 rR18lOY1T3VHCa7B0H2qLA52bDaNm556QDJJqfQEVjb9n2gdTjjtXaPztTqYbDq0jv
	 tTEFuz0oUf1kqUc1KEKdOnN12bsFKS1WoRsTNeiczLV00cjjIR3VHZB6qEGD/X98A1
	 KlS0yuWkQtyBw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B1A1F17E35E0;
	Thu, 14 Nov 2024 11:28:30 +0100 (CET)
Message-ID: <6583e7a8-f4dd-4670-83dc-73ad4c5f208f@collabora.com>
Date: Thu, 14 Nov 2024 11:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Switch to
 IMMEDIATE_MODE
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241108-lvts-v1-1-eee339c6ca20@chromium.org>
 <02bbfb8c-817c-447a-92b9-bd03d76b66b1@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <02bbfb8c-817c-447a-92b9-bd03d76b66b1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_022834_956139_41C99649 
X-CRM114-Status: GOOD (  14.74  )
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

Il 14/11/24 09:13, Daniel Lezcano ha scritto:
> On 08/11/2024 07:46, Hsin-Te Yuan wrote:
>> Currently, MT8192 cannot suspend with FILTERED_MODE. Switch to
>> IMMEDIATE_MODE will fix this.
> 
> Given the comments and the different changes related to the filtered and immediate 
> modes, I won't apply the patch until this is clearly sorted out.
> 

Thanks - indeed do not apply this for now.

If this has been broken for a year, one or two more weeks ain't gonna be a
show stopper, as long as we can come to a proper fix during that time, instead
of yet another compromise.

Anyway....

We discussed about that internally and we do suspect that there might be some
interrupt that is getting erroneously enabled, never handled, and constantly
firing because.. well, it was never handled, so... :-)

Nicolas is looking into this issue, and I really hope that we can come to a
conclusion that will make us switch back all of the SoCs to filtered mode
instead, as there indeed are some advantages in using that.

Cheers,
Angelo

>> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
>> ---
>>   drivers/thermal/mediatek/lvts_thermal.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/ 
>> lvts_thermal.c
>> index 
>> 1997e91bb3be94a3059db619238aa5787edc7675..daad52f14fc03d0c4131f2ffdf3eb6b49a4a43d0 100644
>> --- a/drivers/thermal/mediatek/lvts_thermal.c
>> +++ b/drivers/thermal/mediatek/lvts_thermal.c
>> @@ -1541,7 +1541,6 @@ static const struct lvts_ctrl_data 
>> mt8192_lvts_mcu_data_ctrl[] = {
>>           },
>>           VALID_SENSOR_MAP(1, 1, 0, 0),
>>           .offset = 0x0,
>> -        .mode = LVTS_MSR_FILTERED_MODE,
>>       },
>>       {
>>           .lvts_sensor = {
>> @@ -1552,7 +1551,6 @@ static const struct lvts_ctrl_data 
>> mt8192_lvts_mcu_data_ctrl[] = {
>>           },
>>           VALID_SENSOR_MAP(1, 1, 0, 0),
>>           .offset = 0x100,
>> -        .mode = LVTS_MSR_FILTERED_MODE,
>>       },
>>       {
>>           .lvts_sensor = {
>> @@ -1567,7 +1565,6 @@ static const struct lvts_ctrl_data 
>> mt8192_lvts_mcu_data_ctrl[] = {
>>           },
>>           VALID_SENSOR_MAP(1, 1, 1, 1),
>>           .offset = 0x200,
>> -        .mode = LVTS_MSR_FILTERED_MODE,
>>       }
>>   };
>>
>> ---
>> base-commit: 906bd684e4b1e517dd424a354744c5b0aebef8af
>> change-id: 20241108-lvts-f7beb36efc59
>>
>> Best regards,
> 
> 



