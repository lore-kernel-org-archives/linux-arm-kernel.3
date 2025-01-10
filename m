Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44974E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqHOTtKrS2nK6owEMQCN+3bics3pst072/Bpdc2sk1Q=; b=du988VI2iOqzzeJwWylq1qfJG2
	PhBbzH6JvEKyIs9Uq47lTdHTHk3LhGXGRVwz3gQn2h73HB/k5sFMjnXmrGfisCxQAbjUCylxyMECx
	39VNslcMiTq8WMaZMKHtqMWo3c8xHaj+5X7/H6HI1Jbp0EfslsaRifj1IWpLtS2EiQU7IO0TCBKx7
	/fllksI6A8NlX8HGN0r8ah2Rv0qBNxgVxpmZltHIu619UTxTJDdb6nnoy1OfEuii5vivZg6LF4Ldv
	3SPBDpySgZ93D28Kr7h9IwIlKEM0CMUnwzotqmGQM1zeNjE4yjYHoThZ7EANqadw3C/4XGRq5lLIP
	0yzpHUoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGAR-0000000Ff6e-1VG1;
	Fri, 10 Jan 2025 14:39:19 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWG9D-0000000FeuJ-1Npt;
	Fri, 10 Jan 2025 14:38:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 980E5C0007;
	Fri, 10 Jan 2025 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736519880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AqHOTtKrS2nK6owEMQCN+3bics3pst072/Bpdc2sk1Q=;
	b=m/PU3jSVOUgUfNeqSsjZfGTt+SAIExnswQ4nJ1ydWLAlAqDyJgvFnyk8HKoBD9BUxG16hy
	Kxy9n0Cwf1Hc7YihZi5k5w9nwTsGIYKn4FnnKxNF0C/9/xC2AA8aQ8o73ouUrLBlKrfiyx
	AyjzfEzOaOEu/KSVKY/wAa4K7WUjTk5cuP80r3I36oJZfq/WPge2eyw/Q2gARWb7KL+upy
	Ls5pf4WYuuJ+rGBVEyY/yx0BMp8H7ueg0TrVzxvdSUOcEZM3LoiSsfBxWSFXKt701XzzPJ
	/SMNBlfNJ7hqRZFrr0ROsFwE2/gIY4flK+fkxxJW4GO12ujEoN3r4OMJKmWnZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>,  Serge Semin
 <fancer.lancer@gmail.com>,  Han Xu <han.xu@nxp.com>,  Conor Dooley
 <conor.dooley@microchip.com>,  Daire McNamara
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
In-Reply-To: <ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk> (Mark
	Brown's message of "Fri, 10 Jan 2025 12:42:47 +0000")
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
	<20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
	<ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 15:37:52 +0100
Message-ID: <87tta6ag5b.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_063803_779417_D6971DAF 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Mark,

On 10/01/2025 at 12:42:47 GMT, Mark Brown <broonie@kernel.org> wrote:

> On Tue, Dec 24, 2024 at 06:06:05PM +0100, Miquel Raynal wrote:
>> In the SPI-NAND layer, we currently make list of operation variants from
>> the fastest one to the slowest and there is a bit of logic in the core
>> to go over them and pick the first one that is supported by the
>> controller, ie. the fastest one among the supported ops.
>
> This breaks the build:
>
> /build/stage/linux/drivers/spi/spi-mem.c:580:5: error: conflicting types =
for =E2=80=98spi_mem_calc_op_duration=E2=80=99; have =E2=80=98u64(struct sp=
i_mem_op *)=E2=80=99 {aka =E2=80=98long long unsigned int(struct spi_mem_op=
 *)=E2=80=99}
>   580 | u64 spi_mem_calc_op_duration(struct spi_mem_op *op)

Crap, that's a fixup that landed in the wrong commit (mtd: spinand:
Enhance the logic when picking a variant). I'll fix it.

Thanks,
Miqu=C3=A8l

