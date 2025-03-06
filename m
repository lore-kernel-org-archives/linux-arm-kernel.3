Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F06EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 19:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcPTYtu0Id6NGn3oYEB5ke8Yt/wGoQtkJ2G5rC4dZ8Y=; b=w9otCXUd5FVsJKeJPMZBxaj5YE
	C3w4zgBRO2M070IdmU1sWZILm0v65R6WZGBkM2WWsO0kQpoll9T5Ehsg5mh5OZZ0Tz6EYbxNBZbja
	edhtjWpXcXqwL+9sGxI/qT9qTXE+MNjXaVxv9sx1sHUEMM5EZaRcPuDJIidRqEHXdzVneIjjg0Fxc
	8QxZGy+I1LaCtnRTWWLtFgKE/FmXa9UgvuyEEy4CKUou2ZGaRYm2Oce7p7mw7hT6b9AlOfIN3Oeuu
	1nPr4W7JaGp+nFFX89h667x5rkciXP+GQXY1mqYjX68qfWRqzCIiVZRzGkGgDqQ/AaYEAmX8Rl4ai
	ILa1qI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGal-0000000By0o-1rsI;
	Thu, 06 Mar 2025 19:09:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGZ4-0000000BxtE-1D6g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 19:07:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso6821005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 11:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741288044; x=1741892844; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcPTYtu0Id6NGn3oYEB5ke8Yt/wGoQtkJ2G5rC4dZ8Y=;
        b=sflsCIOPtc3aFEq6RI0W5QhUkbwrC1cUC3NnPLvyvVFy2OLFSY3tLxvR5ntM1qR6Dc
         b8Vo7xtH57jox3YpXP6TFqZYnyzVYetSbGrIuWFLGb36RRskWxBPCkIso4CoPetA0qgT
         l0XQLg97usrrS9fwwm56OolkWQUtytE0+6kiAp29u47f93fPrDqYFRmFo9+PBMmySY4R
         yuQPiT13fbuvWZpx4KVJqwYyb+VyjAqp7E23CA2l0SiEydm3jgJbKCu11StSWb6PykZM
         D4QCaO2BZQsSqROuCqgbzqHLVfEpNGUxdeUCSVI3ABll742L1+hGULLswedS2kMp4UI3
         iXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741288044; x=1741892844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcPTYtu0Id6NGn3oYEB5ke8Yt/wGoQtkJ2G5rC4dZ8Y=;
        b=i6uXa107L2yrtkMit1oJ1qdV4WX4QlI+ek0Dtk0P7wo3aTH8sJLDJoLQVhU630FieK
         vmrf/70/UNqqnIy8Fn88zokILnJFWvxUm9nC9cPngCM/cv6ikazfpn0fdFvwcF0x68oL
         sEC+gaXuZyaGgA8K9wKQoWcN9QWGv1xiumlmkzfcZNt+hbrBcHOgsOyJT4gs99JO0S9o
         nHG8V0XLevl9NbUOizq4AMxoA4dqGzSaNcDWSqMT5JdhqgCoYxxKEa6+om75PExYWZ+c
         b0RrxHVUdmIIOEkWLxpyf0h5FO6/WZngsqvFAqoMcL4f/fnFgo0AU4QQyWvXVAST6zzs
         GQqw==
X-Forwarded-Encrypted: i=1; AJvYcCVAVJQXjgXctFYoVDajda9IObVpM6CtuTwC1HeXJ1ryIgMFrIOjBOo24raIibFW2iCYZWY0fBZnXLY304kMjOuc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6UGeUPEL0zY6Wzz3cyYn0QRkxTn+B6l+EnX0ID5RTND1ZHJQt
	Se4RbqowVapsgTZJre8OpDwl+lwHAe2P92vw6G42Ir7eo7foV847OicPApUyFLk=
X-Gm-Gg: ASbGncvAujHXG9CWlC8//Jbslblqalc4gEWLW008mRwK2Ch06G1XnOWHQtzx1SSvjrH
	RGMbxcCfDKGjD7hPY52fC3oqkv2gCoomIAgjQDC++oPWvIhT4MFnvQPBSaiXX3CZDNlAbirVWwg
	3ofrMnL4Yfi654lKHncJ5jR33V+uopn+unZF/YjE4bxKx0Ej3XmmI3Wb5ilI3hsvKQAN7io4gyL
	EoRtexjJsKWsCQGJ4i5gojtfPLfE+cPraFlEQBUeRLPRRtxe5yC4kgBMax61HA+fPHryftD7WGp
	JfceaZTk7LUmzM7EMyvHh+9X33uyd0kS1mamB+4vZwAsnT9aIg==
