Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F7DC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 06:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE0FAIY1dIyIhNWdzfvXZWvPYm623Zb2EGWRdg2QQio=; b=dxAZtBhrcrEDun9EarESdvfNNl
	NzPD7frg645AKFxHSIju7U8ocEEufipmTK9+O6SMgv/36SBACMYrpx6pH4/s2yRVm0GKOqNPqgTGr
	xJAbHCqvldPMf1o4iXG74KP6hUd0xcouEM0PCYHbr/FdqjYNVcEm+qA93+wLCTbKCxtlb0vaGS0RR
	xSmXIb0uczVAHkjbhKAnsNZnz1bAI6g7RjzVZzWp9HHbIDcKM4+krJgoHR8RmdFZtV2Wb3/v9rVLa
	e8YGpfCZTC9ZLMbzRzDIgBKnv9uEeX+sS4piS8J+BnTA07HhIzVZVDaGeqDmJ+1yKteLaJuuGzkFL
	OhPrXX4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5dWs-00000001SBY-3lpw;
	Sun, 13 Sep 2026 06:17:30 +0000
Received: from mail-m128212.netease.com ([103.209.128.212])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5dWm-00000001SAs-3V0Q;
	Sun, 13 Sep 2026 06:17:28 +0000
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d8d80e68;
	Sun, 13 Sep 2026 14:17:08 +0800 (GMT+08:00)
Message-ID: <5f5a3210-44e1-4d56-ab44-aea2fe3cabae@rock-chips.com>
Date: Sun, 13 Sep 2026 14:17:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/rockchip: dsi: Add maximum per lane bit rate
 calculation
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chaoyi Chen <kernel@airkyi.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260812073002.328-1-kernel@airkyi.com>
 <20260812073002.328-2-kernel@airkyi.com> <9674763.CDJkKcVGEf@phil>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <9674763.CDJkKcVGEf@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09969941d03a7kunm769b3eaa96f912
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTEsfVhlCTUkZSh4dH05LGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=GAJ5dMwy21VmCnJabb1L9TQt7b2IDU9Uq/uVBCd3W1ZJPdjMZOkOHgn5LiqAgg3GA0pHy4C3q4EUx4G7Hz1skBBdZLC9AW8rueILzdxDsEfhB5+YqQqTqewhPSW77CuWLWUJinCQ0Gmq7MLqHcATbjzdyKYT8nT+8AEEL8AngmA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=XE0FAIY1dIyIhNWdzfvXZWvPYm623Zb2EGWRdg2QQio=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_231726_297337_B87AEA88 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

Hi Heiko,

On 9/12/2026 8:32 PM, Heiko Stuebner wrote:
> Am Mittwoch, 12. August 2026, 09:30:00 Mitteleuropäische Sommerzeit schrieb Chaoyi Chen:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Different chips have varying support for the maximum bit rate per lane.
>>
>> Add calculation for the maximum per lane bit rate for various chip
>> platforms.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> [...]
> 
>> @@ -573,6 +574,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>>  	unsigned long _fbdiv, best_fbdiv;
>>  	unsigned long min_delta = ULONG_MAX;
>>  
>> +	max_mbps = dsi->cdata->max_bit_rate_per_lane / USEC_PER_SEC;
> 
> As the value is called max_bit_rate_per_lane, I guess Sashiko
> is correct in that the max_mbps check should use "<=" ?
> 

Thanks for pointing this out. I'll fix it in v5.

> 
> Heiko

-- 
Best, 
Chaoyi


