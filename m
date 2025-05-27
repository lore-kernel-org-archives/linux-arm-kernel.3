Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1189DC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvZ9huD4LI30UeuMWHiYyzRnbuqvMT4vG4k0kQwsXFI=; b=vDamJqHy3YqLMvysZmng9+01zH
	yIPY1TLT2DOjDFDhnigKHrJzRppCo5etCgLdNeRccWUZBis13Z7qG0TUeDTVmDzRuZfX5TqoxKj7e
	2lYNb9Aonjt8/+N1/WY00P1hTWX8e4X2kGQ0ygXJyQ14ZptGw5qjp1Mg8LkGoSq/BOgw9ykjXHJtf
	uZdteWHpu9OpjQtGjyErtpPbp+CBrkXlYNQOYz6HMlSNP0A0NrrgMjEhig8E0UznByoKZgBzw7ajJ
	ip8Qe9uL7+F8WygFeoqRCLWgpRxbnnV25xEPXkDS4vsvTRG5NFUF0GihA2JJBeIah7BDb4AKbrp9D
	exzWJSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtua-0000000AkiU-3pUD;
	Tue, 27 May 2025 13:00:08 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtrf-0000000AkG8-0jT6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 12:57:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6397F43A20;
	Tue, 27 May 2025 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748350622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvZ9huD4LI30UeuMWHiYyzRnbuqvMT4vG4k0kQwsXFI=;
	b=ULy72exI63Ba8S3IBJFigMySEMXjDhoJa+JGvaoBwixoogOybnutxBk7+8Ir8p1I6jCmAx
	FxsRP/8Uqr/Z/hjjZVQhPOQql9Jm8nmAmpE+thknL9UO7AFiQRMr27rElXR/3RLkEoGsEN
	EOkz/6+XDsaCtBBqTLJtL1pcuVr3de3J1guRgB1H9njfx2JMi4NYzN3MYmdvGpuRydKpsk
	l/lMXKaFUeXKIj3808pLVWRm/VB2RtIfVsWrMZpWvLZkHdXhVYS6zWqGz4nmpE665y5Ruz
	Q5o2VhIHbOeM0TEfJsi9lKL1zGropxcmMXaWO9XL+beEI0e/EErh3sYX+TdO3g==
Date: Tue, 27 May 2025 14:56:59 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jakob Unterwurzacher
 <jakob.unterwurzacher@cherry.de>, Heiko Stuebner <heiko@sntech.de>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Quentin
 Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH net v2] net: stmmac: platform: guarantee uniqueness of
 bus_id
Message-ID: <20250527145659.00bd10ae@device-24.home>
In-Reply-To: <20250527-stmmac-mdio-bus_id-v2-1-a5ca78454e3c@cherry.de>
References: <20250527-stmmac-mdio-bus_id-v2-1-a5ca78454e3c@cherry.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtdeggeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemhedvrgefmeejsgeludemudehtgelmegtledtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeehvdgrfeemjegsledumeduhegtleemtgeltdeipdhhvghlohepuggvvhhitggvqddvgedrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepfhhoshhsodhkvghrnhgvlhestdhlvghilhdrnhgvthdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrv
 hgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_055707_844690_0CEACE3C 
X-CRM114-Status: GOOD (  17.39  )
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

Hello Quentin,

On Tue, 27 May 2025 13:56:23 +0200
Quentin Schulz <foss+kernel@0leil.net> wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> bus_id is currently derived from the ethernetX alias. If one is missing
> for the device, 0 is used. If ethernet0 points to another stmmac device
> or if there are 2+ stmmac devices without an ethernet alias, then bus_id
> will be 0 for all of those.
> 
> This is an issue because the bus_id is used to generate the mdio bus id
> (new_bus->id in drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> stmmac_mdio_register) and this needs to be unique.
> 
> This allows to avoid needing to define ethernet aliases for devices with
> multiple stmmac controllers (such as the Rockchip RK3588) for multiple
> stmmac devices to probe properly.
> 
> Obviously, the bus_id isn't guaranteed to be stable across reboots if no
> alias is set for the device but that is easily fixed by simply adding an
> alias if this is desired.
> 
> Fixes: 25c83b5c2e82 ("dt:net:stmmac: Add support to dwmac version 3.610 and 3.710")
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

This looks correct, thanks !

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

