Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00989D358D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 07:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HC5tOqcEOO2h2Sdyxk8M1xH/nqYlQmmp4owBkWQ4MQo=; b=V3OzlIL5JecTD4FKkrBFwwGt7P
	3l8q8gIF7+pVCh9fH1kymIK2NPJBkaczghDCH/+FbAJX1h12IkKlU7n0lAvtMyW0N6nKV943aJzCu
	OL/768CcWXYrWagJ3WErclENo4tczWwlhK8Ln9nB4k4xL+cIHl+IpF9iTNg6drNgj/QtPdFjrREFu
	k71yd+E9QLXYW1+8Rx0EMQbhqwGU3UvodHZci2vEgNUIAxY9yw5akMJneOFSCgtCWJNQ18J5aZbo+
	SxzcQ8rkVVVZ/aN+XuiMSwsVAYriVQGC+vggu7aio0fO2+BX5rgGwasUIziCJqBC8b0TOCrLLwYl6
	8WXLLLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMET-0000000HNGj-2bAF;
	Thu, 29 Jan 2026 07:14:25 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMEO-0000000HNGM-2REl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 07:14:23 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=HC5tOqcEOO2h2Sdyxk8M1xH/nqYlQmmp4owBkWQ4MQo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769670839;
 b=EXwgN9UrzaL65SOiNb7digXDhFT6Hhys4kpI7IM4PVFclCFIPhhc+Ncotxvis6sgJbV7d7d/
 HdxAJBt+cZfWJStCjr6l21qp4eROHp7wrxDitadDCP36YBwyYsAYc7y8U0eCVIWEIReBPvofvGW
 95BRylV58zFSX6oUUSrGT46B+4iHKXVqQvwAoPQI8TUWENWe2msCTTDyvj06loUQ9QFt4yNKIRG
 ifhA1UeESDvfnO1gHpG61I8ziydicrpyFVZuj68ULM5YyueKBSGzSRLSIOeKtZaULeGKI4ZPiJ/
 Y03JOGGbkp7f25Lj9TsVYEQJ8BNm8j0mlW6GbxJfi5sLw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769670839;
 b=fYD9XrrVIm6k0Je/sfXrGF8PChdmghN4yF2sUSXkIgLhrR/SfIUYGecvd70Z+rIcXyOUTWeI
 aZABoUi5ycBdbCRR6rMj+YccTJpg7DxOxSvyNdkkDpYwn1E94B7AZ3FlUx9df678v1tbEUGBwP8
 h2J7Xj52nz0TRu4zOIw2sOmVey1sr02N/SdO4Kyptq5LHyOQgg6lM1jw9L4yqSa3CI9NfdHLQBk
 k5pUFYD5h5FdZZiCfyaSDjFYAOiEpfTSs6g8OpmcamAvvjAIu29Z7h8a1JoZvPl7iYZNQeS6Zdg
 /JfY17YZ1TGM2hl+h25r0VVVlvIWnWH+YZYxvUKA4T8Rg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 29 Jan 2026 08:13:59 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B4DB15A0742;
	Thu, 29 Jan 2026 08:13:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Fix a __clk_core_init parental issue
Date: Thu, 29 Jan 2026 08:13:06 +0100
Message-ID: <2257247.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <a4f87b4b-efce-4c8c-a523-69949935a096@sirena.org.uk>
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
 <a4f87b4b-efce-4c8c-a523-69949935a096@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4f1r3C4Tbbz2nHsK
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: b08f8c8389cf73d149848fbafa2d3aef
X-cloud-security: scantime:2.067
DKIM-Signature: a=rsa-sha256;
 bh=HC5tOqcEOO2h2Sdyxk8M1xH/nqYlQmmp4owBkWQ4MQo=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769670839; v=1;
 b=PFByG1CIVNoORaya5ff/CHIGgxuLzX16f3yxHx9Y0xn5n169tufMzefQmk35nq4eAhh/EkrZ
 wjkcjmvq7e0n7ROCVTU7P+FqUpqywkTpz9nsCEOeWFvP64QRnW5/32uElFhd3ru3iGTP/khdj5j
 AALDsEG7lnAK3mXW4TTP6SGRlPORbcT8DNry2KUSNxPz46IN7VqhrPry134dE6fJ/it7/oaKQLo
 p676OCyJDkv31+q7VOxemeCllSWOk9DjvL/ftCULZAE5Hrwv65pi3bnhqj1iLBdYen3lk4nIxuZ
 ZNgXSimPSuMCjUN+/u4kh/aRF9Jr26jO+S+3U/SO65Iww==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_231420_906818_5DE13894 
