Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FD0C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1cFdVcf0xJjWsmm+67eZZUORoc/rmdGn43x4qO/mjE=; b=s7ffZFnP6eefma/EyrBBD11ypr
	5QDsDdd/Rdn9gFxtbmzF3/JsiBpDb1lnRxB8h3YArGvElSLuBTudjywVqpNffoBWtZWUw5p6NdiaC
	ZHkiCj+tbH8ZqXoSojeaEEgJDLvmH02Dl8T6GCtCTxzeFbN+9glH4V23xdztCMxUJExI65JAXq5f3
	sNrXvf4hTYJOp6dwEeX8cOtrXEz05pY8QLQ8Yn2uwh+QlYpVqnIvB/fYv7Wfa02Kv3EJGGimlVRXs
	790lseRLu7Q99gY9J9Fyjv8I/hENQAQZtTvYO+6lRtYywlJajvzHhU72G71Ub+jJQPIw+FmQ4D3Qg
	prLRzRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVD5-0000000GY7x-1WAP;
	Tue, 30 Jun 2026 09:56:55 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVD2-0000000GXdT-2ete;
	Tue, 30 Jun 2026 09:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782813413; x=1814349413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yFdNZwVFhbbRd/mn/WFs5v2ropeqaVxom/v/MdhKyJ0=;
  b=fLI7Ie3lD17HCHOTa+ajHwatRHqWWYF8EVzYrOj3c1XN9y1rksLlqtnK
   xlvTRORniLdlViG83qX2qCyF4xpjPtbO/94fpMOc8sSDqP441qW2Q4eex
   qvEL5RL+TSCr9tflsqnb8X9Ej3SWlcshn+DArTyHVJFvwwfUBvivSNRa0
   ajnBEgQg5ReiQKKjpoD9RpbrBw0GByi8cU3p5jphw2uF4OEA6GxMc2TRm
   ENs0nUONvkvE4cZDVQlj9G6il8C9811yRNS/9E5TpAsyFhVMecia4VjgA
   JZ5FwqPQI+3ASYS58hazuex6/aSESN6sySkDhKsM1BolNrRWDBDTg+t0j
   w==;
X-CSE-ConnectionGUID: JL4v8ztKQW6BgaUj82OioQ==
X-CSE-MsgGUID: tqHp+n/GS/GOTrNvIGGrog==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94121340"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="94121340"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:54:52 -0700
X-CSE-ConnectionGUID: 0hz0Ybo9T4ahdiG68gNfsA==
X-CSE-MsgGUID: wmd5dzvtSaeoUTNv7c+DrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="254135822"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jun 2026 02:54:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 6175195; Tue, 30 Jun 2026 11:54:43 +0200 (CEST)
Date: Tue, 30 Jun 2026 12:54:41 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Xu Yang <xu.yang_2@oss.nxp.com>, Chaoyi Chen <kernel@airkyi.com>,
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
	Peter Robinson <pbrobinson@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v15 1/9] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Message-ID: <akOSYXV7zRY4inSo@kuha>
References: <20260304094152.92-1-kernel@airkyi.com>
 <20260304094152.92-2-kernel@airkyi.com>
 <erx73m2ueuvbzjteadjli6aki5by4pr3hyertkkqqoqwhaa4v3@5cstmshcercx>
 <56c6abb8-c127-449f-9368-12f94620c2bc@rock-chips.com>
 <k53t2soc3nxhwugncatksektig6agxfgdkogkdwbhrhu2fn2g7@auvsfrv76wxy>
 <b2633b22-da30-4778-8e23-7b5bed9ead07@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2633b22-da30-4778-8e23-7b5bed9ead07@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_025652_681045_51FF5B52 
X-CRM114-Status: GOOD (  13.15  )
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

> @Heikki, what do you think of the following change?
> Should we add a new patch for this? Thanks.
> 
> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
> index 7867fa7c405d..f89cdf3c949b 100644
> --- a/drivers/usb/typec/altmodes/Kconfig
> +++ b/drivers/usb/typec/altmodes/Kconfig
> @@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
>  config TYPEC_DP_ALTMODE
>         tristate "DisplayPort Alternate Mode driver"
>         depends on DRM
> +       select DRM_AUX_HPD_BRIDGE 
>         help
>           DisplayPort USB Type-C Alternate Mode allows DisplayPort
>           displays and adapters to be attached to the USB Type-C

This look good to me. Please do add the patch for this.

thanks,

-- 
heikki

