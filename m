Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125E4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40kfap8VDfDH8hk27H/hMJFx9uMBhXw6N31yql9KOwE=; b=PdYfWgxR0nvuMYJxJGhkWuEFTH
	2R7wQtCmxvFpLNzzR8yzN7yIe3AcLdJ1Ae6Geulo3d1N0n+puMOo7+XbDCxlZVGCrUoWXdnhL/hgg
	wOPsjspRfp22hXB8J+65/QJqupZ5ypOpAPjDWupd0F/1tnnZjdcUsGCBPtOPbfMBPvw5pdyZI/pXK
	tiyKhzgiGLedEcj08K1Tzb3kFlpRmFzUd2Jca1RQ6H4SB7QqZKE69vtw/cPnDNFIf8x/LUswEYh5L
	N0OJkffuFGBQQgtq6FfM5gaKWa+4ONWMHpV1mf68Vi0kkqU25zRxTtkxGBoeyYijsN5rMSML5mi5I
	IxRMT1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixmT-0000000FMKf-0sJF;
	Fri, 14 Feb 2025 15:39:05 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixZs-0000000FJ9k-3AKz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:26:05 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e46ac799015so1628888276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 07:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546764; x=1740151564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40kfap8VDfDH8hk27H/hMJFx9uMBhXw6N31yql9KOwE=;
        b=qrZVGfKPSDYJLEwm3e7iHg/MOuS3MgDDVAtGF8d1e+ER6lRMkgsf4XTMjPX40Mnjb+
         eNztgnDx/5EFayWsZTK6JD1n+yvgIaoS06gVU/51wCXySjFKfaj8hU/GK5I6PbMKq72r
         nXiTmRwMSHJQfL0tJHeTl0PwqjIcfRazZq1wdfidgXgq15mM3bnysDcJFIQfdnU217Eo
         Y1un0+A9JhUkzlrolUzyA/fMrxRErx6/lgP7dxINKD/y3gLkbBTr8y6Z9Sp6IxbCWoiR
         1bXG+LELv/kvrER4VYEMusBs1LICNwX2P+wVt7ulCUSHUW6dAE+pdykVKZJhvUUBuCfT
         J4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546764; x=1740151564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40kfap8VDfDH8hk27H/hMJFx9uMBhXw6N31yql9KOwE=;
        b=dvHA3vcG2+ezzZCT6vQFKTM5ZE+5Qx2KMM054hCeaJ7i7N3GwTSBFQ/jJVFP/XIV90
         0oif8qTp7/ONNUhyk/LeoTjhnH9hZ8AxxcSqE3n6wonvF33/di38loKKymH44Q6EYe26
         nZ3jLIyldot0kK6Yvhc90ND6w/bngMEQDltSWa5mBADUs97XxzFC0SQOwKzhD8E7OZEK
         Y5KDDLXNnL2geM2JoKvQm5PaUn5HGkuUs/1hBVlSgUZl+cn/ZUWzouk6IPv4SRL5G1eM
         6Z83LmLqwq22oD+ewXUI2P/8MAvqZusuol4+pNpNDWsNOqWQc9Mir68j2AoN7UK7ZGBu
         OZsg==
X-Forwarded-Encrypted: i=1; AJvYcCWrXTMr81aMBQJZKkCwXzFkxj7DxXm+xeMlTTYyo6zJpVIDplp2f+T5gJ9tp5jAMFNtEh8/Yeo2v9jJO9JeiX6G@lists.infradead.org
X-Gm-Message-State: AOJu0YwjDTx9QvdQxElLk59h9zxks5ObACoLtGEaSaZTEm7kRDYaeR1n
	e6lNkR8VAv1RRmrnByVcQj9+x9UtGGOZaz1eUVC6iZxoUzD6BLYmS4YQ6/gBeBR6SO1YXyjh/21
	fG9qRCfGosFDtYp7e0xg7qX/2ky5XOSc+sHfBaQ==
X-Gm-Gg: ASbGncuK0ZDt0rHWztQHCnI9RzSkvSwCaNOFXso5PJrb4GYuEuz7sl4QUEG5i+uWGxj
	LrWZYB7C2dEfXuUfD+O3BWdMty1QaHevAw48Nap8Ttl0xHRrsCWD+qFZqBxAihp5A8k3pTu1KLm
	0gKhQm7x+AQ0Mulri8jbfAVIM3lQpfBO4=
X-Google-Smtp-Source: AGHT+IHZ2AvHwjAm58HmrUXzBfbtKaNh3ZhqjYj/r3cal992zurt7vRZq2oTP2grTR9IpbqtQfo+RsuwG6l/eqWLOA4=
X-Received: by 2002:a05:6902:270a:b0:e58:37fe:4a17 with SMTP id
 3f1490d57ef6-e5d9f1965cdmr11696325276.46.1739546763637; Fri, 14 Feb 2025
 07:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20250214043343.263-1-wachiturroxd150@gmail.com> <20250214043343.263-2-wachiturroxd150@gmail.com>
In-Reply-To: <20250214043343.263-2-wachiturroxd150@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 14 Feb 2025 09:25:52 -0600
X-Gm-Features: AWEUYZm0a9iYbwJFulT6QDwvSZFUTkts4BDa7xViN-gwjOa66CO2DAjmCUVdtNI
Message-ID: <CAPLW+4miogww5cgf=Vd_A0dX0=JaH+CV2G8__3Nx6B-Wddu9PA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] spi: dt-bindings: samsung: add samsung,exynos990-spi
 compatible
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: andi.shyti@kernel.org, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_072604_791188_DFD8FE9C 
X-CRM114-Status: GOOD (  16.09  )
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

On Thu, Feb 13, 2025 at 10:34=E2=80=AFPM Denzeel Oliva
<wachiturroxd150@gmail.com> wrote:
>
> Add "samsung,exynos990-spi" dedicated compatible for the SPI controller
> on Exynos990 SoC. This ensures proper representation of the hardware
> in the device tree.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>

If someone gives you any tags (like Reviewed-by, Acked-by, etc.)
during previous patch version review round, you should collect them
and add those around here. Only tags for the final patch series
version (which is picked up by a maintainer) will be handled by the
maintainer.

> ---

Please always add a change log for each patch version under "---"
line, it helps reviewers and maintainers understand what to look for
while reviewing. Something like:

Changes in v3:
  - none
Changes in v2:
  - changed this
  - changed that

>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Doc=
umentation/devicetree/bindings/spi/samsung,spi.yaml
> index 3c206a64d..1d3c95bd2 100644
> --- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> @@ -24,6 +24,7 @@ properties:
>            - samsung,exynos4210-spi
>            - samsung,exynos5433-spi
>            - samsung,exynos850-spi
> +          - samsung,exynos990-spi
>            - samsung,exynosautov9-spi
>            - tesla,fsd-spi
>        - items:
> --
> 2.48.1
>
>

