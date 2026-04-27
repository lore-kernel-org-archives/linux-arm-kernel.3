Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF43FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zTEZOstYQ1Ndkmbxb0gXIziFqMiC9RX7BP1ekAY2J0=; b=ltaNUL96YUlsaEtO5Z1z68X3kf
	D+SGuQOlv0/EhFOdcEOPhl5hJTfDw12aMOSuzlTlaay6pDlXCh2wGFIDlm9ImFqEw2+M/puSjWygi
	dpurAi4YPlMxi3h4DTOzl17M8rYGMbjgb2lwISfTyLRaDt+wVVUp7iiYohg6lvKeie6L4L4t60sjq
	JWSk/nbMBd/NqQDoKnY/1A6s/mLnfYPQo0SavNq73bvxIHKyfWfs4F3Rm3j76LYZfl5u/0krvzNtc
	Us/kShgZpMv20aRPiQZ3vrA4fsPOTnz+asrEoiCC5c+XStykBk0WzRDnkfz/1SZ7tVvCFF1z6/f1u
	N7BGXhbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLmU-0000000Gz4i-1aZP;
	Mon, 27 Apr 2026 13:13:46 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLmS-0000000Gz3n-0XPh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:13:45 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38e8292423fso89968241fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 06:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777295621; cv=none;
        d=google.com; s=arc-20240605;
        b=gFTNoxvAdIuHRR65lxwV4AIDTNgeAWeN9aflO2kxrKLM+hvn+y/27/neM+FVNRzxKa
         UCUrIYWf3fBWOqu3Xw/abiaV+Pu7awg9uVSmr8usYtYZ/br544JUTWAm+nH/54DEX4Q9
         yV2FmUoYcRK3EXneUg546N/TOaUUauJVEnJ4T/E1AZQjrd2cCQlZM5Ld/Ul9QjBaVeY1
         Ar8tYV/3meSGLBbBrFcyTbDPKOhhflevqOtjDi7av7YU9duSw5CQ+/1+HIKxeN+d8Jgb
         msOnhSvv9CYBap51UTrxSCD+RHKSvbHxd54GlWym7AgoNCxVEq2QC1jBv0Hkljkx2y2u
         Rg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4zTEZOstYQ1Ndkmbxb0gXIziFqMiC9RX7BP1ekAY2J0=;
        fh=m2P8iWAv+wDwP+Cz7sbhD4AyzlRfJnXB1WFhWVF/XxQ=;
        b=lvnlBX0kiMLgePiiKIx7xxU7xH3fiY0k4EduAEzjhNtWcFdd0N9RDXSEX0q26Q0eRc
         oDIPe4RN+q8WcvvqV11EUgH4QpA2jaCeWreJ6PiAEMtOAS9YMBPS12ES5J65ZRdE2p8s
         YkTQQy6D5Yif/hPxDdtycCNI3VOi6QRPhd03Ph8yrg67huYXDZCh0bi2qtiYcLOyi47l
         sEGVHZmD3MlLmFq7Gssbdbuy8CClViOteCrdC1se575iY2PTSTYAFobMgnuE2nfcr4/N
         SdJ3W9FK1uIKatU2YinE31ld8MAcE5JhZneWMC9yKVVhfNnbFr+HqhAEoAtNHblc5KFj
         52nQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777295621; x=1777900421; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4zTEZOstYQ1Ndkmbxb0gXIziFqMiC9RX7BP1ekAY2J0=;
        b=Btyf0GAbEuJk51mMJhNIu7RVANkcrpG9HxhyEO/CcN/FVJkkE0EHHeSHCrn1m772hD
         cYk5cgQJ+W1hFE/OUjefM5Huul8OhvD2efTkdBCnSo4IVZfX/i0nTujyGcROuwPngodZ
         1PsB7WlCiJ8jO9ltsGbLssPJOE1JpoioujWxjCWg8/M+jY09zoJlrR2F6FoFIeqodCw4
         3SshxxsByyh85y0xtCnudnpOOsVQRGRzu5Kfa8qPEPU2JxK0R9gMqwL74OH6emDUFsyo
         QCytu9RhAaGyAn/yyRoV/z+XuYh+sVg9kkIVP2qGxYYS4nj14+yFQs5i9WseuNK7i8qy
         Ngug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295621; x=1777900421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zTEZOstYQ1Ndkmbxb0gXIziFqMiC9RX7BP1ekAY2J0=;
        b=C7EFFy3j0mifbzXTorkuEweyDOJlHcATsbA1ZlMsmFrv/KiBHxejxZftM+KJdWmY26
         VrXqLwSjGZufgf8ZAD1TK4l/1VO6lNr7tGdPLTkz6Di2D7FB/JkZ9OONcifrZYt0//K8
         GCblr3yQUAgZhxwfLkTuHxcCa4NVxwcDITrIL1QyCpuJLnt+ZFAnUc5MdBN7mXdERifo
         px5JV3IaIO8H8difUiI71uEoy5wrWvErPg1ov04JVZJ+mK2deJTZKm180/vMXNzTz6qo
         qHg0/FLuBxuKNmEsfB0haTsr24R0bt1+pU52js7RJx7W6TRbfTwu7Uqu5DYQv1L0nUQK
         1aGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OsWXizY1nYbNwveTORoxvrMP0uXvtoPqX3laDK1wtVPMur1Ue5UkoDNmMDpBHX+ibWHN+iKRLUi+QM+18Lr1z@lists.infradead.org
