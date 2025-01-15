Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66755C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 04:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwE2zfHSZsIAIwhO6bCQFceBK8F+GWTHqDXZ1N3Mnig=; b=XKh3mX9HND67KFHkPUnKHxKsS9
	QpOmY/ZYlocMfzC9uLOP+GoELqMwwxjpdm9ILfRdSz8m8z6ZZa2J48oi7gbjHFuA0WOq1wWFT61AL
	gC3tg2HgKef7ddiFOsyjb9uHkN48q2p7Y/kVP+b7ALEQ9RDZziIud6id+0ZV8ZTcGlSxmy9hJjCAs
	8FvUuFZDTBi6xQkxDZ77vPZw3k2tyX0qS4ZNh1hg3MkFw/jJItBlQlLFe52NrcHgP6SfJUObXrtP0
	zJVa5bGfc6lU59re5Fm/BU1LEOyrH4kPxv1JNz0ceu25nrf+hRdqZ3a4llw1gMQWIm9rXP+kD9QTh
	sTpashRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXvBj-0000000Acst-2epL;
	Wed, 15 Jan 2025 04:39:31 +0000
Received: from [203.254.224.33] (helo=mailout3.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXvAP-0000000Acn2-3tKi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 04:38:12 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250115043803epoutp0338bc022fed797e5438de4972ad50aa40~aw8sj12HL2622326223epoutp03h
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 04:38:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250115043803epoutp0338bc022fed797e5438de4972ad50aa40~aw8sj12HL2622326223epoutp03h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1736915883;
	bh=fwE2zfHSZsIAIwhO6bCQFceBK8F+GWTHqDXZ1N3Mnig=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jPC8IxezYjiizX1AwhlVuf9ysG1gH08HUjrc1ZSqGo8CtTOIFiBTQG4EyeZoPJwBC
	 rMOEn8WJURx8RC/u2BqGMs4IgIxN7lzVXj7WY/SaowhRskBpoxhX2DSgZ2UnoECitd
	 0R4iAnkp40y7LLKCtOmTqhLjlNqjTcySR8sRXyGU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250115043802epcas5p4cee7f8802fdc0802f9f709038cbb9fd2~aw8r0r4RK0138701387epcas5p4S;
	Wed, 15 Jan 2025 04:38:02 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4YXtXV4XKBz4x9Pr; Wed, 15 Jan
	2025 04:38:02 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250115040249epcas5p3e3dc20b887ccadc31f7698e953e63ee7~awd7ulJjA2943529435epcas5p3K;
	Wed, 15 Jan 2025 04:02:49 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250115040249epsmtrp10e02996ddc8c9e2379a39a56ae2a133f~awd7txdeA2418724187epsmtrp1C;
	Wed, 15 Jan 2025 04:02:49 +0000 (GMT)
X-AuditID: b6c32a2a-38bf570000004a05-56-67873369a270
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	22.2A.18949.96337876; Wed, 15 Jan 2025 13:02:49 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250115040247epsmtip2b2a8e54942f3c2e6b1e7083ee838b2ee~awd5xwhX43010430104epsmtip2k;
	Wed, 15 Jan 2025 04:02:47 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Avri
	Altman'" <avri.altman@wdc.com>, "'Bart Van Assche'" <bvanassche@acm.org>,
	"'James E.J. Bottomley'" <James.Bottomley@HansenPartnership.com>, "'Martin
 K. Petersen'" <martin.petersen@oracle.com>, "'Peter Wang'"
	<peter.wang@mediatek.com>, "'Stanley	Jhu'" <chu.stanley@gmail.com>,
	"'Matthias Brugger'" <matthias.bgg@gmail.com>, "'AngeloGioacchino Del
	Regno'" <angelogioacchino.delregno@collabora.com>,
 <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Cc: <cpgs@samsung.com>
In-Reply-To: <20250114200716.969457-1-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH] ufs: Use str_enable_disable-like helpers
Date: Wed, 15 Jan 2025 09:32:46 +0530
Message-ID: <1891546521.01736915882616.JavaMail.epsvc@epcpadp2new>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKOlDQiw1aDG1OI85tvS2g7EBI6nAKoU7y+sZuZQrA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsWy7bCSvG6mcXu6wY+fYhaXVkpYvPx5lc1i
	2oefzBZfLu5ntnh5SNNiYz+Hxd7XW9ktNj2+xmpxedccNovLzRcZLbqv72CzWH78H5NFU4ux
	xdZPv1kd+DwuX/H22HF3CaPHzll32T2mTTrF5nHn2h42j81L6j1aTu5n8fj49BaLR9+WVYwe
	nzfJebQf6GYK4I7isklJzcksSy3St0vgymid389a0CNQ0bP7AlsD4zHeLkZODgkBE4m+2U+Z
	uhi5OIQEdjNKfFrUzAKRkJa4vnECO4QtLLHy33N2iKLnjBKH93UzgSTYBHQldixuYwNJiAh8
	YZG4/eQSG0iCWUBM4uezI6wQHdMYJRpXLAUbxSngKvFn0nZGEFtYwFbi365tYOtYBFQlLsz9
	xgpi8wpYSqx/+JARwhaUODnzCVANB9BQPYm2jYwQ8+Ultr+dwwxxnYLEz6fLwFpFBKwkJhy+
	zAxRIy7x8ugR9gmMwrOQTJqFMGkWkkmzkHQsYGRZxSiZWlCcm55bbFhglJdarlecmFtcmpeu
	l5yfu4kRHMVaWjsY96z6oHeIkYmD8RCjBAezkgjvErbWdCHelMTKqtSi/Pii0pzU4kOM0hws
	SuK83173pggJpCeWpGanphakFsFkmTg4pRqYVtwxYwt56FETlGTEnes0N3NuQFrBeUtWpSav
	kxcvCz3mqdS62L/l51anYwHi2+yemDd0uZ86NT+9ZGLi15n36sz5b3UoZosH8Pqvc5nfqv71
	3wWpktIJE218lveVp4uWa/jqiEz4oXnP8LHXGpFXSx7kuJ/Kdzj4etP81/O2z1q0/We6YkHl
	X9XO2Xfc2eYHxGtt9mHY4ljvsTN0MYthjvWyF+IeM7btWrF6RpEax+W7lb4LZnoktTgvX7pp
	yuJZ978FXbXxqWRLCgjryJsapR7++yDz9n9C5688ufnXhL19b/nBGWZXFR9M0bsmeSdxysrz
	ZV5TG34+8t6ctO7sg6Ob39wOqHbPvsO5YUFgnxJLcUaioRZzUXEiAMZ7jD5RAwAA
