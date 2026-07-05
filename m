Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D11C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 20:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq9sHzGaJvddeDiJPsgxvhiBUcbsjhX0kvlYQCOVmK0=; b=Oxh/97CfwuUtRgHL/OpVq3MYxh
	PGsndXkfqztllxvCR3OwtEKRlFUBO/5SAD8yqjlvOHI1O/toq0548JG4ClhOqh67wueHLhL8rVOhN
	1qO9VDBfV7SrFU5iJKRL+i9hX4D7l2GKqaU2H3YuTVu2pTSGbi4Gnmi38cqF83OTL1zT24tYnd93B
	VA1SwKCY0RkIJh5GKL4Ucu61jMN3Lvu5tFa9+NE8lwIZCbemcn4vWV3mPrAAlQgFlGnUqLKiFqHH9
	vEimkBD268VVLFxJVSRBbhFYaYMR+uRMC9UKDRbkfOffsuYuVRaWU2KHAdWxy2gq8xIJ3CNoVXL2m
	jiNiQUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTjG-00000009idT-3yQS;
	Sun, 05 Jul 2026 20:46:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTj9-00000009icv-3cLu;
	Sun, 05 Jul 2026 20:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783284368;
	bh=OaQusKv3rXYsBNCL7bbmIiPHTJUbxK+t+RRHDhKEW9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lL230xXckdYvbMdcv6VvPfggSMJt4NKuO+UichDEAFAiEOXbiKsWUP7Cq4EuSPr+n
	 zt6n2WmBg+/z95DyxHqpc0Cm7kZqJEPz1bQSlMPCPbdFIZJVKypLfV5g1m0yeOvK74
	 mYZaKU5LaRRtbJyIt8ONOpFk4LV7eiywCjFQC4TGYKHUV+SY+wlDd7YwzL9ODHKjQL
	 DzJF68rnwWrFaDw8YkIGRnmzzhOwyRjoW0EEyQDEgmbUt+q8lA8XQpcie0x8XinT1X
	 kkzZTDknZ2VF9gFMDb150EY1SbsJq8gYG0zQC+5+tVLfpQPymDbv89e8NVfyRMDHzq
	 IqMTxsmxqsxUA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28E3917E0177;
	Sun, 05 Jul 2026 22:46:07 +0200 (CEST)
Message-ID: <c8242f5c-ec74-489e-b378-f225ec3a0135@collabora.com>
Date: Sun, 5 Jul 2026 23:46:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] drm/rockchip: vop2: Reset AXI and DCLK to improve
 robustness
To: Diederik de Haas <diederik@cknow-tech.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <20260617-dw-hdmi-qp-yuv-v1-2-a665cfd06d7d@collabora.com>
 <DJQO8Q4J2LDP.1G8I4FVF6J7TK@cknow-tech.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <DJQO8Q4J2LDP.1G8I4FVF6J7TK@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_134612_085833_4CE50DD5 
X-CRM114-Status: GOOD (  15.79  )
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

Hi Diederik,

On 7/5/26 4:28 PM, Diederik de Haas wrote:
> Hi Cristian,
> 
> On Wed Jun 17, 2026 at 8:52 PM CEST, Cristian Ciocaltea wrote:
>> Assert the AXI reset in the CRTC disable path, and the VP DCLK reset in
>> the enable path.
>>
>> These resets are intended to leave the hardware in a clean state for the
>> next use, helping recover from exceptions such as IOMMU page faults, as
>> well as to prevent random display output glitches, such as a blank
>> image, observed when switching modes that also change the color format,
>> e.g. from RGB to YUV420 and vice versa.
>>
>> For now this seems to affect only the RK3588, hence the resets are
>> optional and will be provided in the device tree for this SoC only.
> 
> Why do you think it only effect RK3588? 

My findings are exclusively in the context of validating YUV support for DW HDMI
QP, hence targeting RK3588 and RK3576.  Since RK3576 didn't exhibit any
anomalies, I concluded the resets are needed just for RK3588.

> I reported about my RK3568 test here:
> https://lore.kernel.org/linux-rockchip/DFRU6ODDM71P.3NQGLRK8IVDUY@cknow-tech.com/
> "I then went on to try LibreELEC's builds. The artifacts I (sometimes)
> saw, were gone :-D OTOH, I did get several major issues 'in return',
> like rk_iommu Page fault resulting in a black screen and the only way to
> 'recover' from it, was a reboot."
> 
> And I reported some more test results here:
> https://forum.libreelec.tv/thread/29953-le13-testing-for-rk3288-rk3328-rk3399-rk3566-rk3568-rk3576-rk3588/?postID=204691#post204691
> 
> That seems to me a (strong) indication it also affects RK3566/RK3568?

If coincidentally this helps improve the reliability of some of the older SoCs
as well, the resets can easily be added to the corresponding DTs and submitted
as a follow-up series.

Cristian

