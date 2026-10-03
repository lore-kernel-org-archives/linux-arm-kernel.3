Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6634FCA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 17:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=; b=CKjgKtZm12lnmssSfhh/4fKH9E
	iHrTzAJu1uYMFzQdtWJwn39XmQYfK8PEpPo0P9SGxokxG2XijbGy8dkEc/sQZtubdARMGrevHPeke
	dTl1x6mhzJ1Xe8WtWKm+7E/GeRDZudeGGQA9hMw2AR3diuEHrlKq6+zOz9nCgpPS465mFkJTVvKMy
	BfhR47ngxTOhvsdqFnIzr2MsCXANQ1gIC70o9jqbJH3YkLF173FYo136vLJG41z6xyt0JtMD4u+Mc
	bo3Kcka9n/BbZhw695tqOH8Zv7yXX9Pm/vYi51X0Bm85GzmwFgPgO4ak20yAd2WxtrbY+fiPpUVb7
	vvsRIrQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD41R-0000000Dt60-46sJ;
	Sat, 03 Oct 2026 17:59:45 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD41P-0000000Dt5T-03CT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 17:59:44 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c2940ff2313so50939466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 10:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791050381; cv=none;
        d=google.com; s=arc-20260327;
        b=OFXf4WOZtOt+ox3Lak+5M4n4OKsr/nZZbnA2OzgiT11xWpxJIUj0WvTCa3rN/UanEk
         cLApENhDAS3RNVgOMwVYrskvA/D19fcpMP3U94pKJg5XwHkbqiZeCfZpfx5hkZiwT4Pa
         88y4G77c1Z2rnndIQi4VOpn5JYv6HA9klBrVOOONXEvX+711jWFO2WVRn1LHuxAnUeXh
         H+usA1tsgw1ogHqNbIWjnTZhbFY1embj9+8iYEwkAYQpQ44xjjngNPaKUlN/lnjmMqli
         6f6sayU6OwD8bOD/Bx40I+bCN1h1jhfXXedlR551HDX967WcECdx4ouIbGu6Md/xcOqJ
         QT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        fh=75NQ+JzgIP1OMe5DLFdXuyduqIIGNnliy0N0IT3vxwU=;
        b=nz2vfm+vkn4bEWp47d/0Ojs6U127IKE4HQ0l/7lmZV03i3sMOEqVQscPrRaIPQan8U
         UqF/tAI1s5MMs0kiYDbcHmKr9h+AkR+i1ar21BNTrq6OPCGIZj8jMNDpgjzUKFKFf7Mi
         TsUK9ldnRg3y0a20c/H2KTCGzjprcThLTtpMDlM4onBPicbeju31MzPHsZ3Mw1BUbVQ8
         X2JO5pOi9B3r3VR8Ds/Nmin67XXStTsX1X7eCjQqQlEDnoCgUIzPxHg08gYWNNOc6L44
         B22a+XXpvwjG5BEo+CP1LQJm1LEHdknfHl8H42ytJLlRQXIWDSsYdnKPWpof3qTxHe03
         t03w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050381; x=1791655181; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        b=XlcJvStQPFSpilP/4IPaZEtpMY6X7/AFhyTPOLMjG199/OSyjtNnzdbSImcIOwBfmY
         ekLM5Z4g7OBKPErl8Xaa0V28zVMm1PwUlnQSDsJvGD3EUZPKvJx6xbVe2JvkKZoEZUAE
         oPwBGVvLwDz+ILOkgBEp+EatcFhIa9nO4vlnmu8vOGgVqDK1/Fj3hQSeV0uJqQSCjVKJ
         YvAWOzNyzEgbc16LIewle1/xWxTCcb3la33N6cw9qIOvL2pg1Mw2C3WI9MwmcZcb9DlU
         QO1QS4Hr4eXyodMUqplglKGc0WMyj+5CjpGofcGeguUXdoAkmPWBxT2yOUNiH3NBOAHI
         zcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050381; x=1791655181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        b=jydJV3bS8JE5I7DEHe/+6/67/hCLGMJdu831OuAUZozNI8+ffoY9u8AaejD4RpunX6
         xoUOiiBCa8lMRMw4BYNYqG+7SSq/NtPm/y7j5t0FjiGm7M++ROTRw4Cuzu6ojoJnHwPS
         Z4pIArDktwNHxnEzo7ORSpr4VPmqpWrF6BQdseVrTp/1Da6hthYmVs0q+dFTZiJxZQpr
         tfZcCKrf3/37QSXvdpWs8Rj6EbNoIlj85BGvWaivcN0S4l80LjK1YSuPni9qUtTe8BkQ
         NC+wr25iH2z2Gszkut2GhqvzeWHpQ0GyGERZiz5eXmTKF6WxrRfpq1qHf/68UT0wGi42
         qVNA==
