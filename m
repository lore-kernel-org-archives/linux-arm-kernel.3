Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADA8CD8C9C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwY8/spu0ONdqdQvGiutjYHEIa06VccOFD73h04xJ2g=; b=NGLRYnCaKEodNE7LCy14QOFac1
	2FuQQWlyqKuWscOUpTEbhKYUbkQdNYXruFutdIBHnhlVL1IA/5Zep1j5tAy0ZLA+PeJyDJ737vRVF
	ptYN8RpgBMvs5h/cy1s8zE51LS5qp1P0I43ynRQIi0kl64ze/cgzL2B02uj1uLpFtyvlnJG2vfk+0
	serncwELry+LIy5qSBinz1OVIzgWvXxCFv2NfRH99ZHzumGmRvA/L6J4HdxAkoqOvJc+PymkkWp6T
	jQm3y70A41O/+nDQqNe9mcUfjHRzEfeXVBni77NnON7WXE7u6rvX3ea8NMvg4NttnFLgvNNAbXc1E
	Q46JyCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa4M-0000000An5S-0FhV;
	Thu, 13 Nov 2025 16:21:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa4K-0000000An4j-13fB;
	Thu, 13 Nov 2025 16:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763050864;
	bh=eBWGYbEPMSvsTZJWmtZWO1t79PMxcV429zFLf0WhYQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FXGx0vo55dQWrQLSZ6T5FwniDgYI8sm4cMlr4ZHSh0vV2u9jFCJsdEcRIbc7Tqdhr
	 w/P4ldsvV+lsw6AGnXfWLgVu6XnFxaQ+J11rJiHgM8vE6bmEJs+AsfaIZUoYvZR8nh
	 T5c7GcM+bDwbbNxRvnwst2Dr0au4OntLx9K99s3uAMbmEuJt67dgU8iyTogu4ch3MD
	 xyYEPdMW+4+e4UgU7z0ppYQvxdtIv3Sx1eHwZFWIBZrSOv8GCYEIkyvJBVlS+ISK7F
	 uip+yMNGWz97aCboHz61ru3EoKCProh9B/a0t23QVRJyGwwYGsEqVNkAbiuhI5c4Wx
	 T2IyvBkxMAO/g==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:9cb8:f653:99e7:c419])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 97DB117E1341;
	Thu, 13 Nov 2025 17:21:03 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: daniel.lezcano@linaro.org
Cc: andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	arnd@arndb.de,
	bchihi@baylibre.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	frank-w@public-files.de,
	fshao@chromium.org,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	lala.lin@mediatek.com,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	nfraprado@collabora.com,
	rafael@kernel.org,
	robh@kernel.org,
	rui.zhang@intel.com,
	srini@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH RESEND v3 4/9] thermal: mediatek: lvts: Add platform ops to support alternative conversion logic
Date: Thu, 13 Nov 2025 17:20:53 +0100
Message-Id: <20251113162053.281093-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <1e0545da-5d24-4ca4-863d-0d5671902d0b@linaro.org>
References: <1e0545da-5d24-4ca4-863d-0d5671902d0b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_082108_511295_B190776B 
X-CRM114-Status: GOOD (  22.78  )
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

Hi Daniel,

On 11/10/25 14:06, Daniel Lezcano wrote:
> On 10/16/25 16:21, Laura Nao wrote:
>> Introduce lvts_platform_ops struct to support SoC-specific versions of
>> lvts_raw_to_temp() and lvts_temp_to_raw() conversion functions.
>>
>> This is in preparation for supporting SoCs like MT8196/MT6991, which
>> require a different lvts_temp_to_raw() implementation.
>>
>> Reviewed-by: Fei Shao <fshao@chromium.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>   drivers/thermal/mediatek/lvts_thermal.c | 27 ++++++++++++++++++++++---
>>   1 file changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
>> index 4ef549386add..df1c0f059ad0 100644
>> --- a/drivers/thermal/mediatek/lvts_thermal.c
>> +++ b/drivers/thermal/mediatek/lvts_thermal.c
>> @@ -125,8 +125,14 @@ struct lvts_ctrl_data {
>>               continue; \
>>           else
>>   +struct lvts_platform_ops {
>> +    int (*lvts_raw_to_temp)(u32 raw_temp, int temp_factor);
>> +    u32 (*lvts_temp_to_raw)(int temperature, int temp_factor);
>> +};
>> +
>>   struct lvts_data {
>>       const struct lvts_ctrl_data *lvts_ctrl;
>> +    const struct lvts_platform_ops *ops;
>>       const u32 *conn_cmd;
>>       const u32 *init_cmd;
>>       int num_cal_offsets;
>> @@ -300,6 +306,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>>       struct lvts_ctrl *lvts_ctrl = container_of(lvts_sensor, struct lvts_ctrl,
>>                              sensors[lvts_sensor->id]);
>>       const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
>> +    const struct lvts_platform_ops *ops = lvts_data->ops;
>>       void __iomem *msr = lvts_sensor->msr;
>>       u32 value;
>>       int rc;
>> @@ -332,7 +339,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>>       if (rc)
>>           return -EAGAIN;
>>   -    *temp = lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor);
>> +    *temp = ops->lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor); 
>
> Don't do this in each functions. It does not help for the readability.
>
> May be something like:
>
> int lvts_raw_to_temp(u32 raw_temp, const struct lvts_ctrl_data)
> {
>     return data->ops->lvts_temp_to_raw(raw_temp, data->temp_factor);
> }
>
> or
>
> int lvts_raw_to_temp(u32 raw_temp, const struct lvts_ctrl_data)
> {
>     int temperature;
>
>     if (data->ops->lvts_temp_to_raw)
>         return data->ops->lvts_temp_to_raw(raw_temp, data->temp_factor);
>
>     temperature = ((s64)(raw_temp & 0xFFFF) * temp_factor) >> 14;
>         temperature += golden_temp_offset;
>
>         return temperature;
> }
>
> ... and get rid of all the lvts_platform_ops_v1
>
> (btw _v1 is confusing, it suggests there multiple versions of the same SoC)
>

Right, the first option looks more efficient. Since temp_offset is 
already part of lvts_data, the function would look like:

int lvts_raw_to_temp(u32 raw_temp, const struct lvts_data *lvts_data)
{
	return lvts_data->ops->lvts_raw_to_temp(raw_temp, lvts_data->temp_factor);
}

and the same pattern applies for temp_to_raw().

This change will require renaming the existing 
lvts_raw_to_temp()/lvts_temp_to_raw()/lvts_temp_to_raw_v2() 
implementations. I agree the current _v1 and _v2 suffixes aren’t very 
descriptive. Since lvts_temp_to_raw_v2() version is only used by MT8196,
it could be renamed to lvts_temp_to_raw_mt8196(), with the corresponding 
platform ops defined as lvts_platform_ops_mt8196. The base 
lvts_raw_to_temp()/lvts_temp_to_raw() are shared across the other SoCs,
so they could be renamed after the first supported platform (mt7988) and 
reused for all SoCs that share the same logic.

I'll send out a v4 with the proposed changes.

Thanks,

Laura

> [ ... ]
>


