Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DE9C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 20:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LmW0E/vkDNIAhf3X31SRxOQwtkOCbr34v6CbexZ2HU=; b=RUWKWSE0JvuWKqxArTUNP9aHbL
	nv0SZmGsJo5tsh89rxykvzWT67V1xCFBvcD3Z8ZyQvOedSUci3f4saPafgmgb2Dsiwj4S2sxL1wbx
	03AVnZtDPjYUO8HeD4OxJqs52LJJqbNmL5fZ2SgSZ+0hsumf8eliUmb4raG8Cd/AdV2pRKhFK8t3h
	WRUm9PKwi909NbHGCqkjzlCGANu8s+GKgRN9IMw2AZopBtdq1dlQuIMBikT2plxmF4rQjbicliSQq
	W4Gf1Mdpgjj0dx6uMfPLrik1xacE+p5fkgtGyvvpHmFkU7WwVhMVG4QtIyEIh3bqqKfctAiVhXVl/
	rspXUy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugUIY-0000000FMVm-0Yq8;
	Mon, 28 Jul 2025 20:18:14 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugUG4-0000000FMHE-4Acc;
	Mon, 28 Jul 2025 20:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0LmW0E/vkDNIAhf3X31SRxOQwtkOCbr34v6CbexZ2HU=; b=ftEeCykmVD7+wuWAjJ/X4kj+un
	YzwkwGVF0bgM2jZgwsHfI7O9O9aUW0SjA7lGCFz5ziPpj/xO5D92x4DDbsdht/rF0MyLn2vhGBKuy
	QS5wcc2eyKQ21yp0+tRu3vbWrGHr8xtNO9RwghEkLHFdnvlzjNsTiWEdtrCbvwkMUi4ClEVA67Xk6
	L1rk5jmpjI5vbm+sucG+o3hGd4jwbu7r9GBZiT3TPNiys0ZKqDGyapJY7hx0An3mXThhtiDV6008+
	Un7XGFM6jmXWq3X15uln72QKltAU506EEsPYgiFowCXrTGty+sHnT2LmBFH0nbVOZshOLTjt8VP1n
	t4R3hg2A==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ugUFn-005571-H1; Mon, 28 Jul 2025 22:15:23 +0200
Message-ID: <b19643a7-33b1-4b75-83ec-6027ed69d4c0@igalia.com>
Date: Mon, 28 Jul 2025 17:15:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Stefan Wahren <wahrenst@gmx.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
 <673f3f05-53f1-4eb4-ae65-a3cd9ccbd1bf@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <673f3f05-53f1-4eb4-ae65-a3cd9ccbd1bf@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_131542_301645_FB8C2DD8 
X-CRM114-Status: GOOD (  24.37  )
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

Hi Stefan,

On 28/07/25 13:33, Stefan Wahren wrote:
> Hi Maíra,
> 
> thanks for working on this.
> 
> Am 28.07.25 um 14:35 schrieb Maíra Canal:
>> Currently, when we prepare or unprepare RPi's clocks, we don't actually
>> enable/disable the firmware clock. This means that
>> `clk_disable_unprepare()` doesn't actually change the clock state at
>> all, nor does it lowers the clock rate.
>>
>>  From the Mailbox Property Interface documentation [1], we can see that
>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>> prepare and an unprepare hook for RPi's firmware clock.
>>
>> As now the clocks are actually turned off, some of them are now marked
>> with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
>> early boot or are required during reboot.
>>
>> Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property- 
>> interface [1]
>> Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
> could you please explain from user perspective, which issue is fixed by 
> this patch?

I was about to talk about the power savings benefits for the user.
However, as I type, I notice that such a thing doesn't justify a
"Fixes:" tag. I'll drop it.

Thanks for your review, I'll address all the comments.

Best Regards,
- Maíra

