Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE228E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 11:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uYJOiM/HbfgHfKrJI1xrTj5cr9v5VZf2W3BJkrW/wE=; b=YWxYmUyKXVZmppV14qh3Rgc1B/
	yDXf94J0RLdBpX734mMq7OK0+8HSwQh7/8D6GYBWlZu56z9wkE/s5ygUJl5Gs04Y7EH8ZAXIzecno
	D6Dqk+TkFnCSQQCoapVQeC/1ah2/m/gDavoW4YhD7hcuvy0q9WC4X4dYxWkzr5Tyl0k3P6BQJtbg/
	Y7fPr1xfx+q8xgNzthoRQvvMQ++EdYTONmbRTN7JKu+3Pk3e3uib+ljzCFNMUNQl7xWPgy+XgHh/k
	OiSh6VeTc9EK4ai72v6rEQ7EzsYt2hj1VRo4VkTt/ffN5TRpz4TkSPPfsaLZviaj2/OXxBDg1+pLP
	9NdjEvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlMc-000000013Mr-0k4g;
	Mon, 06 Jan 2025 11:33:42 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlLQ-000000013Aw-1FAA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 11:32:30 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5064rhaA021827;
	Mon, 6 Jan 2025 05:32:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=2uYJOiM/HbfgHfKrJI
	1xrTj5cr9v5VZf2W3BJkrW/wE=; b=iCpYwVj4vBbQzhXeGv7EHzyI5VlgS7kpRR
	8s4EsgjuikitbrZBjkNeKjSA1ITMimEIUy3W7njEMe36Uk0xtYogChunI6et2j84
	ONhUEoodlSZUwYk+u3rY7G6JjsgljyOFRginAXu1SBWUSHDxi6FHFgwYbzOpkOGN
	BCakjF8JtACf5tuONR0Hk7UCz0DC5jCmtMWxdEf6Nhgp7ExQ0h1819cxei6sf+qR
	ZLuDnUmjrQtD1/Yeprnm5eUtYXQxYeKBE0ZFAKL6+8yqKRDGe+01fCt2E2b0pAJH
	xNrU17Hl1NBjbA+pt12aKwPsv8Q5gT5hgz6lINtUPD+R6nAMqN9A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43y3929mx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 05:32:15 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 6 Jan
 2025 11:32:13 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 6 Jan 2025 11:32:13 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 23024820248;
	Mon,  6 Jan 2025 11:32:13 +0000 (UTC)
Date: Mon, 6 Jan 2025 11:32:12 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/4] spi: cs42l43: Make handling missing spk-id GPIOs
 explicit
Message-ID: <Z3u/PNryXkda7GyO@opensource.cirrus.com>
References: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
 <20250104205437.184782-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250104205437.184782-3-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: h7sDSYWgJBRQ--r7QsqI2YX9f7ladere
X-Proofpoint-ORIG-GUID: h7sDSYWgJBRQ--r7QsqI2YX9f7ladere
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_033228_400043_B3F5B840 
X-CRM114-Status: GOOD (  21.51  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-spi@vger.kernel.org, patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Jan 04, 2025 at 09:54:36PM +0100, Krzysztof Kozlowski wrote:
> gpiod_get_array_optional() for spk-id GPIOs can return NULL, if they are
> missing, so do not pass the value to PTR_ERR but instead explicitly
> treat NULL as acceptable condition.  The old code was correct, but
> misleading because PTR_ERR usually is used on errors.
> 
> Reported by Smatch:
>   drivers/spi/spi-cs42l43.c:241 cs42l43_get_speaker_id_gpios() warn: passing zero to 'PTR_ERR'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/spi/spi-cs42l43.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
> index ceefc253c549..90180662c4c2 100644
> --- a/drivers/spi/spi-cs42l43.c
> +++ b/drivers/spi/spi-cs42l43.c
> @@ -237,7 +237,9 @@ static int cs42l43_get_speaker_id_gpios(struct cs42l43_spi *priv, int *result)
>  	int i, ret;
>  
>  	descs = gpiod_get_array_optional(priv->dev, "spk-id", GPIOD_IN);
> -	if (IS_ERR_OR_NULL(descs))
> +	if (!descs)
> +		return 0;
> +	else if (IS_ERR_OR_NULL(descs))

Should switch to using just IS_ERR() if adding an explicit case
for the NULL. Otherwise looks good to me.

Thanks,
Charles

