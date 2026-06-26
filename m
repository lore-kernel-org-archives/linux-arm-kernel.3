Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF65CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 01:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNZy2c6rQcybgL+bCAHWO3UrpbXcc8ANhnoFPYD99Hk=; b=b6UBVSAW9aSPn0zEfdelAvgMxU
	3mwSMsOoIWXavvVQxmHF1XVNCaPtjwNZlmLYibAELHrnUsE0MkCtSHhSgiSrqzqOw4RjGzRtLUXPJ
	7HcGoMQS08hSTHdeQzHFLV8Ld2CKuZD5dQAoTYQdFYRmZj0XUTGQOnvFsTNWib8x7R8ST4jtwzyYs
	o1RNM5cFyeyKwSMJCVrL1DdhwJcV876BoMJAWtYQ0ywnNTeTQ8uK/YD3TZmmYSwsngits+gub51Gc
	IK+wzyVwDx7Hrku00Np5gyuFhW6k5jfWlIGkVE8lUiVe19/s8nurd+ENfc9/ujLeYz3vDJ1IZuZTL
	ZV8I0VZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvnO-0000000AEeo-0ACZ;
	Fri, 26 Jun 2026 01:55:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvnL-0000000AEdY-3mHj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 01:55:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so782399a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 18:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782438950; cv=none;
        d=google.com; s=arc-20260327;
        b=ebaWj8y12kIfMaHOADjS77Gz9eKCWXJqyi003hLCopovQKGW1AMbNGVYJ352GXGpP1
         XpAzz86+/xKbX/4UjkbUpmUEnTall82ZqqqyhEe/VCQz4m/tAQ4jmMkR6Ft7I+AzRKGi
         xOMP4bdZcEO5yqxhfUvI98cNUKQrh6CG7Dljdzxd7lTNlq7OFZnz+7ROYK/7vnI5m9lq
         yOA5Q4Gy0vmf9keeBJMfegQuk4Vq/p760YxXGDqqQG89VpvgVEqmc2HuMqqRSmcshVba
         IrxIqRKgedwGkFlV5JI2JwR69JXva/mLt+UuO34T7GVP2OJms9YMXyhomsrhB5DV/Uuv
         yuqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LNZy2c6rQcybgL+bCAHWO3UrpbXcc8ANhnoFPYD99Hk=;
        fh=xdG9k1awpHpf3CINhsOe9sgPNa09KjuMv3EiwZc5aGw=;
        b=hqakcAV8O48pa9qiN+rKswUIsRb+2mMb9QAOuPGmGBlRcXPA7OkrMfXH3T/+2B0q+y
         WGStnbji7es1vFAjb1gPfhxnEylMxWTPC7aKR41/ZZkclCu/aamF2TEusBKu1lqPZFWP
         NolKM2N+suRAX4/DNithuZivPKkMUEojhl5+/+NRve+SsLikIUDGHay9no2Tsk+gTS4B
         H7iK6n1jl/nvZPXsB69NCXYFaJk7P6hq2M13SfWFUm5KwZXvcu/Uvpo2qLBFLqfY/L4E
         Jhj3TIqL/SEg3IReXrO54qntuiam81Efdfqp1rQn/5fdQec2Yqv5eTPZ2ob/AcFlcKZ1
         I+dA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782438950; x=1783043750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNZy2c6rQcybgL+bCAHWO3UrpbXcc8ANhnoFPYD99Hk=;
        b=Gf3z/kXShwoUZNODEQWiZL36iRI5k6HrxFOs/oOlPJd7jAyqd3EgqtSaqT3Xu1Nwum
         tpjjgiBeIt9ikCwc5sfgbjHiTbAjob4mF3y+ZR0Ors3jJabHKVKtvDvY3SVOZ2s2PGJT
         A7BsnLGGNIuhdVnXyYEuobPx9AXVqOapl+1tPB7AHqBWOSsYVou0Z6K9DolnljrcM//a
         cXXtykLPhkVlh6I4xwOe1djeH96ibCUPXvoYXtBBslyRxGkQAkBVurwO6RugB6FFzvIk
         Iiw98/xPpVcCv4Gh6ORhqkV/N8bc34BuMTHYNd+yFcaxgrxfiY2VFN62wxkdkM2C/BIR
         ZneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782438950; x=1783043750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LNZy2c6rQcybgL+bCAHWO3UrpbXcc8ANhnoFPYD99Hk=;
        b=ZLfPc/X5MJke/t8H2QV7aHsr2QG0pFwb+phXVeM2MkqauL3mpBtoXQaTo8MLDqrfUq
         jzp3U2vz0Ro0BgLgJnjKaRpVDmLDQ+oQfXvtdwodD8XTS7vA3ih64yNCewGkmHMc+e+7
         C0E369XPMhV944h//bWL0S3SSCe5U5PuQjmLkicfNf0IcNDwI75UNGzcHXybRdnjufO5
         6IgljoLbmfaMiar+4zV22VdRoSaRzcBX9L6TWTQwsLry9F6ZSirzw56lQmSol0EqUmnP
         XcAhu8t91GJyykzaJgqbydQByC9eUMUsq4DRpojngBGoABoQsudkfSOyJkvIU5LO74uW
         DLWw==