> 
> Why does this needs to be backported?
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/clk/bcm/clk-raspberrypi.c | 41 +++++++++++++++++++++++++++++ 
>> +++++++++-
>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk- 
>> raspberrypi.c
>> index 
>> 8e4fde03ed232b464165f524d27744b4ced93a60..a2bd5040283a2f456760bd685e696b423985cac0 100644
>> --- a/drivers/clk/bcm/clk-raspberrypi.c
>> +++ b/drivers/clk/bcm/clk-raspberrypi.c
>> @@ -68,6 +68,7 @@ struct raspberrypi_clk_variant {
>>       char        *clkdev;
>>       unsigned long    min_rate;
>>       bool        minimize;
>> +    u32        flags;
>>   };
>>   static struct raspberrypi_clk_variant
>> @@ -75,6 +76,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>       [RPI_FIRMWARE_ARM_CLK_ID] = {
>>           .export = true,
>>           .clkdev = "cpu0",
>> +        .flags = CLK_IGNORE_UNUSED,
>>       },
>>       [RPI_FIRMWARE_CORE_CLK_ID] = {
>>           .export = true,
>> @@ -90,6 +92,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>            * always use the minimum the drivers will let us.
>>            */
>>           .minimize = true,
>> +        .flags = CLK_IGNORE_UNUSED,
>>       },
>>       [RPI_FIRMWARE_M2MC_CLK_ID] = {
>>           .export = true,
>> @@ -115,6 +118,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>            * drivers will let us.
>>            */
>>           .minimize = true,
>> +        .flags = CLK_IGNORE_UNUSED,
>>       },
>>       [RPI_FIRMWARE_V3D_CLK_ID] = {
>>           .export = true,
>> @@ -127,6 +131,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>       [RPI_FIRMWARE_HEVC_CLK_ID] = {
>>           .export = true,
>>           .minimize = true,
>> +        .flags = CLK_IGNORE_UNUSED,
>>       },
>>       [RPI_FIRMWARE_ISP_CLK_ID] = {
>>           .export = true,
>> @@ -135,6 +140,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>       [RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
>>           .export = true,
>>           .minimize = true,
>> +        .flags = CLK_IS_CRITICAL,
>>       },
>>       [RPI_FIRMWARE_VEC_CLK_ID] = {
>>           .export = true,
>> @@ -259,7 +265,40 @@ static int 
>> raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
>>       return 0;
>>   }
>> +static int raspberrypi_fw_prepare(struct clk_hw *hw)
>> +{
>> +    const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
>> +    struct raspberrypi_clk *rpi = data->rpi;
>> +    u32 state = RPI_FIRMWARE_STATE_ENABLE_BIT;
>> +    int ret;
>> +
>> +    ret = raspberrypi_clock_property(rpi->firmware, data,
>> +                     RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>> +    if (ret)
>> +        dev_err(rpi->dev, "Failed to set clock %d state to on: %d",
>> +            data->id, ret);
> I suggest to use dev_err_ratelimited for prepare/unprepare, otherwise 
> this could spam the kernel log.
> 
> Furthermore i wouldn't recommend to log some magic clock id. How about 
> using clk_hw_get_name(hw) instead?
> 
> Don't we need a newline character at the end?
> 
>> +
>> +    return ret;
>> +}
>> +
>> +static void raspberrypi_fw_unprepare(struct clk_hw *hw)
>> +{
>> +    const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
>> +    struct raspberrypi_clk *rpi = data->rpi;
>> +    u32 state = 0;
>> +    int ret;
>> +
>> +    ret = raspberrypi_clock_property(rpi->firmware, data,
>> +                     RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>> +    if (ret)
>> +        dev_err(rpi->dev, "Failed to set clock %d state to off: %d",
>> +            data->id, ret);
> see above
> 
> Best regards
>> +}
>> +
>> +
>>   static const struct clk_ops raspberrypi_firmware_clk_ops = {
>> +    .prepare        = raspberrypi_fw_prepare,
>> +    .unprepare      = raspberrypi_fw_unprepare,
>>       .is_prepared    = raspberrypi_fw_is_prepared,
>>       .recalc_rate    = raspberrypi_fw_get_rate,
>>       .determine_rate    = raspberrypi_fw_dumb_determine_rate,
>> @@ -289,7 +328,7 @@ static struct clk_hw 
>> *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
>>       if (!init.name)
>>           return ERR_PTR(-ENOMEM);
>>       init.ops = &raspberrypi_firmware_clk_ops;
>> -    init.flags = CLK_GET_RATE_NOCACHE;
>> +    init.flags = variant->flags | CLK_GET_RATE_NOCACHE;
>>       data->hw.init = &init;
>>
> 


