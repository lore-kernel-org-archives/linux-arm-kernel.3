Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF04CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYtDazt9U95VcVF6VWujIonGGFD/naB0M81vsxEng7Y=; b=asGRLYa7omDULfxN04HujZhnKx
	zvUcSAddICPctfYj+hua9pX9SCZ12TklkcUJTRzAUE7XICb7Mdnbhx31gMHpzRugwkDtp62LC9qy9
	xHYfz1PUBRtTxaRl5kkgTjawnsVzlOY5FZ++KmpBB9b9TevDSTf0iflqLsMUkhPWQYYwXNBma1Fv3
	sNq5wlKWAeQo4x+AIUrBOENP7wdfWQZvCUt8gs/nZJCkn77dZGuP3TusDk5vMSiGF+/TgEtLBaBu9
	doJlmk/bd6ifoUjbopJFqaOZpaaPWN3Qhg3BQaqUXKa8877Wd7WIR5x7eIWsNzxAGw91JuseimxGi
	3zAetRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVhQ-00000005KyX-0mpD;
	Thu, 28 May 2026 08:02:40 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVhN-00000005KxG-44uf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:02:39 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso10197495a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 01:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779955356; cv=none;
        d=google.com; s=arc-20240605;
        b=j9mQcaoxAqTgJ0zJ6g/jDWgrC3C+TY4aYKwO8xjmQzaBmkUsXHIKmq/3yVscW61AnP
         wawhpETNehfQ+sOQh1s1eUm9CLhey/79xAamf7VNarrlTx90bDfWqLOMVEoqic9rzApX
         mZhUdTEd4i4eY6b8gKo/wivO1uvs2E1bRlH3U+eWF7oTrvu3EnTyvZO7Nq5kx3lX6RfS
         cUFc+O6N4j/g33dH6bxq7CzAp81XMTr3ndFXSLv7gEJ5opKtPd/hDufBVEKd5roG1Eek
         9DHcBpLZEOABAHg+e8qc+59pSLbUcmymOrCBJjoqwsEcjMe6da9qVUE9XAPUWdhleHwj
         FW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YYtDazt9U95VcVF6VWujIonGGFD/naB0M81vsxEng7Y=;
        fh=hL5SIM2m8wNex5hgiiGCHA5fgal3Q8cnQsrSELep1ag=;
        b=c7xUGXz4J/IAgQLZykN7uouiU2P7ucKwQ2v2knpg7OyIUSwQZEoHFHstejSH+t1e99
         q7v4Dww3l8vk2RI6PtpYP1/oXhK8yX11Ei4zMGONNKKSMkENWQk7RNhXDP0kL+Y+187Y
         5omQ47vAKipz9EKWI1FH9vNb8zwrApkxtMNUQ7eF5R8hfZRs88dKxjXftSGChY2DbIre
         V676o3sZKZKMNmWfCH99J930fFkGt0Tl0DFvQbFRJMFEcCqX3xjh4UUf3SG2Sfcj02tQ
         5gzr54yNrOLT6McnQ6ye39277jQmVslZy8AHiwlxnNZqsKri2cwKQ6TmTnB6aLZNBvFU
         HE4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779955356; x=1780560156; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YYtDazt9U95VcVF6VWujIonGGFD/naB0M81vsxEng7Y=;
        b=OdjjS/T9HU57/wFptK0lwxCmXSF27yNLpZBWQglRN9qjVP9E/SoP0jomJo18sDl6CC
         P1UsWJaFSFp7hjUl2paqlayd/hz92R8INbFrGKNJVaTSqqgQR4L1quFaiP4/orqZrPVl
         mHRI4IqfZqDPmX6n3smaP4ybGUBctmjbqQfrNfagDrNF/NKoK3PNMGvsQwHFUhuImoZS
         w0qo2IVM8mQa9OKC/1Vf/B8cX55Bn5gGMX//HqYV70TjgHD45VL/GO85f5xeQaU7jLn6
         oxaXXw19HdE0lNW9DQHOwhZCqeHxqE/VYfPkW5J3EgFA6/xzhXyqu8bxEOsYS+rS5QsW
         2fpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779955356; x=1780560156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYtDazt9U95VcVF6VWujIonGGFD/naB0M81vsxEng7Y=;
        b=eTFCLm+bFlJqzrmrolkOB7+CcjHpp7g8e1LoeHmqcfbwjCIBQkhmLLDT4qlLphBvVL
         c/qop3iKmjnLn6ZskehwPbxYCivrnI8A8WyrQtHlXI82oRcYM3tTKy4k7Wy70uc0c0Eh
         icV8lUf/7lGfdrKr2yIORLjgzud1r99rKnMgidYSNGHnCVfPj7dwuuyeuP/xlzaunM7m
         AmzHY6n0RBe30R9aZbLfX+LU8jvUaK8YPey8IxSoGhkboNaTVkdWMxIpwdgjO2G2HYfl
         u1HdhZEs92eZaexfmHk0q5GCbDojQbZ8yp18VQb/T594VpTbvhy9WM4B2ZUDwFRWr9Ke
         OnRg==
