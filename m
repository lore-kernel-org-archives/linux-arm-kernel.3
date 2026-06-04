Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7224CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGgotgVvr2112uvvc1DyL29QVRiLiPk2tEKJibU9Fy8=; b=yVaIQyy//3QrDDpprOuINbitbE
	+zOCiojEZXG6zgmkAWQHkciLnTLwjjTyUuoYalK6Ww7OaccWL/+0y3amSj3Mg1wMiwVPDmuR6y1iZ
	/r5hRRoZN0z2b2UZTQtesgPtb+a6Ybln8SqTER5qnQPL8B/ASEi9u0ERGSLeZ/jfXvk/R/yCo8N2T
	5ccsbWUAJPoEn7EkOWnC0XI6Z60FWHx9j15QizHJSWdh7GMVRjA3x7wKGc81vyuDvyKICrjXhqOsK
	xWsWvpuNXDLx6fKLIOw/CBkDa3JnAbq3/9JazXqRZhobioUnQRRwH1aYqHECYTDNDxgLrsnHv3JDG
	cFNwB49w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2wV-0000000GLUy-2Too;
	Thu, 04 Jun 2026 07:56:43 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2wT-0000000GLTu-02Gd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:56:42 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-66050f7af22so67950d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 00:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780559800; cv=none;
        d=google.com; s=arc-20240605;
        b=G3+kziUIE0SfZzVw08EhJHscGujv6Xfz18APaAzmLjVOYHmTLQIv3tv7WSKdfce4jn
         BJheof9U14u6EIxUEmlPr/G+aLhNxmO1kO/nsqiQ0pKhfeOM2q+f3lms6xuIe6d3jqfg
         JC54/eVY2DmDf/FR0siomwbBHA3oBrIcYFxXnpcLD++JD1VQDWEFujxWt7Qws1AUTnsU
         UI6NPZ34B+I4gOYdhBkpMwsHu2Dpr89NvS6AKC4phVPyw/X5yYokotG8+JR2lRNGajd0
         oz8NRhq+AqmE/5cHI8JNuNq+jw5OA3DgL62m08Wg5VY2HIfaJUtbtnDOYaZQ8s2vLi71
         hE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eGgotgVvr2112uvvc1DyL29QVRiLiPk2tEKJibU9Fy8=;
        fh=molLIdaeTDVS6V56TF5SOmlKJcysgGaFl1S64cxEeFY=;
        b=SCXTzqCWZqlo8gW+v6OezPnut8Fa0utApdFPQPZLwJmTvD11gfvkRv4ymziBWJYW/G
         B0hpq/70sqVhTN1O7n7wQGH5/wg/qUA815T2vQmhvCFzTHYxxQUrbGRFDKLlS9pkcXGo
         GOoSOUDzZmSRibM3Pdo4bYHuhgVuaT8lm7KbY9uoQ9qbfmEOg6HcyJXHbUilsep4tzp1
         G6TFZJMNeQs3QsEx8/t4AVZ8o7Fh5hIg0j66M4JkGgpRaqLgeXzFxPhvTV6PWg3Pvy/B
         /R0sXsAYXvS3nunujIKXQQ0q/AclPJqrDtPjazG+O3jAgSTq235qca+qWJAfTyRbN99h
         5aaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780559800; x=1781164600; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGgotgVvr2112uvvc1DyL29QVRiLiPk2tEKJibU9Fy8=;
        b=IaVHsx5iaC5sWiQpVIeXPt0WhwP/ErjtJAMIQWY6wAk4YJHLc2Ma37pgJTZEsN0yYf
         /7qiAG/DPySQni60UnnhP9LtTopKLP1NB8+5WSnYLWeMo3tKivPHJ24wZVdgTW+ogQA0
         ETldJBw+XBjcrL/4RVItaIo3mISDpdBBdc2ec81fFODNLkWvkuQeroNoP5gDxOG9Ez+3
         Pp0RkZoF64hD7jaUjVHAFFzF2Qk7YkfUoiIWVhzURKCeMZYBup2b6P1ICPE0jw6KHlAy
         FjgP4sYiRMh+n6g3WxLncsNhWV/kmB6Cr5fn+cX2awsa175oHZzWR2wA5sNJ9/fkgX1d
         g6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559800; x=1781164600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eGgotgVvr2112uvvc1DyL29QVRiLiPk2tEKJibU9Fy8=;
        b=Yttbrp9e1kqCI1buQ77dTBm94ctQC4xlMgmhoWXUoMNqArIorNUC/tPWNiVmD8fdnF
         cxJqXYheLc8MZBMRIYFdOAcF3edMK5c4ZviCQtO8IfGwKLGBRGhucephEVrRpDPLCmtU
         CV5DmyH/vIhZdrQUqR9eYNOVJwbRgfz72pJMwyX/kzxZk4s5vKD8lBuuNVUvBnio6NRt
         RqPq+0Hblk0gbf4oSj33DEb3iBUa1xPMzJpjvKM2cm6dBvS7D0GqhpFKa6Lkq9BnWyub
         7p8JlcS0RW1XxB6kgVBr5pBgwtY8pPwE5wcIFDocfY77N2uZvZ/TWvBTP2nZhL0OmLw6
         sjJA==
