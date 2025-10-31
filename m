Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B23CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoeiZsV9VTozKFQRmGQZjq2+12U+s43PsN0bmlATxFk=; b=nhGhn6Qp8QLM94eF8+CYb2oDwD
	JN7Qgu6DLPGAR6xveGs6BTdYL/MgmN3msxH8/ho8m/0Gs9ZI7jul/vFeFku3jaxu4TWnRENWug4DD
	TtLTxUrAHIMfsgH2d+DQnGiInxFvGfpYZhH+myacRchPyOgP8QUiFzALb2Ne0VqB+sMRVAXD38Kcf
	yLEI9NsjHffk4D/Vf9yN2OOcTi31+vbBwFREXRkBKSCMKKrlaj6ynqwYvixP4nHv65zn6XDRLeaOW
	dL8bO9Tsp8buWjiN7jgexdo7hy7lstyAUiS1h2RDvAxmQ8RigHYqPctX910IuDrjrHef2AfrZ4S1S
	C8/4j7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnZc-0000000626g-2lyh;
	Fri, 31 Oct 2025 11:45:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnZa-0000000626E-12y7;
	Fri, 31 Oct 2025 11:45:39 +0000
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DC9FE15D2;
	Fri, 31 Oct 2025 12:43:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761911022;
	bh=R6yONYYYsqby242jh6TH+ABfAPUopUW31yFooS58XAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XIfLDkUs0wkpgMMux9UqqDbnkm3yB/emjfS2nTgpYyjivkfBfEhUlVkxOdphP5JnS
	 AV0EwrKekY63YdHMRBuY98sFA/lxs00uwZgWT4lOCGm/v7RU5/MNXFHn5CxdLjrwhk
	 DA3kg5kliVvmH6PoqK/0Y6i8/O1yo1nq0CFGAHQA=
Date: Fri, 31 Oct 2025 13:45:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
Subject: Re: [PATCH v2 0/5] dd ethernet support for RPi5
Message-ID: <20251031114518.GA17287@pendragon.ideasonboard.com>
References: <20250822093440.53941-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822093440.53941-1-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_044538_457311_B233D10E 
X-CRM114-Status: GOOD (  19.23  )
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

Hi Stan,

On Fri, Aug 22, 2025 at 12:34:35PM +0300, Stanimir Varbanov wrote:
> Hello,
> 
> Changes in v2:
>  - In 1/5 updates according to review comments (Nicolas)
>  - In 1/5 added Fixes tag (Nicolas)
>  - Added Reviewed-by and Acked-by tags.
> 
> v1 can found at [1].
> 
> Comments are welcome!

I'm very happy to see support for Raspberry Pi 5 progressing fast
upstream.

I've tested the latest mainline kernel (v6.18-rc3) that includes this
series (except for 1/5 that is replaced by
https://lore.kernel.org/all/20250820-macb-fixes-v4-0-23c399429164@bootlin.com/
as far as I understand). The ethernet controller is successfully
detected, and so is the PHY. Link status seems to work fine too, but
data doesn't seem to go through when the kernel tries to get a DHCP
address (for NFS root). Here's the end of the kernel log (with the
messages related to the USB controller stripped out):

[    0.896779] rp1_pci 0002:01:00.0: assign IRQ: got 27
[    0.896809] rp1_pci 0002:01:00.0: enabling device (0000 -> 0002)
[    0.896840] rp1_pci 0002:01:00.0: enabling bus mastering
[    0.931874] macb 1f00100000.ethernet: invalid hw address, using random
[    0.944448] macb 1f00100000.ethernet eth0: Cadence GEM rev 0x00070109 at 0x1f00100000 irq 95 (da:2e:6d:9d:52:a4)
[    0.989067] macb 1f00100000.ethernet eth0: PHY [1f00100000.ethernet-ffffffff:01] driver [Broadcom BCM54210E] (irq=POLL)
[    0.989272] macb 1f00100000.ethernet eth0: configuring for phy/rgmii-id link mode
[    0.991271] macb 1f00100000.ethernet: gem-ptp-timer ptp clock registered.
[    4.039490] macb 1f00100000.ethernet eth0: Link is Up - 1Gbps/Full - flow control tx
[    4.062589] Sending DHCP requests .....
[   40.902771] macb 1f00100000.ethernet eth0: Link is Down
[   43.975334] macb 1f00100000.ethernet eth0: Link is Up - 1Gbps/Full - flow control tx

I've tried porting patches to drivers/net/phy/broadcom.c from the
Raspberry Pi kernel to specifically support the BCM54213PE PHY (which is
otherwise identified as a BCM54210E), but they didn't seem to help.

What's the status of ethernet support on the Pi 5, is it supposed to
work upstream, or are there pieces still missing ?

> [1] www.spinics.net/lists/netdev/msg1115266.html
> 
> Dave Stevenson (2):
>   dt-bindings: net: cdns,macb: Add compatible for Raspberry Pi RP1
>   net: cadence: macb: Add support for Raspberry Pi RP1 ethernet
>     controller
> 
> Stanimir Varbanov (3):
>   net: cadence: macb: Set upper 32bits of DMA ring buffer
>   arm64: dts: rp1: Add ethernet DT node
>   arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5
> 
>  .../devicetree/bindings/net/cdns,macb.yaml     |  1 +
>  .../boot/dts/broadcom/bcm2712-rpi-5-b.dts      | 18 ++++++++++++++++++
>  arch/arm64/boot/dts/broadcom/rp1-common.dtsi   | 16 ++++++++++++++++
>  drivers/net/ethernet/cadence/macb_main.c       | 18 +++++++++++++++++-
>  4 files changed, 52 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

