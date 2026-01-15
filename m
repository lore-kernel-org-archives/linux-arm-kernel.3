Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B54D3CCAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 06:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDL2VEo1K40CbIHkD6w0yhETsm2brUV92i2ZA2PzHJw=; b=SDvrMcgB4WM1EWBuagubZhVkuq
	avviGI2WtVESulZvWuIxUADgR0j9HYVAy/F1MuMGUwvxe8z2daSLH5iOs14UdLHjncLX2ABG468fX
	Bp4op4MtkxwqPzYgoyOlVhxtV+4gGHcf81rvTPamHnLVEQS9lqFARizfteRNAvpfn1x50kb6h2I7y
	1uk6xKxtzOn47/KxJozEc8taMzHtFK9LyALPXET7W2E0DWpmqztDhsi4YiWXNl9dcYLX00nzkg2HB
	zvEoJUjFksG1/Wg2K9QoSKbJEyUX1d4x2PFcjS6Y+X4REIE51KFfHyM1uAoi2vOjnknEE8vmsmCbZ
	CABTn0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGxD-0000000BrTo-3kGa;
	Thu, 15 Jan 2026 06:35:35 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGxB-0000000BrTT-1HPz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 06:35:34 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-646b8d2431dso432728d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 22:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768458932; x=1769063732; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sDL2VEo1K40CbIHkD6w0yhETsm2brUV92i2ZA2PzHJw=;
        b=A+08cVoFZk9vUcH+ET/LTL2F7bE+e1+oY713bb3KDBvJoB5IzoWqibzlkXKqJosLY9
         DEEwDhr6ITZdrFqW+3DOKBKolGLw6dTOqUgscHwP28Uq52aGakMyWxJZ7IRZiTqG/8F5
         7vITq8wUbs+ZkjGGMVcAjLDaUXZ//tp29zeQplMvY4UCUkV7rcRgMrnX3Hy1bv123Ujb
         4IlVD9j4/tjmZlqLlpHNAwWblrfxtAGLUskuLxcAMDHCtKZaPBW0OE50//scPoEVf15H
         Vbdn647JZvFwPnmR4nfryW/UvMp5EdNRRyqXdA3FjkndVge4ePdoJZlibQiuxXSsoihl
         EJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768458932; x=1769063732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDL2VEo1K40CbIHkD6w0yhETsm2brUV92i2ZA2PzHJw=;
        b=js63LLG1qODvJWjOJPkpv8fvkAytHg/6uiGCerVMHcU2+bn0pFabNrcaR3T+eoH3kl
         atBAmEY8JwNZVrqa9botqHXJ/x/V7xYIhgMyJTrKwHozXke+Jd3Ut8fuZTxznXDWzlI2
         QMhHFdIVHCI3tl/os+UXcU2Bzn/CMlAvbEk6n+v5WD6NIGlNrSOYo917TmXv3Dx22urE
         DRONzBP7XMKNf1405S2cdf7WZuvZ1TiTZIhban6+GyR6J0XldNc4wx8TFn7B2VF862vf
         mahxEUCBwuYWfJYztZzN+hC9krYQ3Wfb0f2bXpjoRIMzF6I+9lffaxbgoAMZ9vWLcjlr
         UQaA==
X-Forwarded-Encrypted: i=1; AJvYcCVoItflmbO2w8x5QujZ4jYXKRU+k7ak/u4Aud0MY2RCNwm+w8TVv3W0owglvM5nEm8KfS3NJSApeCnPlIQ1zjd5@lists.infradead.org
X-Gm-Message-State: AOJu0YwOQgUo8/615kKr2GktaRg1ytKyE7ZMXQkriinJBjXsvNrdHIxu
	ferKDIclFKnph/TZU8tpvnlehhx+WqtFxhIazzoyeT5gD5/n+J6l2vhpIDGYPU1CV0R6Zy8bfw3
	1LxlS17wFOAsbsqMJZHHKfYHy7RZ1Gt8=
X-Gm-Gg: AY/fxX67X70kqFv6ebdF5rdQArMED8QjDwBXoo28WibZ5pYjP7ImFXaAMsOBwSy+AtI
	S0eEO2Wd1ZDggIpcyixmAJ1SBxwvlstpiHhDbb5oAVghX7p2pDe9tPZVUfcgxNFKAJ5lfv0hhin
	ZD+BvR0WazAGcnxCU3Ce45HD4D2x226tBW8QFj6fsETDjK4qjHGwG/E3xI4hZUSVOVdM1BST1bj
	L+2tnaMYVT8rIizcFr7o30R5MdN55MRm0fCv74juS4h7nxk+DlCHW9YIY4i6kd49JgF9ksX
X-Received: by 2002:a05:690e:1883:b0:644:45ca:7bfd with SMTP id
 956f58d0204a3-64901aaebb3mr3938691d50.36.1768458931647; Wed, 14 Jan 2026
 22:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20260109-b4-macsmc-power-v2-0-93818f1e7d62@gmail.com>
 <20260109-b4-macsmc-power-v2-1-93818f1e7d62@gmail.com> <aWbq2pgTJlOWC07w@venus>