X-Forwarded-Encrypted: i=1; AFNElJ8oOH64hSGt5+ZHtKOouZglAOKSy3Lx5vYvffW9arULkNZGnlwoRU1hotW+1lSoZ6N5POnIWu+v4xzY9Zfung08@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8PcjAKka7ODNbtQbkANAPFUfhj8gfHxehiT+S4vvGMVTnS8L0
	i/3UVVL7QyHsK86mOooTW0YhcSOsx5bDiMNr6e3ih7CKKMstWRyY2+IcDxhGob77AzRqRZ7P6zr
	fzjuWd1rqbtqg/TnL8ouD/iNbftxcCN0=
X-Gm-Gg: Acq92OFg0y+nJua0gXURw1jmM2bQ/xTZEOFqnD8rTzHLldqLPc4itvWYT2MU2Lx13Fg
	zfFxZC7cn3FRfZfCOIXyW71x7XcCGTU2Kc7eMEbOsPtlWGnePV3NHbvEh4TvScdye+wkkmA8jMx
	LP1eOQHhwHQ3Q7rEUGeXjMkWBV9yyh3T0dm7xd6ofV+cqV97siqvsxBWTEYSfc5zQKpaHYqnspp
	e7OetGsI+f+CZyUl+M/rHuUZ4pVff7dhc5rO/Pu0t3BfMYXsT53EaICoPW0S/P9PVG960I6bh5g
	MFVe+NIdHCUQqJk=
X-Received: by 2002:a53:ac81:0:b0:65e:3bde:1c8d with SMTP id
 956f58d0204a3-660f3e4dc46mr957229d50.2.1780559799732; Thu, 04 Jun 2026
 00:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260529092703.33086-1-l.rubusch@gmail.com> <ah381bcuVfN8PQr0@linux.dev>
In-Reply-To: <ah381bcuVfN8PQr0@linux.dev>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Thu, 4 Jun 2026 09:56:03 +0200
X-Gm-Features: AVHnY4J2DHztDoFLLVQlenrixqwpyOZeMKkQ7C8oahq4-g3DlS-OWLO5LNf1rU4
Message-ID: <CAFXKEHamUnW9S2nvDD+iHdZB8+66s2SYVEq7KYvUbs32S4behw@mail.gmail.com>
Subject: Re: [PATCH 1/1] crypto: atmel-ecc - fix use after free situation
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org, krzk+dt@kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_005641_065855_01DE9E19 
X-CRM114-Status: GOOD (  37.55  )
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

Hi Thorsten, thanks for the feedback. Pls, find my comment down below.

