Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8F4C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZcPDMkJ+pPommrt/oJ4Duet/sc/kc8Z/rAj63Jyev8=; b=2TMXryTSFQ5uVOCVHygE8fB64q
	9jWpR9+c+5NnlhWD065ALISiU3UG3JBWT2Yf41Fw1htbIrcJfzoF+7yee5KLYPF2BZW+f5++PQ/xO
	YPDAlDnQyH2bfb86+GhplcaoDFoGfUrNXlBXACHpoha3MLq+SWhBt9x1jlyZ6F7lo63chKHqefq68
	Bgml3XetHHugKJK7FnvCFVDii8w6NRhJdqFLV8q9R8tuhJ0tUQ3f2fkq1pg2K1hDFK4JpVnorclhh
	tP0qYjo5dIVdvaYkaykWe+BZZ7m8Avl79mClv4o44KHhGdTREwbw0OIpXK4SY+CezXlSw+hYP2iqy
	kY3dinHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujL3i-0000000DMp0-0nTQ;
	Tue, 05 Aug 2025 17:02:42 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJiK-0000000DA0u-14pq;
	Tue, 05 Aug 2025 15:36:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0464043913;
	Tue,  5 Aug 2025 15:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754408189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ZcPDMkJ+pPommrt/oJ4Duet/sc/kc8Z/rAj63Jyev8=;
	b=OJMRPIB0vCWnZyP1Ih+XiHQtPyCjsi7tq/VM5VkDiIGRKSWcw9OotSyUJDJTup6V/6SpTb
	9y98FQEJVax+Fl7XnbhVvcIAEuRmEjcbevuVs7G/YHtiYwPDG5CoG6XYrZsJ+BQnFzbPSi
	mhtVYo1anHTJGqw5jq+1FbF9hRnfyEBT95GZwpSGFNpi8gG6ANtbMwqE7JG07mvSwNTOlk
	RkAgzuXlOZb8IbbfrT2y99gMWSo335fpsSptE5JffHvc40MvwqCsCUTVoV9udOdMrO+J27
	ycc8Aw5oja8WOpQo0VDR1+3Y0f/AcUH+B/+YrSaFC4wceYpNSpQ1cBVjI2QITQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ray Liu
 <ray.liu@airoha.com>,  Mark Brown <broonie@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Martin Kurbanov
 <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH 3/4] drivers: mtd: spi-nand: repeat reading in regular
 mode if continuous reading fails
In-Reply-To: <20250804192132.1406387-4-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Mon, 4 Aug 2025 22:21:31 +0300")
References: <20250804192132.1406387-1-mikhail.kshevetskiy@iopsys.eu>
	<20250804192132.1406387-4-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 05 Aug 2025 17:36:27 +0200
Message-ID: <875xf1hjb8.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudehheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehmihhkhhgrihhlrdhkshhhvghvvghtshhkihihsehiohhpshihshdrvghupdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlohhrvghniihosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrrgihrdhlihhusegrihhrohhhrgdrtghomhdprhgtphhtthhopegsrhhoohhnihgvs
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehmmhhkuhhrsggrnhhovhesshgrlhhuthgvuggvvhhitggvshdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_083632_445047_28DB6B75 
X-CRM114-Status: GOOD (  19.60  )
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

On 04/08/2025 at 22:21:31 +03, Mikhail Kshevetskiy <mikhail.kshevetskiy@iop=
sys.eu> wrote:

> Continuous reading may result in multiple flash pages reading in one
> operation. Unfortunately, not all spi-nand controllers support such
> large reading. They will read less data. Unfortunately, the operation
> can't be continued.
>
> In this case:
>  * disable continuous reading on this (not good enough) spi controller
>  * repeat reading in regular mode.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  drivers/mtd/nand/spi/core.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index ff6a1e2fcfdc..88e4c00cccc4 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -431,7 +431,7 @@ static int spinand_read_from_cache_op(struct spinand_=
device *spinand,
>  		 * Toggling the CS during a continuous read is forbidden.
>  		 */
>  		if (nbytes && req->continuous)
> -			return -EIO;
> +			return -E2BIG;
>  	}
>=20=20
>  	if (req->datalen)
> @@ -893,15 +893,26 @@ static int spinand_mtd_read(struct mtd_info *mtd, l=
off_t from,
>  	struct spinand_device *spinand =3D mtd_to_spinand(mtd);
>  	struct mtd_ecc_stats old_stats;
>  	unsigned int max_bitflips =3D 0;
> -	int ret;
> +	int ret =3D -E2BIG;
>=20=20
>  	mutex_lock(&spinand->lock);
>=20=20
>  	old_stats =3D mtd->ecc_stats;
>=20=20
> -	if (spinand_use_cont_read(mtd, from, ops))
> +	if (spinand_use_cont_read(mtd, from, ops)) {
>  		ret =3D spinand_mtd_continuous_page_read(mtd, from, ops, &max_bitflips=
);
> -	else
> +		if (ret =3D=3D -E2BIG) {
> +			/*
> +			 * Some spi controllers may not support reading up to
> +			 * erase block size. They will read less data than
> +			 * expected. If this happen disable continuous mode

                                             happens,

> +			 * and repeat reading in normal mode.
> +			 */
> +			spinand->cont_read_possible =3D false;
> +		}
> +	}
> +
> +	if (ret =3D=3D -E2BIG)

While I agree with the overall logic, I find pretty unreadable to
perform the regular read upon a return value that is an error code set
in the init sequence. Can you please propose an alternate implementation?

>  		ret =3D spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
>=20=20
>  	if (ops->stats) {

Thanks!
Miqu=C3=A8l

