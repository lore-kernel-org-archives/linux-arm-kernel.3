Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4865AC83030
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 02:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22aHBNm2PspGv0EtsJjFnQgJ+VWdLmQz4v9JsyG/8T0=; b=uNhS4dXFDkOYMcZECdMUEqOiD2
	HESisCxqmhH+EY+1s0kHyxPNiVY0e1AhH9Rwevl9yUEazrXoYjYgYarO6B1tbFAhwpZrRivX9VPUD
	lJQlWqtrfr5ROMOqi7hOBM/mnlpA/W9rxH4eIX6jrxTP4CYTh2NcpYxP4jn2v6lpXRrVlv76r9hCS
	xEFxrwRnJkDwmVm3bvh/9SaLL5+vHAJFG04lsmal8tYSVgVTjRX7/oTuTfslb1U6sSauMrsEsKYyE
	uPgUyL1cZ5kQFupxZ7G6EyQriX50WrFv43Gi+5XCFpW3rr2AMeY0CXTUcbcH6Jzk/wax67e26Q1aY
	4s0ICF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxsN-0000000442a-0nbk;
	Tue, 08 Jul 2025 02:16:07 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxja-000000042Mc-13Tz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 02:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751940420;
	bh=22aHBNm2PspGv0EtsJjFnQgJ+VWdLmQz4v9JsyG/8T0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HrxfvQZMQqxlV3pXxRhc8vFKhJqUddUqywz7ltue+x0o9avwg4/C/7Tyu2+x8F4+Y
	 uLSwX3Soo59Ol+gx+Sl2/YWPD0VqA1iXFh89OzNL3I1wZd2G6Iyza4EkoQDnZNhw71
	 CPF4OhNGGJJno0BrvTmasL+ExIxwNKGS1rNFAV459k2bOlMBvkBQZbUEV/Em19/nnr
	 2IBpFcdfreG7UHRahfoXaFWMAYJ8NcTW97QpghRjVsMZuaC3X54FL6q70XNGsMZJuc
	 ksk8J/tDPelZVLBHwgMdHzanvSFHN7eikJMJP5P3DqigxlvntjJbs0Q3YgJGoCDOuL
	 RGiqDY0xEqS3A==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 08D9A6ADE6;
	Tue,  8 Jul 2025 10:06:59 +0800 (AWST)
Message-ID: <6ae95d064de0c1b6333c234e461eae3e8da80168.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 09/10] soc: aspeed: lpc-snoop: Consolidate channel
 initialisation
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>,  Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 08 Jul 2025 11:36:59 +0930
In-Reply-To: <20250704171315.30300f59@endymion>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	 <20250616-aspeed-lpc-snoop-fixes-v2-9-3cdd59c934d3@codeconstruct.com.au>
	 <20250704171315.30300f59@endymion>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_190702_478834_FBF4611D 
X-CRM114-Status: GOOD (  17.76  )
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

Hi Jean,

On Fri, 2025-07-04 at 17:13 +0200, Jean Delvare wrote:

>=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> > =C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c | 51 +++++++++++++++++-----=
-------------
> > =C2=A01 file changed, 24 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed=
/aspeed-lpc-snoop.c
> > index 8dbc9d4158b89f23bda340f060d205a29bbb43c3..9f88c5471b1b6d85f6d9e19=
70240f3d1904d166c 100644
> > --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > @@ -294,12 +294,21 @@ static void aspeed_lpc_disable_snoop(struct aspee=
d_lpc_snoop *lpc_snoop,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfifo_free(&channel->fi=
fo);
> > =C2=A0}
> > =C2=A0
> > +static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct aspeed_lpc_snoop *lpc=
_snoop =3D dev_get_drvdata(&pdev->dev);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Disable both snoop channe=
ls */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_lpc_disable_snoop(lpc=
_snoop, ASPEED_LPC_SNOOP_INDEX_0);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_lpc_disable_snoop(lpc=
_snoop, ASPEED_LPC_SNOOP_INDEX_1);
>=20
> For consistency with the probe function, I think it would make sense to
> use a for loop here as well, instead of hard-coding the channel number
> to 2. That way, no change will be needed if a future device supports
> more than 2 channels.

You're right, but for now I'm not bothered by it. I'm going to leave it
as is, as the motivation for the loop in the probe() path was to
consolidate the logic required for both channels. This one is an easy
thing to fix down the track.

>=20
> None if this is blocking though, so:
>=20
> Acked-by: Jean Delvare <jdelvare@suse.de>
>=20

Thanks.

Andrew

