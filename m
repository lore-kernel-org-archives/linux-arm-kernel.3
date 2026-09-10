Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50272C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4TZTvFeGPOKvIslE4wHXvMYV9kBCW5S/2L+GB2DcDc=; b=EzVMp14F+bG8uG86/LFZdvsYM/
	FyHxMaIl/Gxd+l+CK0OlrPfkz81VF0ZpO8tAzHxscYEi3nn/wGkwUPX68rjX9qchVBuCVC2kza+Fv
	FxT/WTDtrdH2G61aAQredHL63KISWeevaJyIG59vXbJvKQ8yu+oOlx4t1PetmvoTysJAhv1J6Q5dz
	gBx/f1gDVwvI79i4KZYoqP+Hr3hGBxZZ6GMBdIqyYzlWpL7bSf3KZDH+zjER541LCMPGzyGyGKENU
	o8U8ykCD+BAFw9RF5+4O3wLF9NCx+2WSnDxZIY5dlhEsa22gPoZwhIoxh78NznB+/Mg2jzx53K+73
	0eaRIpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ir0-0000000F65j-06Mu;
	Thu, 10 Sep 2026 17:46:30 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4iqx-0000000F659-3rnB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 17:46:29 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66fb7ba702eso1179922d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 10:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789062387; cv=none;
        d=google.com; s=arc-20260327;
        b=PuG1PJFtdFDu3s9lsmFdc8nRUcMfU1GV8wzJhGA17VFssrpr7Ola0SQm0GpZZroZlo
         Ij047yEUtM5B6rtNqvutcZhjFaK9udNDMbMvgUrvTn8x6YrLjqIfkESY/ueehic93ws0
         pNOY+INsYErSTfjieFEKDQttWCa21gKrbSOw3UhD8Mhl5UcS2zw43syCms8IJe0qF26r
         4I9gDID6ruKqdRF4svytbN5OJU288PxNTyA3VAliBI21kjPsDWh6GwcKdEYRUvvJIHTb
         w8HFketVqevULhuZ8kwjXOHRxhZCMWPh4kl7mAFY1xUK4b0SeOjwTzT/CCHFWWVod5NQ
         SnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w4TZTvFeGPOKvIslE4wHXvMYV9kBCW5S/2L+GB2DcDc=;
        fh=a/eH7DDPp50oeSVjqBhbyVisTbvYB7jQflfO9DmCV18=;
        b=YvKQWlVSaymBfzcrfVsFngcwrZztjNyOLdEowPqRsqI7r+vOlWWoOTwusQtBmsXd2Y
         +PGvN/NaVqpbqTNVT/cNxqTY4eqqT0NOn2MkAYqxmzylrfVeHm6I+gzktoLvl7TkYXle
         4kl5bR2nZk9ThMgG/oTwBeCQMrujPYnpPUD2zTSFQwh3uHQYzcnOmT8/y9KmGLMy6iOv
         3US2uLLO5d3xX29HnBP2mB37fjfk8QUJaO8lk/+34JvWFXWukMQq7TwjfaL+MI/VYIxw
         9YnNGxByejVXuj8spm8CuEIz883ucOVqkpLeWTh0VHhUz3z3YfXfPS/bLKC5JrxFGSpt
         Aoew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789062387; x=1789667187; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w4TZTvFeGPOKvIslE4wHXvMYV9kBCW5S/2L+GB2DcDc=;
        b=rrxjmBEH9cK9mKM1eOWFOtzmEMDQfasPHTi9u1I+Booi2dH+S1EQhz5l2nSFHWOXTJ
         yHqvp+jIHQv3pgqccb1P6qAX1kbHCKCQf40tzguB9oxAONfWB0k1BL3sBMJkaL1u807j
         vYGFtFk67LLp/g4sAWGb1/xtg/DbkCu+W0zqix8gnfBh8UgnAWMQRkGEUQYyU2OphTsq
         +fK6PY9ZJBd2x3wzR77w/xBc8mjFEj9pzhohjKR45+c/srkHRKG0fUayMoNJ+UORbsS7
         HizCC7vyHOtDdxaHY498XqVxc3xoGCbdXvLqy9EupWf5tYyedeR2SaTrFikI9/eNU9HZ
         nkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789062387; x=1789667187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4TZTvFeGPOKvIslE4wHXvMYV9kBCW5S/2L+GB2DcDc=;
        b=UXtsCsWJDezEVr+qsTa/Td6znTMvCfqHU/geTCLv1wAZpoIN5SRQH7XDsAX0jxJWCH
         kJQq7MxpCvx1Nnea3lPKq/ggoaoHTyHhiYj12n2jyvUl3/eYzZGmunfP92F/ls8Vf/Ry
         7d3gjzuEE2SlrnUAUtHukgxvpDEvv4Dy8sDWw6RFxUk5Un0GnSH2lxvr4Isf2Ee9evtI
         HtZ890VKHYog2LkxfD2zc3bz/Wf1FHB9xuAd4d4dpnQVYdxDwsAdfrc3TFXOeCs8p7Ks
         8cZ7qkJuMTnUSEY3KmFvVhizb5SdLk5vavbyIW2cEG+zqUKVvnxFJUzRa5TCFnDPj3Ib
         pdPQ==
