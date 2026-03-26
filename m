Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C25C10A62CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ah/+Vnq17L8vUjHyAomn0sZHYBsduWJsRT60q1Ohrsc=; b=Kepf7Ct8KsZPTCf7L4LCRXpztw
	w4aE3nK3yjxgvXmqLHyZ1fCEVXEDrHcgAqWouIEAqtJJHjMzxZpZy3NALzYV3YI9ZqFnhxCbIQ/FQ
	HGbk9azcF4D2j28kc2j33MNhIZEcp9c8IY46CjPf98K/SZhaBBtaQlmeT7IGRVgdlV1T6Nov+kv1f
	SBjdV74O1+uIavYG1P/fiv8VLhlN8725O6HTpX03c/rnAJWYFgtTsqxugUTimuuYVbrYK/iZp82dY
	kEPcca4TyVqhtH2nIPQeWyuf5VdqUmQEMXK5zJ41iX3eCXN4de1Ch8iOhRK+jLyhG6tDxvbLu6lQj
	rq06ePgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kSR-00000005WDV-1dP5;
	Thu, 26 Mar 2026 13:09:07 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kSP-00000005WCQ-0lDT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:09:06 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8cb40149037so113473785a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 06:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774530544; cv=none;
        d=google.com; s=arc-20240605;
        b=U1W7q+lvBHV/h5gYuk8tcw0Dko7nbKDk3b84qFLb292Fnr7XCbRzCR7tIikGQHJOzC
         b28XAEPaWkHmCxUVj80MLrYQ+CCVH0/iTRbSgSMCZ9LYOZ/QfcjWWoGl+78qXih9SaKL
         u9AivWv+1xDWeud3A+pMi5UlE8WjR0Mxi8jj+VcOTh2naLFGExaXBwFL+4Wfz+u2Z+Hl
         uTulSPLVF4zWETJ4xL74YJw6oTgk+kaEf+EwK/OShwa9u5Jsnohqliq0LcqmGI3jmJw6
         G7wn1gpgxS5emQkCGK1EREjFOCnZjH+oy4PMWK/vExdV9DlsYRHKLAhB9mwZVdmq0jnw
         1vIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ah/+Vnq17L8vUjHyAomn0sZHYBsduWJsRT60q1Ohrsc=;
        fh=DMb6R11/PwKnjZIbRSLKn2AuX8GpC3FjgYjI94U/Ucc=;
        b=AeymzsjOOuArFzIT5/gBlBHgVCUD5zEdDvIh+MulEILYMrAhwbhD4nfwVQDx7MmPuv
         +1/6ROkGdQtOBfU1hD0tYF9OVaGdX6z2uvo2WceYJ/qTRMDR2IiVFuKtNGq3Do1qZtQ+
         tjqL7jxGAJQR3ACWJPP3f+qb1+sYvnHbdBGGlKsAx4D6Mt6Jfm4Y+L93emNvoaDsdKiu
         JKyWQNLawdREj/fk+n7UhnVM9tv2YmCjWD6oV1o0Io9phh9GkX7hW7rzc1++MoFAuOoB
         x2QweeN73LxM+PG93lORCHjyoqr3njTKiWhUVmJ87W9YzoXkbixO5uEJXXWL8eM7iElh
         I21w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774530544; x=1775135344; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah/+Vnq17L8vUjHyAomn0sZHYBsduWJsRT60q1Ohrsc=;
        b=iDNd1NkAH34m7fY4S8oiJFcMkuKm50V+HuwR8RWPQ3c7E2QXZ528rgkpznw2z58TjT
         sB+S6s4e/+n9svuVtDdrthYcD0wa9I9Ml1LVQKgQi9PklrJFjinQP0p/70/SnQCSJghZ
         D4iX+2sPfY8eMPlEJRtsom3qJ0LZf8FS6/OLa81HSsUhcFTtpTXQC9ZD9KAMBHB2vxKD
         U20R774JdVQCZouOKWzK1UilZXGWG+KVCWnbdv1oclxNS29dSfPAFiVmX2mCvP3odhka
         mo3AugUe8tkqDKNhG4rhCa21MRnxmY4bbbD7jw32w3gmO5Hh6vO8Q7TbfduBnAqI7zjS
         iKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774530544; x=1775135344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ah/+Vnq17L8vUjHyAomn0sZHYBsduWJsRT60q1Ohrsc=;
        b=b6rLLZ9m4qYAUn6Sd2rGR2fhdOAnMghkM5N6U5gHyMCMLZbxMQJKEPHpQ49a/Earqx
         utwXBvTNygyhwSBYoLwkEp+2WgquY8VKRpwCVF8oiFhpma1mk8NMLW2MZg008DkuPJoy
         B9P0ElygP+9ejmlugkTY8PT7fKnNMglOhu76uG2ULiyazZyg6Gmos5KGMkcfBpPGWC2G
         o0NkssWEgMm2148mC62YeH0wNC6NaXqBgfGpbS72NcA7TFWmZdUJjyL9wL0yqdSe2DwV
         NI3skkugoE4wnh6KUrd00dJvFcyEOiFX7ZP8nJdjshWIgfooJdJL8I7x9HkX2aIk5T6/
         vR4A==
