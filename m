Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DB8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wygEz6vt3imSF3NwvzsbaEgG5kEjxbe8ddM+Vd/l/w=; b=MXwedyojGnsAqsRHW3jxOgTFVA
	00SbDyHdVkQkvxZlCDxCy8ALyyKm5ZOJ90KheB4KrKefnYvNUWspb6GZC/Y/sxZCjXT75uxYub594
	oFosmdOeOeRZ+4TlyYZlSqDSBAMbPqnk+oBwcE10JwtIaXg2JFq2eAcXIXOlEq9rtg6jUXwcEYWD+
	ZC1TWlbFc6s+7b9p5OM7dvTqt/NUE37mE3n2+tbg8X9Orv61VuOPjaJV3DFb1KsUYuV+JgH9cDOiw
	NdfaRu889DBHRGyS2OzlBOqUhrkqZ7gXFX8ifJIIxZ7yOwJDPPE3qiw/a9n1yCGAzmxWC6iw2x3d1
	grHTo0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixns-0000000FMX7-3fXc;
	Fri, 14 Feb 2025 15:40:32 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixbQ-0000000FJZb-3700
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:27:41 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so1747595276.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 07:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546859; x=1740151659; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wygEz6vt3imSF3NwvzsbaEgG5kEjxbe8ddM+Vd/l/w=;
        b=MQygrjWDLZJldz9n1aAVGMdDoD7cFiWPjRhXmsTeYjM4NO0FiRKexYfFfTPwGj3GA/
         KYrmf4qMpg6hb65Qs7WGe/ciPjpdT/XpKaTaBKN5CFd4pglzgZFakbXqwBndu/EMFLoc
         bUaEoDakziKS/497TmO5HKzFBP6pbyrt/irtNj7pTUSWLysozJDiQE6hmY6OmN+FvG5X
         HpCRb7U6nbPIlwmwfDgHWgC4tfUEjJYTvIOt+Lf2a/tyS9v5VgxuJ2KRbceQ6YorNFbG
         /drJ9Hl9lRVu6fmNWUGs4v+2UPT4fePuBD9233BvIggvoAQFoNnsqf7+VqtIzK/USUTq
         ooAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546859; x=1740151659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wygEz6vt3imSF3NwvzsbaEgG5kEjxbe8ddM+Vd/l/w=;
        b=qFyIwrZnydtObivBWlpUONdiWbWa9fiOkyYb5rD22qAitsa0Sg/kOZDBeGU8ib/Yv8
         jSG1WlWF5Lz+5q9TdPYocMlxLijuG+Wm1wuFTXGlJG0If2IqUdpUQR2sqFMwAvMPr78x
         hTkploA7rnRZXh/j5TxWtjHnIB0NN29+B0lb4eCwLwAopSkflDHBdyMf0hdBOqQl3QhK
         tfr+UuExzL+1XB6geM1PXhd4W4MQnX4+XRVIEzmS65LtumS8J4K3yNILpzZY5qaoSVo1
         qOvzm4J5gofyd99ZIU97/ASj1viZEl1E/p4WKWJorG3qL+swZtbEExTW3GoVJvVVVmzQ
         Ql0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjflICX84KtQ8pnxVKtSRyic/GwF2WPx5yYIz3xMGFLJBYpwq/VqGAU7jVmkpnTh1SsngHI57ES7jOya2xqnsN@lists.infradead.org
X-Gm-Message-State: AOJu0YykHnHXsDT+/XiJrXdKyx9ulZ/qtZtD+6oIAAOe5ObetUPSjeF7
	OHPMP8sn/lsYria5T6tit/sj9sgeXUYAEpcoQ/j8MexjWLb3oT3DdqjIfe5tDvZQbcOTWjm3HA+
	R4NOZjcTQAkNdt0sXI8N0oye/nMHjn8RESSE4Ug==
X-Gm-Gg: ASbGnctQXAPYaNkXN1xykN9a2mamB4ZQmEfbuAk5bIfTFf7G4eE3gueDhmTpJpNrG0+
	D/ujTpjz0PQVsxYdCdzzo4xVsDkE8A2MBAJrfdOZWffnya3TB61mPWmJj8zLIvxcE8xnFrYwoU8
	dHU60+ijCi7ewmR5Q+V2LrBIt+MRqmDIM=
X-Google-Smtp-Source: AGHT+IG4t59iStpuyGq1+m+dvxq6YGK16dQkcUOiGs7tsyDTNdFxcN+r/HnSGFs01wlQ6aVqrC6vhWCS/t0g0Qj+n0o=
X-Received: by 2002:a05:6902:f06:b0:e5b:21fe:d9bd with SMTP id
 3f1490d57ef6-e5da81026d3mr6137510276.10.1739546859693; Fri, 14 Feb 2025
 07:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20250214-spi-s3c64xx-fifo-depth-v1-1-e1b1915e3ee7@linaro.org>
In-Reply-To: <20250214-spi-s3c64xx-fifo-depth-v1-1-e1b1915e3ee7@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 14 Feb 2025 09:27:29 -0600
X-Gm-Features: AWEUYZkkGWUD60LMpHEHi4hDR2nuH8MPeQ82wDcgpZ-r7ywAfZ4HSSClhEmifNo
Message-ID: <CAPLW+4n3bQOGDewkh1Yfftticp5n3sOnvmVxgNz=rnmWVf6vmg@mail.gmail.com>
Subject: Re: [PATCH] spi: s3c64xx: extend description of compatible's fifo_depth
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Denzeel Oliva <wachiturroxd150@gmail.com>, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_072740_782923_B6EAE6EA 
X-CRM114-Status: GOOD (  19.09  )
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

On Fri, Feb 14, 2025 at 1:32=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> The FIFO depth specified with the compatibles's data is used where all
> the instances of the IP define the same FIFO depth. It naturally has
> higher precedence than the FIFO depth specified via DT. Specifying FIFO
> depth in DT becomes superfluous in this case. Extend comment about
> compatible's FIFO depth.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/spi/spi-s3c64xx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 389275dbc003..9c47f5741c5f 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -139,7 +139,9 @@ struct s3c64xx_spi_dma_data {
>   * struct s3c64xx_spi_port_config - SPI Controller hardware info
>   * @fifo_lvl_mask: [DEPRECATED] use @{rx, tx}_fifomask instead.
>   * @rx_lvl_offset: [DEPRECATED] use @{rx,tx}_fifomask instead.
> - * @fifo_depth: depth of the FIFO.
> + * @fifo_depth: depth of the FIFOs. Used by compatibles where all the in=
stances
> + *              of the IP define the same FIFO depth. It has higher prec=
edence
> + *              than the FIFO depth specified via DT.
>   * @rx_fifomask: SPI_STATUS.RX_FIFO_LVL mask. Shifted mask defining the =
field's
>   *               length and position.
>   * @tx_fifomask: SPI_STATUS.TX_FIFO_LVL mask. Shifted mask defining the =
field's
>
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250214-spi-s3c64xx-fifo-depth-6787f108be83
>
> Best regards,
> --
> Tudor Ambarus <tudor.ambarus@linaro.org>
>

