Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3251BC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5WlHwA8oA2RvyaPhBL6aXKI/6RszyoEP/Z/bWJtOFU=; b=If+1kH50fTG7w/ynj3Irjot1NT
	U47FExzVEhwLHqF4CedC4wGvcHre4sVLF0AiyqWY2S/02PdXfk42YmJi5rcQMdnGNLDe3stqjxdgn
	hAiiIe0pI2i3yNAMBwW9MKN8XZo+FWQCvMB5WGNRqZJYp9iIxuVw8HYUwX0S7OIpchaOLuYmOZoI7
	Ctv2ji8IlQtE1ZGINqkoSPhe91IXkbi8WWiPMSlm0SeIDTeadAnDJsrAoex3J91Ji57N73hoT1R4H
	BjGxY3oUN3vReqxuRub1DLlaN4DPHqvkd3DISKmxZFMUYotxAskLSe6pnBJToCczbd28oKO09xGu7
	90Vh7ZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwD4-000000014rb-3xVi;
	Sun, 26 Jul 2026 10:35:54 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwD3-000000014rF-00bj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 10:35:54 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so1028383a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 03:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785062152; x=1785666952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5WlHwA8oA2RvyaPhBL6aXKI/6RszyoEP/Z/bWJtOFU=;
        b=lKlrrb9Ug3Vm7VDLAB/9M5Kj0K5EDSH3ZAWUzR0JYen9U0AMAdXPDwGKUK5nGwwXdO
         KmFkAhbOLOffn08+r5dPVE/9FUmM5M8Jbp84ycCUoCVL9VYSSZSBC6bK0zTuAEMD5Vyf
         1l9aWICbxao7+eo3gXow0GOPycc6iKTFLmJC1ah+Z/POL7a/EOBTjPEGAu0fZmIxSNeC
         Se7YK/bdKiKaEYdJiiPB16eJXmEVGqaO87g38bqlETTHZtZRCMVcIytlTTmH7qXR07/c
         aOYU6mbVZdTHpJWuRTNP0mfpBf0s+jaYOIQXqEfi1TtAzaMSe8ysb0hY1renLnetuMNY
         eItQ==
X-Forwarded-Encrypted: i=1; AHgh+Rof/at3MCFFloSk5QS9FaeJIJ+tjO385s9XE6xF7ipj7QnvRM4GSKkyEPhxmjWXDvfUYeVD628f3wKLsb2kAbv7@lists.infradead.org
X-Gm-Message-State: AOJu0YwRIq36dGLrxVlEQDouD4CLbZODcsjQfcdmCR852py373isjTiQ
	q5nqRbjvhGuX8akoN5AiU1YEssM7bovJvLiVquU0v/oTle6taKDAFgJfJuQdur3Jxg==
X-Gm-Gg: AR+sD11AVVHgaoxnc7wxwyIJWMZMwxrrJ5cDR4QdJ3wpewO0lFsb0Pj6EcBjCzqjh6+
	9c0EevdCjAg9iJgnJXyQ6+f0t9BPYAI2+KlRBefr5fwH5ZPU8WihosN83rymkIcDqYIs8mdCOop
	Q8TEBHPRPW5Jx5AN4jY4EBd4Fcpll8DlcYualjgzJ/An7/C8cFrQiwlkWCi3ayYg8fQ12DfNKFW
	vF4gKAPbPj6yXngXv2bJMGdxZ+D3cJHE7iG5Rob6XpRiVY9j9oOBGBlewI2c2UcTTLDfke7+ezA
	CSt37utRkrOy5wNnkH4V1KvnJD6nuTzIk69sofkVZKqPKMY/iG96dHMjSm1+y7SgDGuP7pvJ7iW
	PMv+gmquTjdvBoBwsPfU4/7DBrO9uv74IvOB34pm08/mnn4YXqqfWy4LK9DZdEuEjuz3BUdmzCK
	kfRzMtZnF/PHQyEelXHvRF5XxFPRqNZnDinHXcbahy/vR4/h4X9BDx+8HbivzFQ13AsmmhosvS
X-Received: by 2002:a05:6830:439e:b0:7e6:eb9c:3781 with SMTP id 46e09a7af769-7ee78c5666bmr4615664a34.12.1785062151723;
        Sun, 26 Jul 2026 03:35:51 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29e0f1a5sm9791020a34.11.2026.07.26.03.35.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 03:35:51 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6aae36ea5c4so969015eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 03:35:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqm2WqolbqrGjaXpukDuMxjERc962npDoVAKHYx9YPBeCqfmFnofb0gk1x+OdbUwAxjFOmQuOmFRsLhaOk3J0JW@lists.infradead.org
X-Received: by 2002:a05:6820:1c96:b0:6a1:4347:8ff1 with SMTP id
 006d021491bc7-6aaff9a5acemr3595412eaf.38.1785062150696; Sun, 26 Jul 2026
 03:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-3-fourdollars@debian.org> <862b86bb-6c7d-487c-b790-fa5d5a5217b2@sirena.org.uk>
