Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95EDCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lra86emtJBRw8d0sQlbpbNdNJRclGyeus5R/CB3X540=; b=PXDl4anysfaC3KGV2maoYy6UqZ
	wfhk7EBQxREkJSGE2HbBbfI9oxik4UlVZHPVsv9hIYH+3x1z6mcg8WPZm0dG8r1kWg6RxcURy+0dP
	ZXZdzNjOos7jSSCgffUjvxLmiR9hi34NnZ8FSiIy1F+Xqjz/qVkThB8TzNoO5as5GRlS1VHVzL/2b
	M9O7J7hdT9MLJ0egovrXuZetppE9xJfInv5M43vZNC9hKIdJe2n8+KoLPVA1kCFhuy6AWLisWfyyi
	9i7YoIkdJYeBlDC/yty86skTsz0IJ8Sa/XBJCgm5GJBnJM1YTLIZ/LsY8AyJjpmAN6wTSNoCv+1iF
	/YadilAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6n9T-00000005gTm-3vOT;
	Thu, 09 Oct 2025 09:41:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6n9R-00000005gS2-1Jbe;
	Thu, 09 Oct 2025 09:41:34 +0000
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 35D77664;
	Thu,  9 Oct 2025 11:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760002794;
	bh=7Wgx60kvlYCd+pJyhCK3+0qXiXcbtLPDw3Em4UI29oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivvS3jbjz+5tHLuIG3RlitPTpRHn0/Isq4BNLOqvEEZHTOb8Lnq+uNJmEwfsmGhkf
	 NlDbpO17PKiSucmSgLZ6wRz9olM+TNQWg5qIgpEGv+YkMskeFEOe0xtskJRsuXGqZH
	 HqCHt0ydeeG4FgXNlrOx1WHr004RYqNkSc1+0kJI=
Date: Thu, 9 Oct 2025 12:41:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 2/5] drm/rockchip: dw_hdmi_qp: Improve error handling
 with dev_err_probe()
Message-ID: <20251009094122.GF12674@pendragon.ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <20251005235542.1017-3-laurent.pinchart@ideasonboard.com>
 <gai5hfvu6xbbqpk4mu3i6nejolijeokjy3mkzca5xwzb4xwic7@jmee36svmwnb>
 <8706f168-5598-4f91-9ad0-fdbd04b410b7@collabora.com>
 <20251006162631.GK5944@pendragon.ideasonboard.com>
 <bfb68ced-e6ec-4636-816e-9b8fe8aa10b4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bfb68ced-e6ec-4636-816e-9b8fe8aa10b4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_024133_489624_AD383375 
X-CRM114-Status: GOOD (  27.40  )
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

On Thu, Oct 09, 2025 at 10:24:25AM +0300, Cristian Ciocaltea wrote:
> On 10/6/25 7:26 PM, Laurent Pinchart wrote:
> > On Mon, Oct 06, 2025 at 05:37:23PM +0300, Cristian Ciocaltea wrote:
> >> On 10/6/25 3:02 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Oct 06, 2025 at 02:55:38AM +0300, Laurent Pinchart wrote:
> >>>> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>>>
> >>>> The error handling in dw_hdmi_qp_rockchip_bind() is quite inconsistent,
> >>>> i.e. in some cases the error code is not included in the message, while
> >>>> in some other cases there is no check for -EPROBE_DEFER.
> >>>>
> >>>> Since this is part of the probe path, address the aforementioned issues
> >>>> by switching to dev_err_probe(), which also reduces the code a bit.
> >>>>
> >>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> ---
> >>>>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 62 +++++++------------
> >>>>  1 file changed, 24 insertions(+), 38 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >>>> index 7d531b6f4c09..4e7794aa2dde 100644
> >>>> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >>>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >>>> @@ -457,10 +457,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
> >>>>  		return -ENODEV;
> >>>>  
> >>>>  	if (!cfg->ctrl_ops || !cfg->ctrl_ops->io_init ||
> >>>> -	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback) {
> >>>> -		dev_err(dev, "Missing platform ctrl ops\n");
> >>>> -		return -ENODEV;
> >>>> -	}
> >>>> +	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback)
> >>>> +		return dev_err_probe(dev, -ENODEV, "Missing platform ctrl ops\n");
> >>>
> >>> This only makes sense for the purpose of unification.
> >>
> >> Right, as mentioned in the commit description, the intention was to ensure
> >> consistent error handling across the probe path rather than limiting the scope
> >> to -EPROBE_DEFER exclusively.
> > 
> > Should I revert this change in v3 or keep it ? I see value in
> > unification, but I don't mind either way. Dmitry, what's your preference
> > ?
> 
> I missed to point out this patch has been also sent a while ago as part of
> another series [1] which should be ready for merging.  It'd be great if there's
> no need to revert any changes, otherwise we need to keep those in sync.
> 
> Regardless, I'll let you know if that gets applied first, allowing us to drop
> this one after rebasing.

Thanks for the information. I'm happy to merge 3/5 on top of that
series. The DT binding change in 1/5 can be merged separately.

> [1] https://lore.kernel.org/all/20250903-rk3588-hdmi-cec-v4-3-fa25163c4b08@collabora.com/

-- 
Regards,

Laurent Pinchart

