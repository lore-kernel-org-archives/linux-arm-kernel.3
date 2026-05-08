Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C542FCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TwIRY2nZA1VjJMy/1brhO0GpNrd8SUOXjsMr4w1IXQ=; b=Rs3/oHfg65CUjvafl/kmMXhEu/
	x6bif2hJzxCwB9W7CjPBMXtuJxBTzcsQDdWiayTRSydluWo5hStCeCOqaq98hoBNmIvIbNA0HrrAp
	NjXPkDFRlbYCjmHNR+vZ9cfj2lc1ekJSORPmKpYu3bGH+vjFYIoWeJdlH+A2a3J9EzaqrbacQqRxJ
	LmsRptcPMrvdhWBOA++SBkGP165oJVc7sLV9GcJ7CZo5QprsONcVL/GDIGSYMIib+yrv4qCIby0fE
	TauGZv6FqQSHsN3BEafGeWHnVfiQF7H37YZApSU4d1KuEQRwnyE+SJ0x8rq7IscWWHiFXekBmP6Ya
	Bl92CfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOuH-000000077W9-23oZ;
	Fri, 08 May 2026 17:22:33 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOuF-000000077VJ-46US
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:22:33 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-651bc8f864fso1550437d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 10:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778260950; cv=none;
        d=google.com; s=arc-20240605;
        b=ZSwQ/il9E6H5p67d5Zz4PCfLPGYSndn4wy/fBlofRvorJBJ4U/3BloPCWVtdhpdN/x
         iXrNwwGOeW5TVEoH2CxQUgBLOoDpEFa/a8rpBwlbTj9eGNiRVA+utlIosibx6+4OwWBl
         ZQ80jfl/1HjH98KqmpzwIKwlnWKGX3dXa1OtX/teEBiYu0H9NaVMLo0l7URwfIfpFnB1
         A2Wh/gRso6bNbTTN+l23lw1e+X2YjA/jVdKpqQDJwyjduS2VywG3cAm0xRFZR/cUsiPC
         Vu78Von8uYBugPuhxlbgKwrkshddIjHSJwZtidBKyCsIFaeObO+nfGZKN/WqhzPhhpEb
         JD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4TwIRY2nZA1VjJMy/1brhO0GpNrd8SUOXjsMr4w1IXQ=;
        fh=K1ZNCMKX1wTkgcjX2i5p1ZhUOPXQy81+mAZlEe+LM/I=;
        b=OZmMklWQ6QDTzKUmsU4uKp/fPPLm4Nd2LOpN7q0V5FvtSeGbdYDoZrx4EKGCP4eRY9
         CgmqQlCzvMf+rYXERzidNCX2xyLuqSEUgE7aJMDUS8KqIEqvI8NTsXhjCS4UO2HB/5Ae
         +J0QzPXD6AyWkFRoK9xgsm/BXsNsGqfFdr3w43qdHuImvDhEutOVgo0zgMGubsZ1RI0r
         fGQT90JiMxBeMIpgbmPh+PcAST/oN5KvyUe9dmO6fJu16vLdlUc+JBiPfDYIgYrcksHM
         qme4RwvRgtBJJ0c8sjktHDBR6dGGB2EJKG3NA5KMCZlZmy/clozJhwicQScWKcFrSqJ0
         Ur+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778260950; x=1778865750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TwIRY2nZA1VjJMy/1brhO0GpNrd8SUOXjsMr4w1IXQ=;
        b=y8vlBjjcKiRhcsmwdyExndaibeWXn5FzgmpsqLqhC8x4dhqu3pubQLH0DkVCxXHHRF
         2hVl5yjDJpcRWoQqCEAM+EQ9QvFNQsJl2Nt7ytUzhnQsl/MJdS2jQ0I8fJl+H0k0wTPq
         IeexuXMAW8TuyGzX3hwbSv0Z5c2IdmedqzQpylPmyGIr5lpY3DhVnk2pzzRSbfRSSEvv
         t+RgHI171bC+T2c+GKH626vNYBJdiuHj/4K+HAI62uHAb5EKwf2KFxQudUsyINf8mwyO
         fp2G55rtfZMW9IZZtttfYZo77dPHZZbUFyMgXupO/T12EXrm0DGnc12ndo+FWR6Lq+cx
         wMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260950; x=1778865750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4TwIRY2nZA1VjJMy/1brhO0GpNrd8SUOXjsMr4w1IXQ=;
        b=ZioLzsRTD6A6hQ9vjhpugtWs594AliIrlgu+d6+WCN60Amy+tY1NC+wAg+3qbPMMht
         cwQvEOzxtWObkpz372UnHPcFb3giz/HIBoSVgyoUvXyiH4LxHMp0pJY1AMae8LTLz+Kw
         XnMnK4lUY1zwAM5LGCEHuMGG/fLBscJ2+vQ2FAldS9DW9BfyA7a6uozb2F6pPAT6DC2W
         lxmb5WqTD139Nak3mkeXeJggpduJtUkR9vDy77R69DEpxKdVRTNmAQhLRNf7YiZkuDns
         jqyIvArE7oNRWXrHPZA9RUYnb6Milux7IZSbBDKfbX1Lzrd9dFculXOMH37tTU3fHo97
         52eg==
