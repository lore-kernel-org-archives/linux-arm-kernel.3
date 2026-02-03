Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0202E87835
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na/aLGpL+Vxzc1WLveA1WNpTsOu7ajYqZYVLJf09FO0=; b=3rCiwK/AWgSDdO4atfobB0QvLZ
	eXIsSY/bgaH+a/LIr0dLENrelLgnPJhR+4XjmDglM6mBH9kk1PtsRPTAi/3sanVe0606idopewa/n
	//Lc5kHIeD84mGE8HAX6SQk40EkblJ1CGV2tml3vdbcPjeYT2TsC8ETOqaWUDkBiKVycgtac5UtZ3
	VoICWoVSa6O7EpbOYENeNcQ1IeXgNTU+EWAWD28XHkn19tgL5n0fyjfJP0SHZ7FbDVX6yU4fZQ4g8
	NgGrf6qeflchZc8LdkHWu3YfZ92Ca0Qjm9sk88sD5tsyJp0SfuFi2qK633re5COYBZwdyh6R3kgxa
	PTyiFwvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnH6J-00000006jdf-2gIW;
	Tue, 03 Feb 2026 14:09:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnH6H-00000006jco-21vD;
	Tue, 03 Feb 2026 14:09:55 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AA6CA5B2;
	Tue,  3 Feb 2026 15:09:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770127745;
	bh=Rv0gnZrGTVnHq8ksG/uGGrkDZi1zIa4ztL46UEkonLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QP1vaF/qoOoTBXHPASYDi3HJe2FmO+pobt2RlBUxJF0hAgilkmQ+sAxpCisOQR058
	 rAIBf/hU7mmVDZi2gn8Ik0+Yc/jrD75aLWjNNQRrF1W6XRBxbiGTYTsI4HjC/LdrFE
	 s/P/zP/t+p4sFm/xjtW23cZZu9j6yFOfaUuQzi/0=
Date: Tue, 3 Feb 2026 16:09:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
	alim.akhtar@samsung.com, jingoohan1@gmail.com,
	p.zabel@pengutronix.de, hjc@rock-chips.com, heiko@sntech.de,
	andy.yan@rock-chips.com, dianders@chromium.org,
	m.szyprowski@samsung.com, jani.nikula@intel.com,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
Message-ID: <20260203140945.GC12013@killaraus>
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
 <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
 <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
 <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
 <DG58VCQ54OZA.2QHGR8JFIATY2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DG58VCQ54OZA.2QHGR8JFIATY2@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_060953_661862_D9E88E45 
X-CRM114-Status: GOOD (  36.16  )
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

On Tue, Feb 03, 2026 at 11:11:50AM +0100, Luca Ceresoli wrote:
> On Tue Feb 3, 2026 at 2:31 AM CET, Damon Ding wrote:
> > On 2/2/2026 10:54 AM, Damon Ding wrote:
> >> On 1/31/2026 8:33 PM, Luca Ceresoli wrote:
> >>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
> >>>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> >>>> out of imx/ subdir for multi-platform use. The driver is also renamed
> >>>> to make it more generic and suitable for platforms other than i.MX.
> >>>>
> >>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>
> >>>> ---
> >>>>
> >>>> Changes in v7:
> >>>> - Rename legacy-bridge to of-display-mode-bridge.
> >>>> - Remove unnecessary API drm_bridge_is_legacy().
> >>>
> >>> ...
> >>>
> >>>> --- a/drivers/gpu/drm/bridge/Kconfig
> >>>> +++ b/drivers/gpu/drm/bridge/Kconfig
> >>>> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
> >>>>       help
> >>>>         NXP PTN3460 eDP-LVDS bridge chip driver.
> >>>>
> >>>> +config DRM_OF_DISPLAY_MODE_BRIDGE
> >>>> +    tristate
> >>>> +    depends on DRM_BRIDGE && OF
> >>>> +    help
> >>>> +      This is a DRM bridge implementation that uses
> >>>> of_get_drm_display_mode
> >>>> +      to acquire display mode.
> >>>> +
> >>>> +      Newer designs should not use this bridge and should use proper
> >>>> panel
> >>>> +      driver instead.
> >>>
> >>> "Newer designs should not use this bridge", but in patch 8 you are
> >>> introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't you
> >>> instead "use proper panel driver instead" in patch 8?
> >>>
> >>> Can you point to the conversation where the converstaion where Dmitry
> >>> suggested this change? Maybe it already contains the answer to my
> >>> qustion. Also adding a link to that conversation in the commit message
> >>> woule be useful.
> >>>
> >>
> >> First of all, thanks for your reviews on this patch series.
> >>
> >> link: https://lore.kernel.org/all/
> >> xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22/
> >>
> >> I think it may be a misleading issue caused by directly copying the
> >> previous Kconfig description. Now that the new
> >> devm_drm_of_display_mode_bridge() helper has been added, drivers using
> >> the panel-bridge framework can rely on it to maintain compatibility with
> >> legacy display mode parsing.
> 
> Ah, I think I got the point: the mode description in device tree is legacy,
> but the driver itself is not legacy and will be current until we need to
> support legacy device tree. Correct?
> 
> If that's correct, this patch looks OK to me with a new Kconfig help text.

The devm_drm_of_display_mode_bridge() function needs documentation
though, with a warning that tells it must not be used in new drivers.
Catching new users in checkpatch.pl (or somewhere else) would be ideal.

I would also not create a separate module for this and move the function
to drm_bridge.c, but I don't mind that much if the consensus is that a
separate module is better.

> >> It would be better to update the comment as follows:
> >>
> >> This is a DRM bridge implementation that uses of_get_drm_display_mode to
> >> acquire display mode.
> >>
> >> It exists for compatibility with legacy display mode parsing, in order
> >> to conform to the panel-bridge framework.
> >>
> >
> > Dmitry, what's you take on this?
> 
> Dmitry's opinion would be much more relevant than mine. I don't know much
> myself about this driver.

-- 
Regards,

Laurent Pinchart

