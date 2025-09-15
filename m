Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AC6CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIaERIBIwJafIeyw2K3jSp5OGzOS9qBC9uS4brU4IqM=; b=AYiI8G0RmPa/oSvMu8PHZ0vIg7
	bqIh7/6kPTIJk4n4eCR8vVmiHDWfsUX+W7bzs05+nl7XTqSrsbgnmxNwPVoPsjqrkYF8d5/Y08aSx
	7A7y6PHIdJM3id5Autps5OHjHi1GR735CAV8rwQx2HP/2+/7ZleZErAGQ9pcAKxXL4kZsYMzpTbpg
	/6UdY/6/Nji8ElRJeWWj9jCVc0nbCLJ4dTTe8xEK7KsGxQzfpvWlzRU6JJg8+n7nwRlbdRQsi7ohO
	6CqOaxoBCD6hVT/YqvtPwCneg6EDN+t9GlArUl9O4a1+ED2XY+4woiREkigfbAmShHrBCe9VJ5gP/
	9bENH7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9M7-00000004LY0-1Nzb;
	Mon, 15 Sep 2025 13:34:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9M4-00000004LTG-2u2W;
	Mon, 15 Sep 2025 13:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tIaERIBIwJafIeyw2K3jSp5OGzOS9qBC9uS4brU4IqM=; b=HwcrGxrAnnF7LG6L1V8LREbJR8
	KJLkr1Pd2zBaMbrs+4EAsXp/0peBgG+d98LTmKRBVY6f2GwbELwKIlFqU6kYF5FAw844uUkglUx/S
	QYQsuFvGBIJAOeQcbFzx7Ho9lMjIHBuJL23kha+3Qs69S/CHeo6OtvgBuKOY1+5Q23k4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uy9M0-008Rj1-1W; Mon, 15 Sep 2025 15:34:48 +0200
Date: Mon, 15 Sep 2025 15:34:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 3/5] net: cadence: macb: Add support for Raspberry Pi
 RP1 ethernet controller
Message-ID: <d2afd474-1514-4663-9e96-7efea30a5eaa@lunn.ch>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-4-svarbanov@suse.de>
 <0142ac69-f0eb-4135-b0d2-50c9fec27d43@suse.de>
 <8715a21b-83ac-4bc1-b856-fa90bb5b809f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8715a21b-83ac-4bc1-b856-fa90bb5b809f@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_063452_729880_12437D3F 
X-CRM114-Status: GOOD (  17.38  )
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

On Mon, Sep 15, 2025 at 02:27:34PM +0300, Stanimir Varbanov wrote:
> 
> 
> On 9/10/25 2:32 PM, Stanimir Varbanov wrote:
> > Hi Jakub,
> > 
> > On 8/22/25 12:34 PM, Stanimir Varbanov wrote:
> >> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>
> >> The RP1 chip has the Cadence GEM block, but wants the tx_clock
> >> to always run at 125MHz, in the same way as sama7g5.
> >> Add the relevant configuration.
> >>
> >> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> >> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> >> ---
> >>  drivers/net/ethernet/cadence/macb_main.c | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> > 
> > This patch is missing in net-next but ("dt-bindings: net: cdns,macb: Add
> > compatible for Raspberry Pi RP1") from this series has been applied.
> > 
> > Could you take this patch as well, please.
> 
> Gentle ping.

Such pings are ignored. Please rebase the patch to net-next and submit
it again.

	Andrew

