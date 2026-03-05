Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB3AEEF31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKI4RkHGLNgLhbmhZhuWJE4qOdTx2GaVOZl5vUzK2NU=; b=WfqH8psquMnHPH+L4sfWKqTTku
	/Jolk2G54f/KLGwuwNYP644zamCg0MPVlI5zSMa/QfLZRtFYdLrFtJUNdp7JBx2vSgmw2z4SgN85T
	/7mJHWkKkHU5ET5n8yWL7nymaGu0oB/O0n/N3174cjDBXlSVGvz/2RF6dj8gU53OfMXeosznV+pld
	2Guu9qspACpJ62Pz1leKEMbXrejytscz2GwdOhXCg9aUT5/Abt8BOjYbet7fujXkC4DGxP9EkzutX
	uZDyIp2+3CCIk+sAjXHKs3nD4jPpjy0qoR5k+U/2NHYjNLVbe6QUTH2vQfBVLyu41P8t/wsD/zVBl
	Vwl4TMUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4QT-00000001F5d-1qwW;
	Thu, 05 Mar 2026 08:51:21 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4QR-00000001F5I-0ojx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:51:20 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-65f92a597a1so11091466a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 00:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772700677; cv=none;
        d=google.com; s=arc-20240605;
        b=YNmirrCyckbrPe8LJQaIVRvkIVzgRoS+cE/9ThSPpy7shq+okwekyeBb1Cq8pKdUEW
         huZtOCFHFfvayLTtd0pHt4ucBP7xgWacvPqWlssUdCFtG896PnLwESKh5cF18/6vb8zG
         Lh2fAlueHDiK5vS844sWgYzzI9szM1+w1EMFZP8mzkQieQeoLuXu49muWr6QpEZP27Kv
         UNEtCUAgwQMtGbv+1QNA3Y38vkD89ZZ4EyUsV3LMEI0opdHsfnFf1wzscGOIr2021/86
         pP1PxXRufG44SmtmhgTmQRQD9/AfwI14i+Hj7L1bQ5dEUdYZgb2+VNrfoNl0sKFcxAjn
         bNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YKI4RkHGLNgLhbmhZhuWJE4qOdTx2GaVOZl5vUzK2NU=;
        fh=tgT259XB1uGeZmqoerm4l+btwqdVu83NNfqleu9S2BE=;
        b=CXClDRrudXFeG8gnbecn4Wjq4Ci4kbc+EFEvge8OH0nNwI4uiPqsMyIlVLCr1KKYvB
         N7up62X9JSSNUh4f1cXU4+1TwJIABxwRlw0q85LQTmdVscmOoBgDLcrUPIhkvFpXzLYl
         NPt1//38M+vpU8H5NwdL+D+7ShSu8w12dsD3CFTFVSSQAR36q0hodIE6CL62CPeaza07
         eIgdZ0yfumHlbmEyyuXMJR2QYepSZyV10REJxvVQZouTicVGVc8xdmO0pRNO71QKWvSa
         jXITjE+Z27whtjX6etgqTaxGgmfyBvUWBYAb8wlCBCr89RZKJoTr44JlnldKxWHNSRBQ
         CzLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772700677; x=1773305477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKI4RkHGLNgLhbmhZhuWJE4qOdTx2GaVOZl5vUzK2NU=;
        b=nJcipKi4bCtfp9yfrF+nIN6gh1FJueX3muAhV8pPiqrniq1+qDsBO0EnUdshghW5kH
         EJdKRJCvP2aT32GVKKLi55DfwhjHvIOO52X+kicFTCBZivm7IPKPayeAnOrSkKsRqMRF
         2zHQ5OIGEjp6aPO61nGYoq4c6SilKX7ylDHUGtrgyXjy+DE1aJMQL4Eb4mAQTQk5lXpL
         3U2JUQC5IZ5XQLGeecuscMYySNPwBIjTeqL3zt5m2l8eoNsJPh0IULRKctSDoP5iXMf6
         CboQgHvcMWsDvP+MJ6qHXt39VMWA4DEvnadeJQkMspD81+bRTfZN9T+5FJYhwPKl9kDI
         VQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700677; x=1773305477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YKI4RkHGLNgLhbmhZhuWJE4qOdTx2GaVOZl5vUzK2NU=;
        b=fmIvFUJJ3C/kiCg8eOskVIM7u17+3GdaRbYRaq3wrJPkrZb2kl+b8qaO+mj58IiraQ
         ya7U6aDEE9EOrRqLlvXUPJZcAH35EwBg/pbQKJL+0m9puMuBmeN/Xf5Z7/Y0tmQjLWYE
         2LYwKastri6epTg33nyTSl5ivrRcPyh25pY4l9D1PkiI7WOCMY4tgSKEKspkdD9p7C6Q
         Ep4f+WSDIR7CZujb39VgFtmPpmnm6lZjaKyS7EbzAhLwl8xUqm2iUz3/MerDus7jUKfN
         fLk3ALpaTsrijymHtK7erTth65xAdrvdK5EUJV2EFcRtx9s/7/DtIsNk12AcWAA7heiY
         21jw==
