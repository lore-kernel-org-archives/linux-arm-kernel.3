Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1248E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyJVyur4IyAHn8poAWBypTH6jYDB+Nwxko92c/qdMK4=; b=WnHBYFoz/LQ32WghoeiNmg6MAU
	RjNXO+NU9j2DSS/hERucvugmFjt43+xUp/7dT32JsDBfoO8c7yTmOR3AeW0+6Q5AkVrCUu82lXK3U
	4UIjI0W02D18HHTue0UIcRYT2IZlnuM9596sIZq0qrxSWxF3yBF+c2DwJssid1yq4Geq257JW9GGj
	Dq8sanVfw1aGb/BOaAVVu8qojGgc/PsBBuXMYshe/TP8nUHOBND6Wj2Hg2L0EmZpg4D92cGW4bBu9
	vBy810dfllZyAzT2NLeuWZO6Vx1kQ9UmGn4C0ZM3I1HsP6mRGVkCI+8MVEei3U9HDNn2yqN+9Vr4E
	TGI+WmxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmzN-00000009XRf-0HyO;
	Mon, 09 Dec 2024 23:16:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmvm-00000009Wiv-2Xu7;
	Mon, 09 Dec 2024 23:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gyJVyur4IyAHn8poAWBypTH6jYDB+Nwxko92c/qdMK4=; b=f8M1mNgQdC5wIM/8vQdHwqvNYz
	UBUAZDSqr1Cx/7P6DJj40JCUWj7hqJcV9If4OpxdSUG+xbTvK67o9NxJk7uPNSpHuZoGU4SDBQNE9
	w9Q5s7iDS7JKUA8T/LBsnfd5TDd9lkJ59Z66FeB36Yb8clf+39Pu6P2Jb/3dS+wcQj9rTvDDhAN91
	pLSAIU8oxDl1HA7oAzSF/op5UCW/DGoOXk3HNtydhi3PK1q4DYpmedSiwqW7rE20MGeguXcVr2K08
	6DO8lty+Naoovses0nzvGjkd/4oW5eHLIUukRjQ7a27FqoJ3OZajanfclUYYBt1iLOlbOc+N919Uv
	7t7yk0Og==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tKmvT-0005Hj-UT; Tue, 10 Dec 2024 00:12:27 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Daniel Semkowicz <dse@thaumatec.com>,
 Diederik de Haas <didi.debian@cknow.org>, andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quentin.schulz@cherry.de, rfoss@kernel.org,
 robh@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2 controller
Date: Tue, 10 Dec 2024 00:12:26 +0100
Message-ID: <2203458.KiezcSG77Q@diego>
In-Reply-To: <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <20241209150619.33998-1-dse@thaumatec.com>
 <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_151246_636490_30CCF50D 
X-CRM114-Status: GOOD (  29.22  )
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

Am Montag, 9. Dezember 2024, 17:11:03 CET schrieb Diederik de Haas:
> Hi,
> 
> On Mon Dec 9, 2024 at 4:06 PM CET, Daniel Semkowicz wrote:
> > On 03.12.24 21:54, Heiko Stuebner wrote:
> > > This series adds a bridge and glue driver for the DSI2 controller found
> > > in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
> > > 
> >
> > I did more tests with different LVDS displays. I tested following
> > configurations with DSI/LVDS bridge:
> > - 1024x600@60.01
> > - 1024x768@60.02
> > - 1280x800@60.07
> > - 1366x768@60.06
> >
> > All of them worked without issues, except 1366x768.
> > With this resolution, video is blurry, and offset incorrectly
> > to the left. There are also repeating errors on the console:
> >
> >   rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY irq err at vp3
> >
> > In correct operation with other resolutions, there is no error.
> > I am not sure if this is a problem in your series or rather in VOP2
> > driver.

This really sounds like something is wrong on the vop side.
The interrupt is part of the vop, the divisable by 4 things likely too.


Heiko


> 
> On my PineTab2 I got similar messages about 2 weeks ago:
> rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY irq err at vp1
> 
> Preceding those, I got several panfrost related errors:
> 
> panfrost fde60000.gpu: get clock failed -517
> panfrost fde60000.gpu: clk init failed -517
> platform fde60000.gpu: deferred probe pending: (reason unknown)
> platform cpufreq-dt: deferred probe pending: (reason unknown)
> vdd_gpu_npu: disabling
> 
> But can also be that the PineTab2 (likely) needs regulator-always-on
> and regulator-boot-on in its vdd_gpu_npu node.
> 
> > I tried to track down the problem, and it seems to be a generic issue
> > when horizontal line width is not divisible by 4.
> > Lowering line width to 1364px fixes the issue, but of course I have two
> > vertical lines of black pixels on the right.
> > I also made some tests with 720x1280 DSI display. Lowering horizontal
> > line to 718px shows the same problem. With 720px and 716px it works
> > correctly.
> 
> I haven't look further into it, but the PT2 has a 1280x800 resolution.
> 
> HTH,
>   Diederik
> 





