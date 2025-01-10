Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68544E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xier1H0iRZQUKFRWlNiMydYcr5ZwkdaYGgLJSuP7jbw=; b=Fz+l9gzRSyohd+
	f+lcub203L5N7+au9Q22pdY7Y0tqcL+8hYTY2OAZwnUIlnN4MOkF+XVP7jGh1rlx/gb3PeOIYW23r
	NF+jLBPgUTDYml4/MoNSqr54HJdBipK7Ic3DygAZknI6SrU2T+ZIsfZHEGfan2Lwu5LkJk5luoO+D
	Neu54o+SpsanA+ct39qzvB58pcOiLa5BvZ/KYrPCL/mRExkGAkw2bo26nU9dpdu0WQR6N1/Nv5VJE
	nZcaA5bcI0BNx0FMIVyVt+2NnbVBL2B9g+NFXE1j6YbJXBJ6v3in3gpawXchk2pojK70F1MudgO0U
	Tm4Cg52XnYRIhcciZH7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHrF-0000000GFCB-2tEB;
	Fri, 10 Jan 2025 16:27:37 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHQl-0000000G7x7-1vAv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:00:16 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30229d5b229so18668141fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 08:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524813; x=1737129613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xier1H0iRZQUKFRWlNiMydYcr5ZwkdaYGgLJSuP7jbw=;
        b=wIhBlGVYTd2XXMzFOvDkFsdf1TYSSPhCQwL+si6TTszFEHF25I8Yuo4sEJvuGSURn/
         +ZEbjlt5o2zJNjbDodoEkr+T/gjVKl5vuENqu/hmNcsD12TCRWYn9ycd/ZxEirJthEZb
         xEYDY3rw/8pggtnddDcGimZjH3KoGnfFdID9ZnBudF4pdUMAwj5duYv7DgUzh4wgqDFf
         svRd5jk2Coie6fRorasF7BMGBNXilchstWsucw0ZgZk5ZczMyQMLCEEqmYko9fl0xL8p
         V2yjBc7wCegS8wPUPNqRe5WY45+Udq49I+xtWzsSBdzjdZ56YM5Rh0eDF8/2HmnsEGnn
         GsAA==
X-Forwarded-Encrypted: i=1; AJvYcCXyQV8K6EV0fkc3COvvy+mu5Gnvr6nZSCxdYVcn5URZLHs8MZbz8E2YHYP8vbyRk7p4wBtRj/aojCjBu9hOohMW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+MsCh3DnS8cTd3HlwEGYS/bwIjp8Prr7VCwXYepsbXUO5phAL
	rBWVzLJN5O8wF39URAiVwr3FnRaU5pTAYV8jze6XC6gKBbuDmg6AQzepeZZ/
X-Gm-Gg: ASbGncsyeEijCzIi1hwS5nzscWTLbJok7iZ2BZbumMATFtHBs5i8yguH+rxU1D/S/aF
	cZoD7uN/1QCyQs4plQPqje3EKBGM64YPKYAqvsxO5eDmiiTJlIuV97YXY8tAgIVPGSE0lyJCFH2
	oLitKJh0PIHQtGD5qxUa4PM/x2k/q1KYEe4Lv5X7HLbBA9nyQEBb9k12PLgXTtBJO86bSDAzdJW
	FgaWSL634UQoPtnirQPXB7DJBtw2daYrbe9iSiHeDJ7TgtchCoNfHNnkyP1bzfb5A/60YEHJCT1
	wvfu62a/JbxaDg==
X-Google-Smtp-Source: AGHT+IHr8JNcqQqR+LtyBoz/7LIm8kAmcNeNTA6xnsemS0iK93KOoyU1u6Y3C2oi2X1tNffQhUYzXg==
X-Received: by 2002:a05:651c:2109:b0:300:3e1c:b8b1 with SMTP id 38308e7fff4ca-305f45da72dmr43313741fa.18.1736524812281;
        Fri, 10 Jan 2025 08:00:12 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0fa064sm5291921fa.66.2025.01.10.08.00.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 08:00:10 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30229d5b229so18667701fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 08:00:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPipdid8zpdvUGdLEfUqr3RjWI4WkHpJpjTJb2FUC36UYYU7U1YcQFpNayxftxHFhjdJ/FdUGTd3OxezwQubzf@lists.infradead.org
X-Received: by 2002:a05:651c:19ac:b0:2ff:cfbb:c893 with SMTP id
 38308e7fff4ca-305f459ab20mr34723811fa.6.1736524810623; Fri, 10 Jan 2025
 08:00:10 -0800 (PST)
MIME-Version: 1.0
References: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 10 Jan 2025 23:59:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v64p9S+o7+97GqTHak1PuVR2AUo2H8BQmmcFgA7CSiFKtQ@mail.gmail.com>
X-Gm-Features: AbW1kvZjBbLkmy_SyJ-PR0LLBGaZFrw-ONgajjMHJLqhUh37HElpVRr_LdJUQeI
Message-ID: <CAGb2v64p9S+o7+97GqTHak1PuVR2AUo2H8BQmmcFgA7CSiFKtQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: thermal: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_080015_496190_3223B055 
X-CRM114-Status: GOOD (  11.43  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jan 7, 2025 at 9:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 48 +++++++++----------

Acked-by: Chen-Yu Tsai <wens@csie.org>

