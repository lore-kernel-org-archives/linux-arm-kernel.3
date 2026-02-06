Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD9BECD9BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 02:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9O4jDNfyXf8tGD+yKlSZEBNzhY5WvoyZcOy8otVHbM=; b=KniBB9XOAturVZAtLzBe2ZIgP0
	wtQpSctWASthRwkp2G2lOvM4LmBlH/8AbGmNNNzBaIKRatigtRY7JfCsd7dY+qLzCA0pWkjFaG6T7
	wKTnRNIvOij20xC57MJsMFx0Y9+IwrPV9lFVA1C8osRQQuEexUgXCQYtphInY29AMQFAg5XHPbU+u
	aJOYh6wzl6eJNDjaYP+E1w33lJUXjjLN7a3AOw3NY1KIRmpUWd5pv7y2FupDlauJrEcUzewXGbgi3
	5AJx3uzOBPhxsFPIUkqkH+zEcG2w1arM4v9cdw/+MePa42TRZa0pIyII4JdtzJin1zQbQzDYcx/sX
	INTJWclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBZq-0000000AlKf-0lZR;
	Fri, 06 Feb 2026 02:28:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBZo-0000000AlK8-1SMe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 02:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAF4C43DC5;
	Fri,  6 Feb 2026 02:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEB0C4CEF7;
	Fri,  6 Feb 2026 02:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770344887;
	bh=I2diVQofdvPJyVuDk36062jQ935YdbEiaG0ZWzMo9Eg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=G59MsqOetC91MDNrvE6jfwAJM04OyXFUR4PlSV3n1vc1wZyGU+OD8C61uFohPtVF6
	 Lfbc5+O91P9AmKgk8MiGIuG4q11N0KVnrKQAKrnfkfixka2UJSAt1PIhmgcDAIonFD
	 qOD3K977ZwA2BEqVPuHWcRQgNqLK0vQQhd2IoWHW0s86VbjyiY0TZvf7llE9hSSeIa
	 zWxIqojtCbqQ1iit6zp2JtbbEqomfIA35nitdFNyTOFZeMae09/dAnDuYJEEAxNqZS
	 C9tHGyQa9J2cdXlxqFLSUcBldepwBqNj5Pb1F1nmZHx1xiq5zmEXkSAAKM4ez/0YyC
	 qUUQLNSUJYLJw==
Date: Thu, 5 Feb 2026 18:28:05 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukasz.majewski@mailbox.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v23 2/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20260205182805.196fd832@kernel.org>
In-Reply-To: <20260204232135.1024665-3-lukasz.majewski@mailbox.org>
References: <20260204232135.1024665-1-lukasz.majewski@mailbox.org>
	<20260204232135.1024665-3-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_182808_424331_9870D54F 
X-CRM114-Status: GOOD (  14.90  )
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

On Thu,  5 Feb 2026 00:21:30 +0100 Lukasz Majewski wrote:
> This patch series provides support for More Than IP L2 switch embedded
> in the imx287 SoC.
>=20
> This is a two port switch (placed between uDMA[01] and MAC-NET[01]),
> which can be used for offloading the network traffic.
>=20
> It can be used interchangeably with current FEC driver - to be more
> specific: one can use either of it, depending on the requirements.
>=20
> The biggest difference is the usage of DMA - when FEC is used, separate
> DMAs are available for each ENET-MAC block.
> However, with switch enabled - only the DMA0 is used to send/receive data
> to/form switch (and then switch sends them to respecitive ports).
>=20
> Signed-off-by: Lukasz Majewski <lukasz.majewski@mailbox.org>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Transient build failure here:

drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1072:32: warning: variable=
 =E2=80=98priv=E2=80=99 set but not used [-Wunused-but-set-variable]
 1072 |         struct mtip_ndev_priv *priv;
      |                                ^~~~

I sent out the AI code reviews while at it, without looking at them.
So please approach them with caution..