X-Forwarded-Encrypted: i=1; AFNElJ9EJvS4LobLpEiP3P+LorO7Tv3KiZWoZP13IyqsIGwaJXQ6LJasY/iHpv13OLAgtf7zIy7IwkuwImeNbSv3h4hV@lists.infradead.org
X-Gm-Message-State: AOJu0YyuHahgj/vz93swqqpD2uLhwhZ77LsOb7kDaRI+4ANmIZQODGid
	VVSEF2lsm51iXOxQ3ON1eE2BiG/1O1Hc1gHTNJj+QH53oCoQUWU0rp+zrtpQyNftklsP7tFpha3
	0V8DnuhbyAi4+v54tvyb9aWyTsT4yBiWRtt8WzJ1CgQ==
X-Gm-Gg: Acq92OHSmCkvJ60OZ+DOoWWm6zlh2cecmh6DofyxAxa6TajOIfbJpwgK1tebW2uVyoW
	9nE4gGAZw3eykpUHIcgE1Fwiz2sPmDpL76hsWyv8sJ2pttlCxPSkzFFGkNiY7iYXN2UONr9l2gI
	2tY45UTF4y2QTDjZCOdRTH7DTwApJDTcQ3L+iO72gsEs2vvto08zmvitLqWFv7jXLns9JptLQzx
	4CF1imaX526B7cUSN+kvP4d0j1WRu0WtC8vX2hO4uP+HtGFj7hnmns9C4zxV4Ui+bVOJkzb30F0
	1LxrTrxVd1cGAhtdH+z2EgRoIMYQkqYv5gqXb/++g6Yk85SCbsGp
X-Received: by 2002:a05:6402:458e:b0:683:f485:c63c with SMTP id
 4fb4d7f45d1cf-6889c4321c4mr13969121a12.1.1779955355656; Thu, 28 May 2026
 01:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
In-Reply-To: <20260526061321.6123-1-grandmaster@al2klimov.de>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 May 2026 09:02:22 +0100
X-Gm-Features: AVHnY4IF4snH_x_Zty3iJL9-gZoieI2TfzLBtrQPLtenatLAkZtKV7qhQYKta-8
Message-ID: <CADrjBPrsynS5qfJrrVAFwY5kzoM4VcesMC0z0-aKcH-vaGL+PQ@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos5410: fix refcount leak
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
	"open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_010238_049303_ED2FC4BA 
X-CRM114-Status: GOOD (  18.62  )
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

On Tue, 26 May 2026 at 07:13, Alexander A. Klimov
<grandmaster@al2klimov.de> wrote:
>
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
>
> Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-exynos5410.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
> index baa9988c7bb7..0cd9b0392cf5 100644
> --- a/drivers/clk/samsung/clk-exynos5410.c
> +++ b/drivers/clk/samsung/clk-exynos5410.c
> @@ -269,8 +269,12 @@ static void __init exynos5410_clk_init(struct device_node *np)
>  {
>         struct clk *xxti = of_clk_get(np, 0);
>
> -       if (!IS_ERR(xxti) && clk_get_rate(xxti) == 24 * MHZ)
> -               exynos5410_plls[epll].rate_table = exynos5410_pll2550x_24mhz_tbl;
> +       if (!IS_ERR(xxti)) {
> +               if (clk_get_rate(xxti) == 24 * MHZ)
> +                       exynos5410_plls[epll].rate_table =
> +                               exynos5410_pll2550x_24mhz_tbl;
> +               clk_put(xxti);
> +       }
>
>         samsung_cmu_register_one(np, &cmu);
>
> --
> 2.54.0
>
>