In-Reply-To: <862b86bb-6c7d-487c-b790-fa5d5a5217b2@sirena.org.uk>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Sun, 26 Jul 2026 18:35:38 +0800
X-Gmail-Original-Message-ID: <CAAT15mNJRmkJ4fi4gymMXHCMQ+0=fNOV+HLw1T0r3VpqeGT9OA@mail.gmail.com>
X-Gm-Features: AUfX_mw7ir5Ox5ZC24FajjkO2Ca-90Uoe83WqcIQY__elW4XN7H4XnpkwcBwMeo
Message-ID: <CAAT15mNJRmkJ4fi4gymMXHCMQ+0=fNOV+HLw1T0r3VpqeGT9OA@mail.gmail.com>
Subject: Re: [PATCH v16 2/7] spi: pxa2xx: introduce suspended flag for
 interrupt synchronization
To: Mark Brown <broonie@debian.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_033553_080994_550EF163 
X-CRM114-Status: GOOD (  32.76  )
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

Hi Mark,

Thanks for the sharp observation and the suggestion!

On Tue, Jul 21, 2026 at 1:18=E2=80=AFAM Mark Brown <broonie@debian.org> wro=
te:
>
> On Tue, Jul 21, 2026 at 12:21:11AM +0800, Shih-Yuan Lee wrote:
> > When a shared interrupt line is used, the interrupt handler ssp_int()
> > can be triggered by other devices sharing the line. The handler must
> > ensure it does not access the SSP controller registers via MMIO when
> > the device is powered down or when its clock is gated; otherwise, it
> > will cause PCIe Completion Timeouts and system hangs.
>
> > Currently, ssp_int() guards MMIO access using:
> >     if (pm_runtime_suspended(drv_data->ssp->dev)) return IRQ_NONE;
>
> ...
>
> > Introduce a custom 'suspended' boolean flag in struct driver_data to
> > track the device's suspended state across all PM transitions. Check
> > both 'drv_data->suspended' and '!drv_data->clk_enabled' in ssp_int()
> > to return IRQ_NONE immediately before any MMIO access is attempted.
>
> >  static void pxa2xx_spi_clk_disable(struct driver_data *drv_data)
> >  {
> >       if (drv_data->clk_enabled) {
> > -             clk_disable_unprepare(drv_data->ssp->clk);
> >               drv_data->clk_enabled =3D false;
> > +             clk_disable_unprepare(drv_data->ssp->clk);
> >       }
> >  }
>
> It's probably better to avoid extra changes like this, it makes the
> patch bigger and a bit harder to review.
Agreed. I have dropped the unnecessary diff churn from pxa2xx_spi_clk_disab=
le().
>
> > @@ -743,12 +743,12 @@ static irqreturn_t ssp_int(int irq, void *dev_id)
> >       u32 status;
> >
> >       /*
> > -      * The IRQ might be shared with other peripherals so we must firs=
t
> > -      * check that are we RPM suspended or not. If we are we assume th=
at
> > -      * the IRQ was not for us (we shouldn't be RPM suspended when the
> > -      * interrupt is enabled).
> > +      * The IRQ might be shared with other peripherals or trigger duri=
ng
> > +      * power state transitions. First check if device is suspended or=
 if
> > +      * clock is disabled; if so, return IRQ_NONE immediately to avoid
> > +      * unclocked MMIO reads.
> >        */
> > -     if (pm_runtime_suspended(drv_data->ssp->dev))
> > +     if (drv_data->suspended || !drv_data->clk_enabled)
> >               return IRQ_NONE;
> >
> >       /*
>
> The local flags *must* be racy - I'm not seeing any locking which
> protects them, nor anything that stops something else dropping a runtime
> PM reference and powering things down after we checked here.  There's a
> helper in the power management code pm_runtime_get_if_active() which I
> think is what you want here, it'll tell you if the device is runtime
> suspended and if the device is active it'll ensure nothing else drops
> the last reference while we're running.
That makes total sense. Using pm_runtime_get_if_active() is indeed
much cleaner, atomic, and eliminates the potential race condition
where another CPU drops the runtime PM reference while ssp_int() is
running. It also avoids adding an ad-hoc suspended boolean flag to
struct driver_data.

I will update ssp_int() in the next version to use pm_runtime_get_if_active=
():

    static irqreturn_t ssp_int(int irq, void *dev_id)
    {
        struct driver_data *drv_data =3D dev_id;
        struct device *dev =3D &drv_data->pdev->dev;
        u32 sccr1_reg;
        u32 mask =3D drv_data->mask_sr;
        u32 status;

        /*
         * Ensure the device is active and acquire a PM runtime reference s=
o
         * PM runtime cannot power down the device or gate the clock while
         * ssp_int() is running.
         */
        if (pm_runtime_get_if_active(dev) <=3D 0)
            return IRQ_NONE;

        ...

        pm_runtime_put_autosuspend(dev);
        return IRQ_HANDLED;
    }

Thanks,
Shih-Yuan

