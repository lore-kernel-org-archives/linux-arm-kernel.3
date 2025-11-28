Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ECCCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 05:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4R2JmN+jIZlpmXZMthddssfwPfXAYJXBRAXWtpBTE+A=; b=kxlkQAge7sEdgGXcDn+kAKpjeb
	QFex65y0ydqMJAZGLkXyXb6KzuTebO53sNks+nHk+vd9lYTAx7Cg6S4P7hbCqc0fgrdUw1hif55gs
	tpxev1snqt5A3n33aMcZC9Pxv3ZccOT1HKxzHY42O+PxiExSWDhBoQ9OvCrFhwwSxiRxr/Wl+GFzO
	usthfwddKItPgXcAl0ic8+8OSfuKBHYHW03Y3WVRbkX7mTjjkv/rZ7c7wq22I7n0vZsLF2c56ixwj
	Z1e0E/kLJ+aUEI0mupMX3GP8yOLFImqPB1DkDBUWnS4wTHRfyLTSCp8IG35uQMSfcPsJ+UbZ69Azc
	OhCyyfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOrOk-000000000m6-2cko;
	Fri, 28 Nov 2025 05:52:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOrOj-000000000lu-1JRX;
	Fri, 28 Nov 2025 05:52:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13D6060254;
	Fri, 28 Nov 2025 05:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4075FC4CEF1;
	Fri, 28 Nov 2025 05:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764309119;
	bh=rOKG7zIx8s+aemPW1HN//6XrEdrArtLP34zx1Rj/gDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzlZDRzjofDJMmkUGxSJ6QmjoNMH0U/JaI36kLkIseZ4OeEijKfp73hi5Qp4Z9WYU
	 uRBIauyxvs7tMH0ygcKt8vqm6G0jm8LuGP4sSvRENhhDnuaU05R3wSVex1URwXptA6
	 RV4WP0uyd4P+ND5o0qzZ+izh3gIwgTBRAcRLKWYU=
Date: Fri, 28 Nov 2025 06:51:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 01/11] usb: typec: Set the bus also for the port and
 plug altmodes
Message-ID: <2025112846-italicize-handled-84ff@gregkh>
References: <20251128020405.90-1-kernel@airkyi.com>
 <20251128020405.90-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128020405.90-2-kernel@airkyi.com>
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

On Fri, Nov 28, 2025 at 10:03:55AM +0800, Chaoyi Chen wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> The port and plug altmodes can't be bound to the altmode
> drivers because the altmode drivers are meant for partner
> communication using the VDM (vendor defined messages), but
> they can still be part of the bus. The bus will make sure
> that the normal bus notifications are available also with
> the port altmodes.
> 
> The previously used common device type for all alternate
> modes is replaced with separate dedicated device types for
> port, plug, and partner alternate modes.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---

You forgot to sign off on this :(

