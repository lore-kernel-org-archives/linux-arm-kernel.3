Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC94CFC27E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 14:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGIzUaLaZRVrSbPfHE//yeEGilVOdLZVqcPFbYg9Y+4=; b=VUu73D4uATcrN0VQbZsmGBwauO
	HNCMGdcgVQhzpptPpEUgQX2Udh62j8tV07l99fUPahaTWoeuePMxPaECVabTMqy+EGZ6PCRR9iSUj
	RBbv9bsSB4sD2lMpWnlSHlbqWD/vyfspDKz7baex1OqY3vY1RoCS1hfze/Oc+qffMM6fZiPbWsF3M
	BFFx7HKTCg7/zJbUnyDXKoG8jVGAMOgeZWW/y2+3JxqwL93RBcnsKXUnPWMHtbmFg29qyDsQx82BF
	HgWQDVIxcDSJwp7st+phwp4k2a8SD0HHYRYnCZu+2KVjImQQCWkL91bkIR3ZtmM139rHbq+Uoyq+c
	xqFZMR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRvn-00000008VFw-0Iaw;
	Fri, 21 Nov 2025 14:16:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRvm-00000008VFT-370d
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Nov 2025 14:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XGIzUaLaZRVrSbPfHE//yeEGilVOdLZVqcPFbYg9Y+4=; b=Q8IiuyZVEwRgv616RbQvioU0Wh
	qXJRyy4MDhbzyrchmt6kzHa8TDzsHoJABNyW9ONV9y3ys47PcHvbrEHLLBCRNhiMubtzMFA3pyjaK
	p12dTZyJO01OM8S8vB2Gxdz14VvjwN5o+gikpOy2h9MaFZ8M1qZNvXzPp7MBov/ysmsmsa2BaHYEr
	J+aF5ppBAEgx1pAlTBFtttd9i+/ObxZUGUamtuIRErc33jE/XQO8wkMSEDShyzI0wchhJg2X08ZEa
	WT8KVlUn+FKdHBYGy+c2hFZOVSmz4v2muyZkKq7KvDAAjNCN0g0kHyeILZ6K24GakGhBsiBYcHHN8
	15QHHgNg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMR44-0000000GwIR-3T2K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 13:20:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1CB9A4E41831;
	Fri, 21 Nov 2025 14:15:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC77A60719;
	Fri, 21 Nov 2025 14:15:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0284103721B2;
	Fri, 21 Nov 2025 15:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763734555; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XGIzUaLaZRVrSbPfHE//yeEGilVOdLZVqcPFbYg9Y+4=;
	b=Jpa475cjmBN/rq5RJWqpN3qlEofCtV5t4+twhUjga30DLpkwBlxrqi2Y86TAfN3e8h5jeM
	ts6fF10DTZvoLIJJyQk1Y63s1KfDIQV376h46WE2yVD/AQFIDZ9KMWNVFVOHXXTMy5VyPa
	fsVUZ4J2E9uFpG55jUYNS8E23WsWWRfNuZXq3U0Ezm4HOqzIl7cDOUqZW5Io5TEfw/sHAC
	v3pOmxEZF4PfU6ffqdv4fXUOhWHhsva+XYxGMz08HDM3kEI415zyleuTInogCy52CgGAn3
	x/T4pFyU6+gtJ8Br+f/AHSn7Vpnjf1yuSbf4SDw0Sda4xXf4TgU/5zpUlfHBBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Russell King <linux@armlinux.org.uk>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mtd: nand: atmel: Defer probe if SRAM is missing
In-Reply-To: <20251120-at91-probe-v2-1-8c8592f02e8e@kernel.org> (Rob Herring's
	message of "Thu, 20 Nov 2025 15:37:50 -0600")
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
	<20251120-at91-probe-v2-1-8c8592f02e8e@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 21 Nov 2025 15:15:51 +0100
Message-ID: <87pl9bzd2g.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_132040_936398_366843F3 
X-CRM114-Status: UNSURE (   9.85  )
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

Hello Rob,

> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/n=
and/raw/atmel/nand-controller.c
> index 83ba4ebd02d4..e60998eb754b 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -2306,7 +2306,7 @@ atmel_hsmc_nand_controller_init(struct atmel_hsmc_n=
and_controller *nc)
>  					 "atmel,nfc-sram", 0);
>  	if (!nc->sram.pool) {
>  		dev_err(nc->base.dev, "Missing SRAM\n");
> -		return -ENOMEM;
> +		return -EPROBE_DEFER;

I am totally fine with the idea of probe deferral, however I think the
policy is to avoid making noise when this happens. The dev_err() call is
no longer relevant there. You can either lower it to dev_dbg() manually
or, at your convenience, return with:

   return dev_err_probe(nc->base.dev, "Missing SRAM\n", -EPROBE_DEFER);

Thanks,
Miqu=C3=A8l

