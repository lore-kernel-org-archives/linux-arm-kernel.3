Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E6AD4A5EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 03:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoF2AbVVEoWqyJCK7CJsC9G+oVYeU7nhRemC8Vabi7Q=; b=ZGkjbno16YynXrVdVwh7fA0b7N
	we3TzWSUzNtxZ7Z6tqMYkKbid2pL8znSFmyC6SQjuGpC64tTe1t9wEUkPlTxFeIdChXptUXf7w6FZ
	YFRAAvrdjzxAq4dW4j/sJmikSxnYBmNEV0h9RxmcfHSKiAXuPIaaC2YkANnHd7pj1Z1+TirF6LUGC
	kvGD6XuXVjFuXMRjtAo2qGbHobAPM2+Bjpr/K4OMA9QluLWmYh+0H4asEiVxCi1ssk8Z59GMmrbFI
	H/n+jfTTKQi61zv6R6MfmvMKU8GpjbcJrBRCb4S/T5Zjl6RJdAS1mXEjghxBNdaME5BkJLdtefV6P
	lWn1cg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaMx-0000000DWod-452W;
	Fri, 16 Jan 2026 03:19:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaMw-0000000DWoB-1Pza;
	Fri, 16 Jan 2026 03:19:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC97E60160;
	Fri, 16 Jan 2026 03:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3CAC116D0;
	Fri, 16 Jan 2026 03:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768533565;
	bh=VdJdZpUrMYbP48ze7XiWYcrijQ8cjRhSAViY06JrWns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UfPpHK9Zs+U0XolvtAoWyNifcaJ7gKJDEZDRjcx/qG9hP6oEaFsIVpncLAsQsSBf5
	 I0nd2pkfwH18qaqAe1BCUhxezG4bx7ZlzYhI9sWtDNwKQumt3mLXq5qimita/HMBUP
	 QW40JDSebPhYGO3ngLZ2OW9vCAL/McNkDv+hiUPbBvUBSmw6YAjQZsGszx0BBcL8mN
	 dvgURzsb55zeC0ZJTbDPPaYyJtr9psUVbcOvQmY2MibBL+UFaZR8/OHov8OaUrCJOe
	 ojvDq4ltLZcX0v9x5yq/XgSFPad7wGsm478xvrSuF0bF3qtinApwa6v8/VenDmGqsX
	 iRL+468HGOQGw==
Date: Thu, 15 Jan 2026 19:19:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Paolo Abeni <pabeni@redhat.com>, =?UTF-8?B?QmrDuHJu?= Mork
 <bjorn@mork.no>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Eric
 Woudstra <ericwouds@gmail.com>, Marek =?UTF-8?B?QmVow7pu?=
 <kabel@kernel.org>, Lee Jones <lee@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 net-next 05/10] phy: add phy_get_rx_polarity() and
 phy_get_tx_polarity()
Message-ID: <20260115191923.640ea49d@kernel.org>
In-Reply-To: <20260115093928.hdqlxkt6bd5w4xud@skbuf>
References: <20260111093940.975359-1-vladimir.oltean@nxp.com>
	<20260111093940.975359-6-vladimir.oltean@nxp.com>
	<87o6n04b84.fsf@miraculix.mork.no>
	<20260111141549.xtl5bpjtru6rv6ys@skbuf>
	<aWeV1CEaEMvImS-9@vaman>
	<33ff22b4-ead6-4703-8ded-1be5b5d0ead0@redhat.com>
	<173d1032-386c-4188-933c-ca91ce36468f@redhat.com>
	<20260115093928.hdqlxkt6bd5w4xud@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 15 Jan 2026 11:39:28 +0200 Vladimir Oltean wrote:
> > > Could you please share a stable branch/tag, so that we can pull patches
> > > 1-5 into the net-next tree from there?  
> > 
> > Vladimir, could you please re-post patches 1-5 after that Vinod shares
> > the above? So that we don't keep in PW the dangling (current) series.
> >  
> Vinod did share the PR:
> https://lore.kernel.org/netdev/aWeXvFcGNK5T6As9@vaman/

IIUC Paolo did not pull Vinod's PR, so pulled now, you can repost.

