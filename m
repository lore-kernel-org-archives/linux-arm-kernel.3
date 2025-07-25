Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90D9C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 02:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLNloxMnqHrVGlM+X06CnaTEpSjYhIn6LZ5vpWKDrB8=; b=j7RjVLf3PKoFfL0fU/YOyiIw3f
	Xxfa/OO1eKeagHZmc1h1Tym/MHyYrda1vFpjSuZLRqX0rq8KXaJotSHD8WbMrJnNvdS4Hgs24JU0L
	dKfrdpWDfVa6TamZ4GzR3iO+8rUJcIaF3FVdbF42RFrMcNzKq6k+PN3tCvhtMuABwh1Y2B+Y979xs
	PcC/JSyDjLWpuVFuc5THHtwrcziE6Z40OD7McolMp+MMc2Pwe+D4z02qCoXXOD+vZNa6cKqtRg3gP
	cp9fJBMAk785+l4FuZqLyHkE7usLgBzKEAnoIBQ4t5xLqvKVO4BiZYLEIyEiXC4FZxuvUu4dzrH8m
	YXi7T7qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf7jQ-00000008rdr-1lxq;
	Fri, 25 Jul 2025 02:00:20 +0000
Received: from mail-m2453.xmail.ntesmail.com ([45.195.24.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf7gx-00000008rCD-1B0D;
	Fri, 25 Jul 2025 01:57:49 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d303d32a;
	Fri, 25 Jul 2025 09:57:42 +0800 (GMT+08:00)
Message-ID: <b0c9f1cb-1478-4afb-91dd-11c894adb957@rock-chips.com>
Date: Fri, 25 Jul 2025 09:57:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] drm/bridge: analogix_dp: Apply panel_bridge
 helper
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-15-damon.ding@rock-chips.com>
 <22774005.EfDdHjke4D@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <22774005.EfDdHjke4D@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983f4ceb0203a3kunma3621b7ace742
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkhOSVYeSkgYTEofS04eQk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PVnDJ7pq+2r+4DMA8NohRlIruBXZ6gKP5DOewVoBX5Ylhaokv+t1PQXA1wz9DlnXhKIviBOFuSFK2az7J1VBnBVWbBLOX/xNfakDiLvSGeqwh0cRkks8NRZt4SoD2Kc/oRP7u314F63JU7vY40c1/YwCIuUlJVv545mfkGqrsn4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=WLNloxMnqHrVGlM+X06CnaTEpSjYhIn6LZ5vpWKDrB8=;
	h=date:mime-version:subject:message-id:from;
X-HMAIL-Slblob-Mailprops: v1_kTakW7JjryuX/AmUDtQem/B3OxKuePxjilAMswNtGNl+d8SOM9348xuxK/oXXNSZwBcHuiF6t9UjgbNLcz4+KNbbW05FZ4IyRAbd7dk6NaCKrKysu6K6q60iuPNcCnPIZhyHky03MWq61Dd9wlSoHawfr/5tWrI0+JSsIXQB4zIVwVh5aCpUpITY3yRLmlT8c1z68y7tuyIQ+YT3K0rQ3PQSB+Po3wXuCCetOntKcbiW+2DRzgUYrAy8byX+hKKk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_185747_905669_F4797A82 
X-CRM114-Status: GOOD (  11.12  )
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

On 2025/7/24 21:08, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Donnerstag, 24. Juli 2025, 10:03:04 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> In order to unify the handling of the panel and bridge, apply
>> panel_bridge helpers for Analogix DP driver. With this patch, the
>> bridge support will also become available.
>>
>> The following changes have ben made:
>> - Apply plane_bridge helper to wrap the panel as the bridge.
>> - Remove the explicit panel APIs calls, which can be replaced with
>>    the automic bridge APIs calls wrapped by the panel.
>> - Unify the API of getting modes to drm_bridge_get_modes().
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> To keep the code bisectable, I think patches 12+13+14 need to be one patch?
> Removing the panel-handling fefore this conversion to the panel-bridge
> would produce a gap, where previously hooked up panels would not work
> if a git bisect lands directly before this patch 14, I think
> 
> 
> Heiko
> 
> 

As expected, patch 12 and patch 13 should remain functionally 
independent. They should be logically self-contained even without patch 
14. Otherwise, patch 14 would need to incorporate those panel operations 
via panel_bridge as well.

Both patch 12 and patch 13 have been independently validated on the 
RK3588S EVB1.

Best regards,
Damon

