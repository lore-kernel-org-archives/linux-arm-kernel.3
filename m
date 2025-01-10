Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4F4E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 15:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8hqtpx7uSmFFCBt4R+XArsWuILvupPoqhgNSuXM+dY=; b=F0iW52Km5x3K45fS33xSELgAjf
	FxXofrtgA8fkD5ipw6vR4U5+AUvcqrCIE2pqoaenEWM2p6QmxgoJ0mkIzFbmrs5JQ/NqsB5aTJjN4
	dhNATgiY6MriDZT9ZKN8TtQ3OBBiydjYOb4gaStI6BMlJSAUUgJC+5+1MDrijNAgfLyT7U/ytapjm
	s1K+PP9ZvZz+3AoBbkpFf8SjY7LrZrZyfGHmHSTAbtp1zmx5Hh/6xLBDm7dzdCGIk+CHPtGW8EOr0
	UlhEnBJvHnUTTELPrIgUBdEHzGbn7/xDlEKOspTdMODdlw4sUivzjmThX4B0waZVHlQKLVVojSxDe
	lCmFLuNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGvL-0000000FvCv-169r;
	Fri, 10 Jan 2025 15:27:47 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGb6-0000000Fnn8-1lfU;
	Fri, 10 Jan 2025 15:06:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CD1D1BF205;
	Fri, 10 Jan 2025 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736521608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8hqtpx7uSmFFCBt4R+XArsWuILvupPoqhgNSuXM+dY=;
	b=bM3aHv2eZDPIEogkHXuaz90KY+89c/SS6D88M5Wwse/oE9y22gsGc/f1A8uC8lhyczxePx
	Rb00zNoRl/Jqt4Rnx2w8AcwTkm4UgnSaR/HS4gHDeSMDpQTBSITwMoxgl5bMwlfDR7/2Ex
	4678QsL8tSDo270hZROIzDvS4dvPmSaDeww2Q2qXcyFoH/YdmcJiq6OWaXl/7F2wYSL727
	yhpchOJrpNEM7J52JVcWYn19Jz67QyEwTI9gquIRwE3+7wGP8GWRfXVZ+CnsGH511T/Ug0
	dK1IpVJOGgF/Nc85wZftpbWnToLYHGKcXdNY97F3DTjah4672ArjZoy9pk9bKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung <schung@nuvoton.com>,
  Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,  =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>,  Joel Stanley <joel@jms.id.au>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Raju Rangoju <Raju.Rangoju@amd.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <stlin2@winbond.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,
  linux-riscv@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  linux-rockchip@lists.infradead.org,
  linux-mtd@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
  openbmc@lists.ozlabs.org,  linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 20/27] spi: spi-mem: Estimate the time taken by
 operations
In-Reply-To: <c9043531-c733-4153-a814-79aab387883e@sirena.org.uk> (Mark
	Brown's message of "Fri, 10 Jan 2025 14:52:29 +0000")
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
	<20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
	<ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk>
	<87tta6ag5b.fsf@bootlin.com>
	<c9043531-c733-4153-a814-79aab387883e@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 16:06:42 +0100
Message-ID: <87y0zi908t.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_070652_721565_303A8CEE 
X-CRM114-Status: UNSURE (   9.62  )
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

On 10/01/2025 at 14:52:29 GMT, Mark Brown <broonie@kernel.org> wrote:

> On Fri, Jan 10, 2025 at 03:37:52PM +0100, Miquel Raynal wrote:
>> On 10/01/2025 at 12:42:47 GMT, Mark Brown <broonie@kernel.org> wrote:
>
>> > This breaks the build:
>
>> > /build/stage/linux/drivers/spi/spi-mem.c:580:5: error: conflicting typ=
es for =E2=80=98spi_mem_calc_op_duration=E2=80=99; have =E2=80=98u64(struct=
 spi_mem_op *)=E2=80=99 {aka =E2=80=98long long unsigned int(struct spi_mem=
_op *)=E2=80=99}
>> >   580 | u64 spi_mem_calc_op_duration(struct spi_mem_op *op)
>
>> Crap, that's a fixup that landed in the wrong commit (mtd: spinand:
>> Enhance the logic when picking a variant). I'll fix it.
>
> Please only resend that patch - the rest builds and tests fine in my CI,
> I'm just checking a merge fixup.

Ah, oops, didn't see this in time and rushed v3.

