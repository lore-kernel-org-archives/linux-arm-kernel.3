Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEE0C79F87
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1mdNZgtA3Wo9M3mbbKh8ENXPA2Gg1HukmOKrHjLDus=; b=mNykSWbzwDQoArtMeeC3kST/fO
	Pl2518f0Ey9LSVajIlzwvMu9yt4XdggnRN0kHnHGb6W5yKTl6KUMXhFCON4/8+jTngbJfx/8jKeGS
	HHqXbPzcRITi/HCEp6axQVJ7j1CtKoRPToOXhkOidYkXgiUAT2jvV/xVC03JtrICprc5Y2tEbxZy/
	x8NEmK6c5sy/YuAkE6MV+Kbem0cXvVpCzNG+Sy2v6jSqx2GLBcRvrUZGcfIOWrIrQBASg2WMZn4NP
	5eBRZgYiLP3tjyYY+JaD5DmXChZvoejyxCttSvPS3t2hgl4jMm4TDYt5f8SO32Zsz8K+zPnBaTAJA
	/ZhqWVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VnO-00000002WF7-2zuA;
	Fri, 04 Sep 2026 15:25:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VnL-00000002WEB-3tpo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:25:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 198324E41511;
	Fri,  4 Sep 2026 15:25:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1A9B6057F;
	Fri,  4 Sep 2026 15:25:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9AFA11C78288;
	Fri,  4 Sep 2026 17:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788535532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v1mdNZgtA3Wo9M3mbbKh8ENXPA2Gg1HukmOKrHjLDus=;
	b=lL/IgV+0tG/cxZy8W9MtDYgTLdFCSAp1pFWMdy+8VxRNCLS4Vqy99w5bAWZeBgC3WbAsI7
	blqA35NXsvUgoOba39w9A/drk2o/XnufvFUm9qtEvwZXyH89zuMxBGlRxzma5+DIc9I0a5
	crtENZZ1VMCcqNVBZnWYcIsIoDuR8wemKMmeTDXSo3pcIyQs+lycebfVFiqER1eGd5OFLi
	ipLCu6FVfYyFP+2mnr9kuKljFNdy8O94U3NXYGsF4sOqqFX4o01wZvJ4VLNxQO0ofi0usj
	rIakqMFrwl4aLVWgMBuzRUXFlIHKwH3dhBvQ7dgT3YvY5rpqeSvsYz80wEq/hg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  stable@vger.kernel.org,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: sunxi: reject invalid ECC step sizes
In-Reply-To: <20260811060651.227431-1-james.hilliard1@gmail.com> (James
	Hilliard's message of "Tue, 11 Aug 2026 00:06:48 -0600")
References: <20260811060651.227431-1-james.hilliard1@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 17:25:28 +0200
Message-ID: <87ecf911jr.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_082536_107794_00D0212A 
X-CRM114-Status: GOOD (  16.83  )
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

On 11/08/2026 at 00:06:48 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> ECC maximization forces a 1024-byte ECC step and divides the
> available OOB bytes by the number of steps. A NAND with a smaller
> page therefore produces zero steps and a division by zero.

No, steps cannot be < 1. If they are, it's a bug that must be fixed.

> An explicitly configured ECC step which is larger than, or does not
> divide, the page also produces an unusable step count before the NAND
> core can diagnose the configuration.
>
> Validate the step size at both points where the driver derives the
> number of sectors and reject invalid geometries.
>
> Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 45ccbce91551..ad314c0e30b2 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -2032,6 +2032,15 @@ static void sunxi_nand_detach_chip(struct nand_chi=
p *nand)
>  	sunxi_nand->user_data_bytes =3D NULL;
>  }
>=20=20
> +static int sunxi_nfc_ecc_steps(struct mtd_info *mtd, unsigned int step_s=
ize)
> +{
> +	if (!step_size || mtd->writesize < step_size ||
> +	    mtd->writesize % step_size)

I don't get it, mtd->writesize < step_size is conceptually
impossible. If that happens, it must be fixed earlier than that.

> +		return -EINVAL;
> +
> +	return mtd->writesize / step_size;
> +}
> +
>  static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t=
 oobsize,
>  					int ecc_bytes, int nsectors)
>  {

Thanks,
Miqu=C3=A8l

