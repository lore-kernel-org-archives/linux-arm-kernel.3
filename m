Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B633C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 00:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThLt5oXN6ToF4YKkt6FpXYxeDHP+cqmJLsZgthH2NCI=; b=FQDxSb+UMLudql3i1/SNvcBZgY
	b9CZUrlQMKJTuwMjWfNf/Rtbg/Qat5uLpmaP1/t1zDA6crAHK4iw/5/d/DDtRdi8WMsKdE8+Llpeh
	z+rZxPjTiebYOztNOyVYh+41rjvmFByMe8Lmim1XEn2g8vyXXkDzmyk7p9dU/ImHJKvMtPyN8DA7P
	VTS58IZ+YNJSGBv3I05B303Xp3zj3RQd44fm8HTkB1dM6nrNDbJMjT3BJL6gfd3Ww8c3biJlGQm4T
	UGe5XGv9KuVqt9t+qPaG35sHKUQd4ABJwbkVH/7ZsYNumPhn34N0ukdJXzjs6VAlUIe8SAmE7mo0H
	Vw8ZmsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7MHo-0000000D0Sm-3vVh;
	Fri, 18 Sep 2026 00:17:04 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7MHl-0000000D0Ro-2MfJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 00:17:02 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso21139266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789690619; cv=none;
        d=google.com; s=arc-20260327;
        b=kMYGU7EZPhIANGHr3io4YEyFx1/CIkwo4aPlezD4svBiXb7jcjvjfl//hPxDlxPGKI
         wa5xqK+ianJG7dU9yw4aB8sU+hGto1NONtjXQLXXMulbhztxenC8WEUleCtiNFvJ4+WS
         JY+cWO4wWZgzP28buFJI6HPXaULLhspioTEg/Z6xqsRZjNbIl9eaP/UGpDC/v8DOV0uI
         eP8TVJ3tSrc3FS98rjs5fOVXRExZ1cuNbeq9wczBhwCtiZmVk/fhCUI00rRC0pIOrBMN
         JBx1nC+y4+hO9W3BqGkxU6rcKs8U8H2ICrzNF/4QyY0s7TPYaOazK1tc4HS1j59uHXcW
         Ti3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ThLt5oXN6ToF4YKkt6FpXYxeDHP+cqmJLsZgthH2NCI=;
        fh=1iyTYGOI9rMQJBd2kYR2t34lOCsIOuSoXMFInPTVYew=;
        b=D0ddAenLtbOVz9V5rNEIkjDqcCg/wnpLqrE038cNp8pgxWf3yR+pWFhFOtrjd/5EDL
         GerquGE8z1ORQrwaa7MulDKYa1qgqSfQhd2NJqKmpYB2rGriaMhnSlz97Var+5qJ/sjZ
         cf8ku+Ur7kEAEJHSUFVfPLYoMKqY2wShMGYhnYPwxZbbNXXyy+XMBBBmAhWjRc747H1r
         kNeFBjFvqiFMTH+NchsXN/4yHszJbWsXB85Wn79m8xLR+lLrFHU0SLNrI+IFhPbYFv6R
         m9rccI+W6U1VfBxwd7bSOJ3Dfz23VxlxWqjBl6rXK0AxbPOk48Nb/MyJGHh1cJDGxL8r
         qOoQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789690619; x=1790295419; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ThLt5oXN6ToF4YKkt6FpXYxeDHP+cqmJLsZgthH2NCI=;
        b=m7z+thtQ+kTXasu7TTI20UpwV7J5SI4YMMzwWLNVUZACahqr83Z9fqGSYvUnAaj+nZ
         VM1/9vzEUuUMCqx0/xCR4UbftjWtxPrgcPpOln4n4Ajs1TJFlgoGShdEhqPhUQ+LNOo5
         f7j0an7yq8L6PKOqh2mwEDXUL/ZnbxeuOySDecLJgpfKOLY8+4FKp5UBymwhj1A9MXkV
         4uHM4a197B1XfWSBfxkhcYV7EJKxpg7b/s2rYSSZFQqCFmeSq8PHBcb7geJ00xVK1e7e
         z0n9x1Y3X81370HpgRkgOdJ8KSCtF5YdpyuVWdZ9nyDFtAteqaQRVXJhx0WqXeVF9ZlS
         osOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690619; x=1790295419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThLt5oXN6ToF4YKkt6FpXYxeDHP+cqmJLsZgthH2NCI=;
        b=bzncWQTZ4bDjnGcCGYWVTm4eo5OJJHYk0omMewoz/jE1RdLrdDKmxnsxFruRP1C87y
         X0IGBT6919/Mvs9q9w+Ih1HkT3zG5otqUKYzxFMm7a69cOaCQwoymK7AxJM85/WJdn63
         ClNiUx6XmpR8bW/1TIWxr8ibMFtPpe/TDUyVATl7oherJQSsMBOzwdgzp6kNr5dsOcKz
         fgaLyRb8h3xYA0dZToaDUAFixKtThe54tJocyOVJO5iPGlZVWbqs44aVtGjsxYO2xhcH
         mKn8yg1AeYv48KbfpaUwMS1aBCyRUXPrQ7x9O0krDuNW9QGyMhvgC+CbCrxUhv0EemZm
         rVmA==
