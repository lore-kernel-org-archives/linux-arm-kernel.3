Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA90C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 18:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y399UwJ+HCYN54RYrd1HkabMCMMPg6Wkn/Pg5u47ll8=; b=MjzynxjcuaTUb4lUzTHHMWQu/h
	o7IgqIi5if+JsHKmolAm4kgXyoyCK6XCB29ws+wFf/vflpnD5ailNpCKDGxUd5Ykq/kxwwJGNCYvU
	iiv4wMNA80F5m6ftORF2F/4KWbEaj0in6fI62eRVN3YoGT/5iq+Vnv4iJQuuh1zHH43KrAluMHgA6
	iCRfSb+Hv9PlM/bHkcup58K2FbBU/IgrkqupiiBEFHVOC+JDSn4AmQvlDliqUxrFakzrcO9VRwW8I
	tQIjtCDvjpyeO+9hcy2kirmNDdA51LS0UMEvZe/E3jqOOBdvnQ8N5z5MmCmmx+1dWU9Z27w/FSPoH
	UocKx3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7ev-0000000C44Q-1fuY;
	Thu, 20 Aug 2026 18:38:37 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7es-0000000C43U-0TEY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 18:38:35 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so326201a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 11:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787251111; cv=none;
        d=google.com; s=arc-20260327;
        b=fj68bRfN+B0ezsnd9yj3GSpru5cyt9UYhQGEAyS4iBr2YaPxF2Y5aResTrnCD1l8e+
         X2F+olDNaUOWzHIcTxl4l/svDssVHAG1prhCuPDMA0BywNeMw9iHvvh5JAbSQUVUSSc3
         U3XDxdeYX1SICwhdf0lK6CxENo8aICwUKm9R3nx//EaXqOHWpWSLqVA3ghJXNpPC9RZ1
         w3dc06dHWKWlNsKBaNIkXbkFGyelzW7PrLBHZxUKt0zPdyCMrtOGne1YConIvNtVCtbD
         7p7nVe9Hy7M0aZKT0wSsx+Lm3s1et33EQ6NKr2QIdG5F+icoIUjizUEMk0CBVrUTWUaD
         9NOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y399UwJ+HCYN54RYrd1HkabMCMMPg6Wkn/Pg5u47ll8=;
        fh=qwdAshIdZTaaW+qX0WR0dhENqZpszFWKR4rYkamNmB8=;
        b=VJGFWXlbUgFyiilWQvrTlAroVzeu0YEJflcmmjj+IHm5CYMOL9+EUzeHHOinC/dmhP
         Kv8+PIfL7FPmVDkprIx7zeYYRVcH6iLea36iFRTIhbZT2+F8rb8k9KpTEkt0QbIBb2YR
         luRGP6cKBBiFLbQqpVaUEyZwzzjeOObOVO1LUgxJNu8qlHHjQrS31WbTxcTD8X4Mk0Ek
         UAYm08iZb59+uD7WeJglZY0mJFYvZRfyQxYsIK7L6PWOAVXnQCLp/dbHGPhgt7b01zli
         eJAqERJ+RTLu3OFoUwfIRrhpWxe8wPiEHCHFY5CLYCWNbT/+a3RUjGtlRHuE1nBEf4XA
         Y6Yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251111; x=1787855911; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y399UwJ+HCYN54RYrd1HkabMCMMPg6Wkn/Pg5u47ll8=;
        b=j2EJU2dRxtrGfoNL3foCae4ojLXgECjJcUZUT5YXa20jKuR8ZyJO5nJ/UroLHSXi9p
         8YiR3ZkHTCNqEetQoNsYkQ575fWHBhMHgNLu0uyxGVAEvscWYXuo9/WWbPuNfWmXYQO1
         noREPHG2Sp8/+orgsm96cRzZdXug30p7wXj+zV2qnVTStub2VoD8bSr6F0FKfLqAmy9+
         boID4hBODRhYMa1942YB01peZygBrJgo+QKG4N69RF59Rql0hDesW3PMmZ5DLNGjwLvs
         9Hb2GxriGMHrswvgndf4M0+FJCiH6NetZubGSg5J2YHSEqdMowbWRLGDor+/QfMtPOkv
         ogsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251111; x=1787855911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y399UwJ+HCYN54RYrd1HkabMCMMPg6Wkn/Pg5u47ll8=;
        b=fcep3xQIA/5NHQsDZkqTxO6/2CYr32XUbMdj/RYcqZf8zG2KUK9kIRwhi0CbsQo0iZ
         FQuKvkSlrkFRty1tSXBlC6o6VXFftVYf4XqZ9BEs6Ac9WfxygsSIbbZlTK3Ca1d9P95X
         thoPqqEEJEroygqsbZ9FJOdIlHt1lQrCJH20PpC+x8cKxkuQjvgLJiYQoVy3tCh3fMKg
         WNSbnIRBb5Y/AjhbFpGa/rroALnW3YuCaha3axUEypWiREjHoOSeBc0tAbEucJSjXkRc
         ZS86lrfU5hM3nOvErIGjSfT49rhmyZCjeHWpnrjU7PpR4ZpvNsW0HhBjRNn1zieICzpL
         6kJg==
