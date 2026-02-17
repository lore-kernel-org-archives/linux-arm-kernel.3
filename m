Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2703FE6816F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31wGoQCrJHiHHoy6Arff+pnfQmk9AyFwMKxIIalQup0=; b=PP1RUXbmlCPQGYEr72kK0afOuj
	oofO+99+N1GIfVI2rtn+tBlYq4LvbpFSo28hQaHIof6X1zlDzRSNWwXILYVQAzxIcs9/CZMVaEH2e
	JB4SnLWAF38iVIRr+bJRr4XxPpwTm6Y7ubjHEuReNV3e3YllT6SB8Mo4KBXJcyMopiSWFu2t0W1Wg
	3pHGCpovw4g5cJEcH+fIW6Y1L2d9OJ3ZDmego/7uTQXu5NIRHOH8cZgGgKNfBq21jQWV++Ju+cgf4
	+esBvuqv4BRNTTKKc023P69lwyr8B1ACh+k+ghuu/KLZf/QbfBQyd7HJ7xxjOunqWy0OonNfMo1ot
	gFS0N9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIrG-000000084dM-11CA;
	Tue, 17 Feb 2026 11:03:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIrD-000000084co-3nHS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:03:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8337D442C5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604F3C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771326186;
	bh=31wGoQCrJHiHHoy6Arff+pnfQmk9AyFwMKxIIalQup0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=kS2/fK/F3NXnxlB/UQJy1PmXbWyHasTYR8JPJlTKlfDXlckXkzWlJa0FVxiAPcDdJ
	 kabh7Yksq6+AbmiyfaOfBFHCRPQKO1Gf3175jJkcJyRo7V+BldsA9b1qd657Ee3GJR
	 xxooqa95En5DIDcfD79U7QGYwxTLZvL2BA5jpJmw2bHewfHZN1+scuFhjwzb6+Bs4T
	 F4sr7GZDDKVf38SRDmM4Z4kiPxzNkY+OuPZv7jH1TPHLSJvqs97WkoV+KjdiJGu6WY
	 nCASxOHxMk+0ownDSswvYJYawrffEGcu7YKYII0iwfR9GarusG1eOncEuYKOXDE+Q3
	 h1ytUERqLEq2A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e614b3dbcso4296967e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 03:03:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTaHyo6WFa4RExwbgZk0l3Ha0FRBP8kPhB7IRdPQyGXT/GcgFEVI06vFQUVF78i0IJGP9l5KX/9yhZnFiqecIq@lists.infradead.org
X-Gm-Message-State: AOJu0YzhqII7QUuOiPh60S9984tUW6G1Ik8Gs1Ng2lra+5WXVfxk5Oxi
	3ATTUPO7peXRzqZzw8gg4B+wpecYExBAphRIP1vVYWLI9Zm7P/AV5gVynihPTQ8IL0Id3HpfA3Y
	cBQB0iAuSglJpoL2v1Vtf5VNc3/TGKT+nzmalfPXnOQ==
X-Received: by 2002:a05:6512:1050:b0:59e:4786:2823 with SMTP id
 2adb3069b0e04-59f69c3d26amr4503376e87.23.1771326184953; Tue, 17 Feb 2026
 03:03:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 03:03:03 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 03:03:03 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260216160946.2977985-1-wens@kernel.org>
MIME-Version: 1.0
References: <20260216160946.2977985-1-wens@kernel.org>
Date: Tue, 17 Feb 2026 03:03:03 -0800
X-Gmail-Original-Message-ID: <CAMRc=MckMbg6W4d7x5OKvTEq-Gawqh1mzY+fvddhxjDv7Si0pQ@mail.gmail.com>
X-Gm-Features: AaiRm50etZVT4Nx2EmA6QKebjX2RBcYIpgTucEC8eTHgaygABndvmN-wh6OFaXg
Message-ID: <CAMRc=MckMbg6W4d7x5OKvTEq-Gawqh1mzY+fvddhxjDv7Si0pQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	James Hilliard <james.hilliard1@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_030307_962435_CBE1A797 
X-CRM114-Status: GOOD (  10.03  )
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

On Mon, 16 Feb 2026 17:09:45 +0100, Chen-Yu Tsai <wens@kernel.org> said:
> After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> gpio_chip::get_direction()"), a warning will be printed if the
> gpio driver does not implement this callback.
>
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

