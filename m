Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C554BD2F7D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OU2/4GpPx1UuLw3kt1dDvX5uH6u/gSvtgCMIpLbHuwA=; b=KV0IK3DCOteGq52jfBlmJAA55P
	1e8pVti2T6f5uneT9cra64OJDucK/gaU0q0bxrbXx8Zhtc69AETOH5vs6uCo7bESfhHcewn1aIPVM
	7xvnebulFFPlLwJdFez1h8dX66ExLPCVHZ4yuObX7Pr1S9vVLeMMylfNHVDxW6bXwvedCdUPxmnsN
	u88BYVTV0af0QfBgI6DswkpAARVY6q3PgShqccFZNJM5ApnklX/K1w9WKuKYYxUPCu4UdAKLS2A2L
	WxyQVQPmcZH9V97EzFYlLaRQCuQvF2o22G36cmssVY1Fo9nMAEulsjpK8MQ9CVFE/CNTNAMv6BZfY
	quax6UEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRTOO-00000009PMF-3XAe;
	Fri, 05 Dec 2025 10:50:28 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRTOM-00000009PLj-0iAW;
	Fri, 05 Dec 2025 10:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764931826; x=1796467826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MQ7Fqj4UUvktQ5BTeTaY30CoU5H4xWYgdxzNUoMv4yI=;
  b=eghGy6ZR5Z9hGsJ8/mRF44SX0Ms9tLiUr7d+9t2gyM2vvgmx3CT4ZN/t
   31zIlN1rTqb9a1+ElKFUnF/t25z+VszZzL6Qd0ZNCmx8C30nb1V4ZANaU
   gP3a7q7Oo7u2hzJiYEjc9hmPtnkQY/Zxki863rH3S4qIYCvr35cgMZkC7
   Ovc/qlzP7QtW2bmbMYWgULOGpGLK8Fp1o9Dy7rjvhpaPs7K5txGBpmuUA
   czAj7Es6b7ioQdrne+hFnA7KYQonjy05qixvtIor9dP4VxelTnXJ0EyDi
   zYwMiGzh7/Mb8uye3ucJ1FJteItBKPxQY/97qdXjEz0/2uBLOoTi4xbS5
   Q==;
X-CSE-ConnectionGUID: HCCFQyQDSgOkHKXektN4Ig==
X-CSE-MsgGUID: EiHFOX4eQyGLYd5ka1BpDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66155522"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="66155522"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 02:50:24 -0800
X-CSE-ConnectionGUID: BZQBeMhuT9mzC1dYoeMo6g==
X-CSE-MsgGUID: HOtjpdEDROWYFpjmc15VMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="218626523"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.220.222])
  by fmviesa002.fm.intel.com with SMTP; 05 Dec 2025 02:50:13 -0800
Received: by kuha (sSMTP sendmail emulation); Fri, 05 Dec 2025 12:50:04 +0200
Date: Fri, 5 Dec 2025 12:50:04 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [RESEND PATCH v11 03/11] drm/bridge: Implement generic USB
 Type-C DP HPD bridge
Message-ID: <aTK4n8WnQm_FvpW3@kuha>
References: <20251204063109.104-1-kernel@airkyi.com>
 <20251204063109.104-4-kernel@airkyi.com>
 <aTGPaJmwd7uHfrnV@kuha>
 <84f06c0f-3ec7-4a43-bba2-1979c3a07127@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84f06c0f-3ec7-4a43-bba2-1979c3a07127@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_025026_291700_BF2534BE 
X-CRM114-Status: GOOD (  21.26  )
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

Fri, Dec 05, 2025 at 10:26:20AM +0800, Chaoyi Chen kirjoitti:
> Hi Heikki,
> 
> On 12/4/2025 9:40 PM, Heikki Krogerus wrote:
> > Hi,
> > 
> > I don't know what's going on here - this series is the 12th?
> > In any case, you need to fix this..
> > 
> 
> It is 11th. Patch 1 was missing the Signed-off-by line, so I've resent
> it. Sorry for the confusion.

That's a change too, i.e. this is v12.

> >> diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> >> new file mode 100644
> >> index 000000000000..94be3d5f69e9
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> >> @@ -0,0 +1,51 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +#include <linux/of.h>
> >> +#include <linux/usb/typec_altmode.h>
> >> +#include <linux/usb/typec_dp.h>
> >> +
> >> +#include <drm/bridge/aux-bridge.h>
> >> +
> >> +static int drm_typec_bus_event(struct notifier_block *nb,
> >> +			       unsigned long action, void *data)
> >> +{
> >> +	struct device *dev = (struct device *)data;
> >> +	struct typec_altmode *alt = to_typec_altmode(dev);
> >> +
> >> +	if (action != BUS_NOTIFY_ADD_DEVICE)
> >> +		goto done;
> >> +
> >> +	if (is_typec_partner_altmode(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
> >> +		goto done;
> > 
> > That's still not enough because of the plug altmodes. You need to
> > check that it's a port altmode:
> > 
> >         if (is_typec_port_altmode(&alt->dev) && alt->svid == USB_TYPEC_DP_SID)
> >         	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> >         				   to_of_node(alt->dev.parent->fwnode));
> >
> 
> Oh, it is. Will fix in v12. Thank you.

v13. Don't forget to update changelog.

thanks,

-- 
heikki

