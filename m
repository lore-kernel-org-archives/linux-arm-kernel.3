Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B0DCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nr4rS2fAjknlAFAh/CTKTEYGfrsIHKWJOlOaV018KsY=; b=GVdY3daDDf/Ll/ayQ+QAtdiCkd
	zQ/rTpVXRhd7ry+LvHLR9urT8cLhTSGCTqzqe22SjMceiHWkfKjuCNYg8FUDT+cBzkvALs+hyRyEw
	eKeWx5OTc7kkACLajdvsjpIQ5CX/4VUuo8xx+otgjeHSO1Q4VHawxBn5ywiY0P4SNLoODPCkuf+dJ
	JG/u7DZHnTCGn/z5Cv3p6hp9XvjheEKYmcrhNcj3AASdxloBTrPI7FHihM7uPNibT7tWcaau/lJyQ
	rYQZ68wHm8g4snOwtAoMqiCW/UN/58NOydJtZoD49GzrA1sotxGwYekL8Wi+ozbgvIjgWZts676Yp
	skYq9A5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpMG-00000006AOx-1Hwt;
	Fri, 31 Oct 2025 13:40:00 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpMC-00000006AOO-3olY;
	Fri, 31 Oct 2025 13:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761917997; x=1793453997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2cVyjKey4dFxUiUnROSgPcOL0J7KqoBoYiJcjCFDf/g=;
  b=c6Ob6ym9n9gA/m1b3ZXr0SXhcqvC7gnyPvmfAGVzWXQfwsn6V1LB2/4H
   IL4i1rz7p6w+gDykz9d+RMbTv1g6l23IjyskjzM+oIugPZ1Xt8x3ENaZ5
   weAxNJwr5wS/4Lse/CA4dylqWAM84RgjLtRrFcqBCoN8VxsnLPfHgReja
   lDOu8tO5a4hG9UHzXW9Srzo9Wyx1/l2ijjZfgxUKThNQgW5jRWfXIIR3b
   IONUOolxBHZ6sD6k62Wl9lB1Xu0by/lQbx6IadSoh1ynGNuReivwgbMLK
   XlKjmD9S4OV+lx5bsGYWrJ0FQEmxsb6XvMZjNbGbptD5btUPueup/Cqsg
   Q==;
X-CSE-ConnectionGUID: Er/r1P2PTG2L6Br1erwu+w==
X-CSE-MsgGUID: 2a7yo+WFSv+mtfzGCQqXJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="51650228"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="51650228"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 06:39:56 -0700
X-CSE-ConnectionGUID: a3xtnYTPQP+uCyKoQ92d0Q==
X-CSE-MsgGUID: C/6GFGJvSTi0FjPfK6/uAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186115249"
Received: from jjgreens-desk20.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.220.81])
  by fmviesa006.fm.intel.com with SMTP; 31 Oct 2025 06:39:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 31 Oct 2025 15:39:45 +0200
Date: Fri, 31 Oct 2025 15:39:45 +0200
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
Subject: Re: [PATCH v8 01/10] usb: typec: Add notifier functions
Message-ID: <aQS8IatWiAUzBUxd@kuha.fi.intel.com>
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029071435.88-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_063956_965926_66358F01 
X-CRM114-Status: GOOD (  12.61  )
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
> index 000000000000..f3a7b5f5b05b
> --- /dev/null
> +++ b/include/linux/usb/typec_notify.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __USB_TYPEC_NOTIFY
> +#define __USB_TYPEC_NOTIFY
> +
> +#include <linux/notifier.h>

Replace that include with a forward declaration:

struct notifier_block;

> +enum usb_typec_event {
> +	TYPEC_ALTMODE_REGISTERED,
> +	TYPEC_ALTMODE_UNREGISTERED,
> +};
> +
> +int typec_altmode_register_notify(struct notifier_block *nb);
> +int typec_altmode_unregister_notify(struct notifier_block *nb);
> +
> +#endif /* __USB_TYPEC_NOTIFY */

I don't see any need for a separate header file for this. Intoduce
those in typec_altmode.h.

thanks,

-- 
heikki

