Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3D2CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iZ59pdw95DE9UfE99+qN32g/0qbOgenF+jNVKzCngo=; b=wGO5coktFlQv7F6Ma6d055sRhE
	bngTvOQ0/Hc+fvtD/CSmknflTQPtPRz7/UI47rlMtk4FFsUfQ9M/5T8KTVpPPQU/jT5m2u5llPDpC
	6iBiXHwb96Tr3Uga2LtXflYRmASTlVZEj+4Z4SE4XfN0/3etcKI5nGKT4cOYhEwp5emaTRgBohxm1
	s1m23Sq5S53xomVlgmGW7iO+aa5eHXpsOEbYvQVBH4QW9zG5MswQ2HGM2xy1QNgATWhT+Pod4LCRD
	EJtyD+gWNOCu6WyuA06lP9iOoFPqku+AbhVZLjN550Ksk7WvlKbd7ZwUQdKVhp70ts/XoJxZeM72G
	kU9YzsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCD6t-00000008fc3-0glv;
	Fri, 24 Oct 2025 08:25:19 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCD6q-00000008fbc-1wbn;
	Fri, 24 Oct 2025 08:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761294317; x=1792830317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Su77VAXqOYKI/uPo+vnRq2iX0IBZ8Qp0155copD2Rp0=;
  b=TbX5OGkapoyLFrWpaSD5BOwfhK7Ysq0PW0alQcx6E/VpsurS0fFAud3D
   TP2Jrijkt/5f8q/d1xKkrqJS0hodbJuwY/ep8EpFOqvobzuTUxRSrq8mp
   v7lGPJOkC7DypgEcNkue8bbc3NlYZ+M8iVPI/Hv/aKXnct4b0re3XFLnh
   ZboqGo/wS3MeWy8N8Bt1eUM89RP+yk1hRaFT+uKn/E6TxlSoQPa6udqS9
   avE/NDJrsCISJqKq4wLV5+RBpl7XgoFxGRfdryRPm/sSBa01eQX1AzFd6
   PBVRxLKF1imR47lrDTZjP+UL030jyyiVclD67dZaPE6dt1rvwsRzkgcW7
   Q==;
X-CSE-ConnectionGUID: diAIMz0QRq6qseMKjBbFYg==
X-CSE-MsgGUID: aBmChiODRUeTJiE/3QGodQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86104083"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="86104083"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 01:25:16 -0700
X-CSE-ConnectionGUID: zSEWs0AsRK2pZW8DgxM5Gg==
X-CSE-MsgGUID: 7AQ1HnpnQ3CYhcbzXYq0kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="188669001"
Received: from mjruhl-desk.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.221.255])
  by orviesa004.jf.intel.com with SMTP; 24 Oct 2025 01:25:05 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 24 Oct 2025 11:25:04 +0300
Date: Fri, 24 Oct 2025 11:25:04 +0300
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
Message-ID: <aPs34Co-8UoQWuim@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-3-kernel@airkyi.com>
 <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
 <14b8ac71-489b-4192-92d6-5f228ff3881d@rock-chips.com>
 <aPoZhBdc1M6Qgfae@kuha.fi.intel.com>
 <6f769567-b383-4c79-b441-3dd84f21cdae@rock-chips.com>
 <aPsse5qVL84XOj8w@kuha.fi.intel.com>
 <9ec2189e-ec36-4cd8-9713-beb490b8297c@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ec2189e-ec36-4cd8-9713-beb490b8297c@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_012516_573790_8ABD04A5 
X-CRM114-Status: GOOD (  14.01  )
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

On Fri, Oct 24, 2025 at 04:12:47PM +0800, Chaoyi Chen wrote:
> On 10/24/2025 3:36 PM, Heikki Krogerus wrote:
> 
> > > Another thing is that CONFIG_DRM_AUX_HPD_BRIDGE originally needed to be
> > > selected by other modules. With this change, we also need to expose it in
> > > Kconfig.
> > Sorry, I don't understand the problem here? What do you need to expose
> > in Kconfig?
> 
> config DRM_AUX_HPD_BRIDGE
>     tristate
>     depends on DRM_BRIDGE && OF
>     select AUXILIARY_BUS
>     help
>       Simple bridge that terminates the bridge chain and provides HPD
>       support.
> 
> The tristate here is empty, so now it can only be selected by some TypeC
> controller drivers. I think it's not a big deal, just expose this item.

Ah, got it.

thanks,

-- 
heikki

