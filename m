Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A124FFEA807
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 03:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZTEjmc2Lf7EnWXiGxkpS1MSw/+9KNGdTV6DrlGgK6I=; b=xtq8CNX00PF4UzWRmoD30ri8i1
	PdVCQ5d4OuWA1BNyILGX+A7mirW8Y128U8bRNghdmR4N8WT3w2ap+Gu0nDfTbVwJeRQwRJNUxallm
	vfTI4w9ySiVTdSu+tgJzxPe8mGFyBacc71VwlC6fuaIEnsf+guQdFFBI5S8B3/rh/9WK7oea2tYis
	aECeHVnNm7kDojFK3ukZcd6CQWFLZXs5vuYQ4APC4igtntVJWZZNBdSNcqKZFrJDpvSicfAFQGLx1
	y74xVfw1mOitHXChsR9spRmfX+l6noyIcJfThnwagA+T1Cb5E9DAMFXkBkzmWcg3TNnJnH1uYV+OR
	02AnPwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FOD-00000002cmZ-1qas;
	Wed, 25 Mar 2026 03:58:41 +0000
Received: from mail-m49242.qiye.163.com ([45.254.49.242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FO9-00000002clt-3gJD;
	Wed, 25 Mar 2026 03:58:40 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38331aadd;
	Wed, 25 Mar 2026 11:58:22 +0800 (GMT+08:00)
Message-ID: <70204014-a416-466d-a960-67c86f20f08d@rock-chips.com>
Date: Wed, 25 Mar 2026 11:58:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] drm/bridge: analogix_dp: Rename and simplify
 is_rockchip()
From: Damon Ding <damon.ding@rock-chips.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, cristian.ciocaltea@collabora.com,
 sebastian.reichel@collabora.com, kever.yang@rock-chips.com,
 heiko.stuebner@cherry.de, tomeu@tomeuvizoso.net, amadeus@jmu.edu.cn,
 michael.riesch@collabora.com, didi.debian@cknow.org,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260319104031.1986946-8-damon.ding@rock-chips.com>
 <DHAANFJ6QZKU.5NN7RD47T8TI@bootlin.com>
 <42c0641f-2e37-4ca4-a1ae-e8fde24c8460@rock-chips.com>
Content-Language: en-US
In-Reply-To: <42c0641f-2e37-4ca4-a1ae-e8fde24c8460@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d2324b76103a3kunmff336bad6b84fe
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ08dTVZMQkJIQ0JOSEIfHRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=SlF09ECwAohg5Ap+e76ztcvHcMcCup89QUrjufKePOJMVvefgml6iKa8StxI/kX+kdAVs/xzZyPLhe7ih/XAuku/tgibOsQdwu7Gcn/R/rxdWwNJ4Yu5bRB+zkUinUHmn4St1NlijSJtrKPo7wwjYsyCyh22HHDrUiqlZIHUmpE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=9ZTEjmc2Lf7EnWXiGxkpS1MSw/+9KNGdTV6DrlGgK6I=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_205838_624101_E276EA99 
X-CRM114-Status: UNSURE (   8.41  )
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

On 3/24/2026 2:12 PM, Damon Ding wrote:
> On 3/24/2026 12:14 AM, Luca Ceresoli wrote:
>> On Thu Mar 19, 2026 at 11:40 AM CET, Damon Ding wrote:
>>> Rename is_rockchip() to analogix_dp_is_rockchip() for naming consistency
>>> and readability, and simplify the code with switch.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> Suggested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>
>> The patch content is OK:
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>
>> However this won't apply without [0], correct?
>>
>> So, worth mentioning in the cover letter that this series depends on the
>> [0] series.
>>
>> [0] https://lore.kernel.org/all/20260319071452.1961274-8- 
>> damon.ding@rock-chips.com/
>>
> 
> Yes, I will add it in v3.
> 

BTW: Could you also help review the following two patches [0][1] when 
you get a chance? Your review would be much appreciated.

[0] 
https://lore.kernel.org/all/20251110085823.1197472-1-damon.ding@rock-chips.com/
[1] 
https://lore.kernel.org/all/20251111022103.1350183-1-damon.ding@rock-chips.com/

Best regards,
Damon


