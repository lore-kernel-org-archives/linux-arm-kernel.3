Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4A4CFD359
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 20:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6idQiT/Lk41XT3er1JulNtEcFMX7tPcBFqFIy23wX4=; b=HfMv+TLbwPWvyuR6LLZEUpifaJ
	D11WjKjsFfIVEFHSvgai4Q9kqbNliijeaet2G9CNPDsw8gH9PpiMHh9c06lgi5t04gQQdiUe0EKYz
	gF0xI2hmDpL4G7eprnPc3ifkGdIvdJlhoU6Op38fhKvn0gtqXPHd+6PLViB9nq/RhMoblplSCsCWc
	vXk0YZw+7Xc5JesdJXOfb9BF87UL71KhaHI1+fGwOioQyX5IQ6FUZGJ+lbItnLsjdZJkoWc5qXONu
	AN9LqBLjJ37ZC8laTqXU/xv0gdXQy94wqCtZQE/4Ylzu4/gSekMzKoAcjMm2V5OA/edAtjcpC/gfj
	nY0UnMBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdXU-0000000CJ9f-3t9g;
	Mon, 24 Nov 2025 20:52:01 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdXP-0000000CJ8r-0cZh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 20:51:59 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso2583643a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 12:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764017514; x=1764622314; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6idQiT/Lk41XT3er1JulNtEcFMX7tPcBFqFIy23wX4=;
        b=TBg9hwFMKrNT3W6l8i2RqchE8Ncx1PAt52pDaLFF+G2DSZzneHd4wjS/UhDCP4xVBP
         vSZxSn7ZAjdxq3H0GQaCP3gttKCCGX5xNp65UdyVSNMSyltGytwJ+wNe+p/JU6sUmW8y
         EQhlkCO450FPinI7oTz+rwgYOEGMdsRkLUZvLYXxBm0PYCtZILeubWxrxXXVNGRAB5mr
         FRTnx87sJdovBqWRhooPEsTBFP14/uxHTMPK7vmJ21+uPODSUyAjEI1f3yal8+iiopaM
         H4+WqSflymHqvd3oDZsploWcLISu9a+smvk6z6s4+JUuEoWRSjrhDYAZoWPnZ9KueY+8
         FSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764017514; x=1764622314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6idQiT/Lk41XT3er1JulNtEcFMX7tPcBFqFIy23wX4=;
        b=xQGwi4jXk32qLQ1xOfqioVbx3R9YLXbXTuqd/8NPvU0H/fY80JECWgZSvJrQ15eDhD
         bfUa5yLbF0WO0OyjPxDeFq0RMK2eatm/K795LpSzkL9YwsZGXWMZvF29NkqFM/nwflaP
         tyixy1aOoCDXRwqRX0jvx2VO30+ptUD2FlYIpfzin1lKUaLzjMueAAcmHTT0gkyy/Spa
         ulYipTHW77pDI+Lhys1Oi6CvoaK0KLK6j1om8mwkKCWr/9SfMAmTqQ2HDsIN+6fPp49s
         b0bv4zgb2Gn20eVjn1rH/OkfVV45lTBfq8eQ6V5h7S4n8wkvirkw64PCjpn+REWyKRPP
         mTlw==
X-Forwarded-Encrypted: i=1; AJvYcCWxVJrKCRvZxCQhN9sDjit/aHx2AwzIXTZq9Fut1WgaIsGvq8ROJ44lOhsZVp/d+d0RPakR8Vcw8JF4qdTyprsL@lists.infradead.org
X-Gm-Message-State: AOJu0YyhgJlfI3HDWGwBXXIGqQMUb+ew+7wSJZuSz5DXPbZ5IL9RVmux
	LkEGb6uSKn6JuWsM9xOF8uWFrvznSdyYNTvY4iEqzGsCWyS30sZK3y1HxoX+2hgX94vx8u4PsNX
	QcNqPOgFjInojBlaKNE+q9i65k6fXGeOFtb0bLt0aBA==
