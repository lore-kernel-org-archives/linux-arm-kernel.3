Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0EFFF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 03:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BdFcpz+AcaZJuHG5kH6Dp7Mwp/lMapbOHRN2wu9PUQ=; b=sqvsPAzovc/AvvSdrkisPsMK4Q
	spLGa+k9uZU8Amp3VIDgzXllpon5vgHf58lfXdieY9wSRP90sfnKUqcMDaDWveg+PULiuJRG6gkNc
	UefpX3SPDAez8G+QcHoXpzEfZKIQo5dH7RHrwBN0o3c4li7d+Jo1AhvlhfDxCewrJW68QjovSXRha
	MYypfrX2EOgfSgb/T8QaRTgc+VIgqpUM+UbKFu5WForEe3OBdUWGWZJI/2ZH/HoLTVKy9/vBH2VtW
	KXhZ3ayKQJnm5h0YX42nUPJZvNhKuHcQJMPYtwu+Anml2o2AhbFOjmW5/sOYBsOjbGjWO0EIeUgAo
	eH0E3XGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGqaD-0000000FEfM-3Owh;
	Sun, 26 Apr 2026 03:55:01 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGqaA-0000000FEe0-2ctw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 03:54:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ad9f316d68so40626075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 20:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777175697; cv=none;
        d=google.com; s=arc-20240605;
        b=ctHML6vqlFtnu6KjQhVDkIW00gKfltZJPL0ZS8iXh1Lyt98mRqFPg3XaHnuBrfsAMT
         Jl+LT/B9KrSY2wkRBN4osR+GVLLUWbA+wszPuEa+KoQ37dXhWV9B+rQj1TRruqS9JGzm
         TyRHIof9vpWl1SMvTBjIpzDWeywelFWD7N3SYj752cN/n0702uTiJFDxcZdc67RrtEBI
         MUAa8XRiTVCi9BJMToslqCK4kYGlYIIJlsrKtmlRqj6Z2LxWrVo1JmwEDw7edA0d55iX
         dhq2a+PqdFExV0jqYoarLS2Sx5t4LTxLJ8vcsBtbVebNqbeTwAqgQkCQ6hiOQNcBftlL
         YzKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1BdFcpz+AcaZJuHG5kH6Dp7Mwp/lMapbOHRN2wu9PUQ=;
        fh=TUqjjJmxJMlWgcqHJp97S6Ys/j4UaTXIdnAhMJUr3mw=;
        b=Sl2HKWJtgV7tcChzdrw+eVe6jZH6CLLyXcUheQ6tTxEFORj+kPCGJ8oZDoWjF8+1JW
         ADsBudg5Zmer3uBzJF3+Bn4YTRAIWWXyiYh0V84UYiKGTW9HJwQO9VNvKnYCXxkxHSul
         e2uKHEho9BN9rAM1myuY+Xb3HYXPXE8Dq2wiFnpKB8FsYZI/qT3b0+0ehTz8UMCGEz28
         6Zrji5Gkbhlr5+RT/G2YV3yrSQLK/eI6tCqza+05b0xT90yCdjihz8W8Liy0NIMooQWP
         Tt9oLQ7ngs1LPj0yjUSPHJMmggVxd4CaAPi5lEhQi5yNcqn19pGmO9fnl/8t3491NVIT
         qcOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777175697; x=1777780497; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BdFcpz+AcaZJuHG5kH6Dp7Mwp/lMapbOHRN2wu9PUQ=;
        b=RALmFA3PbA4qFjPRQ9kUYFM4SIytStQwwgZK3bBATspwVmU8aJCwQuaWGd7qh/MttQ
         eC4as9TyWKCEbwhSwCymKciB/hHhY78G3D/5oS5FCr4UMTuTwLMe+CvjDIAYXE4gQ51i
         IKz+Uod8URJRKTm9B1qO3YCYXdiqyzSloIR1w2HGwh5g6qprd9/Oo642DY482wUuWtue
         LBFtHREraAhxoK32kEbx4nu8uPex/V27vZ9kJQte4BQVasIYFTwj2SomzgbXD70F/8yq
         orF9muovVLWQ6oGF6agkT/1LijtL+G2Bn6LjFxOgM8NBmaozaiZmnl4+dnuKlDmjMOch
         ZIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777175697; x=1777780497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1BdFcpz+AcaZJuHG5kH6Dp7Mwp/lMapbOHRN2wu9PUQ=;
        b=Wo2go+8c0kGype1di2oaBwbgb6pFX+nRvqNDb4GwRVaF5RdcB3UTrH83CvhVhEY4P2
         LF4Jyd33H2pKtIsoDRLwKsIStMR7PAE1TMkZNluOs+xSXdjDlnRPWJAtthBVkQsGrKI0
         71B2lMwnbrcqKKqCDtu6F+BXproUreDoo6D9TPYtgSWjHT06WCHAg1+Jb4QOK0Wd/oi6
         khj7lf7uDFOFCTp3ZtRzcbY70ZrXbdjQIIXk/UIpvm9XU7nj3gfXeYZHf4lJpFF4ratp
         a2VCgbPB6Fy4bm1KxYXnKfRnek3sSb8gjeyicIStYjqxKJ0IqSg+p+nhxa20vK969SXL
         Lwng==