X-Forwarded-Encrypted: i=1; AKwUvBxcL5l44ZZvgzrvyYCg1AjwX7Jq1iSzfC0biKBrDdZHEnj43JdK9leuLaghyslr5grciYpeQEuyUM8AhBsrsGZ5@lists.infradead.org
X-Gm-Message-State: AFuF++mp3HCPgp41URL1MBqGoFHSe6eOh1hRYcU5BEhaE9jIOau/c24C
	8G0+DXQ6y6BDIyS7zl79twQOPIBK0KwtysFRVYC+IcrmcJD9H439Uuulh8QXA/0b3TSyt5ZIn90
	Mjx05g1TPAtnEliepO6wGtqtITw+QWgQ=
X-Gm-Gg: AYBFou2pammW60zFnhNFyQlY8DNJJrxP+fWl6lNn+jzBHSIJxJQfvqU4AUA3IJcsYZe
	0p/xbnipEM1Ms0KucrYekHFYsNmUbOtzMf5pK+OKp3bnuYSrDgHUaNMyPggVazS+1YI8Iv6WhmY
	q1vaAYMjh9xRongrTvQicW2Zx0DN9h9sxSfb95eGXrsPhh5kUj0LhdqMhjW5Ducsp/WHXIkanpt
	/EhVee3pWWyx82OHc/McTQHuFpZEokoSC1vb6cWcNxNPs63Eb8TZqSn3sN1tLByJ3YPTdZxuvXd
	fynnMvdwMqbCTy2WrYuPjU4KkyrUQu71Aup2hImTzn96ewjyL30Y/1nVKn2h8n5mGUyjaX1Hx8T
	aGLTjYw8Jsz2zaFEgdm6eqTNWuxybLWEBkDTD433dz8Hw+NYfoKjhjYLp7Qq9CrxibtcR9Uovqj
	hMO4cPczJAQX2EPcdUI1YZruZsT7lu6jObA6Ea3OOgJZGu1Sc9QpkvTPIs1fOLPpg+jQ==
X-Received: by 2002:a17:907:3e0f:b0:c27:420b:7c90 with SMTP id
 a640c23a62f3a-c2a1588651fmr79357066b.48.1789690618982; Thu, 17 Sep 2026
 17:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260916224156.276511-1-rosenp@gmail.com> <aqtdmOzJSIawqKQq@SMW015318>
In-Reply-To: <aqtdmOzJSIawqKQq@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 17:16:47 -0700
X-Gm-Features: AcwNN1WrOby4AFhx7As-4Zrve5ehCpdMlOHPijGBhqbyP_ojiIATGZuFFmx1ZbY
Message-ID: <CAKxU2N-gitgedS9ZJQ7wNV9Dma9PUwM+0NMY5yfVk2PvXOYASQ@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: bestcomm: use platform machinery to get irq
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>, 
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_171701_653400_9F8EE94B 
X-CRM114-Status: GOOD (  31.27  )
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

