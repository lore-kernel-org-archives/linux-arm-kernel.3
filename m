Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCEACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EN2uw03uQCiUxP4yNZYaMtufKIXdaP5nDTBBVTj3pDM=; b=F7tFzur+SO/29z2zNCH7JwgNkC
	G3q1wM7yDRPegbZyj0tIB8hV8pOQ8gNsNEC0d6Vb6XTxDnS33U+oEdWilF96U0Jn+h1ffyEkOEsNH
	Etx2Wq37st2i6aztQFLJIjjVBkjjSoFzHXNSURdHDStGjrZ/JqS8c3s9cUj7UXp+l3gV49/5DgpxJ
	rCCsaCeE/WOdgtxlGY5GS5py6z39iQbIZFT89NyIR7kfoh83S/6GZvMSsv3eVw5ki5LbrLgGxC2n1
	OjaeWrSAvIE9YTfeC7JONUwCFY0LffpqBHzD+sXmzyqQk86evtghPoi8tFHKGmT2V2LtrHcqsv6Iz
	/bCYeFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDbA-00000006LXK-1Cwz;
	Sun, 24 Aug 2025 16:29:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDY5-00000006LHN-3PfZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 16:26:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8ECBB4E40C0F;
	Sun, 24 Aug 2025 16:26:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 536E2605F1;
	Sun, 24 Aug 2025 16:26:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEE511C228BA3;
	Sun, 24 Aug 2025 18:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756052786; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EN2uw03uQCiUxP4yNZYaMtufKIXdaP5nDTBBVTj3pDM=;
	b=tTpqh9yAUftbHe5jJ5v7pD6DihH4ClLMkGFI3HnLY1dUZrsP65Et6en3YfPH/dwVXbWqgV
	+Qe/N6TTN9SOPyfIr5ewMTfKD6pTqNifDUR5N6ja/4heN/0bKdK9U5Wa+fIRsWH9Q48b6e
	+7cf9N2mHxBesIDY9k+3oltMXYCVcKZaYv6i1FAwJ6voWtaqcR+2OhHxCASw3P/d2WF/og
	ZP9T813d3PUFl28E8njmgmTry3epu+3UNe2EnuoqyI4MBBAQUHTECBWuAvNtaaJbqXtaO/
	kDqvpjX8UuY4RWMyzeaqBp/YsKFf19vPHZVCsH8I8SAXcxDTpYe/i6NFyoDRMw==
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
Subject: Re: [PATCH RESEND v2 2/4] mtd: spinand: try a regular dirmap if
 creating a dirmap for continuous reading fails
In-Reply-To: <20250814065423.3980305-3-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Thu, 14 Aug 2025 09:54:21 +0300")
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
	<20250814065423.3980305-3-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 18:26:16 +0200
Message-ID: <87jz2sit3r.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_092629_976749_776E18F0 
X-CRM114-Status: GOOD (  16.48  )
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

On 14/08/2025 at 09:54:21 +03, Mikhail Kshevetskiy <mikhail.kshevetskiy@iop=
sys.eu> wrote:

> Continuous reading may result in multiple flash pages reading in one
> operation. Typically only one flash page has read/written (a little bit
> more than 2-4 Kb), but continuous reading requires the spi controller
> to read up to 512 Kb in one operation without toggling CS in beetween.
>
> Roughly speaking spi controllers can be divided on 2 categories:
>  * spi controllers without dirmap acceleration support
>  * spi controllers with dirmap acceleration support
>
> Usually, first of them have no issues with large reading support.
> Second group often supports acceleration of single page only reading.
> Thus enabling of continuous reading can break flash reading.
>
> This patch tries to create dirmap for continuous reading first and
> fallback to regular reading if spi controller refuses to create it.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  drivers/mtd/nand/spi/core.c | 43 ++++++++++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 09dd6e40e308..0f8636047365 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1093,6 +1093,39 @@ static int spinand_mtd_block_isreserved(struct mtd=
_info *mtd, loff_t offs)
>  	return ret;
>  }
>=20=20
> +static struct spi_mem_dirmap_desc *spinand_create_rdesc_helper(

Can we drop _helper from the name? Just spinand_create_rdesc() sounds
as useful.

> +					struct spinand_device *spinand,
> +					struct spi_mem_dirmap_info *info)
> +{
> +	struct nand_device *nand =3D spinand_to_nand(spinand);
> +	struct spi_mem_dirmap_desc *desc =3D NULL;
> +

Looks good otherwise.

Thanks,
Miqu=C3=A8l

