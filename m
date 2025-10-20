Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C63CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjxjvFyOg2tWh/C3nfIMlYEII+n9xlkCC1lcSDNijvs=; b=tNxqmGThZ0h/lfdhXJVdF83eAM
	kVPC7AbRrZgfCt2WzfRflAJK+J9M22VaC1N0J2lIlrrCKBe77NP5F97R21HKQWCK/hign8oaDSL1m
	TIvNJUpDtVmtCI9T9lQI2uMYnpcWp8j/ia4FKVvWMrms+63uUyUiIFKad/GHHwQolhdw7IA63GJ6+
	JvJoAyHlqzHMSyKBzqsYdVmovnPW64JrL1hOrmZyvLdNTzcZWaxqLQ4DRVCmeHvxTvXwn1g5mZQwv
	sM0elIUY25qpDufjsYKSq376fSCkWeUk23W9rIpKDEdxVgs3gz+pMlzTLJLf8JY/1bQ6iYO3WP0gA
	21v76q1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmib-0000000Chob-36sM;
	Mon, 20 Oct 2025 10:02:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmia-0000000Chnl-1WOr;
	Mon, 20 Oct 2025 10:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NjxjvFyOg2tWh/C3nfIMlYEII+n9xlkCC1lcSDNijvs=; b=StwXwUw49X2L6/ib4+ipXcl8pl
	gBETBpp4HhDXI5ytV3XGbisxI9wgplLdeqM2Uuhi4QGN7W4Ywh+Qwc7NrfpyPd2dgYRV7+tnMQvPy
	zhOHGhTCMHIZExJRbtwBGBVPF/tMuULrL8oipRFWu4aH2sFis0RmD/oDi1xzTEjorD3efpE5kCzl6
	1BfIeGP580f8f+zd2MMDFd1jp1sUKS0Uwd9R9ncMKR5waKUASm7mTkzBr7PL3VKz0TgeJoegEZ5FY
	xKkP0JbNOa0HyVBPH86hw7K0jxUjnrA4GxeiWPAtB7dDeKhWzdOx++UZIMEGhA5JGLJ/4F1EU6Gxo
	lG4+eQuA==;
Received: from mgamail.intel.com ([198.175.65.19])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmiW-00000009hMp-1gOQ;
	Mon, 20 Oct 2025 10:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760954537; x=1792490537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7OgHgc7V9jCA/aH/wZmpPfoG6Zo6Xb08lXUbbydETp4=;
  b=E6mcU9EvtsaQGGqOhJEusBBiyHTO73dRTlOZVdtoNK1kUzjdWVLCsDG7
   ZUdCvjJuJvxRgcjXQ7nmZItJCXakJ7V8hhNkO9QVdM4PhN+xDmHLmLVYz
   HYXuQZNp9JidMI2y9fOw5SwFQm+7KCgAaErdWQllqEjQxocrIHsldcovl
   r6Phbx4izlfWY7+bplkzxfr9+j6RraiDrf9t/3/XlrWkOksR7B/WBhqgD
   g6ic5JxvumQqWHARtpzsQXXjs8Gf/A0e2kFrsCfTxUqcv1nKnGjAjHAft
   S0kQNikSD3gBNWPtqtjApoeyYAxp29TfPtrjUwllqhun1Syp4EOFmpKIf
   g==;
X-CSE-ConnectionGUID: S5c27wnUQ8KD3BuEs4fCMQ==
X-CSE-MsgGUID: DQk9SL6BSTScfhGgm1roJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62962755"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="62962755"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 03:02:10 -0700
X-CSE-ConnectionGUID: Rbwng+eMQgabSBT8iqlHxg==
X-CSE-MsgGUID: 5PEY46adTHK0yIfKFWIaWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183308787"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.220.112])
  by orviesa008.jf.intel.com with SMTP; 20 Oct 2025 03:02:01 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 20 Oct 2025 13:02:00 +0300