X-Forwarded-Encrypted: i=1; AHgh+RqoM6HPs+yxi2j7aA3KY6Bl5ub1c+yRVmL+kCafHiBejORMkkXW+tz6E2W1cd4Xrc4G5OTevzm5MEaBm1loAPFN@lists.infradead.org
X-Gm-Message-State: AOJu0YztIXvrsP2uLehebEKBvDTzl9LS7jkZkUngsNO09IWcBgpSE0cm
	ro8l9Ma0WV8b8S5tgh/JPu5/W9qgzZUNJP7isY1oViFmBcI+H4od6gjUYv7CzaNKYf1iWZ5K7Rm
	ejm4GjfAZn2os/pn0BlOEtuXJTCSMcqs=
X-Gm-Gg: AfdE7cmGF6Bf65QqQpfgnOo5AKrfiFS8hAF1nveWxharcR05aI5mN0SMfQt/Q8NpK0k
	Z6+cKAV9xEJAkPhCABlVYiu8wkLSXumv3HgaAtFVAQWEUDW5W3xbQw8fA+H5NmclzF7u9+I5Wgs
	CWaT1cdYYhigayDUTvchQkvchrpWtz4Ley5J3PalmsGFxbU6+Ivbras/aZNKY20WmCo6AZ1l9Pp
	VTiQK0qfax3t6liOatNm6oR4IkfMkRMNCFItXtVkvZFbgAPeCWDE1S950cBKwECx9DykoAmLYhi
	GK0M+kk=
X-Received: by 2002:a05:6402:3512:b0:697:eece:eae0 with SMTP id
 4fb4d7f45d1cf-69810a3a8a5mr919346a12.6.1782438949713; Thu, 25 Jun 2026
 18:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260625071130.93544-1-liem16213@gmail.com> <20260625160219.55116-1-liem16213@gmail.com>
 <aj1UR5ddawsdMbZC@SMW015318>
In-Reply-To: <aj1UR5ddawsdMbZC@SMW015318>
From: liem <liem16213@gmail.com>
Date: Fri, 26 Jun 2026 09:55:38 +0800
X-Gm-Features: AVVi8Cdo9F6_HUwGPZkGfKdDVs1g2IkW69-hNTuPosIJl9Kc44faaQDJLD5vnmQ
Message-ID: <CABoz+=00tywisdxcmkF_F8rOYg=BMtzZDsTN2JOXfzEwsQu01Q@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: imx: Fix slave registration error path and
 missing timer cleanup
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andi Shyti <andi.shyti@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Biwen Li <biwen.li@nxp.com>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_185551_970461_604F11B2 
X-CRM114-Status: GOOD (  30.18  )
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

Hi Frank,

Thanks for the review. I'll split this into two separate patches and
send a v3 series.

Regards,
Liem

On Fri, Jun 26, 2026 at 12:16=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Fri, Jun 26, 2026 at 12:02:19AM +0800, Liem wrote:
> >
> > There are two issues that affect the i2c-imx slave handling:
> >
> > 1. In i2c_imx_reg_slave(), i2c_imx->slave is checked at the beginning
> >    and the function returns -EBUSY if it is non-NULL.  If
> >    pm_runtime_resume_and_get() fails later, the error path returns
> >    without clearing i2c_imx->slave, leaving it non-NULL.  Subsequent
> >    attempts to register a slave will then immediately fail with
> >    -EBUSY, making it impossible to register the slave again.  Fix
> >    by setting i2c_imx->slave =3D NULL on the error path.
> >
> > 2. In i2c_imx_unreg_slave(), the slave pointer is set to NULL after
> >    disabling interrupts.  However, a pending interrupt might already
> >    have started the hrtimer (i2c_imx_slave_timeout) before the pointer
> >    was cleared.  If the hrtimer fires after i2c_imx->slave is set to
> >    NULL, the timer callback i2c_imx_slave_finish_op() will call
> >    i2c_imx_slave_event() with a NULL slave pointer, and the
> >    last_slave_event check loop in i2c_imx_slave_finish_op() may cause
> >    a system hang because last_slave_event is no longer updated.  Fix
> >    by canceling the hrtimer and waiting for it to complete after
> >    disabling interrupts, before clearing the slave pointer.
>
> Please use two patches to fix these problem. One patch fix one problem.
>
> Frank
>
> >
> > Both issues can trigger a kernel oops, system hang, or permanent
> > slave registration failure under certain race conditions.  Add the
> > missing NULL assignment and the missing hrtimer cleanup to harden
> > the slave path.
> >
> > Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Liem <liem16213@gmail.com>
> > ---
> > v1 -> v2:
> >   - Instead of adding a NULL check in i2c_imx_slave_event(), cancel
> >     the hrtimer and wait for it to finish in i2c_imx_unreg_slave()
> >     after disabling interrupts, as suggested by <Carlos Song>.
> >     This avoids a potential hang in the last_slave_event loop in
> >     i2c_imx_slave_finish_op().
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.=
c
> > index 28313d0fad37..04ffb927aba9 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -936,6 +936,7 @@ static int i2c_imx_reg_slave(struct i2c_client *cli=
ent)
> >         /* Resume */
> >         ret =3D pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
> >         if (ret < 0) {
> > +               i2c_imx->slave =3D NULL;
> >                 dev_err(&i2c_imx->adapter.dev, "failed to resume i2c co=
ntroller");
> >                 return ret;
> >         }
> > @@ -957,7 +958,7 @@ static int i2c_imx_unreg_slave(struct i2c_client *c=
lient)
> >         imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
> >
> >         i2c_imx_reset_regs(i2c_imx);
> > -
> > +       hrtimer_cancel(&i2c_imx->slave_timer);
> >         i2c_imx->slave =3D NULL;
> >
> >         /* Suspend */
> > --
> > 2.53.0
> >
> >

