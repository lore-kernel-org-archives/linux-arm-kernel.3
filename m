Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA24C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UdPvnPkDYszULhre/XOAdt2THz5zT2TlDbP/t1A4yE=; b=LnZzK9C1ggsmzYvlhV+sI8K4uN
	Vk4PBhALmXJZLiL2hAlaXSnzEB4ZZ/ps6Nzpf4PKlywYoaLpbuPlrFzx6Dr5an8msFpEeaK1UJKgj
	ixKZLzhE6/LJcNCcvhKkesJ9VxYePhITFFiQPpUwM2XWiRmuUSTLqkboOdEJjuFg/Q5IA3jnZVTBC
	c+rJmMHqAP+i4SpUS7VzhTFBxy+YuXxnz8j037XuUwYaN4+oUmVOO3MLvdjGxbActpoGNhczKuCqL
	my8oeEcmLdJopAElOIi7xU+9s4DBz05ADe2t7Cnb1q8Tbs+4hF3KwGzIRINe4yFj/7doTS5jb93JE
	ZS9bP4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLCA-00000008Oyx-3546;
	Wed, 12 Mar 2025 12:28:22 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKIy-00000008GpM-2pEC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:31:21 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-72a1253a3c1so1938079a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741779078; x=1742383878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UdPvnPkDYszULhre/XOAdt2THz5zT2TlDbP/t1A4yE=;
        b=F0UmHF3nXQOufU/ZalbT4zlV+mv2ggDPmK8PtHtlr5+XgUEh9hJajGWQZXjCMy9ftg
         kgq3q5b40aSpE7p424ZKpMvwt5ofdfCUvrolHiM7p+Ftc9pVVTXkRj8wCyVzPJzGMOKG
         YU77dlt4/KPu4A+rFGD96h2QTBrWR7CwyIhWnBltU/ywyA2jgkxOpujjMJrpKb+YllEy
         MbSJUypC/N7hLw+nDnaMZs1WnWweUt9N9joQUS7/SStAvMUxTpqAEFVQ6zJembBSqjkP
         5m2+9WOB3bpHrWAvJGYvacLHbPivYe/coN/vF0waiQoANQ6V9/7+4SnkyW5Ln6lC3V7z
         1A+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779078; x=1742383878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UdPvnPkDYszULhre/XOAdt2THz5zT2TlDbP/t1A4yE=;
        b=rXLryznMz2UJACytnYKCs7Mu6PYViZoSs5zaAlAMWTTwm5NKXqt5QLhvu0sDRs0HZ7
         KkaqDAnHKc0Yxox/OYr28CRslTaQUQYjAi3Q3JXHLM1atoM6FeVXYA2OWMJvll/ihgXv
         PWNh8Rjk+nxR6NIjuz+MbeBcJkYiqx6gfoH3OfhXpL4rQb/BtZGvMMKls1jrY+NQ8oKe
         WA2rvv1QP5iF0+dU7qursCGEk0TFKxojUadpxuxejwt4j9cuL0kv+enpPg9M2DRjoufI
         TvZlBjzdQg0bupcLTS8+OOXuyB+pXVcPT8r9J80+RIk+IZzivoLRLYJNthlY5SjzbWMa
         mXOg==
X-Forwarded-Encrypted: i=1; AJvYcCXSoYnMG0h9r26QIFnwtbZIfMqd+lcE4hkF5/arkKtPmcSBERyIeOza9j+Sp4lFJyb8oh7yReJILMVuhUSr6iqY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo4jMQsoDnAW4hBneoKRnzGOu0GiSfbwdvMu6V7mDOSmJXYDBp
	3kloMyzYPX8nm3UP1ivZOG9ni/uNMXkl5Y4z2NkjrbksScpp46sh2PwxLUk5Yeu8il2cDPzQR7w
	Wq75Lpn9GKgRIFe2VfHNq8DQgCfrfOeEocXAxbg==
X-Gm-Gg: ASbGncubq15AVCgyXDHzuA+vk2wLSulqx8a11KKUUECwlZCg8SKF5CLeUDl1fvwhzOR
	hCwUuOFOjHE7AzPRHyrSWl7SpaZy6ONia/qS9mp2iILxRcdqsQpeG6ar4pYdWhaCD/cyer2WkVc
	a2y4U3a9LSRrrICqPyAIF5f3shDWtF