X-Forwarded-Encrypted: i=1; AJvYcCWVqA6NlEUeYNdOuuAZR4XJKsj5Xsldw4sOJzU6HirRCQBVKlcHVVNFWto3QjvGD74+E+m1ddgkO8MxxgW4VHVz@lists.infradead.org
X-Gm-Message-State: AOJu0YyL2xQhKpF0AVZIHKwIWsnMRZ382ia3VDRfG9JcLUivMJwlv1kn
	zPUpkzV/wjy2k62xxN5NBzQHzTixAhv66C7gQ0n3nnY0TYPZ9OL7TAJKmHH1AL0/ofKjBXgLm0B
	ossZJNm/vMGjMDKoLJ/xvPXGMWFmE8WA=
X-Gm-Gg: ATEYQzwsBUOOUb8e6TbHTT3/IAv7fkIryKvEq1FvBhumRoCx7HxbWMqCv8abVymuKPr
	SxEtzI9l74+2TlwXWI9OapVUToX6rFF6XaG3MbhvnUpNmtcHRucRB8WdoLhFKNOlRSAZCFpqf4z
	SyTv/bMah1M1rnfVTDh8V0PZH6vxyPwu6cuXoLpK2BYhA9RUtW4+l6fV6mc4wJzrEZBBs+dwtjf
	DjDZBp2Gnr+Yr6dsKPk7avnLcoMPEtDnAvsQtymm6M5d09BpofYPrHNN8IehIegz1+qJ584jI+N
	5JtBwyFIrcxfhI4c03rT/pkONg==
X-Received: by 2002:a05:622a:10f:b0:509:3cd:b22f with SMTP id
 d75a77b69052e-50b80d14417mr109502331cf.23.1774530543679; Thu, 26 Mar 2026
 06:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260326-archtimer-v1-1-5328574e5935@protonmail.com>
In-Reply-To: <20260326-archtimer-v1-1-5328574e5935@protonmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Thu, 26 Mar 2026 22:08:52 +0900
X-Gm-Features: AQROBzCaJ6byPUSHJ4pm3sRtScQ6quhPCnl36SS5KcV2s9wTyxyUFaEy3F2F7nE
Message-ID: <CAKr_iV6uPSCZ1BzyMOxV3ET44Ho8gP19X=g1rzG83nWUzNkhWA@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: initialize GPT6 as
 system counter
To: rva333@protonmail.com
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_060905_220999_FC821976 
X-CRM114-Status: GOOD (  19.25  )
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

On Thu, Mar 26, 2026 at 10:00=E2=80=AFAM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
> On certain MediaTek SoCs like mt6572 (likely before the CPUXGPT was
> introduced), the generic arch timer is fed by the GPT6. Some bootloaders
> don't initialize it properly, leading to dead arch timer.
>
> Fix this by configuring GPT6 when the MediaTek timer is probed. This
> makes arch timer work properly and removes IPI overhead from MediaTek
> timer broadcast when arch timer is used.
>
> If the timer was configured by the bootloader, this change is no-op.
>
> Tested-by: Akari Tsuyukusa <akkun11.open@gmail.com> # MT6589
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  drivers/clocksource/timer-mediatek.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/t=
imer-mediatek.c
> index 7bcb4a3f26fb..7de34cace572 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -22,6 +22,8 @@
>
>  #define TIMER_SYNC_TICKS        (3)
>
> +#define TIMER_SYSCNT            (6)
> +
>  /* gpt */
>  #define GPT_IRQ_EN_REG          0x00
>  #define GPT_IRQ_ENABLE(val)     BIT((val) - 1)
> @@ -335,6 +337,9 @@ static int __init mtk_gpt_init(struct device_node *no=
de)
>
>         mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>
> +       /* Configure GPT6 to feed arch timer */
> +       mtk_gpt_setup(&to, TIMER_SYSCNT, GPT_CTRL_OP_FREERUN);
> +
>         return 0;
>  }
>  TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>
> ---

Although it has already been written,
I tested this patch on MT6589 (Lenovo YOGA Tablet 10 Wi-Fi),
and I have confirmed that MediaTek's timer and Arm Generic Timer are
working properly as before the patch was applied.
Therefore,

Tested-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Best regards,
Akari Tsuyukusa

