Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC3CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 06:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDzwE1C9OW6aHE1z2WW5gUQXUKZ/REkoyeXBwX2ZCXo=; b=QOk6eT9Bxt0UZu6b6T+98WQgpO
	rrgqmG3qST10BS9CICBnWTG9op7LSSxC5aRgE17obOEWbFPh5gzA3LtxWkf5/5Tu02vgXHoSeFgCz
	2ZenavuFI7sWaQvOvyeWo8dALzKHDCgDXiwDsrcveftZNffSLjdG/WEo3vxIYWyDrI36bAblYxVG7
	W9NQ72cOj3iJ+yoNlRpuPQQAKDxJWHRQR4GUUgqK01eGuKU1WnsF+MH7BLZ/LLUkkMdSbZRCe0WMU
	jnGjlyuvhwEv9DxgsjA/7reT/3nU6zEgOwjFfBaOjXVI4U4QKIwy4X9ljSvGyrXV8sraoVJEYevyu
	6tx9ofdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thNEG-0000000GMbU-28ZE;
	Mon, 10 Feb 2025 06:25:12 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thNCq-0000000GMPI-2OQi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 06:23:46 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-29fe83208a4so2355819fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 22:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739168623; x=1739773423; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDzwE1C9OW6aHE1z2WW5gUQXUKZ/REkoyeXBwX2ZCXo=;
        b=AER7+9PrxE4ab+/Yi5kIvkEcy4NYONg3wHSpKHHQ23ql3v/ySjghLOQEW8iL5GuNA5
         mhrXr8vtdfbrZxAiClojoQZTmi5EZ3FCnd8cmyUvoKqGAN23qkDMk+npWRId0Qq6zAgb
         y56oFIjCkhGl50ve5CQ5qCGQP8JVQq6ribZEU102BEm94FKkf76kctoHRAJr1bbwo3Pw
         7udmJcMI8Iom+IXyIRXX6oEDUN6vTkdZcwgyGKT2TtKL/so7PL38eV8wmzelBw8sVHgz
         3cHJzx8tUA8VGTXsT4VpDze401pVvUvKcAdw/mEWzf4lUsQtId8DUwERChVCryK3nZbO
         REEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739168623; x=1739773423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDzwE1C9OW6aHE1z2WW5gUQXUKZ/REkoyeXBwX2ZCXo=;
        b=t1QGbCjzC800Gg0lO9tz+5iv/11SmxP/Huta+eg1cBWDMed9wB4g7nlVK2NNoPC79t
         EuKmQwABH1w2krO4JjR+6PT888US7I4zfKnEmtxHTbf15CoS2Em7IR6QgVFHCKIb47kl
         dyuaVsK42GuwLcFcAJWZozPTEqyOQmbhhyKfqGcl3uUX5eJt8Nq9zvSDfPgnldUDgtuC
         9rMlxHuZ/QQ6OXrNp6odAZsjbSWI+Vcnfc+P1am0QYhA/6LgzGw5wfDCBjr+uWFvDjUf
         AePflc3OwIkIb9E+1I2vjoIQzASmKjGNhttnYlg0ZifC7+tO7mR0RlhYK7Ij7dXiTNcg
         46Lw==
X-Forwarded-Encrypted: i=1; AJvYcCV1N4dC11o050evxEJ5C65sG4WDhcYn1rJcQT09g8ua4D3dtk/F8/kq88q6VhboC1pjbWlKpVkmoI6NdDU3Cb2E@lists.infradead.org
X-Gm-Message-State: AOJu0YwJVxihfCXrL6ZOr1PlJlfJriphazsHNQuCKHhsYB4nDy3J5JKW
	HeuVc7yQ0YqQKCIv0+Bsl/w5lqVy0XZ3mFEhRIEshTnfktW+SzSXnEnb/dheCePDffSL26G3KbS
	bddobpBmk04vu9X/kuLzj7sK2aM3z0+8v6J2zRw==
X-Gm-Gg: ASbGncu/xKvNDV+y2/skIqk8AKIgHz2XBLl9lEYKg+2Fgy5Fn/IZi52HVUvm4TvQhCp
	nMM0nFT6i6nESfWY9iE79HA7vqJSIPMn1ywNmjelPSvXEPiALRX2289qV8Axv5lFVFo+u3NgcZw
	==
X-Google-Smtp-Source: AGHT+IGZ70BM5o0FsBd1A+vRr7iVndFCpaXO8wXRz7nxGxTT6qFDFTzE/2SfzxTsCk6ZlSydNNQa9XmNNdh8W4sa/LE=
X-Received: by 2002:a05:6871:628b:b0:2b7:5726:c931 with SMTP id
 586e51a60fabf-2b84015e5bcmr7187697fac.5.1739168623404; Sun, 09 Feb 2025
 22:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org> <20250206-gs101-renppt-dts-v1-2-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-2-cdfe993fb3c5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 10 Feb 2025 06:23:31 +0000
X-Gm-Features: AWEUYZkw_qqo6LotzQULApj6C-Fj8yrQyxpjnxhL_NjpfmlxfYtcYPkHgHvpKlk
Message-ID: <CADrjBPr9k7QnkFzrY_4Q8A-yrQjErVBaHv1x=oOYacCamn4BuA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: exynos: gs101: align reboot and poweroff
 writes with downstream
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_222344_634960_2F19B64A 
X-CRM114-Status: GOOD (  18.64  )
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

Hi Andr=C3=A9,

Thanks for your patch.

On Thu, 6 Feb 2025 at 13:08, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> For power off, downstream only clears bit 8 and leaves all other bits
> untouched, whereas this here ends up setting bit 8 and clearing all
> others, due to how sysconf-poweroff parses the DT.

That indeed sounds like a bug.

>
> For reboot, downstream writes 0x00000002 whereas this here ends up
> setting bit 1 only and leaving all others untouched.

For SYSTEM_CONFIGURATION register Bit[0] and bit[31:2] are reserved
and say "type R" (rather than RW for bit[1] so it seems correct to be
leaving the other bits untouched?

regards,

Peter


>
> I noticed this discrepancy while debugging some reboot related
> differences between up- and downstream and it's useful to align the
> behaviour here.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index e78dcd506a5c..4f45bfeb33c0 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1401,13 +1401,13 @@ pmu_system_controller: system-controller@17460000=
 {
>                         poweroff: syscon-poweroff {
>                                 compatible =3D "syscon-poweroff";
>                                 offset =3D <0x3e9c>; /* PAD_CTRL_PWR_HOLD=
 */
> -                               mask =3D <0x100>; /* reset value */
> +                               mask =3D <0x00000100>;
> +                               value =3D <0x0>;
>                         };
>
>                         reboot: syscon-reboot {
>                                 compatible =3D "syscon-reboot";
>                                 offset =3D <0x3a00>; /* SYSTEM_CONFIGURAT=
ION */
> -                               mask =3D <0x2>; /* SWRESET_SYSTEM */
>                                 value =3D <0x2>; /* reset value */
>                         };
>                 };
>
> --
> 2.48.1.362.g079036d154-goog
>

