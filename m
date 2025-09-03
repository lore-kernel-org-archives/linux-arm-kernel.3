Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B16CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMFtB1vZ0PjpuY3O+xcfOIhujQxQm5aPKX1K0Kx4dVU=; b=bLCjZ7jQV8x63Awo/UhY0JNJvN
	gGV8dfnpyCz7gWMDImvz7cJcGqsMCIrKhHve6idq9vw1SrIDMZV0/lg3mZGmz81azVNx11SmAUAhK
	fICJgs5dOI5q3cDdhks/WsTR/ssnKF/OXHUzjuqAoeZqOlYGHO/Vs0tp+9mgNgvGpAkd8sfsZC1E9
	uGfmzjdWsyVmzcxtGxt3/cmB4EWeQrU7LJV3E/okrKdxSR1P6j4YJKcTAy7Xz9IAsK7NgnbrMz/Jy
	Ldk7wZHJqwYekz6hjFagiAcppoB/U/AYvnnb4kCz/Au1sJWC1RMdfBlp87a1HfRLUR5YApMuMIfBE
	GnJmUdRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwe2-00000007sWY-32x4;
	Wed, 03 Sep 2025 23:12:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsm2-00000007Ot9-22F6;
	Wed, 03 Sep 2025 19:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756926240;
	bh=9Ua+kHD6dZXWFYSTLBnaWhHDHs7De+8cQbEk82diXxY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mjqf/1i+n2F2T+E2x0S+h/VMNrYClSu5CFnbV+Rp0Y5U+ay1NBWFRhnJi8Jl32NRW
	 FVUhJlfRd4kzjpwBnds9OsX1rSCG7kQ9CFgSRP2QPWPAYt9F+NXjAJJz7AKZ0I9hSx
	 HjYuZhWAktlwABJIoqFSkTutstdSByr9eP88LUlUGzwpIYEswV/kgRGfYsDJeEWogx
	 UW3YlN2Z1KVn2h8J0DhBAFDnzitN841ANZnp7rkLUKdVzhlNxhtNaHW+OsF9TnHoC9
	 Ik2GBlPjCNJCXegw/6/TLtZ3h/zpjNmJzP13UcRj+Omdtl6StOpYF6mmhqjM5DKu+f
	 YFjyxmRkoITEg==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D09E17E1283;
	Wed,  3 Sep 2025 21:03:59 +0200 (CEST)
Message-ID: <80932583-5055-420b-bd92-9ee9ec7d6c1a@collabora.com>
Date: Wed, 3 Sep 2025 22:03:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/bridge: dw-hdmi-qp: Fixup timer base setup
To: Daniel Stone <daniel@fooishbar.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
 <20250825-rk3588-hdmi-cec-v3-2-95324fb22592@collabora.com>
 <CAPj87rN55DOhWeCU1o0=rOkGbrP4M8v+a6xeB5eboLdCiJ-vzw@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPj87rN55DOhWeCU1o0=rOkGbrP4M8v+a6xeB5eboLdCiJ-vzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_120402_708063_4801921E 
X-CRM114-Status: GOOD (  18.37  )
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

Hi Daniel,

On 8/29/25 6:21 PM, Daniel Stone wrote:
> Hi Cristian,
> 
> On Mon, 25 Aug 2025 at 10:57, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>> @@ -1255,6 +1254,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
>>                 return ERR_PTR(-ENODEV);
>>         }
>>
>> +       if (!plat_data->ref_clk_rate) {
>> +               dev_err(dev, "Missing ref_clk rate\n");
>> +               return ERR_PTR(-ENODEV);
>> +       }
> 
> This introduces another bisect cliff, as the Rockchip integration
> isn't added until patch 5/6, meaning together with the previous patch
> the driver isn't usable between patches 1-5. It would be most sensible
> I think to keep a default until the users have been fixed up. But
> maybe a better sequence for this series would be:
> * dev_err_probe() cleanup (easy, no dependencies)
> * add refclk to plat_data (populated but unused)
> * use refclk instead of hardcoded frequency in bridge driver, make it mandatory
> * add CEC IRQ to plat_data (populated but unused)
> * add CEC support to driver, probably make it not mandatory to provide
> CEC IRQ in DT since it doesn't seem required for correct operation?
> * enable CEC in defconfig

Yeah, this is pretty similar to how the initial series looked like.  The
current sequence follows Heiko's suggestion, which I (still) think it's the
correct approach.

Both bisect issues are now fixed in v4:

https://lore.kernel.org/all/20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com/

Thanks for the review!

Regards,
Cristian

