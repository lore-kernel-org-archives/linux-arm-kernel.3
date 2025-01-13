Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62145C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUDw3kvKolhpUjOdJ7XwzQnmZAdNK5carUKXfz4URKw=; b=TvTW/Lfuwa0OWD
	0lswiAbxfP4Wt53JePu34SJYdUro4sfstIM6cIMv9eubS48TfChoxCwUQROisn+geEaChiCadpqhS
	0LshNWA9xa2ImcwTOAOL5nWVSNLYh2Cq/APXdPHrSSZZgqmvUiTXLDYxNO47B9LOKOyzEANjbjwOy
	dgmFeNZEOBouEJhS44c0IXTzdoCamCLa68vC9aAD3o3pi5EBcka52rBf6/+DFfWcELE0Yoc79QVB+
	goRvxpTM6LY2RHoE2pmB4zQ/kyA3TWP3Lvj9WVcd41LLL0hNi9hfW7zhtQtUQRjL/ZnsUK2AE1QFR
	M/qEPHmTaj4mmDGbI+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNMu-00000005sB8-226x;
	Mon, 13 Jan 2025 16:32:48 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNDW-00000005pZt-1wOu;
	Mon, 13 Jan 2025 16:23:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEFF41C0008;
	Mon, 13 Jan 2025 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736785382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUDw3kvKolhpUjOdJ7XwzQnmZAdNK5carUKXfz4URKw=;
	b=U6sya9U8Jron8CxjyT1kKNFV7NYolRM3yYla103nP9LRuqaLt/3HGsXiNATsmbsCfw8IAE
	0qS4C224oZwjsCidXCYCGZ41qIuW6RKg/LopwQuKINAhjes+h6T5l0XgwQmzDGzWiQikDQ
	nI5u7+E6VinhnKUhj14BSgOp/QS7Sm+4V960HB4VBGL94ASbS6LQuhZJGrlvLrsd8pVr60
	5iTs5Hfi+88+Z4ARtyMs1mdltQ4YgoKtaYye2xuTjmC8sVqkRqGiKcKRTBLp7dSWp8p4Cj
	y5CiEwY3gbG81sI8SHyFQ54JTFyGwBoqvvqzZ4hw377JxlGZvcTTaJnShfm99Q==
Date: Mon, 13 Jan 2025 17:22:55 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v2 0/5] net: phylink: fix PCS without autoneg
Message-ID: <20250113172255.3772dd6a@fedora.home>
In-Reply-To: <Z4TbR93B-X8A8iHe@shell.armlinux.org.uk>
References: <Z4TbR93B-X8A8iHe@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_082306_938231_55A901F7 
X-CRM114-Status: GOOD (  24.43  )
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Alexander Duyck <alexanderduyck@fb.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Sean Anderson <sean.anderson@seco.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Machon <daniel.machon@microchip.com>, kernel-team@meta.com, DENG Qingfang <dqfext@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Woudstra <ericwouds@gmail.com>, linux-mediatek@lists.infradead.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Russell,

On Mon, 13 Jan 2025 09:22:15 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> Hi,
> 
> Eric Woudstra reported that a PCS attached using 2500base-X does not
> see link when phylink is using in-band mode, but autoneg is disabled,
> despite there being a valid 2500base-X signal being received. We have
> these settings:
> 
> 	act_link_an_mode = MLO_AN_INBAND
> 	pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED
> 
> Eric diagnosed it to phylink_decode_c37_word() setting state->link
> false because the full-duplex bit isn't set in the non-existent link
> partner advertisement word (which doesn't exist because in-band
> autoneg is disabled!)
> 
> The test in phylink_mii_c22_pcs_decode_state() is supposed to catch
> this state, but since we converted PCS to use neg_mode, testing the
> Autoneg in the local advertisement is no longer sufficient - we need
> to be looking at the neg_mode, which currently isn't provided.
> 
> We need to provide this via the .pcs_get_state() method, and this
> will require modifying all PCS implementations to add the extra
> argument to this method.
> 
> Patch 1 uses the PCS neg_mode in phylink_mac_pcs_get_state() to correct
> the now obsolute usage of the Autoneg bit in the advertisement.
> 
> Patch 2 passes neg_mode into the .pcs_get_state() method, and updates
> all users.
> 
> Patch 3 adds neg_mode as an argument to the various clause 22 state
> decoder functions in phylink, modifying drivers to pass the neg_mode
> through.
> 
> Patch 4 makes use of phylink_mii_c22_pcs_decode_state() rather than
> using the Autoneg bit in the advertising field.
> 
> Patch 5 may be required for Eric's case - it ensures that we report
> the correct state for interface types that we support only one set
> of modes for when autoneg is disabled.
> 
> Changes in v2:
> - Add test for NULL pcs in patch 1
> 
> I haven't added Eric's t-b because I used a different fix in patch 1.

I stumbled on that issue last friday as well, with a MCBin and a
device I'm working on, using 1000BaseX with autoneg disabled. I didn't
get time to investigate back then, but reading this series it was
definitely that exact problem I was facing.

I missed your V1 and I just tested that V2, the problem is gone :)
Thanks !

The code LGTM to the best of my knowledge, so

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

