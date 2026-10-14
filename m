Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F350ECC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xroLQRGFlVBdqILrwWhxRndvE/GU7qXvt3u/3iPUAeU=; b=Cm4wPJtjsGAitVIlaCdK1fGKJM
	FMKQHMfXXKS8czjvrGjN01zmFgv+apgueEHzzZTJXNJsPfiwsQP6+HxW3UWS3AgEUD8UbT6qgY1IU
	avqytTWpl30fWl7jXXNEeY2VGM/czEWBQxz0LIknih6mMmecXeNSLcpiDe/r1G9QbU721dvySKMEt
	wPk3LMmSAYj0dYSOhs69STw93A/dXDwKlczK0BBsJJzX8VzCzzpVu6Cz5AIKlKFSA1VOvI0LXi0JC
	SW7A/Yj+P9ZOBY0U0jiDf/80TFn2AwEw26XQ2zMu5EHnuuzROA2E7diyuaF3lj1DoNzu9JYR2xqxl
	iUH+mWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2VF-0000000G47K-2sr8;
	Wed, 14 Oct 2026 17:10:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2V3-0000000G46P-2S8S;
	Wed, 14 Oct 2026 17:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xroLQRGFlVBdqILrwWhxRndvE/GU7qXvt3u/3iPUAeU=; b=lmnLOLmMv8N6XJzHwczRNtQcQJ
	rwcdD4fg3iW3B++JwobDzwU6XsLWC2ygRZIm+ag7ZTtLUEyCQKkc3ECF0ZYT3qI4J2fmzpvl4+S5b
	UykNPFNm4XlF7DtTLDwIActVpa1Xet/sYCIbC7oS1aQmmjUdTosn4STQbolQo6OFVKGw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xH2Ud-00AmlA-Rx; Wed, 14 Oct 2026 19:10:19 +0200
Date: Wed, 14 Oct 2026 19:10:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Aleksei Sviridkin <f@lex.la>, Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes
 after the MAC
Message-ID: <b175c750-104a-4859-a137-09de78a6d8bb@lunn.ch>
References: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
 <20261013151233.2474217-1-f@lex.la>
 <3d3b9f10-e3e8-4d50-b543-0d451cb07598@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d3b9f10-e3e8-4d50-b543-0d451cb07598@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_101046_905574_DCB3AEA7 
X-CRM114-Status: GOOD (  22.40  )
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

On Wed, Oct 14, 2026 at 12:04:36PM +0200, Paolo Abeni wrote:
> On 10/13/26 17:12, Aleksei Sviridkin wrote:
> > On 10/13/26 09:53, Paolo Abeni wrote:
> > > The above looks like a significant amount of complexity for OoT driver,
> > > and I understand it could be solved with a different kconf?
> > 
> > The PHY driver is in mainline, air_en8811h. Only the board's device
> > tree lives in OpenWrt.
> > 
> > A config change can avoid it, but it is expensive here. Building
> > air_en8811h in is not enough, since it loads its firmware with
> > request_firmware_direct() from the root filesystem, which is not mounted
> > yet when the switch probes. It also needs CONFIG_EXTRA_FIRMWARE with
> > 144 KB of blobs, in a kernel that OpenWrt shares between every board
> > of the subtarget.
> > 
> > Is that the expected answer for a board like this one, or would you
> > take a smaller change in phylink?
> To me this series still looks too much churn for something that has
> alternative options. I would like to hear a 2nd opinion from Russell,
> Andrew or Heiner.

I think the hardware design is poor, it would of made everybody life
easier spending an extra $1 on an EEPROM for the PHY firmware.

One alternative is to put the firmware download into the
bootloader. That means it is not in the initramfs, which seems to be
the major reason for doing this. By the time Linux gets to drive the
hardware, the hardware is actually usable. That makes our life
simpler.

	Andrew

