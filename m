Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4291CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 23:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJGyEzRnCHMiDixltde03aZUx6bqeNe+LxKN0VZwZSg=; b=kOhU+A/mtSjehkUKUTADvzp/d/
	ow8VFNGTZXfwPV7FG3PIjvI9dw5ZRgEGEzCOgZ1WVRL7XevmEiDBV4ZGOi4NbGQplNOSu3s+Z21gp
	hErMXlwaEcKzzQpnW6GGIVCElw9Fel1z8tlV8B7sCpcT3072m3J2vx+kLj+l4BzfXjH+nNOyJ2KSF
	SkIwvfIDn1xM+anaEXqj8hLolH0EjE9Mjfw3OvJjNpFhCFiXEWQyQgwUax5K+g0QI7VK37yn5HMEE
	bcmeiub0PaLwM5X2RD6YMSBhQakvuK2vppR2JmJq75fIh3XukSIdfOOEA+zmlIr0pmPpgEs3aZD87
	rQLkQjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww6jB-00000006yrW-4Bjm;
	Mon, 17 Aug 2026 23:26:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww6jA-00000006yrE-1Vqx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 23:26:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD39D43490;
	Mon, 17 Aug 2026 23:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0891F000E9;
	Mon, 17 Aug 2026 23:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787009207;
	bh=CJGyEzRnCHMiDixltde03aZUx6bqeNe+LxKN0VZwZSg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IRNl8+0pxap9y5upU7E3z7d8LY9Q20mTzs8+NikNuo3COJILP2VJNcyXoBF5kdrnA
	 WeY5OIu4urvG9S6jgkHZWpywnT7mTSS7JN61YHa9ES1DdKI/c/yBxvELbnFyJmn0IR
	 xbg/cdD9TRwbn7jr2+7BNILoV8gyBhxhI4OPh6oVeuldNJLhC9QK0xA4ApJ4cd0LPu
	 dF46Th+LtTdTgZHPsG8hNWqn0ORUOXmGE4COgchFlszU1huYeZ5Y2sAh1KKQO5KIO+
	 84CYZF/3jLBZl0rR7TIscjNm0tb70MG2/Mb1f1y1ALjrS7Xxmgk5MASn8qnpJqCsJ7
	 766Guf3/OtQMA==
Date: Mon, 17 Aug 2026 16:26:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, Hauke Mehrtens
 <hauke@hauke-m.de>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Semih Baskan
 <strst.gs@gmail.com>
Subject: Re: [PATCH V3 1/4 net] net: dsa: b53: deal with Northstar devices
 using CPU port 5 or 7
Message-ID: <20260817162646.6d6b9022@kernel.org>
In-Reply-To: <20260812132755.32585-1-zajec5@gmail.com>
References: <20260812132755.32585-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 12 Aug 2026 15:27:52 +0200 Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Northstar devices have 3 CPU ports. Ports 5 and 7 may be used but have
> their limitations. Warn user when CPU port 8 isn't used and add EAP
> setup workaround to avoid non-functional standalone ports.

FTR this needs to apply to the tree tagged in the first patch,
according to the CI it did not apply to net so repost will be needed.

