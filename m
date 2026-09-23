Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08A1C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqUG2jcYNXCjwbWYuITmLObIVZqMjnboowMRH3b6/zg=; b=ergu4Nesn530EoSTjcSFI5mrFB
	Sb8tKEs6CngUspNTEKifHhEQBa6dDz7up0ElupndEpFkn6QAX4s41fFQQYaC++QOlP7/rv/zovJmV
	Ni8CS4Hj58ilxnHPlbWB1OkLlyDVHzbG1Trr+lz4QqxKu+z5CBexBxWRxPCmjFmFJaLA8AuSBVRMx
	fAP6LTsB4kR+LYG30B+N/HPy+tjj6vIY7zcYA2W1EJnkTO7+J/IQjx87IO969UTa9sN13XaF8QE8T
	Ig6Q8BykbHryFZ9B8Tk30PfvRJZujnMjt0YpIGiLTR+BIL6RWvDVIRjLaIac/CDqdsS2k1c8e/wCg
	fPzhR/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Pwy-00000008sy7-0u7O;
	Wed, 23 Sep 2026 16:36:04 +0000
Received: from mail-qk2-x0f.google.com ([2607:f8b0:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Pwv-00000008sx7-0TPt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:36:02 +0000
Received: by mail-qk2-x0f.google.com with SMTP id d75a77b69052e-532db7db0c6so9478421cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790181359; cv=none;
        d=google.com; s=arc-20260327;
        b=HsE9jXgHOnF8X5bUiPTZw2l7Z9yYy+yDFhCHbV9mQ6ZJToTQra0D/UD8zOrDNnD1u3
         w3H9T643j125CNASk/77zZXKTWbiI39BaZklj/m3URuGFNxfK0fO9wYkPzkKiT+qlmYl
         jk6s1l+VY9Rbg2KisdoE8O1qBr0AikCqz12eqdwLEjSHIU/7V6K4vo4cZLhv5xTz/xWv
         STDQWJoMXQZMPlBIuJwaR9GUm2fEoPz15izGILzfUUa9wMvVgxBk2WxG/WOI0ut6zGph
         /xMYRXkU78nEP92NvTVYL/XafeSWyYCPh/aNGNOttUHNSFv2GSaK1timJKNpS+AJMYVP
         qGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NqUG2jcYNXCjwbWYuITmLObIVZqMjnboowMRH3b6/zg=;
        fh=rV16pOCxn2HDqcaX50nUxWp+c240TwzvDkLH+9wlxO4=;
        b=cpo+bIbLEjfnlloY2iV4tKqHssdaEVSM+krWrC/NULU/VFDEIAqDx7oDoQJYLdCU5i
         coAVCc8mYnp2SC9vS+X0dWXT8/o6+u16w4wv7bZgLtJ7SjLRKt8Bi6xqIpUEcalge6q9
         kzmQH2gezgWSxD+lZUtmTU/8T5rH74e7Fy9J7T13NrTwsqrVSZeb5EyZjl5YIoAhw3mR
         omQyWnFJQBQQB+CN7p2zFIgLRjxSTMqceV/Hh2/9UOQdlGYYTGhdSaK/3cd36+/X2k+g
         h9J6acv4CN3yjX6h/ewm0JZqW4hyFGA24L7RtO1RrKpE0giOSQmaIv0mOAoH5zblBrAr
         PfZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181359; x=1790786159; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NqUG2jcYNXCjwbWYuITmLObIVZqMjnboowMRH3b6/zg=;
        b=oKK0gUyVVg+Rp3hLhfA5tfQfMD7FOYaou4bnfDPbF7Hn77pUjjJcXLP63zBygukzuF
         aVCz97eu9qWkacJpxh5XgmFR54uDmvVariPOUg600GtlG3SZx0NthJqVix5HVDHyeAae
         Acu3nV94W8qMLspLj7kdFm7bjMhRDI4SuP5UgbPtajHPsTv22DodXjgHlOnBT9rHxPQ8
         FuJjLAngkDM7rpJY/75xaIV9jKxZoZxGRvkyFBQe2vZNOSBYje9ZPhISdp81HEP9Y7g7
         lVJpoeYn23JP/7Zay9T+13+qDNIGa+rykiTEh+b4UV78e10kHXfsbPFlTG0L5ZA+Hmy4
         xZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181359; x=1790786159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqUG2jcYNXCjwbWYuITmLObIVZqMjnboowMRH3b6/zg=;
        b=m7GZ6Yvk5JETyzQIWpBQ3/o6zx4Hv8DMgTqY5eUPhHm8b+nJ00youm1q4mxk/UToUq
         3+69kn3bPEp3jbvamhi3fuABdhW1T9V/jZwvRhTVOvJwRtANstQ0bHMLKuTaQV8oJh29
         odKlJYJn2ONgNVNkuKDSTi+SNAXDWF83p32jS9+Qo/EWnlNtA8PuWqBnzHeZ8hcpsaD7
         yXHGQ4dx6yBIkUaTih7aRMUS19cr/kHd1MoQ6Tfgke1SLjOumtTZroO4IejN5jkyF8Ka
         WOmoVKR4vsqyP0Bd4x02y+rxribD+FQyHK14bdYx6VpA8QyAjUOSKpEl4udtDR+n2+ng
         8AaA==
X-Forwarded-Encrypted: i=1; AKwUvBwIfowP6NgG9SiUv9vVFtO0fV34NXAyYjyrtg8cXS/sMbYEfe2dX15nLqAo/qaqwGcX6qjffAc3siMr3xEOwxIi@lists.infradead.org
X-Gm-Message-State: AFuF++kyhpI9PpqfPddeWYFf2QDn11dH5MjZiaXIE++pG3yEvAHNHTjT
	2oJmcMCNSvPSO8U5TT/90IFJ2YnNe41q/DlbQfP+EaSRRnSsc7LBBffcLUPyw7VKZubjx5UvQUy
	Ro69orJzsF591qtVjESy6SBFRYL5QjiU=
X-Gm-Gg: AYBFou2KE62BoFBl6YJg51FTz+jrOeIfX5sqkRHjZbZvH4WF643gfwI057TMhJqA3Mc
	onTVPWTXq2GMbYuw6cNzRRUCa1UPof2CpFnhDj3pme1x/2TOX11cyxcEs+zAjYWq8MNgHLD14nh
	FWJHCZW2YiXjKWnVQyFV49/Dn23yEXcFz76r1wlCeTn0jvwxobMvn8L/LmqBDM0f9jRAWVGEdM6
	oVQu9PacTeTy/OB4uM0Hf3JeGeC5qNnUySuW3f71fRf52rQ70iBEMka3UCj4GfHQDP1Cwx4nWa4
	LyfH3Ulo3URn6R3DSP6taJ07bcofSnqp05kDYYG5xTRj2UWZZ9vq6K/r1F5kVdd7E5tZjd+pmqB
	jpIG6xQNZ4RJlj37kyry4J/+NAfoTFTwLPcBhsG5gtPeR6RN3
X-Received: by 2002:a05:622a:1185:b0:530:3cde:b8b0 with SMTP id
 d75a77b69052e-532eabb20a6mr48549181cf.13.1790181359041; Wed, 23 Sep 2026
 09:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260917235925.44185-1-diegomancera.dev@gmail.com> <bea461d6-4ae9-451d-b6c7-5ac7bc144651@kernel.org>
In-Reply-To: <bea461d6-4ae9-451d-b6c7-5ac7bc144651@kernel.org>
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Date: Wed, 23 Sep 2026 10:35:47 -0600
X-Gm-Features: AcwNN1U34VXKrFuYRGQT-tb2Y_0kpMMPgNyhZZEEZJQIbxLVfy69eVvfPsKtllE
Message-ID: <CALruWrUYnufzE3Lqm4=32_nSJVSVRRR9oeU0fGNhLfr7uyJoaA@mail.gmail.com>
Subject: Re: [PATCH] memory: stm32_omm: fix child clock leak on set_amcr()
 error path
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_093601_168921_E3CEF23A 
X-CRM114-Status: GOOD (  24.24  )
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

Without st,omm-mux, of_property_read_u32() fails and leaves mux at its
initial value of 0, so the "if (mux & CR_MUXEN)" block is skipped and
the child clocks are never enabled in stm32_omm_configure(). The new
check is then false and nothing is disabled on the set_amcr() error
path, so there is nothing to leak and no unbalanced
clk_disable_unprepare().

The cleanup uses exactly the same condition that gated
stm32_omm_toggle_child_clock(dev, true), so this also covers the case
where st,omm-mux is present but CR_MUXEN is not set. The earlier
"goto error" paths are all taken before the clocks are enabled, or
from toggle_child_clock() itself, which already unwinds on failure.

If it helps, I can send a v2 that states this in the commit message.

Best regards,
Diego


On Wed, Sep 23, 2026 at 8:54=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 18/09/2026 01:59, Diego Fernando Mancera Gomez wrote:
> > When the mux is enabled, stm32_omm_configure() enables the two OSPI
> > child clocks via stm32_omm_toggle_child_clock(dev, true); they are mean=
t
> > to stay enabled for the device's lifetime and are disabled again in
> > stm32_omm_remove() and on the devm_of_platform_populate() error path.
> >
> > However, if the subsequent stm32_omm_set_amcr() call fails, the functio=
n
> > jumps to the "error:" label which only calls pm_runtime_put_sync_suspen=
d()
> > before returning, leaving the two child clocks enabled. As this happens
> > during probe, the error is propagated and .remove() is never called, so
> > the clock enable references are leaked. devm_clk_bulk_get() only releas=
es
> > the clock handles on unwind, it does not undo clk_prepare_enable().
> >
> > Disable the child clocks on the set_amcr() error path, mirroring the
> > cleanup already done on the devm_of_platform_populate() failure path.
> >
> > Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com=
>
> > ---
> >  drivers/memory/stm32_omm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
> > index 84eb23c824f5..3599683ab04a 100644
> > --- a/drivers/memory/stm32_omm.c
> > +++ b/drivers/memory/stm32_omm.c
> > @@ -274,6 +274,8 @@ static int stm32_omm_configure(struct device *dev)
> >       writel_relaxed(omm->cr, omm->io_base + OMM_CR);
> >
> >       ret =3D stm32_omm_set_amcr(dev, true);
> > +     if (ret && (mux & CR_MUXEN))
> > +             stm32_omm_toggle_child_clock(dev, false);
>
> How does it work without st,omm-mux?
>
> >
> >  error:
> >       pm_runtime_put_sync_suspend(dev);
>
>
> Best regards,
> Krzysztof

