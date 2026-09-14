Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2387C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h1+S8pduABqQpakFXeqr66PFMnSN7CwycUFo65Z9is=; b=VMngKPdBvOSibB7Jw6iSxwyq1+
	ggSCTC2AFlOuNq7vfwp299Ih9ClS19DXK9TW+3ibALf++PIZxmd303fy//19dsvNjAMTIL/X4itHQ
	h7XnN8HRHpFqpYWH3Qsdr2D9wkk3vpWJZgHzC7hmBpMqUYmEvpuaZ1EjHQNSXuBqa65hClal6aa7B
	8+xuZ5dMPeF5e329Zntoi1qFqH0nNBvAnChC7QTwqRznrd5GBBFtLbT6WWCHo/uwp5ewe45os6gxz
	oVjBSePe0ktaqTFufNSISwG+wVLOMnXDOkB5GWb/xpIj9HJBc05Om0/o7sCfl/r2pnd+TN7n0yfVG
	Yu1HfBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66Tw-00000003hyZ-1dIM;
	Mon, 14 Sep 2026 13:12:24 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66Ts-00000003hwx-3XJP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789391541; x=1820927541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oxbFhAvr6JSfGzP5RlSIkIiQp3K9ZHr1MCwoENtbehI=;
  b=XzL5mJrjnyJUZH6xY9QomUkHbNQZfzfDX5BOsUqIKpZ9vqWg6Son1Juy
   18x8KNci8vYm/AUEwtDUcMEeebo8IKr62ayByVTaD/6VAtbFadDbcwMYp
   c9NYtMB48ybj7VkgLIt+6d3ycs5hnTAoxA5/hoQ84yZ1yT1WBsiPn4YCP
   PEhWnTgsMQNQpuzJRXwI6fHf4rQNGnllj9/h+SNq/IdyFg7mafcT6lF+l
   NPp8v+77cRqtTDQ/aR4SKLni5KoP0dPN8pg6j5cBVFyiGhVdehA/ZIupf
   JtxNta80Gs1wRLRK/tMgNZQ8qJB+rGfCjLmDTHJt8ZXaBX3ED7C4qUl1X
   A==;
X-CSE-ConnectionGUID: hVxgILo0RIuDqimEkgqU0w==
X-CSE-MsgGUID: Ydw5xbdQQMqjYhADh6wb1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="112511244"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="112511244"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 06:12:19 -0700
X-CSE-ConnectionGUID: K5cBbZILTeK5caqNakas1g==
X-CSE-MsgGUID: YqxQpIzbRh2TnzGxHNT0cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270832192"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 14 Sep 2026 06:12:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5371A99; Mon, 14 Sep 2026 15:12:14 +0200 (CEST)
Date: Mon, 14 Sep 2026 15:12:14 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Subasri S <subasris1210@gmail.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Duncan Sands <duncan.sands@free.fr>,
	Chas Williams <3chas3@gmail.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Hans de Goede <hansg@kernel.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: typec: Use %pe to print error pointers
Message-ID: <aqfyrs6Hdjc_ywZG@black.igk.intel.com>
References: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
 <20260801-usb-ptr_err_patchset-v2-3-1698e298c1e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-usb-ptr_err_patchset-v2-3-1698e298c1e3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_061220_958739_96A115E2 
X-CRM114-Status: GOOD (  18.89  )
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

On Sat, Aug 01, 2026 at 05:59:52PM +0530, Subasri S wrote:
> Use the %pe format specifier instead of %ld with PTR_ERR() for printing
> error pointers in various typec drivers. This prints symbolic
> error names (e.g.-ENOMEM) instead of errno numbers (e.g. -12),
> making error logs more readable.
> 
> Fix coccinelle reported warning:
> WARNING: Consider using %pe to print PTR_ERR()
> 
> Compile tested only.
> 
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> Signed-off-by: Subasri S <subasris1210@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/pi3usb30532.c | 6 ++----
>  drivers/usb/typec/tcpm/tcpm.c       | 2 +-
>  drivers/usb/typec/wusb3801.c        | 4 ++--
>  3 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
> index 985683fe49e9..b32f4c433de9 100644
> --- a/drivers/usb/typec/mux/pi3usb30532.c
> +++ b/drivers/usb/typec/mux/pi3usb30532.c
> @@ -139,8 +139,7 @@ static int pi3usb30532_probe(struct i2c_client *client)
>  
>  	pi->sw = typec_switch_register(dev, &sw_desc);
>  	if (IS_ERR(pi->sw)) {
> -		dev_err(dev, "Error registering typec switch: %ld\n",
> -			PTR_ERR(pi->sw));
> +		dev_err(dev, "Error registering typec switch: %pe\n", pi->sw);
>  		return PTR_ERR(pi->sw);
>  	}
>  
> @@ -151,8 +150,7 @@ static int pi3usb30532_probe(struct i2c_client *client)
>  	pi->mux = typec_mux_register(dev, &mux_desc);
>  	if (IS_ERR(pi->mux)) {
>  		typec_switch_unregister(pi->sw);
> -		dev_err(dev, "Error registering typec mux: %ld\n",
> -			PTR_ERR(pi->mux));
> +		dev_err(dev, "Error registering typec mux: %pe\n", pi->mux);
>  		return PTR_ERR(pi->mux);
>  	}
>  
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 89eec20a2064..ad10470ea73b 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4796,7 +4796,7 @@ static void tcpm_typec_connect(struct tcpm_port *port)
>  			port->partner_desc.accessory = TYPEC_ACCESSORY_NONE;
>  		partner = typec_register_partner(port->typec_port, &port->partner_desc);
>  		if (IS_ERR(partner)) {
> -			dev_err(port->dev, "Failed to register partner (%ld)\n", PTR_ERR(partner));
> +			dev_err(port->dev, "Failed to register partner (%pe)\n", partner);
>  			return;
>  		}
>  
> diff --git a/drivers/usb/typec/wusb3801.c b/drivers/usb/typec/wusb3801.c
> index 6062875fb04a..86d13ab41670 100644
> --- a/drivers/usb/typec/wusb3801.c
> +++ b/drivers/usb/typec/wusb3801.c
> @@ -277,8 +277,8 @@ static void wusb3801_hw_update(struct wusb3801 *wusb3801)
>  		if (partner_type != WUSB3801_STAT_PARTNER_STANDBY) {
>  			wusb3801->partner = typec_register_partner(port, &desc);
>  			if (IS_ERR(wusb3801->partner))
> -				dev_err(dev, "Failed to register partner: %ld\n",
> -					PTR_ERR(wusb3801->partner));
> +				dev_err(dev, "Failed to register partner: %pe\n",
> +					wusb3801->partner);
>  		}
>  
>  		data_role = pwr_role == TYPEC_SOURCE ? TYPEC_HOST : TYPEC_DEVICE;
> 
> -- 
> 2.43.0

-- 
heikki

