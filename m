Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC9ECFA466
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=; b=4Pe5ZaFKDZOFzb/onjYqdYza35
	RdPDgWoW89ADgiPjuObgCOpO6/9XMh31bE72YUiPn8g1qXTbkeQKxaz5BHOthDi8NIzDHxqDzgUpL
	u5dyk99NnUsqKPi3bB4SQb1i/vBmOHi3FG3JE5RC8gXEAUYCCnbhy9aijo52IXdwRY2e3vVz95mld
	Q8DyyoDRX2bII2SVw6spEkaTVf9Zx+v6GZThjK/9G8K9pQo1PjyGYqwL/wwnIxstJKAPmhy5qtPmt
	LdXxqiEoUr1xelB8ua4pRJZDtIjfe/n1YFLAnL+qzjpOS4cZlFr1fpxCI2XgNEnGxLn17146lzIdj
	+gjhB1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hh4-0000000FmhY-3XUs;
	Wed, 23 Oct 2024 20:10:58 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h04-0000000FgT7-3amN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 19:26:34 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9aa8895facso11129566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 12:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729711591; x=1730316391; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=AuouFuqzupJsugKkO7q0hk7cEiLnkdbOmBmLlqVVufDH67I/2PXdHS4Ok7GJg3jZac
         cKEX3FlNX37EeGGlkj3Ppv6Bze4Rnkf/M7TK/ye7TMpJQZpA+bSd+ISHkQh22lKUp2U/
         klywWVtAwhNAk5sjyj0CyigG4khkL3TLN5bIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711591; x=1730316391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=KgQypGoQ1bQ3ssUVXWCS6LEQm/iTvpW0c6dp3xVO13LyBZH5Od0WGEwq9DivIvrrds
         NdLIlsfeVED31zZLJ5SPF5tx9H2CRvqGEjhX26WFG9pwqMdxeO62hn44GKm1L76yXJdI
         m2CnKTTl0b5udaDLZ8oJGLH1yR3rEYUBLt9pBDXDhEKe8hv/cbhViau+m9d73R6PoySq
         jqFtQtWSZg6cBTmIXgkprstjxX6X3swJ35ULtGsGR/vaJmfHCNw50RA1d3Y/xVXNoRlF
         +eE+zEO1gRC2LHBjk8LxjUt9Ipjx9yEbfnMgP6d5Ddkdzs7ZZL/mBfB1igAxMDS+qfsX
         flbw==
X-Forwarded-Encrypted: i=1; AJvYcCW95k4sBnt8YCtmvjiJkhYlLfmNgrY1VIZBhiyL1dwTXC8o5+fydhjk6+KS+s8Jt1RRoiX6OoeKoi/O6Q6PSVNZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa+oIQSvQUiBWiPUQP1Gh+YSmQcaGaYm+N9kWYRecy+AMK2dcr
	NLjHMz5S3YJ8gzz8zpxJEc76HUMRXByVbdjZZIScq4GH4sp966HRem0CH51g1/3v9P06Qtu4zl5
	ZozwyIg==
X-Google-Smtp-Source: AGHT+IEDBgEKinRa7a0TS2IjumCmTq55pbnquReqe+TJEgZ9P5Ls+8pZ+kS5Mt9QvuFqrEj4HCuj3Q==
X-Received: by 2002:a17:907:9720:b0:a99:43e5:ac37 with SMTP id a640c23a62f3a-a9abf86652bmr384218366b.15.1729711591128;
        Wed, 23 Oct 2024 12:26:31 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559b33sm512621266b.116.2024.10.23.12.26.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 12:26:30 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so12596466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 12:26:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXza8W9NGVyi/7ezDQZjuvbZHpOBZ9B91OL8uuzcmSpET0y0vMpeOfQLMtiOpYGy7/NugXjL8ssDA1rS0pmXn8R@lists.infradead.org
X-Received: by 2002:a17:907:72d5:b0:a99:f4be:7a6a with SMTP id
 a640c23a62f3a-a9abf91ed4fmr407338266b.47.1729711194415; Wed, 23 Oct 2024
 12:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org> <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
In-Reply-To: <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 12:19:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Peter Cai <peter@typeblog.net>
Cc: Tor Vic <torvic9@mailbox.org>, Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, 
	gregkh@linuxfoundation.org, wangyuli@uniontech.com, aospan@netup.ru, 
	conor.dooley@microchip.com, ddrokosov@sberdevices.ru, 
	dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com, 
	geert@linux-m68k.org, hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org, 
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru, 
	ntb@lists.linux.dev, patches@lists.linux.dev, richard.henderson@linaro.org, 
	s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru, 
	tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_122632_939034_8FA4D4ED 
X-CRM114-Status: GOOD (  10.55  )
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

On Wed, 23 Oct 2024 at 12:15, Peter Cai <peter@typeblog.net> wrote:
>
> Again -- are you under any sort of NDA not to even refer to a list of
> these countries?

No, but I'm not a lawyer, so I'm not going to go into the details that
I - and other maintainers - were told by lawyers.

I'm also not going to start discussing legal issues with random
internet people who I seriously suspect are paid actors and/or have
been riled up by them.

              Linus