X-Forwarded-Encrypted: i=1; AFNElJ/ddhuseOhvUlqNJAyO4R4fIAV1PfUVNqKNBg4KztFQIrvzg2Qdj20kYTQ8YG2Kszc5H7nhXKwwB7442qZe5/pt@lists.infradead.org
X-Gm-Message-State: AOJu0YznHdC6lXXYSNSK6PnagjceqmYCN+9+AlbL2qOhQNn9CIgavg9c
	9TIpLZN/oyaY7Qlz349eQyaPlHd42KCPkQF9S82d/CsRRVbyDKv6KOEv5pe3/HoQ+fV1Mj5R5nr
	nI6/blWHnhGG6vMEfG9U9dhy14j9ym74=
X-Gm-Gg: AeBDieuGwj0A2iN1T4RIN2EkmHBUQA9Y/STR5+5Rr9jcq0foMHlygU81uNXRX8SO/vf
	LAtw9xzcLW08SR4WQ3DDV+sGpUbqMkk7SNKWmI79uBrs3t9v90MTciTd82HSQfb++XuWtGTgYZI
	PYqGuc4htfEHTgydigs5mIZtfanlXfKWCFj+UUEuT9vdbZvHYKPn6bdtowQfPmN2UJR4Ts523cP
	t28bMW7Ch+ONEzefVHdvgjlx+dpGMPcRretE9NqqHuHn+HwSZh7CilUH2uGAYKq26ju5IZPo7Ov
	6fCGH9FhCwoUWwoosFSZft1fk6OhuStX7VK7qe+YLSxe8V3ZQfIwRUkZ2ELP9/TDUH1jqG/RiE8
	=
X-Received: by 2002:a17:903:1aa5:b0:2ae:57e6:616c with SMTP id
 d9443c01a7336-2b5f9e5e312mr361056635ad.3.1777175697342; Sat, 25 Apr 2026
 20:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
 <84cae83c-2d67-4927-aa40-6c416d4f862d@baylibre.com> <20260425194412.1872eff8@jic23-huawei>
 <754b6044-2285-4694-99d4-18d4fd5d8f6d@baylibre.com>
In-Reply-To: <754b6044-2285-4694-99d4-18d4fd5d8f6d@baylibre.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 26 Apr 2026 11:54:47 +0800
X-Gm-Features: AQROBzBzsaXQFVJdkYRHjTgsoiLM-gr_cIOC3RLib6DRouSrwbDmmVsVhdBXyy8
Message-ID: <CAN4SLj0hp4N_WXPxxQcLjY+espY96LfizsNEqJ3L2UF4_GoCHg@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on error
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rosen Penev <rosenp@gmail.com>, 
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_205458_690336_293328C1 
X-CRM114-Status: GOOD (  10.98  )
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

On Sun, Apr 26, 2026 at 7:16=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
> I just updated iio/testing today and I see return without kfree().
>
>         priv->tsc_regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node=
, "amlogic,hhi-sysctrl");
>         if (IS_ERR(priv->tsc_regmap))
>                 return dev_err_probe(dev, PTR_ERR(priv->tsc_regmap),
>                                      "failed to get amlogic,hhi-sysctrl r=
egmap\n");
> >> Should `#include <linux/cleanup.h>` though rather that relying on it b=
eing
> >> included through another header.
> >>
> >> With that fixed...
> >>
> >> Reviewed-by: David Lechner <dlechner@baylibre.com>
> >>
> >
>
Hi Jonathan,
This code was merged into linux/master yesterday, perhaps you haven't
updated the code base.

Best regards,
Felix

