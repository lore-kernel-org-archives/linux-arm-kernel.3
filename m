Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC67C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjrzzwNMA+3O7j9t/xTKxk8mOnp+XZv5foYx7oPCGic=; b=jlQEN9NklCYG75Kv2khYEnqLnY
	AFN5UCc1CBIUVo2I3e1DQ12gVcUzUj0Ea6/x82WnHpRTq9nCvVlpVaVu7d+MZjsZuMSNtCP8hDnbT
	oPlllmUo9v0Uw1CMi4eIKmCyZYXX1lhJmwIw1nFecKge7C6HXJjYSYNUc1c5QJxBX3a4hBebjsZCA
	FgfHqaBZgHBYrfyrM0dDod+pKpiAXRcPIG9j5vopWbi4s00ElUyrEPboHuThxCp8ZcEiJ/x+qctE3
	Xh2lblCUrQipbTqm7AxojbJOi98u3XlJqVDFyGyztJ0Ssk7Yj/9TO8ilpAkwOZU61vyxq4NyjKkKf
	/871nVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughHu-0000000GUU7-3tbN;
	Tue, 29 Jul 2025 10:10:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughFK-0000000GUCL-34uP;
	Tue, 29 Jul 2025 10:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753783664;
	bh=o/WtOzmD0eqgF0NqPyOK0K28rcV98y6nu4G49mqiIsg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ULbWeeMOHHXy+5q8edRndOYyouEGmLDHksHpclNESI2LteyNpH3PGnB8mgBneH4/W
	 B/E0352vsKkUHOhBDCMzRTucAJdjw/p1CnU1wExUBj/Wct+TqP65RjQoI3Mpb/R/CG
	 vyCbVzpt+H6NN7XHMdJ09rL3qyVwwWK8nwA8K/nKNK+zg4tH7CnhFQIYuDG+eKHTRt
	 W62fgblpj/QZbDJlqP/UUlpU5DOHQnVTMaRphPSmvgvRQ6gUkOfXX/vjkt/oG/rqvv
	 GuVZsYa87WprCnIJeoRj5bK8Qf7h1VjjKfrLN69Yk6oZlLPDFQHPNJj/oF6A3i0jrj
	 kSwWK9pO7LBdQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F46317E1315;
	Tue, 29 Jul 2025 12:07:44 +0200 (CEST)
Message-ID: <bb4d8100-ceb2-4ce1-bf27-86fe21ce2aad@collabora.com>
Date: Tue, 29 Jul 2025 12:07:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] pwm: mediatek: Fix duty and period setting
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_030746_925962_A159F819 
X-CRM114-Status: GOOD (  14.56  )
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

Il 28/07/25 18:00, Uwe Kleine-König ha scritto:
> Hello,
> 
> here comes v3 of the (formerly patch, now) series to fix duty_cycle and
> period setting for the mediatek PWM driver.
> 
> v2: https://lore.kernel.org/linux-pwm/20250724210041.2513590-2-u.kleine-koenig@baylibre.com
> 
> Changes since v2:
> 
>   - Split changed clock handling into a separate patch (suggested by
>     AngeloGioacchino)
>   - Drop
> 
> 	if (err < 0)
> 	        return err;
> 
>     just before an unconditional
> 
> 	return err;
> 
>     .
> 
> 
> I didn't add a R-b for AngeloGioacchino yet, as it felt wrong to do that
> for a patch that he didn't see before. So assuming you're happy, please
> provide the tag again for this v3.
> 

For the whole series

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> v1: https://lore.kernel.org/linux-pwm/20250710163705.2095418-2-u.kleine-koenig@baylibre.com
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (2):
>    pwm: mediatek: Handle hardware enable and clock enable separately
>    pwm: mediatek: Fix duty and period setting
> 
>   drivers/pwm/pwm-mediatek.c | 71 ++++++++++++++++++++------------------
>   1 file changed, 37 insertions(+), 34 deletions(-)
> 
> base-commit: 68b9272ca7ac948b71aba482ef8244dee8032f46



