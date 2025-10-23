Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E23CCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnTGlMItlr9pmrLU/+o63n6LHdzCthwDM2GJXakksZI=; b=GZGCvAaxeEGoxJXS0P0ML0yEhw
	hvZT0dV6s3X5S0XcKn+Bnyv1VO1dH9MBO2UOX+cZKCt0x/dXioOyYWf1urU0m5177utrgpvRTxMNc
	MDNHc+EgBBxkFZMlk0KrcHqRNcxICHFUcnw9asGJb8GlqUMCsQ0tn1hY5fJsX8izG0VgQPNFzCXsJ
	80rjJxdzHKTQTZWLeH5kZYTB0W5B4hi+vqynLUTw2FFnaEB880nAn+Cl0Nxms3+Lh4GqY2a/TKpAS
	eE66Pf9dD7fngOey3XBMuxqAZNja1JtRDuPJpJIu9tShKSIOm6iA1lMCXLbY8ksHc9DQ5TutgLpGi
	H2pgOE8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrs8-00000005mUb-3jnX;
	Thu, 23 Oct 2025 09:44:40 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrs6-00000005mTR-22cA;
	Thu, 23 Oct 2025 09:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761212678; x=1792748678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5x8jLsSxghG7IaRrLPPl0lFfXXLzEE7sGy+TAsSxs/Y=;
  b=D7gMHjC9QJZkPcEehLGajenWIKg6nz5fvJkCe0o/A/t+xl7cTZSXv0uv
   TNaudOoNaGKGS7nrOz9ndqWD3rwcYuXoVgpjH9Extp0V9acpUTk4hUPTd
   54458aO7kXVQUK71hIf8j+qmjonPXacFJ7V96ttwO+W+32Q56zV+aH678
   FhchFn2Z06RiG+8m0vsx6OreKu7VmvQB8irNKaIR8ZjfSJ8oRd5yeLLti
   S011ul0n+gtBiKKmbVAVclfI8KiRltrZZJA3tdcm0VlN7amijzgL4fY0c
   hHI+tObYrdVed1qJ+o1kr7vdj5GUPQLVYuOJRBTOIdU/fWKXVoDU6T9YK
   Q==;
X-CSE-ConnectionGUID: 73ayxTu9QvuHNN88XMbkxQ==
X-CSE-MsgGUID: l9XLwfQ1Rj+aj+zwePs2Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88844040"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="88844040"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 02:44:37 -0700
X-CSE-ConnectionGUID: iLOeuevISgC6L9OMMBEeEA==
X-CSE-MsgGUID: YhP6hwNSQqC/F6AV1drOTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="221305921"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.221.165])
  by orviesa001.jf.intel.com with SMTP; 23 Oct 2025 02:44:26 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 23 Oct 2025 12:44:25 +0300
Date: Thu, 23 Oct 2025 12:44:25 +0300
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
Subject: Re: [PATCH v7 1/9] usb: typec: Add notifier functions
Message-ID: <aPn4-S7upPOOtenr@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com>
 <aPni4AeDaem_rfZH@kuha.fi.intel.com>
 <aPnvoSRJefwDlpNO@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPnvoSRJefwDlpNO@kuha.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_024438_535490_76E9DA74 
X-CRM114-Status: GOOD (  21.44  )
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

On Thu, Oct 23, 2025 at 12:04:44PM +0300, Heikki Krogerus wrote:
> On Thu, Oct 23, 2025 at 11:10:20AM +0300, Heikki Krogerus wrote:
> > Hi,
> > 
> > > diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
> > > new file mode 100644
> > > index 000000000000..a3f1f3b3ae47
> > > --- /dev/null
> > > +++ b/include/linux/usb/typec_notify.h
> > > @@ -0,0 +1,17 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +
> > > +#ifndef __USB_TYPEC_NOTIFY
> > > +#define __USB_TYPEC_NOTIFY
> > > +
> > > +#include <linux/notifier.h>
> > > +
> > > +enum usb_typec_event {
> > > +	TYPEC_ALTMODE_REGISTERED
> > > +};
> > 
> > Don't you need to know when the altmode is removed?
> 
> I noticed that you don't because drm_dp_hpd_bridge_register() is
> always resource managed. But I think you could still send an event
> also when the altmode is removed already now. That way it does not
> need to be separately added if and when it is needed.

Hold on! Every bus has already a notifier chain. That's the one that
we should also use. Sorry for not noticing that earlier.

So let's just export the bus type in this patch - you can then use
bus_register_notifier() in your driver:

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index a884cec9ab7e..65ded9e3cdaa 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -547,3 +547,4 @@ const struct bus_type typec_bus = {
        .probe = typec_probe,
        .remove = typec_remove,
 };
+EXPORT_SYMBOL_GPL(typec_bus);
diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index 643b8c81786d..af9edb3db9d0 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -5,7 +5,6 @@
 
 #include <linux/usb/typec_altmode.h>
 
-struct bus_type;
 struct typec_mux;
 struct typec_retimer;
 
@@ -28,7 +27,6 @@ struct altmode {
 
 #define to_altmode(d) container_of(d, struct altmode, adev)
 
-extern const struct bus_type typec_bus;
 extern const struct device_type typec_altmode_dev_type;
 
 #define is_typec_altmode(_dev_) (_dev_->type == &typec_altmode_dev_type)
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 309251572e2e..c6fd46902fce 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -20,12 +20,15 @@ struct typec_port;
 struct typec_altmode_ops;
 struct typec_cable_ops;
 
+struct bus_type;
 struct fwnode_handle;
 struct device;
 
 struct usb_power_delivery;
 struct usb_power_delivery_desc;
 
+extern const struct bus_type typec_bus;
+
 enum typec_port_type {
        TYPEC_PORT_SRC,
        TYPEC_PORT_SNK,

thanks,

-- 
heikki

