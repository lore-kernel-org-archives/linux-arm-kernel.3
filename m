Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C928FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTy7eIsiHi8YdIDbzsIB/Y4+pBc/ZOwxm6JBRN1A8Q0=; b=BFx2W2+myHCRKNZ/oLom4JeNSn
	7R62vFD3gjDbjB3Ank9IzQaHZ/1gWRUJOStVCHDbOcKwpGCOTulxi3kwop2UoZWptpwVgWjJBeeO4
	aq5dS08LNx0NBcWJ9btQcDgx6j1ddeVu74cot/bLuWRntTAvIw9ih1Yg//MptNKa61BXUf65UKJQw
	jJXxCKYPkQZayExhfAQ20HTUhVyhXPKsvGt0bUuBoTeJK+CLeJg+zoTTSIDxH4qaPF8e0gAL1tGkO
	Gnf+j2xBEM7nc2Ea/KxdQFprIM6FQE9MfcEBqyLTG9+0PU5+sYZMTmnKwZDza3RORRumlW0nP6svE
	14drg65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRPM-00000007YAg-3Ye5;
	Wed, 08 Jan 2025 08:27:20 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRO6-00000007XrQ-43WO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 08:26:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0ABCA1BF203;
	Wed,  8 Jan 2025 08:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736324760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTy7eIsiHi8YdIDbzsIB/Y4+pBc/ZOwxm6JBRN1A8Q0=;
	b=Udq4Sjq+phO2RDT7qIKJv7/RN9LFeWV5i5Guf3z+CBn9p35fcbVsNs2A1JuJ1EH3yvJ/+j
	ErcRnFYiwA03LXPxcuQg7R1gIO/kCq2sz9KYAzyr+iyhjMWKPXKd7DhSsg4cKzyWkfu+6F
	fJ50YlLyURBi5NCjm2GN/bkNatCtm4lFhRHTfkK+tdR2om9BYY8N5mR5OGo4O85X8yTFtb
	XE5KVtEtEfxcMH/EQs66EloGG+U+/dK1XbMBMT9Rq2QI0yCzdvzjL7NYUNF+8aklnZVn/O
	ouJFUci7nmR2sedaC9SiOXpI4zPEfvBX+k9rNs5g7Wv9r8ezu43TIv1vN1vt3g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Frank Wunderlich <linux@fw-web.de>, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Frank Wunderlich <frank-w@public-files.de>, Hans de Goede
 <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] fix some binding check errors for marvell
In-Reply-To: <20250103103724.6223-1-linux@fw-web.de>
References: <20250103103724.6223-1-linux@fw-web.de>
Date: Wed, 08 Jan 2025 09:25:58 +0100
Message-ID: <87ldvlyand.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_002603_136160_CE936D6B 
X-CRM114-Status: GOOD (  13.42  )
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

Frank Wunderlich <linux@fw-web.de> writes:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> Thies series fixes some Errors reported by dtbs_check. First part is taken
> from my old series [1] where i converted sata-platform txt binding to yaml
> because it wasn't picked up.
>
> [1] https://lore.kernel.org/linux-arm-kernel/20220311210357.222830-1-linu=
x@fw-web.de/
>
> I only try to fix the binding errors, i do not have any marvell board, so
> cannot verify that my changes are correct. From my PoV peripheral
> controllers should be disabled in the SoC DT and enabled in board DT.
>
> Frank Wunderlich (2):
>   arm64: dts: marvell: only enable complete sata nodes
>   arm64: dts: marvell: drop additional phy-names for sata


Applied on mvebu/dt64

Thanks,

Gregory

>
>  arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 1 +
>  arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 2 ++
>  arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 +
>  arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 5 +++--
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 3 +--
>  arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 2 ++
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi              | 2 ++
>  arch/arm64/boot/dts/marvell/cn9130-crb-B.dts               | 1 +
>  arch/arm64/boot/dts/marvell/cn9131-db.dtsi                 | 1 +
>  arch/arm64/boot/dts/marvell/cn9132-db.dtsi                 | 1 +
>  10 files changed, 15 insertions(+), 4 deletions(-)
>
> --=20
> 2.43.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

