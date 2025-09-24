Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B57CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dCejOxC2RXZr3efQHfWFC5w8CjvBk/FQ9sP2EuTN7w=; b=brIu/73263RESiW7Nx9QQgu95E
	L/NquzJouJ+vx+jsYSWjj6fUb1E6kZzhJMk83p/3S1As9+Eae10J6lY2I53OUJWEJOdzm84hBd4QA
	W/LJGtkPwot7FSqB4f9GceQd3msZoBCnECM/HYMoFhgMWw3QXCdWiE1+LOibfM7TUfZCSqiktjEiD
	P4Y8FC3fy7jiKpVcskBGYUSEtagstY2/OeEc6owgOF/MfZG7xI/vmfzQT2T5L+Kd1Zjcp1Cbqi1Sw
	m7pdPfmgFXDTRjbFNGZJ787kRtTF4X+RO5Y9AQf7ztFtXAslDVfx6/rT6DKa+zvX/7gN22VMLPSmT
	jLUxfLXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KP8-0000000FoGX-4Adg;
	Wed, 24 Sep 2025 07:59:11 +0000
Received: from mail-m155106.qiye.163.com ([101.71.155.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KP6-0000000FoET-0Yc8;
	Wed, 24 Sep 2025 07:59:09 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23e428d4b;
	Wed, 24 Sep 2025 15:58:56 +0800 (GMT+08:00)
Message-ID: <8006587a-131a-4e2e-b32b-d7cdfe8716c8@rock-chips.com>
Date: Wed, 24 Sep 2025 15:58:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/17] drm/exynos: exynos_dp: Add legacy bridge to
 parse the display-timings node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-8-damon.ding@rock-chips.com>
 <xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a997abb8e4e03a3kunmd0821eb84bbdd6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh1LSlZIQ0kfH0xNGE4dS0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=fPQCPCQ3uNzh5jXbF1GIeYUySqLOebeBw4w0FhfPw9EI4rdlhRwcE+q9UuYL9BHKzKH6+Ofs557sOKLYLFVqLFbb1+6k+Y5m6vozg6QzLae2vlKXPwIxLQavPC/kAZUbjj/2EbLGyn+8bCkebzPaoC95r0ZAHJUpYdh6ZTU4eFE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=6dCejOxC2RXZr3efQHfWFC5w8CjvBk/FQ9sP2EuTN7w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_005908_329826_8D3D77AC 
X-CRM114-Status: GOOD (  12.65  )
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

Hi Dmitry,

On 9/12/2025 6:51 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 04:58:36PM +0800, Damon Ding wrote:
>> If there is neither a panel nor a bridge, the display timing can be
>> parsed from the display-timings node under the dp node.
>>
>> Adding a legacy bridge to parse the display-timings node would get
>> rid of &analogix_dp_plat_data.get_modes() and make the codes more
>> consistent.
> 
> If it's the same as imx-legacy-bridge, it might make sense to pull it
> out of imx/ subdir and use it as is.
> 

Yeah, I will move it to the path drivers/gpu/drm/bridge/ and perform the 
necessary renaming.

>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_dp.c | 132 ++++++++++++++++++-----------
>>   1 file changed, 82 insertions(+), 50 deletions(-)
>>
> 

Best regards,
Damon


