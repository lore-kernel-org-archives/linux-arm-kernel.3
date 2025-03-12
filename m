Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFF0C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/mrslkYIqtp2+mq8p2Qz5J6MxbjiXwBJqUTb8Ezm9o=; b=1nwT9BIGJMp1+mfu08PAC4icLi
	n7XxVxI94d2UZ8pdbVVBouIhejKMYwomH1FBCPBtXYeVbhYOtEC2mGgwG9X/KXXE8bfr2hfA1cDZv
	6p4LG8IeNfKvDXLs8/OnUNdmxJSEOspA2fwWA3S2LorhjlyUwelAAD1ohK3HsHzsIH9GPjC2UkXaj
	m0+CBkcUYXlEKpguLvO/BAIjDe0QWkYo7ZYBNNO7U5SaCFU2K6M9lmRZmLQsZu1mlitP6Ij4h5z34
	454WhC+so2x0BunyqzJiSCi0y/zofEholzCCimpMMWrVR/Do5YdB5V8qmjFRsLj+WeL5yYfA6UD1N
	qT6p0doQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsL5f-00000008OAV-2Fve;
	Wed, 12 Mar 2025 12:21:39 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKDM-00000008FRS-3TKP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:25:33 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6f6ae4846c7so61937817b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778732; x=1742383532; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6/mrslkYIqtp2+mq8p2Qz5J6MxbjiXwBJqUTb8Ezm9o=;
        b=YZk7l0ULx8AuNIsI5VjPywmH8lymcbVdxUDOgkPhQoIXy8D/JxfigHQQvZ8K/lN7Eq
         KvXip9t0l6rN04QLMxLTjTJD2hhTxVYwgO1ildGFvQhvxYegDKs0OyI3pdCBAqf3J7CY
         PIl7ZsfRsPmmNt14bzgVl2JxHVPCX5O1K3LSvW2z7J3fTjgVTNz/KtJ8OnZfooZEZqB5
         gO+PKhDhF8EM2/29Lt22zeKDy4EggIiMK022mtZWoZBBHjibrul6o2u7SWZ0ArgS/v69
         Do5z4mJBEvW5ww4dK/svoa9aVZnQlbaG5+GDCPBV94mX1yybktdxJzgJl4tR3SAvnyKF
         hmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778732; x=1742383532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/mrslkYIqtp2+mq8p2Qz5J6MxbjiXwBJqUTb8Ezm9o=;
        b=jaG+M9FFdnzXYS3pAT9Bk2YqmGvfl9Kxu2LUS5J+t6TynW8OuhkFKcfVTEhmEreswP
         Ae++BmkoDhz1wrLAx6QuRVj0hOjVixgYpY3vStMjcbwkNwNW5h/EOqV+Xne4jbgeNSjh
         g+w+9+u6UicrraYUpOUr4gliit1EMWzwYhG0dJMWcGh8ntBzMQvQAeTFLjs27DX6i5fm
         h6dlyCRGDIScvdlfXNsfNaP0xBIPby9Iiasc+NNxm2qROc+9UARWdOKM4cfk6mnwXkYY
         x2pjxMOe5+UBnHyOK+gVWuf1DnDgAHweCVoyiFXD3tBnOsqhUy9kak6unfd2s9sJ8eFc
         q2Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWHv+fxsEOwUlwcJeH2RTpFLZNYVmN9AGF9SbuZYosfmPFzjuCcaUgThJBw9azETC9HM+9RulU1Ov579f7reHrF@lists.infradead.org
X-Gm-Message-State: AOJu0YwPp+g1AcnjcyOPW8psygrwVWdboplMAtKATBD0HYCJT2vqVFOB
	d5w86xluuDXtda0z8Ba/7E7FqARuDjIpR0L1dhu7SWjMyTdg6u8glk7Eh/M1IiWWvoTxtqFEl7K
	eKtMkDddytOz5UtgzmxUZRGNa6l9EUeQFL/jwLw==
X-Gm-Gg: ASbGncs98koEzVLOAUeAlEz/OqVYkak4EdtPNchc5Oa6bKh8OcEILdIvkHPJj2oDOZr
	9VPNdjQLJouwLiQsY7TchUPwvO/Rwgwo7hyvnVkA5g3TjHOL52bHBe2y2zF5XXh0OYhZ6TPnluM
	xoCgOxtp7q3sR7F5s4z8RVl4egs521gp6no8r34Q==
X-Google-Smtp-Source: AGHT+IFk3gFp/cUReNnM9kzAsWOkTCM5MEQl/tCtb/z5liDbrUseKz74jkUx34wnEgejhu/lLK5rCnP3CIxzHqyLHXc=
X-Received: by 2002:a05:690c:4c02:b0:6ef:652b:91cf with SMTP id
 00721157ae682-6ff0927951fmr104983367b3.27.1741778731810; Wed, 12 Mar 2025
 04:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250305214108.1327208-1-jonas@kwiboo.se> <20250305214108.1327208-2-jonas@kwiboo.se>
In-Reply-To: <20250305214108.1327208-2-jonas@kwiboo.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:56 +0100
X-Gm-Features: AQ5f1JqH2hRXUwfz_vQkPX8i5gK9j7RB0dP4G_O77fuesZmjypeV_Lu2vr_DSTs
Message-ID: <CAPDyKFqY+0MGsdZDBJ1AoDaDGrnXN=Gu3JNjuK0LoHfjT9JxiA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mmc: sdhci-of-dwcmhsc: Add compatible
 string for RK3528
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Yao Zi <ziyao@disroot.org>, 
	linux-rockchip@lists.infradead.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_042532_871019_AFBDDCE4 
X-CRM114-Status: GOOD (  16.82  )
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

On Wed, 5 Mar 2025 at 22:41, Jonas Karlman <jonas@kwiboo.se> wrote:
>
> The SDHCI controller in Rockchip RK3528 is similar to the one included
> in RK3588.
>
> Add compatible string for the SDHCI controller in RK3528.
>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index c3d5e0230af1..fb2115e805f5 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -14,7 +14,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: rockchip,rk3576-dwcmshc
> +          - enum:
> +              - rockchip,rk3528-dwcmshc
> +              - rockchip,rk3576-dwcmshc
>            - const: rockchip,rk3588-dwcmshc
>        - enum:
>            - rockchip,rk3568-dwcmshc
> --
> 2.48.1
>