X-Forwarded-Encrypted: i=1; AFNElJ/dqxk8TCZrykiU/bYKmPxFjCK9/09cPRPS2OtZBf/XlrDiyupujF4VuosiAS3mNlUiLyh7KmmHSw2vsPLRmjBo@lists.infradead.org
X-Gm-Message-State: AOJu0YxrtPgDXBsBporfsGnNo2uDTH7vwTw91r19fZAv/svk18VWBALH
	tjT9fFT62sqTM2+YAiU0odRTbq05jWtfyL13TrkIEOgLhT4Baqx9F8sp8qis6XjqOi5hYHQ7+jH
	b8d90kpVBTmJI3u9hQ8NOAHRDaeLbIynbR3S3kmbhgw==
X-Gm-Gg: Acq92OExFbqc4iBX8jlZHY4XE1yUSeZMLnrR6paxtxEgqwTe4amQ2McGlgbYYrK7op3
	vR0OVyi2HP2aLor9yCa1JtvTq4HIAvfAOnJuL5/M6C7NglI2DXvpHXK4D4oXQDSrjZboptYWhXX
	cGO8DyvWea5WTNKb7P3DgwNggFc25DJUdTCH6aGjyFtWOqnoXXJG++2olTgfKv0C7beAYNvXz7a
	q/JhS3nx7+Ben+B293hS4bVkoWY5yoU2pPSCIEok2KAQ24tvKxOk4Gs1yc3ag0u7kEXwE7vKfMq
	NEqjM+KTm2OOdZGEGlUtziD2FlHgcX9uIX9267kuhA==
X-Received: by 2002:a05:690e:400f:b0:651:bcb6:888f with SMTP id
 956f58d0204a3-65d94b499damr3535814d50.15.1778260949925; Fri, 08 May 2026
 10:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
In-Reply-To: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 8 May 2026 12:22:21 -0500
X-Gm-Features: AVHnY4I2OawrzI6xYvjWNwRGdaLspFjoHiDADtZnKv7uMu1NzvUcqwurZTLYMoM
Message-ID: <CAPLW+4kLyzUv-tstDezbqJetOLuPkzQ_Kt8EGBPy9U861q=7uQ@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos850: mark APM I3C clocks as critical
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Brian Masney <bmasney@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_102232_037832_18C6E57F 
X-CRM114-Status: GOOD (  19.31  )
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

On Thu, Apr 30, 2026 at 6:53=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> The Exynos850 APM co-processor relies on the I3C bus to communicate with
> the PMIC. Currently, there is no dedicated PMIC consumer driver managing
> these clocks, so the clock subsystem automatically gates them during the
> initialisation. Once gated, any subsequent ACPM communication with APM
> results in timeouts.
>
> As a temporary workaround (and let's hope it doesn't become permanent),
> mark both `gout_i3c_pclk` and `gout_i3c_sclk` as CLK_IS_CRITICAL ones to
> prevent the clock subsystem from disabling them. This makes the ACPM
> communication functional. This workaround should be reverted once a
> proper ACPM PMIC driver is implemented to manage these clocks.
>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/clk/samsung/clk-exynos850.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/cl=
k-exynos850.c
> index eb9c80b60225efa33d85f5f3c284eb8a63a48015..b143a42293f5a154f53a86d4e=
97e17a3e61164f3 100644
> --- a/drivers/clk/samsung/clk-exynos850.c
> +++ b/drivers/clk/samsung/clk-exynos850.c
> @@ -686,10 +686,11 @@ static const struct samsung_gate_clock apm_gate_clk=
s[] __initconst =3D {
>              CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK, 21, 0, 0),
>         GATE(CLK_GOUT_TOP_RTC_PCLK, "gout_top_rtc_pclk", "dout_apm_bus",
>              CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK, 21, 0, 0),
> +       /* TODO: Should be dealt with or enabled in PMIC ACPM driver */
>         GATE(CLK_GOUT_I3C_PCLK, "gout_i3c_pclk", "dout_apm_bus",
> -            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, 0, 0),
> +            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, CLK_IS_CRITICA=
L, 0),
>         GATE(CLK_GOUT_I3C_SCLK, "gout_i3c_sclk", "mout_apm_i3c",
> -            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, 0, 0),
> +            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, CLK_IS_CRITICA=
L, 0),
>         GATE(CLK_GOUT_SPEEDY_PCLK, "gout_speedy_pclk", "dout_apm_bus",
>              CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK, 21, 0, 0),
>         /* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICA=
L) */
>
> ---
> base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
> change-id: 20260430-exynos850-i3c-criticalclocks-dcabb78bf154
>
> Best regards,
> --
> Alexey Klimov <alexey.klimov@linaro.org>
>

