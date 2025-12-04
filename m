Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366A0D20698
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGp8j58OPB1aBft+UW60xYewwlPZNdHyx8j9xzHE9Og=; b=VNW7/3tfwr2RCViR0b6cLmF37y
	H4x0ieErEbED0sEcIioO89pWzanMoafgfb/hxsN+mumAeixCQXejXYZaogTOovM7vuI2ktDLNXyTG
	r2mPvzTaeSMxCxLD/Rsdy8obe1t5G/hkn6gOwomlHbnnEho3Ft1GVFd52KX8la2EE8PLT+KgKffmS
	IW3XveDlbO4YzzMg2H89a1WMBFa8lu4CjhNPQG6vJ3CLMVJYqMLTXNYjvJXCP8CvzMCdhfNrTexrV
	q+cm4Q6AzYxCkhUrduxJUW5tPOE86JRVKoa+AKCYCWGVmfNY2F32eaAsiHNjeTp5vn1n8BASPA6S4
	iKPNTAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9jj-000000085N1-1nnY;
	Thu, 04 Dec 2025 13:51:11 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9jh-000000085M1-0eeg;
	Thu, 04 Dec 2025 13:51:10 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1vR9jU-000000007EO-0W0z;
	Thu, 04 Dec 2025 13:50:56 +0000
Date: Thu, 4 Dec 2025 13:50:52 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Frank Wunderlich <frankwu@gmx.de>,
	Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <aTGRvADkT-1kAQgA@makrotopia.org>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204131626.upw77jncqfwxydww@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_055109_216893_E9A786AB 
X-CRM114-Status: GOOD (  44.65  )
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

On Thu, Dec 04, 2025 at 03:16:26PM +0200, Vladimir Oltean wrote:
> On Tue, Dec 02, 2025 at 12:20:31PM +0000, Daniel Golle wrote:
> > On Tue, Dec 02, 2025 at 12:52:44PM +0100, Frank Wunderlich wrote:
> > > Hi,
> > > 
> > > Am 01.12.25 um 08:48 schrieb Krzysztof Kozlowski:
> > > > On 30/11/2025 21:17, Andrew Lunn wrote:
> > > > > On Sun, Nov 30, 2025 at 10:07:31AM +0200, Vladimir Oltean wrote:
> > > > > > On Sun, Nov 30, 2025 at 02:11:05AM +0100, Andrew Lunn wrote:
> > > > > > > > -		gpiod_set_value_cansleep(priv->reset, 0);
> > > > > > > > +		int is_active_low = !!gpiod_is_active_low(priv->reset);
> > > > > > > > +		gpiod_set_value_cansleep(priv->reset, is_active_low);
> > > > > > > I think you did not correctly understand what Russell said. You pass
> > > > > > > the logical value to gpiod_set_value(). If the GPIO has been marked as
> > > > > > > active LOW, the GPIO core will invert the logical values to the raw
> > > > > > > value. You should not be using gpiod_is_active_low().
> > > > > > > 
> > > > > > > But as i said to the previous patch, i would just leave everything as
> > > > > > > it is, except document the issue.
> > > > > > > 
> > > > > > > 	Andrew
> > > > > > > 
> > > > > > It was my suggestion to do it like this (but I don't understand why I'm
> > > > > > again not in CC).
> > > > > > 
> > > > > > We _know_ that the reset pin of the switch should be active low. So by
> > > > > > using gpiod_is_active_low(), we can determine whether the device tree is
> > > > > > wrong or not, and we can work with a wrong device tree too (just invert
> > > > > > the logical values).
> > > > > Assuming there is not a NOT gate placed between the GPIO and the reset
> > > > > pin, because the board designer decided to do that for some reason?
> > > jumping in because i prepare mt7987 / BPI-R4Lite dts for upstreaming when
> > > driver-changes are in.
> > > With current driver i need to define the reset-gpio for mt7531 again wrong
> > > to get it
> > > working. So to have future dts correct, imho this (or similar) change to
> > > driver is needed.
> > > 
> > > Of course we cannot simply say that current value is wrong and just invert
> > > it because of
> > > possible "external" inversion of reset signal between SoC and switch.
> > > I have to look on schematics for the boards i have (BPI-R64, BPI-R3,
> > > BPI-R2Pro) if there is such circuit.
> > 
> > I'm also not aware of any board which doesn't directly connect the
> > reset of the MT7530 to a GPIO pin of the SoC. For MediaTek's designs
> > there is often even a specific pin desginated for this purpose and
> > most vendors do follow this. If they deviate at all, then it's just
> > that a different pin is used for the switch reset, but I've never
> > seen any logic between the SoC's GPIO pin and the switch reset.
> > 
> > > Maybe the mt7988 (mt7530-mmio) based boards also affected?
> > 
> > There is no GPIO reset for switches which are integrated in the SoC,
> > so this only matters for external MT7530 and MT7531 ICs for which an
> > actual GPIO line connected to the SoC is used to reset the switch.
> 
> I get the feeling that we're complicating a simple solution because of a
> theoretical "what if" scenario. The "NOT" gate is somewhat contrived
> given the fact that most GPIOs can already be active high or low, but OK.
> 
> If this is blocking progress for new device trees, can we just construct,
> using of_machine_is_compatible(), a list of all boards where the device
> tree defines incorrect reset polarity that shouldn't be trusted by the
> driver when driving the reset GPIO? If we do this, we can also leave
> those existing device trees alone.

From OpenWrt's point of view this would be kind of ugly as we would either
have to extend the list of affected boards downstream, or fix the polarity
in some but not all of our downstream DTS files. I'd prefer to rather
have the option to force the "wrong" GPIO polarity for theoretical future
boards with that (very unlikely to ever exist) NOT gate between the SoC
GPIO and switch reset line. That would allow to gradually update boards
to reflect the physical reality and yet the driver would not break if the
GPIO polarity is stated wrongly.

