Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE363C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKE184lpOsbPrO/7aA0AY/dhX9Uo/v/klX5HLzOqM+8=; b=1kmzE8KsetnTF16pTdAkiqCXeG
	MZzXnNeMLyeFRJ9Abn1tkK5YjAdIb+8X3Y3KHrIbeTLxDDOC7ULjACRDfl44jCCPsI7/5G/W/x/Ll
	TTwVyNJP6apERRWSd7o8f0bt8nFaB88nLJRVLAHkytZCGnoqgySWm7WPtPLJieRORojoK8q7pUIYN
	RMoQSmXD061f97HgJHQlssVov0+qm5/5BjRxTybftXnVszhuAP/yPkOGn4fa4iezZqwedz31Yc+CE
	LQXNvjtIkEul4zjeW7K1X+tm304joCdyiCPMPFdnlDSkuxZSQP+blZ6X90fS+I3dxk04z5BOVOvQq
	BT51kgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7D3G-00000007BPN-0qjl;
	Tue, 22 Apr 2025 12:48:38 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7C17-00000006zcB-2wY4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:42:23 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso46438911fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745322139; x=1745926939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKE184lpOsbPrO/7aA0AY/dhX9Uo/v/klX5HLzOqM+8=;
        b=SvVawHkBpmw1JMtt3nrSlIlUkfXjfzhfYnngqRw8uZik7HtZIvXiDwaqg2EnQhQknE
         Jgh9CBhumCGOO9aHg1X0vDmND1xzutRLVK9mFIAKQ0j3FwAJmlH/R/ProHpxTrA3j5Oe
         /3h4W9pPHNzxn+DZ07/Ar6ac9OKvfxaoYQNPxOJzeKmzdQlSTlcEdWnPvPEwyrNbjsqH
         oBVkVavIeWrCgs0jLyEstaXezGRT57UxRXPn6OPg450PdDHM6OrsR5OOH9MjxRf5vQXG
         lXBoXNpwoaaJKhDAiRH9rt9Rgh2NzldncM6/JU9AmHpAvc8cyTUZTK+nExpU8XVCSZ5A
         bT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322139; x=1745926939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKE184lpOsbPrO/7aA0AY/dhX9Uo/v/klX5HLzOqM+8=;
        b=nAhBKGQlX+vlqMHzqbRucEdIhzrkWcdM1wAWMjzwIALBu0uwHGYPK6eNkbYNQx1HRJ
         DPmzWm1gICWTykVaV+tnsi5bWM9aXCGDOohU3FXGZNd9d/N03FO9kM1MFdjiNwzifA6o
         Bl/pyGDccvyURiivdqeZdKYFqOeG/JpPu5WXje+7tLIg2vAd6/ko1WZAc6Th00JtDJn/
         nOnt0BZ+AS6mt1SBGdl/xVr+vmH38SAyIG1Io22a+3wXzRyhuoK5V4wgG5kf0IWaegzN
         2Bb7/gYv31r4+k/S0nHheItAgAxRUQm5kn/gL8IzHrUAJO1TZIVuKeYV1yv7nlLbVF1M
         wd9w==
X-Forwarded-Encrypted: i=1; AJvYcCVyGySE2l4YDa19hZpyGoete3Jb3GaJ2mpFLM15kdBylhWX8cXUAk+zSaV7KqunJizwTvCNUNsmOxO3JHIpt3sy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8C7Hq5eRp8mIc3XJ5rZygY5Quz/of4Wa1sCNUc/d4x4Ahmcl1
	4X/qOUT87Z383NcMdPzoelnLIdTMF3+ZiRFDMwdBUYJt+lgCz014zfEZlZtedVzKEqWwoHH7Yto
	G7VUBe0wSJl3m2UtkEMEK0UCL3W+SRH4TTeY+dA==
X-Gm-Gg: ASbGncv49wJOMfaruPxIuNyeAA4Q9X6ajt2osBWguZS1Kz753TY6j9fSg8beFv0WRVS
	3ie8kMltpZ1nnEqlAFtd1XygB0W8AQBAf723Nj/X5x12JYO4u4L6z0CemmjWtLF6njZU4PrnipA
	gfJS1y/Q9nzbGguek3Q/uf1A==
X-Google-Smtp-Source: AGHT+IFm0QuF+MKzFVuJfeElIzDwo5DNp4RQe/j6WQIWdZRVRgiFC+4alaFtOW4po2uWD3T3nU+AwhkSj7DYWaP/Qtw=
X-Received: by 2002:a2e:bc88:0:b0:30b:9813:b010 with SMTP id
 38308e7fff4ca-31090554278mr45541741fa.31.1745322139074; Tue, 22 Apr 2025
 04:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250422095718.17360-1-kabel@kernel.org>
In-Reply-To: <20250422095718.17360-1-kabel@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Apr 2025 13:42:07 +0200
X-Gm-Features: ATxdqUFgffJrkHBIiGCKHha-7JyV-dOWeH_lR9YCYT2CA8Voz9ZgL4-ux_Xly6Y
Message-ID: <CACRpkdZ5EBiyEwEY68_bufnO-qFFH-XKzv5RmRn6=K+rN_NFBQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: atmel-sha204a - Set hwrng quality to lowest possible
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_044221_737933_A0D5DD61 
X-CRM114-Status: GOOD (  11.13  )
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

On Tue, Apr 22, 2025 at 11:57=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:

> According to the review by Bill Cox [1], the Atmel SHA204A random number
> generator produces random numbers with very low entropy.
>
> Set the lowest possible entropy for this chip just to be safe.
>
> [1] https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.=
html
>
> Fixes: da001fb651b00e1d ("crypto: atmel-i2c - add support for SHA204A ran=
dom number generator")
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

Ugh
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I would even tag:
Cc: stable@vger.kernel.org

on this, but it's up to Herbert.

Yours,
Linus Walleij

