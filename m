Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B143C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6PrZC21iwen1B31Vi2jxyoGAz00i3RnJHUvEeJPYKI=; b=LyIWK8izAGJzTEo2z2LQkVDA70
	4iTTKjAu9a/865lReFI3IspjtcbmHKF8OwnN/B4YfSs/dzCcgmrPj0H7e+Wn3+m2KuMqOsNrCeBkc
	FVyCzDpb5YuJ5CtD1ClUSZ+4Ex87fTY3yOHO9WC/FNdora5OWa2C+YtokW1Q3vOwmdxg5AHzKBIGZ
	oZlpmrxPsd/jjCUO2TvjhsBh1rnQZFuE3qviKa7cVjZjiyvRq0rVMVirdDpztLwjB8ifHgbW+Dcof
	JCWlqXyx3xsxWbGUMlpUZwG7VJ7kajrd15UrXf2ZmHyrNjuLre9uxQ52s57CpXPYqD+blSwWavgjA
	mb/Lo8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cfa-00000003QqF-1IIV;
	Fri, 04 Sep 2026 22:46:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cfY-00000003Qq1-1ZM5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:46:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 029D044226
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62F91F0155A
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561959;
	bh=N6PrZC21iwen1B31Vi2jxyoGAz00i3RnJHUvEeJPYKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d70iELOPejhaBBj5+6MW44oGn0aWXKRbgAohwfHSsU/NLiIvY/fHQDlN6hkNCQojh
	 KhsDrUKRNEtpUBfA4wXzCclmbNO5nsV0ItTAAd+M7utWhgIOTI88JJVCdlEfYcfHrZ
	 Sp+cvzGDdyzy5G5Ds/uDrCbuGDYAm4vbC6ahg99HB8cJlTwyoMUzwGszByY5/+7QWO
	 hGA+wKRDNsUhZmdcUspY3bXo33TZP7b4J95yD78zG9+PN2BrODGzpSpap7cLoFk2oZ
	 xdMdKxA+P3VuuxMZkwX/X0dNbrCd4U0OrHFZtaKhN8khrcIWsGPUbucNxAh4IFP59x
	 lI2oMGKWEi3Rw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a20c95e412so14289211fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:45:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxc1TC88BevAuZE0Gh9Q4hPwma5wAdWiRxPbD5Tm2a8hu+KNaB5geLF+WUD9cvhZflbG80HMlavI9BbZpLLNZ09@lists.infradead.org
X-Gm-Message-State: AFuF++k1NDzQZn4q6RHXRDoJXmioEZsMjPmrmznKNb4ClkU2AKQFfB0j
	qA7xFqSvpAok2Zpxud1I0/va5iMQmDoIXq2acrmvMISoujFi81bTM+JoK/jCdSGYKzkuLRVojki
	yqeAjXVc8cGPRxiRYGOhl+Jmd6ktgOMo=
X-Received: by 2002:a05:6512:a84:b0:5b0:eda:de26 with SMTP id
 2adb3069b0e04-5b616f2f892mr1623528e87.16.1788561958599; Fri, 04 Sep 2026
 15:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-13-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-13-e918514cb3b1@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:45:46 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tVwQPPCFCc=J6gxBt4VvSJKWKvbAeSRSybfXjvpcdPQ@mail.gmail.com>
X-Gm-Features: AcwNN1WvpRED5iixL57tKxLT16byEdBDfHJOlSmTYR0bXv5jc6tVAgVJ2Y214Ck
Message-ID: <CAD++jL=tVwQPPCFCc=J6gxBt4VvSJKWKvbAeSRSybfXjvpcdPQ@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] MAINTAINERS: add ARM/AMBARELLA SoC support
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 4, 2026 at 8:39=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Add a maintainer entry covering Ambarella CV75 bindings, DTS and
> related drivers.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

