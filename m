Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35736CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaesNXR1V5iA+Rw0RUlxglteXXYqLHx3Sx69L148rc4=; b=3X1U7p429xHM7pn6zgUzVpJF95
	RqIKlMEy1XfWRLgE+DyAOJ6zyWxxaUYayyeGj2kkCr9+rX30rJegGdAu1xtROwoEam+nekkuylZYa
	YlDTKDMfAuYTQCE/zG504vhTWGPv79J2m5/StBfcZkYxjMz8z+9od4udeSIJTbJqft/i+P0mAGDUD
	kLe2afs8dnpdB7zZzZodabuh1zFo3R7vFcNL2pM9ijyFN0z1LzEncWOnIqnV+Lr6wSFmoCqA/vQ0h
	2zNg3hNbTMkoQQxR+nAyv0iK8KB30p5ZNAq2LowEeBe092EfOQxid6a6aM4RmioDCDKQNAWUNJUyo
	JpCiio9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bcn-00000009ceO-0Thg;
	Mon, 22 Sep 2025 08:10:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bck-00000009cdZ-2nKL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:10:15 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9F127F89;
	Mon, 22 Sep 2025 10:08:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758528530;
	bh=18f5YMsjYZt/JpwSvP2ZKdCGT3Fnxm5o02Bv+/atmq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVy1UK05TYd2fa94+IeDgPM1EOXE0rfftB6gdSDd0BrAR2UCLtWeCZ6GUmL1c9HYS
	 6fBBr7CnlWx/EL+J16yScsAC6xdqG6Qd41aCIQC3AJtwimqY7RWP4qAT6VmdO9cm0B
	 gnj/P35YRjLORqT9Fsz8sX66rUrgX4DmXSrah2/Q=
Date: Mon, 22 Sep 2025 11:09:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] media: imx-mipi-csis: Get number of active lanes
 via mbus_config
Message-ID: <20250922080935.GJ10540@pendragon.ideasonboard.com>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
 <20250915-mbus-config-active-lanes-v3-3-97a1282a410b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915-mbus-config-active-lanes-v3-3-97a1282a410b@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_011014_848262_EE9C6BFE 
X-CRM114-Status: GOOD (  21.66  )
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

Hi Isaac,

Thank you for the patch.

On Mon, Sep 15, 2025 at 02:18:35PM +0100, Isaac Scott wrote:
> The number of lanes actively used by a MIPI CSI transmitter may differ
> from that which is defined in device tree. As such, call on
> v4l2_get_active_data_lanes() to check if the driver reports a
> differing number of lanes to device tree, and use that number of active
> lanes.

It would be useful to explain there that the difference would be caused
by the source using less data lanes than the number of connected lanes
on the board.

> If the number of active data lanes is invalid, or the op is not
> supported, use the number of lanes defined in device tree.

Is this still true ?

> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 6afbedfe131e..d3424ad54b4e 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -967,6 +967,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>  	csis_fmt = find_csis_format(format->code);
>  
> +	csis->num_data_lanes = v4l2_get_active_data_lanes(csis->source.pad,
> +							  csis->bus.num_data_lanes);
> +

If the function returns an error you'll have a problem.

>  	ret = mipi_csis_calculate_params(csis, csis_fmt);
>  	if (ret < 0)
>  		goto err_unlock;

-- 
Regards,

Laurent Pinchart

