Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A12ECAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnsO48NFRdzDL0FZ/PN0QmbAoIM4W5QwXGC4sFU3+Wg=; b=Ge2rcQFG1Nso9AW/s5vF4flRfq
	Pgk4U0e+5+xkeFN2vm93E8mS3dXjZZbU3iARYFRdG+dhjmvbbE1DgMxisSdP3gGbaNLrUCAp/ftXF
	p9Zw40bc6gqJck1sXCUWbPCP/TzPNV6GkQqHXm5ants3u+0/NHZUzz9TQuoDPb0o3Ch+OqOrn9Wvl
	ifnzAFfzh1Xn8vaYc/hqjUYMe3sBrn+10e6TM8UWPNn7393mHJpDeSSdMSYvYqV6Rwm6c34RwVwxC
	ZbrjCZ2HsDUN9gu5YObjYb2kmNgaOinZjaOzHBszWyHLq+7qDdTEaQvW18/jMBfUU98IlIE4jqfyQ
	hWuKPTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5o2t-00000000OeC-1zIs;
	Mon, 06 Oct 2025 16:26:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5o2q-00000000OdK-1lmF;
	Mon, 06 Oct 2025 16:26:41 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1464CB7D;
	Mon,  6 Oct 2025 18:25:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759767906;
	bh=urAPi5PtnmEjVyblteohOkDho6JfrnjSMqTu5Ai3YXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/eQo43qbQUcC3DL3yzFPzCSmJbqB7E//sIkVmKsAfpQ8l39r7q7ZfkDderkgM5eo
	 433Zf89qFnNQVhH/crzs8biSG5JaIZtKzdkXHe+BDNI7JZTjYs3R09QELaITQ3aOVa
	 MGov8SwXecILaVDWMRZFWVY/hu3mn7sTLXADweLk=
Date: Mon, 6 Oct 2025 19:26:31 +0300
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
Message-ID: <20251006162631.GK5944@pendragon.ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <20251005235542.1017-3-laurent.pinchart@ideasonboard.com>
 <gai5hfvu6xbbqpk4mu3i6nejolijeokjy3mkzca5xwzb4xwic7@jmee36svmwnb>
 <8706f168-5598-4f91-9ad0-fdbd04b410b7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8706f168-5598-4f91-9ad0-fdbd04b410b7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_092640_599614_6F986F08 
X-CRM114-Status: GOOD (  21.03  )
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

On Mon, Oct 06, 2025 at 05:37:23PM +0300, Cristian Ciocaltea wrote:
> On 10/6/25 3:02 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 06, 2025 at 02:55:38AM +0300, Laurent Pinchart wrote:
> >> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>
> >> The error handling in dw_hdmi_qp_rockchip_bind() is quite inconsistent,
> >> i.e. in some cases the error code is not included in the message, while
> >> in some other cases there is no check for -EPROBE_DEFER.
> >>
> >> Since this is part of the probe path, address the aforementioned issues
> >> by switching to dev_err_probe(), which also reduces the code a bit.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> ---
> >>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 62 +++++++------------
> >>  1 file changed, 24 insertions(+), 38 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> index 7d531b6f4c09..4e7794aa2dde 100644
> >> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> @@ -457,10 +457,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
> >>  		return -ENODEV;
> >>  
> >>  	if (!cfg->ctrl_ops || !cfg->ctrl_ops->io_init ||
> >> -	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback) {
> >> -		dev_err(dev, "Missing platform ctrl ops\n");
> >> -		return -ENODEV;
> >> -	}
> >> +	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback)
> >> +		return dev_err_probe(dev, -ENODEV, "Missing platform ctrl ops\n");
> > 
> > This only makes sense for the purpose of unification.
> 
> Right, as mentioned in the commit description, the intention was to ensure
> consistent error handling across the probe path rather than limiting the scope
> to -EPROBE_DEFER exclusively.

Should I revert this change in v3 or keep it ? I see value in
unification, but I don't mind either way. Dmitry, what's your preference
?

-- 
Regards,

Laurent Pinchart

