Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D8CCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0L3vM6YLmg9pq/ypW1IqncbW6S6DkPhBxKBhDP3z0o0=; b=GDy3AzBPBT7ZecYJFw1ynRs7zL
	t7dJyyNzBiosFUQc/6Rw6hZMglxVJvZdhKph0QmlH6nr/CQcVcRZgUIyuXl8sQZZ1Fys9uhI2M8Wx
	dzvnG5K4W01DM2i/dRgf3dk+HlZmeZn7tsWTqrjrp4wQLiPkrnporkF4+8U/2nBuBw/FrXWyVC9Hm
	+K97svRkIr/XDVS/E1TnSOhkz5exewtUKcqrEmfgI3fc7K5jqWfRsNaFcWbba55VNYH56l/vDJGCQ
	EfGXR92Br2Gbqa59DZya2VGh139pO58mrRN6sCOILneHDU66FNSim1U5rqAleIFVgP2P41Mse6plS
	XLhAVAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcW-000000011Xk-2C8Z;
	Fri, 22 Aug 2025 00:27:04 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8QX-0000000HZth-2BCH;
	Thu, 21 Aug 2025 16:46:14 +0000
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 4A4F0EC0787;
	Thu, 21 Aug 2025 12:46:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 21 Aug 2025 12:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1755794772; x=1755881172; bh=0L3vM6YLmg
	9pq/ypW1IqncbW6S6DkPhBxKBhDP3z0o0=; b=Ng7N4n9hWaKAXoCUELKodmIoji
	oDL3Zzpv7nQCCsaclA0XaLOjXCyXp5c6tn54FhoT3QrxEtGRpF/P4Z/CAcq14OJR
	/BLDh4Y5OVUvMxcE8qZnzEEjzq+hjmbbY8fMuyc6bCWqPpYWmYlpfeWZHXnAOWA8
	+Zt2E4RTMAbjOp1yReYdCwymgE2UXV1FQ8/a12O+RrQK3pjZMyxEnKQG6Gs2YJhs
	wWmw5COkxZzWq5tlC225WBY77NwedNmQJhZyTR0eFntmo7rBe7ANiHYI5t2Zn4vl
	SVLYkck3kIP1XfGIZRCRei4h5rfFtbqQ516kp5whyjPCnKlUD/q5EwXfdV/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755794772; x=1755881172; bh=0L3vM6YLmg9pq/ypW1IqncbW6S6DkPhBxKB
	hDP3z0o0=; b=OSYTZMdMAIaG24G5LpRZuVxYDMHEnqIZNPTIkiKpV/6nKgIx49S
	fGLl2phjvaJ+Bubu2ZbsSY2QBZk3KM0i4LCiwnRhsDjrEiW1pX93GFLxU69c0wWc
	IrgqarCbu5oyv4l2qFxIsRrg8ywScwMbubQZXMiOCJRL1yq9FpQmKjbyINYoB41a
	5CggNO9p9DkUw/qSm3Sd03LZhuSkvQU3KKlM97fvw44hNWQeJMaB9U53pUAiwm1v
	TIaNkV6sae5rNkwvfPDu/ujAOXX4cR5GFAZp4rvmcg9jP8dfeZhzk/X8iUH8Y3fJ
	1AbOkF2uDxu95rhV7uMbpbnbQ72PVesZM/w==
X-ME-Sender: <xms:U02naD1N0U4V6oV3luaKuJXxkv0zi0v6MnhWUXbm4UcDjFzVZxDjtA>
    <xme:U02naPyX0r1a-0rYWFWGTsV2EhBJAIpcy3nqA9cDzCFN1SB-DE0AjmF5g2KC2e_RB
    8kD-gYPmUflUcm_Iyw>
X-ME-Received: <xmr:U02naFoI-v70Z4EWn51BxGS4H7ZZec5W_gZOC-ALfJEclI_XWcD_ZE51OBloEypSOPEhYljIIoCGZ2YGgcF0HiW-zm2KGAWsSqo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedujeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlih
    hnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrlhgs
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvg
    highdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohep
    vhhkohhulheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:U02naFUjWm7bqMbHMqhQOCBhCTseEZUUqtqp52JO8fKZz8P1qoCuSg>
    <xmx:U02naMr_1gCuchPPYb_lPU7gPd33-HA5ykGlwbhi5ub0OkizlWaajQ>
    <xmx:U02naJGGXIlio0tWiw2kv2dxlo_bRfyM7IUSQTIlc135VcoQnhlV6w>
    <xmx:U02naOtFBjO-D_11veXXRj35ifrFUX03GuGhNW1JFbdYuu5srvLD5A>
    <xmx:VE2naLhO1Uz_DBEYnjSUo92ko0qwruBAvn3Kka33EQIKTm_9aTB1P2JV>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 12:46:11 -0400 (EDT)
Date: Thu, 21 Aug 2025 18:46:10 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 13/22] usb: typec: tipd: Read USB4, Thunderbolt and
 DisplayPort status for cd321x
Message-ID: <20250821164610.GF1270980@robin.jannau.net>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-13-172beda182b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821-atcphy-6-17-v1-13-172beda182b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_094613_627139_97A0E6EF 
X-CRM114-Status: GOOD (  11.76  )
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

On Thu, Aug 21, 2025 at 03:39:05PM +0000, Sven Peter wrote:
> CD321x supports various alternate modes and stores information once
> these are entered into separate status registers. Read those when they
> are active when reading TPS_DATA_STATUS to prepare supporting these.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/usb/typec/tipd/core.c | 81 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 77 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 51b0f3be8b66a743ddc3ea96c1b25f597a1e8f6c..59d270eb50ea3dc49ad32ff71f8354e23c1083c9 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -35,14 +35,19 @@
>  #define TPS_REG_INT_MASK2		0x17
>  #define TPS_REG_INT_CLEAR1		0x18
>  #define TPS_REG_INT_CLEAR2		0x19
> -#define TPS_REG_SYSTEM_POWER_STATE	0x20
>  #define TPS_REG_STATUS			0x1a
> +#define TPS_REG_SYSTEM_POWER_STATE	0x20
> +#define TPS_REG_USB4_STATUS		0x24
> +#define TPS_REG_DP_SID_STATUS		0x58

TPS_REG_DP_SID_STATUS is added twice, below in the correct order

>  #define TPS_REG_SYSTEM_CONF		0x28
>  #define TPS_REG_CTRL_CONF		0x29
>  #define TPS_REG_BOOT_STATUS		0x2D
>  #define TPS_REG_POWER_STATUS		0x3f
>  #define TPS_REG_PD_STATUS		0x40
>  #define TPS_REG_RX_IDENTITY_SOP		0x48
> +#define TPS_REG_CF_VID_STATUS		0x5e
> +#define TPS_REG_DP_SID_STATUS		0x58

here

Janne