X-Gm-Gg: ASbGnctQWEw5bmIrycnmELyW1zmkopWWa7QmjezTH9CxE9TPsy8lHJ3Ai++v/YaUSuw
	pKm5SB8bBNQQAZ3QepjYdfSQaCzMRH4uNMHmxsXLRT0fPzDmcj/XsKINFflJuYvyiL1KUNXCSfa
	J116QFPQm80sM0us72szFN9FuM4ltG9av6TYkRgKyaev9MmMbn5vqX9fWr5DQRyCvx9pK2lhpG6
	7WrGIDsogAFCLU0UecSLxWGS643llpLnFGoNbIWnxGJiVvrELsDAUqK4ea5NooM/kK0IMvnKs+w
	4gGlZ1WyY01ghjwCZdwGlki83gJyqg==
X-Google-Smtp-Source: AGHT+IFjLWT6yOg2hi2wu5H1G4MoFcdeFYH0BRB30KFAuwP0u2IagJSBzMzfwB9OaD6Hyztv/D0RJutCW3MA+Q+DdWM=
X-Received: by 2002:a05:7301:4586:b0:2a6:9d86:48a8 with SMTP id
 5a478bee46e88-2a7195c9662mr7982342eec.17.1764017513591; Mon, 24 Nov 2025
 12:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20251124-exynos-clkout-fix-ubsan-bounds-error-v1-1-224a5282514b@kernel.org>
In-Reply-To: <20251124-exynos-clkout-fix-ubsan-bounds-error-v1-1-224a5282514b@kernel.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 24 Nov 2025 14:51:42 -0600
X-Gm-Features: AWmQ_bkR6_YnQmKNQToJOLZtI9vyDFo3HYMS0rYpoLLIQEjyJTPF_i9DJ12NbWk
Message-ID: <CAPLW+4k=My6np3uKoRmODDVbUekTs+yDdBbwoH_Ba743sRQTRg@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos-clkout: Assign .num before accessing .hws
To: Nathan Chancellor <nathan@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Salvatore Bonaccorso <carnil@debian.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, stable@vger.kernel.org, 
	Jochen Sprickerhof <jochen@sprickerhof.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_125155_226972_4E8BAAEE 
X-CRM114-Status: GOOD (  22.03  )
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

On Mon, Nov 24, 2025 at 1:11=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
> about the number of elements in .hws[], so that it can warn when .hws[]
> is accessed out of bounds. As noted in that change, the __counted_by
> member must be initialized with the number of elements before the first
> array access happens, otherwise there will be a warning from each access
> prior to the initialization because the number of elements is zero. This
> occurs in exynos_clkout_probe() due to .num being assigned after .hws[]
> has been accessed:
>
>   UBSAN: array-index-out-of-bounds in drivers/clk/samsung/clk-exynos-clko=
ut.c:178:18
>   index 0 is out of range for type 'clk_hw *[*]'
>
> Move the .num initialization to before the first access of .hws[],
> clearing up the warning.
>
> Cc: stable@vger.kernel.org
> Fixes: f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with __cou=
nted_by")
> Reported-by: Jochen Sprickerhof <jochen@sprickerhof.de>
> Closes: https://lore.kernel.org/aSIYDN5eyKFKoXKL@eldamar.lan/
> Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/clk/samsung/clk-exynos-clkout.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsun=
g/clk-exynos-clkout.c
> index 5f1a4f5e2e59..5b21025338bd 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -175,6 +175,7 @@ static int exynos_clkout_probe(struct platform_device=
 *pdev)
>         clkout->mux.shift =3D EXYNOS_CLKOUT_MUX_SHIFT;
>         clkout->mux.lock =3D &clkout->slock;
>
> +       clkout->data.num =3D EXYNOS_CLKOUT_NR_CLKS;
>         clkout->data.hws[0] =3D clk_hw_register_composite(NULL, "clkout",
>                                 parent_names, parent_count, &clkout->mux.=
hw,
>                                 &clk_mux_ops, NULL, NULL, &clkout->gate.h=
w,
> @@ -185,7 +186,6 @@ static int exynos_clkout_probe(struct platform_device=
 *pdev)
>                 goto err_unmap;
>         }
>
> -       clkout->data.num =3D EXYNOS_CLKOUT_NR_CLKS;
>         ret =3D of_clk_add_hw_provider(clkout->np, of_clk_hw_onecell_get,=
 &clkout->data);
>         if (ret)
>                 goto err_clk_unreg;
>
> ---
> base-commit: b6430552c8cd95e90bb842ce2f421e7a5381859f
> change-id: 20251124-exynos-clkout-fix-ubsan-bounds-error-93071375ec78
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>

