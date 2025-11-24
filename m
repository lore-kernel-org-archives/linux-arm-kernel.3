Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5212CFD31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 07:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mh22QotmtH+9rJ7eCO4SwBOUuZkp96PXHDwthFWdtXI=; b=B4IcElTMiKPSXMoki3TeEg9Pzs
	C42Qznap6TG65q8xSTQpsxXB5yJTfMILPxfvNiiJ7dnWCWL0U0lb28UDvAGOVqwmXFwHsVSY6CdRy
	Ta+Qpp9NWth2SNrWjOhCwtDlX8dxiPWkwPoFFfFSb3mEYat4sR39+hRBp76yY3p/vf/WbwunHAJ58
	rUmCLEobYnXHJiQ046QAlpn8SDVXLyVhm2BujmCIZoY87N+RNBFOt4hxYg2KHGHQYwiWuab66a5sn
	8Q0SkP49nzbrkjy+hhAb92R2BxrqTf8GPY2OE45N/r0I+EzbF5vyAcTqLM70mqM82j95Jy3SrVd1g
	zXVg3a1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNQig-0000000BCfk-3yEw;
	Mon, 24 Nov 2025 07:10:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNQid-0000000BCfB-3Dks;
	Mon, 24 Nov 2025 07:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 143AE43446;
	Mon, 24 Nov 2025 07:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B46C4CEF1;
	Mon, 24 Nov 2025 07:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763968237;
	bh=+YCaXkWU9YkNV0FRWVSw1NN872qKLHgrqDXqtDa6dJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jn8gVZ0of5w9KSW/6XhTWgtPBbKeXjYsy1Tz7/knQXFS2NI1LeljWM4ESysUJV1fi
	 iM9S79mQ5WVSRrpzSFjw6zAsnP6v7VF2erwC/MmnM6UablSJzgwywhIQpLl+T3Wsdf
	 OHRxeObue89UUtbgEqb6NGnyZNBmz8pkePLuqF5A=
Date: Mon, 24 Nov 2025 08:10:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
Message-ID: <2025112402-unopposed-polio-e6e9@gregkh>
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-2-kernel@airkyi.com>
 <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_231039_861276_AFA2CDE2 
X-CRM114-Status: GOOD (  19.16  )
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

On Mon, Nov 24, 2025 at 09:40:03AM +0800, Chaoyi Chen wrote:
> Hi Greg,
> 
> On 11/21/2025 10:07 PM, Greg Kroah-Hartman wrote:
> > On Thu, Nov 20, 2025 at 10:23:33AM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > Some other part of kernel may want to know the event of typec bus.
> > Be specific, WHAT part of the kernel will need to know this?
> 
> For now, it is DRM.

Then say this.

> > And why a new notifier, why not just use the existing notifiers that you
> > already have?  And what is this going to be used for?
> 
> We have discussed this before, but the current bus notifier cannot achieve the expected notification [0].
> 
> [0] https://lore.kernel.org/all/aPsuLREPS_FEV3DS@kuha.fi.intel.com/

Then you need to document the heck out of this in the changelog text.
But I'm still not quite understanding why the bus notifier does not work
here, as you only want this information if the usb device is bound to
the bus there, you do not want to know this if it did not complete.

That thread says you want this not "too late", but why?  What is the
problem there, and how will you handle your code getting loaded after
the typec code is loaded?  Notifier callbacks don't work for that
situation, right?

> > Notifiers are a pain, and should almost never be added.  Use real
> > function calls instead.
> 
> In v6, I used direct function calls, but had to switch to notifiers because couldn't resolve the dependencies between DRM and Type-C [1]. Do you have any good ideas? Thank you.

Only allow this DRM code to be built if typec code is enabled, do NOT
use a select, use a depends in the drm code.

thanks,

greg k-h

