Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B4FCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gi/0ij+86Or55EPvPjl6RW5KTuXufY+SLyKQ2qCAmu4=; b=J8qOnX9mPr0EvKC/7MzHQGH0lX
	WJvayBDheZH6B+yYgo3JIjJOh/TdU89YuHfUC/NXyRDNZK5Qb7ldofA4/Dh18t8Co4myJYGIglV6K
	+usvlYcqpAk0KpiFsrcSgG34TVPIcKVClf/JmiG266R06yuZWAP2I7RL160lQimxkNrCKyFZDa/dN
	VC9CSGvTwVudOWCspIgUKz9TUi/bbnrIhkupEh/SodR6w48JyAmBFENSoVtzbDeS3rRiHNGhBEcAC
	qxAQIPtRbZqlXiSuA8lhkf4LtTr5bHwgxZ88VO7dcDb0wrLUV6aWpvVL5u5FObDXxmyYraTis+MBV
	hNAewWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrFY-00000005d8J-2N22;
	Thu, 23 Oct 2025 09:04:48 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrFV-00000005d6u-3nmN;
	Thu, 23 Oct 2025 09:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761210286; x=1792746286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q0bSQQY5SwYrEmcp4I13QmQfjO3pwF0ctbdE1M1LmXE=;
  b=eWwvmgK5LU2/rg0D3yog5uukWCuErWeTiR/5cYVPv5niB35kAvek1QT+
   F8wl1JlfudxA30eOiE5MqaoEeHLzZuV0waut3q5wtGlN81F9ctf3cH6eh
   gTwtjZ1m89VrSAL+mcWTBQDZbiWcrNdRGt1XIt9ivkaPKNHeqXRiQqrb1
   Hk291tCs3dG5RpggRmoP4+hbm3SIok/MrXGUx/uFSBbTrt6QgxpesqgSg
   SLvFHyC9dOAYg7N842yIRF6sJ1hICS3C8ZRuS0RYNRitP2o7twlBS3CwM
   oGNRE/VBx4yilQ37Z/ilwR+NkUKgWwzv5bsgjdGRjiDSK0u3smIGN55Zz
   g==;
X-CSE-ConnectionGUID: Lst5eaY0TMu2XjGL0xmtkg==
X-CSE-MsgGUID: EDZe9RWXQ0+Bu36Wuf9poQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65990036"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="65990036"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 02:04:45 -0700
X-CSE-ConnectionGUID: XCuwvFI+SqK9YXh418DnrA==
X-CSE-MsgGUID: +Dw2Sy/hQ4+K8k1hORJSyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183709423"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.221.165])
  by orviesa009.jf.intel.com with SMTP; 23 Oct 2025 02:04:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 23 Oct 2025 12:04:33 +0300
Date: Thu, 23 Oct 2025 12:04:33 +0300
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
Message-ID: <aPnvoSRJefwDlpNO@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com>
 <aPni4AeDaem_rfZH@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPni4AeDaem_rfZH@kuha.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_020445_975908_BD87A534 
X-CRM114-Status: GOOD (  14.84  )
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

On Thu, Oct 23, 2025 at 11:10:20AM +0300, Heikki Krogerus wrote:
> Hi,
> 
> > diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
> > new file mode 100644
> > index 000000000000..a3f1f3b3ae47
> > --- /dev/null
> > +++ b/include/linux/usb/typec_notify.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef __USB_TYPEC_NOTIFY
> > +#define __USB_TYPEC_NOTIFY
> > +
> > +#include <linux/notifier.h>
> > +
> > +enum usb_typec_event {
> > +	TYPEC_ALTMODE_REGISTERED
> > +};
> 
> Don't you need to know when the altmode is removed?

I noticed that you don't because drm_dp_hpd_bridge_register() is
always resource managed. But I think you could still send an event
also when the altmode is removed already now. That way it does not
need to be separately added if and when it is needed.

thanks,

-- 
heikki

