Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BB0D10F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hljvdi4hi7sXiTI6vVWHMLJla2o+JxtV4iBVLl6+trM=; b=LLMidLhl+e3lr17Sl+HAdfi16y
	CVe/yj3nB2Q1LvSz/8mHfwHTqjMZ8tFVqjw2vxf0n9rsiewRYRCqqkY7RvIA69tYO6iQFOs6OVhtJ
	mWEoOrOprl1SA5NfVhJ730qjL8on4sqOb4VelbYLbK1Zu4ToImICB7tEuaYdPRWbOdBUKEXDG/Dtv
	oGFZVUW5mxCdfsbja2ca9PI7o7DqJBrmL4zwVP8sNTvrWPiEX2vjm8vZb+b+hrSDWmbI8U9IwnYWK
	FwuxzDOtXKsHXNb04aOAuRELPoOj8fRnfu+SZGbEL7P7tjZzgT+ifxJeA3wBJAkHaa+Hz3vAuGWw2
	sFDIztbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODwq-0000000EvOh-2bqC;
	Wed, 26 Nov 2025 11:44:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODwp-0000000EvOU-01ww;
	Wed, 26 Nov 2025 11:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EFBA8601D7;
	Wed, 26 Nov 2025 11:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C877C113D0;
	Wed, 26 Nov 2025 11:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764157473;
	bh=dQ3LNp2DPvCHpByC5YJ/LPjNqcR3n3ZIP831X7vWn8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EX6HFDp6M+6sFCHy11l719FEszcZCnX/arPyanWY59AmUz7HdftavnC1U4UCkzvV0
	 uMiLKf9hkOEIYyVgWL4ByFWeBVROb9xMXOMOAFmxeygWsa7rhDrNnpXdbZ/kbBuZPA
	 mFQJCkSC9jrSiqVsHgOTzV+V4tdIrre3rw2MorAU=
Date: Wed, 26 Nov 2025 12:44:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
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
Message-ID: <2025112656-dreamland-retreat-2a65@gregkh>
References: <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
 <2025112402-unopposed-polio-e6e9@gregkh>
 <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
 <2025112448-brush-porcupine-c851@gregkh>
 <c9cb7b79-37c8-4fef-97a6-7d6b8898f9c4@rock-chips.com>
 <aSV_lQYJPxN7oBM-@kuha>
 <2025112554-uncaring-curator-642a@gregkh>
 <cbb38c08-6937-4b7d-a0b0-d5ca6c17f466@rock-chips.com>
 <aSbLkwPG0dUzZvql@kuha>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSbLkwPG0dUzZvql@kuha>
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

On Wed, Nov 26, 2025 at 11:42:43AM +0200, Heikki Krogerus wrote:
> Wed, Nov 26, 2025 at 09:46:19AM +0800, Chaoyi Chen kirjoitti:
> > On 11/25/2025 7:49 PM, Greg Kroah-Hartman wrote:
> > >> +static umode_t typec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
> > >> +{
> > >> +	if (is_typec_port(kobj_to_dev(kobj)->parent))
> > > 
> > > Why look at the parent?  Doesn't the device have a type that should show
> > > this?
> > > 
> > > Otherwise, looks good to me.
> > 
> > They have same deivce type "typec_altmode_dev_type".
> > The parent device has a different device type to distinguish between
> > port device and partner device.
> 
> I was already wondering would it make sense to provide separate device
> types for the port, and also plug, alternate modes, but I'm not sure
> if that's the right thing to do.
> 
> There is a plan to register an "altmode" also for the USB4 mode,
> which of course is not an alternate mode. So USB4 will definitely need a
> separate device type.
> 
> So if we supply separate device types for the port, plug and partner
> alternate modes, we need to supply separate device types for port, plug
> and partner USB4 mode as well.
> 
> We certainly can still do that, but I'm just not sure if it makes
> sense?
> 
> I'll prepare a new version for this and include a separate patch where
> instead of defining separate device types for the port and plug
> alternate modes I'll just supply helpers is_port_alternate_mode() and
> is_plug_alternate_mode().

That feels like it would be better in the long run as it would be
easier to "match" on the device type.

thanks,

greg k-h

