Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC31D7977D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/rhOR4DhfaQj1RK0nVCHUbeV/3vvEtnoUlZ/Uv+pIQ=; b=dVadU0bUIh4+DWzqbc9X/VlTOv
	khi+F5Vv5B1bnWiOBxDW493o+r8cQ9uSc3m2eFMn+4VvUOSqwbGiswVtJlmkbOU2tvSK+NZQoAkP/
	7Qc1qWDueLYOnI7Ip8pAo8SeYQqzvWYO5ymBCvqWN27+myliYEwqvI+FkOgKMhuuoqQVaXqdbAvR+
	WyukG5WHcAYxhu4vQiGqr0dUs+rCDcTDqDM7s/1xX5G7YQGD3cW/01GP5M3BMnl5uxosH6RRnWOUL
	J4s+uP420SJxWONaL7TioymoQ44u2Ss6J/3t+oPOJpImGXdbgWGAcICo8+cVHuhBiQ+Pfl9TKXnsR
	yJ63nOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDHt-00000002m6y-3iTq;
	Sat, 31 Jan 2026 15:53:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDHs-00000002m6e-0FeZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:53:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48068127f00so26081415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874806; x=1770479606; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/rhOR4DhfaQj1RK0nVCHUbeV/3vvEtnoUlZ/Uv+pIQ=;
        b=Gt9Bx4SqelnuVeRlTDi3UjPU12qwAfbfZJgo5ZXmR5mv+oWgyZSq8JHcit/MXflA9J
         e8Fjq1e8gjJgXQ5TLzG3a1TkWSC0J4UbPuigetYty8IwcXc9hZZTl1PJJgnTvt0zbmco
         UNv8uTBVuitolG7r/gN9CRF95yKfTDdg+I4WBbMGbA6vHoWao33kAmRoirDnzZijMG69
         q8anYtZhlA9/eo4+5sVTRe6lxjIP4G7eliOsimztYx/np9ke9PZnell3xliE/mQfaiOj
         cQyiU4fZB6cwOyDYwTFUTbhP7X/uAQegwKqKZIOUaqJIJmejzw7BaUj8WLczC7vFdKSr
         ycoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874806; x=1770479606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/rhOR4DhfaQj1RK0nVCHUbeV/3vvEtnoUlZ/Uv+pIQ=;
        b=LJqRxRR7HYBhxDv4WcATadlZYLUmTIXSPA4FcJBIzrIrD1KZyz6YmcZ/qUoiZ9ImIR
         Hb12h7eTk/1Z25CWoy9LBJMfGm/xBtHbqX09WOhGrbgEHgYNu6Ny2fl6El0Pp+jZiXsJ
         sG0333SvX5MVayJr4KkP1cXoxFzP7QomTH1UmHkDWaTFt8Gm9DuDu9YdRCJre3JVvuGX
         f7iWMakvU6zUjQRKO6Ckmo9EQBDAJEG4OsdxEepT1VU7jTptNwFKdUJ73r+M2ZcF5C+q
         DJngGZS2q2AFsn2LA+A8EAsA9qrr2KWouWVP5ORgMITIe5sylglsCF4XaGNTx68x03gT
         gwcw==
X-Forwarded-Encrypted: i=1; AJvYcCWsAM+UrGwgUtT54uavV1k+OxwIe98ofBHuUIBNozpTBYh30H7NPw9UT5oVzbz6OeJDy03KlpIlta+Ul+P9oGe2@lists.infradead.org
X-Gm-Message-State: AOJu0YzsAGcsRrGLWGpAnBaixNXEBPL/ivwlCz3m8R7CDzD4vbCLaEVC
	pHyPEvDvgwLGRMvn0bc84ZMEBHGZloRsPjg6VD0Udfix2zq6nYaOVDlmCUwJ6FYZEXs=
X-Gm-Gg: AZuq6aI5sbFQcac2Iaes3RWhDqNGSTWGz+V7ht63a6zjOFq02nPzL4RULupgH2wWM4O
	10pnccS7uMN8kasMM+ZIa13Mwb4gS5RWNDak5rRQTN2yTOQXXywWJcwobA8YZiRsfC+1P6PaaK4
	aDh0o2pqtYAeOE/NYF+k8xr6rKfucg6gbmRpOEfBd8WPC8eKENo+uQgstrM/R0bmGPofiPadnfF
	y0L2EdU2d2Z8kEd99dAw+yUWkfSOVdLpJhGGcXQdZ2BHLsLFwsbCvhU/K7guckL0IBd+xN7JA1X
	zdzY9pSEfTzsycMkIbML+9ryU40gxTfth5UGQfk4qHhAC8tByX06jQzkg1lv3B6wDKtKnlN8V2R
	6ZSniRBahCdBmmWparnqHZ1hUlAHwbRX37D76XD1iLMVLz5F3jSMpHhX7AhOmRjwaPLqzXToLnH
	qPWEpBUNUYYCHPF4MoFp9hB3rwPPiF
X-Received: by 2002:a05:600c:a08c:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-482db491ef7mr85082515e9.22.1769874806018;
        Sat, 31 Jan 2026 07:53:26 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e256482esm41222055e9.12.2026.01.31.07.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:53:25 -0800 (PST)
Message-ID: <920da850-7caf-4385-b4b5-10fe6a828066@tuxon.dev>
Date: Sat, 31 Jan 2026 17:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/19] nvmem: microchip-otpc: Add SAM9X60 support
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-6-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120154502.1280938-6-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_075328_119560_7146CB65 
X-CRM114-Status: GOOD (  18.12  )
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



On 1/20/26 17:44, Alexander Dahl wrote:
> Register layout is almost identical to SAMA7G5 OTPC.  SAMA7G5 has some

Can't you just use a fallback to sama7g5 for sam9x60 and drop this patch?

> additional bits in common registers, and some additional registers all
> related to custom packages in secure world.  None of these are currently
> used by the driver.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v3:
>      - no changes
>      
>      v2:
>      - Reword commit message (additional information about SoC differences)
> 
>   drivers/nvmem/microchip-otpc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index bf7e5167152cb..d39f2d57e5f5e 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -269,6 +269,7 @@ static int mchp_otpc_probe(struct platform_device *pdev)
>   
>   static const struct of_device_id __maybe_unused mchp_otpc_ids[] = {
>   	{ .compatible = "microchip,sama7g5-otpc", },
> +	{ .compatible = "microchip,sam9x60-otpc", },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, mchp_otpc_ids);


