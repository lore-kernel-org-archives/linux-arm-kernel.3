Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A59105A58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQ7JwKnuoHXJS0olGOrRTVXvVa42hV+l4tjHPSq2KbI=; b=Cl/Fxn1L8ZfvO31hUT3sh3hzYL
	NRP+/k8yLGEy5mgh2ezsu3XQ41eXrTd8chHmUAA8C6z9bjf9oaLSPjc/l1U8rlSMgzQBIl+7PQOxT
	rcei10YEcjUg404hgsO3M+VR1QolNkyqFYCcyTf/svbA4UZalYq+TsyIk7n8CXjF8FscIxB0NQcCS
	Bhi7wGeoRiyn5oSzHeA8QKyEBQwh+VOfhu1DDQNOK6jPHRu/J7YlHEwrWk5GS5A/gCnM50ba+b+IU
	eXqcbPNX7CQ/0b51laUNHsG01MWRQShHNdzZoWPnWzE8g+6agwT8neotpTc1EgGXhipp6dNimRvfM
	1mUbIFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eK1-0000000DxzE-3J0I;
	Thu, 12 Mar 2026 11:35:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eJy-0000000DxwY-28Ow;
	Thu, 12 Mar 2026 11:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773315314;
	bh=GtBat+R/pyhZkB8Po8nPF44x4eXM9WeY9qeDYZdcdSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJhsYg1tIAkUYcwaeb/qjN8zKwot2XEMsB6U8kv+lrb/G2Ua1uKgfe/OREl99U0/t
	 3VP0bPIN/ZQXUiUIRi97pAKmcNei2hs9cWo059Djv1e7YeW99ciUSuk81nb8cFsWNI
	 T4WcTFHxYAENyw97wfhC95/YrUt86XtuWD58yFIAbwcpE28BHBVTh3ROcPrRpkZXNs
	 AgO255jH064DA0WKbz3ub22/7Lom6+Lm1Kii4mlSMdeBqZHBVfs1WH+C+cNTQw4DCo
	 0obbQmxEBm35CPOvTjz8jMFRpCLOyF7lSlutRJpQtcOe/1UeHhdIlJqV8eTNJUaJw1
	 d2DPAov26RjqQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4ed7:ba53:777c:9c6a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2FF9C17E05B5;
	Thu, 12 Mar 2026 12:35:14 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: linux@fw-web.de
Cc: angelogioacchino.delregno@collabora.com,
	daniel.lezcano@linaro.org,
	daniel@makrotopia.org,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	rafael@kernel.org,
	rui.zhang@intel.com
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: fix mt7987 thermal crash
Date: Thu, 12 Mar 2026 12:34:57 +0100
Message-Id: <20260312113457.532062-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <8B371D2A-3C7E-4514-B495-9ED58FB60A80@fw-web.de>
References: <8B371D2A-3C7E-4514-B495-9ED58FB60A80@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_043518_700553_4628AD4F 
X-CRM114-Status: GOOD (  15.78  )
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

On 3/12/26 08:39, Frank Wunderlich wrote:
> Am 11. März 2026 10:35:19 MEZ schrieb Laura Nao <laura.nao@collabora.com>:
>> Hi!
>>
>> On 3/9/26 07:44, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> On mt7987 we see a crash due to missing ops entry.
>>>
>>> [    1.518540] Internal error: Oops: 0000000096000005 [#1]  SMP
>>> ...
>>> [    1.564481] pc : lvts_get_temp+0x84/0xc4
>>> [    1.564492] lr : lvts_get_temp+0x60/0xc4
>>> ...
>>> [    1.620900] Call trace:
>>> [    1.631753]  lvts_get_temp+0x84/0xc4 (P)
>>> [    1.645471]  __thermal_zone_get_temp+0x24/0x11c
>>> [    1.656502]  __thermal_zone_device_update+0x9c/0x52c
>>>
>>> Add the new ops member added in 7.0-rc1 for mt7987 too.
>>>
>>> Fixes: a4c40559499f ("thermal/drivers/mediatek/lvts: Add platform ops to support alternative conversion logic")
>>
>> I think the Fixes tag should reference 
>> "thermal/drivers/mediatek/lvts_thermal: Add mt7987 support", as the 
>> commit introducing the ops also updated all existing data structs (seems 
>> like mt7987 support landed right after).
>
> Ok, i will change this. Have not looked on order how commits
> are applied. Both commits were new in 7.0.
>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>>  drivers/thermal/mediatek/lvts_thermal.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
>>> index a9617d5e0077..5671531d4c23 100644
>>> --- a/drivers/thermal/mediatek/lvts_thermal.c
>>> +++ b/drivers/thermal/mediatek/lvts_thermal.c
>>> @@ -2026,6 +2026,7 @@ static const struct lvts_data mt7987_lvts_ap_data = {
>>>  	.temp_offset	= LVTS_COEFF_B_MT7987,
>>>  	.gt_calib_bit_offset = 32,
>>>  	.def_calibration = 19380,
>>
>> You'll probably need to define num_cal_offsets too, since the number of 
>> calibration bytes was also made configurable (not sure if this is 
>> already addressed by a separate patch).
>
> Thanks for pointing to this.
> Should i change in same patch or in separate one?
>

I would suggest including this in the v2 of this patch, updating the
commit title and message to mention that both the ops and num_cal_offsets
were added.

Best,

Laura


