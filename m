Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD54CFA452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tuzyAe8JQhERe3dQ6ji28tLfp5niGHH7P19VuAauSs=; b=mUAujFJZDIqJX12kIo1AmsOMCw
	AkcVx5R33XjWgVe83kOAQ63ovYAxxwiRCcbJawGQMPncVq120b411Wy6YWRuTAWZz+B/ZFeDS1Czv
	OzquEm4bLm1hGkSdeQYceSt2E53+wOL+at1LXjYE2QhAHaEUDM5IcOQtvvwFWI+qgXe5w1n1nrU7u
	fYNy4s3hfPgJYFX6KhR6fiaYILkbuaxCA1GgykwmUFguZSBffpziKSkZ9iXWUNke98puk3faSB8Ii
	+WaIfvC16B0fvHRqllWiQCUNjhRpwx3UKWUvD2kZZD8oPZk3P4jzV52Xb0bBHOjwOibRRHi1BaCq3
	kThWCZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3egW-0000000FFPV-24Qb;
	Wed, 23 Oct 2024 16:58:12 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cuz-0000000EsQ0-0pJx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:05:02 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5ebbfcab9f4so2041687eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729695899; x=1730300699; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tuzyAe8JQhERe3dQ6ji28tLfp5niGHH7P19VuAauSs=;
        b=bAKZ8y9b3oSyqhFH++f8K0IdSTgBVcMJJ7d29uv8ltVOECwWi9byoCgY2EiiZsLTy2
         iXwqVtTRbd75p5IIZRZiK2XePk7tX88nfS5sInsWHbbS9aMFD0ONeU9CFssTFiICTQtM
         hzinaI4wtN+T0/Cw9m3rhhd0K7VbG697qEGZbde4Fu3sm9qwIZOxEgC1hrNbbFz6HAD0
         fv/m4wJd8m4/N+xT2Sr/DPCV9bT1gz/Ye7zXfZGVD5EjWJ6XvyQg6YUT0JS2N1ZAeDSY
         j5iQoKo4VrB/c6V566nubGVqMGCg/FLjXNX4EoH6tdQXUlyUFvlJzJ/xgHpodiUx4Xv8
         vVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695899; x=1730300699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tuzyAe8JQhERe3dQ6ji28tLfp5niGHH7P19VuAauSs=;
        b=JVOOeZxPQQtCAwPyFHueo37AuPVLOzXCPJWcFFr7CdjQ/19TkyKWMWznP50w5r6Aof
         8LhJuvBdBB9VJ91gbOFEPSPcfnv62L22sJjORUD04YzOO2NihhhaBysMRl/es5nZUv8V
         sbGEU+CGLjv+RMyYFF9zQinh2dq4RXq19bz/Fo4pn9BOYkHjvF/t8kRd/ap8bG+cQK8w
         CNH8bu+SnMgCqnKhqxJgm1mPacv09chkFQeylrRgs7HakssFQ9lzd7hx+Zf2f8SvBNKI
         cZc5il2IQYMoGBz1osxZlKydOt34TIyVaPQ/+ssOZWkS/hR37k/vBmtPrO/6R1UVTknj
         cjLg==
X-Forwarded-Encrypted: i=1; AJvYcCVykUC3YKJyZSIuikrgR73YMQKZDNJ8CXvT+nwOX+Ql2hGtbXuJv7CxIeiOIPrLbMtNpcXQ1M06BICaQLvLcAEV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/GhdtLmuZDPxgYZTQcwwKnllqUh32gbZMYoOjij8gElr+J3fq
	2h4AnFtsUJ/ncrH1KUmbbDDYxHu6C4Gzr3M0Cpt33+uSHHqT3Tr7tveKiar/vRfY0sjhwvbSvHC
	6tNtiMzt/5oe+0yFuZjlP0fURg4g=
X-Google-Smtp-Source: AGHT+IELnyS+e/TN/dMdHzvAA3dedAZFpyyaBekY76IOdFg+Te4WZUxhJCCdMsqShzs8WjVE+pUlBhArE6QTMefHWi4=
X-Received: by 2002:a05:6820:1c9a:b0:5e5:7086:ebe8 with SMTP id
 006d021491bc7-5ebee308838mr2092425eaf.0.1729695899332; Wed, 23 Oct 2024
 08:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
In-Reply-To: <20241023080935.2945-2-kexybiscuit@aosc.io>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 23 Oct 2024 17:04:47 +0200
Message-ID: <CAMhs-H_2tnpeynm2m9KNGL1GVU9m+odSnTk6F-WKLruMfEjXUg@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Kexy Biscuit <kexybiscuit@aosc.io>
Cc: jeffbai@aosc.io, gregkh@linuxfoundation.org, wangyuli@uniontech.com, 
	torvalds@linux-foundation.org, aospan@netup.ru, conor.dooley@microchip.com, 
	ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org, dushistov@mail.ru, 
	fancer.lancer@gmail.com, geert@linux-m68k.org, hoan@os.amperecomputing.com, 
	ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, 
	manivannan.sadhasivam@linaro.org, mattst88@gmail.com, netdev@vger.kernel.org, 
	nikita@trvn.ru, ntb@lists.linux.dev, patches@lists.linux.dev, 
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru, 
	shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_080501_263713_44E001E8 
X-CRM114-Status: GOOD (  13.27  )
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

On Wed, Oct 23, 2024 at 10:20=E2=80=AFAM Kexy Biscuit <kexybiscuit@aosc.io>=
 wrote:
>
> This reverts commit 6e90b675cf942e50c70e8394dfb5862975c3b3b2.
>
> An absolutely no-one-ever-reviewed patch, not even by the maintainers who
> got removed themselves - at least not on the mailing list. Then the patch
> just got slipped into an unrelated subsystem pull request, and got pulled
> by Torvalds with not even a comment.
>
> What about the next time? Who next would be removed from the MAINTAINERS
> file, the kernel.org infrastructure? What if the compliance requires
> another XZ backdoor to be developed without further explanation? Is the
> kernel development process still done in public?
>
> Are the "compliance requirements" documented on docs.kernel.org? Who are
> responsible for them? Are all that are responsible employees of
> The Linux Foundation, which is regulated by the U.S. legislature?
>
> Fixes: 6e90b675cf94 ("MAINTAINERS: Remove some entries due to various com=
pliance requirements.")
> Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
> ---

Unbelievable...

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

