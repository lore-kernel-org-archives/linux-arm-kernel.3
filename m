Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBF3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 01:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8EA1AyjdNdbFnRh9IeSaHWAZqVMHd8h1QcdbcBJ32w=; b=xW65s0ACxZjmab4d82WRinlo+o
	L0L1QzEYzGQCfukbCYjzGiyns4iOA6CI9XoSy8QXpWcp2niprW1E4aIg9o0K/3fiaui7MXvXy2ePU
	79oY0nPbQY9RES0xvfz4AN6jjEuVSFbyVoFxROf/IrKr4arijZIH0h7G6zPVHVfos5OqrtxphLElm
	n3NrfzV5hhosAmNjbGjsqEWSrANoFHCc01jba91cC7ylKWCOlRj/YrarbqqxgD0HzGkRloNg6M4HN
	ctwqQABBB5wco1k2kYYY3W6lAg8l22TC8t52tJcW6xBeUDyvndYpl6sU3al2hSl0NxQ2nhnXbEFHc
	ZIA5wj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQi5-00000006FOB-1Oen;
	Tue, 31 Dec 2024 01:06:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQgQ-00000006FB3-45Am
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 01:04:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 508985C54B4;
	Tue, 31 Dec 2024 01:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF7CC4CED0;
	Tue, 31 Dec 2024 01:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735607069;
	bh=RH7kiMlpAI/s9h2kVGwIXwlCQELmu+Tyxzib/pl8Jko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAhZCtBLrHh3TXXoNx/BpQt+jcLzZqP3GygqEuviZj9mVkGsUQ0Aa2peOAkQXgWyK
	 gxh46RJqW2OpgTi6O5GxrJ9ZfJq/w43873IXXBCvER7LN/4XQwabDpxhJywLktgLRc
	 S1c2NK5Px3YRJtWmE8cNNJa5FCO6bDdOGfcW5B7QRHk1ilKmYrhWkYt5dL7fCJ42pG
	 Pg+QJkbFnFplVX1mT/S54/eALZq4vJIi68bOZoAyzSFOVdfSKkNDMRVga2pz6xiLV/
	 iWvGkxZPdSmAxqOCaF2LxhCRu8AzuroBZmrvJXqLlrmHGYj1ZpYxaAnoJwPw8TzQTZ
	 cRlzjaCgvGbGg==
Date: Mon, 30 Dec 2024 19:04:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Robert Foss <rfoss@kernel.org>, devicetree@vger.kernel.org,
	kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>, imx@lists.linux.dev,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: display/lvds-codec: add ti,sn65lvds822
Message-ID: <173560706743.2857783.191576326455714393.robh@kernel.org>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-5-38bf80dc22df@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-skov-dt-updates-v1-5-38bf80dc22df@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_170431_081401_DE3286DA 
X-CRM114-Status: UNSURE (   8.47  )
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


On Thu, 19 Dec 2024 08:25:29 +0100, Ahmad Fatoum wrote:
> Add compatible strings for TI SN65LVDS822, a FlatLink LVDS receiver.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> To: Andrzej Hajda <andrzej.hajda@intel.com> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
> To: Neil Armstrong <neil.armstrong@linaro.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
> To: Robert Foss <rfoss@kernel.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS,in file)
> Cc: Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
> Cc: David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
> Cc: Simona Vetter <simona@ffwll.ch> (maintainer:DRM DRIVERS)
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Cc: Maxime Ripard <mripard@kernel.org> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Cc: Thomas Zimmermann <tzimmermann@suse.de> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Cc: dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