X-CRM114-Status: GOOD (  15.97  )
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

Am Mittwoch, 28. Januar 2026, 21:17:09 CET schrieb Mark Brown:
> On Wed, Jan 28, 2026 at 07:38:49PM +0100, Nicolas Frattaroli wrote:
> > Mark and Alexander, please test to see if these patches resolve the
> > issues on your boards.
> >=20
> > I expect the first patch to completely fix the problem on the Avenger96
> > (STM32MP1) board.
>=20
> This gets further but still fails on Avenger96, looks like we've got
> more clocks need work:
>=20
> [    0.513739] __clk_core_init: enabling parent pll3_q for spi1_k
> [    0.519521] __clk_core_init: disabling parent pll3_q for spi1_k
> [    0.525489] __clk_core_init: enabling parent pll3_q for spi2_k
> [    0.531311] __clk_core_init: disabling parent pll3_q for spi2_k
> [    0.537275] __clk_core_init: enabling parent pll3_q for spi3_k
> [    0.543101] __clk_core_init: disabling parent pll3_q for spi3_k
> [    0.549066] __clk_core_init: enabling parent ck_hsi for spi4_k
> [    0.554894] __clk_core_init: disabling parent ck=EF=BF=BD
> U-Boot SPL 2023.07.02-dh-stm32mp1-dhcor-avenger96-20230727.02 (Jul 11 202=
3 - 15:20:44 +0000)
>=20
>    https://lava.sirena.org.uk/scheduler/job/2413747#L593
>=20

I also got more clocks in the list, but it still hangs eventually:
[    1.453206] __clk_core_init: enabling parent audio_pll1_out for clkout1_=
sel
[    1.458095] __clk_core_init: disabling parent audio_pll1_out for clkout1=
_sel
[    1.464684] __clk_core_init: enabling parent audio_pll1_out for clkout2_=
sel
[    1.472174] __clk_core_init: disabling parent audio_pll1_out for clkout2=
_sel
[    1.478784] __clk_core_init: enabling parent sys_pll2_500m for arm_a53_d=
iv
[    1.485679] __clk_core_init: disabling parent sys_pll2_500m for arm_a53_=
div
[    1.492675] __clk_core_init: enabling parent sys_pll2_200m for m7_core
[    1.499233] __clk_core_init: disabling parent sys_pll2_200m for m7_core
[    1.505888] __clk_core_init: enabling parent osc_24m for ml_core
[    1.511924] __clk_core_init: disabling parent osc_24m for ml_core
[    1.518050] __clk_core_init: enabling parent osc_24m for gpu3d_core
[    1.524344] __clk_core_init: disabling parent osc_24m for gpu3d_core
[    1.530738] __clk_core_init: enabling parent osc_24m for gpu3d_shader_co=
re
[    1.537646] __clk_core_init: disabling parent osc_24m for gpu3d_shader_c=
ore
[    1.544655] __clk_core_init: enabling parent osc_24m for gpu2d_core
[    1.550945] __clk_core_init: disabling parent osc_24m for gpu2d_core
[    1.557341] __clk_core_init: enabling parent osc_24m for audio_axi
[    1.563551] __clk_core_init: disabling parent osc_24m for audio_axi
[    1.569863] __clk_core_init: enabling parent sys_pll1_800m for hsio_axi
[    1.576507] __clk_core_init: disabling parent sys_pll1_800m for hsio_axi

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



