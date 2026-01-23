Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C96D778B1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 23:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnrJp/avAK4mn/Hja38O/dSNf2RLJOyrmOu8lv2aLaE=; b=A6HT7T7RkpGSNKc9dRLdHO+eWK
	P/3l34B5FHInOZ7xsMV8ML+xZ9dTm0sK+A0RKmUcoGFy9tjejNG3PUSeRkW8xe/buSHtXzc0YhXIV
	MxyKkrRtmnII5Jh+cOZ8/rv3JXEAdumnZ7SEIy6PPz5Ll5SN8xIwCii+q07kdNt5hBVUHJ5P44SPm
	unLtUoZhMhZotcCEi192wXtf6EP0NGlo64RhivD1P0fqLIsXZbAFR/2l2xkM+skvaQW7QexqsjNAy
	/RyErpp35mhE2gxQ/2KhDSJQb8W+tZV+kpztN6MMSGJPAGo7tulPVxpM+LYzshbcukm2uBkcFJ9Pr
	hWljhk4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjQPy-00000009ZdG-1Bmq;
	Fri, 23 Jan 2026 23:18:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjQPv-00000009ZXu-1pn3;
	Fri, 23 Jan 2026 23:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769210289;
	bh=wHgjORyqTwml6ZZCoMQV+QxMxcgExVvZFnvtJJH7wWc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UzRCEGFd6JoUn5SpkXKpCxLisafY/Uw8B8paZfqPRJZNOc3txMUBidOy37fDYzp77
	 DYV7jyQVhxIFrVCtepVpkmX4csqklhga2049ZH41mnV5UHfMyZvVuKsmo8JrkuG35N
	 0s/fdtaeQln5qR8BC4dn2ojvuGgWlKLyWxGJeZ4PGk2huhk0sJtsQieSooG7HdEG/a
	 DubYoCu/IQQ8mlM/gzmHkIoagF7Xpf2lgIbk2R2bdluIGkQ6hiEDcuZ+3Zz4W1/0Yh
	 nDwl0YXVHx92LrJIhhRaYTPhTH2cNJvpB/d8OCJWPhfYsgbxsXDNg+sydUpqdS/4Uz
	 8PbZ9aUE4E1ow==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C79E617E0181;
	Sat, 24 Jan 2026 00:18:08 +0100 (CET)
Message-ID: <8bdb6ea8-9434-4fa6-87ad-4c2f2697a3e5@collabora.com>
Date: Sat, 24 Jan 2026 01:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Rockchip DRM use-after-free & null-ptr-deref fixes
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
 <8e770288-f29b-4e72-b5a6-e3cfd77b87fb@rock-chips.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <8e770288-f29b-4e72-b5a6-e3cfd77b87fb@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_151815_666903_1B1A41D2 
X-CRM114-Status: UNSURE (   9.14  )
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

Hi Chaoyi,

On 1/22/26 4:27 AM, Chaoyi Chen wrote:
> Hi Cristian,
> 
> On 1/22/2026 7:17 AM, Cristian Ciocaltea wrote:
>> The first three patches in the series are fixes for use-after-free &
>> null-ptr-deref related issues found in dw_dp and inno-hdmi Rockchip DRM
>> drivers.
>>
> 
> Have you tried calling unbind() and bind() multiple times? 
> In this case, can DRM still work properly?

Do you have any specific usecase in mind?

The tests performed so far were mostly focused on reloading the rockchipdrm
module, which is how I actually noticed those issues.

Regards,
Cristian

