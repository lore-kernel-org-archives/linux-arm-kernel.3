Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5C4E64AB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgM8+c6QyalF7cc/76yT7fGDgmWP/O2VdbCIDqU+xlI=; b=sLDxl+UFftb+Uf175gphNd6EXy
	AZhlOP+E0C4aqTXZIsbnpKT23vB4LICTK+XXB31Ua8XZWoXOtE5X2MKroeiLGmHImALenHuLhI4b1
	3e5wcO/oQM+cLE1csLb+kEkAuOnuYcXAcMeG68kCRm+8HSKx1JHH1fHqLAcaHEJ33yeKsWHUr3bZ9
	DBu2f/ur/STv48gjRjRFhovcXcKCI3B0S1xszNykTlx9/IV0KByzb30LovGdcB04AL23XscOgXXqA
	CIaPpCsnCzF9x6ukuguSeCvmyWWVf1KIrcQsaGBAw4cHlOjC+zInP21LgnAwb/nb3JZIsE18tjV6O
	f7vUwfrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUCU-00000009pEf-04oX;
	Tue, 03 Dec 2024 14:48:30 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUBU-00000009p8i-2ItD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 14:47:29 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5f25c47d22aso341214eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 06:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733237247; x=1733842047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgM8+c6QyalF7cc/76yT7fGDgmWP/O2VdbCIDqU+xlI=;
        b=k10VJwM+/UfNxINZY/NV7k17TySmz1F38UO75KkeIIKxyDYHbEKHCHkcXAUt0RV4u4
         jZ8pe4ur2U804SsuY3WQ0sZ+sFbsggNJDlamtJse32axXDnVhyXUKYjrUdBE0o5DjPeb
         terIeF84ROaIs3/zywKU+ouEoGsKxlcSPqXrHIl7LAVd5OJXk3RA1x1Go8NWk4FOUXx3
         RlhoXt75raCpqvlDHX54fVcNP5Lp0uznI9c1JKHy5aB1wpFe69BwlMpuZwgBHVPm43VQ
         BhdPMJGcxgEu8rL1jS9VP1nHLUhsi3lhvD6oWb9+ma1fQaTgZY58yECC+IIU2jnHe5zI
         GJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733237247; x=1733842047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgM8+c6QyalF7cc/76yT7fGDgmWP/O2VdbCIDqU+xlI=;
        b=njkysbtRl25Y8I0Ay+GJm9cj3VajI9w3tXlk3GeWZq85Qs+dLzcwJZPqoH/+DK2sAc
         kIWCQOqVmF30nA5o4LQti4OdmiW0X2bwX+sdS872JMMwLw8W21UCU2AI52aLxFyJFwou
         dks8x+TQbg5TP9RpuyD6J4CMKxQeMnA/luTXKJVi6DvjctpQOqX96TjksVBokt2r66/B
         SLCYBEs5dlIjjkA8Cl6t9/fmI6a7aA/ZabC3qEANu5pxIp9AEcB+rkSx32uXZ37ZG1WP
         FCcD160ka0xactyoqjbmH2RmyAcJMDt9pxOqRWKAf1ZZm9hMGBucpaweVyuRDNcITEzJ
         pw3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXkq54W/q8gZuT7SgmUWnolmWXNwBjo0MdAkl62OwbQA3oCCyqi2kHfYoBTRiYMwQW1jpKYIelV9dZx8c1gBeZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/ffFuxDkhhUmfPaN3C9qudEM3P+H1HIY6RCpfQLVhpswpmoXO
	vHZGNSVZBTrqypQRBK3qYTgwrzGrhZ+1JIAPbEHcb80duUbqAneAASPezopMBvytcDqbwwlZMLY
	uHvXXJYCQWc2zvVTKI5bfyE55QFHh/iZgLarYVg==
X-Gm-Gg: ASbGncswtvOxjCjoVMCsiSNzaiAVDuv27GfIDDA7KeZmwh642mK7IqRHUTjbZ7R1Nta
	MRE1LhhUvftlAhkk5P90FPzDrsarAbi2IVw==
X-Google-Smtp-Source: AGHT+IENhzKf3J+XAqUzX24pS41sfMggDYWVmlBRkpteJm5vDK7SpgO5QphskG20CDt+MT2o+rMDEXThjllUSYU+Bt0=
X-Received: by 2002:a05:6820:408d:b0:5eb:5eff:afbb with SMTP id
 006d021491bc7-5f2178caf33mr13278379eaf.1.1733237247113; Tue, 03 Dec 2024
 06:47:27 -0800 (PST)
MIME-Version: 1.0
References: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
In-Reply-To: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 3 Dec 2024 14:47:16 +0000
Message-ID: <CADrjBPrYvz6yNdvZUmTGVAvOtP53kHBLVt6A7zCcRwK3rDg2FQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself and Tudor as reviewers for Google
 Tensor SoC
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_064728_595433_A66F90A0 
X-CRM114-Status: GOOD (  16.19  )
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

Hi Andr=C3=A9 and Krzysztof,

On Tue, 3 Dec 2024 at 13:03, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Add myself and Tudor as reviewers for the Google Tensor SoC alongside
> Peter.
>
> While at it, also add our IRC channel.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

@Krzysztof could you take this via the Samsung Exynos tree?

Thanks,

Peter

>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf1d81bd04a7..2039cc57d8a7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9754,9 +9754,12 @@ F:       drivers/firmware/google/
>
>  GOOGLE TENSOR SoC SUPPORT
>  M:     Peter Griffin <peter.griffin@linaro.org>
> +R:     Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> +R:     Tudor Ambarus <tudor.ambarus@linaro.org>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>  L:     linux-samsung-soc@vger.kernel.org
>  S:     Maintained
> +C:     irc://irc.oftc.net/pixel6-kernel-dev
>  F:     Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>  F:     arch/arm64/boot/dts/exynos/google/
>  F:     drivers/clk/samsung/clk-gs101.c
>
> ---
> base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
> change-id: 20241203-gs101-maintainers-9a24c8b220e3
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>

