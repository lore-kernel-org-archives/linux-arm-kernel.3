Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67673E8B383
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 01:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDNxEGFKLTcQaAxSN3kPzeWr8ZRpCLzvyWFyoP3CJgQ=; b=o74WMKaRoNsbBM3G5C97wicP3e
	Dt2dECn6UDCwimveLG1L7Zje8h4mnd2hJ2XX/vi4OcPKSVYiZ1Wis0rR4XU0psiZXnUYcs5gOg9o3
	NV41YF0360drpnqXsZhrZ+C5KwNJyDprntMpBG8Csvx7+X+viX8CKGuX8AWRzIhaame9N3gG5ZC/t
	FfYqwP2twUgzsgpkIxZVBNV+PcuRxJfYqs/WNTZ7/V4BacDLDzy7JveScUWQcndAfmM9YMQnYmFac
	imJqI+gO7UccKHqGr31CQScJjklmWIzD2O0+5T0SDTVW7zGBuuIMu0gGjbTiZpaqtt7sRWhn7pGPz
	Zk27Mvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnS4A-00000007ixh-3Ip2;
	Wed, 04 Feb 2026 01:52:26 +0000
Received: from mail-m3286.qiye.163.com ([220.197.32.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnS47-00000007ixA-27IB;
	Wed, 04 Feb 2026 01:52:25 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 330683486;
	Wed, 4 Feb 2026 09:52:14 +0800 (GMT+08:00)
Message-ID: <0b7e39bd-a403-45e4-93fd-701ab092525c@rock-chips.com>
Date: Wed, 4 Feb 2026 09:52:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <6571983.R56niFO833@diego> <DG5A5BNULPQX.HRWTJLN9UQ2W@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DG5A5BNULPQX.HRWTJLN9UQ2W@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c2659a20003a3kunme960d4ef73ad41
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkwZGVYaGR1NSE9NTE4ZTkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=KgtiUAp3ditdHJKw+YuPPmNedi6wR8b12xUSPp9hcUoCRAF7xNzEH3nZxGzbDeVSwJ93E6fDJ4Vl+9dnwKTJZG+vl+h1p5MWiMW8N/vLgv/Gn6vfD3J5HwbqagBHelnTeZk/XowaXaNkj1TqDjoeCz7JqI3qjrAMILEPUybjYuI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qDNxEGFKLTcQaAxSN3kPzeWr8ZRpCLzvyWFyoP3CJgQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_175224_027254_9384208E 
X-CRM114-Status: GOOD (  13.11  )
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

Hi Luca,

On 2/3/2026 7:11 PM, Luca Ceresoli wrote:
> Hello Heiko, Damon,
> 
> On Mon Jan 19, 2026 at 5:06 PM CET, Heiko Stübner wrote:
>> Hi Damon,
>>
>> Am Mittwoch, 17. Dezember 2025, 10:33:03 Mitteleuropäische Normalzeit schrieb Damon Ding:
>>> PATCH 1 is to ensure the last bridge declares OP_EDID or OP_MODES or both.
>>> PATCH 2 is a small format optimization for struct analogid_dp_device.
>>> PATCH 3 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>>> PATCH 4 is to add a new parameter to store the point of next bridge.
>>> PATCH 5 is to make legacy bridge driver more universal.
>>> PATCH 6-11 are preparations for apply drm_bridge_connector helper.
>>> PATCH 12 is to apply the drm_bridge_connector helper.
>>> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
>>> PATCH 16 is to attach the next bridge on Analogix side uniformly.
>>> PATCH 17-18 are to apply the panel_bridge helper.
>>
>> On top of all the recent bridge-related commits, this series still works
>> on my rk3588-eDP board - when the display is plugged in on boot.
>>
>> As that is the current state we also had before, this series:
>> Tested-by: Heiko Stuebner <heiko@sntech.de> on rk3588
> 
> I'm appplying patches 1-3 and got a checkpatch warning for each patch:
> 
>    WARNING: Unexpected content after email: 'Heiko Stuebner <heiko@sntech.de> on rk3588', should be: 'Heiko Stuebner <heiko@sntech.de> (on rk3588)'
> 
> I'm fixing it while applying those 3 patches.
> 
> Damon, can you fix that for the remaining patches before sending a new
> iteration?
> 

Yes, will fix in v9.

Best regards,
Damon