X-Forwarded-Encrypted: i=1; AJvYcCVUFZI3t+0xZLqbUE8Tfde2Fd+DLvxaWMooCU4lC3u9L9VY4eMbtx55iitOcZvmYO5OziWUzTU1E18I7MPc0tlm@lists.infradead.org
X-Gm-Message-State: AOJu0YxKEByRRkTzJgascjRvFtSTTP6V1ND1mSsJEA0owkilduXHouBz
	MidzHXmbOpv2vXFLPBDInwzFQIuTb2L0mcue2jAG6luGJzWVEi9HTLOrGVJnERVlfFj55xTlbrJ
	ltBto6gJaeWwsQ03NnmjnbMPiPyGGnhM=
X-Gm-Gg: ATEYQzxZlWc1hgC0Eb/bLdWRqyb/aD7qVZC6PKFaHb2WSSrcQe2dvngxzuuQ1hq4gkv
	Tnqt8Y2LbAdjTBKEMyzJrU907P20pXzLVXPewRrcBHf+G50UVH+lwkkgnSFjOrN1MgQAvhxmpkS
	sM40p0xfyFBV0CavDDulFCQ4/7i80Tx2gxmRMxdO1M4A0qUDVQtI4n8X2BiAvUWt3ViT11G7wew
	1B+cMcVQZFHAiQhHaBma4ocDJ6feyagdSMKsABgiR8Xi0Dk/397ldBc6mGh6Wyz4KlVyHwr8sjf
	z/OW7opQCHEDBk11kfH1DZjujPxxRUbQbRsuAIsv7vIUZEYHwxvDQEINTxiqqg+W0M5VR3E3V6v
	hxSfhuQ==
X-Received: by 2002:a17:907:980e:b0:b8f:848b:4456 with SMTP id
 a640c23a62f3a-b93f116d717mr337178066b.13.1772700676451; Thu, 05 Mar 2026
 00:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20260304225329.24510-1-rosenp@gmail.com> <871phyfz34.fsf@BLaptop.bootlin.com>
In-Reply-To: <871phyfz34.fsf@BLaptop.bootlin.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 5 Mar 2026 00:51:05 -0800
X-Gm-Features: AaiRm51AlcjYnmTJJFe0AVn7Vbz0L85O6On2RH6QhXadGX9VfwLzhLl2d7mR28Q
Message-ID: <CAKxU2N9y_PTTojzUHAExwD_-Mss9uNJa-GnN9C4rfy+M3aschA@mail.gmail.com>
Subject: Re: [PATCH] rtc: armada38x: zalloc + calloc to single allocation
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: linux-rtc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_005119_251237_DCBF8715 
X-CRM114-Status: GOOD (  17.75  )
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

On Thu, Mar 5, 2026 at 12:41=E2=80=AFAM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> Rosen Penev <rosenp@gmail.com> writes:
>
> > Use a flexible array member to simplify allocation.
> >
>
> I must admit that I didn't know struct_size(), it is a nice helper!
There's kzalloc_flex that's even nicer. Has no devm version yet.
>
> Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>
> Thanks,
>
> Gregory
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/rtc/rtc-armada38x.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
> > index 713fa0d077cd..245290ae1a8d 100644
> > --- a/drivers/rtc/rtc-armada38x.c
> > +++ b/drivers/rtc/rtc-armada38x.c
> > @@ -72,8 +72,8 @@ struct armada38x_rtc {
> >       spinlock_t          lock;
> >       int                 irq;
> >       bool                initialized;
> > -     struct value_to_freq *val_to_freq;
> >       const struct armada38x_rtc_data *data;
> > +     struct value_to_freq val_to_freq[];
> >  };
> >
> >  #define ALARM1       0
> > @@ -490,18 +490,13 @@ static __init int armada38x_rtc_probe(struct plat=
form_device *pdev)
> >  {
> >       struct armada38x_rtc *rtc;
> >
> > -     rtc =3D devm_kzalloc(&pdev->dev, sizeof(struct armada38x_rtc),
> > +     rtc =3D devm_kzalloc(&pdev->dev, struct_size(rtc, val_to_freq, SA=
MPLE_NR),
> >                           GFP_KERNEL);
> >       if (!rtc)
> >               return -ENOMEM;
> >
> >       rtc->data =3D of_device_get_match_data(&pdev->dev);
> >
> > -     rtc->val_to_freq =3D devm_kcalloc(&pdev->dev, SAMPLE_NR,
> > -                             sizeof(struct value_to_freq), GFP_KERNEL)=
;
> > -     if (!rtc->val_to_freq)
> > -             return -ENOMEM;
> > -
> >       spin_lock_init(&rtc->lock);
> >
> >       rtc->regs =3D devm_platform_ioremap_resource_byname(pdev, "rtc");
> > --
> > 2.53.0
> >
>
> --
> Gr=C3=A9gory CLEMENT, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

