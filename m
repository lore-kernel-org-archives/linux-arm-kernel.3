Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FACACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rb+sgTMl2ZZ7FXd2heywOG2siUqVG2HfDneZNJQgOn4=; b=ilkT+idmVuQAPcr9Jxtd3RHy1n
	k+/1SkvS0zOvndfdORLZfcBQ3BVzYiqsr1ZkEr8THPOARbI207Wc3ePBveOTHg3Sys3ZjQcnOlvq7
	h+s7+6YD5bhAEdsKKX+Je+Lct9GLiHnAzH0f98u910UhKqci8wBtKTlPSyhZREEVXRrAIcKp/3FnB
	P8VXTdzzNOql42Z2PjdPzuNYQsUkStmlC8mHmwiNBi2tDph6ISMqa0Kfi6LDo3dXxb9yKhDCMawAW
	3g6WLaH4jCDCP8+y0RIJrzHk/BS/RZsEBZEtpv4wN4Sk6c/uNN5A8ENgX296A5xIING56Y5bpu1Ea
	js+OFBwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCSp-00000008YLL-21iX;
	Fri, 24 Oct 2025 07:43:55 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCSn-00000008YKc-0F4W;
	Fri, 24 Oct 2025 07:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761291833; x=1792827833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7zI+yHusBy8iTPtjWgljU0yIp25yZuoATyi6HBS0Rz0=;
  b=PwZYx6WAWv2V5Ky8UJl6ZGJlBkjEYMMzfJAI6F1cuBBzvNxY/uMBsYYE
   lSFcyKtKQ9tbzDc07HZ+lvi0eDLv3+znzBCFEublDoKoI64VaMxGDoIFX
   zWJz+wJE/QCmyC5YlL3QX1nciCvSgStiBqw5Pt4DjwyRn7OlGbA9YQFnJ
   L9DIwpC0VKEbZqmWQuFHVgWeqVMFXsePTXenqtIby3yZ6LqHzYwQfhThn
   UuCs6gBlNcVEhYW4UdVpMYrYdAQ3Fy/E/9C+Tc8TGAJnI6PXvBxPeAc67
   Y+fhOXGwuBxjDbGqjCvIFa7JzdfG4xoqOIsOxhurpP9QWAVIxckdhtvaf
   g==;
X-CSE-ConnectionGUID: bfcgVjO5Tvie/G8VNPj6Hg==
X-CSE-MsgGUID: 8xSoo/C7Q6COyen5fqM5jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63376645"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="63376645"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:43:52 -0700
X-CSE-ConnectionGUID: u3ao3ZWfTCKvdTwCgNOZbQ==
X-CSE-MsgGUID: i6w9uVJtSDy1AqasQ83mFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="188756837"
Received: from mjruhl-desk.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.221.255])
  by fmviesa005.fm.intel.com with SMTP; 24 Oct 2025 00:43:42 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 24 Oct 2025 10:43:41 +0300
Date: Fri, 24 Oct 2025 10:43:41 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v7 1/9] usb: typec: Add notifier functions
Message-ID: <aPsuLREPS_FEV3DS@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com>
 <aPni4AeDaem_rfZH@kuha.fi.intel.com>
 <aPnvoSRJefwDlpNO@kuha.fi.intel.com>
 <aPn4-S7upPOOtenr@kuha.fi.intel.com>
 <3a24bd7f-c247-4541-8cf5-c1e66e2af5a0@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a24bd7f-c247-4541-8cf5-c1e66e2af5a0@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_004353_125943_0052E8BA 
X-CRM114-Status: GOOD (  13.30  )
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

> I noticed the following statement in typec_register_altmode():
> 
> ```
> 
>     /* The partners are bind to drivers */
>     if (is_typec_partner(parent))
>         alt->adev.dev.bus = &typec_bus;
> 
> ```
> 
> If the condition is not met, the bus will not be set, which means bus_notify()
> won't be able to take effect. Did I miss something?

Right, that would be the condition that I was talking about. Only
partner altmodes are used in the bus.

Hold on! Do you need the port altmode instead of the partner altmode?
If that's the case, then we can't use the bus notifier. So we'll need
the separate notifier chain after all.

Let me take a closer look at patch 2/9. Sorry about the hassle.

-- 
heikki

