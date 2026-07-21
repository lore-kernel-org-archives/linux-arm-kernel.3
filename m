Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF934C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Bv0W+JQEL6ADNPAdp95OLSMTSgSuPkYYijdC9ImxOY=; b=2RShVssXXnlYZ2vqtl/zJY1+Yp
	QZFxtiEnYrOamhbpR7fRWHSwInyi6tVBSNFndP5yWgk5zmCydUAAPFyATFAe0fEGiW5oKjyjKSywj
	IP2YlFENgLwdS4LqtzAFLVbNlvjh6/jzPWLhpz0khe/qAW9kRAasg/peq903KcSdUKQhTM/Qjl3iO
	cU5Opx3loa7pz8QLcI5y6nPr9wwIDxBFCD6eXcsbqYQWuYlL8HL0ym4Ys0JLmjthLCs079TbPavBp
	1znUDWgRqZDtJEOXLfNZL6SpXM/GBRBH9RiohSnFNKX8aJZWrMtZB7d6S/3gxdq0fPipah4Rfr7p/
	AwOysjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7nH-00000009CQM-12ot;
	Tue, 21 Jul 2026 10:33:47 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7n8-00000009CJ7-2VAN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784630019; x=1816166019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WJGTqjCh1G3VEZn3GJLICNgLE0eVx5PejOB2rEtQ0YU=;
  b=G6uzc7ICQaFxJCE/PSbfGf+EIGBeuiDk5nDW/EaldDF57EvfUQ+vnYgK
   VyXs2AJQDpeRe7eoNnDHX+H8KA6FekBmHFH5xl/I1PG1CrDoAh77D8rWY
   tP65KE0DM9wMPmnf78rqQz+BfPPE+t5YwlLEov20pQstdJx2BaMygt0bY
   aKYC0t2xMP4SEHKcF+wLTm4KIIpu2ij8OzkOShwqzNh3+M/Y08lg46xXb
   TuOn2pdkrgNkh7ILQM1H4H+c+IaGdHu+AGcPW/+vTyrz3mHCkC8sVyozB
   ry+80lYt89NZRKy6OQ3vo3fRzin/KfJrlpF5O4FwE1u4MaJ1txo4xNCUG
   w==;
X-CSE-ConnectionGUID: ecLr8RtxRvGD8SGsnNLWPQ==
X-CSE-MsgGUID: kbgygln9QH2ZUWOlmkYGGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89117456"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="89117456"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 03:33:38 -0700
X-CSE-ConnectionGUID: LOm+XhIsSSC11g9b3Ixtdg==
X-CSE-MsgGUID: Jf4YByYiTEC9GfPIHvQ8WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="253369954"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2026 03:33:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id EB03695; Tue, 21 Jul 2026 12:33:32 +0200 (CEST)
Date: Tue, 21 Jul 2026 13:33:31 +0300
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
Subject: Re: [PATCH 3/3] usb: typec: Use %pe to print error pointers
Message-ID: <al9K-4w4FykFIgpi@kuha>
References: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
 <20260719-usb-ptr_err_patchset-v1-3-85f7f2e4fefb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-usb-ptr_err_patchset-v1-3-85f7f2e4fefb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_033338_668986_8D9ABF48 
X-CRM114-Status: GOOD (  20.24  )
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

Hi Subasri,

Thanks for the patch.

On Sun, Jul 19, 2026 at 06:25:48PM +0530, Subasri S wrote:
> Use the %pe format specifier instead of %ld with PTR_ERR() for printing
> error pointers in various typec drivers. This prints symbolic
> error names (e.g.-ENOMEM) instead of errno numbers (e.g. -12),
> making error logs more readable.
> 
> This patch fixes coccinelle reported warnings:
> ./typec/tcpm/tcpm.c:4799:60-67: WARNING: Consider using %pe to print PTR_ERR()
> ./typec/mux/pi3usb30532.c:143:3-10: WARNING: Consider using %pe to print PTR_ERR()
> ./typec/mux/pi3usb30532.c:155:3-10: WARNING: Consider using %pe to print PTR_ERR()
> ./typec/wusb3801.c:281:5-12: WARNING: Consider using %pe to print PTR_ERR()
> 
> Compile tested only.
> 
> Signed-off-by: Subasri S <subasris1210@gmail.com>
> ---
>  drivers/usb/typec/mux/pi3usb30532.c | 8 ++++----
>  drivers/usb/typec/tcpm/tcpm.c       | 2 +-
>  drivers/usb/typec/wusb3801.c        | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
> index 985683fe49e9..a2357a28ecf4 100644
> --- a/drivers/usb/typec/mux/pi3usb30532.c
> +++ b/drivers/usb/typec/mux/pi3usb30532.c
> @@ -139,8 +139,8 @@ static int pi3usb30532_probe(struct i2c_client *client)
>  
>  	pi->sw = typec_switch_register(dev, &sw_desc);
>  	if (IS_ERR(pi->sw)) {
> -		dev_err(dev, "Error registering typec switch: %ld\n",
> -			PTR_ERR(pi->sw));
> +		dev_err(dev, "Error registering typec switch: %pe\n",
> +			pi->sw);

One line is enough.

>  		return PTR_ERR(pi->sw);
>  	}
>  
> @@ -151,8 +151,8 @@ static int pi3usb30532_probe(struct i2c_client *client)
>  	pi->mux = typec_mux_register(dev, &mux_desc);
>  	if (IS_ERR(pi->mux)) {
>  		typec_switch_unregister(pi->sw);
> -		dev_err(dev, "Error registering typec mux: %ld\n",
> -			PTR_ERR(pi->mux));
> +		dev_err(dev, "Error registering typec mux: %pe\n",
> +			pi->mux);

Ditto.

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

Thanks,

-- 
heikki

