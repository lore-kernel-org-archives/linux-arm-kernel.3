Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92776C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzWqpMkWLli5Ubb9ocpLNQLSO34HJRoESJlwzoAXrOM=; b=wOonOFxqH0JKqbemWwg5sodsy1
	dwERQCyLJ3N9J+PFlgbpxJ/fMSPsiwt8TYncYkNcFVTFhfxAfp5cU8MkMrjsQiPVXn9wkvad3WC6T
	Omi3uXMn+u2nGAYFHqvY0gzWcS3tes3/Y3DmfxUQPEpSEJ2eUVDX0Ev3vDZxzgUjn3PkUJTFUwlAI
	pJIUJubryY6AV7bifx5FAtUEOoaOah80GJNi2D1J3/ufmO68nPWpJQVVYAgdfIfZVlpgJpHpp223W
	1zDq3wWq8Kiuzp8352RsEIgojTRO09MEWmPyJd8nkLn/dwbkkiP1HpDupIC0Jrw/fc/S3RRBoEZ6m
	4VvS7Bsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVv0D-00000000Scw-2Fob;
	Sun, 29 Jun 2025 16:35:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVuxu-00000000SYB-0AC5;
	Sun, 29 Jun 2025 16:33:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9B484376C;
	Sun, 29 Jun 2025 16:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF621C4CEEB;
	Sun, 29 Jun 2025 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751214792;
	bh=ef6rQZIC/ziH2BA7dycq513/pksDVMKdMUwcu1DRESk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U3403vbl5suB3BrPuAl8KFrQvJDwX3oceR5hJkBeRfCQTkr2VPdRgfrIy6osO9NaM
	 5iFhBP+D/40TQiUYWJ6359Q7YctQi90tChVaGzd/piy31o1J7zGtQ60leZlTI56YEQ
	 HXGVpSxU15mXzACinvG8PiaVVr9xoKaSxX6+tSwFlihR1rtZQ9GcbOj/0oWL+jZPEM
	 /4rfI+Miu1+9+I1gs4fVgLf3WFVwUf/eAEBjAfUY/1WkDKwyfBpEaGseUd4hndXfqX
	 cSamFty1PIZTQ1ZvfmQQDTxr5Q2do3HK4pvp5GVbzPUYm/FU7XkqC8Bg2UpqfBtmIM
	 UwLaJxoPnDipg==
Date: Sun, 29 Jun 2025 17:33:02 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 zhiyong.tao@mediatek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] thermal/drivers/mediatek: Add support for MT7981
 SoC
Message-ID: <20250629173302.265b67ec@jic23-huawei>
In-Reply-To: <20250628223837.848244-3-olek2@wp.pl>
References: <20250628223837.848244-1-olek2@wp.pl>
	<20250628223837.848244-3-olek2@wp.pl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_093314_105914_201FE8BF 
X-CRM114-Status: GOOD (  16.27  )
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

On Sun, 29 Jun 2025 00:38:36 +0200
Aleksander Jan Bajkowski <olek2@wp.pl> wrote:

> The temperature sensor support on the MT7981 is exactly the same
> as on the MT7986.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  drivers/thermal/mediatek/auxadc_thermal.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> index 9ee2e7283435..020324901505 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -1149,6 +1149,10 @@ static const struct of_device_id mtk_thermal_of_match[] = {
>  		.compatible = "mediatek,mt7622-thermal",
>  		.data = (void *)&mt7622_thermal_data,
>  	},
> +	{
> +		.compatible = "mediatek,mt7981-thermal",
> +		.data = (void *)&mt7986_thermal_data,

Random drive by question.  Why the (void *) casts?

static const struct mtk_thermal_data mt7986_thermal_data;
is the definition and data is a const void * so
you should be able to assign directly without a cast and not
have the casting away of const only to assign it to a
const void *

> +	},
>  	{
>  		.compatible = "mediatek,mt7986-thermal",
>  		.data = (void *)&mt7986_thermal_data,