X-Google-Smtp-Source: AGHT+IGw/KEJ9CBs+ZmqDYKL+kV1HSN6Zuv++vQFuUB2xUBy6Y//0Fpmd9GzursfaQ4hN9Ki5iMA9Q==
X-Received: by 2002:a5d:6c66:0:b0:390:fceb:72f1 with SMTP id ffacd0b85a97d-39132d7625emr290402f8f.26.1741288044594;
        Thu, 06 Mar 2025 11:07:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e1476sm2880709f8f.70.2025.03.06.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:07:23 -0800 (PST)
Date: Thu, 6 Mar 2025 22:07:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mathis Foerst <mathis.foerst@mt.com>, linux-kernel@vger.kernel.org,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v1 1/1] media: imx: csi: Parse link configuration from
 fw_node
Message-ID: <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
 <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_110726_334327_134DD3AC 
X-CRM114-Status: GOOD (  40.41  )
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

On Thu, Mar 06, 2025 at 04:33:18PM +0000, Sakari Ailus wrote:
> Hi Mathis,
> 
> Thanks for the patch.
> 
> On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> > The imx-media-csi driver requires upstream camera drivers to implement
> > the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> > implement this function are not usable on the i.MX6.
> > 
> > The docs for get_mbus_config [1] say:
> > @get_mbus_config: get the media bus configuration of a remote sub-device.
> >             The media bus configuration is usually retrieved from the
> >             firmware interface at sub-device probe time, immediately
> >             applied to the hardware and eventually adjusted by the
> >             driver.
> > 
> > Currently, the imx-media-csi driver is not incorporating the information
> > from the firmware interface and therefore relies on the implementation of
> > get_mbus_config by the camera driver.
> > 
> > To be compatible with camera drivers not implementing get_mbus_config
> > (which is the usual case), use the bus information from the fw interface:
> > 
> > The camera does not necessarily has a direct media bus link to the CSI as
> > the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> > between them on the media pipeline.
> > The CSI driver already implements the functionality to find the connected
> > camera sub-device to call get_mbus_config on it.
> > 
> > At this point the driver is modified as follows:
> > In the case that get_mbus_config is not implemented by the upstream
> > camera, try to get its endpoint configuration from the firmware interface
> > usign v4l2_fwnode_endpoint_parse.
> > For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> > V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> > configuration.
> > For all other mbus_types, return an error.
> > 
> > Note that parsing the mbus_config from the fw interface is not done during
> > probing because the camera that's connected to the CSI can change based on
> > the selected input of the video-mux at runtime.
> > 
> > [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> > [1] include/media/v4l2-subdev.h - line 814
> > 
> > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > ---
> >  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
> >  1 file changed, 32 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > index 3edbc57be2ca..394a9321a10b 100644
> > --- a/drivers/staging/media/imx/imx-media-csi.c
> > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> >  {
> >  	struct v4l2_subdev *sd, *remote_sd;
> >  	struct media_pad *remote_pad;
> > +	struct fwnode_handle *ep_node;
> > +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> 
> Are there any defaults in DT bindings (other than 0's)? Also initialising a
> field to zero this way is redundant, just use {}.
> 

I was going to respond in much the same way.  This is equivalen to:

struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_UNKNOWN };

> >  	int ret;
> >  
> >  	if (!priv->src_sd)
> > @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> >  
> >  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> >  			       remote_pad->index, mbus_cfg);
> > -	if (ret == -ENOIOCTLCMD)
> > -		v4l2_err(&priv->sd,
> > -			 "entity %s does not implement get_mbus_config()\n",
> > -			 remote_pad->entity->name);
> > +	if (ret == -ENOIOCTLCMD) {
> 
> 	if (!ret)
> 		return 0;
> 
> And you can unindent the rest.

I was going to say this too but then I thought actually this needs to
be:

	if (ret != -ENOIOCTLCMD)
		return ret;

Which is weird.  Better to break all the new code into a separate
helper function.

	if (ret == -ENOIOCTLCMD)
		ret = parse_fw_link_config_stuff();

	return ret;

regards,
dan carpenter



