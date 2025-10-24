Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A5ACCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5A3K2xC++lir0jfxBDdrwd/flAknU8ZqYokd1xAmC7w=; b=gWzoQ/Qxg+H4jopzYRHUeZPT6k
	mZa+QYV4j1SBoUYri479e5sxb9Vmds5DgMHz4C4oxICED2LlgQsXo1bJA82xa+WSR2xngU3cBk0js
	vDm7ov1C6vGM/+zkN1cQMjCh7LGCIhcWeTtvOUphS02uon/w2djtUlv5Ctsltie5rHBzjYXvk4me3
	JMmVh+CbHSv16INSf5izs+rTc0yEBnqSfE0msu0hsmd5EvjFQWQsyGvmP9dQR3ozEproo+exOIzob
	RSkS04RN8Zrvr/lLxf4F0wlllyJ5tZp+QI3LjaL4COWEq2C53JCpHe7bIIA5Exw7nORyomQfKyYmt
	6HIX9Ujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCqQ-00000008cwj-2FjV;
	Fri, 24 Oct 2025 08:08:18 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCqO-00000008cvi-0jKx;
	Fri, 24 Oct 2025 08:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761293296; x=1792829296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iVIHEI/6GYiyKQtjDs+G9MH3NzfvOwU3yM+TuMzlGF8=;
  b=iEAwYakOSOD8gOL+ax8AME35ICY8UENzW2xdSqXQS+eHR3l3KKJ6m7Z6
   cOVYwzQt2B8ushtBbAc6F3bZ1JZyBiuQnbnkJ+PEZGucBck1bebUIuzd0
   8eKeW1i4vDkV2GUu0NAdd7U1hpHdD67ur3V4DvYdhTijzZX7rOTIFpdww
   ewQASw2xMrknZDGutghWeefIjHqpCn+6vYt8dHTJr3XzVJ4TPXzCoqyn6
   aFL62QG6Ad8jblTXigKSWHh+VXsRtLTmaj9W6PmGy5TKmjrVwQ5lWHe7j
   7zXwQ6cMvClsdO10vUPe6qpqEd9VHejaBLTmY16xCVdwXOYoqRT3fcVFZ
   g==;
X-CSE-ConnectionGUID: twTgrbeiSIqcggA1rZYAIQ==
X-CSE-MsgGUID: /NiIfzYIS/2ydY3pXdigfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86102765"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="86102765"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 01:08:14 -0700
X-CSE-ConnectionGUID: ShAhcC5rRm+Zk2meUFiqQQ==
X-CSE-MsgGUID: Y+ylwr1ITe6V3fw6sAb20w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="221572594"
Received: from mjruhl-desk.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.221.255])
  by orviesa001.jf.intel.com with SMTP; 24 Oct 2025 01:07:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 24 Oct 2025 11:07:56 +0300
Date: Fri, 24 Oct 2025 11:07:56 +0300
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
Message-ID: <aPsz3PvZPgXdvM4E@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com>
 <aPni4AeDaem_rfZH@kuha.fi.intel.com>
 <aPnvoSRJefwDlpNO@kuha.fi.intel.com>
 <aPn4-S7upPOOtenr@kuha.fi.intel.com>
 <3a24bd7f-c247-4541-8cf5-c1e66e2af5a0@rock-chips.com>
 <aPsuLREPS_FEV3DS@kuha.fi.intel.com>
 <4fddba9a-b073-4bca-bd13-64a415f4bc47@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fddba9a-b073-4bca-bd13-64a415f4bc47@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_010816_246267_054309CD 
X-CRM114-Status: GOOD (  20.20  )
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

On Fri, Oct 24, 2025 at 03:59:50PM +0800, Chaoyi Chen wrote:
> Hi Heikki,
> 
> On 10/24/2025 3:43 PM, Heikki Krogerus wrote:
> > > I noticed the following statement in typec_register_altmode():
> > > 
> > > ```
> > > 
> > >      /* The partners are bind to drivers */
> > >      if (is_typec_partner(parent))
> > >          alt->adev.dev.bus = &typec_bus;
> > > 
> > > ```
> > > 
> > > If the condition is not met, the bus will not be set, which means bus_notify()
> > > won't be able to take effect. Did I miss something?
> > Right, that would be the condition that I was talking about. Only
> > partner altmodes are used in the bus.
> > 
> > Hold on! Do you need the port altmode instead of the partner altmode?
> > If that's the case, then we can't use the bus notifier. So we'll need
> > the separate notifier chain after all.
> 
> Yes, we need port altmode.  The partner altmode device appears too late for
> DRM device, as it only shows up after the corresponding DP device is inserted.

Got it. So just move the declaration of the typec_notify_event() to
drivers/usb/typec/bus.h and this patch is OK by me.

Sorry again about the misunderstanding.

thanks,

-- 
heikki

