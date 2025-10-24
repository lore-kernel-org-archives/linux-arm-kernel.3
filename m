Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D1DCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXDjvEGZWG6biG7TFJd4YmE/SKCNPzEfrPQhMbmgMzA=; b=F+BE1Kz6pZUivs4h6SxoVjFam9
	GBloiK9gkpLhBB96cRCAtKW2M+Iv6jg8p7P9XLCekLQJw8VBde+XtKOY7GBV1h2dP4XqTO+tj0kKZ
	7FOC3+hcjNSBn3Ifp1NIuXxEeqoPf0CstiShoZzbORnuT6wGolTsL3luYNC/KyZ3dC+Cn5w/3+1bj
	G8YiKVxeGqOldCKijbEz2qqrAMkmdP91nYVcNdbO78t5T7w3/T46BK/ngiMQgeFuptZ/iGP4n8WKW
	bYdWHpFZ7z07rw1w3PVr1Wqo8rsTKNB76nu5DYNdZ7ealyxsrijBWeHILSw3Qtp421YFv1CZoRP+7
	vhoGdvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCLs-00000008WgX-0WYs;
	Fri, 24 Oct 2025 07:36:44 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCLo-00000008Wg2-41fj;
	Fri, 24 Oct 2025 07:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761291401; x=1792827401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mWjj9l8sR4AQPWA6ugbC691Ckn2QjoC60AB1xOLd+C4=;
  b=X0/vM/FToYdCnOf+9Nc5k52rlsb7ahsbpYLFF5ODeC7WBgTZLwSHvLrz
   BsfJfrWvQeD2eIeOt0RVU3aEyHDuow9zNo79R7LG7Sjq22nHjtBeQeWjo
   kJyzdJKtZlv0WtIBlPIJbtEmGkze1jgy825PxkKSePBLxV6fiSa6Qg7D4
   bJ9RxaNCI1bqP31v4nm42aAuaJ0j+iXOqaeTaymmv/vTrcl+WnZEAVhcz
   ROMm5INYcQ1disbNppTnhcJwBaXsqo8GTDnvzDrkrAJCW8jOr8eDuLzBg
   CER074GrZDK98RAlWoYu7VX1xsHMRvXQBGaLgBqCer+M22Wasx8uWu6Oj
   A==;
X-CSE-ConnectionGUID: YD4f2Ou5SOqlKnCy9uakxA==
X-CSE-MsgGUID: 6dDVrxSpTa+wBdfE8zvx2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73759440"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="73759440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:36:41 -0700
X-CSE-ConnectionGUID: +9H14C/KT3KpDNAQIA8LpQ==
X-CSE-MsgGUID: DcV1UYgvS0+g8hqqTwa8Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="221566635"
Received: from mjruhl-desk.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.221.255])
  by orviesa001.jf.intel.com with SMTP; 24 Oct 2025 00:36:27 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 24 Oct 2025 10:36:27 +0300
Date: Fri, 24 Oct 2025 10:36:27 +0300
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
Message-ID: <aPsse5qVL84XOj8w@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-3-kernel@airkyi.com>
 <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
 <14b8ac71-489b-4192-92d6-5f228ff3881d@rock-chips.com>
 <aPoZhBdc1M6Qgfae@kuha.fi.intel.com>
 <6f769567-b383-4c79-b441-3dd84f21cdae@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f769567-b383-4c79-b441-3dd84f21cdae@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_003641_061630_C3904D6F 
X-CRM114-Status: UNSURE (   7.84  )
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

> Another thing is that CONFIG_DRM_AUX_HPD_BRIDGE originally needed to be
> selected by other modules. With this change, we also need to expose it in
> Kconfig.

Sorry, I don't understand the problem here? What do you need to expose
in Kconfig?

thanks,

-- 
heikki

