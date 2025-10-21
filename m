Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A77CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZFk72uDsBhOQIdijnJYK6BskCHkHiVS4xUhthivpZk=; b=lLncrp1I7snifJJanayYhlINmV
	I9EwBNlmeWeVE+cTeV6OyBNu5NklfIX5AfTvNEhn+eQTPlj7nCOx+QQGurjE8cFCyvUA8MwnqyGHw
	kWLlzR2DrLkePlh0WMjG9dNqUguFiq6TaAfzVaqSMqz38jKcODoTYlpACblX2K8abvdfJziXZBmV1
	/kcdGcauAzVxj07W82r2PRbd0SvyPnNX96oeEMf5cykhIy9AKG7su6F/S839Na6l5tgn6F9xBlhAJ
	NWt+ssqQiF0Ps7ixA8TUJjE7nUaSsUZAW/I39YEoDd5A/nr04VVzD8crSznXa95ncECURl/TD9Y0g
	TCAMvNIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB83A-0000000GLRs-3F89;
	Tue, 21 Oct 2025 08:49:00 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB837-0000000GLOQ-2KLO;
	Tue, 21 Oct 2025 08:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761036538; x=1792572538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ixN0SnuQ8N2jtGJB1Dvgz9zJy2AHG8oUKIXx/yt/S8w=;
  b=ktSh5prXMw9y99evlhcjqnUUs5FcOxox0rlz2Sg8JkR3N6aaEHJHv0k2
   KFeg1UxvmF5s2eOpTcM++8CXDMIEPxrcqDHPBhSSEr1QUyCeg05KtRtJ+
   ugaf/GhtBVvLWmn9pSmf/A/DauVgZMvpKKNs5s2H/yZD7f8vJ2DCsHKbh
   zF78Be8G0N7GUxQxa5+AxjygxXS0NQG87xpxRmSokd1WzsyDuhquGbMWH
   UpHBcx2JAHvY250D0PUO6pF1Ixz2DMyUYO5l6zwyp99LR5vizsDHF788d
   FWUE2wj7ZONkWa3o7HlfSEr2AqTXqFfixTkBi3DDnuxfGhD6NX1C+r4eQ
   g==;
X-CSE-ConnectionGUID: ofn0cztuSFOC1Ab+dCsjRQ==
X-CSE-MsgGUID: A0ciot2mScmxrxVM4pKYmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62190159"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="62190159"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 01:48:56 -0700
X-CSE-ConnectionGUID: eCD/H1/RSIKfOQZXnX6Vww==
X-CSE-MsgGUID: 5oEWrWiFR5aYJfjpPgNG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="183099996"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.220.224])
  by orviesa009.jf.intel.com with SMTP; 21 Oct 2025 01:48:47 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 21 Oct 2025 11:48:45 +0300
Date: Tue, 21 Oct 2025 11:48:45 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 1/8] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <aPdI7Vb_djrfCfbT@kuha.fi.intel.com>
References: <20251016022741.91-1-kernel@airkyi.com>
 <20251016022741.91-2-kernel@airkyi.com>
 <aPYImGmesrZWwyqh@kuha.fi.intel.com>
 <954a67d1-1759-4e18-8eef-3fa14fb3cef5@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <954a67d1-1759-4e18-8eef-3fa14fb3cef5@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_014857_627178_5263CF80 
X-CRM114-Status: GOOD (  26.67  )
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

Hi,

On Mon, Oct 20, 2025 at 07:07:46PM +0800, Chaoyi Chen wrote:
> Hi Heikki,
> 
> On 10/20/2025 6:02 PM, Heikki Krogerus wrote:
> > On Thu, Oct 16, 2025 at 10:27:34AM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > Add default DRM AUX HPD bridge device when register DisplayPort
> > > altmode. That makes it redundant for each Type-C driver to implement
> > > a similar registration process in embedded scenarios.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > ---
> > > 
> > > Changes in v6:
> > > - Fix depend in Kconfig.
> > > 
> > > Changes in v5:
> > > - Remove the calls related to `drm_aux_hpd_bridge_notify()`.
> > > - Place the helper functions in the same compilation unit.
> > > - Add more comments about parent device.
> > > 
> > >   drivers/usb/typec/Kconfig         |  2 ++
> > >   drivers/usb/typec/class.c         | 26 ++++++++++++++++++++++++++
> > >   include/linux/usb/typec_altmode.h |  2 ++
> > >   3 files changed, 30 insertions(+)
> > > 
> > > diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> > > index 2f80c2792dbd..a6730fbb576b 100644
> > > --- a/drivers/usb/typec/Kconfig
> > > +++ b/drivers/usb/typec/Kconfig
> > > @@ -2,6 +2,8 @@
> > >   menuconfig TYPEC
> > >   	tristate "USB Type-C Support"
> > > +	depends on DRM || DRM=n
> > > +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> > This is wrong. DRM should not dictate how this entire subsystem core
> > is configured. The dependency needs to be on the DRM bridge side.
> > 
> > You can for example use the bus notification there to see when a new
> > alternate mode is being registered, or use some other notification
> > mechanism.
> 
> Is it a good idea to implement notification functions like
> drivers/usb/core/notify.c in TCPM, and then let other subsystems (such as DRM)
> listen to these notifications?

Don't limit this to tcpm only. I would suggest something similar what
we have for usb bus: drivers/usb/core/notify.c

So that, but for the typec bus. Then in DRM bridge code you just use
typec_register/unregister_notify().

thanks,

-- 
heikki

