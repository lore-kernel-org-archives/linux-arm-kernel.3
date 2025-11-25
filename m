Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD792D0E6C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+p3iBX443onhYaG1ds1vtdFOZO5aHgSXuJK6totL95U=; b=urf5zHi/l74qiVHB6tgmLDE6Kp
	Wa4j6LHb2KnEw/pybQXILMFNgsmGfa+yAtSNQiL0n/tPji5zeB5CTP5UVc9ihr1iZX20HRYk8XVYw
	ko3zSbKa6VaRUFAIf/z2650uEfb2lIurgO2e5tdNoTwHi/aPTMcYyV0oeHX9Ae5S613m5wZeNwWvN
	I+xwxc4kiarH/EQTobKTrA5b/1J+u1ZIRSFhU4WjmxiYPaKp7Mi3EZT1w9zqsZOTFhQektH9D9Qyg
	20KQ4HcJBlVQu28wZBRwWhVq/+c7CSkgla0GA6I3ue6939udMm3qO6X9Yhu22sLVmSSAjgSjJxlGR
	vmFFCVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqss-0000000DBAe-22N7;
	Tue, 25 Nov 2025 11:06:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqsp-0000000DB9Q-1i5G;
	Tue, 25 Nov 2025 11:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764068812;
	bh=zitmyeJM/e+uubNBjBrLCDFGnrlsT/zseaM6ZX7jwWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dHYp2lEFQ5qHF5N/dLWxalTJzB09Ety5wgNNxpS9maSF9lQvM+c2xkcVaTyIu4ia3
	 4HPsAcnG8U8Fin/Pjy3ZMkwV+vAqthuFUSVgBkbP3kzETPcjMeB4IT1MnZTd7qkJ/j
	 OvUduGcYE8+wxIH1qj8Of/A9K4dY0z3WtCu7FhvUh5UA74vz5wNtVhfu+Jo4jNwMoc
	 yj/Ru2pWaMijAMO2IrGcPj3po2kes4MsZqSAcUvP2ewWRkRrVOPvHm/QbrPIiqo6g2
	 GsunTuZgxaujnYTcRS4COnW/YT1dTvxHqxD/lErpiv148z9HMPm1wBx4aXHgdzPR5A
	 /nrr+ClQbOcVA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:657b:ae76:a0f8:4811])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9136517E12E2;
	Tue, 25 Nov 2025 12:06:50 +0100 (CET)
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
	u.kleine-koenig@baylibre.com,
	wenst@chromium.org
Subject: Re: [PATCH v4 2/9] thermal/drivers/mediatek/lvts: Make number of calibration offsets configurable
Date: Tue, 25 Nov 2025 12:06:39 +0100
Message-Id: <20251125110639.23257-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <24a5bd31-a79f-4f18-a190-6a4d886a29b2@linaro.org>
References: <24a5bd31-a79f-4f18-a190-6a4d886a29b2@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_030655_604952_91667D2A 
X-CRM114-Status: GOOD (  18.32  )
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

On 11/24/25 19:25, Daniel Lezcano wrote:
> On 11/21/25 12:16, Laura Nao wrote:
>> MT8196/MT6991 use 2-byte eFuse calibration data, whereas other SoCs
>> supported by the driver rely on 3 bytes. Make the number of calibration
>> bytes per sensor configurable, enabling support for SoCs with varying
>> calibration formats.
>>
>> Reviewed-by: Fei Shao <fshao@chromium.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Tested-by: Frank Wunderlich <frank-w@public-files.de>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>   drivers/thermal/mediatek/lvts_thermal.c | 32 ++++++++++++++++++++++----------
>>   1 file changed, 22 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
>> index ab55b20cda47..1c54d0b75b1a 100644
>> --- a/drivers/thermal/mediatek/lvts_thermal.c
>> +++ b/drivers/thermal/mediatek/lvts_thermal.c
>> @@ -96,12 +96,14 @@
>>     #define LVTS_MINIMUM_THRESHOLD        20000
>>   +#define LVTS_MAX_CAL_OFFSETS        3 
>
> I suggest LVTS_NUM_CAL_OFFSETS then below,
>

Right - as this is SoC-specific, I can define:

#define LVTS_NUM_CAL_OFFSETS_MT7988	3
#define LVTS_NUM_CAL_OFFSETS_MT8196	2

>> +
>>   static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
>>   static int golden_temp_offset;
>>     struct lvts_sensor_data {
>>       int dt_id;
>> -    u8 cal_offsets[3];
>> +    u8 cal_offsets[LVTS_MAX_CAL_OFFSETS];
>>   };
>>     struct lvts_ctrl_data {
>> @@ -127,6 +129,7 @@ struct lvts_data {
>>       const struct lvts_ctrl_data *lvts_ctrl;
>>       const u32 *conn_cmd;
>>       const u32 *init_cmd;
>> +    int num_cal_offsets;
>>       int num_lvts_ctrl;
>>       int num_conn_cmd;
>>       int num_init_cmd;
>> @@ -711,7 +714,7 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
>>                       u8 *efuse_calibration,
>>                       size_t calib_len)
>>   {
>> -    int i;
>> +    int i, j;
>>       u32 gt;
>>         /* A zero value for gt means that device has invalid efuse data */
>> @@ -720,17 +723,18 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
>>       lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
>>           const struct lvts_sensor_data *sensor =
>>                       &lvts_ctrl_data->lvts_sensor[i];
>> +        u32 calib = 0;
>>   -        if (sensor->cal_offsets[0] >= calib_len ||
>> -            sensor->cal_offsets[1] >= calib_len ||
>> -            sensor->cal_offsets[2] >= calib_len)
>> -            return -EINVAL;
>> +        for (j = 0; j < lvts_ctrl->lvts_data->num_cal_offsets; j++) {
>> +            u8 offset = sensor->cal_offsets[j];
>> +
>> +            if (offset >= calib_len)
>> +                return -EINVAL;
>> +            calib |= efuse_calibration[offset] << (8 * j); 
>
> May be worth for a comment here, ideally a separate function to clarify the code
>

Ack - will do.

>> +        }
>>             if (gt) {
>> -            lvts_ctrl->calibration[i] =
>> -                (efuse_calibration[sensor->cal_offsets[0]] << 0) +
>> -                (efuse_calibration[sensor->cal_offsets[1]] << 8) +
>> -                (efuse_calibration[sensor->cal_offsets[2]] << 16);
>> +            lvts_ctrl->calibration[i] = calib;
>>           } else if (lvts_ctrl->lvts_data->def_calibration) {
>>               lvts_ctrl->calibration[i] = lvts_ctrl->lvts_data->def_calibration;
>>           } else {
>> @@ -1763,6 +1767,7 @@ static const struct lvts_data mt7988_lvts_ap_data = {
>>       .temp_factor    = LVTS_COEFF_A_MT7988,
>>       .temp_offset    = LVTS_COEFF_B_MT7988,
>>       .gt_calib_bit_offset = 24,
>> +    .num_cal_offsets = 3, 
>
> LVTS_NUM_CAL_OFFSETS
>
>

I'll submit a v5 with the required changes.

Thanks!

Laura

