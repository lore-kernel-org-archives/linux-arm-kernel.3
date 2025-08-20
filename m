Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5865CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPixgx/r2pzG9SYlVyxWbRJbcFdefcug1MJMB9A4a4U=; b=sOfmofwDDrB6lG
	brKLNBGy4H68oIWWFVvOMsQFY0JdpZG6VwDqwYv6UY4pqHGQlOLMnQCMrzzwDa2TMsKY9JFaZLKO5
	kQRCP/lA34Ak+jeYTjR5FK3W6SYPpvyo21dc2cE95H9jOcM5xhiTykinKmI85SeSjeem/J1aH5yKV
	FkRYhfH7bTsKzmUU+9CLlON6OXbE6KFiuWL8RsoYqeQ3mfZNOphzsCnah1MgzHrh6Sivy427WtnQn
	SHLysmAjns6q07rSYJOIT8UAzRcCULNa/AOSNuWxWQPMCwkUzvx0vdEAsrto95hZj42Z9JVVK+SEJ
	olfp5CuNRcLr2tuhM9lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojTd-0000000DwgA-1lSk;
	Wed, 20 Aug 2025 14:07:45 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoihO-0000000Djs2-2NnP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:17:55 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so5155005e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 06:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695871; x=1756300671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPixgx/r2pzG9SYlVyxWbRJbcFdefcug1MJMB9A4a4U=;
        b=aJWlPe4FoyVvN0toiZGyAlewC9mbM7uiwqAxTiVPf76ULFdcotay4v9ES0mFPJhza6
         YcQ1si6VK5s5qhL/bNQY7+kRw/WIHyghMlCspgElpx5IH2JjK7F/k4D4bk1MB8Gc29qh
         iwCKZR4fwH/A4FuZp/uC3JTKBZuf+ovAK6KXNXkJa+QU1p8V9HyDqAgJXEx8hZnjT+0+
         uAnYzTnmFdDWhXZDLOR9KKtbSGwj6jRf1dM6OSANpRS57LmZvfxj/6FPDpJN00X38QUt
         Q9jgUXV8NO7d3AFKTAoAVFJ0TRaUvp4wnW2GNSl0kp77k2QX8h64nDkuSRSpnTQQNaxA
         DDeA==
X-Forwarded-Encrypted: i=1; AJvYcCV3IyyAc1+WIzw0/CXREbY9IB5BIJ+BYLI9rrHLSTwFbtu/MfhgvLxTdYlc1FWhrU9Rll0RkgaFmEU+ZVLEKHru@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/2sNR/DcwW9wchFxJ4R96RD8U7kx7P3RmMEmlkqakI4XOWIVW
	19mhagCI1CbIEGjaqXtIMR/fny2hX6qT0MlU3CKXOBom3oMdpfSS618L7FC0m0NX
X-Gm-Gg: ASbGncu5kbXy7ZYemLw15/K6KWKoO01jNoR1SOLHXtef3IZa7sJPt8QXkBCxTRmczy4
	rYSDkMlZs4XgyHKCFLwfE8HOh74DAxH3uwY0hmfWNkwSGNL9Ue8YsABmRjbL/F7Gk2dTVmIwX04
	6vo0LSb21lUs6S2E529t3yb/6xgQOMqjiEmn9ve9yWKFr6c/qQOpYylBaqFlynW91KYWK3BoghA
	WfrVf7YxcVq1X4ws9NhIJ9YhDwbOj9Zd7xIan9CjuNjOIBPPqXMLf1PnBYZ2kEShFHG/dYq5OJN
	DDTOjRZywJZwMvijSf4syZRwDoftaQcMWASsff1kHF+3QBW9OmndArd3G2E0ijHcnMYn6kCp6bv
	SIbynI095czAjV+r/s8G3A3BsKuOP7KbNeHt6Gg9JrMXg3strmsE=
X-Google-Smtp-Source: AGHT+IH1RlKgqQnUaZWfqcjZX4zQngGPJyh7z7Z3FMioJ5BRfrEPcRSOkTCB40noiZDqb4XJ2xt0yg==
X-Received: by 2002:a19:6a13:0:b0:55b:96e5:195f with SMTP id 2adb3069b0e04-55e06b2c4c2mr667998e87.11.1755695870647;
        Wed, 20 Aug 2025 06:17:50 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3525sm2562553e87.108.2025.08.20.06.17.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 06:17:47 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55ce5243f6dso7162541e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 06:17:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZF3uySI3zueHw9aUcFI0PImvadwg4+7S17y0hn6PxnMRT585Dl8TEkVChTxWlwAUEB9UUH5O0gt93Z/5/WRLa@lists.infradead.org
X-Received: by 2002:a05:651c:4102:b0:333:b656:a69d with SMTP id
 38308e7fff4ca-3353bcd77efmr4582191fa.7.1755695867435; Wed, 20 Aug 2025
 06:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250819143935.372084-1-rongqianfeng@vivo.com> <20250819143935.372084-5-rongqianfeng@vivo.com>
In-Reply-To: <20250819143935.372084-5-rongqianfeng@vivo.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 20 Aug 2025 21:17:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v67aScycSHQr+cToshGz=u6vOCcdamZmqBaDbpgD3zg0_Q@mail.gmail.com>
X-Gm-Features: Ac12FXxY1RMn12OMP_6ZvaC7ig2Ko0gOCjNM_-u3K-s-PXBOydhAFgSyE2Itvsw
Message-ID: <CAGb2v67aScycSHQr+cToshGz=u6vOCcdamZmqBaDbpgD3zg0_Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: sunxi: use kcalloc() instead of kzalloc()
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_061754_607037_39FB69D5 
X-CRM114-Status: GOOD (  18.11  )
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

On Tue, Aug 19, 2025 at 10:40=E2=80=AFPM Qianfeng Rong <rongqianfeng@vivo.c=
om> wrote:
>
> Use devm_kcalloc() in init_pins_table() and prepare_function_table() to
> gain built-in overflow protection, making memory allocation safer when
> calculating allocation size compared to explicit multiplication.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/s=
unxi/pinctrl-sunxi-dt.c
> index 4e34b0cd3b73..5f13315ebff3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -103,7 +103,7 @@ static struct sunxi_desc_pin *init_pins_table(struct =
device *dev,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       pins =3D devm_kzalloc(dev, desc->npins * sizeof(*pins), GFP_KERNE=
L);
> +       pins =3D devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL=
);
>         if (!pins)
>                 return ERR_PTR(-ENOMEM);
>
> @@ -199,7 +199,7 @@ static int prepare_function_table(struct device *dev,=
 struct device_node *pnode,
>          * Allocate the memory needed for the functions in one table.
>          * We later use pointers into this table to mark each pin.
>          */
> -       func =3D devm_kzalloc(dev, num_funcs * sizeof(*func), GFP_KERNEL)=
;
> +       func =3D devm_kcalloc(dev, num_funcs, sizeof(*func), GFP_KERNEL);
>         if (!func)
>                 return -ENOMEM;
>
> --
> 2.34.1
>

