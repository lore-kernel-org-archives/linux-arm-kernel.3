Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF5CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzdckLOvviUQpZqUvuM6GKWGoyZ0Z9gzfOnU7fb0Qa0=; b=uu/FQCPsO7IHfkckpGUR/GRY4f
	4aQXk2Ir3ayk6p6tIju+BkOAfUJJ/K3QySkuz/XLFdi+HwNdenz6ERJCk0Z5chhHGfPrMPjI8kqzT
	snhDKJxE2jaNBle0tULf6y/2y52qRDe115dFVqLA1Qx2KSB+j93Vfh3uxhKaKKB9e0awqPBd93SeF
	UZIv7waRRlf94MluXPpJcbDeasTt5x3qGchUCT8Wlb+0OPtQXfMIfyLlIM9rLSpzucyP1C6mNHOeS
	9Ww2J8+OttnLBQobBK7J6aLHR7jGix6344/6NkZ/K7XfNXyRG06CGP+qXpm1UJbc+8Q3wg3VxUFFm
	TQHOqkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipL4-00000006b8J-13AO;
	Thu, 22 Jan 2026 07:42:46 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipL1-00000006b7x-3Uw3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:42:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so37417066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:42:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769067761; cv=none;
        d=google.com; s=arc-20240605;
        b=Rph+4jOKK9tjSapivyB2An/+dlqaMWgbGZRpw5kbEPPzvftlbjTH3NvhSaUNW1e/OC
         LBje20f2e508A8eRlCuQ4qvXMdSZ/iyZmWuYsTPffiUioLC++Z/D3aWGrzYm00cmNGVh
         0/y97Hoy7M5913cNFWG1+lcBtLoK/osS7dsCGk5hoVbMKhLKS0+na+HXZBmpxfXtaQXN
         mEZLTrU5oKFUHoXZGOXVC4c+g0LtFAeXLae6J7y67v/I79jjiugLj4i7ualjFViBn6RW
         pTof09dGeR3J/zY0aYGwHZmNc0olSCuOHwyec+R1GUF0VtQ2qt2S+bUZww+pBIMko8Rf
         6c+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YzdckLOvviUQpZqUvuM6GKWGoyZ0Z9gzfOnU7fb0Qa0=;
        fh=uziNDpUgzjYDHDIq+oOrQr+/VFce6zBD4OHXugiEBQI=;
        b=kQedGtIgzjbEQh3ge+3sGGjhilMvCA+k2SogaUXUzOFeK0PwP7/k6rw04J5vEpYWeT
         ZQilHBxWyEKIn0Uw4YPHjXkMXn9KPcwBeypUkx2Fmzwru0R2EKsKZAhgzONMyeSYBLOn
         si+8goZKeHnY4DO0dPc7dfxv8xpES/4si2F6pJy6g0jwPNCZnXGxipphU1eDQmY1Mktn
         poebpcTdyPl45uKC2R6oWnWVqyKk7sfoI8aT9ZTfY1wIguI5WPxr6TIJOROXhXVXjCaZ
         kjZTSY1FK5QqLvWocuphZwu9MbriafdbT6rc/kkgzEcvA9T+xlcYuHNUJLwZfxmsulqp
         q7GQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769067761; x=1769672561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzdckLOvviUQpZqUvuM6GKWGoyZ0Z9gzfOnU7fb0Qa0=;
        b=CpB+JidyJP03spNkS1lijW6UkX/C1M2rEaEkXAvEVtuywX4Be8ECsEsZGVRHW3HEb3
         JzUGpBV3TYXZLWoA1gJhPnmQiT1vqB/9H2fRpJyI4MD1lGa82VR7YRHiAvjiCCKnau+n
         N0ttaxLLq7TESudXaf2mlelLrsM8JHfm9UwB7k/HiWmkFu+pnc4kC7aOAUInWr/VHXhg
         5YEAEbSpqjZpgBdEyunEnLh2kzEI4cabZzqJTeOydsWqA889+/cPS9frA0FFWPs7BZSl
         xY9e+6FTmw5avKHjGaNE33p5t1k25RWfoZ9JqPNuJzHiv4LmWAGZ8u7EvJ2f6SEywIYL
         w/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067761; x=1769672561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YzdckLOvviUQpZqUvuM6GKWGoyZ0Z9gzfOnU7fb0Qa0=;
        b=PQkz2I2FcASQzCepQtaPa3QGb2ZzuDOnocxcADb0MfO6RGVJLbBOaB96b9LLgabGT1
         iAefJ5UFbJs4v/vCY9B2C8DHjpAnCszfgeJQ9abptB9GOqTldIx3h5t2V+gopgWJdMPM
         UQOlWsRFspS+Zj+EzPUHoEQfe277KcCrfZRsOHNo2fOIhEhwKTaVW2gUBv3xmu8mu39q
         mYVHeJuqP7/ESFM/2dnEUNO0aojtYO1iV66VBsRcYz9p/ZqVPy8lMdQkB0aaMojc2EzO
         9Uzlea+aWGTS+lCQcoswwRZFIypQ6dowvrYQiXRMEmJ8c8P2yY22rWKK1VJzRSYESwzB
         ZVOg==
