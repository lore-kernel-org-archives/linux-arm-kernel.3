Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7E7C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3fdhQkzdXjdFPBlEyPNoFqpZHn/qF7Fyf33XQ2Xais=; b=RpyJOjEQ6kgMvjZt80pDUZLmU1
	pRk4sVoRL+r9DqBwkcn4atgwIsZqSNvYlVx4i2hQr4Fif3/2sVTp0/I51goPjZmDrQMhmXVxVeMXR
	pP47EHXGNBxAaNPlPpgPDisHz1njicitu3Nwwja0iNxae6J4Aw+s9su+pzi407pOc53rxxVdVEPvQ
	IKdR/XAWyBzT4oPteNxeUSstQJ/pu/uV9dk89stq+C7hyefzwOHm91TJc9mEyf0wYJ+cK1YDCMyhU
	G3BOUxml8/B8PnbQeBx5mtMt8WELoI1xB00/GO05SFYgY+hYZqzHX8jQ0WQDRi7D0lOKmHYRrfkaV
	YscqfgDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoln-0000000CrmT-1GpA;
	Fri, 31 Jul 2026 15:03:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpolk-0000000CrlU-2cML;
	Fri, 31 Jul 2026 15:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785510206;
	bh=vBzFyziUWjliNDDBkuz8H0vizOlAd/t2Tq+tK2gR2BM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KvffgtfZ7GSQynVjczrV++EGQQxtV4uoiDJGuk3AQ0LFI6XPb4K/6w+HwqRzfNlNa
	 lJEXFDmZodC6tyToTRWir+A15r0iWmdQEfwie79dYX4ZvExrZlj6D98xIBBVcEoNan
	 n3eAmFhpV8nNx12OnaA1DDw9o0+l/Jw8wFUCusnNQw5xw0SvMukqlWSKXnO54DK666
	 jfZ1dR5Gor1XSAG4Ug8nWL7MkUOVGXhY4PhgqfvKjvRy50sJwOU8u/kZUxZYjfuNmC
	 m6GhCMfscAqMGlVRsBYWbIK+KoRipoIs3zsV3Q+DgccaB5i9RWWCBVKivo98JpT91z
	 VBqWYYewwHWaA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C0B317E063E;
	Fri, 31 Jul 2026 17:03:25 +0200 (CEST)
Message-ID: <fa854383-a53a-410d-8b0e-554f70b918ac@collabora.com>
Date: Fri, 31 Jul 2026 18:03:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/61] drm/connector: Add drmm_connector_hdmi_init()
 with new signature
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>,
 Liu Ying <victor.liu@nxp.com>, Phong LE <ple@baylibre.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-3-4fb12ea22ac9@collabora.com>
 <exkyukl6jnkwwoap62v4n5j4obyhoks5ysbo7iqjdhzhb2ltsu@nyp7csbmzott>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <exkyukl6jnkwwoap62v4n5j4obyhoks5ysbo7iqjdhzhb2ltsu@nyp7csbmzott>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_080328_813384_4DE748B2 
X-CRM114-Status: GOOD (  13.54  )
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

On 7/30/26 5:19 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 23, 2026 at 04:34:52AM +0300, Cristian Ciocaltea wrote:
>> In preparation for providing HDMI 2.x source capabilities, move the
>> vendor, product, supported_formats and max_bpc parameters out of the
>> init function into struct drm_connector_hdmi_funcs, and add new
>> supported_hdmi_ver and supported_tmds_char_rate fields there as well.
> 
> I really don't like the idea of putting data into the functions. The
> data might be mutable, it might depend on the particular platform, etc.
> while funcs are typically static. Even for the drm_bridge case we have
> two separate structures: static funcs and changeable drm_bridge
> instance.
> 
> I'd suggest populating that data in the drm_connector before calling
> drmm_connector_hdmi_init(). The only exception would be vendor / product
> since they use strtomem_pad() to ensure them being properly initialized.
> I'd suggest leaving those two as is.

I don't have a strong preference between the two approaches (functions vs.
connector). Let's wait for Maxime to confirm that he agrees with your
suggestion, so that we can hopefully reach consensus before the final round of
API-related changes.

Meanwhile, I plan to submit v10 addressing several findings reported by Sashiko
and see whether anything else remains outstanding.

Thanks,
Cristian