On Mon, Jun 1, 2026 at 11:42=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> On Fri, May 29, 2026 at 09:27:03AM +0000, Lothar Rubusch wrote:
> > Fixes a possible race condition, when having multiple of such devices
> > attached (identified by sashiko feedback).
> >
> > The Scenario:
> >     Thread A (Device 1 Probe): Successfully adds i2c_priv to the global
> >              list (Line 324). The lock is released.
> >     Thread B (An active crypto request): Concurrently calls
> >               atmel_ecc_i2c_client_alloc(). It scans the global list, s=
ees
> >               Device 1, and assigns a crypto job to it.
> >     Thread A: Moves to line 332. crypto_register_kpp() fails (e.g., out=
 of
> >               memory or name clash).
> >     Thread A: Enters the error path. It removes Device 1 from the list =
and
> >               frees the i2c_priv memory.
> >     Thread B: Is still actively trying to talk to the I2C hardware usin=
g
> >               the i2c_priv pointer it grabbed in Step 2. The memory is =
now
> >               gone. Result: Kernel crash (Use-After-Free).
> >
> > Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel E=
CC driver")
> > Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> > ---
> >  drivers/crypto/atmel-ecc.c | 10 ++++++++++
> >  drivers/crypto/atmel-i2c.h |  2 ++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> > index 0ca02995a1de..d391fe1462f6 100644
> > --- a/drivers/crypto/atmel-ecc.c
> > +++ b/drivers/crypto/atmel-ecc.c
> > @@ -218,6 +218,8 @@ static struct i2c_client *atmel_ecc_i2c_client_allo=
c(void)
> >
> >       list_for_each_entry(i2c_priv, &driver_data.i2c_client_list,
> >                           i2c_client_list_node) {
> > +             if (!i2c_priv->ready)
> > +                     continue;
> >               tfm_cnt =3D atomic_read(&i2c_priv->tfm_count);
> >               if (tfm_cnt < min_tfm_cnt) {
> >                       min_tfm_cnt =3D tfm_cnt;
> > @@ -322,20 +324,24 @@ static int atmel_ecc_probe(struct i2c_client *cli=
ent)
> >               return ret;
> >
> >       i2c_priv =3D i2c_get_clientdata(client);
> > +     i2c_priv->ready =3D false;
> >
> >       spin_lock(&driver_data.i2c_list_lock);
> >       list_add_tail(&i2c_priv->i2c_client_list_node,
> >                     &driver_data.i2c_client_list);
> > +     i2c_priv->ready =3D true;
> >       spin_unlock(&driver_data.i2c_list_lock);
> >
> >       ret =3D crypto_register_kpp(&atmel_ecdh_nist_p256);
> >       if (ret) {
> >               spin_lock(&driver_data.i2c_list_lock);
> > +             i2c_priv->ready =3D false;
> >               list_del(&i2c_priv->i2c_client_list_node);
> >               spin_unlock(&driver_data.i2c_list_lock);
> >
> >               dev_err(&client->dev, "%s alg registration failed\n",
> >                       atmel_ecdh_nist_p256.base.cra_driver_name);
> > +             return ret;
> >       } else {
> >               dev_info(&client->dev, "atmel ecc algorithms registered i=
n /proc/crypto\n");
> >       }
> > @@ -347,6 +353,10 @@ static void atmel_ecc_remove(struct i2c_client *cl=
ient)
> >  {
> >       struct atmel_i2c_client_priv *i2c_priv =3D i2c_get_clientdata(cli=
ent);
> >
> > +     spin_lock(&driver_data.i2c_list_lock);
> > +     i2c_priv->ready =3D false;
> > +     spin_unlock(&driver_data.i2c_list_lock);
> > +
> >       /* Return EBUSY if i2c client already allocated. */
> >       if (atomic_read(&i2c_priv->tfm_count)) {
> >               /*
> > diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
> > index 72f04c15682f..e3b12030f9c4 100644
> > --- a/drivers/crypto/atmel-i2c.h
> > +++ b/drivers/crypto/atmel-i2c.h
> > @@ -129,6 +129,7 @@ struct atmel_ecc_driver_data {
> >   * @wake_token_sz       : size in bytes of the wake_token
> >   * @tfm_count           : number of active crypto transformations on i=
2c client
> >   * @hwrng               : hold the hardware generated rng
> > + * @ready               : hw client is ready to use
> >   *
> >   * Reads and writes from/to the i2c client are sequential. The first b=
yte
> >   * transmitted to the device is treated as the byte size. Any attempt =
to send
> > @@ -145,6 +146,7 @@ struct atmel_i2c_client_priv {
> >       size_t wake_token_sz;
> >       atomic_t tfm_count ____cacheline_aligned;
> >       struct hwrng hwrng;
> > +     bool ready;
> >  };
>
> I don't think the ready flag fixes the race. A concurrent tfm can still
> bind to the shared I2C client after atmel_ecc_probe() adds it to the
> global list and marks it as ready, but before crypto_register_kpp()
> fails.

Argh... I see your point. The "ready" now is transparent to the
i2c_client_list usage and serves for nothing, that's nonsense. Going
some overengineering-steps back, my original idea (to satisfy a
sashiko complaint), in my own words:

Thread A:
1. probe()
  V
2. probe(): add i2c_priv to i2c_client_list <-------------- Thread B reques=
ts
  V
3. probe(): registers kpp
  V
4. probe(): say, register kpp fails
  V
5. probe(): remove i2c_priv from i2c_client_list <-----

Thread B:
Now if a crypto request/TFM comes in (thread B) and requests a client
from the i2c_client_list.
(Note, this is a case where the device must be, say, the second such
device so that kpp is already registered for any atmel driver).

If this happens before step 2 or after step 5, it's fine. This
instance is still not on the list. If it happens at step 2 through
step 4 this is problematic. A i2c_priv could be returned which is
actually (still) not ready. In the meanwhile i2c_priv will be removed,
but the TFM continues refering to this instance.

Question:
- Do you see the issue here, too? Or, is my understanding wrong? Can
this be problematic / lead to UAF?

- If true, my first idea was to set a "ready" state initially to
false, after kpp registered successfully, set it to true. The flag is
checked then, as in this patch. Then I probably messed it up. So,
could this approach solve the situation?

If you not answer I'll present this in the next days.

Best,
L

>
> Thanks,
> Thorsten

