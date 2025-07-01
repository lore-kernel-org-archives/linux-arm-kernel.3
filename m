Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BF5C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prNrXolkjfaud3bDDiSuiyyGfRfPFPDh9Iys4bsEwLk=; b=R3x1LNEFIVS/AuG9VF7bpI9lYK
	U+I0ORcNrdmQyFmIah4TaKN/CjaiRDSUXpwqUvRVIIETdAnmFCOD1De1mt5q45WRZfrpvuZqjdkOx
	VYuuyfncPlCbliSddtiBAAJWSpVN7jmMZMwsDZGDwR24jk0STitCUIpyO8y9NlCYEfOFu82ur+9Hl
	TsTEN4G8nQOyZfuQut5uEzn5yS6um7QMEqDZ3yZI1IuPU17IGmB302HT1/5BS1EJxnNSLLQw4OcAP
	DVYp8NE4J7Qutfno7JVJyMKcnYvHJUtBUYEsQwCA/0lJ6gTmQleI4RixndcMR2/E94zBxAuvBCeOk
	AsIWnjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdmU-000000061pm-2Jph;
	Tue, 01 Jul 2025 16:24:27 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWc8e-00000005kJ2-2v6H;
	Tue, 01 Jul 2025 14:39:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3C91205B2;
	Tue,  1 Jul 2025 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751380750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=prNrXolkjfaud3bDDiSuiyyGfRfPFPDh9Iys4bsEwLk=;
	b=kOYb2rUxixLfppnTRvGBVq741Tu4dTNQQ/xfJWB/FikMaWEB7QW3H1NB6sI7ZgSbPp7SUX
	81/jelmC1MZn0M0e5aTZpZZiZrQmZ6KXAIilp3MLnnLfsqjApojvbTsyZzwWNwUf04o8H6
	a46No/sjlgOzlA/V7TLEDpXLThDU64bxCh0RejAroK5fDMVFzDljDpihYNkLJj6JiR/d/0
	k1QsbxuQYM53YsqUH+xfpKe42PiSzbkbTQHj8fA66tlQdvCQJvTiDudpDNTubV2FzCeNgi
	4PqYs4PE5cOqz6Crbb5q2lbB9TLvvO6xd09cIP5yNsnIyHX0H1H8V2TCiPrT8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: atmel: Respect tAR, tCLR in read setup
 timing
In-Reply-To: <20250701133333.3871085-1-alexander.sverdlin@siemens.com>
	(A. Sverdlin's message of "Tue, 1 Jul 2025 15:33:28 +0200")
References: <20250701133333.3871085-1-alexander.sverdlin@siemens.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 01 Jul 2025 16:39:07 +0200
Message-ID: <87ikkcou0k.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheekkeegvdfgudevueetfeekuddvhefhgeekheduueejudeukedtveejkeehteeunecuffhomhgrihhnpehmihgtrhhotghhihhprdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvghrughlihhnsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrt
 ghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_073912_871524_90869E30 
X-CRM114-Status: GOOD (  15.38  )
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

Hello Alexander,

On 01/07/2025 at 15:33:28 +02, "A. Sverdlin" <alexander.sverdlin@siemens.co=
m> wrote:

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> Having setup time 0 violates tAR, tCLR of some chips, for instance
> TOSHIBA TC58NVG2S3ETAI0 cannot be detected successfully (first ID byte
> being read duplicated, i.e. 98 98 dc 90 15 76 14 03 instead of
> 98 dc 90 15 76 ...).
>
> Atmel Application Notes postulated 1 cycle NRD_SETUP without explanation
> [1], but it looks more appropriate to just calculate setup time properly.
>
> Without the fix we've measured -2ns tAR delay (REn asserted before ALE
> deassert!); with the fix -- 60ns (subject to module clock).
>
> [1] Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU3=
2/ApplicationNotes/ApplicationNotes/doc6255.pdf
> Fixes: f9ce2eddf176 ("mtd: nand: atmel: Add ->setup_data_interface() hook=
s")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Please add Cc: stable

> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/n=
and/raw/atmel/nand-controller.c
> index dedcca87defc7..844df72f45063 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1377,14 +1377,25 @@ static int atmel_smc_nand_prepare_smcconf(struct =
atmel_nand *nand,
>  	if (ret)
>  		return ret;
>=20=20
> +	/*
> +	 * Read setup timing depends on the operation done on the NAND:
> +	 *
> +	 * NRD_SETUP =3D max(tAR, tCLR)
> +	 */
> +	timeps =3D max(conf->timings.sdr.tAR_min, conf->timings.sdr.tCLR_min);
> +	ncycles =3D DIV_ROUND_UP(timeps, mckperiodps);
> +	totalcycles +=3D ncycles;
> +	ret =3D atmel_smc_cs_conf_set_setup(smcconf, ATMEL_SMC_NRD_SHIFT,
> +					  ncycles);

Nit as you'll need to resend anyway :), this can be on the previous line.

Otherwise lgtm.

Thanks,
Miqu=C3=A8l

