Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8AEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzr1/LCeDjoMJ0N5C1aRla0oheJiiPXfPIMQCa/fFDo=; b=OwY1FmnaN3KtQdo/9qom1OEcL8
	yLMdREiTHWLpRNxcoAXCAZZWX898BrK/zClQp4VW1PyIyOyuzG7G649OTAQM0b80hsolwBjpN/dvI
	HYhQY0aut3Yuy5Jxpku71RHhDuO3Ge4MohlRcMI0heSiPlMCARiAqCvOItd5XLY9KWroeEC/6UODW
	VW50beaj3c0oY4jYF4vfqfxiy2stVEUMUMIzGaQ2yv8J7lb3eD1yyb1322uwM8+POOyiG+BnInxwt
	RRBNJaShQpRpSn01XddPj4bN29redhB76JYlM+cKnb2oMZZbf2WFrf2m30sKWturvLgNi2JzuHS9L
	JLserNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Fg7-0000000E9Eu-3WeY;
	Fri, 11 Apr 2025 14:48:23 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FQI-0000000E6J7-17Oh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:32:03 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30bfed67e08so19939611fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744381920; x=1744986720; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzr1/LCeDjoMJ0N5C1aRla0oheJiiPXfPIMQCa/fFDo=;
        b=m51ntQeFkoXBbu6PEJojTo5AudWQbL5EUjhF+ejEsF+YG1PKOU3ZRcPx8+CNIt5ruO
         +p3friI3zugQZxsWP5bnlSEGpxE7QbgkWCm5qLqhebF0D7GCy7I5OJ1s/2O9CErefavH
         lbiXqdYphlUA24zvRhohiBdemF70aH0n/DovzcpDG5SqEUc5Dv8j6jOyqFcsLK4Dv1UA
         g/ps7hxyAObmkqDVxFgegQ7r1g+8xFh08T1NwUON+x/r6evCQeVNdV6pRoCSaY8vDyOE
         QtE2HPONQHtLA0vcg2yq7JK8tuDyl+DIpBZZo2kUSxRDf6XE1AyRncjnd9Vf1rENy1ND
         0cFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381920; x=1744986720;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzr1/LCeDjoMJ0N5C1aRla0oheJiiPXfPIMQCa/fFDo=;
        b=H+c4MbTbwZMpQzq0cevoDjsYUVSohEb6dlGSpTvMzVq2ppJyeJydEPla/CXIOuoTBC
         GNeSK/5XRFND6pv9ou3SwenD4jkr2H8run2lBmKSEs6yDh9IWwVYAMmXuqkhh+Rt4fyy
         mqYgXS2WTxRgTsBX5uGR3qk1B8JGDiVpQw/IGkwXg82BiYKUUEuDOM8Jw+hQKqo2qyqf
         OYwiBSBcnzfM5NRj5SqgUYA2/4ayMVka5e7IlugSoaYbMuXSm/pElo/zrzmOIPEyBM+Y
         HI8LX9onBS9Nn+BzxIER+/2Bh7EIxn/Aa3x1OLJxGmW0XfQrS3Wz/XkFsDnUL0vk4Mm1
         xzGw==
X-Forwarded-Encrypted: i=1; AJvYcCX4fBnZnsUnf8rsmRKPf/+taxv6ZV+zUXescMsKNofOpjC9LG6a+b6riSuueT16DcSZNhRKMX0Ugd4dYX8zLDIN@lists.infradead.org
X-Gm-Message-State: AOJu0YzRp1ij62avkTMzKTHZHEleUG9fe7AABwaHgAYhQkdQqp5r0U4r
	2FD3CufTNL/jCY971t1DqRn0C10JomDrni/pijn/S81tu26hjXfs/B+enh4ldEE=
X-Gm-Gg: ASbGncu9MIL5Na7HW4sY9xwxi6KRTQ24RWHk+okxaPZ9WYaW8FvYtDbQUmx64powuwj
	dYNYvBfvVbAngHaQDLroW+Z+Nx4Vhiik4cvKh7z7/PNKMGl5K7FIzlUUp6xLRT512UwOoObsqhC
	LHiGWoV4JcqTqieKhuG/GPsNi44N9nBgPiRjEOTeFebz3UGWpkTapAk24GMwFFiJfsh2dqcFtff
	JXgAeybGUBnydudlJ0dERZU6El+C3PkxIdGMOp7LhTt8kpo95MUurHABO7vb+cCfytKqRXiTjhG
	tVtUVSwvoUEheykeFzPmWAi0bGmaUFeYvBzeDEPRBX8wWyPA
X-Google-Smtp-Source: AGHT+IHOzCHjOnVKGRcbNyn16xCquzdj4Kl/HVE05/XzIT+ZPMUlJvq12GGJqLlhzPFSjUm/j/9RXg==
X-Received: by 2002:a05:651c:2203:b0:30c:d32:aba8 with SMTP id 38308e7fff4ca-31049a67e57mr10002121fa.30.1744381919526;
        Fri, 11 Apr 2025 07:31:59 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f87f3sm7952451fa.108.2025.04.11.07.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:31:59 -0700 (PDT)
Message-ID: <7380a752-b77d-46ad-9b7d-e38e77e86089@tuxon.dev>
Date: Fri, 11 Apr 2025 17:31:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: at91: usb_a9263: fix GPIO for Dataflash chip
 select
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 devicetree@vger.kernel.org
References: <20250404112742.67416-2-wsa+renesas@sang-engineering.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250404112742.67416-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_073202_306733_5861ED59 
X-CRM114-Status: UNSURE (   8.11  )
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



On 04.04.2025 14:27, Wolfram Sang wrote:
> Dataflash did not work on my board. After checking schematics and using
> the proper GPIO, it works now. Also, make it active low to avoid:
> 
> flash@0 enforce active low on GPIO handle
> 
> Fixes: 2432d201468d ("ARM: at91: dt: usb-a9263: add dataflash support")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to at91-dt, thanks!

