Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF82C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpE+gU66/VtFFZtfaCY3+dZAi/5PEF5XEsIVpkUzL/0=; b=rWF08c0vXBZts2
	HwtT4ShozIiEMNWKg/TgguIhVclc82oufv0FQnND5XjHDgu9modIWcyUL40DS/X8IGdx66CtV4wH3
	+r/38t2CoXtBcHdDudSlauW9ZMwPDVNc6f7x6XuE2am0bMBCd8oHhPWK/NRwOZuD+SD0Hf4p+Si5v
	xm/Z56NVLQ9SvgRmsaJEBeCdJI9LnHBFmV8jCq6fcIk4OczC0j/Rqwn2rrJ1jNTPqaAOrkmxiAdPc
	yOV3BI9QmraQu64hCD6q34d9plZf87EowQadNaQzWunxu7TPneX+g19uiBQDttoDEySHesxTEwjyJ
	QKDHZnKcoQPYRo8J4lsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxOC-00000003vFv-1MYt;
	Mon, 17 Feb 2025 09:26:08 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx9T-00000003skD-1uGU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:10:56 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abb9709b5b5so160224666b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739783454; x=1740388254; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bpE+gU66/VtFFZtfaCY3+dZAi/5PEF5XEsIVpkUzL/0=;
        b=embsWXmh1J6lii2Ivnj7lNB2Js3nCMi9ggTS08UITkWuRueZfIGZrmCyfMSdic9ABH
         XnrQy7ypgfbQSHg+ie9LMbAKenzXjDXmWLPkEbD6s9Wms32ONfi+b00hbXhZeSyS85SD
         LeGgaJ3jECYlngziDVzwrNoqTKoyrtUczDG/3GAHDhd5cAzjd0B4WTzFdDrdEQ9zjFl3
         pHz1cnzvoxSCHsrs20JxRZ925uqj9hP6FdHqeEe/DOKcgwwvAjPJKQ79pHnax8WNP4e+
         arKO6Yvr6ClY7jGXGPk9SSkgV5n0lUonVRCYr9Bx/Pf9og8yKR6Mp3zY+UnY0gH1gQLG
         lYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783454; x=1740388254;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpE+gU66/VtFFZtfaCY3+dZAi/5PEF5XEsIVpkUzL/0=;
        b=eK7q/O8lg4hylEBbdTiw9PSS0kAqfLnoNad8eJHx6dgFgSANrs/oWujbxXCdYJVIKv
         9yOU7xjjh4YFfIv0Lhd53ebvCN+WxqjxvyQjSg+VLTl7t/t+zKvrokp5s+SFNM6ToMQQ
         t6PoHwblwjF99rsDJ1nP/WKGB/+/7wQZVJ2guPYh2kwtC1cSpJ+jtJycnd3tpgkf9Uxe
         +qKNm/DCKFOmvcmgHP5sXrohb8KHlfrnJ0+kQlA5xkQEtJZUIoBC5RZ6UwaXIx3sM5Pz
         fZYe5ykJC6sR+L/RZmAepEmoR5JMgRui5KeHDPwe4qpmdBdGY8bI/tUjwL8vaqwz1w8/
         0sdA==
X-Forwarded-Encrypted: i=1; AJvYcCWJCs7ymrW8MYQ0egAX8C2DUrRYIwWa7KUcYIYJjeCS+m3aOJZt9c3sMgK1Z5741w8rnaruisAzGoogjqtWIH3a@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd58GnQcVENjjUVxFan/vm8AfLKxw8vwE0Om8XIATncJ500g17
	E3Wc0MJVSdj1ZLoOM7Gv/sWUNyGJCprHKyb8ALu/5zpMoJZFyD+5L6TSCxemWE8=
X-Gm-Gg: ASbGncs3KOKjGnCbqf28/NngFt5fS2l02XmDI+AN7SQBLrWyrsmoHfQsVXHHZMjBJCa
	YX43G4K6PGlwNKIy5WlTWZyH7OU32u9l6a5o5NoT6LTmTAyeQ7xOJD5SGScUF7gQF9ruDlDYTMv
	7Lrd1WPVVuQs141GFR4qWLLJi47DqXjUCww5odL41CJ9c0OTwdqpFAxITozKIaHkHUIC010/Xsw
	Qavlq+aYqevVxEP/3+4dFz3B6EZvB2Iaqlv4998b4u2IzBcQkcOuS9xU1m33oNS4DNZxnVjkUsf
	bwgLqw/k9k4ljD2DucdSEAc=
X-Google-Smtp-Source: AGHT+IGdA34WvOQoa211cMFIH/mjnYm202WDbH4ck0vbSETl/ktewNG48mcP+GJedsZFj1k9+lMhBQ==
X-Received: by 2002:a17:907:1c21:b0:ab7:f36a:2563 with SMTP id a640c23a62f3a-abb70d3cfa1mr834993966b.21.1739783453770;
        Mon, 17 Feb 2025 01:10:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba3d765acsm91405266b.130.2025.02.17.01.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:10:53 -0800 (PST)
Message-ID: <1784e8d6-c754-4e7f-ad48-611b9c392eb8@tuxon.dev>
Date: Mon, 17 Feb 2025 11:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] nvmem: microchip-otpc: Avoid reading a
 write-only register
To: Alexander Dahl <ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210165050.496486-1-ada@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250210165050.496486-1-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_011055_500800_19894853 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: devicetree@vger.kernel.org, Ryan Wanner <ryan.wanner@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 10.02.2025 18:50, Alexander Dahl wrote:
> The OTPC Control Register (OTPC_CR) has just write-only members.
> Reading from that register leads to a warning in OTPC Write Protection
> Status Register (OTPC_WPSR) in field Software Error Type (SWETYP) of
> type READ_WO (A write-only register has been read (warning).)
> 
> Just create the register write content from scratch is sufficient here.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")

Fixes tag goes above your SoB.

> ---
> 
> Notes:
>     v2:
>     - Add Fixes tag
>     - Remove temporary variable usage
>     - Reword misleading subject (s/writing/reading/)
> 
>  drivers/nvmem/microchip-otpc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index df979e8549fdb..e2851c63cc0b4 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -82,9 +82,7 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
>  	writel_relaxed(tmp, otpc->base + MCHP_OTPC_MR);
>  
>  	/* Set read. */
> -	tmp = readl_relaxed(otpc->base + MCHP_OTPC_CR);
> -	tmp |= MCHP_OTPC_CR_READ;
> -	writel_relaxed(tmp, otpc->base + MCHP_OTPC_CR);
> +	writel_relaxed(MCHP_OTPC_CR_READ, otpc->base + MCHP_OTPC_CR);
>  
>  	/* Wait for packet to be transferred into temporary buffers. */
>  	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),