X-Gm-Message-State: AOJu0YxSlThvakjeV4YBbqNkk2TiQQyMnjTXCAk4e3p0wGQBwaR7Bxdo
	Rn/fPUKUMdMM8LNM5UlGGk6xVOYkrtKa+kRGJxI/VyOuLcQyMKLqlplvK9mo9aV2yHzwCBOYhZG
	Kn1VqJph6c08kl/W4eItOggwlvgcOH8km589iwXg65Q==
X-Gm-Gg: AeBDies/2zzDudyFRuYeiDoYvQ7SWnK5jECB6UfzUZQpy9iQSJl9MkTmlnATgQyWOOa
	0r5ueViVeAlVozD6KlC4fzQpfpw2siTPpnDqyLsdgww9n4aNcdlO9CyV/fOsn/Xj8VkF2iRAT7A
	stus8oUOMFtoX5D686HXEKmZWiMto5DWLaiMZBB4waqwS+GmciI+UsSMYRIbDPhvH0Xe/LRgJDt
	jeni3Ig8MVjmDkEKKk9s/a0ARrbyI7VPf4vMcgWHezt98OWpHUfyN4XoFP64ZLTVlAv6V9yHhcZ
	6cM5fA/MvDh8OOS0qr4=
X-Received: by 2002:a05:6512:3193:b0:5a4:1310:473a with SMTP id
 2adb3069b0e04-5a4172ca11dmr12799424e87.10.1777295621120; Mon, 27 Apr 2026
 06:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260417111331.158190-1-ulf.hansson@linaro.org> <CAMuHMdVr-dzRUruue0XEky_6fCt+v3AHp3G+Zv_N7S2_TpC7yg@mail.gmail.com>
In-Reply-To: <CAMuHMdVr-dzRUruue0XEky_6fCt+v3AHp3G+Zv_N7S2_TpC7yg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 Apr 2026 15:13:05 +0200
X-Gm-Features: AVHnY4LaoKv-9zR1nRT5b_JUXnSu76zcBHdPRCqIMP_MLLpQF4ZFC_5gwPwYYIM
Message-ID: <CAPDyKFrZvNsURsK+jmeorDmaN1icXnC8e4tDTk0A42UmtVSTcA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Fix detach procedure for virtual devices
 in genpd
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Marek Vasut <marek.vasut@mailbox.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_061344_201419_2D9340C3 
X-CRM114-Status: GOOD (  32.12  )
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

On Fri, 17 Apr 2026 at 20:36, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Fri, 17 Apr 2026 at 13:13, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > If a device is attached to a PM domain through genpd_dev_pm_attach_by_id(),
> > genpd calls pm_runtime_enable() for the corresponding virtual device that
> > it registers. While this avoids boilerplate code in drivers, there is no
> > corresponding call to pm_runtime_disable() in genpd_dev_pm_detach().
> >
> > This means these virtual devices are typically detached from its genpd,
> > while runtime PM remains enabled for them, which is not how things are
> > designed to work. In worst cases it may lead to critical errors, like a
> > NULL pointer dereference bug in genpd_runtime_suspend(), which was recently
> > reported. For another case, we may end up keeping an unnecessary vote for a
> > performance state for the device.
> >
> > To fix these problems, let's add this missing call to pm_runtime_disable()
> > in genpd_dev_pm_detach().
> >
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Fixes: 3c095f32a92b ("PM / Domains: Add support for multi PM domains per device to genpd")
> > Cc: stable@vger.kernel.org
> > Closes: https://lore.kernel.org/all/CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com/
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Thanks for your patch!
>
> This survived more than 160000 bind/unbind attempts[1] on R-Car M3-W
> and M3-N, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for testing! I have queued the patch for fixes.

>
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -3089,6 +3089,7 @@ static const struct bus_type genpd_bus_type = {
> >  static void genpd_dev_pm_detach(struct device *dev, bool power_off)
> >  {
> >         struct generic_pm_domain *pd;
> > +       bool is_virt_dev;
> >         unsigned int i;
> >         int ret = 0;
> >
> > @@ -3098,6 +3099,13 @@ static void genpd_dev_pm_detach(struct device *dev, bool power_off)
> >
> >         dev_dbg(dev, "removing from PM domain %s\n", pd->name);
> >
> > +       /* Check if the device was created by genpd at attach. */
> > +       is_virt_dev = dev->bus == &genpd_bus_type;
> > +
> > +       /* Disable runtime PM if we enabled it at attach. */
> > +       if (is_virt_dev)
> > +               pm_runtime_disable(dev);
> > +
> >         /* Drop the default performance state */
> >         if (dev_gpd_data(dev)->default_pstate) {
> >                 dev_pm_genpd_set_performance_state(dev, 0);
> > @@ -3123,7 +3131,7 @@ static void genpd_dev_pm_detach(struct device *dev, bool power_off)
>
> Above, out of context, there is an error return.
> Should we call pm_runtime_enable() again, to keep the reference count
> balanced? Or can we just ignore this? It's probably futile anyway.

Good point. I considered it, but I think it's safer to keep runtime PM
disabled, if we encounter an error.

If we end up converting genpd_dev_pm_detach() to return an int instead
of void, then we could revisit this.

>
> >         genpd_queue_power_off_work(pd);
> >
> >         /* Unregister the device if it was created by genpd. */
> > -       if (dev->bus == &genpd_bus_type)
> > +       if (is_virt_dev)
> >                 device_unregister(dev);
> >  }
> >

Kind regards
Uffe

