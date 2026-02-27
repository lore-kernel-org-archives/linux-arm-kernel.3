Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4120FEFB6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHJQnX7dxsaQirsNm1TyUYVKGkK5VW9C/E+gULXjR68=; b=xMeVsbn3G7pE7ca0GK7A6ZMBye
	dmqAttvCQpH0hBI5wQfzHOqvuxXg/lh0mNURuOrni6F1FDKZahatQnBwn/G03vpwD5Mbcb4YEKUDU
	Iq2YmY89LTUS7C94D9uAv87XNnnQ5P+KZ4Pdjm5y3gc2ujdFTL2fWzbEE8Q/5IuakdBmlByJ209li
	6k19oMAvVFvRQjEGMWKOfr8Fr8zJIO9hVIIfgJzl/Rifwp9KEVe62CSt20+7I0qqYRgGMx4g4Cx6n
	W2MWxQnQmKYI3WHp+BfT4adgr1JTBsP2MZloc3fSadizFK/7BCGKVB1ORqDj3y0vJbDFEGuNlu3PQ
	D6lofufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1Nx-00000008mJe-1rGD;
	Fri, 27 Feb 2026 17:12:17 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1Nu-00000008mIr-1ZpV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:12:15 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3878de20527so27574851fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:12:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772212332; cv=none;
        d=google.com; s=arc-20240605;
        b=gy8SyKFURATqFBC91aWhYKIEVq8hQB6Pf16DtkM2hrTjP1WgL7jQ1dMUab/M0nqTFQ
         wrXqPuAWxm6zChxQErZguy67LrovA/ni6EJBsH1Nq0TQL5iCAiZm+ck8oet6BC9WPrlL
         144kU4yU7LbsFb2kQtHsJSAm5wje6t5jeBnz+M/rdc7xt6j3BGyc61i17vrSG7GKILXz
         wgmJe7sRLfPr6iW3zZKyiPcbM7VxnshtkB25hTaGM1HNZG8TPxJnUTNwcxXB7SROmP81
         qXVJeLPHQtlF2Hzw4E41FiHbwt17A4qZZCXfJVtlt2gyUH+wnBpUYUkKftzmDQpKDP4U
         Ksaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DHJQnX7dxsaQirsNm1TyUYVKGkK5VW9C/E+gULXjR68=;
        fh=+oPY7BqeUe709DXAyUE0Weab0KyFH8p3ZaijP+mesuE=;
        b=dHQxcjTqCU23CtCzaYR5gcZW+ghWJnZq+hrApn9J7b31ELz22DgcV1z6NHkZx+ABgB
         y0hFACzVoNDIEcHWlLHivbDcQDOWUQWrAja8Okf+U7KbLqdtpeW/rx0u/Suy9DE/Hb+H
         dINoGQe/ZOCnBANDmzeGpqFnVUxhG8WrbrdEsLTOjGXvPCXaVb8CKnpIIKu6pGM1rGNL
         48CS4v25SxTD2DeWrIK+mr11tmz7jJ39gJWNrEShJbfyro6Wh5M36zXWOoBaU/r501jw
         cYJutes45Klr4cFkb63tD3GhKq1zifO9rLSutoBtutyctZ8/bekV19euEogE3qs0ITnr
         lY1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772212332; x=1772817132; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHJQnX7dxsaQirsNm1TyUYVKGkK5VW9C/E+gULXjR68=;
        b=BJ1Gpj2aK1d3QP1OPDPL2gENIChDlkm99L/jvP1UghYKLL2Ycln4HSojohAE5aJO7R
         dy0RQ6cKPdRJhOJ9tdpGC/z18HB8cjz9wxN0KMaTbAad8z2RC8rawpNbyqAahCkregbj
         imHL+U71hEj6J/zgCd4w0wZgHFiow17Viut55U6+uUFL6RHaD1cXluvGif2YKNhI2Tro
         KdufC5upWKQZtAZN/AQCJpD4h90HY92e0bkWnr1GdEIXDV3k+ZJOoxctwn9TfPuLjt1j
         NgQ7LxiW4v5zpDjmP5cmYMyN7JZBfdm9JUlm0V43OzJExR90f3jDjP/KiM1hSXDxNiN2
         E+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212332; x=1772817132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DHJQnX7dxsaQirsNm1TyUYVKGkK5VW9C/E+gULXjR68=;
        b=TTBoUKiAALE2QeaMyV2EWOSc+owEmAK1kGbmPFWtlx/CaVe8tEdNmD/t3X6cMVVSBT
         ZHjgOe6dWojXJrBEClJ4n5jAUXgO/VLg/3JJ7sZJmAeWJ0XMhm/eymF1HZ075sZ+c03I
         qYYEEnDB3ehUHgIJWgiuQjMHvg9uxe4GUjVD5sAwElm6+Vx9liKpJUdgqm9eADrwV3GG
         chYOjNA+2M99qEylnrIndhmwbbv6HoJDMyX4WheSJLp/gYTkKcY0Vye0ISkYY5+1csrm
         2eV2rSa+uO7EOMQrVoxyJsn379xTY+bni7P2kHqwR9zvTJ/V/TZHkKQz/6G+d8LJkyVv
         jw+A==
