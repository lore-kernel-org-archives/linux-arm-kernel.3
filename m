Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF981CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 12:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WbVAR04+x7nYj1BFoL7bhHaK6uibbNFkPNPwBbDH4E=; b=Ov0BPiKRAmRpOVJY+UIiozDs/q
	rhoXZ1rgAGoTQm4Q66JVmfs6XwGkHzF7uNIg48b8PW7/bUEbGLQP1ZyXI2xNSF2aFTkdTPgMX1QFl
	E+GIl7tOe8WPLMd2AU5Qso3Q11dtn8tZJ3fHpioqEvjg9Uj7YEELq6tZJjYSez5OuyRvFt45yj6YJ
	7kADkbfNG5BlUKZlXGmksSyxb9MXOAFnUbtwjCt6K5/J2X4CxqeLx4GTxtnWGxg5OEc5boREpgvwH
	kkiEP1b7hh5XpR12gCZjmxNfVawcuNqEtL8DbdCm0XdQ+RHcJZP2I9HAGcU6aN3jVrYApDwmTPM7k
	7LAp+u8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBu2U-00000006Aii-2TZy;
	Thu, 23 Oct 2025 12:03:30 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBu2S-00000006Ahc-3Bbt;
	Thu, 23 Oct 2025 12:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761221009; x=1792757009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=erXucVQ3CkO8W6iJDjYjGvHlpSCK37tkrL/+XPfgexM=;
  b=eTKpM4SeCbfURLv1TfLgdcYkMZVl2apKXHJTW0JrQv4uSBW99K7UeOkv
   0H6XrwUIvvFL08btDhFURtJ8P0qIB57MJG6suiXdXvmw6VBSo+sDXuozh
   k6yA7vPgwmS+Mob+UCNxvXeFkvI6rPThPS4numDSLUyfKjS068KhPstXQ
   jzIAEkNuz300SuHaIGQmgBR+LNEYVzM1N7Dp9H0B7ClBTMfPnUfX6Cni0
   De8Be8v9aAa1j9A9iAuMiyQzwCnOAhtGSuia1+BCQtkfu6c5xWfoAZo/Y
   sadAGzS7GJEy75ECPLmvN0cPqYp0Ip6sqRVSlTZ4W7umDQCz7HaIRxg4E
   Q==;
X-CSE-ConnectionGUID: 04VgCj5KQg23VpV/Hxe/iQ==
X-CSE-MsgGUID: PgCqLhVtQJyCIT0LpLLIgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81013295"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="81013295"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:03:28 -0700
X-CSE-ConnectionGUID: 7DIzW9o6S2WE7ZvtBcvVQQ==
X-CSE-MsgGUID: uCa4JL9CTiShx2sG80Yh6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="184033253"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.221.165])
  by orviesa007.jf.intel.com with SMTP; 23 Oct 2025 05:03:17 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 23 Oct 2025 15:03:16 +0300
Date: Thu, 23 Oct 2025 15:03:16 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
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
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 2/9] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Message-ID: <aPoZhBdc1M6Qgfae@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-3-kernel@airkyi.com>
 <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
 <14b8ac71-489b-4192-92d6-5f228ff3881d@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14b8ac71-489b-4192-92d6-5f228ff3881d@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_050328_809015_621DEC95 
X-CRM114-Status: GOOD (  21.37  )
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

> > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > > index 245e8a27e3fc..e91736829167 100644
> > > --- a/drivers/gpu/drm/bridge/Makefile
> > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > @@ -1,6 +1,7 @@
> > >   # SPDX-License-Identifier: GPL-2.0
> > >   obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
> > >   obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
> > > +obj-$(CONFIG_DRM_AUX_TYPEC_DP_HPD_BRIDGE) += aux-hpd-typec-dp-bridge.o
> > Instead, why not just make that a part of aux-hpd-bridge
> > conditionally:
> > 
> > ifneq ($(CONFIG_TYPEC),)
> >          aux-hpd-bridge-y        += aux-hpd-typec-dp-bridge.o
> > endif
> 
> Oh, I did consider that! But I noticed that aux-hpd-bridge.c contains the
> following statement module_auxiliary_driver(drm_aux_hpd_bridge_drv), which
> already includes a module_init. In the newly added file, in order to call the
> register function, another module_init was also added. If the two files are
> each made into a module separately, would there be a problem?

You would not call module_init() from the new file. Instead you would
call drm_aux_hpd_typec_dp_bridge_init() and what ever directly from
aux-hpd-bridge.c:

diff --git a/drivers/gpu/drm/bridge/aux-bridge.h b/drivers/gpu/drm/bridge/aux-bridge.h
new file mode 100644
index 000000000000..ae689a7778fa
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef AUX_HPD_BRIDGE_H
+#define AUX_HPD_BRIDGE_H
+
+#if IS_ENABLED(CONFIG_TYPEC)
+int drm_aux_hpd_typec_dp_bridge_init(void);
+void drm_aux_hpd_typec_dp_bridge_exit(void);
+#else
+static inline int drm_aux_hpd_typec_dp_bridge_init(void) { return 0; }
+static inline void drm_aux_hpd_typec_dp_bridge_exit(void) { }
+#endif /* IS_ENABLED(CONFIG_TYPEC) */
+
+#endif /* AUX_HPD_BRIDGE_H */
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 2e9c702c7087..3578df1df78a 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -12,6 +12,8 @@
 #include <drm/drm_bridge.h>
 #include <drm/bridge/aux-bridge.h>
 
+#include "aux-hpd-bridge.h"
+
 static DEFINE_IDA(drm_aux_hpd_bridge_ida);
 
 struct drm_aux_hpd_bridge_data {
@@ -190,9 +192,16 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
 
        auxiliary_set_drvdata(auxdev, data);
 
+       drm_aux_hpd_typec_dp_bridge_init();
+
        return devm_drm_bridge_add(data->dev, &data->bridge);
 }
 
+static void drm_aux_hpd_bridge_remove(struct auxiliary_device *auxdev)
+{
+       drm_aux_hpd_typec_dp_bridge_exit();
+}
+
 static const struct auxiliary_device_id drm_aux_hpd_bridge_table[] = {
        { .name = KBUILD_MODNAME ".dp_hpd_bridge", .driver_data = DRM_MODE_CONNECTOR_DisplayPort, },
        {},
@@ -203,6 +212,7 @@ static struct auxiliary_driver drm_aux_hpd_bridge_drv = {
        .name = "aux_hpd_bridge",
        .id_table = drm_aux_hpd_bridge_table,
        .probe = drm_aux_hpd_bridge_probe,
+       .remove = drm_aux_hpd_bridge_remove,
 };
 module_auxiliary_driver(drm_aux_hpd_bridge_drv);


-- 
heikki

