Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA249C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfZSxMlKQHM8fVTPHG4G5K6/3qK7daDUPfpkAU+xVcM=; b=rT0NKJRBliL0tY3IKCvQCmMlc/
	xIAm4RIOjkKVPaD458StHA5JQ1h2M1tcUOMRQsa9slm4rc2JccjjmLnR9ERDr8Ji8A8X2kmtuTGJ7
	prCCwODsam632kjpZswATxthNM7JqS+uKKdYZHfG3bNc833tw+Iyaijg1H3+/Q8NyikYaiz1FcVe1
	nq+jvo82/fF8NHHyJZxzkCNOhoXcInEwKOamkmlrPJDifsOBgJUYzousJflkUGqSqiOIXKtxntnZK
	sKxUk5BVYHASiNQiZWWNyzNbueCFCWpOtH6/R0LR4oOZH2WoiFsi3xihDNO4WjLSKAGOWNV0kFmCm
	pd7Z7Asg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK1K-00000002RqW-3bj6;
	Mon, 14 Jul 2025 14:19:06 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJlQ-00000002PP1-37Pd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:02:42 +0000
Received: from localhost (ip-109-42-113-167.web.vodafone.de [109.42.113.167])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1D7C22F7;
	Mon, 14 Jul 2025 16:02:24 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 16:02:23 +0200
Message-Id: <DBBU0QGILT7C.33TZQUPDJU81O@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] net: ethernet: ti: am65-cpsw: fixup PHY
 mode for fixed RGMII TX delay
Cc: "Matthias Schiffer" <matthias.schiffer@ew.tq-group.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Andy Whitcroft" <apw@canonical.com>, "Dwaipayan Ray"
 <dwaipayanray1@gmail.com>, "Lukas Bulwahn" <lukas.bulwahn@gmail.com>, "Joe
 Perches" <joe@perches.com>, "Jonathan Corbet" <corbet@lwn.net>, "Nishanth
 Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Siddharth
 Vadapalli" <s-vadapalli@ti.com>, "Roger Quadros" <rogerq@kernel.org>, "Tero
 Kristo" <kristo@kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux@ew.tq-group.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Andrew Lunn" <andrew@lunn.ch>
X-Mailer: aerc 0.16.0
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
 <9b3fb1fbf719bef30702192155c6413cd5de5dcf.1750756583.git.matthias.schiffer@ew.tq-group.com> <DBBOW776RS0Z.1UZDHR9MGX26P@kernel.org> <fa3688c0-3b01-49fb-9c16-eeea66748876@lunn.ch>
In-Reply-To: <fa3688c0-3b01-49fb-9c16-eeea66748876@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_070240_934872_55984D25 
X-CRM114-Status: GOOD (  23.29  )
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

Hi,

On Mon Jul 14, 2025 at 3:09 PM CEST, Andrew Lunn wrote:
> On Mon, Jul 14, 2025 at 12:01:22PM +0200, Michael Walle wrote:
> > On Tue Jun 24, 2025 at 12:53 PM CEST, Matthias Schiffer wrote:
> > > All am65-cpsw controllers have a fixed TX delay, so the PHY interface
> > > mode must be fixed up to account for this.
> > >
> > > Modes that claim to a delay on the PCB can't actually work. Warn peop=
le
> > > to update their Device Trees if one of the unsupported modes is speci=
fied.
> > >
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> >=20
> > For whatever reason, this patch is breaking network on our board
> > (just transmission). We have rgmii-id in our devicetree which is now
> > modified to be just rgmii-rxid. The board has a TI AM67A (J722S) with a
> > Broadcom BCM54210E PHY. I'm not sure, if AM67A MAC doesn't add any
> > delay or if it's too small. I'll need to ask around if there are any
> > measurements but my colleague doing the measurements is on holiday
> > at the moment.
>
> I agree, we need to see if this is a AM65 vs AM67 issue. rgmii-id
> would be correct if the MAC is not adding delays.
>
> Do you have access to the datasheets for both? Can you do a side by
> side comparison for the section which describes the fixed TX delay?

The datasheets and TRMs of the SoC are public of the SoC. According
to the AM67A TRM the delay should be 1.2ns if I'm reading it
correctly. The BCM PHY requires a setup time of -0.9ns (min). So, is
should work (?), but it doesn't. I'm also not aware of any routing
skew between the signals. But as I said, I'll have to check with my
colleague next week.

-michael

