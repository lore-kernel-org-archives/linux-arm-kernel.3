Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09145D10397
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YPrcYJ9CyxAaCJT86Sgc//TInOx9CnUp1Mw0Z90jiU=; b=CUAo69aqwt6CxU6Jdcs5+cT2+s
	uXexmfd6Ulk5dGX6UWSuphv135YVMk96sxi9x1aix11kAqUzur/2XDgrV4I31fwo/gvT7qIhqkZVj
	2yHf9alpWeFvSqfpzqk8b2WEyJxVjdMTcpLEYdsLp+Auhxg9tX3cFk9yQmtOhtJqTdfzk0nTTEHnY
	MrMz0hUcs5bI4k/0RXCxv8/M6Ors++wX363issh6A/bWK1JFWEQhnI4YdM+zjGuuyl7WZ/QeTz2rY
	jBFGP2XuqRTyVzRh1nwwbMYL3EHTCGRs8YuvypfXMWjHsGyzd0/ldY6P/iFj9GqFJ/nn91DBVr7Vg
	hlUJTVAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOC3V-0000000EjQP-0yaE;
	Wed, 26 Nov 2025 09:43:21 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOC3S-0000000EjPt-17VW;
	Wed, 26 Nov 2025 09:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764150198; x=1795686198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CCg+lZSEq+WcXEQmJQne7xQ4oE1yxypysTDuDghy64Q=;
  b=iBDS2yOuRT9lKKYMJ1kxUPgu/X+Pm81Heeg6xmprFhycjI1/Ddu45gLJ
   sU4+kAegRTlNDQHkGB4rCkIpjGY1eJQbRUs88cKTdzpMg7J+zokYgAUl7
   xWMDT5mZ/xg/zIOMoiM+3Y/fpHvw0YzEiiwe9G/EpPxE84hu/yJ23y9kd
   tSsDShBgxcwaAdDNLewzfBbN63X/1rIqn4HJRxXouVQxgV9vACAZEheGm
   Jicxk4asYOHcLhXm94K5bX289tf392rPRg0kCKvMsqHKMeWJSXUgRHXBw
   /aVrVY/L0Ai6UkHrVIEYiKC2dCZRTRASKR/8oSwfPWmi5Qb10DZFBRsAr
   g==;
X-CSE-ConnectionGUID: eXU6AcowSISKJNzT/EAQQA==
X-CSE-MsgGUID: /8iNkcs7SqitRaRQmfe0vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65371596"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="65371596"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:43:14 -0800
X-CSE-ConnectionGUID: B+T8YiSeRD+/P6Odm3S47w==
X-CSE-MsgGUID: B/YD/UVbQWaORjBCGIUAVA==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO kuha) ([10.124.223.25])
  by fmviesa003.fm.intel.com with SMTP; 26 Nov 2025 01:42:55 -0800
Received: by kuha (sSMTP sendmail emulation); Wed, 26 Nov 2025 11:42:43 +0200
Date: Wed, 26 Nov 2025 11:42:43 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <kernel@airkyi.com>,
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
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 01/11] usb: typec: Add notifier functions
Message-ID: <aSbLkwPG0dUzZvql@kuha>
References: <20251120022343.250-2-kernel@airkyi.com>
 <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
 <2025112402-unopposed-polio-e6e9@gregkh>
 <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
 <2025112448-brush-porcupine-c851@gregkh>
 <c9cb7b79-37c8-4fef-97a6-7d6b8898f9c4@rock-chips.com>
 <aSV_lQYJPxN7oBM-@kuha>
 <2025112554-uncaring-curator-642a@gregkh>
 <cbb38c08-6937-4b7d-a0b0-d5ca6c17f466@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbb38c08-6937-4b7d-a0b0-d5ca6c17f466@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_014318_343926_F0FCAEC5 
X-CRM114-Status: GOOD (  17.46  )
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

Wed, Nov 26, 2025 at 09:46:19AM +0800, Chaoyi Chen kirjoitti:
> On 11/25/2025 7:49 PM, Greg Kroah-Hartman wrote:
> >> +static umode_t typec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
> >> +{
> >> +	if (is_typec_port(kobj_to_dev(kobj)->parent))
> > 
> > Why look at the parent?  Doesn't the device have a type that should show
> > this?
> > 
> > Otherwise, looks good to me.
> 
> They have same deivce type "typec_altmode_dev_type".
> The parent device has a different device type to distinguish between
> port device and partner device.

I was already wondering would it make sense to provide separate device
types for the port, and also plug, alternate modes, but I'm not sure
if that's the right thing to do.

There is a plan to register an "altmode" also for the USB4 mode,
which of course is not an alternate mode. So USB4 will definitely need a
separate device type.

So if we supply separate device types for the port, plug and partner
alternate modes, we need to supply separate device types for port, plug
and partner USB4 mode as well.

We certainly can still do that, but I'm just not sure if it makes
sense?

I'll prepare a new version for this and include a separate patch where
instead of defining separate device types for the port and plug
alternate modes I'll just supply helpers is_port_alternate_mode() and
is_plug_alternate_mode().

thanks,

-- 
heikki

