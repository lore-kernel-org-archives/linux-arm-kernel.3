Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936AAC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 06:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJqDg4ZzbSRGiuJ0YRjEt1ouOh80YyNLLBfkuJ2C66A=; b=UsriUovwt+PxhWO6PMzBRryhoi
	Agns5fobFKehGmeZy+tEC7wOcERtNvs+ofVVsqRdtK/dC8PmDAl4qIZ1Yj+miO0l08r3Imn/cZNI6
	wq6IorpmTqBsAp9pTrlPs7dJ1srQHvE0KdDovvIggHueI1i5zgyFkWZU/AIpydns0UdTdlOU7ZlC+
	MgBPOkrsag4GYA9ArX/X1fB0fevD3K0aKND5wNYT41uB631vnvu9CeWlFRC5S16NaFsazqzJOYmec
	pBcHGfCQqe6xAMsO5g7i/4Vmf6nLV2qMSOVfZpo746mjGacScPTe85XlHsKPh1j73N9ZkxWoMgBmV
	icGqz32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJp7-0000000B9Af-0hkg;
	Mon, 10 Aug 2026 06:49:25 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJp5-0000000B9AK-1W8I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 06:49:24 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so147840866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 23:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786344561; cv=none;
        d=google.com; s=arc-20260327;
        b=OSmKr7ZEGJ1/4Zbp3AK/y5w4GwsYbHr7x65L2gJrOisdcjLwOHgfjtZ3oOvrAndQq7
         vHVEf7+3wxrFEbz870ODNSJAqKGBnjTnz3e7pf1MWC3fB1SyxRe5V01F1Tkbl8iQcJMy
         YYoKkwnBsTSbKeA0fTcIptR5yYQJlrEWOOYT6TAuOB3NyQ3z5yMhbJLTnfSEE8N/QJVV
         kQ6wlNUlWgJcFnkUjiRgqiOlOeGMYf9/w0cCjnMqHO+dwz1Flx77YdGDD9yR1SqVLomI
         EnJP7VkOVm3NWszNTvcvlP6ffsq4QU0v3Lmerv0hKKgChBRTTtXJQphT+xMGLmUldgYx
         k6hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NJqDg4ZzbSRGiuJ0YRjEt1ouOh80YyNLLBfkuJ2C66A=;
        fh=/hqp/vx7AS5kN66LbSRb3oU1eFp47k6a+09lWna9Bgc=;
        b=G/+B18wX52Qr9rm7+KsTi4uJOqRpzK1p2Dl/4PPO2+V5Jtl8ih/bw4hNTM8hRjvBIf
         ro+eWXZqx0pH3laZqFyNWgyMM9XD9RHJ350JFMIoOuAbspGmbU1JETVW/gycEhI7m0VQ
         F6qoEgN9/nHKxueaEW3fLrov6IntnzACZKU3v3sZfGuXy5PVdEMGjvgeIBQ5Cf7D6g/9
         w+UVJ9fksKpEpBK6B3o0u+kzl/UU+2NmO6cD9aHxYXr+OKv2zXB8A/Vgoyid3egAOqZG
         /gWFwbLe3JIwos0eUuAAoLsEhAmmUN8E88Dc1ZlL9JsYsEzZr5CZO7VFHc+wQhzUeEYi
         UQ+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786344561; x=1786949361; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NJqDg4ZzbSRGiuJ0YRjEt1ouOh80YyNLLBfkuJ2C66A=;
        b=qSrarEHwotWoZ/p+Ft4jbVO7FKbJ/rvdCBSJ6Tr4DxldkCZR3HuJ1kjZnJd492WTvr
         dk+ICVgHRh2oZxqVIMLm3a6pEW6XlFix0AaqS4AW6BJVA+fPriWxqGk8JW/TAkFq9Dzl
         SAbEo84oe5TgiPPGomtmcafHku7yaEh52Mm6hEngk3Z5Tvz4WHVUMMol28RRKGJ0XKC/
         Y19UnP5vTSTf2t+kBvw6sWCv3QYCbaAdnZJThXRQENGO9XfpNCHEaEz1FzXSf1UGyv+Y
         SE4/W2bxt7uQ9jBLx0rEf1+IjPn0pMeNV0OMViWdPgH/JnRP1anQi4ZKSxzgGAtRiKsh
         iSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344561; x=1786949361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJqDg4ZzbSRGiuJ0YRjEt1ouOh80YyNLLBfkuJ2C66A=;
        b=N9gAVIJ8OabHet/MD04umh3ZM/Be/4QKkxJzkzG9IdAE0MQ+T3xT+6baWpgP3QF9LO
         5+CMJEgNzkm7ZpUmw/xEMYwKmeFiUs8Lqg3uaH88rsHSTtVkq05Qj/G/sGyTL/2cw9HL
         kTcTR2gXTWO2Dd5sBdX5q+etHMsuoloyOvcZmf6W5oBxjqoAUD/hOa9/laY8SLFONYRo
         /CHGKUcxAeI+KyamGo7n9Rot2NueoFVZ7X5mI4gmZ44zEdylaf3Lqt3kT4Djt8RlZI5e
         yi5hqwpw1pTQ5SUruwkEw8R5A8ecKn5ncmGDavmetF5FYHc+Oc0KJ4qJQafroUMXrz8G
         lOow==
