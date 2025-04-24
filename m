Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082B0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eToxWlS7Uu55X/OpbjIrz7rNLwhtOBmHvxKOjjoFdUg=; b=jSZaGsy9AEQvj9Qr436oAbHinN
	8UBAEe1IT1J/I5ohMrqY07MAokG0fQf8zyAD9EXXIikkc01ywRLg4ji5CsU3jqZZmqaJ+SYV/YKm8
	WFA4sx5DbArYAiw5vFyHKV6f4sKGPN6Vxm/V53O+vjWkuCHAy7cF+DH4GHTqkE2D2W37/Ku4CS4fl
	K7bGmJLTS36498QSaQEuzSz1IszcgmNjIqN4Mp95bl/r8KhlodDpbISVvi1+lHfc9oZiQeu8+Tybc
	S6j1p+EwGT/KZf+ziMjEpLigPuO3bSdv4Duz0grnbIlN5K6XPgXJax8+l3YyGNM0kQEgkqfQzMIIV
	mKUcVBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3X-0000000EaZF-2RPT;
	Thu, 24 Apr 2025 16:04:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vVU-0000000E0CE-0BRW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 12:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eToxWlS7Uu55X/OpbjIrz7rNLwhtOBmHvxKOjjoFdUg=; b=WZ4twjrfBxcHd15brL6g2jCi0O
	Fc0KBP2RhCa6YykDc4HhzNwQS2pg+oV0TCz5/LlwYJztp/ywzEr2jioiQccv6lFvLBJSYdup2HjLz
	L8aRqTTwKFIhgxgQE3Gd2t5REZWpG3iNmgKvQxJ6mnKP8LYHi5YX9LOOH0exvwxfCbvs6rKGHslwn
	fFlXNa3VLDHxeNXNLEqD8f6in/iCVQPqMLzs0Ngd8O0sITbWR+jROcmqSA8gzoH0vzqil0+dd3i93
	INoP9kQ3CkZtRF3JR9U16vCa2gx0Xsil0x9DTsGOURV3qBwL9b9CURcl/xXRBdNM6G5dwR5kePmqk
	kZ1QBUGg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7vVR-0000000Bme4-1VJ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eToxWlS7Uu55X/OpbjIrz7rNLwhtOBmHvxKOjjoFdUg=; b=iH/RIdmpljQM3Gx8gJpTMuc59Y
	Mi9NE9Ux9q+RktIIpPcpvjjGCjVnCwSJPQjedapo+PS5uc7gZzTP+/XGBMjXwBKU5uiG7JsCNCTm6
	EmqaA7qw2nVPkhsCgKn7c8cwSL+pcuT5yP8IzIoO6xVc8OXsmYCzMKOetEbkIokhNkWE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u7vV2-00ASTy-RL; Thu, 24 Apr 2025 14:16:16 +0200
Date: Thu, 24 Apr 2025 14:16:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <835b58a3-82a0-489e-a80f-dcbdb70f6f8d@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
 <aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
 <20250424014120.0d66bd85@minigeek.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424014120.0d66bd85@minigeek.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_131641_514884_51A53407 
X-CRM114-Status: GOOD (  17.31  )
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

On Thu, Apr 24, 2025 at 01:42:41AM +0100, Andre Przywara wrote:
> On Wed, 23 Apr 2025 18:58:37 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> Hi,
> 
> > > +&emac0 {
> > > +	phy-mode = "rgmii";  
> > 
> > Does the PCB have extra long clock lines in order to provide the
> > needed 2ns delay? I guess not, so this should be rgmii-id.
> 
> That's a good point, and it probably true.
> 
> > 
> > > +	phy-handle = <&ext_rgmii_phy>;
> > > +
> > > +	allwinner,tx-delay-ps = <300>;
> > > +	allwinner,rx-delay-ps = <400>;  
> > 
> > These are rather low delays, since the standard requires 2ns. Anyway,
> > once you change phy-mode, you probably don't need these.
> 
> Those go on top of the main 2ns delay

Which 2ns delay? "rgmii" means don't add 2ns delay, the PCB is doing
it. So if there is a 2ns delay, something is broken by not respecting
"rgmii".

> I just tried, it also works with some variations of those values, but
> setting tx-delay to 0 stops communication.

Just to be clear, you tried it with "rgmii-id" and the same <300> and
<400> values?

	Andrew

