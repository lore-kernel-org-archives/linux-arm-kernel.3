Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96169C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GeYTXENMr3flP3ciwo2GiPqCMR91G8nXsrWmZtyddE=; b=X1Ab7jVpDoo1Pi+qX+j2cJnn1M
	Br++T0/wHeakioCAYX5RRNfRX+xAmYtYfhDA5/lDH0+J2Zn53UJKmoJc9YZEYWXYdgyUhEFB+tXug
	A6FyGi+zEQYHWxA/DdDtct+ga0wd3mtZ/iPX6PzjqP+abIiCfOvPfIBTezNHqXeylUm6yYnbb8f5N
	2gIlcC41lK+9cjQ57K/+h6It26r3fxqVoMjHb56bgpt8T2q11I5jp7YyvXcW/ZIax40QkhPAALiS2
	rJbyqjHo2c6AFuPOVLYDztI+OKCI1S/KG3Z6SKPEJNX4cvq8YLE6Bwp5zP52K/mrXioB156CAREze
	bC0HjQUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjO-00000008Y6K-0Egc;
	Thu, 27 Feb 2025 19:39:38 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngnG-000000084zA-37Fz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:31:28 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54622e97753so1163596e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 08:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1740673884; x=1741278684; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GeYTXENMr3flP3ciwo2GiPqCMR91G8nXsrWmZtyddE=;
        b=DlaZIWLSYfsPOxFz6awDmcSj9eWdRTmcutKegC+Fpae0xbjjguKteuvpj2lnMHANFQ
         MwcyVOt+mtqXkvIivxaE9a9jHjeCWEmI1EJZ7xs33bWpQHuqA28oX/ydUbHTSKJGo2rD
         YzDjLHa4f/zmJ/AATVU4e3PP+wjvdqwbjUtAcyozpv1vAi/AwbvYvLGgyICb3+oAuSCf
         OeAXxOUKMJpC+Mvqxy9QxV8Spa23j5zqE0AMivArcK9dO3h1ZIPbKYKMEdhNBzrBu1L4
         K2EOmzET4XJpCqfLbiw1XQZLzJvjKYDNn9EwCZETUBwzyZr2/RMSVJWKcaqpEOdrlO7J
         AVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740673884; x=1741278684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GeYTXENMr3flP3ciwo2GiPqCMR91G8nXsrWmZtyddE=;
        b=TazIAADxs0z6rTWdHTcbW87rr2prY7ucHyrwT9TE+mTNqO8pRZczrkC44NRQXhc5pJ
         xO83f0pGp1yQyQzW7gnU9GlW7q365eLAMjlnj2kndvywLfaYm9+Aoksu52rUmpPdKtYF
         eFUdaWr76AABdIrP6WukyhCwtUUl6W/inonSAsDoRH1FR/GF0IjERqr/kP7tLXPJwRUS
         rLzXGPHO5zmmJTVBJu+jkLVXF5aOfeJkehg4yhGrSYvCsO0UbiQQLIo8e5LB4MD19BRH
         nEhnGv4Pa5Zr4Y+16M0dC9WJLJV1ereCK2ZSWOMgP+VHrnbGYCftPy+37U5iIFRU2Cdo
         jPWw==
X-Forwarded-Encrypted: i=1; AJvYcCXrRK93+vvfCVqkNqdjVNJLHEpqRx13QKFZxylgZEGsYiCH+LeNc9DHBbcAyqpFc09ylsY6Fm0WJGwRihrrF8YT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5WvKbn0C4I5HV92/ni6VnXbt34V1Mpa6WokSjnPBlU+6PGSFO
	QYLnZG86OdWLZmAtTGAu49ZyQHaAr6AD4VkASXR6MmcXybjAMnaWkV0IYBy9CJoBFT4qIwajblC
	kTxEc9XsOpQIXd4FZ5iif9RdQyHLb+Aa45eimcg==
X-Gm-Gg: ASbGnctGY6T+3FnRQhbjmQJ1bysSneg376YJ9XBTrzLAaUlmMpKoO9KywGVVBeZ39IF
	8KM4p1nvg1W1FR1cZH/5YEQKOJfHoxfCg2dFWo65lEtvrS8pPzARB9JTGhRDmkq5s0Jpab7R7wq
	bdjYU0tXjpQhDbwSvpREM19CfVtkIXK0KpJbZ7ow==
X-Google-Smtp-Source: AGHT+IEUbAC3kjl5eNNXKnBI/MMkmVbVJWoGnJKM7ezHnOTqe5P7XXqY0IVO/n+TvmfZpG/9CNbmwSisZkbfQ+rFnfw=
X-Received: by 2002:a05:6512:281d:b0:545:d54:2ebf with SMTP id
 2adb3069b0e04-5494c107e76mr52906e87.3.1740673883880; Thu, 27 Feb 2025
 08:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20250204194115.3899174-1-ninad@linux.ibm.com> <20250204194115.3899174-2-ninad@linux.ibm.com>
 <fd92f75620e48957c2875cdcfd1285c33d3176e6.camel@codeconstruct.com.au>
In-Reply-To: <fd92f75620e48957c2875cdcfd1285c33d3176e6.camel@codeconstruct.com.au>
From: Corey Minyard <corey@minyard.net>
Date: Thu, 27 Feb 2025 10:31:12 -0600
X-Gm-Features: AQ5f1JrxG1t1lSqYDcbZpYZ-TVphariQNf3aM6dUFwiyKs1tLOEBbUdBR-9V5Rs
Message-ID: <CAB9gMfqkRZY3y5V+WDyxvyrdzWNWu2gjmyEnj8mygo85hjX8sw@mail.gmail.com>
Subject: Re: [PATCH v9 1/9] dt-bindings: ipmi: Add binding for IPMB device
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Ninad Palsule <ninad@linux.ibm.com>, minyard@acm.org, andrew@lunn.ch, brgl@bgdev.pl, 
	linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, openipmi-developer@lists.sourceforge.net, joel@jms.id.au, 
	devicetree@vger.kernel.org, eajames@linux.ibm.com, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_083127_273044_99A4D5A9 
X-CRM114-Status: GOOD (  14.49  )
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

Oops.

Go ahead and take it through the BMC tree.

Acked-by: Corey Minyard <corey@minyard.net>

On Tue, Feb 4, 2025 at 6:01=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Corey,
>
> On Tue, 2025-02-04 at 13:41 -0600, Ninad Palsule wrote:
> > Add device tree binding document for the IPMB device interface.
> > This device is already in use in both driver and .dts files.
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > ---
> >  .../devicetree/bindings/ipmi/ipmb-dev.yaml    | 56
> > +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-
> > dev.yaml
>
> Would you like to take this through the IPMI tree? Otherwise I'm happy
> to take it through the BMC tree with your ack.
>
> Andrew
>