X-Google-Smtp-Source: AGHT+IHpN3V115z284qmxaOdgGA4PwV3v/6Lpfa9pDfmxTKlcBbQ43+xR982OzrJIgzm+w3NL49THbQiezCdr3Q3kYQ=
X-Received: by 2002:a05:6830:91f:b0:727:2f79:ce33 with SMTP id
 46e09a7af769-72a37c6a7damr12652067a34.28.1741779078312; Wed, 12 Mar 2025
 04:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
 <20250307-pinctrl-fltcon-suspend-v4-3-2d775e486036@linaro.org> <59a1a6eb-d719-49bd-a4b5-bfb9c2817f08@kernel.org>
In-Reply-To: <59a1a6eb-d719-49bd-a4b5-bfb9c2817f08@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 11:31:07 +0000
X-Gm-Features: AQ5f1Jq8qDRuo8RWVbqyC-4s6dvJ3zqh5v94onY3xAq0EKJNYhbmQXeDH_scC5U
Message-ID: <CADrjBPqYoHckqr43y1z8UtthZ9DOG15TJWSv_707Jbyf1yforw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_043120_722772_988A0868 
X-CRM114-Status: GOOD (  24.31  )
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

On Tue, 11 Mar 2025 at 19:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 07/03/2025 11:29, Peter Griffin wrote:
> > gs101 differs to other SoCs in that fltcon1 register doesn't
> > always exist. Additionally the offset of fltcon0 is not fixed
> > and needs to use the newly added eint_fltcon_offset variable.
> >
> > Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configura=
tion")
> > Cc: stable@vger.kernel.org
>
> It looks this depends on previous commit, right?

Yes that's right, it depends on the refactoring in the previous patch.
To fix the bug (which is an Serror on suspend for gs101), we need the
dedicated gs101 callback so it can have the knowledge that fltcon1
doesn't always exist and it's varying offset.

> That's really not
> optimal, although I understand that if you re-order patches this code
> would be soon changed, just like you changed other suspend/resume
> callbacks in patch #2?

Originally it was just one patch, but the previous review feedback was
to split the refactor into a dedicated patch, and then add gs101
specific parts separately. The refactoring was done primarily so we
can fix this bug without affecting the other platforms, so I don't
re-ordering the patches will help.

Thanks,

Peter
>
>
> > Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes since v2:
> > * make it clear exynos_set_wakeup(bank) is conditional on bank type (An=
dre)
> > * align style where the '+' is placed (Andre)
> > * remove unnecessary braces (Andre)
> > ---
>
> ...
>
> > +void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
> > +{
> > +     struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> > +     const void __iomem *regs =3D bank->eint_base;
> > +
> > +     if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> > +             save->eint_con =3D readl(regs + EXYNOS_GPIO_ECON_OFFSET
> > +                                    + bank->eint_offset);
> > +
> > +             save->eint_fltcon0 =3D readl(regs + EXYNOS_GPIO_EFLTCON_O=
FFSET
> > +                                        + bank->eint_fltcon_offset);
> > +
> > +             /* fltcon1 register only exists for pins 4-7 */
> > +             if (bank->nr_pins > 4)
> > +                     save->eint_fltcon1 =3D readl(regs +
> > +                                             EXYNOS_GPIO_EFLTCON_OFFSE=
T
> > +                                             + bank->eint_fltcon_offse=
t + 4);
> > +
> > +             save->eint_mask =3D readl(regs + bank->irq_chip->eint_mas=
k
> > +                                     + bank->eint_offset);
> > +
> > +             pr_debug("%s: save     con %#010x\n",
> > +                      bank->name, save->eint_con);
> > +             pr_debug("%s: save fltcon0 %#010x\n",
> > +                      bank->name, save->eint_fltcon0);
> > +             if (bank->nr_pins > 4)
> > +                     pr_debug("%s: save fltcon1 %#010x\n",
> > +                              bank->name, save->eint_fltcon1);
> > +             pr_debug("%s: save    mask %#010x\n",
> > +                      bank->name, save->eint_mask);
> > +     } else if (bank->eint_type =3D=3D EINT_TYPE_WKUP)
> > +             exynos_set_wakeup(bank);
>
> Missing {}. Run checkpatch --strict.
>
>
> Best regards,
> Krzysztof

