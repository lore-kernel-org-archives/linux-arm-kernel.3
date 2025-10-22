Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC75ECCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDRCUkMoCDby5S/aZrDjp1VXkak+fQdoG5RdkGXcB4Y=; b=NVQCgF/RYwXbX1VWcS4GUXZ/r2
	cQzzuNCkays/u+ejmfo/xf/I26v2Jh2ktq1fFEr8m3u+HqJ/6yrIB7mgDqljVjeM2K7tQTMvVObEF
	vGUdJET/t8SF8sIkHW5TeTAr/IYs+SzOsDp6xrfOmSRoHjJv5Bdbh091OhdAez1BCopoLZ41PNTzU
	jE9qqUkJ8IvDRXhSl2H7XNPbPI6tjU3pPsGU2Z9nH6PBLbQaOqTxorFWOggWB8tlKH83LUtTQtIeC
	tp8p/qhpd3K9XyXZxN95glhKQVRJrG0jLXxtUqBwDKna3AI7DNhKvBF6eYRBP2yzPTC0EeKTNPdrI
	dTLoMoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUk3-00000002B2J-1Fpb;
	Wed, 22 Oct 2025 09:02:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUjz-00000002B0i-2gfo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:02:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 65E831A15CD;
	Wed, 22 Oct 2025 09:02:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36F36606DC;
	Wed, 22 Oct 2025 09:02:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00CFE102F2424;
	Wed, 22 Oct 2025 11:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761123760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oDRCUkMoCDby5S/aZrDjp1VXkak+fQdoG5RdkGXcB4Y=;
	b=N3c3SpV57p5/GKS5PSw7jmNA1udiZ4jXASbHWVwRfwDneehJCGrqoNujIJH7dGUKy0P8SW
	Gwrpaj8sBhW97sO2TJlj8vA7fDjThqucjwNAkTfRgMBJkr8p00UXfw91V42W6vvZ5JfYG7
	/JcxDVomjRkPhkCUi0EjhpriqPlXzOYXf7jxDf/1NgdjYTNRQTC49WHgvkdL2eG1X9H7uy
	AHbENFrT5qNHYN54ydrdcpWeFSohXnMloWLAIJPKC6d0LrS9ldokxcFZ5I5ZRpgMDEtssH
	8QdrA8u6UmMSsYRO7b6XVxk3mYwdc6y3gp651iSnUuhM67xdB46zehcfJ1INfw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Johan
 Hovold <johan@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/15] mtd: rawnand: sunxi: rework pattern found
 registers
In-Reply-To: <20251020101311.256819-6-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Mon, 20 Oct 2025 12:13:01 +0200")
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
	<20251020101311.256819-6-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 11:02:36 +0200
Message-ID: <87plaftikz.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_020243_804445_5288CF77 
X-CRM114-Status: GOOD (  13.66  )
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

Hi Richard,

On 20/10/2025 at 12:13:01 +02, Richard Genoud <richard.genoud@bootlin.com> =
wrote:

> On H6/H616, the register ECC_PAT_FOUND is at its own address, and not
> part of ECC status register.
> So, introduce the pattern found register offset in sunxi_nfc_caps, along
> with its mask.
>
> Also, introduce a non compile-time field_get() because FIELD_GET() and
> u32_get_bits() don't work with non compile-time constant.
> https://lore.kernel.org/lkml/cover.1739540679.git.geert+renesas@glider.be/
>
> No functional change.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 36 ++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 8f5d8df19e33..4cfb5d3e9c06 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -29,6 +29,9 @@
>  #include <linux/iopoll.h>
>  #include <linux/reset.h>
>=20=20
> +/* non compile-time field get */
> +#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) -
> 1))

I see there are already 26 users for this, let's hope it gets merged
soon and this one dropped.

Not a blocker for me.

Miqu=C3=A8l