On Wed, Sep 16, 2026 at 8:25=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Wed, Sep 16, 2026 at 03:41:56PM -0700, Rosen Penev wrote:
> > platform_get_irq() avoids having to explicitly map and dispose of an ir=
q
> > by having the platform_device machinery take care of it.
> >
> > This requires replacing the device_node with a platform_device in the
> > bcom_eng struct so that platform_get_irq() can use it.
> >
> > Conveniently, this also allows getting rid of of_node_get and
> > of_node_put as the platform_device machinery also handles that.
> >
> > Replace the open-coded resource lookup, request_mem_region, ioremap and
> > the manual iounmap/release_mem_region cleanup in probe/remove with the
> > managed devm_platform_get_and_ioremap_resource() helper. This removes t=
he
>
> update commit message, no devm_platform_get_and_ioremap_resource() in pat=
ch.
>
> > now-unused error-unmap/release paths and simplifies the driver.
> >
> > Adjust the goto labels in bcom_task_alloc to match what is being freed.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: resend.
>
> If resend, don't pump version.
>
> Frank
> >  drivers/dma/bestcomm/bestcomm.c            | 47 ++++++++--------------
> >  include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
> >  2 files changed, 18 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bes=
tcomm.c
> > index 241a91936fe8..1006030ff167 100644
> > --- a/drivers/dma/bestcomm/bestcomm.c
> > +++ b/drivers/dma/bestcomm/bestcomm.c
> > @@ -47,6 +47,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_s=
ize)
> >  {
> >       int i, tasknum =3D -1;
> >       struct bcom_task *tsk;
> > +     int irq;
> >
> >       /* Don't try to do anything if bestcomm init failed */
> >       if (!bcom_eng)
> > @@ -67,30 +68,32 @@ bcom_task_alloc(int bd_count, int bd_size, int priv=
_size)
> >       if (tasknum < 0)
> >               return NULL;
> >
> > +     irq =3D platform_get_irq(bcom_eng->pdev, tasknum);
> > +     if (irq < 0)
> > +             goto err1;
> > +
> >       /* Allocate our structure */
> >       tsk =3D kzalloc(sizeof(struct bcom_task) + priv_size, GFP_KERNEL)=
;
> >       if (!tsk)
> > -             goto error;
> > +             goto err1;
> >
> >       tsk->tasknum =3D tasknum;
> >       if (priv_size)
> >               tsk->priv =3D (void*)tsk + sizeof(struct bcom_task);
> >
> >       /* Get IRQ of that task */
> > -     tsk->irq =3D irq_of_parse_and_map(bcom_eng->ofnode, tsk->tasknum)=
;
> > -     if (!tsk->irq)
> > -             goto error;
> > +     tsk->irq =3D irq;
> >
> >       /* Init the BDs, if needed */
> >       if (bd_count) {
> >               tsk->cookie =3D kmalloc_array(bd_count, sizeof(void *),
> >                                           GFP_KERNEL);
> >               if (!tsk->cookie)
> > -                     goto error;
> > +                     goto err2;
> >
> >               tsk->bd =3D bcom_sram_alloc(bd_count * bd_size, 4, &tsk->=
bd_pa);
> >               if (!tsk->bd)
> > -                     goto error;
> > +                     goto err3;
> >               memset_io(tsk->bd, 0x00, bd_count * bd_size);
> >
> >               tsk->num_bd =3D bd_count;
> > @@ -99,17 +102,12 @@ bcom_task_alloc(int bd_count, int bd_size, int pri=
v_size)
> >
> >       return tsk;
> >
> > -error:
> > -     if (tsk) {
> > -             if (tsk->irq)
> > -                     irq_dispose_mapping(tsk->irq);
> > -             bcom_sram_free(tsk->bd);
> > -             kfree(tsk->cookie);
> > -             kfree(tsk);
> > -     }
> > -
> > +err3:
> > +     kfree(tsk->cookie);
> > +err2:
> > +     kfree(tsk);
> > +err1:
> >       bcom_eng->tdt[tasknum].stop =3D 0;
> > -
>
> avoid unnecesary change.
There's nothing unnecessary about this. irq_dispose_mapping goes away.
bcom_sram_free is a mistake here. It's not reachable after
bcom_sram_alloc. This is much clearer to look at.

Moving bcom_sram_free removal to its own commit is pointless churn.
>
> >       return NULL;
> >  }
> >  EXPORT_SYMBOL_GPL(bcom_task_alloc);
> > @@ -125,7 +123,6 @@ bcom_task_free(struct bcom_task *tsk)
> >       bcom_eng->tdt[tsk->tasknum].stop  =3D 0;
> >
> >       /* Free everything */
> > -     irq_dispose_mapping(tsk->irq);
> >       bcom_sram_free(tsk->bd);
> >       kfree(tsk->cookie);
> >       kfree(tsk);
> > @@ -377,16 +374,12 @@ static int mpc52xx_bcom_probe(struct platform_dev=
ice *op)
> >       if (IS_ERR(regs))
> >               return PTR_ERR(regs);
> >
> > -     /* Get the bestcomm node */
> > -     of_node_get(op->dev.of_node);
> > -
> >       /* Prepare SRAM */
> >       ofn_sram =3D of_find_matching_node(NULL, mpc52xx_sram_ids);
> >       if (!ofn_sram) {
> >               printk(KERN_ERR DRIVER_NAME ": "
> >                       "No SRAM found in device tree\n");
> > -             rv =3D -ENODEV;
> > -             goto error_ofput;
> > +             return -ENODEV;
> >       }
> >       rv =3D bcom_sram_init(ofn_sram, DRIVER_NAME);
> >       of_node_put(ofn_sram);
> > @@ -394,7 +387,7 @@ static int mpc52xx_bcom_probe(struct platform_devic=
e *op)
> >       if (rv) {
> >               printk(KERN_ERR DRIVER_NAME ": "
> >                       "Error in SRAM init\n");
> > -             goto error_ofput;
> > +             return rv;
> >       }
> >
> >       /* Get a clean struct */
> > @@ -405,8 +398,7 @@ static int mpc52xx_bcom_probe(struct platform_devic=
e *op)
> >       }
> >
> >       /* Save the node */
> > -     bcom_eng->ofnode =3D op->dev.of_node;
> > -
> > +     bcom_eng->pdev =3D op;
> >       bcom_eng->regs =3D regs;
> >       bcom_eng->regs_base =3D res_bcom->start;
> >
> > @@ -426,8 +418,6 @@ static int mpc52xx_bcom_probe(struct platform_devic=
e *op)
> >       kfree(bcom_eng);
> >       bcom_eng =3D NULL;
> >       bcom_sram_cleanup();
> > -error_ofput:
> > -     of_node_put(op->dev.of_node);
> >
> >       printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
> >
> > @@ -443,9 +433,6 @@ static void mpc52xx_bcom_remove(struct platform_dev=
ice *op)
> >       /* Cleanup SRAM */
> >       bcom_sram_cleanup();
> >
> > -     /* Release the node */
> > -     of_node_put(bcom_eng->ofnode);
> > -
> >       /* Release memory */
> >       kfree(bcom_eng);
> >       bcom_eng =3D NULL;
> > diff --git a/include/linux/fsl/bestcomm/bestcomm_priv.h b/include/linux=
/fsl/bestcomm/bestcomm_priv.h
> > index 3b52f3ffbdf8..cddde7c74cb5 100644
> > --- a/include/linux/fsl/bestcomm/bestcomm_priv.h
> > +++ b/include/linux/fsl/bestcomm/bestcomm_priv.h
> > @@ -66,7 +66,7 @@ struct bcom_tdt {
> >   * This holds all info needed globaly to handle the engine
> >   */
> >  struct bcom_engine {
> > -     struct device_node              *ofnode;
> > +     struct platform_device          *pdev;
> >       struct mpc52xx_sdma __iomem     *regs;
> >       phys_addr_t                      regs_base;
> >
> > --
> > 2.55.0
> >