X-Forwarded-Encrypted: i=1; AHgh+RpE65T7WM+j42c3rZQEpR75k4PG9nAVxO3FWgITBogQODbpjzXzJlgLLlfBOhLnPA6+1ZXjkwkuW3LtwJ/Pez1R@lists.infradead.org
X-Gm-Message-State: AFuF++ltHRGyy/S8RkV+q0FQa17Sl5ysXMuY3VKyPkCrQVK+ZKk5Mwvb
	mQip0Q06IrZrr1pONR+1O7pD7qUT6tdLfBBkzeN34Uv730pitb85ASmPV7y1ZdMW3279xbbLToz
	06VYiiDJsAW4O/MTclhSWQ4KpE8qgWwA=
X-Gm-Gg: AR+sD10kaV9Lfqo+1erfkaVX3emOtIOya26QxS7qTSJElCQ5GUz7qW1olrsGq32o33t
	tHE3HH8KPy1w22Q+jMakNqwNeJVwFZdLytXuR3fRZ+PE3yU9LHqPEBx4oUmcYDD7reclM/17b6I
	Ww8wDg4I62Caez3B2PQWn6zIfC4BmXxPI55L1Uz07gH/PnEs+HOpRqgNstuoJVqrOxybHLoPH0M
	OEkeFaDPaS0ip3VATFIerED9rlUIJms7NyVbs8fko7D6iI0LFwDfTBrK0w2Q0riMhlqJry6l2Fi
	oq8VVxtBFjpj8wdaKd3S9vYtGDCPrDpD+JbwNGikYD394HB2ItPk0N4ivF0J7Fa+3K5+jZ6YzCX
	Pyf8udXh0X7IhpBEZyE70SazgjVULdDzYD2D+TJq3FLUzjN9lSTRo0bLjfwHpEu1n4haHnsYwfr
	2k/eMV3QzQx9gkUwboTo4s3U6xEZTnYKz31kel4VqVzrnZGAeTMz4WgXY=
X-Received: by 2002:a05:6402:190a:b0:698:663d:d7bd with SMTP id
 4fb4d7f45d1cf-6a42f1df94emr504720a12.11.1787251111224; Thu, 20 Aug 2026
 11:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260723050606.283453-1-rosenp@gmail.com> <aoYJGXfDciTLTZx4@lizhi-Precision-Tower-5810>
In-Reply-To: <aoYJGXfDciTLTZx4@lizhi-Precision-Tower-5810>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 20 Aug 2026 11:38:19 -0700
X-Gm-Features: AcwNN1WadOkdQETjHY5aKJw3lWDWX0-S7dat9vSR7J9yhC3maiVC2GsEIfMKG3c
Message-ID: <CAKxU2N8SvNqQB6g-esc-+KpO0sNKHAB7EiE9FWbg7Dv41=5MGQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: at_hdmac: ioremap and get irq early
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, 
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_113834_172157_DFBF5B72 
X-CRM114-Status: GOOD (  20.23  )
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

On Wed, Aug 19, 2026 at 12:50=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Jul 22, 2026 at 10:06:06PM -0700, Rosen Penev wrote:
> > The functions can return -EPROBE_DEFER. Call them before anything else
> > to avoid doing extra work.
>
> just move before one devm_kalloc(), I have not seen much beanfit for it.
Not sure I follow. devm_platform_ioremap_resource() and
platform_get_irq() just need a platform_device pointer.
>
> Frank
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/at_hdmac.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> > index e5b30a57c477..2f6f5877fc3c 100644
> > --- a/drivers/dma/at_hdmac.c
> > +++ b/drivers/dma/at_hdmac.c
> > @@ -1943,11 +1943,20 @@ static void at_dma_off(struct at_dma *atdma)
> >  static int __init at_dma_probe(struct platform_device *pdev)
> >  {
> >       struct at_dma           *atdma;
> > +     void __iomem            *regs;
> >       int                     irq;
> >       int                     err;
> >       int                     i;
> >       const struct at_dma_platform_data *plat_dat;
> >
> > +     regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(regs))
> > +             return PTR_ERR(regs);
> > +
> > +     irq =3D platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return irq;
> > +
> >       /* setup platform data for each SoC */
> >       dma_cap_set(DMA_MEMCPY, at91sam9rl_config.cap_mask);
> >       dma_cap_set(DMA_INTERLEAVE, at91sam9g45_config.cap_mask);
> > @@ -1968,13 +1977,7 @@ static int __init at_dma_probe(struct platform_d=
evice *pdev)
> >       if (!atdma)
> >               return -ENOMEM;
> >
> > -     atdma->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > -     if (IS_ERR(atdma->regs))
> > -             return PTR_ERR(atdma->regs);
> > -
> > -     irq =3D platform_get_irq(pdev, 0);
> > -     if (irq < 0)
> > -             return irq;
> > +     atdma->regs =3D regs;
> >
> >       /* discover transaction capabilities */
> >       atdma->dma_device.cap_mask =3D plat_dat->cap_mask;
> > --
> > 2.55.0
> >

