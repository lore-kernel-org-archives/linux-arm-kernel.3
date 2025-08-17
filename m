Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402E7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CUhYVjW9f0TF6cCOLGbcdcZ9oH4iDwa7H4w1bk9Lv0=; b=ygIlj7lVFfEZUPkP/Yncpt+o/6
	IpRdmlvZhGRJX+rAeGAv0MeZEXfbwL/pROjAdA0ktqbLc2MlMVhVveVFa9uE1/FOh+cuqnd9GcnxS
	jvDvkzuUOq7G/3Qz/wBDmrN2rgMWKtGTCSpAfNQeIz4bzXeksjbpPnbrWrgewMbyIbduiAVZ9ajbp
	RG1EV2wNJoZxAO+yIzPFmq+eWxZpE4CaHBmnRTpXMsMs98wXLxGZNbeuNV67seX9J4P9IEn6lc0CA
	43BHeVqXRagjjOAdmWZI+c2xypmk5AR9fR56/q5Km19hI4GqHYE3ZJ2Ack8QRh5o0cZq1ZZwzPidG
	v9AgZY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ung8X-00000005q8o-111W;
	Sun, 17 Aug 2025 16:21:37 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ung5v-00000005pyE-0aSb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 16:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1755447532;
 bh=0CUhYVjW9f0TF6cCOLGbcdcZ9oH4iDwa7H4w1bk9Lv0=;
 b=gyJrorIykmGIARt1tBHrCLhlyQ3u8h5xV05VcWEO5KswAcz7dECSpOoXbXqpqi97U9jbjCSXo
 YNsKKSRyu3umFTKmeRLrJRbnu8HS8dxiMz90RKQtMIDlVe9L2Vv/TRT9SOniCYLUw4z4TOZJFPW
 9V0C6ug1n9XhAM4bQ+0zdQHz8A5G5afQ5Pvc9tyjhum2H5RERACXTJgKqWMNr1xzIb2K4Yl8N3G
 epkeYZnv3g+pAl2SpGS4O/jX6Cj1T0SaOuve9l5BawiENscWwqykSZjcgE4oE60L33ELNv3SyWm
 rOhyGZAqgyzNErhjQ/e5v2IoEO3DCQrQjHQHI6plZycw==
X-Forward-Email-ID: 68a200e89a82a81f459cf4aa
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <a45d0c97-9e31-42a9-aeed-6f874f4f7321@kwiboo.se>
Date: Sun, 17 Aug 2025 18:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] media: rkvdec: Disable QoS for HEVC and VP9 on
 RK3328
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <20250810212454.3237486-6-jonas@kwiboo.se>
 <3cf31d3b89a66b1bec57486c54c3df31393335e5.camel@collabora.com>
 <9dce97a9-92e6-4803-9e06-b2938e3c4999@kwiboo.se>
 <f2908b2d35671e70e6a8b295de623e3a3ffe2212.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <f2908b2d35671e70e6a8b295de623e3a3ffe2212.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_091855_267589_A9F60A6E 
X-CRM114-Status: GOOD (  18.78  )
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