X-CMS-MailID: 20250115040249epcas5p3e3dc20b887ccadc31f7698e953e63ee7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20250114200726epcas5p4dc896686dd6cdcc449344dbef87af21d
References: <CGME20250114200726epcas5p4dc896686dd6cdcc449344dbef87af21d@epcas5p4.samsung.com>
	<20250114200716.969457-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_203810_433290_EA63FED1 
X-CRM114-Status: GOOD (  17.67  )
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

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Wednesday, January 15, 2025 1:37 AM
> To: Alim Akhtar <alim.akhtar@samsung.com>; Avri Altman
> <avri.altman@wdc.com>; Bart Van Assche <bvanassche@acm.org>; James
> E.J. Bottomley <James.Bottomley@HansenPartnership.com>; Martin K.
> Petersen <martin.petersen@oracle.com>; Peter Wang
> <peter.wang@mediatek.com>; Stanley Jhu <chu.stanley@gmail.com>;
> Matthias Brugger <matthias.bgg@gmail.com>; AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>; linux-scsi@vger.kernel.org;
> linux-kernel@vger.kernel.org; linux-mediatek@lists.infradead.org; linux-
> arm-kernel@lists.infradead.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Subject: [PATCH] ufs: Use str_enable_disable-like helpers
> 
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
from
> string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/ufs/core/ufshcd.c       | 11 ++++++-----
>  drivers/ufs/host/ufs-mediatek.c |  7 +++----
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

On a side note, there are other host controller driver (e.g. exynos and
Qcomm) which also uses few conditional operators, But I didn't find a
matching helper in string_choices.h, so may be that can be taken separately
in future.


> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c index
> 27154a5dcb7b..5225d48a47f8 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
[Snip]
> --
> 2.43.0




