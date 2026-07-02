Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7321BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3FGYaIm4+Bx0K10N4oUqaYj+E/e8FPAh9PHboSXrzk=; b=Yl2yseFmWmiS3ZKC0uoxXZRdOz
	DxwnbxxafoJEl+h1Ha4De2I6l5jB6C1hgimW6Z+X91bh3dC9FeeNyrsby0qSbkVthBmHmbA8kuXbD
	+RVSUu98/1O9xFQZqXig2uSZpadGyVr0MC2DxlDBCRVPiXpwnm3BR8aDGd2wLZrkRUkzKPaNltVjN
	Q/7C2TW2+XhwM6a3E2CK7MmgmbkT105kGA0S/Fc35OI9T2Df6hk0TJKYmjRWd/wOc1jCXsPPV+bWn
	qXlCwCgAbivSJwD60IA6Z3N5w4z3e215OhqpzBnA0HsewQCMi8Lx8NdnU06XOoGVzZcQOrwjnYiZF
	6VWNEXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLfv-00000005Bym-2JMU;
	Thu, 02 Jul 2026 17:58:11 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLfq-00000005By0-3g8O;
	Thu, 02 Jul 2026 17:58:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783015078; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eEysXMWkIgmgQq62POpwZyPtReROdfp9DcRBZm7J7VV9L4T7f4D2D5hFLYpH/NCy9AaIJcgohrMXouNd49NWhM17YEM6u0nS/7krbK+tiZh8sm0HdioSI5Qr8mAYiCp2jgOAoxKXSc2SQIh6u0Uz4ZMpfJy7U+mxDOGfs6HdGDs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783015078; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x3FGYaIm4+Bx0K10N4oUqaYj+E/e8FPAh9PHboSXrzk=; 
	b=iLAJCtbo+PF1YEckzcYGJMNbMdlyWKKsn4MZmtCHAMDSq4/OMk/3CZZ+sTQZCRio4a1qm9EAucAlT5GUejBiLdGZuwrtc/mWiqL3kcVuVtBMPAYUpxwjtCagLBWW7V9genwWzRzaTyrEpD4DzdsLuFAPyT9bA8eFioGBNJ2U+po=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783015078;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=x3FGYaIm4+Bx0K10N4oUqaYj+E/e8FPAh9PHboSXrzk=;
	b=VztCoPJASoeUL1MHjKIt2nXkDdHMArt4uv52ZZ0C//hsZI+W7r113xfrbRdRHzgY
	m2uDcnQbTcPhFJpJE8lz7S1Cg6eiIs6EukYNgDQ3+p7jJxkicf7zyzwQm2kLEUb7RAA
	nJfETZp4mAlqmpWI0r8G7dWVcVaLDngAQrvI/t44=
Received: by mx.zohomail.com with SMTPS id 1783015076593286.68618795309317;
	Thu, 2 Jul 2026 10:57:56 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Hans Verkuil <hverkuil@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: Re: [PATCH] media: rkvdec: Propagate platform_get_irq() errors
Date: Thu, 02 Jul 2026 13:57:54 -0400
Message-ID: <u6-dHgmpTzmKPiphpyUkbA@collabora.com>
In-Reply-To: <20260701111203.62092-1-ahmisaranrao@gmail.com>
References: <20260701111203.62092-1-ahmisaranrao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_105806_978768_24D38A3E 
X-CRM114-Status: GOOD (  15.18  )
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

Hi Vadlamudi,

On Wednesday, July 1, 2026 7:12:03=E2=80=AFa.m. Eastern Daylight Time Naras=
imharao=20
Vadlamudi wrote:
> platform_get_irq() returns a positive IRQ number on success and a
> negative error code on failure. It no longer returns zero. The driver
> currently returns -ENXIO for all failures, which loses useful errors
> such as -EPROBE_DEFER.
>=20
> Return the error from platform_get_irq() directly.
>=20
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c index
> 1d1e9bfef8e9..37683a6bb40f 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1818,8 +1818,8 @@ static int rkvdec_probe(struct platform_device *pde=
v)
>  	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>=20
>  	irq =3D platform_get_irq(pdev, 0);
> -	if (irq <=3D 0)
> -		return -ENXIO;
> +	if (irq < 0)
> +		return irq;
>=20
>  	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  					rkvdec_irq_handler,=20
IRQF_ONESHOT,

Thank you for the patch ! And sorry for the HTML email before. So for the=20
record:

Reviewed-by: Detlev Casanova <detlev.casanova@collabora.com>

=2D-
Detlev.



