Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98DCCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjX84FlJTTBQtWdQ8pCfYrZfYBz66C6I1Vwctt0TxSQ=; b=I9X0+YR1eiCLllZ2C/9I/R/uLo
	PueS1OtFAxOL9bLQyqw33Z73QqlzDet+jcXU7GNIfBNvUvHeErZwHY4bZ7+hTUSRRwfm6rSNgmFFj
	Cq1z1glLCOroUsajGoTjGUzOub5LNr/jJ25fnw+cR/tzsUVnE+7eNOOXQUZSEKqj2ZcweXIBn8G58
	du+sWOwQcdBGMPqShfro09WSZyYjfzJdv6wYuPYXFyfMCTuJZunXkUt6lyFtezHN6jFfKxYAlqDmq
	QOYFdDcLAh7Dxm9xoAQOErRFXNn10qflj1FqaL0SZUEZ4Hsu3HaGESU8cZoMJ3Oj9ATTc99WfBrKV
	WH5IvxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCyO-00000008elS-0ZJa;
	Fri, 24 Oct 2025 08:16:32 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCyL-00000008ek5-1fjz;
	Fri, 24 Oct 2025 08:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761293789; x=1792829789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y6hIryfME2/PZmCw4H4nq4PMUJueVx80pY8OjCr1KyY=;
  b=g4iS8vy6q5JvMmzMps77tHvI90cEA4UYPIvl0SdkIAmyc/4CGdjeAts6
   mqc+I5nZ5dAAjCFANskfCZv/Aomj7+74nngllAugfs5M8uS84buN/0q2k
   0RwJerjflp9EnA025DOiAs6P+DXQKnpssePSUD+rLJVBkVqJ7JkWSHTcD
   R5Ux0FacINPl80akVR3pte8gyI+KkTb6HPQEyDFRLC0WWJaOqk0x6bq25
   T/w0Pc6PIX7QcC+ZS4MH4v6v5lmDVrKqWbdcIDwAN3dcQQcAJkzdQDrEc
   P2NcvujPA8r9NWSXtEZtvc97KGwRdJxNVjcZjm9c5V5mLbH2On9yKWjFX
   w==;
X-CSE-ConnectionGUID: Mwh9IKP8QBSLboapypycug==
X-CSE-MsgGUID: uEmi6GoYRTu9IDZCiobvgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74145052"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="74145052"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 01:16:28 -0700
X-CSE-ConnectionGUID: Chd3dXKyQl6vo1nUEb8nyA==
X-CSE-MsgGUID: CnAOpA8XQ3utXO3rexXLig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="215297555"
Received: from mjruhl-desk.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.221.255])
  by fmviesa001.fm.intel.com with SMTP; 24 Oct 2025 01:16:17 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 24 Oct 2025 11:16:16 +0300
Date: Fri, 24 Oct 2025 11:16:16 +0300
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
Message-ID: <aPs10Ay_cQ5TZ7nb@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023033009.90-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_011629_446207_4E2EB6A1 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
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

> +#include <linux/notifier.h>
> +#include <linux/usb/typec_notify.h>
> +
> +static BLOCKING_NOTIFIER_HEAD(typec_notifier_list);
> +
> +int typec_register_notify(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&typec_notifier_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(typec_register_notify);
> +
> +int typec_unregister_notify(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&typec_notifier_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(typec_unregister_notify);

Better name these more clearly:

typec_altmode_register_notify()
typec_altmode_unregister_notify()

thanks,

-- 
heikki

