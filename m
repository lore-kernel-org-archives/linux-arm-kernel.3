Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FCAC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzmjiq9URmxifWwMJrDvTd/Qgz8o/d2eLU1BZkN3OyY=; b=Bk+lBusvYUedfqgv7B6q1cqEUC
	3xQ/Ew49XmcnrxQ+kWcA8tet1t0yVxPevRuXhYZft57VP1+B/0Rut2IfBPhDsrMF/kgl5Pk9SwQEN
	qdbOMIy8fiiQVp3xLNp5iwjfyhkw9WrdYa1Dcgmu8zc94sTNtZEGlIgegBuU1gaCH2X81i6o5o9aa
	JNIKPBONru9PWvXu82h5ELfJy9f9UOYugT1br+g5GtaZeNVbe8D4CGECdj6zpXjJ4+fYdbjDDwF2i
	K/o5EK1gPciMQaxQar+jkaV5VIRpwQzHRV+Df/CNkmZFwdAINs4EFuGYjms4S53Mb11msBXxQxLEN
	hp4tyszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEv5B-0000000DLOB-0q8t;
	Tue, 13 May 2025 19:14:29 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuun-0000000DJtv-45Up;
	Tue, 13 May 2025 19:03:47 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uEuop-000000006PI-1lSq;
	Tue, 13 May 2025 19:03:31 +0000
Date: Tue, 13 May 2025 20:03:27 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [net-next PATCH v4 03/11] net: phylink: introduce internal
 phylink PCS handling
Message-ID: <aCOXfw-krDZo9phk@makrotopia.org>
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
 <20250511201250.3789083-4-ansuelsmth@gmail.com>
 <5d004048-ef8f-42ad-8f17-d1e4d495f57f@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d004048-ef8f-42ad-8f17-d1e4d495f57f@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_120346_018281_C1D4A5A5 
X-CRM114-Status: GOOD (  31.78  )
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

On Tue, May 13, 2025 at 02:18:02PM -0400, Sean Anderson wrote:
> On 5/11/25 16:12, Christian Marangi wrote:
> > Introduce internal handling of PCS for phylink. This is an alternative
> > to .mac_select_pcs that moves the selection logic of the PCS entirely to
> > phylink with the usage of the supported_interface value in the PCS
> > struct.
> > 
> > MAC should now provide an array of available PCS in phylink_config in
> > .available_pcs and fill the .num_available_pcs with the number of
> > elements in the array. MAC should also define a new bitmap,
> > pcs_interfaces, in phylink_config to define for what interface mode a
> > dedicated PCS is required.
> > 
> > On phylink_create() this array is parsed and a linked list of PCS is
> > created based on the PCS passed in phylink_config.
> > Also the supported_interface value in phylink struct is updated with the
> > new supported_interface from the provided PCS.
> > 
> > On phylink_start() every PCS in phylink PCS list gets attached to the
> > phylink instance. This is done by setting the phylink value in
> > phylink_pcs struct to the phylink instance.
> > 
> > On phylink_stop(), every PCS in phylink PCS list is detached from the
> > phylink instance. This is done by setting the phylink value in
> > phylink_pcs struct to NULL.
> > 
> > phylink_validate_mac_and_pcs(), phylink_major_config() and
> > phylink_inband_caps() are updated to support this new implementation
> > with the PCS list stored in phylink.
> > 
> > They will make use of phylink_validate_pcs_interface() that will loop
> > for every PCS in the phylink PCS available list and find one that supports
> > the passed interface.
> > 
> > phylink_validate_pcs_interface() applies the same logic of .mac_select_pcs
> > where if a supported_interface value is not set for the PCS struct, then
> > it's assumed every interface is supported.
> > 
> > A MAC is required to implement either a .mac_select_pcs or make use of
> > the PCS list implementation. Implementing both will result in a fail
> > on MAC/PCS validation.
> > 
> > phylink value in phylink_pcs struct with this implementation is used to
> > track from PCS side when it's attached to a phylink instance. PCS driver
> > will make use of this information to correctly detach from a phylink
> > instance if needed.
> > 
> > The .mac_select_pcs implementation is not changed but it's expected that
> > every MAC driver migrates to the new implementation to later deprecate
> > and remove .mac_select_pcs.
> 
> This introduces a completely parallel PCS selection system used by a
> single driver. I don't think we want the maintenance burden and
> complexity of two systems in perpetuity. So what is your plan for
> conversion of existing drivers to your new system?

Moving functionality duplicated in many drivers to a common shared
implementation is nothing unsual.

While this series proposes the new mechanism for Airoha SoC, they are
immediately useful (and long awaited) also for MediaTek and Qualcomm
SoCs.

Also in the series you posted at least the macb driver (in "[net-next
PATCH v4 09/11] net: macb: Move most of mac_config to  mac_prepare")
would benefit from that shared implementation, as all it does in it's
mac_select_pcs is selecting the PCS by a given phy_interface_t, which is
what most Ethernet drivers which use more than one PCS are doing in
their implementatio of mac_select_pcs().

Also axienet_mac_select_pcs() from "[net-next PATCH v4 08/11] net:
axienet: Convert to use PCS subsystem" could obviously very easily be
mirated to use the phylink-internal handling of PCS selection.


> 
> DSA drivers typically have different PCSs for each port. At the moment
> these are selected with mac_select_pcs, allowing the use of a single
> phylink_config for each port. If you need to pass PCSs through
> phylink_config then each port will needs its own config. This may prove
> difficult to integrate with the existing API.

This might be a misunderstanding. Also here there is only a single
phylink_config for each MAC or DSA port, just instead of having many
more or less identical implementations of .mac_select_pcs, this
functionality is moved into phylink. As a nice side-effect that also
makes managing the life-cycle of the PCS more easy, so we won't need all
the wrappers for all the PCS OPs.

