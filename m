Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD259CDE003
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=425jpoUA3Tt1bWmkrOSFNWHphFjZunbpgGFQD4aSpdk=; b=xYljNkTwUugOd4Jcc/EIN6Paox
	5AoyeKAfoaqHZFiUombPv79k/OUuOM0+M3ovI91VcWjK+eVS5R5yJO8i/jwtc0Oa0gQinBpThj0Tl
	h4VDqVh+GpTSiBJ8OVbxa/PSAXQBT7YDnGBiwSjUMl4MH6LOKKUF0pS9Xm7girMKjA7biyljvQbFG
	KgOTgNpi6pcGgVNXP1iGySVikvsak4xkQdkzdEmtjnA3UA6fE2CGGBqfEZ6hVY85OvDKpWYK0K825
	+krZHM9FbkhymJQ6YdHXP6JE3HLbHJHJsoxlIBM67oej5Hrt/DoXPGrPTvu1ywXKPhonaTfv5S/yw
	H3ZojTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM37-00000007hXF-0azh;
	Wed, 24 Jun 2026 11:45:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM33-00000007hWW-0i0B;
	Wed, 24 Jun 2026 11:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=425jpoUA3Tt1bWmkrOSFNWHphFjZunbpgGFQD4aSpdk=; b=HwpDwOU/UQBrzXup3v/4wCO3K7
	zCJ7IIJaNRAveaToemqT9Rm33qC2yoq6kgTe2qtMtHgKZqPa4v07jlFRW4YuHCc5FerIo7rjalVAo
	mLceUYW8JZDM3ObrEFORrFNx8WeJS86BFf7n0D4HoZfGB74CH7p3GXWsWxbomDFIRm/hGpJ6k/c8X
	AcEzqVQPcfq7lbf9EnV/MwaW8Hr/GSnVw85NCnZxwDFkHv6RVtGoTuW77yfA9FCVceAaYve9jWY/d
	+mMFYaGajGkDVtAwwhK1t1tnE4Vaage37RZPRnx4ZYFlkUatkgW4UCiRG4ij0WZwJLq+BbA3tjSV+
	CRLniJYg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Daniele Briguglio <hello@superkali.me>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK
 output to IO
Date: Wed, 24 Jun 2026 13:45:22 +0200
Message-ID: <2008560.6tgchFWduM@diego>
In-Reply-To: <DJGM4D19H31O.4I5N79CG5Z8C@cknow-tech.com>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
 <20260623140958.4181297-1-hello@superkali.me>
 <DJGM4D19H31O.4I5N79CG5Z8C@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_044542_068762_05CB3AB0 
X-CRM114-Status: GOOD (  11.42  )
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

Am Dienstag, 23. Juni 2026, 19:42:05 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Diederik de Haas:
> Hi,
>=20
> On Tue Jun 23, 2026 at 4:10 PM CEST, Daniele Briguglio wrote:
> >> So IIUC that means I'd be testing both variants.
> >
> > Right, that covers both: the mux path and the consumer path. Looking
> > forward to the results.
>=20
> Analog audio works on both. Plus with _TO_IO and LTS without in their
> respective DTS's. So I guess CLK_IGNORE_UNUSED works.=20
> Whether it's a good/right fix, I'll leave up to others.

It is the correct fix, as it returns the original way things worked for
boards not activly handling that clock.

So while boards should do that, this makes the clock-addition
backwards compatible.

Care to send a patch for that change? :-)


Heiko



