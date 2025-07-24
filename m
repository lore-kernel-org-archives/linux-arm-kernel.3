Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEB8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 02:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plbqbjhGD5ArB2K1OZe2qy+YoPX7JAw+94CxrkAAtgI=; b=bGRc6FirI9hlWHmv7pqkh4oF0R
	bJmSQrcrtDa4CWteYlP6nxeBVyso3V0dIBEyyXC5rUTyx0U78YBlR4Gj4l4jI92J4PxJ4kG2IuQmR
	OkpC8Rcetis+b22GByUmBrWS9l9DvA6Lp2FZYUneaCZs+Iq8vuMHYPgdkZd2HLL8X5WfcIEH5vgw8
	7o8RlbJI5kxNJt66FvTsKDOmdRQJm3jXYm91Ft54pNyaQ4mkxIgiKTF1ngtvB6eKa7rZzRaCG9O9k
	NNsP6DYvnd9EUCRkC3QJbN43RBsDYiHs+CTuq2uM77POG/gW4HXynmXqQw3fyg32AQzH+Ncl2+LTz
	VKpU298A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uelfT-00000006LPB-06Ky;
	Thu, 24 Jul 2025 02:26:47 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueld0-00000006L5h-0xs7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 02:24:15 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-70e1d8c2dc2so5014357b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 19:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753323852; x=1753928652; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plbqbjhGD5ArB2K1OZe2qy+YoPX7JAw+94CxrkAAtgI=;
        b=UZjN9Zskbii7WPb97nkZ0cUbbCFQH+NoKsqPXwld9MSY5Yxdq1LtfcYNLw79Mbhg5q
         QXOZ+R8dyUsMPtxle0vYW9xb4f+92OTGJhUL4XBP64LshYYmjuSxJ1Zp4itj1deAP1qZ
         syDZyaR8pFEz+F4clT/J0QLV/a3GApd3QPHmxM9so79ABJg/ovf4uw7IswciO9aN9BE6
         81O+LBj/6dC3Dm3n27pC22jWaXqPVVYTjI6Vo4WyFq+jhtpBZOXnLAW+do+Wlyk9X17e
         ikEKgbhMRLZEJ1lcSoL2IbPn5smG4YsancINkdFD75MK0+fOIMyj+ZIhkxsjIvBtVYwE
         GO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753323852; x=1753928652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plbqbjhGD5ArB2K1OZe2qy+YoPX7JAw+94CxrkAAtgI=;
        b=uKIFcyfST8z4H2/GZml6QMbEBteL6yH4whFhvqva73PYxF8isbofT0WNuodEv5n8h3
         2kS04UWzWF0QreVdjbFutT5V13KDAEIzJBy6ObGOa1NSMCDMEYwxwLN27s0FJFOfx+tf
         J7AbCIcvm9ijP83ijCZJKRztIchgSti2/XvNq3rlUouA9N5dTZjq65aeVZzMK2gVPDya
         Owtagxf4hOrCG5QzgsPJB4+rMeIo6DR6okMyvN76a2vinUuglX3BAQeM37JIsfVSxF1x
         teUJK3EaGksyiVO+ANsWqeymILj/ebUdhNoAT+DI034HQ0EuIEh/eNklVcGnCp3z7edm
         xceA==
X-Forwarded-Encrypted: i=1; AJvYcCXPqh1t3dwJ0Q9oGWFKRRrexAU1TSCAse+42SnDLnmYrP8WKKG2CSIRE5NbR7ZoGYLVQ75x5I5MuCBHp0jQlsjP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Rc+0l+8U8RskUPi0jXKjc/JKjAsdfHjy0aujTo0iX18LjA5r
	Ok4IG+T71HzJmrzGv7fD7JusH1Ed6kx/dZrmcnfsZHCFRpexbfbS0AKPPj+7qWE+p1+lsSKDBJh
	T64c2rGyIVmHoGndzkpoVAadHGyFfidawzwbikW2bTg==
X-Gm-Gg: ASbGnct6QWb2jR9VDFcT7VGKebpij0B5DLJuRRYpzNcVQrClXpgsS/U7pFQPG4e9fff
	q//78hswn3TN1LQS7T3rXrcd6KB2IvrKVEzF7+N13KHnhOh0pL2RbK8UPjrRCzS5p2nqJBWal6L
	4VydmWEIko0OAw+pCHHxgnjmYSbv6ypUCtXKczWJeoPJF1dycgqZgkScvKnq08A7m+P0MYZmDan
	4SR2Wg=
X-Google-Smtp-Source: AGHT+IFLCRGVWPBVKenBrgCb8KAsi3QO1NHPmUt4DTtA6N603DyqDpRgB5QVxKqVTa0yz2Twj20zCixVG7xRGCICKmo=
X-Received: by 2002:a05:690c:7109:b0:719:635b:a024 with SMTP id
 00721157ae682-719b414973dmr61644717b3.5.1753323852459; Wed, 23 Jul 2025
 19:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com> <20250722121037.443385-2-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250722121037.443385-2-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 23 Jul 2025 21:24:01 -0500
X-Gm-Features: Ac12FXxZX8EzAUJNlTWvjXuwV24vStrDA_xIZ9oDwGDZ1h66dojGNIklv72yNkE
Message-ID: <CAPLW+4n1kYpGDM=VLgcXU0acxgi_8yY7mv5ty_42fhCOoctL5A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: soc: samsung: usi: add
 samsung,exynos2200-usi compatible
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_192414_283756_710B2FD7 
X-CRM114-Status: GOOD (  11.96  )
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

On Tue, Jul 22, 2025 at 7:11=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Add samsung,exynos2200-usi dedicated compatible for representing the USI
> of Samsung Exynos 2200 SoC.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index 4ce871676..bbf6d3b2f 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -36,6 +36,7 @@ properties:
>        - items:
>            - enum:
>                - google,gs101-usi
> +              - samsung,exynos2200-usi
>                - samsung,exynosautov9-usi
>                - samsung,exynosautov920-usi
>            - const: samsung,exynos850-usi
> --
> 2.43.0
>

