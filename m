Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E0EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzQpVooeuRLGvV+H89HqexAwacGhVAMz5cSSBB4VyM4=; b=WiDpIT2/U4vqiS6N0K5rR7CV1x
	1gKlryNsamGV1g6zp1tzoiVtfC6FimRJ+V62oVMXaoEAy6wSXF1sgdDYUzP2t0OhrCZW3ZTI2PBXc
	Gn+OWBniljmLXL79jFBy3fMt6mGG+jKBkM04H1bnk42FAIuJfDdkfkX6NeOokqqVORKn6c7km0X7m
	nwmfUKxxchowMspXMgQ+fe617XJSRL0i0apvMltAWNDUesyVPnmRB9HK9xF+Q4l05/NgDv4HOaLBk
	o/s81hTfxt31rJSMdjTt3qZEIxKBpH0UKd/xsUpDDAuP90sISa1NQ2mIj4FVw2kgYxyUTtNIn41IU
	sG2zSRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tki7Y-0000000CMbs-0CzB;
	Wed, 19 Feb 2025 11:20:04 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tki43-0000000CLfj-3iX2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 11:16:29 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250219111625euoutp0134e89fe362326db59075108c472432b3~ll9gDLhXm1522815228euoutp01h
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 11:16:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250219111625euoutp0134e89fe362326db59075108c472432b3~ll9gDLhXm1522815228euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739963785;
	bh=JzQpVooeuRLGvV+H89HqexAwacGhVAMz5cSSBB4VyM4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=vXM9f451Vp9qvUouT1wAL4wAGkveCbigyzsPPA/MRT3DM2fO43FLPHmy4lNC0fPuc
	 Fpt0VU5EKsSDDG/gjHV+T0LrcNO93V03RWp93qDDo650CEPNoU0hKdEzVcEUyQzaxF
	 Brfbwi6O+42mvMPYSNqvif94ycKzcKMUxN+d8MmM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250219111624eucas1p215437069f98fe6a911e818bf114088e7~ll9fd5-pK1957519575eucas1p2f;
	Wed, 19 Feb 2025 11:16:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id E1.AE.20409.88DB5B76; Wed, 19
	Feb 2025 11:16:24 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250219111624eucas1p2725578fdd6fa8733592c6e7e73c8e5a6~ll9fGH2bj1957519575eucas1p2e;
	Wed, 19 Feb 2025 11:16:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250219111624eusmtrp1fdb9dbf4003a5667c78d8c76ed9cd24e~ll9fFSKYh1680016800eusmtrp1_;
	Wed, 19 Feb 2025 11:16:24 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-1c-67b5bd88836a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id E3.5B.19920.78DB5B76; Wed, 19
	Feb 2025 11:16:23 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250219111622eusmtip104a560fc5f8e7812003f1fe53d3a2517~ll9dmpjmV1237812378eusmtip1C;
	Wed, 19 Feb 2025 11:16:22 +0000 (GMT)