On 8/12/2025 3:00 PM, Nicolas Dufresne wrote:
> Le mardi 12 août 2025 à 01:08 +0200, Jonas Karlman a écrit :
>> Hi Nicolas,
>>
>> Missed some comments in my last mail.
>>
>> On 8/11/2025 11:25 PM, Nicolas Dufresne wrote:
>>> Le dimanche 10 août 2025 à 21:24 +0000, Jonas Karlman a écrit :
>>>> From: Alex Bee <knaerzche@gmail.com>
>>>>
>>>> The RK3328 VDEC has a HW quirk that require QoS to be disabled when HEVC
>>>> or VP9 is decoded, otherwise the decoded picture may become corrupted.
>>>>
>>>> Add a RK3328 variant with a quirk flag to disable QoS when before
>>>> decoding is started.
>>>>
>>>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>>> ---
>>>> Changes in v2:
>>>> - No change
>>>> ---
>>>>  drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c |  9 +++++++++
>>>>  drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h |  2 ++
>>>>  drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c  | 10 ++++++++++
>>>>  drivers/media/platform/rockchip/rkvdec/rkvdec.c      | 12 ++++++++++++
>>>>  drivers/media/platform/rockchip/rkvdec/rkvdec.h      |  4 ++++
>>>>  5 files changed, 37 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>>> index 1994ea24f0be..f8bb8c4264f7 100644
>>>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>>> @@ -789,6 +789,15 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>>>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
>>>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
>>>>  
>>>> +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
>>>> +		u32 reg;
>>>> +
>>>> +		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>>>> +		reg |= 0xFFFF;
>>>> +		reg &= ~BIT(12);
>>>
>>> I wonder if there is a better way to express that, if not, a comment for
>>> future
>>> readers would be nice. If read it will, we keep the upper 16bit, and
>>> replaced
>>> the lower bits with 0xEFFF (all bits set except 12) ? I'd rather not spend
>>> time
>>> thinking if I walk by this code again.
>>
>> Vendor kernel use following comment to describe the purpose of this [1]:
>>
>>   HW defeat workaround: VP9 and H.265 power save optimization cause
>>   decoding corruption, disable optimization here.
>>
>> From the TRM we can see following for rkvdec_swreg99_qos_ctrl:
>>
>>   27:26 sw_axi_wr_hurry_level
>>     00: hurry off 
>>     01~11: hurry level 
>>   25:24 sw_axi_rd_hurry_level
>>     00: hurry off 
>>     01~11: hurry level 
>>   23:16 sw_bus2mc_buffer_qos_level
>>     range is: 0~255
>>     the value is means that left space <=
>>     sw_bus2mc_buffer_qos_level, it will give hurry
>>   15:0 swreg_block_gating_e
>>
>> So yes this set swreg_block_gating_e to 0xEFFF. Possible this configure
>> hw to not auto gate most internal clocks?
>>
>> Could add a comment and possible use something like following:
>>
>>   reg &= GENMASK(31, 16);
>>   reg |= 0xEFFF;
> 
> Thanks for the information, I think this form is somewhat nicer indeed, and a
> little comment, its fine to say that the QOS bits are undocumented.

Sure, I will update this in a v3.

Regards,
Jonas

> 
> Nicolas
> 
>>
>> [1]
>> https://github.com/Kwiboo/linux-rockchip/blob/linux-6.1-stan-rkr6.1/drivers/video/rockchip/mpp/mpp_rkvdec.c#L857-L867
>>
>>>
>>>> +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>>>> +	}
>>>> +
>>>>  	/* Start decoding! */
>>>>  	reg = (run.pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ?
>>>>  		0 : RKVDEC_WR_DDR_ALIGN_EN;
>>>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>>>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>>>> index 540c8bdf24e4..c627b6b6f53a 100644
>>>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>>>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>>>> @@ -219,6 +219,8 @@
>>>>  #define RKVDEC_REG_H264_ERR_E				0x134
>>>>  #define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) &
>>>> 0x3fffffff)
>>>>  
>>>> +#define RKVDEC_REG_QOS_CTRL				0x18C
>>>> +
>>>>  #define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
>>>>  #define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
>>>>  
>>>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>>>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>>>> index 0e7e16f20eeb..cadb9d592308 100644
>>>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>>>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>>>> @@ -824,6 +824,16 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
>>>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
>>>>  
>>>>  	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
>>>> +
>>>> +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
>>>> +		u32 reg;
>>>> +
>>>> +		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>>>> +		reg |= 0xFFFF;
>>>> +		reg &= ~BIT(12);
>>>> +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>>>
>>> Can we deduplicate that ?
>>
>> Guess so, any suggestion on how to best do that?
>>
>> One possible way that comes to mind:
>>
>>   if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS)
>> 	rkvdec_quirk_disable_qos(rkvdec);
>>
>>>
>>>> +	}
>>>> +
>>>>  	/* Start decoding! */
>>>>  	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
>>>>  	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
>>
>> [snip]


