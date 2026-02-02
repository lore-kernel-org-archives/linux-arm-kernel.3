Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4434D172BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 02:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUpUiGwHMrZ8s9RiBnn1fJV1AjhFTWfzEI9RrVPC33c=; b=bSRMfmST8yuG90tke/ZOEt2r1O
	aBpkYLMNGHLxclAL6l9Q72n3pNvnlFxpEnB7FwV3Sqdzl3Qi8JyCm7o3z41gxVhX0EVHeh+TyDq5A
	mS/SZ2iiE+J4jPZxhLuJOqcqFHdH32gzTOAo3NqdqsPS5s2AHGeg8Q6FszVPcaPNz+t9dM5WlZNcd
	+Gc35lGsSbdNJRemhPge6PZTQ3wXrIqxnU8ULZ+OQZmlcse1MsnOG3EPx+xoxKeZM1Pot+ucQC2ZX
	HdfvTo8keAVjc4imm4bB7DAfkP3HdjkfDNWrUyfoC27xZyxjvLQXPpyzEAmA1R/IXh1nEIG14Hh59
	8CCBtZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmk5X-00000004MZT-1R3D;
	Mon, 02 Feb 2026 02:54:55 +0000
Received: from mail-m8333.xmail.ntesmail.com ([156.224.83.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmk5T-00000004MZ2-088t;
	Mon, 02 Feb 2026 02:54:54 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32be0b186;
	Mon, 2 Feb 2026 10:54:40 +0800 (GMT+08:00)
Message-ID: <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
Date: Mon, 2 Feb 2026 10:54:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of imx
 directory for multi-platform use
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
 <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9c1c4614a203a3kunm30717a4a5e3cc3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUpIH1YYThhOSU4YSx9NGUpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ts+rjOYNWVt4hbMscObl1buxmrB9NU9+2g8/C/wLM5u+Eax2HmzsZNBv3v9cSSiwtBrolYAc/VUT2lnOCMJlGZFJvoa/6jdZZHVRNmmEfdv7qqSTtSwqul/F044OZvyweToEzCvHftxXwzhDu5LwMZ0B560xSqMTzoi2rXZ5pg0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=xUpUiGwHMrZ8s9RiBnn1fJV1AjhFTWfzEI9RrVPC33c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_185452_490918_997B7A37 
X-CRM114-Status: GOOD (  18.85  )
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

On 1/31/2026 8:33 PM, Luca Ceresoli wrote:
> Hello Damon, Dmitry,
> 
> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>> out of imx/ subdir for multi-platform use. The driver is also renamed
>> to make it more generic and suitable for platforms other than i.MX.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> ---
>>
>> Changes in v7:
>> - Rename legacy-bridge to of-display-mode-bridge.
>> - Remove unnecessary API drm_bridge_is_legacy().
> 
> ...
> 
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
>>   	help
>>   	  NXP PTN3460 eDP-LVDS bridge chip driver.
>>
>> +config DRM_OF_DISPLAY_MODE_BRIDGE
>> +	tristate
>> +	depends on DRM_BRIDGE && OF
>> +	help
>> +	  This is a DRM bridge implementation that uses of_get_drm_display_mode
>> +	  to acquire display mode.
>> +
>> +	  Newer designs should not use this bridge and should use proper panel
>> +	  driver instead.
> 
> "Newer designs should not use this bridge", but in patch 8 you are
> introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't you
> instead "use proper panel driver instead" in patch 8?
> 
> Can you point to the conversation where the converstaion where Dmitry
> suggested this change? Maybe it already contains the answer to my
> qustion. Also adding a link to that conversation in the commit message
> woule be useful.
> 

First of all, thanks for your reviews on this patch series.

link: 
https://lore.kernel.org/all/xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22/

I think it may be a misleading issue caused by directly copying the 
previous Kconfig description. Now that the new 
devm_drm_of_display_mode_bridge() helper has been added, drivers using 
the panel-bridge framework can rely on it to maintain compatibility with 
legacy display mode parsing.

It would be better to update the comment as follows:

This is a DRM bridge implementation that uses of_get_drm_display_mode to 
acquire display mode.

It exists for compatibility with legacy display mode parsing, in order 
to conform to the panel-bridge framework.

Best regards,
Damon


