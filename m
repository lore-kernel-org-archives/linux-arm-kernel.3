Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E2ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 11:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPRSdSQE0bLnU693LJLxkchAwzL3R1o8wQQaHCAimXE=; b=WsJ2HPgUpjcx9KCzOEvZueS6Dt
	tclssP/S05RZ1q+zv9X4lPlYW3Q7UE40mW/AY0bP0236FFbQH1PcKazhrmDOkCpHUdZD/PEZdaAa1
	GHbUVN+xfHMBEbgPAoiObCPRDCSis0f0uUNsIoPOXPsJgZgZR+zL3xMwY+GE1MB7A9Fbn57oRczdQ
	xrYF6KzwmKSnIxllVDhS7j9gIzddemr6YDJYe7WvbsWWHGqMkYAfoQ+mFOcrbj/v5+3LmWxqGq5OJ
	fz8mm8o6IMFyxfNyfywYQ04zFqZhG/2shW18xJXWn81U/C7IMZG+3O6OEQoULrWaO+z1xBf3IvbeE
	UHPGcz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAUh-0000000Gl99-3SKd;
	Tue, 21 Oct 2025 11:25:35 +0000
Received: from mx-relay138-hz1.antispameurope.com ([94.100.132.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAUc-0000000Gl8Y-2y2q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 11:25:33 +0000
ARC-Authentication-Results: i=1; mx-gate138-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qPRSdSQE0bLnU693LJLxkchAwzL3R1o8wQQaHCAimXE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761045911;
 b=CoMAOZOvWXOqzenR7x+rmG1hWnW5cQZPrLeoNEJxNEe3uX7SM/LoLaRTSCJm2rDadiJ5mgGZ
 kw5H50g9RLq/TYRuPhKwKVT7aPWmW3Yw5b825bDQY3/yjpFAbcEnuhzQDWVjx/WB3vIZon44541
 i+RMDiIoyRP+gzRERPJKTZUUP6cQPDrKL+FDc+nyRSgwXpDSGwLO+6gDXhsa/ipPugpWq9fd7fa
 C3ULEjDfeR7N7cqrBpZ3SRG3WdMgfZ4GpTdJSycBqehl8utgVJZDkzWo2FjJkGPVKYep+u/I/X0
 pjmnFMcPhClRZEadJPRECcrEzqAJtRcEiP5OzqHFtOq/g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761045911;
 b=aCoMXBmKGoIFHTbIhQF1xBi/T2wUlGG/yYJJMT+ck2cHWcyl4YQkEHc/XINI8KZCLRZU5L76
 IhJdccNh7P6vYDm5t1ruDiOMWPYf5b7BSiajRiPwSaY9tpDmnkVtBg+TWFpXk1FJ382RWDkfUvp
 4fJiPOAApTfw4CpL8U8xA5zoJX55QosG2NARE9saxFU7f5UxV3IhoXbTvaqodIy37/C8OSvIueN
 Ztq/6NnN+QANHoYUQwmfHXHXmrVnd/ZtyXhE+qglS+M23PaOlHxpvD5w6LcRD/0cFajaqkAjln5
 YZW5Ui+wto7PxGOzXl55yXTYVA5UggnPivbscVNuBIm9w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay138-hz1.antispameurope.com;
 Tue, 21 Oct 2025 13:25:11 +0200
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 56DCEA404BD;
	Tue, 21 Oct 2025 13:24:53 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Gregor Herburger <gregor.herburger@tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/2] arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind
 devicetrees
Date: Tue, 21 Oct 2025 13:24:52 +0200
Message-ID: <13873811.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <14f52170-cc5b-4808-8fc1-28685ba349dd@lunn.ch>
References: <20251020133536.303471-1-alexander.stein@ew.tq-group.com>
 <20251020133536.303471-2-alexander.stein@ew.tq-group.com>
 <14f52170-cc5b-4808-8fc1-28685ba349dd@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay138-hz1.antispameurope.com with 4crVMB1Y5zz1NGLl
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 0a6c4bbb931b6e0c1b6e99bc4c54eeb4
X-cloud-security: scantime:2.297
DKIM-Signature: a=rsa-sha256;
 bh=qPRSdSQE0bLnU693LJLxkchAwzL3R1o8wQQaHCAimXE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761045911; v=1;
 b=dizRtntOG4a+w3XbANZt3A8xPrXPX7vG5Ni/HR7BFsq5rK0g8WzhjyRSHh6pOu6ASRUyNj23
 Ri3qGSdVxP22TwOMGHvf2GSBa5LHHlGo9o0jbr9Tg+K/e5HMqFEo+KWYu7veWk0D7jpBqnLbqgO
 UfizKS5/nvNheo/tdwyNs2ISELuwbP/rYEhQ/gL8mrjOjfkGF0uX/Gy7PX2o+mUZ0dzJnELkdoz
 j6tWHoqzg3zNPnVpTVIgpFt11/9oJiMzzOJ3SNIFna6BF5ZyXv019zSX6WpLlWDHyhQtCrNo3bp
 vdnaeliQDjdhQrEHlfL5fzJOHxwlPpdCkNCKs0wd33nlg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_042530_992831_B8897A98 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Andrew,

Am Montag, 20. Oktober 2025, 20:34:16 CEST schrieb Andrew Lunn:
> > +&enetc_mdio_pf3 {
> > +	mdio0_rgmii_phy00: ethernet-phy@0 {
> > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > +		reg =3D <0x00>;
> > +		reset-gpios =3D <&gpio_exp_1v8 1 GPIO_ACTIVE_LOW>;
> > +		reset-assert-us =3D <1>;
> > +		reset-deassert-us =3D <200>;
> > +		interrupt-parent =3D <&gpio_exp_1v8>;
> > +		interrupts =3D <0 IRQ_TYPE_EDGE_FALLING>;
>=20
> PHY interrupts are generally level not edge. So this is probably
> wrong.

Thanks for the pointer.

> > +		ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> > +		ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_NS>;
> > +		ti,led-function =3D <0x05b0>;
> > +		ti,led-ctrl =3D <0x1001>;
>=20
> I really would prefer /sys/class/leds was used. In fact, these are not
> documented, and don't even seem to be implemented in mainline. So you
> need to drop them.

Ah, sorry, this slipped in from downstream kernel. Will be removed.

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



