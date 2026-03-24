Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3F2F532E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43b6SjPsKc9g6XHmllwsbhvYMGH2v0JIJbnJ7A+toKo=; b=Q1cvi28/JUOA87384x4SJjcDN+
	o8NjvVS64D7VZZaLFnFMYISFJnSQXT8aQJ9NlrY86dlVLlwdAl0R8QxDD2QHwJHQWjfiVI1CULolA
	wT7SAIFJPq/e/GQVOgkm9GxIGN4ewVLXNa06VVpH3ujUarmRZrNhAiBiSWU1p23alXzYXMSFXQBTQ
	Ca0C42FwflMjC6YCFGHQ8Ufj1qeoULY9KiOQYH/KBpQ6nprnoSnNep4lH7CEGFlCUBemGTPpk0CAy
	cfoBHWOp8M8T7wpBwztp5BzAEbmCMT51p8o6cQAXJs1jHa1YNDdAaGDSU1fJrlqwJIgXAt5jlX+o5
	rLURTqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4v0N-00000000f9F-3dWR;
	Tue, 24 Mar 2026 06:12:43 +0000
Received: from mail-m49239.qiye.163.com ([45.254.49.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4v0K-00000000f8k-1zLW;
	Tue, 24 Mar 2026 06:12:42 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 380ef77a7;
	Tue, 24 Mar 2026 14:12:31 +0800 (GMT+08:00)
Message-ID: <42c0641f-2e37-4ca4-a1ae-e8fde24c8460@rock-chips.com>
Date: Tue, 24 Mar 2026 14:12:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] drm/bridge: analogix_dp: Rename and simplify
 is_rockchip()
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
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DHAANFJ6QZKU.5NN7RD47T8TI@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d1e792c7403a3kunm954b2488614efc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRoZQlZKGkNMTU9OGR8aSk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=d4PGSr2b6bn1E0a78TIiBAHMJrN8AADAEpH+/KsURXWM9e0LXjFYM2ghRcKsjmiMIWmAco/kQcu1H3h4mGFifMUqIGfPZho713TMKNVTVVr8bCYlNu9Ae1IZThaNB1wk3ywC5fTQaj1q7LEs+jZsYt6koSt5zpyBAhM3Td3ayvc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=43b6SjPsKc9g6XHmllwsbhvYMGH2v0JIJbnJ7A+toKo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_231241_102144_3CE6024B 
X-CRM114-Status: UNSURE (   6.98  )
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

On 3/24/2026 12:14 AM, Luca Ceresoli wrote:
> On Thu Mar 19, 2026 at 11:40 AM CET, Damon Ding wrote:
>> Rename is_rockchip() to analogix_dp_is_rockchip() for naming consistency
>> and readability, and simplify the code with switch.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Suggested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The patch content is OK:
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> However this won't apply without [0], correct?
> 
> So, worth mentioning in the cover letter that this series depends on the
> [0] series.
> 
> [0] https://lore.kernel.org/all/20260319071452.1961274-8-damon.ding@rock-chips.com/
> 

Yes, I will add it in v3.

Best regards,
Damon


