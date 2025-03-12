Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A63C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoyRVgku7EChH42bDwzZAFPngPMwwosKhAXjk4aoYAY=; b=RakFlky/uS67rdUk5KWl1g9k1m
	0yWABHHcLmOtdMeqypxCpFoAqfjg9Ues/f0BjK31SB5I61I55vXmXBqwSPh3BGL2dxSNuZRhP6Lh1
	5hnWxJVeONkTt6k5y431/Mb+7DpxURUwL/fqFj1pSrURE10PpzL27w8prcVLjY/sj51d/z7pN+4IH
	tSvbNbbloGHn71ewIFM6pCKZGQSEwoJHiyyz+7ONTZgzbFLQeN3MC3UKEGZlyjZUfF1nybXL6mQnh
	k1DM/a9R2xwEBkU+BxJECbfH9xhAWEdzi+W+zfIHkVOv2yFM5PeYvb5WciZmqZLtBJq9Uwup+JM77
	RNb+MGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLQm-00000008RJP-1AOu;
	Wed, 12 Mar 2025 12:43:28 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKSS-00000008IOC-229p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:41:09 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3fa1e694706so1408083b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741779667; x=1742384467; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BoyRVgku7EChH42bDwzZAFPngPMwwosKhAXjk4aoYAY=;
        b=DC5qGpKhP1N35rbehWVQdZykv0z1reKT6pD9VrNa9HHdP0jo5KdKdecN1OSX9KLfUT
         xqWbNRwmEdMU7NeB3QPQzuj/4xuIbgppOTV+WyBWxPjh6IRJYEH/wRd0lcxuMHf2sXaG
         IcBqdq3c8LGxRhRLnuxTnl7gfTRQwHCuLgEGBTRHdZiWqdxCSVI51rmbNX32rrn2zJLN
         GyPNyCMzgJCpF3Dxppt/0m3Ez+I/qrucmBd7/XA6ociEW8uZwNjrnh374ZpYN9ICMCpq
         /oGkRRi9PmqEbxvAax6pIetfTJwnf+mfVPGyCD32DdOsVU0Y6Ilq2LC7QSkg+CVSw1Ug
         /TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779667; x=1742384467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BoyRVgku7EChH42bDwzZAFPngPMwwosKhAXjk4aoYAY=;
        b=HV6FMHZp9CQwmPJgML1xmhidJUYzkVizuR/eeAq3EROaU7NTCk208P1m6TFBo6h0fI
         UW7fADTLm8rfhM3vgRA46+MmElOFTGaOIeBipRmbm6RDWpN3KtVS3skLYJwNP76Lm1d8
         5Jn2bAlEJa3YYELlEDWpSgLtPJqc/a4ZiUJi85OEbZ4zVsQt8FAqa8EBB/nhbiQ60n1u
         EO4uCAtRaAntZf1uCbj4RV80lTvu+nd3gp43dlyw2cLggFQgAw+/KfchamJjFoQuvbBZ
         Q98UjlLti2L/X/gN8ymGLimiYGVhtlEbdbuAzNx2oqGUWNd5BVT2hLr1PT+Vw+J/QcmK
         gk9A==
X-Forwarded-Encrypted: i=1; AJvYcCX3FAHXPsR9qNVbVdtyxqKSFj6DY9YikYhG2PLEZvoUBmCYjOephvKn5Wivar93qF+N8Yy/LXXF5HSMZkvdXCCF@lists.infradead.org
X-Gm-Message-State: AOJu0YzCfk1wcq8AylPNgDLq+L7M+1w0prDsFSx1eAVxsQqsL/gq7AGN
	quzubkZyKVSBUT1g7u7niW7zVIkdGlA66Vraqi5Qh9hHNEd/IllmKIinxxH4KHjt7Nh68lX9O2T
	cKV1esIx4Gp9Q9G/Zg+73ngeA61mKSvgx8ubjsg==
X-Gm-Gg: ASbGncsfundjPLP7jpoJmRYObztAoXqassbZ6QDDeXN3dPS/4rRALEYkRLOEJ1a3PzZ
	sfodqrgl2kJNz0VF4TP+g28dshRzKEnP92JODbq9rNLDUUm9HCDyCsEpIXF/Ct5G0tcsbFLGtph
	uJl1rm3YIPvKfISLAJlXeLb8lYyIPW
X-Google-Smtp-Source: AGHT+IGaTcw1nD7VE9rPLBX0yt54Qbx8fd0Q6JwdK4QExiQp0aQKu5cOr0s66LDn5WLcu2ofBIiUC2KaC5xcYi4Kn9k=
X-Received: by 2002:a05:6808:13c3:b0:3fc:219:c620 with SMTP id
 5614622812f47-3fc0219cb8fmr496004b6e.23.1741779667314; Wed, 12 Mar 2025
 04:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
 <20250307-pinctrl-fltcon-suspend-v4-2-2d775e486036@linaro.org> <c2e2c78c-e85e-406a-90a7-07d5b4fa82a6@kernel.org>
In-Reply-To: <c2e2c78c-e85e-406a-90a7-07d5b4fa82a6@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 11:40:56 +0000
X-Gm-Features: AQ5f1JqdFxSd55M07UVZhyjzfxW8ipmSisfDvd1eSlj0E3xpeK33pLmIlqctOpA
Message-ID: <CADrjBPp9suYGifVR405k5KWqmGRnO1W5A6J28sWJVT2nGut1ag@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_044108_533516_6B324CFB 
X-CRM114-Status: GOOD (  19.27  )
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

Hi Krzysztof,

Thanks for the review feedback.

On Tue, 11 Mar 2025 at 19:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 07/03/2025 11:29, Peter Griffin wrote:
> > gs101 needs it's own suspend/resume callbacks to use the newly
> > added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> > registers. It also differs to previous SoCs in that fltcon1
> > register doesn't always exist for each bank.
> >
> > exynosautov920 also has dedicated logic for using eint_con_offset
> > and eint_mask_offset for saving & restoring it's registers.
> >
> > Refactor the existing platform specific suspend/resume callback
> > so that each SoC variant has their own callback containing the
> > SoC specific logic.
> >
>
>
> > Additionally we now call drvdata->suspend() & drvdata->resume()
> > from within the loop that iterates the banks in
> > samsung_pinctrl_suspend() and samsung_pinctrl_resume().
> >
> > This simplifies the logic, and allows us to remove the
> > clk_enable() and clk_disable() from the callbacks.
>
> Can you make this a separate commit? This would be nicely self-contained
> and without any functional impact.

Sure I can split it out into two commits.

Thanks,

Peter

>
> Getting own suspend/resume would be the next commit.
>
>
> Best regards,
> Krzysztof