In-Reply-To: <aWbq2pgTJlOWC07w@venus>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 15 Jan 2026 17:35:20 +1100
X-Gm-Features: AZwV_Qj589lgXQNeagebL0kthy66zD-IRnj2VDG_vPH0jpjOKd17rg1RUVEIdJs
Message-ID: <CANpmGNvBvasft9U3_=G2=B9VF1Q0P7aG8QsdLF7H+NJH9oTfKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] power: supply: Add macsmc-power driver for Apple Silicon
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_223533_381641_E5B9A205 
X-CRM114-Status: GOOD (  35.45  )
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

Hi Sebastian,

Thanks for the review.

On Wed, Jan 14, 2026 at 1:10 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
> > +     case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
> > +             if (power->has_chte)
> > +                     return apple_smc_write_u32(power->smc, SMC_KEY(CHTE), 1);
> > +             else if (power->has_ch0c)
> > +                     return apple_smc_write_u8(power->smc, SMC_KEY(CH0C), 1);
> > +             else
> > +                     return -EOPNOTSUPP;
> > +     break;
>
> Indentation?

Fixed.

> > +     case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
> > +             if (!power->has_ch0i)
> > +                     return -EOPNOTSUPP;
> > +     return apple_smc_write_u8(power->smc, SMC_KEY(CH0I), 1);
>
> Indentation?

Fixed.

> > +     case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
> > +             /* Calculate total max design voltage from per-cell nominal voltage */
>
> Using the nominal voltage here doesn't make much sense. As the
> comment above mentions not having nominal voltage data for the
> battery, I suppose the comment is wrong and this uses the per-cell
> **maximum** voltage?

You are correct. I've checked again just to confirm the comment is
definitely incorrect, and not the code, and the key reports ~4.4V.
Updated now to reflect that it is using the per-cell maximum voltage,
I think I got my words mixed up when writing the comment.

> > +     case POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD:
> > +             /*
> > +              * Read-only reflection of end threshold logic.
> > +              * Allowed to be written to avoid userspace confusion, but ignored.
> > +              */
> > +             return 0;
>
> I think it's better to fix userspace and expose the value read-only.
> In any case this creates an ABI and requires proper documentation in
> Documentation/ABI/testing/sysfs-class-power. My suggestion would be
> to drop this for now and handle it in a separate patchset, so that
> ABI discussion don't block the remaining driver.

Agreed. I have dropped the threshold properties for now to avoid ABI churn.

> > +static int macsmc_power_probe(struct platform_device *pdev)
> > +{
> > +     struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
>
> You have a bunch of &pdev->dev further ahead, so I think it's
> sensible to create 'struct dev = &pdev->dev;' and use it everywhere
> in the probe function.

Done.

> > +             power->batt_desc.properties = power->batt_props;
>
> It seems 'power->batt_props' is not used anywhere and you can just
> use 'power->batt_desc.properties' directly?

Fixed. I've removed the struct members and assigned directly to desc.properties.

> > +             power->batt = devm_power_supply_register(&pdev->dev, &power->batt_desc, &psy_cfg);
> > +             if (IS_ERR(power->batt)) {
> > +                     ret = dev_err_probe(&pdev->dev, PTR_ERR(power->batt),
> > +                                         "Failed to register battery\n");
>
> No need to assign ret; it is unused. But it becomes necessary with
> a follow-up suggestion from me.

Fixed.

> > +             power->ac_desc.properties = power->ac_props;
>
> Just like 'power->batt_props': You can drop power->ac_props and use
> power->ac_desc.properties directly.

Done.

> > +                     /* If battery also failed or didn't exist, this is a fatal error */
> > +                     if (!power->batt)
> > +                             return ret;
>
> You can just drop this check and instead rely on the "Final check"

Done.

> > +     /* Final check: did we register anything? */
> > +     if (!power->batt && !power->ac)
> > +             return -ENODEV;
>
> You can just return ret here, if you assign -ENODEV as initial
> value. In that case the correct error code will be returned in all
> cases.

Done. I initialised ret to -ENODEV and updated the flow to return it.

> > +     power->nb.notifier_call = macsmc_power_event;
> > +     blocking_notifier_chain_register(&smc->event_handlers, &power->nb);
> > +
> > +     INIT_WORK(&power->critical_work, macsmc_power_critical_work);
>
> This must happen before registering the event handler, which in
> theory might instant-trigger an event creating a race condition. You
> already have the correct order in the remove handler (which also
> hints about this problem :)). After reordering you can further
> simplify by just using devm_work_autocancel().

Fixed. Moved INIT_WORK to the top of probe and switched to devm_work_autocancel.

> > +static struct platform_driver macsmc_power_driver = {
> > +     .driver = {
> > +             .name = "macsmc-power",
> > +             .owner = THIS_MODULE,
>
> There is no need to set platform_driver.driver.owner manually. It is
> handled automatically, so please drop.

Dropped.

> > +MODULE_ALIAS("platform:macsmc-power");
>
> Drop MODULE_ALIAS and instead add a platform_device_id table with
> MODULE_DEVICE_TABLE(platform, <NAME>);

Done.

I will send v3 shortly.

Best regards,
Michael

