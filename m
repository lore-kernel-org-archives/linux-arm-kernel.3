Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2646EEDEC16
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 06:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nD2A+kf2ghmCpKz8sOUzF4SnfRCxibAXQaK83nThncc=; b=WgKGtxGXFxVXzKkHWsPQ6N+tB/
	rhH+GDRfc1fXn8SnT8N3GswCG1fVmKORGWIgawSIgUtOlCRJ8QdCdv9Tn/rJKNZXHj8fXRcu8aY6K
	MDLKT3suYUzteBq54n7QvwiZ+qLijHVXHTO6ZmRaYboTun2ARdASgLYRvz/J6qQLfqwFZ3mzyPB3Y
	ScZipjkd1a9Xy79AyUa8oKtCI+fC6V6OJwzhMlmK53J3z303Pn0q2sJhhOgtzskQsF4kNznP5JvEU
	Kmv0WYeeEsdoe5LROKCgcpXtxEHa+QfEnnWII5NWcjxErwrMvt9u0WKGsyS2bSLxVEo/AwOxw9lrt
	m6QjATuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgA2-0000000GXzt-3Q6Y;
	Wed, 04 Mar 2026 06:56:46 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgA0-0000000GXzG-0xe0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 06:56:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48378136adcso38533775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 22:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772607402; x=1773212202; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nD2A+kf2ghmCpKz8sOUzF4SnfRCxibAXQaK83nThncc=;
        b=fEekJcfNXSfYvZ24Csda5j+U+aM7qN20XSpzFyDcQTKPBjlA44F/2TqnVTrsymKO+W
         POJiH8MoTqywRzygXLMCoR6ZTu+qbYZYeRMFdJl4rWZTYzqyClXHHXdFEFcAV5BTBMKI
         In2l69ItOhLZG91xyzmWn0WDLvR34qIfa6YoIqUTTQ7OHoObHq8XYu8ARgWXiWPXrPPe
         7KaDyVxsfSKIlLWYJoE10Z4FChnaOXvTy4O5mdAvVsLp76C5IOq1O+7jY/ZrPjieGyl5
         vabp70PBSGwEprryiq4N94UZ6m9sobRsxe6wIwPo+04e90PWIgxw5IevHwLB2SCH8LtT
         fCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772607402; x=1773212202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nD2A+kf2ghmCpKz8sOUzF4SnfRCxibAXQaK83nThncc=;
        b=bAVR65xGr9SypaXU/3ENZeZlyY0ZNKb9uR38OE/3ogpXrmyW6ShOJmI48PDBV3jgAN
         KIwk4JpQM/j71vuemEeT9yaK6swSZjESg9+9pblxEaPPNG1Y9WTw45sak06p7J9jOAQd
         aPnSPtaLQKQlexIqsMZQLaqw65Jvsmg0nFwUTtqgTntsfoDBqgU4HQbTwc7z3zcNslpq
         Fejs+5QNY4YVpzjsxjz/PpHCCzXeLPNnFlVE6D42svO2ggiMEMhYxtT13D3uQqWLI3iv
         amWva+iuGPUpqEVnrY1Lba5q2ahaNAWd2cibjoSkmAXLFhYs3BSS/UxhO228wCbS+f7K
         wVgg==
X-Forwarded-Encrypted: i=1; AJvYcCX0p/wRXNCJylFHnTaKd0ueKwxVyOiLrjDxoX3+YdOvID4ZYNwkyvPa5zpa4OXnF+1XSmpeRojNGZpz3WSzHa68@lists.infradead.org
X-Gm-Message-State: AOJu0YybpxUSJZrjhoAmEFPHwQVG3oFI3A6AODOrgjewyC5znVMlz7g0
	E+zy+s8CceJtV3+eaVzdf0kuZ5+95TLryJdvFcr8Sjn1+18Iw7ipEh7PIi6Wm/BKeGY=
X-Gm-Gg: ATEYQzy0UljD7LHFLm/lDMlPx1Z3zIJ82p1fZBSJ0ny8ctnGezyan9mbtGwpoSQAEBN
	W3GZ0DnXN2nIShm5oLHRi1LW2m0wAaqbXhFngacw4KFyyp3USwH6m4n8LTRm1CA3bpmzcKwObzv
	3zs01f0WV8zESSZN8jXZy+KBufcOjZ+vppcr9YRDTEb3vr65Ohm8P7b2vZjtxYf64cTYLjtnQCf
	OaJjB8AD+ljzcsrx2GXno7gbvC8/YBBt8z4u9H9Vh670KfJ6FzM/igIqMT5462Anal2yixngseM
	GaHNzFCKN9Cqu4Cyulfbn2JGWsRm/W7rHpFMCuoSk0hvnXbieq/IwIyKf+1aVe87uOBqI1LUhPK
	eGqmQNpxy+9SD5hLi9wMm1apgKFkzXRKw8pLX+NBgM63i0h4eA42wgUao1mhgurvZDUs/8NJCpd
	oplZSp+YqYkM2C5sGGVoJQC71jh+fsEw==
X-Received: by 2002:a05:600c:83cd:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-48519846ca8mr14622775e9.10.1772607401946;
        Tue, 03 Mar 2026 22:56:41 -0800 (PST)
Received: from [192.168.0.34] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c6129017sm4427391f8f.31.2026.03.03.22.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 22:56:41 -0800 (PST)
Message-ID: <b07660aa-56e4-4d71-99a6-3389bb4206aa@linaro.org>
Date: Wed, 4 Mar 2026 08:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: at91-sama5d2_adc: no devm for nvmem_cell_get
To: Rosen Penev <rosenp@gmail.com>, linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260304041843.7709-1-rosenp@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20260304041843.7709-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_225644_294836_FDB1C1A4 
X-CRM114-Status: UNSURE (   7.13  )
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



On 3/4/26 06:18, Rosen Penev wrote:
> There is absolutely no reason to pospone cleanup of this post driver
> removal. Just do it immediately.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

