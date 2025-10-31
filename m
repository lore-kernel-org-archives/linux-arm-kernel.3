Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EA7CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XK/qtFrXJ0YnKktB/zmxL7ExGBfEE/2+q4yaPGPs90s=; b=bnNjE/iTskyBE3K4/rY0sB9nT7
	ht4e5G5EPozLhBQfMWR3kxikwJcSwqBCewNv7AkW5gYYmr2QRSaT0IMqnvLUwzGLYiBitbRWheekv
	1AdiAxFsXFIBgTXmFBqrHSc8src8pFWf/EmPBzdGkSbMHWO6cFk+swFLujCevNr0ibz+5Yhd1Zz32
	6bdefjoA+bVeqlf8yAqogcOvoTBSgRv/7U2JSRhDscTEjIhfez17BjkgwZ6sWlrUD7OIn+d2wWXpE
	r+R+M1oH+m9o5FdHfZiPRVIEEr5pxWFkTrMpDXrWLntUoc/ILdvORMfgG1moL1WDmt/XYIj3fEpll
	eyWZ6kEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpVM-00000006AsN-2wpI;
	Fri, 31 Oct 2025 13:49:24 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpVI-00000006ArK-2T6U;
	Fri, 31 Oct 2025 13:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761918561; x=1793454561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HYOEnKzDkgpEufqlLglR4PKxYUcxwU5/7H2j5fZg/Vg=;
  b=BHxRYXWi6DdJ6V3N/WFilCSbHb3k3qr2cJKwETlgkxAH+m2cp4TgaPxZ
   OiKuWIcDEEf0adbW+XbLh2GsSsu63tNRztRPuDnlNHHipMlCGmOAlGW8V
   O0vniVjJtshO/NZr42y82vvO+f0v0E6ToT6vKWZrLU1bzqVMqRd9WhtmT
   W9LihST9jhJoTWtPvHNEz9mU2zmZgdE0ByLtsYEsXRA/vZIM7vZROd3k8
   fFHfR7Jm7kZJb9ZBIH92J4wFEqRwa3pvppKNKGjhhBJT6LIcAM73eXwWR
   2fWFTQ/oU+FyFtzx/qEN/99sJLL8QMzO15VN11qSqHiwOlZDHwNBGKeoa
   w==;
X-CSE-ConnectionGUID: p8kHvefEQA6mmvZHpibY+w==
X-CSE-MsgGUID: gNhBZ71DSRevvPmN6krw9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89542978"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="89542978"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 06:49:19 -0700
X-CSE-ConnectionGUID: 7+2Rt3wtTpGrCunfhDOadg==
X-CSE-MsgGUID: THGSvAIfTTaI5GaWq7/fJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="185512675"
Received: from jjgreens-desk20.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.220.81])
  by orviesa010.jf.intel.com with SMTP; 31 Oct 2025 06:49:08 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 31 Oct 2025 15:49:06 +0200
Date: Fri, 31 Oct 2025 15:49:06 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 02/10] usb: typec: Export all typec device types
Message-ID: <aQS-UtR7JGyXKmTB@kuha.fi.intel.com>
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029071435.88-3-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_064920_662739_085CF1C2 
X-CRM114-Status: GOOD (  16.69  )
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

Wed, Oct 29, 2025 at 03:14:27PM +0800, Chaoyi Chen kirjoitti:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Export all typec device types for identification.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/class.c |  4 ++++
>  drivers/usb/typec/class.h | 10 ----------
>  include/linux/usb/typec.h | 10 ++++++++++
>  3 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 51e971bc68d1..04b55f066b06 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -793,6 +793,7 @@ const struct device_type typec_partner_dev_type = {
>  	.groups = typec_partner_groups,
>  	.release = typec_partner_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_partner_dev_type);
>  
>  static void typec_partner_link_device(struct typec_partner *partner, struct device *dev)
>  {
> @@ -1147,6 +1148,7 @@ const struct device_type typec_plug_dev_type = {
>  	.groups = typec_plug_groups,
>  	.release = typec_plug_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_plug_dev_type);
>  
>  /**
>   * typec_plug_set_num_altmodes - Set the number of available plug altmodes
> @@ -1295,6 +1297,7 @@ const struct device_type typec_cable_dev_type = {
>  	.groups = typec_cable_groups,
>  	.release = typec_cable_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_cable_dev_type);
>  
>  /**
>   * typec_cable_get - Get a reference to the USB Type-C cable
> @@ -2034,6 +2037,7 @@ const struct device_type typec_port_dev_type = {
>  	.uevent = typec_uevent,
>  	.release = typec_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_port_dev_type);
>  
>  /* --------------------------------------- */
>  /* Driver callbacks to report role updates */
> diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> index db2fe96c48ff..f04f6987bed8 100644
> --- a/drivers/usb/typec/class.h
> +++ b/drivers/usb/typec/class.h
> @@ -87,16 +87,6 @@ struct typec_port {
>  #define to_typec_cable(_dev_) container_of(_dev_, struct typec_cable, dev)
>  #define to_typec_partner(_dev_) container_of(_dev_, struct typec_partner, dev)
>  
> -extern const struct device_type typec_partner_dev_type;
> -extern const struct device_type typec_cable_dev_type;
> -extern const struct device_type typec_plug_dev_type;
> -extern const struct device_type typec_port_dev_type;
> -
> -#define is_typec_partner(dev) ((dev)->type == &typec_partner_dev_type)
> -#define is_typec_cable(dev) ((dev)->type == &typec_cable_dev_type)
> -#define is_typec_plug(dev) ((dev)->type == &typec_plug_dev_type)
> -#define is_typec_port(dev) ((dev)->type == &typec_port_dev_type)
> -
>  extern const struct class typec_mux_class;
>  extern const struct class retimer_class;
>  extern const struct class typec_class;
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 309251572e2e..02fed8293415 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -56,6 +56,16 @@ enum typec_role {
>  	TYPEC_SOURCE,
>  };
>  
> +extern const struct device_type typec_partner_dev_type;
> +extern const struct device_type typec_cable_dev_type;
> +extern const struct device_type typec_plug_dev_type;
> +extern const struct device_type typec_port_dev_type;
> +
> +#define is_typec_partner(dev) ((dev)->type == &typec_partner_dev_type)
> +#define is_typec_cable(dev) ((dev)->type == &typec_cable_dev_type)
> +#define is_typec_plug(dev) ((dev)->type == &typec_plug_dev_type)
> +#define is_typec_port(dev) ((dev)->type == &typec_port_dev_type)
> +
>  static inline int is_sink(enum typec_role role)
>  {
>  	return role == TYPEC_SINK;
> -- 
> 2.49.0

-- 
heikki