X-Forwarded-Encrypted: i=1; AJvYcCV//WNYJcwYXB1/CIObTi0+FSB/Y9k7ASvzJsBcKo5QI4p39Fdv3YT4CH+wGSSs+z5MrH+MbF1XxBoh0azT2ogp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4VQuCOgcr21sTSXHExiLA8eawGn/SKM7a6EZABTK3WvOyEt1n
	ApBiskv1+mxDsNJ/5e1L5le99k8UKamWxwxIn+zvVrYIXrBI76JRF1FCNpTSnC7VZnBQDej2TfC
	UOeCims3/whNOFCknyFPep4LgvG9G6Wk=
X-Gm-Gg: AZuq6aJeVGypnF2zflCIwWSB46RESvG2EVmdXlwPyptDkrw2MLZPxr2RXJOtmdHy0Dz
	H0W+Lb3ll5bWrGYHxiDHXx+Oq6WQ0o8tb/kp1wnkVGjTYZUzcESCWLq52CQeuLzLX+e+BafCa65
	6W67Xet6OtCpHjAXefwNDsR//RT+OOQTD4MwlA8/oW20oMJxSLio9U1RtouQH2QyoTMCQJsULFG
	DwCGEht78Jt61TQYOki3NvhdPCq30MEy9ssiBq391XGp0Ic9VLXU09kzZ6XZh7+vmMfmopUMNzO
	KDf1+n2HGDrROke7sF1shMB96O51ojCFLhXPutzRk8IZ2Us4tXvvQaXOLIzWSBlkVPDdO2E=
X-Received: by 2002:a17:907:d8f:b0:b87:d44:81d with SMTP id
 a640c23a62f3a-b8793035657mr1651237366b.45.1769067761098; Wed, 21 Jan 2026
 23:42:41 -0800 (PST)
MIME-Version: 1.0
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com> <20260122010516.1200630-4-florian.fainelli@broadcom.com>
In-Reply-To: <20260122010516.1200630-4-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 22 Jan 2026 09:42:04 +0200
X-Gm-Features: AZwV_Qh_-eMDGWDi_48iA2SRMstayt46m5tzsAPhrjuY_D8cPtNMI-WDccTzmy8
Message-ID: <CAHp75VfhEZ60F7ZHkjNDZ3JR6B6tNF5ORUDPoN8ZibbvF=js8w@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_234243_892024_8BAB5B14 
X-CRM114-Status: GOOD (  16.77  )
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

On Thu, Jan 22, 2026 at 3:06=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> The classic parent_wake_irq can only occur after the system has
> been placed into a hardware managed power management state. This
> prevents its use for waking from software managed suspend states
> like s2idle.
>
> By allowing the parent_irq to be enabled for wake enabled GPIO
> during suspend, these GPIO can now be used to wake from these
> states. The 'suspended' boolean is introduced to support wake
> event accounting.

> Signed-off-by: Doug Berger <opendmb@gmail.com>
> [florian: port changes after generic gpio chip conversion]

Likewise in the previous patch I think this deserves the Co-developed-by ta=
g.

> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

...

> +               if (priv->suspended && bank->wake_active & (u32)status) {

Why casting?

> +                       priv->suspended =3D false;
> +                       pm_wakeup_event(&priv->pdev->dev, 0);
> +               }

...

>  static void brcmstb_gpio_shutdown(struct platform_device *pdev)
>  {
> +       struct brcmstb_gpio_priv *priv =3D dev_get_drvdata(&pdev->dev);

> +       /* disable interrupts */

A useless comment.

> +       if (priv->parent_irq > 0)
> +               disable_irq(priv->parent_irq);
> +
>         /* Enable GPIO for S5 cold boot */
> -       brcmstb_gpio_quiesce(&pdev->dev, false);
> +       brcmstb_gpio_quiesce(priv, false);
>  }

...

>  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {

> +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend_noirq),
>         .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),

May we use one of the PM macros for these two assignments?

>  };


--=20
With Best Regards,
Andy Shevchenko