X-Forwarded-Encrypted: i=1; AJvYcCU+Azqw6WU+uNWAiWsx62sgsjEBByLAFEyZRtFIcZj61X1SUdTcBZfpoFysr79PcecaZu7UoWciEQ9RdIRERz0a@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9z3ZSnSi72Em2ucRHgHG+nmTSacLzbNqqKsJ2kpzeCQ05l6R+
	PZtDDDQMMuQd8eYo2Al9G5MRA66ZlCyDZEphKYcEnVdNFCb8QYH5SVp8/nZTZGg31lz975MVU9o
	Jr57V84i3wskBZUcBmY1HckmDYzSU++dULDWAy0Hxuw==
X-Gm-Gg: ATEYQzwb5rnQ11DBxxvtLVWNwWtBVX3KqO8/27A4Yj2DtzUIkxaNYr5wMndpkjRBPk8
	1bd2SNxMMv7k2mVM3rpiN/nykKIpri990ZxC3X77XjoXQ5x/qBN38ktlJHg74mBGlaCmsu5oTHY
	NMt5WO2K4ZhjUASEY6tPjNEO2I8dDefe6e34937U+rRhn+jF+v73Fd/p7RQKQJ/O1ElBxqOYFHP
	ds+t/GT+82e6fMCybn0ytSuFfOppxbtwHZxatzPKr1Mi7mCRjDduwS37tGuPBdtwwDzn8jf7opy
	Jv2J6xfm
X-Received: by 2002:a2e:a548:0:b0:389:ffaa:7812 with SMTP id
 38308e7fff4ca-389ffaa78femr22939551fa.41.1772212331723; Fri, 27 Feb 2026
 09:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20260212150039.67117-2-mcanal@igalia.com>
In-Reply-To: <20260212150039.67117-2-mcanal@igalia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 27 Feb 2026 18:11:34 +0100
X-Gm-Features: AaiRm52rbLI-MD2y29yAU8kDsNHpRGPIqV7ky23ZuQA7ygykHEA0rYtPZw_Y9NM
Message-ID: <CAPDyKFpT6m4N9AWSMO2VKm1M3n22Ye9+i-t7QT-JtTtB6kfuFA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: bcm: bcm2835-power: Fix broken reset status read
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_091214_439569_F4892C4D 
X-CRM114-Status: GOOD (  25.25  )
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

On Thu, 12 Feb 2026 at 16:02, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> bcm2835_reset_status() has a misplaced parenthesis on every PM_READ()
> call. Since PM_READ(reg) expands to readl(power->base + (reg)), the
> expression:
>
>     PM_READ(PM_GRAFX & PM_V3DRSTN)
>
> computes the bitwise AND of the register offset PM_GRAFX with the
> bitmask PM_V3DRSTN before using the result as a register offset, reading
> from the wrong MMIO address instead of the intended PM_GRAFX register.
> The same issue affects the PM_IMAGE cases.
>
> Fix by moving the closing parenthesis so PM_READ() receives only the
> register offset, and the bitmask is applied to the value returned by
> the read.
>
> Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains=
 under a new binding.")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Applied fixes and added a stable tag, thanks!

Kind regards
Uffe


> ---
>
> Hi,
>
> Most likely this bug went unnoticed as there is no in-tree driver
> currently calling reset_control_status() on the BCM2835 reset
> controller. Although I'm sending a fix to the .status callback, another
> possibility would be removing the implementation of this callback
> considering that (1) it's broken and (2) it's not used.
>
> I'd appreciate your feedback about the most suitable option.
>
> Best regards,
> - Ma=C3=ADra
>
> ---
>
>  drivers/pmdomain/bcm/bcm2835-power.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/=
bcm2835-power.c
> index 1d29addfe036..0450202bbee2 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -580,11 +580,11 @@ static int bcm2835_reset_status(struct reset_contro=
ller_dev *rcdev,
>
>         switch (id) {
>         case BCM2835_RESET_V3D:
> -               return !PM_READ(PM_GRAFX & PM_V3DRSTN);
> +               return !(PM_READ(PM_GRAFX) & PM_V3DRSTN);
>         case BCM2835_RESET_H264:
> -               return !PM_READ(PM_IMAGE & PM_H264RSTN);
> +               return !(PM_READ(PM_IMAGE) & PM_H264RSTN);
>         case BCM2835_RESET_ISP:
> -               return !PM_READ(PM_IMAGE & PM_ISPRSTN);
> +               return !(PM_READ(PM_IMAGE) & PM_ISPRSTN);
>         default:
>                 return -EINVAL;
>         }
> --
> 2.52.0
>

