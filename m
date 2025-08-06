Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196FAC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 03:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tr7NN2jphfR6xHA/UzGXZWi6sl0YOUmnWotym5mZwz4=; b=ewug3e3IHgE+T3PcyZIuNQpRsP
	DcXucFA/9kKe/lGV0RNtn4rEMnpH/NJjA7Wf669d7PJkIkgohI3zSitAsY05AVeVrw8g/0DW0jjuf
	qwW3HBs2ZWO6ARAwWbxWgMF9AWk82XYbMB1jtEe+mEGdtNpUvM92uwgOrFwY4yaKLS5EaUXw3omB/
	7sK3oc0FuKPm4vAMg4ip1mprGg5E2QLqpAsXGWEQP+bFv+dA19khWJPzmxf7WliRVQH52BhVawqY+
	XOzfYdp78GJCRo3w8H2qTeYBRoElZ8/49qz9AgMH8ltcqavFPtw6bFhPU40tZvKaIRfQy7TcKNKLa
	u8yq+JJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUTu-0000000ED9i-2gRb;
	Wed, 06 Aug 2025 03:06:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujURJ-0000000ECmu-2YPI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 03:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Tr7NN2jphfR6xHA/UzGXZWi6sl0YOUmnWotym5mZwz4=; b=w+3l+DsiNEdtl4SdPo25MfoSwx
	6zeqoaeDGmSxgzZ9JnskLH7Dz9SULlis8/dRT0QOqH/Y1EtVKBrEC3uQEsYfEYxYKm1c3ZEDnWwk5
	DHX5iBtN23GQB1oNZdi/GBgRSA0gned3RSnZrlzpkmj1vuZxQlxck5hyU2fafIu61at4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ujUR3-003qp3-Fc; Wed, 06 Aug 2025 05:03:25 +0200
Date: Wed, 6 Aug 2025 05:03:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mo Elbadry <elbadrym@google.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Rom Lemarchand <romlem@google.com>,
	William Kennington <wak@google.com>,
	Yuxiao Zhang <yuxiaozhang@google.com>,
	"wthai@nvidia.com" <wthai@nvidia.com>,
	"leohu@nvidia.com" <leohu@nvidia.com>,
	"dkodihalli@nvidia.com" <dkodihalli@nvidia.com>,
	"spuranik@nvidia.com" <spuranik@nvidia.com>
Subject: Re: [PATCH v12 3/3] clk: aspeed: add AST2700 clock driver
Message-ID: <e53edafb-bfb0-45ab-8224-7b393af4e0ad@lunn.ch>
References: <20250708052909.4145983-1-ryan_chen@aspeedtech.com>
 <20250708052909.4145983-4-ryan_chen@aspeedtech.com>
 <OS8PR06MB7541E7FCB367AE610EBBE121F249A@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <CAOO6b=tEigCRXZ47BMgsTvxiZdO0P32+jFhQ313O044VALgaWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOO6b=tEigCRXZ47BMgsTvxiZdO0P32+jFhQ313O044VALgaWA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_200341_646792_318B6B6A 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

> > > +static const struct clk_div_table ast2700_rgmii_div_table[] = {
> > > +     { 0x0, 4 },
> > > +     { 0x1, 4 },
> > > +     { 0x2, 6 },
> > > +     { 0x3, 8 },
> > > +     { 0x4, 10 },
> > > +     { 0x5, 12 },
> > > +     { 0x6, 14 },
> > > +     { 0x7, 16 },
> > > +     { 0 }
> > > +};

> > > +     DIVIDER_CLK(SCU1_CLK_RGMII, "rgmii", soc1_hpll,
> > > +                 SCU1_CLK_SEL1, 25, 3, ast2700_rgmii_div_table),


Historically, aspeed has got RGMII delays wrong. Could you confirm
this has nothing to do with the 2ns delay needed by RGMII.

What exactly is this clock used for? RGMII needs 2.5MHz, 25MHz and
125MHz, which none of these dividers seems to provide.

	Andrew