X-Forwarded-Encrypted: i=1; AKwUvByteqa/+C6DzrzGvckzb98VdU3sVXLWo+Ebf/ROCkEIykuyBjDzsQqiUWWn0AnMfMZuaJ76pRAYG8CD/us08H68@lists.infradead.org
X-Gm-Message-State: AFuF++nS5ZDNn6bFz96d4CZnTCpgz01sp5bZh2Uel4q853JvZ3dFxaTi
	sDj3dW1qJNm5KBLuqolyNzFVICLiqPtedXutiqx9NYndon0RLRPzIExwwEV/jGHr5EGaz1kJMx3
	O74x4M8zGnOrTPsK89GYWSkYM/fC9H1E=
X-Gm-Gg: AYBFou0WR3kVbRA9Nm25RJ8ZexIpTIUTKr32rGFWAqnuMMyzaFvjc88cW4x47UnfQ30
	c6NETX7jQ6LpIeNWsKggnFbZBUko5Njmc4R64duhUriCb2Ii/xf5FlwSl5TO0DJt1HO3ZNDtlzd
	iRTbdKxIKLD9QYaALm9X9jZCUV2UYj0uzg/M1K6JlefxGJjHDEHeLwB84RVzKERii3wMLat6tza
	IJoQzZg/gBW1Bv24ScwczD3f66fVGpPh2ua+VVnQSaSMWerQTEoHLny9ITdz7RTs3unX/LFX+e6
	mWSrcAmq7wsMwwEdwyfK3/jls/FBEY75Oz7HCGNRznqqeWUdMwM8yJisoA==
X-Received: by 2002:a05:690e:2630:b0:671:1256:56f2 with SMTP id
 956f58d0204a3-6712434a30cmr243759d50.0.1789062386241; Thu, 10 Sep 2026
 10:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260910113325.717882-1-itai.handler@gmail.com> <8fcad389-8340-4ccb-8ef4-008d826115fa@sirena.org.uk>
In-Reply-To: <8fcad389-8340-4ccb-8ef4-008d826115fa@sirena.org.uk>
From: Itai Handler <itai.handler@gmail.com>
Date: Thu, 10 Sep 2026 20:46:13 +0300
X-Gm-Features: AcwNN1U3FFO8vc3TdnTHV2rTuiD4fh1DFByrqEjK3AblMQ21SxCX7JRhTKfW558
Message-ID: <CAFpOueQ-veAYVWAPTN6_0c9NXCEN24wzV4i2uVuNykWmBy6vfA@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-zynqmp-gqspi: stop the controller on shutdown
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-spi@vger.kernel.org, michal.simek@amd.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_104628_001822_DD7357E8 
X-CRM114-Status: GOOD (  31.69  )
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