X-Forwarded-Encrypted: i=1; AHgh+RptR0JAzON4W0SUnbLVKrtSts2dnJfUx0LESjlBNwCq1sGhD7k55+Hvn0xdRTKpuxIRPNHRWw0smKv5sJrVMqis@lists.infradead.org
X-Gm-Message-State: AOJu0YyjNiG+q800x/hKPyom/TfokKoFmklJJN8ZyH/Szwb9QwEd4Swo
	xfD0/mRnCMggMWr3YSQ4OwtV43QFoJGsYLnKiRcgSKkkTldUY63CFvg8cTJENvg3Bb0ll3nPzKK
	j73I4WXhfSmo5nC/4uwz+BNtsXeiDmnc=
X-Gm-Gg: AR+sD10VX9rGH5UznpMjL/SkXnS2NbELmwIOZLxxqvB9VJtlHHpKpw1dDvds1v7N/xd
	yLzQtPhWB5H4rpxrADVDgXckJf/8xnVdgvbVRbJYhdvl7WgqxLdir57NX1UGiGG1afVAyDEm5qB
	rrgU6HXNWpS5hZmm9fQiwkJfwyi+g+nAjiKOgKzudiDt+yw7FlaaYFg/2JdpIx9mAhidseoWZS0
	lYixuxCeMJ6dNLGJF4Qb9TObt+XoX1/lLZZiwfLbY8KHlE5dHU5u7AYGrRnAKsJc9xDigux4f5V
	70FWCJbPhP2CY9g6LEv12qihmuEFIuqceAuU+EVoQQS3Iu6ILr2ns488432hABSUxKMGKj1NQBu
	c+6ZEooeRjpKzzHmrADsyV7vF+G9PqM+rMWPtJC0WmdTsCwQdcLyULp2pZ8USyaheViXR0c+RJY
	/U4/UXB7DtR176mymKXudCQQGQBxbbKdPY+3TDxyscrgc=
X-Received: by 2002:a17:906:5a99:b0:c1f:c7f0:b433 with SMTP id
 a640c23a62f3a-c208729e00cmr656355666b.9.1786344560617; Sun, 09 Aug 2026
 23:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com> <20260810053142.27938-5-phucduc.bui@gmail.com>
In-Reply-To: <20260810053142.27938-5-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 09:48:43 +0300
X-Gm-Features: AUfX_myvkt26qnEuHXO5Xk6ubitJ7QWhE9cAvuIMlCWxlqjxJGXs1q6Q8rN1zc4
Message-ID: <CAHp75VcGqgtUxYcrT+JdqFYX-4oKSfGQKRHd9DoaMW3f1FaR1A@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: bcm: iproc-gpio: Propagate errors from
 optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, robh@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_234923_464945_8931EAEC 
X-CRM114-Status: GOOD (  15.88  )
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

On Mon, Aug 10, 2026 at 8:32=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagate=
d.
>
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.

...

>         /* optional GPIO interrupt support */
>         irq =3D platform_get_irq_optional(pdev, 0);
> +       if (irq < 0 && irq !=3D -ENXIO)
> +               return irq;

Here and everywhere else in the similar contributions you made all
over the kernel:

>         if (irq > 0) {
>                 struct gpio_irq_chip *girq;

Use the 'else' branch instead of the above.

} else if (irq !=3D -ENXIO) {
  return irq;

But before doing that, check carefully if this is really what we want
to have and how it will affect the driver behaviour in such a case.

--=20
With Best Regards,
Andy Shevchenko

