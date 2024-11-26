Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533F9D3B98A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q07BelN39jfTdkjRf9iQ8mWemfDUd6mii4YoU1vwQT0=; b=Fc7U/YpXF6ZUSkyi0rbqLnCoXk
	4ZLCY17tZZVlth5J+j7p/rNdA4fmHbLg6p/jCKlaV2V+TScOI6rUskE1bSEk6xzmLojZm5HZZ2J8k
	WygrM0YCyxUSQcG5n+pdNHrX2Av0tLuQE7+b/AaxsC6yfO7FJf2/BdRArhTn+3kQQJOT03F0mV5aI
	3gevAoc7d1HRTdmKJFh5erXfG4s/1gdO6tv2wumfVEA+en/ABbcLWs6h+OKfS3B46Gnu8QazVSZGv
	JOKMyIaT/ao85Q9WBDCx1Z56BHbkoa7p61kIEPVYZtq7UQ/UKbs88M7B5OMCg7umZFrph+qwkLOq5
	tR/nRX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFulb-0000000AZrR-0mSp;
	Tue, 26 Nov 2024 12:34:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFukd-0000000AZln-2IEU;
	Tue, 26 Nov 2024 12:33:08 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61CA9526;
	Tue, 26 Nov 2024 13:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732624360;
	bh=VWBwwYDrYSPqco3vJKAcKsxo+QDzyL/dDLDUdf+f59o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqZlj+0x+eUa8ByKbmVQCDIxlTbP+UHFyUjw2qVJuX12+08oPOiteslOV0U1j8xQL
	 i9YdcHZsLSDWKzB2X7eXGp6bbhmPsKoE1ZEj8IApu9lfu0ZfPVrzFlok7Pf4tsrpo9
	 lu6jXE3SmZzaDHLN4bggX/xoJJt5FaJyr09J0cYU=
Date: Tue, 26 Nov 2024 14:32:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Thierry Reding <treding@nvidia.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/3] gpu: drm: replace of_graph_get_next_endpoint()
Message-ID: <20241126123253.GF5461@pendragon.ideasonboard.com>
References: <87o722sg6y.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o722sg6y.wl-kuninori.morimoto.gx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_043307_714323_ADADEDDF 
X-CRM114-Status: GOOD (  12.07  )
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

Hi Morimoto-san,

On Tue, Nov 26, 2024 at 05:43:34AM +0000, Kuninori Morimoto wrote:
> 
> Hi Maarten, Maxime, Thomas
> Cc Laurent
> 
> The patch has been created as 1 patch for "drivers/gpu/drm", but this time
> I have finely disassembled the patch into 3 patches.

Thomas has merged v6 in drm-misc in commit 17558f97fe62fbe14757880a0aa998bfd194ea95

> v6 -> v7
> 	- created as 3 patches
> 
> Kuninori Morimoto (3):
>   gpu: drm: drm_of: replace of_graph_get_next_endpoint()
>   gpu: drm: panel: replace of_graph_get_next_endpoint()
>   gpu: drm: tiny: replace of_graph_get_next_endpoint()
> 
>  drivers/gpu/drm/drm_of.c                              | 4 +++-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
>  drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 

-- 
Regards,

Laurent Pinchart