X-Forwarded-Encrypted: i=1; AKwUvBze/YUAI70Sn+iQTi/BmXB91YHWooALQHwStqBMmXoGURxnIEWL/HzMpqg/yjbxW51cpou3DxSDBuIBhT/d0+Mv@lists.infradead.org
X-Gm-Message-State: AFuF++nHqG7WasGtWAjftU/UWsP77Jgm3spPbjex/zHM5OzYGUcLJTNa
	B8f3kpSlQ+4mQmVAQgIheS0Uh/1jSVsIrVwPVqHLs/tLboIwneZYrdSQ8OKZGaQwpX7PpbskvOy
	/13wF/rVGnrIblHtjb2rHaVuw+5DtY5w=
X-Gm-Gg: AYBFou17ZiddSLagGcfLTHa0GZtxBiHr+5gXevA+RAsJ2yLtTuDWmmxQH+20QnP/k5/
	64D8mmdKPF/ZQ8sLnK0cxI+gL9I9XUmJ5Vekrde/pCcPAh2x+LRVuWgtP6z03Y8jgro8rvD9BaO
	+3DiHwI39euXjCtBiqh0ReSBWDwG7CWyjoLbjLxjpkeijA18NtCedYW0g3Ndpv0b+APN5z4PhWd
	ijKpLtuxYIBdMpImyP2qmUf5zlnnFczCsVwjGp2oALAR3tQYAJqoH0GjxtT/+ncnVKA4FOMLt+/
	D2VFzZeEm/QJdmFlCExOkgYm6X6Ut5mItzLYCsrJA32sg/vapCA42ZIoD/ZRN+4wRlezUDfnERL
	xUQeQYTSWGNFlkmuoX5ZYsw3qbvbVrVU0qAv/l5Qp4XlhISFmBFhJ0PZwsHDtqDgSDjgucvNfGa
	CMOxbjtfrppFGidnLNCJhyqy56PrArCW/RLoEbXGpLp0Uh/wVe3KA=
X-Received: by 2002:a17:907:3cc2:b0:c25:f7db:4bec with SMTP id
 a640c23a62f3a-c2e4ad53be5mr531992466b.18.1791050380759; Sat, 03 Oct 2026
 10:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-9-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-9-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:59:04 +0300
X-Gm-Features: AclHuK9OR6BXTLgAb_C7YKLGSH3aGu_DtrvC657Cue-9gwAbeSx8tKkdBHiKuRM
Message-ID: <CAHp75VcRG-LzWSsg8neDOS7qj0wfp3QMoKkDKEYhoobRbfv+VQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] gpio: mxc: simplify gpio_set_wake_irq() with
 irq_set_irq_wake and assign_bit
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_105943_080818_C3DE8853 
X-CRM114-Status: GOOD (  13.82  )
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

On Sat, Oct 3, 2026 at 3:10=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> To simplify gpio_set_wake_irq():
>  - Replace the enable/disable_irq_wake() if/else branches with a single
>    irq_set_irq_wake() call which handles both directions internally.
>  - Replace the separate set_bit()/clear_bit() calls with assign_bit()
>    which sets or clears the bit based on the enable parameter.

...

> -       if (enable) {
> -               if (port->irq_high && (gpio_idx >=3D 16))
> -                       ret =3D enable_irq_wake(port->irq_high);
> -               else
> -                       ret =3D enable_irq_wake(port->irq);
> -               if (!ret)
> -                       set_bit(gpio_idx, &port->wakeup_pads);
> -       } else {
> -               if (port->irq_high && (gpio_idx >=3D 16))
> -                       ret =3D disable_irq_wake(port->irq_high);
> -               else
> -                       ret =3D disable_irq_wake(port->irq);
> -               if (!ret)
> -                       clear_bit(gpio_idx, &port->wakeup_pads);
> -       }
> +       if (port->irq_high && (gpio_idx >=3D 16))
> +               ret =3D irq_set_irq_wake(port->irq_high, enable);
> +       else
> +               ret =3D irq_set_irq_wake(port->irq, enable);

> +       if (!ret)
> +               assign_bit(gpio_idx, &port->wakeup_pads, enable);
>
>         return ret;

This uses an unusual pattern, we check for the error first.
But also this part should not be ping-ponged over the series, it
should be from the start like this, see my comment against the
respective patch.

>  }

--=20
With Best Regards,
Andy Shevchenko

