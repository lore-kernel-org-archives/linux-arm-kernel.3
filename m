Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D586CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkQpaDIpCuNqvddytBmuD6MDMQYm1NodhkCLcp7FXu0=; b=3X/fpP24p5lqbFWujqFxA0+GmZ
	Wm6iYdM/IJq0PNzI5BEmm1R1N+DPgOehndgZWJoBQATRt8Vy03L9QOATRMoUfF5rNaL4z7dGlJftA
	JH8iBHT5QbPTkbtNVrFIwlAmPOelx4cj9FzUpRMFeDvZxm52AmsZoSvp/rKnMzQlCwM7PZWY0DTGT
	IlKETo/9NHfSKLTqtK++EOiOEfPE3CG8vDBSFxaSXPpky6zH6BP5jpS/NCNmy9PQMx1ucUiKiY0qg
	HhdT9IwIrSlthhr92leDMxKoCqWK+mKMBlz7uH5O79A91aKhL4VhyQ+VwRkOBSrapPQtD3g+QNFMf
	D11u2fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdGS-00000003Nqk-1Qjv;
	Fri, 19 Sep 2025 15:43:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdGQ-00000003Npt-2FWv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:43:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45f2f10502fso15031195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 08:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758296588; x=1758901388; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkQpaDIpCuNqvddytBmuD6MDMQYm1NodhkCLcp7FXu0=;
        b=wKXzqDhfSzMPFUqLpxKJ8nUji9sRDUmLLXAs3EItOqDXn8k+w8vQivTbrILTyl/gk4
         K33aF4u9gcZyDXaCGgS1VbJC0Nxs7VXRKK3Nk+bqDcXPiIXlBK6EoDkr+hqZocxSiTjx
         jLAwMAezYVGqAQOKtTmLHq5YlvCHGfeSVuDzvSEhTvhPYxMAokty/mPrRgafKFivKoLA
         Me6P0JhHsXSW2CehiVrkN8AbwmfhmiPtqS7/uLfa8e/rf8ItAuh9VhuexLStsiFyCTsz
         hW4nTwAkiLDJP7c6lMCK899Svk8nhjJMLszK5D0Yiu5FR2AyaQ3kFv/n1ErkOVMjvWO3
         fV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758296588; x=1758901388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkQpaDIpCuNqvddytBmuD6MDMQYm1NodhkCLcp7FXu0=;
        b=ZrieN2ZcNSIsJTjJ+qevKQzhzi2fDsNEiqJlP5ieJlgpUo8CyKqJdffG/463JZLSCc
         /AnFkGO3S4c1WBViXFRMqkAe7f18NgsKbeTuCJ+2EOLC01IyhI3Wyiar8Lm82NyyWomz
         w++X55ZOzK5KVCPNB+E04TWYyL31Yv7YoMiCzWyOftDjk+N1+pkjLb4DQGdrFtvkVAQu
         wQMdwSNeHeuREVTSMXQVkXK8NpPA5fQZbLYA9azUmhOzWKv6/dKBvabU+IT6jCuRif/T
         ROOpVbX4IUDHSV+FGtKDta0yVS5YV0ypoj64/dH/D/0zzgxOPrSsEKYIZLOW1+0Y6gcj
         Kw2g==
X-Forwarded-Encrypted: i=1; AJvYcCVF8MyknWAxgsNyhvI/OFEt3cyOZf9hfYm/DC6t25moOa+HBfaiXBRo/qjAQo+KVzhY3lRnQZYv4F2bzGz8hP40@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Mb46gqnlK0q7ahAIdp3IQUlATm4aabCxiuWII19Y2Crdx4++
	jwurXpzmcSFcvXv78R1aiNcGD2EA53Bn173QmY4uZo7NrOI7L+RFxM1ojEKC4A7qeHo=
X-Gm-Gg: ASbGnct7I9IpNNsR0mGUQm+47qV5n2eCQx5UhFxsdTRGU9ZKpVT9yk42wg1wsXf5At7
	OR7wM9nfr8KaAZCWtGjV2BuWHAHMpaXBwcXruZbsN1ejsfl1uU3xNXSMV3mTW59z7GbugctQgZf
	A++/cHAd4i32FA8E6TjSQp8vS/k8vFqnSi08xaREzyYvrYfoRNaEk6t4LszUQq8KYzQc5ulEtes
	2t9QIfAMdeSr0hVyLzNWTuaxAooV44JcFiCUem713ST092D1+ZUzPbWgpMXLNXI9qzUd7OIhBdn
	UdlRPF+ri43EIKhZNF/0H8kO5DWi7IJwOShzb8+tr8QvkvZoTv5yRj0ri6nrTJ6y4xR1oI+nsSI
	D23aB71FiupvoaavYdn8PbLGl3E6j35T8wWakHi1hplpzKjOfKh9gpOhCQcBhRFUX7xHX+eHx5R
	HJnA==
X-Google-Smtp-Source: AGHT+IFYvRcAmwC+mp+0+RFbvRArwGTpkTn3ZN8Wn5X+7lOF3PNWJMwXqY3LiyaPYA6nN2cvLS4FUw==
X-Received: by 2002:a05:600c:8b86:b0:467:f71c:148 with SMTP id 5b1f17b1804b1-467f71c039emr31089465e9.33.1758296588420;
        Fri, 19 Sep 2025 08:43:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8ffd:205a:6719:49c1? ([2a05:6e02:1041:c10:8ffd:205a:6719:49c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee15bfab67sm4605373f8f.43.2025.09.19.08.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 08:43:07 -0700 (PDT)
Message-ID: <f9554814-e5b7-421d-bef8-92131b1cc840@linaro.org>
Date: Fri, 19 Sep 2025 17:43:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] thermal: renesas: Add support for RZ/G3S
To: Claudiu <claudiu.beznea@tuxon.dev>, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, niklas.soderlund@ragnatech.se,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_084310_580210_E9E56CF7 
X-CRM114-Status: GOOD (  12.09  )
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

On 10/08/2025 14:21, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> This series adds thermal support for the Renesas RZ/G3S SoC.
> 
> Series is organized as follows:
> - patches 1-2/4:	add thermal support for RZ/G3S
> - patches 3-4/5:	add device tree support
> 
> Merge strategy, if any:
> - patches 1-2/4 can go through the thermal tree
> - patches 3-4/4 can go through the Renesas tree

Applied patch 1,2

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