Message-ID: <a94c375a-baf9-4530-8425-762dc9adf35e@samsung.com>
Date: Wed, 19 Feb 2025 12:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate
 funcs from get_direction()
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>,
	Liao Chen <liaochen4@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Mark Brown
	<broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Bartosz
	Golaszewski <bartosz.golaszewski@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250219102750.38519-1-brgl@bgdev.pl>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJKsWRmVeSWpSXmKPExsWy7djP87ode7emG6zaLG6x4tsaJou1vUdZ
	LHY92MZmMfXhEzaLddvuMVuc+rWX1WLKn+VMFpseX2O12Dz/D6PF5V1z2Cwm3t7AbvF05mY2
	i3ernzBaHD/RyWzx89B5Jgd+j8XXbrN6zLp/ls1jw6PVrB6LN+1n82g58pbVY9OqTjaPO9f2
	sHlsXlLv8XmTXABnFJdNSmpOZllqkb5dAlfGzgbrggahirknJrE0MPbzdzFyckgImEg0X7nA
	2sXIxSEksIJR4tX520wQzhdGiZmPm9ggnM+MElv/3WSHabm1vIcRIrGcUWLFq/VQ/R8ZJZa3
	TwXKcHDwCthJzNwoB2KyCKhKLDxTAtLLKyAocXLmExYQW1RAXuL+rRlgM4UF0iT6duwEGyMi
	sIRZ4tGt3WBnMAscYpSY8PMnE0gVs4C4xK0n88FsNgFDia63XWwgNqeAscTpH68YIWrkJba/
	ncMM0iwhsJtTouFdLyvE2S4Sk8/8ZYGwhSVeHd8C9Y6MxOnJPSwQDe2MEgt+32eCcCYwSjQ8
	v8UIUWUtcefcLzaQf5gFNCXW79KHCDtKTPnwnhkkLCHAJ3HjrSDEEXwSk7ZNhwrzSnS0CUFU
	q0nMOr4Obu3BC5eYJzAqzUIKmFlI3pyF5J1ZCHsXMLKsYhRPLS3OTU8tNspLLdcrTswtLs1L
	10vOz93ECEx9p/8d/7KDcfmrj3qHGJk4GIEhyMGsJMLbVr8lXYg3JbGyKrUoP76oNCe1+BCj
	NAeLkjjvov2t6UIC6YklqdmpqQWpRTBZJg5OqQamjT+L4gyX5sx4ZRZzIVLHoXOT7RyHf4e0
	HZ869QhtOv0nNLqvInSO6kqfCYcVXqTcTfiy3LGupF/Y7PnBTStyT2rHaApc/mP5QuTFV+Ev
	8XprI5R5nl98aG+fetxLfo/Wr4ctQcvefVzJPrNYj6dC5Q//lq0vj7+/PeXUfXmx8/fqtMXr
	BE4GrOIUdft6r11xq3VYll/TprvpMWeLy3kjpVxjfQ3P9F0MqJmwS9N+8lJzpv0KCWqR5a9f
	Hyk/wtRn4Z72tfWEZFb0oZta3bNOneT89Ya3eELTA3mtfEk31SWFomd45yjPrVHsUC2b+e3r
	9TXLU8rdLRNcby0ULD2mUjJjct69O8ujShK+s1QpsRRnJBpqMRcVJwIAqY1I/+wDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsVy+t/xu7rte7emG5ybaGWx4tsaJou1vUdZ
	LHY92MZmMfXhEzaLddvuMVuc+rWX1WLKn+VMFpseX2O12Dz/D6PF5V1z2Cwm3t7AbvF05mY2
	i3ernzBaHD/RyWzx89B5Jgd+j8XXbrN6zLp/ls1jw6PVrB6LN+1n82g58pbVY9OqTjaPO9f2
	sHlsXlLv8XmTXABnlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpO
	Zllqkb5dgl7GzgbrggahirknJrE0MPbzdzFyckgImEjcWt7D2MXIxSEksJRR4v3ioywQCRmJ
	k9MaWCFsYYk/17rYIIreM0qsbjnG1MXIwcErYCcxc6MciMkioCqx8EwJSDmvgKDEyZlPwMaI
	CshL3L81gx3EFhZIk+jbsZMVZIyIwDJmiddrNrCDOMwChxgl1h58C3VFG6PE1L03wTYzC4hL
	3HoynwnEZhMwlOh6C3IFJwengLHE6R+vGCFqzCS6tnZB2fIS29/OYZ7AKDQLySWzkIyahaRl
	FpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQJjfduxn5t3MM579VHvECMTByPQwRzM
	SiK8bfVb0oV4UxIrq1KL8uOLSnNSiw8xmgJDYyKzlGhyPjDZ5JXEG5oZmBqamFkamFqaGSuJ
	87pdPp8mJJCeWJKanZpakFoE08fEwSnVwGRg3BzA7PAjJOjxFXsJYWeXM6nyPa/1P8ff3NRf
	fVDnzLwvSTv+NE3c2LPoem75V8Xrid/VG2v1nzyQOP1ZPkTq1pY7Hxb3vF1rzfVJ7v3b+ec0
	k33Y/4sfYFl5uoB3W6zkxjmr26IcGY2eV1Se/5l4+GbyRPd1PY8vp0xpmmj0VKjomuylyDnn
	flw7kPrBYWbEiwnh/Qo/7/+bvuFMm/TBMr31fhNO5Cht22fZLBV/mzM20UVNyCD9mkLU+43J
	J466yLbKfDA8H232yLX+kopWbauFgCH3k3OVJ7cWs2ovOvHs/qR1n6yFVwnEVbKF5etEh3I5
	sc8TvKCy6c+a3bOOv/3Qvk2rLpfRuCdLTE+JpTgj0VCLuag4EQC9In6TfgMAAA==
X-CMS-MailID: 20250219111624eucas1p2725578fdd6fa8733592c6e7e73c8e5a6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219102802eucas1p11a9de63da00a6c76eaa79155764131ea
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219102802eucas1p11a9de63da00a6c76eaa79155764131ea
References: <CGME20250219102802eucas1p11a9de63da00a6c76eaa79155764131ea@eucas1p1.samsung.com>
	<20250219102750.38519-1-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_031628_206100_B554969D 
X-CRM114-Status: GOOD (  22.36  )
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

On 19.02.2025 11:27, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Since commit 9d846b1aebbe ("gpiolib: check the return value of
> gpio_chip::get_direction()") we check the return value of the
> get_direction() callback as per its API contract. This driver returns
> -EINVAL if the pin in question is set to one of the alternative
> (non-GPIO) functions. This isn't really an error that should be
> communicated to GPIOLIB so default to returning the "safe" value of
> INPUT in this case. The GPIO subsystem does not have the notion of
> "unknown" direction.
>
> Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/all/Z7VFB1nST6lbmBIo@finisterre.sirena.org.uk/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Closes: 
https://lore.kernel.org/all/dfe03f88-407e-4ef1-ad30-42db53bbd4e4@samsung.com/
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/pinctrl/bcm/pinctrl-bcm2835.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index cc1fe0555e19..eaeec096bc9a 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -346,14 +346,14 @@ static int bcm2835_gpio_get_direction(struct gpio_chip *chip, unsigned int offse
>   	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
>   	enum bcm2835_fsel fsel = bcm2835_pinctrl_fsel_get(pc, offset);
>   
> -	/* Alternative function doesn't clearly provide a direction */
> -	if (fsel > BCM2835_FSEL_GPIO_OUT)
> -		return -EINVAL;
> +	if (fsel == BCM2835_FSEL_GPIO_OUT)
> +		return GPIO_LINE_DIRECTION_OUT;
>   
> -	if (fsel == BCM2835_FSEL_GPIO_IN)
> -		return GPIO_LINE_DIRECTION_IN;
> -
> -	return GPIO_LINE_DIRECTION_OUT;
> +	/*
> +	 * Alternative function doesn't clearly provide a direction. Default
> +	 * to INPUT.
> +	 */
> +	return GPIO_LINE_DIRECTION_IN;
>   }
>   
>   static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, int value)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


