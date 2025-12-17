Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C24D609D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 02:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORkOGU2sYY0sjXmEYnHmp1Vc7q0DwAfMuZhejaTUoas=; b=t1IKTA9aqgaWjUBagBMZMLhZ/m
	eYxmmZFsbKiw2yk7c8gEJReSVIXznM5LxsNzs3PMfHAokbGhfW4shlsBWjakrXuwSAAUhLRRQQ9Z7
	ALEKxhLQrNSB0dXJWiGTUWlRlH+PI+/n3VsBT2oz/EVmstrh44R3i58Z28DHrrALKpsUAHz1W9uN3
	+vC+AL2vERlYAWXtGInc6DUgN7dTp+o+IaAIt22O7gcYrtcfDNrn/4uRRS6T7FnWYemY5fSUo9Dow
	9p1rIaPdWXZrEOLOK9Dd/8Y+Zh8gVQWNj7dE4FGrpUWoGSaYiH0D5grG7LpmygNgiboVFtPKVatM9
	4hD6XwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhfg-00000006586-3lY6;
	Wed, 17 Dec 2025 02:53:48 +0000
Received: from mail-m25479.xmail.ntesmail.com ([103.129.254.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhfc-0000000657b-0yk7;
	Wed, 17 Dec 2025 02:53:46 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d82b3408;
	Wed, 17 Dec 2025 10:53:29 +0800 (GMT+08:00)
Message-ID: <49580dcf-28ec-47e1-83a0-65e16e3d7cdc@rock-chips.com>
Date: Wed, 17 Dec 2025 10:53:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
To: Heiko Stuebner <heiko@sntech.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
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
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <DDNXIYL494D2.2N8L1J7XTBT4S@bootlin.com>
 <ff65f453-68a9-41fc-b9e3-02733bba96e3@rock-chips.com>
 <3351986.usQuhbGJ8B@phil>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <3351986.usQuhbGJ8B@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b2a3a18bd03a3kunmcb0179dc4d924
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pCT1ZPT0NLHkMZQ01IGkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ApUr7K7j4T/yGlwwgAFrpOxVUqFD/a1yndvUn+XdRj6uUCvdFSb+qUOyjtg4AxNbCr3sfJ5FIcABvkAm3hUXM4VBCtxaeaMuzferaCWkxK+C8uF5Q6QTdk7/uHHjULqNPliiS7WICt3+vT3RMmm0GoRA4TxExa+pe8xL8JlwV0o=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ORkOGU2sYY0sjXmEYnHmp1Vc7q0DwAfMuZhejaTUoas=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_185344_814970_225F1DA6 
X-CRM114-Status: GOOD (  11.22  )
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

On 12/16/2025 9:48 PM, Heiko Stuebner wrote:
> Am Mittwoch, 22. Oktober 2025, 03:15:52 Mitteleuropäische Normalzeit schrieb Damon Ding:
>> Hi Luca,
>>
>> On 10/21/2025 6:31 PM, Luca Ceresoli wrote:
>>> Hello Damon,
>>>
>>> On Tue Oct 21, 2025 at 4:31 AM CEST, Damon Ding wrote:
> 
>>>
>>> This does not apply on current drm-misc-next, due to the patch I mentioned
>>> in a previous iteration, now applied as commit 2be300f9a0b6 ("drm/display:
>>> bridge_connector: get/put the stored bridges").
>>>
>>> However I'm sorry I have to mention that patch turned out being buggy, so
>>> I've sent a series to apply a corrected version [0]. I suggest watching the
>>> disucssion about the fix series, and if that gets approved rebase on top of
>>> that and adapt your changes.
>>>
>>> Sorry about the mess. :(
>>>
>>> [0] https://lore.kernel.org/r/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com
>>>
>>>
>>
>> I saw your fix patches before sending this series. I think your patches
>> will likely be merged relatively quickly, so I plan to wait until the
>> other patches in my patch series are confirmed to be fine, then submit
>> v8 version based on the latest bridge_connector driver. :-)
> 
> I think with 6.19-rc1 out, now is a great time for v8? :-)
> 

Agreed! Luca's patches have been merged. I will reconfirm these commits 
on the latest branch and update v8 in a few day. :-)

Best regards,
Damon


