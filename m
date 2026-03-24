Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09115F532ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 08:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsHWbw7oyNKZz8F9g3T7f5cxwL5OoWi6tUY7Ok/t8ws=; b=Y51/8q1OPjkSxrI4ScCOpHDFGe
	89vhEFSdApnO9f4bjDjpMdcWq8m8V68mis611q4w7eLz3VUFUdAdN2iRu/mW12hyWm2BpToHB6mSg
	CHjZS5jSEpqll1saJ2VFNIp/4V9aVbjhJX+3kYUQ6EXEnMQntooDR7nSql78SWUJ15gU9ADibBIMr
	n0ksvhNxUuRbinvGbidWGYtvoVHloZVNeIJlNUBo2V8C2MbIG8SbpygcjHo2HSDWvNHciD8Aouesa
	kfZYJ0WaynXuPJPnfwCVEZx8cln5mTWhwg/4Q//ECBnKEyb5kQz5Gsyx/0XEyc0BirE6OucxHHpak
	v0xzLolg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wis-00000000wqr-2NIU;
	Tue, 24 Mar 2026 08:02:46 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wiq-00000000woh-1OPe;
	Tue, 24 Mar 2026 08:02:45 +0000
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fg2ZW0pv3zyVM;
	Tue, 24 Mar 2026 10:02:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1774339349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bsHWbw7oyNKZz8F9g3T7f5cxwL5OoWi6tUY7Ok/t8ws=;
	b=MWSifNUlPaaqMOq4PuTJ5MqOaeiGZA+wlBmVOvAJuXT0uqK2iwK3AbdKBBSJPebPQH+cAk
	srwWvrkyOCT47rCmaM/OLZu4Z4ASaTJXpYzo2RbSeToioBL0ksxV3ttibDMOzYKFeZ+Kk0
	HzJzr9W4BsiqIjBTXktK9FmO8I4AgN8=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1774339349;
	b=oW98lXMVIazFB6zLz7XJvsrrlvRFfsVvpjFymnNTO4uPy8Uf9aRTc6KWWcDlXv9ZwDVdlu
	/bHalqM1L7lIl5piDLmK5SejL1ejle5bRnDYT0E1V87XmErzP1K6MlfBHRAzT2hODljSil
	0QL6dzTpfEJdUN0lwlMu7GzasW5KLos=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1774339349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bsHWbw7oyNKZz8F9g3T7f5cxwL5OoWi6tUY7Ok/t8ws=;
	b=t//NLF34xv9Yrs/la/jT9186cicr6b4RNHPTFTBSwkXWdccrS/E+nVb8ChfqqjVaRhmIJN
	+n3YGX26QzP484y1XJzmwwzmbNCpOQKYmIDpmHq5WdepT4jrCn6gViv+ib9YhBlpwxm1VR
	bSac0l4xpMN9aXcoKfSab23Nms/7Ffo=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1160B634C4E;
	Tue, 24 Mar 2026 10:02:26 +0200 (EET)
Date: Tue, 24 Mar 2026 10:02:25 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.Li@nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev
Subject: Re: [PATCH 3/6] media: synopsys: implement .get_frame_desc() callback
Message-ID: <acJFEcGm0Sgw5nyW@valkosipuli.retiisi.eu>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-3-69667bb86bfa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-imx93-dw-csi2-v1-3-69667bb86bfa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_010244_552963_AB912B02 
X-CRM114-Status: GOOD (  19.13  )
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

Hi Frank,

On Tue, Feb 10, 2026 at 12:11:10PM -0500, Frank Li wrote:
> Implement the .get_frame_desc() callback to fetch information from the
> remote endpoint.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 61cd7f491b3d5b8a37707b23ca03ce709b40a79f..4ad4e3b23448affeeaa932a706653818ba4019ba 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -70,6 +70,8 @@ struct dw_mipi_csi2rx_device {
>  	struct v4l2_async_notifier notifier;
>  	struct v4l2_subdev sd;
>  
> +	struct v4l2_subdev *remote_source;
> +
>  	enum v4l2_mbus_type bus_type;
>  	u32 lanes_num;
>  };
> @@ -431,10 +433,31 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int
> +dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			      struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> +	struct media_pad *remote_pad;
> +
> +	if (!csi2->remote_source)
> +		return -ENODEV;
> +
> +	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
> +	if (IS_ERR(remote_pad)) {
> +		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
> +			csi2->remote_source->name, remote_pad);
> +		return PTR_ERR(remote_pad);
> +	}
> +	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
> +				remote_pad->index, fd);
> +}

Can you use v4l2_subdev_get_frame_desc_passthrough()?

> +
>  static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
>  	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = dw_mipi_csi2rx_set_fmt,
> +	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
>  	.set_routing = dw_mipi_csi2rx_set_routing,
>  	.enable_streams = dw_mipi_csi2rx_enable_streams,
>  	.disable_streams = dw_mipi_csi2rx_disable_streams,
> @@ -487,6 +510,8 @@ static int dw_mipi_csi2rx_notifier_bound(struct v4l2_async_notifier *notifier,
>  		return ret;
>  	}
>  
> +	csi2->remote_source = sd;
> +
>  	return 0;
>  }
>  
> 

-- 
Regards,

Sakari Ailus

