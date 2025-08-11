Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B3CCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 23:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WOQQytnvdG+ExQxM0wRnwxWgx7TDMfbUEkljON2sWA=; b=OjLsFB+gvRXKlKcv77btrs8qs3
	4Qf1f7hMtto32D1CEr4BLI8AhfapB4ZDdWFBSbDWUa0C218ZVifnXmXJTNh9vD3VpaOCwujk7/ZXj
	Lb6Z8sVQV9bj54WDkFqqDdUHDUvkkvjl51cJfY4Wl/p6ZPsQEAhlohujQuBSIGKlM4lFi+Cz7wqba
	Wba9ZwioB8QAWyyfb1MpRcNcMXeebblJLJCXbALG2deLdK294pNBpug4SilnzMB9blCLlEnXoMMbf
	RrncAUlopUtAntPNQxdMiQn3xw7VjpUW036VxjBmjwfJl3RmoM/sLo1qZPCISwPxEcybhDe0/7bt2
	cadiOLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulbqt-00000009NcM-3xng;
	Mon, 11 Aug 2025 23:22:51 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulboH-00000009NQZ-3H0s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 23:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1754954408;
 bh=4WOQQytnvdG+ExQxM0wRnwxWgx7TDMfbUEkljON2sWA=;
 b=qPeSjuwUgPuuYj+tgO+UkzQmBW0QxS8cS4X4QyrmBD8ve0HtxYb3cXFzieXZVqRdmGjWJ/1jq
 BnSK2j58WdjUhqrrpE2BfCH85E3HINzy2C+Jy/apTAd2pnnrSM9qztPBIgiBVJmpCK0GleZxPKV
 M7Ads3U3eEBSpk5uTLqVuiO3k8Lg9FY9w8wC3VIiuO++YFFUbXSm574mauDYel2wNTqORcQYEFq
 bnpGc8wKg1RsPfZSCfrg6Z8rINdweSisEe9QqZ5sp70NP43FPZu1OBGg/jW/oaGIsm5cKG1e/5X
 pdyora3jIqnq6y69j0WeXz6h2bWxyHZqcHDZ7onnrN6w==
X-Forward-Email-ID: 689a77d9de615f3104e098e6
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <9dce97a9-92e6-4803-9e06-b2938e3c4999@kwiboo.se>
Date: Tue, 12 Aug 2025 01:08:04 +0200
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
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <3cf31d3b89a66b1bec57486c54c3df31393335e5.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_162009_857188_1321A61D 
X-CRM114-Status: GOOD (  20.58  )
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

Hi Nicolas,

Missed some comments in my last mail.

On 8/11/2025 11:25 PM, Nicolas Dufresne wrote:
> Le dimanche 10 août 2025 à 21:24 +0000, Jonas Karlman a écrit :
>> From: Alex Bee <knaerzche@gmail.com>
>>
>> The RK3328 VDEC has a HW quirk that require QoS to be disabled when HEVC
>> or VP9 is decoded, otherwise the decoded picture may become corrupted.
>>
>> Add a RK3328 variant with a quirk flag to disable QoS when before
>> decoding is started.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> Changes in v2:
>> - No change
>> ---
>>  drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c |  9 +++++++++
>>  drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h |  2 ++
>>  drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c  | 10 ++++++++++
>>  drivers/media/platform/rockchip/rkvdec/rkvdec.c      | 12 ++++++++++++
>>  drivers/media/platform/rockchip/rkvdec/rkvdec.h      |  4 ++++
>>  5 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>> index 1994ea24f0be..f8bb8c4264f7 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>> @@ -789,6 +789,15 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
>>  
>> +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
>> +		u32 reg;
>> +
>> +		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>> +		reg |= 0xFFFF;
>> +		reg &= ~BIT(12);
> 
> I wonder if there is a better way to express that, if not, a comment for future
> readers would be nice. If read it will, we keep the upper 16bit, and replaced
> the lower bits with 0xEFFF (all bits set except 12) ? I'd rather not spend time
> thinking if I walk by this code again.

Vendor kernel use following comment to describe the purpose of this [1]:

  HW defeat workaround: VP9 and H.265 power save optimization cause
  decoding corruption, disable optimization here.

From the TRM we can see following for rkvdec_swreg99_qos_ctrl:

  27:26 sw_axi_wr_hurry_level
    00: hurry off 
    01~11: hurry level 
  25:24 sw_axi_rd_hurry_level
    00: hurry off 
    01~11: hurry level 
  23:16 sw_bus2mc_buffer_qos_level
    range is: 0~255
    the value is means that left space <=
    sw_bus2mc_buffer_qos_level, it will give hurry
  15:0 swreg_block_gating_e

So yes this set swreg_block_gating_e to 0xEFFF. Possible this configure
hw to not auto gate most internal clocks?

Could add a comment and possible use something like following:

  reg &= GENMASK(31, 16);
  reg |= 0xEFFF;

[1] https://github.com/Kwiboo/linux-rockchip/blob/linux-6.1-stan-rkr6.1/drivers/video/rockchip/mpp/mpp_rkvdec.c#L857-L867

> 
>> +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>> +	}
>> +
>>  	/* Start decoding! */
>>  	reg = (run.pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ?
>>  		0 : RKVDEC_WR_DDR_ALIGN_EN;
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>> index 540c8bdf24e4..c627b6b6f53a 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>> @@ -219,6 +219,8 @@
>>  #define RKVDEC_REG_H264_ERR_E				0x134
>>  #define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) & 0x3fffffff)
>>  
>> +#define RKVDEC_REG_QOS_CTRL				0x18C
>> +
>>  #define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
>>  #define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
>>  
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>> index 0e7e16f20eeb..cadb9d592308 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>> @@ -824,6 +824,16 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
>>  
>>  	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
>> +
>> +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
>> +		u32 reg;
>> +
>> +		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>> +		reg |= 0xFFFF;
>> +		reg &= ~BIT(12);
>> +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> 
> Can we deduplicate that ?

Guess so, any suggestion on how to best do that?

One possible way that comes to mind:

  if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS)
	rkvdec_quirk_disable_qos(rkvdec);

> 
>> +	}
>> +
>>  	/* Start decoding! */
>>  	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
>>  	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,

[snip]

