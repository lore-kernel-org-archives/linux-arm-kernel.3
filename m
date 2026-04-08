Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B66EDB7D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 01:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=500nTzOsPEHbmmnZSC4nbTuUuD8MTS9l045tiv5dYA4=; b=scgzXoYOsZ55Z7nPDyiQZ9iJ8+
	9a4WHrAXoGewd+AUJF6vEWG5QpesD/PH3t72Sajek5+b2P3whTRUB0fRfz5Ic70fBOyIvrIDguJZC
	qE/CmlvobNCGspAc1L1gm0xep97Bm+CHGOeelIVy0gPexO6jua1rODrLk+ogot347PhwM2Aoox/lg
	ffr2oIn+1OzFX1qlIISU/ndnI2/cLnni9QBceGb7f2hj7qCB5pESRzgZA2vXZHh/qX2XCqRPcZc1j
	OFkaTtEKQ/FN3OPbXAE9rBAnid+/9eBuJy3Dq6lPxvWmc23jF75jknCE1SVFJbDlK+25qwzc5p1qq
	FSJMDRkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAHs9-000000085ko-3B0B;
	Wed, 08 Apr 2026 01:38:25 +0000
Received: from mail-m49209.qiye.163.com ([45.254.49.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAHs6-000000085kC-0Yl3;
	Wed, 08 Apr 2026 01:38:24 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 39de7d730;
	Wed, 8 Apr 2026 09:38:04 +0800 (GMT+08:00)
Message-ID: <ee5ba5ac-3d33-4542-9abe-6d3e0d1e1d76@rock-chips.com>
Date: Wed, 8 Apr 2026 09:38:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/17] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, victor.liu@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, jingoohan1@gmail.com,
 p.zabel@pengutronix.de, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
 alim.akhtar@samsung.com, dmitry.baryshkov@oss.qualcomm.com,
 nicolas.frattaroli@collabora.com, dianders@chromium.org,
 m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20260401091454.25730-1-damon.ding@rock-chips.com>
 <20260401091454.25730-3-damon.ding@rock-chips.com>
 <DHMXIJKO62F2.3JVF0Y6L7DI0I@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DHMXIJKO62F2.3JVF0Y6L7DI0I@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d6abd4cba03a3kunm02c5d4f5311355
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhpPHlYYHRlKTUpCHhgfQh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Hd1vd4jplB+V/AGhFIiROBjwtKrMDwt728WjZzN6yYhQVzxRFstEyjBi+BZCN7a3A9WPY14JeUCdNIV1oAUbaRqlm8laee1Ct43HI8Qk8JgjcXcj8lEZANU5MrrEtuUzkx6Q/u83DBAb598knymj5BynVPjfQ7ffVnmecTsaW6E=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=500nTzOsPEHbmmnZSC4nbTuUuD8MTS9l045tiv5dYA4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_183822_686697_69B313DA 
X-CRM114-Status: UNSURE (   8.62  )
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

Hi Luca,

On 4/7/2026 8:41 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Wed Apr 1, 2026 at 11:14 AM CEST, Damon Ding wrote:
>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>> out of imx/ subdir for multi-platform use. The driver is also renamed
>> to make it more generic and suitable for platforms other than i.MX.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
> 
> I tried applying patchs 1-9 to drm-misc-next but patch 2 does not apply due
> to conflicts in the Kconfig file. Can you please rebase and send a new
> iteration?
> 
> 

Sure, will rebase and send a new version soon.

Best regards,
Damon


