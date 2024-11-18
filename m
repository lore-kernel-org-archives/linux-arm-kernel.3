Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBF8D60CF8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 23:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OxDHwQ+LwgR6Jb7OIDjCgKY879pFmYdyYNHXVCDwog=; b=sCw9hXQS91P4WYPBC3Ka4BSYwK
	lW3gorTlmyL4xVvDKuI2NpW6KePrNgtQWii8OGZzx9CPMxwmCdvq1uDPSFai9OOpHP8jkz+rRWLyX
	GiBrpyEDug3q/0cCXtCqjX7DHKlwUsuMfCTszgxtEvKjd0B8E6o05UYILXpuP/YKmrZgB+U2WP5C/
	2vROsw62ja54cpLZceJCpqfzbmTikzXtKnE66YDriQCR2UBc0MzI9KnM57PYrb3kZTvbQNFhJpsdw
	ndQQndVUQ7Ln1G8opw6TjUCPFj92+zFNPAarwFJUn9PttTg2KEeeOBy4Pohpz4f8fyhtLzdf9rSZY
	YNcA4e3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDApO-0000000ApZa-3iu9;
	Mon, 18 Nov 2024 23:06:42 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAoS-0000000ApR0-3hzy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 23:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731971143;
	bh=+OxDHwQ+LwgR6Jb7OIDjCgKY879pFmYdyYNHXVCDwog=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=eQ9tesHA9Iuny+nyiRBUQMhg56mp5yBbcOvuBP4P9VvuulUB1B9pwUMqTLaOflq0p
	 NWDJi2a7YW8/K7l8nTmi3QzuEmCyzVAwcVp49VZIR81EtCuMPkLpCRzcl753hR29K3
	 pkKEs3a/l2+6kwP9QvQlURg8KqmhuTK1LLZr91FOh4QABe2/a+EO1weSdgRCby8tfk
	 fOIX7v+tKMQ+5Nq+oTf6pZkUJJDlsp/MuGX6FPDmA5JsuS1COoy+NHGiQ+Crb/r28d
	 JtxDWS5h2ntqSglCcnDvK4y4/VHvLEyOOvqX5VqN0cxjOq7hg00ktmJL2gH/j8RhvB
	 T9rwNRyKA6KzQ==
Received: from [192.168.68.112] (ppp118-210-181-13.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.13])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 76E9668D9B;
	Tue, 19 Nov 2024 07:05:40 +0800 (AWST)
Message-ID: <0d53f5fbb6b3f1eb01e601255f7e5ee3d1c45f93.camel@codeconstruct.com.au>
Subject: Re: [net-next 3/3] net: mdio: aspeed: Add dummy read for fire
 control
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Chou <jacky_chou@aspeedtech.com>, andrew+netdev@lunn.ch, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com,  robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joel@jms.id.au,  hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Tue, 19 Nov 2024 09:35:39 +1030
In-Reply-To: <20241118104735.3741749-4-jacky_chou@aspeedtech.com>
References: <20241118104735.3741749-1-jacky_chou@aspeedtech.com>
	 <20241118104735.3741749-4-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_150545_132409_A6D9F4C0 
X-CRM114-Status: GOOD (  13.04  )
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

Hi Jacky,

On Mon, 2024-11-18 at 18:47 +0800, Jacky Chou wrote:
> Add a dummy read to ensure triggering mdio controller before starting
> polling the status of mdio controller.
>=20
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
> =C2=A0drivers/net/mdio/mdio-aspeed.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-
> aspeed.c
> index 4d5a115baf85..feae30bc3e78 100644
> --- a/drivers/net/mdio/mdio-aspeed.c
> +++ b/drivers/net/mdio/mdio-aspeed.c
> @@ -62,6 +62,8 @@ static int aspeed_mdio_op(struct mii_bus *bus, u8
> st, u8 op, u8 phyad, u8 regad,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0| FIELD_PREP(ASPEED_MDIO_DATA_MIIRDATA, data);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iowrite32(ctrl, ctx->base=
 + ASPEED_MDIO_CTRL);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Add dummy read to ensure tr=
iggering mdio controller */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(void)ioread32(ctx->base + ASP=
EED_MDIO_CTRL);

Why do this when the same register is immediately read by
readl_poll_timeout() below?

If there is a reason, I'd like some more explanation in the comment
you've added, discussing the details of the problem it's solving when
taking into account the readl_poll_timeout() call.

> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return readl_poll_timeout=
(ctx->base + ASPEED_MDIO_CTRL, ctrl,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0!(ctrl & ASPEED_MDIO_CTRL_FIRE=
),

Cheers,

Andrew