Date: Mon, 20 Oct 2025 13:02:00 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 1/8] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <aPYImGmesrZWwyqh@kuha.fi.intel.com>
References: <20251016022741.91-1-kernel@airkyi.com>
 <20251016022741.91-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016022741.91-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_110217_080944_479A4148 
X-CRM114-Status: GOOD (  29.09  )
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

On Thu, Oct 16, 2025 at 10:27:34AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add default DRM AUX HPD bridge device when register DisplayPort
> altmode. That makes it redundant for each Type-C driver to implement
> a similar registration process in embedded scenarios.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v6:
> - Fix depend in Kconfig.
> 
> Changes in v5:
> - Remove the calls related to `drm_aux_hpd_bridge_notify()`.
> - Place the helper functions in the same compilation unit.
> - Add more comments about parent device.
> 
>  drivers/usb/typec/Kconfig         |  2 ++
>  drivers/usb/typec/class.c         | 26 ++++++++++++++++++++++++++
>  include/linux/usb/typec_altmode.h |  2 ++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 2f80c2792dbd..a6730fbb576b 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -2,6 +2,8 @@
>  
>  menuconfig TYPEC
>  	tristate "USB Type-C Support"
> +	depends on DRM || DRM=n
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF

This is wrong. DRM should not dictate how this entire subsystem core
is configured. The dependency needs to be on the DRM bridge side.

You can for example use the bus notification there to see when a new
alternate mode is being registered, or use some other notification
mechanism.

thanks,

>  	help
>  	  USB Type-C Specification defines a cable and connector for USB where
>  	  only one type of plug is supported on both ends, i.e. there will not
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 67a533e35150..e9d7772d1a8f 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -8,14 +8,18 @@
>  
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
>  #include <linux/usb/pd_vdo.h>
> +#include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
>  #include <linux/usb/typec_retimer.h>
>  #include <linux/usb.h>
>  
> +#include <drm/bridge/aux-bridge.h>
> +
>  #include "bus.h"
>  #include "class.h"
>  #include "pd.h"
> @@ -538,6 +542,21 @@ const struct device_type typec_altmode_dev_type = {
>  	.release = typec_altmode_release,
>  };
>  
> +static void dp_altmode_hpd_device_register(struct typec_altmode *alt)
> +{
> +	if (alt->svid != USB_TYPEC_DP_SID)
> +		return;
> +
> +	/*
> +	 * alt->dev.parent->parent : USB-C controller device
> +	 * alt->dev.parent         : USB-C connector device
> +	 */
> +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> +						  to_of_node(alt->dev.parent->fwnode));
> +	if (IS_ERR(alt->hpd_dev))
> +		alt->hpd_dev = NULL;
> +}
> +
>  static struct typec_altmode *
>  typec_register_altmode(struct device *parent,
>  		       const struct typec_altmode_desc *desc)
> @@ -600,6 +619,13 @@ typec_register_altmode(struct device *parent,
>  		return ERR_PTR(ret);
>  	}
>  
> +	/*
> +	 * It is too late to register the HPD device when the DisplayPort
> +	 * altmode device becomes ready. If the current altmode is DP,
> +	 * register a static HPD device.
> +	 */
> +	dp_altmode_hpd_device_register(&alt->adev);
> +
>  	return &alt->adev;
>  }
>  
> diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
> index b3c0866ea70f..acb0af1b9d5d 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -21,6 +21,7 @@ struct typec_altmode_ops;
>   * @desc: Optional human readable description of the mode
>   * @ops: Operations vector from the driver
>   * @cable_ops: Cable operations vector from the driver.
> + * @hpd_dev: HPD device for DisplayPort
>   */
>  struct typec_altmode {
>  	struct device			dev;
> @@ -32,6 +33,7 @@ struct typec_altmode {
>  	char				*desc;
>  	const struct typec_altmode_ops	*ops;
>  	const struct typec_cable_ops	*cable_ops;
> +	struct device			*hpd_dev;
>  };
>  
>  #define to_typec_altmode(d) container_of(d, struct typec_altmode, dev)
> -- 
> 2.49.0

-- 
heikki

