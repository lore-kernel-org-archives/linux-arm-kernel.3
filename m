Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5473ECCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TJVAseyyZ6NndqNaQX5Qm1vTha8TkmUTNdt0+3926U=; b=0WYKaqqsxkGbjKZ6G6NgHM8uK5
	dgM1p+CE/hwYbf0C8Hk/LsIS1rhFrMsdCSxa47lmT8qIg+gwuGcBxO5SBw6ILj3mu628SeClybHlK
	gaG/6EgzB4/aBeafpVNe2sst0Qa1NvHrNv0pHyJYmErmRaAMG10fXrgGDAPKUh2KaQ5CuEQTzf1i2
	9GrCnzOltacxHfbGWVeMYAtPW+xtx1tD0jRp3ftoW3IyIBeV3gpbItlsQ9CXNtc5os9iEEZPYTUrJ
	/7HqpnpHEMDMaCmfyPJCRVUyE1pPQGW4qwCWr+DvshS87/hkjCQa+9wy21WAjZbmZLK9cIT3v4Q41
	FKYvcBTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqPj-00000005UAc-2bS1;
	Thu, 23 Oct 2025 08:11:15 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqPV-00000005U5E-21oc;
	Thu, 23 Oct 2025 08:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761207062; x=1792743062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X9A+e5HX8/DxioXkaxwvZdY29MB1MDYbmVYOX4ols5k=;
  b=bjROa49mGgRUUM0p1GdTNUjPW3HtEPMv1M23t5/RAeB4sYgBcpmaO7gm
   A4h6RrD6+dFCWlDnY5m3RJj0AIRvX2RPXwm6LUsdwuUVzuySpQ9Kig5be
   +P7V3mzZW5F/+s2/UU2iCUmGBoUfVPx9/3w4p1WPitf6faFJ3o6jGqyGe
   tBciPz7NYjQV52yWeixqBN7lOWefYEsObCm6y2zMJk2xKg6dF/m9QHMRD
   4DQ071cqcHV50NXEERc/e+ZycyWP65MVSbSuEna9STWqELDVc3c5a6Eec
   xgGrWECf8ltjsA+jt+K6FaLNQRBOG2DNReet5mh5UYzDyZUNJlD1ygxys
   Q==;
X-CSE-ConnectionGUID: TQABKgwDQOu1SnDePqoU9g==
X-CSE-MsgGUID: WyM/x89tRuuB6f5KTVmCgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63518391"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63518391"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:10:21 -0700
X-CSE-ConnectionGUID: U/yJ+8RYQ+2huY61DLG6tw==
X-CSE-MsgGUID: qjW+PJi/SHi+vFM/FDi4jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183988336"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.221.165])
  by orviesa007.jf.intel.com with SMTP; 23 Oct 2025 01:10:09 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 23 Oct 2025 11:10:08 +0300
Date: Thu, 23 Oct 2025 11:10:08 +0300
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
Message-ID: <aPni4AeDaem_rfZH@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023033009.90-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_011101_585280_E2348839 
X-CRM114-Status: GOOD (  11.54  )
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

> diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
> new file mode 100644
> index 000000000000..a3f1f3b3ae47
> --- /dev/null
> +++ b/include/linux/usb/typec_notify.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __USB_TYPEC_NOTIFY
> +#define __USB_TYPEC_NOTIFY
> +
> +#include <linux/notifier.h>
> +
> +enum usb_typec_event {
> +	TYPEC_ALTMODE_REGISTERED
> +};

Don't you need to know when the altmode is removed?

> +
> +int typec_register_notify(struct notifier_block *nb);
> +int typec_unregister_notify(struct notifier_block *nb);
> +
> +void typec_notify_event(unsigned long event, void *data);

Declare typec_notify_event() in drivers/usb/typec/bus.h

thanks,

-- 
heikki

