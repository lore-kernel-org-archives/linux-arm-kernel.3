Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A492AE77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 20:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkVAr0MeH9WmZMo+zvBWiFR2LY+le9PAg2sTPayLJZI=; b=syNtAHsyuT0fPfVsG1SXqHZb4X
	iD4iWR0f47bp/JGbuNr5ca7krx5Y7S8Rf4E/T9kVN0POPXDhKbcf1zO80VeOpvtbk2n1zzDmOMMPp
	PqYET1N+bEwvnFi8qRBPM0srnVp/lLXsHrKlpyvQjazecNjNb5JFQPuDZ6PAmCMaJKEvN6Y82T82M
	NhNFKReiASB3M5MpW7hX9TITEVWPpl76lcxCgRFoe7Skv/cPNi8BCwAlPzsc0SBTq3LJu7WbbWCb7
	G8aMgyt0QqU0yhLiF0rZoJq9nRTXqOrpmOrgwDr7p2hOsm9Tuxdw4gxy6yxvpfsDNNsU+a4dISQGl
	wseyqsfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIvde-0000000Dl8e-43hr;
	Wed, 04 Dec 2024 20:06:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIvcd-0000000Dkz4-2jOW;
	Wed, 04 Dec 2024 20:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 432E9A40405;
	Wed,  4 Dec 2024 20:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38E5C4CECD;
	Wed,  4 Dec 2024 20:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733342717;
	bh=RldED8HMCKySelxt0TW6GW/GL2Ep4PQFNk69MJ3zo1Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=q6W5BzkjvXaHTIrnZTdGD5iCwNNhaZN7gMTJBXt+HRzr29Z5/0WmVdr+g1CES8myA
	 +q712arDusrNfXCgjpVAYXHdiYMfkQXKHqnSbKpAgis9/s7oY/zKWz67tc/1eStlFd
	 A276u4hxM3e9zNyp2hDsfkIpvTCWQB7An+sYPJ3qz8GcVOvPPk5+3r98KXm58QxA4y
	 DelmbPkfLUV9+eJshoeBO6HMu88EgXilXtU45V47pWiGHFhjn1PYrTjabDqg04/BeY
	 cOuTi45bsVVavblkC9rWBptE19kaBJ8XUBcfEWJYUcSJUWWZsDpJID7CnIKF9draQA
	 w8w5IyC/lQAlw==
Message-ID: <4e87e30244204b4e71f9b0f630171a40.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jfrn3l615.fsf@starbuckisacylon.baylibre.com>
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com> <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com> <1jy1131kxz.fsf@starbuckisacylon.baylibre.com> <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com> <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com> <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com> <df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org> <1jr06pkof6.fsf@starbuckisacylon.baylibre.com> <37b656cc8272552ba07c93c5a9a59641.sboyd@kernel.org> <1jfrn3l615.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
From: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 04 Dec 2024 12:05:14 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_120519_815948_12A15DAF 
X-CRM114-Status: GOOD (  24.13  )
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

Quoting Jerome Brunet (2024-12-04 09:19:50)
> On Tue 03 Dec 2024 at 12:15, Stephen Boyd <sboyd@kernel.org> wrote:
>=20
> > Quoting Jerome Brunet (2024-12-03 03:15:41)
> >> On Mon 02 Dec 2024 at 18:53, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Is the half finished migration a problem for this cycle? I was intending
> > to send the revert later this week and try again next cycle.
>=20
> Not really, with the fix you applied. There is just code present in
> reset that should not be used in its current form. I'd prefer to
> sanitise the situation sooner rather than later.

Alright. Let's just sort it out in the next few weeks for the next merge
window then. Maybe you can just do it once then and get auxiliary bus
maintainers to ack the patch so you can merge the helper locally and use
it in the amlogic clk tree.

> >
> > Sure. You can make devm_meson_clk_rst_aux_register() use the same
> > signature as I proposed above so that it's a one line patch later. And
> > definitely drop the imply RESET_MESON and depends on REGMAP part. Maybe
> > you can put it in the clkc-utils file?
>=20
> Sure. Few things I'd like to clarify
>=20
> * I tend think like Arnd, platform data will be needed eventually. Not
>   sure having 2 functions, one with the param, one without is really
>   worth it. We could just pass NULL when it is not needed. It is not
>   uncommon. Would it be acceptable ? (for the generic helper, the
>   temporary solution does not need that for sure)

I'll defer to the maintainers there. I don't feel strongly.

>=20
> * You mean (meson-)clkc-utils.c ? I could but that would add dependency on
>   the auxiliary_bus for clock controllers that don't need it. It is a
>   minor problem really that I could just ignore.
>   I'd rather keep this helper separate if possible.

Ok, no worries.

>=20
> * Why drop 'imply RESET_MESON_AUX' ? I would still like the
>   COMMON_CLK_AXG_AUDIO to 'strongly suggest' RESET_MESON_AUX, with
>   dependency problem sorted out.

Because eventually you'll lose this Kconfig. I guess you'll want to add
that to the driver Kconfig option to maintain "strongly suggested".