On Thu, Sep 10, 2026 at 7:56=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> > +static void zynqmp_qspi_shutdown(struct platform_device *pdev)
> > +{
> > +     struct zynqmp_qspi *xqspi =3D platform_get_drvdata(pdev);
> > +     int ret;
> > +
> > +     /*
> > +      * Only a runtime suspended controller can be left alone: its clo=
cks
> > +      * are gated, so it cannot be mastering the bus, and its register=
s
> > +      * must not be accessed either.  Any other answer means it may be
> > +      * running and has to be stopped.  In particular, on a kernel bui=
lt
> > +      * without runtime PM this returns -EINVAL, and there the clocks
> > +      * enabled in probe() are never gated at all.
> > +      */
> > +     ret =3D pm_runtime_get_if_in_use(&pdev->dev);
> > +     if (!ret)
> > +             return;
> > +
> > +     zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, 0x0);
>
> What ensures that nothing can start new transactions after this has
> run,

Nothing does, and that is a real hole in v1 - thanks.

Two things narrow it without closing it: device_shutdown() has already
called device_block_probing(), and it walks devices_kset backwards, so
the SPI slaves and the MTD stack above this controller are shut down
before the controller itself. Neither of those stops a late spi_sync()
from anywhere else.

I will fix it in v2 by quiescing through the core first, which is what
this driver's own ->suspend already does:

        ret =3D spi_controller_suspend(xqspi->ctlr);
        if (ret)
                dev_warn(&pdev->dev, "could not stop the queue: %d\n", ret)=
;

        ...
        zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, 0x0);

spi_controller_suspend() answers both halves: spi_stop_queue() waits for
ctlr->queue to empty and ctlr->busy to clear, and __spi_mark_suspended()
makes every subsequent __spi_sync() return -ESHUTDOWN. It can sleep,
which is fine here - device_shutdown() runs in process context and
already holds device_lock() across the callback.

Unlike ->suspend, shutdown cannot abort on error. If the queue has not
drained after spi_stop_queue()'s ~5 s cap I still want to write
GQSPI_EN, because a controller left mastering the bus into memory the
next kernel is about to reuse is worse than a truncated transfer. So the
return value gets logged rather than propagated.

I did consider making ->shutdown just call the remove path, as
spi-fsl-dspi and spi-bcm2835 do, and it would quiesce correctly here
too since zynqmp_qspi_remove() calls spi_unregister_controller() first.
But it then disables runtime PM, drops both clocks and tears down the
controller and its children, which is a lot more teardown than the
shutdown path needs and none of it stops the hardware any harder.
spi_controller_suspend() is the part that actually answers your
question, so I would rather call just that.

> and if there's any operations in flight will the controller be OK with
> just being stopped like this?

With the quiesce above there should be no message in flight by the time
of the write. For the case where one still is (the -EBUSY path):

- Writing GQSPI_EN_OFST is the driver's existing stop primitive.
  zynqmp_qspi_remove() and zynqmp_qspi_suspend() both do exactly this
  write, so this is not a new way of stopping the hardware, just a new
  caller.

- No controller state has to survive. Whatever runs next reinitialises
  it from scratch: zynqmp_qspi_init_hw() clears the ISR and the DMA
  status, writes GQSPI_EN 0, resets the TX, RX and generic FIFOs, and
  writes GQSPI_QSPIDMA_DST_CTRL_RESET_VAL. A power cycle obviously does
  the same. So a controller stopped mid-operation is recovered by the
  next probe.

- The flash is the part that outlives the write, and stopping the
  controller does not make its state worse. A read is aborted when CS is
  dropped and the chip goes back to idle. A program or erase carries on
  inside the chip whatever the controller does, and the next kernel sees
  WIP and waits for it. Waiting for those belongs above this driver - I
  have a separate patch making spi_nor_shutdown() take the flash lock so
  the upper layer does not walk away from its own operation - and it is
  not something a controller ->shutdown can fix.

The failure this is aimed at is the opposite case, where the controller
is left running with nobody driving it: after a kexec without this patch
GQSPI_EN still reads 1 and QSPIDMA_DST_ADDR still points into the
previous kernel's memory, so the engine keeps writing there while the
new kernel is relocated and started.

I will send v2 with the spi_controller_suspend() call shortly.

