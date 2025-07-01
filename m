Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636AAC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 02:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91yySp7IEuhSE1PwOF3J2WsUjq77GATEHz2Vvz/SSnw=; b=x9SLwBCVBvbP9PyroBYX9U8GEz
	MEA9azaw/It58Qwcr8zpnWub0CUlvrNV/EqkqvooaiRCA9UdFuP+aZ6LdjX9p6x35MvmdNyTQ81jx
	4XGPJvYC52MAn4bhWmfoACA+nTny0BJKlLd318K5ocV5/0uX71i3wweHGNhUHxAHRec8Aj+mkWXg9
	//ahto6TjDrkgJSPRJIWv7jhL8cloii5eJFUJzwPSjwSToKkV4DV0V+ePsJACo0kPYLMhaB2YoHBe
	XG/8K/QBaraPTsQBbqcx4xSINKJSu73+zUoU0VxW6EKAN+JuxSTOQ02vqj+SK5RONELutS1o3MbAC
	VTTbgS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWQmC-00000003s1n-0LJR;
	Tue, 01 Jul 2025 02:31:16 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWQjr-00000003rxV-3sQp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 02:28:53 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-87404493fd2so231719839f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 19:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751336931; x=1751941731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91yySp7IEuhSE1PwOF3J2WsUjq77GATEHz2Vvz/SSnw=;
        b=XuPKKwd3cZc16hhrhzRoEso+xehmlF8Ml+6cop+2HHq9w8exhtC90wYxE6QY/66MYm
         eSVplJyZzt4rF07cSnAwk535HGFlloGsMWhBludzxC/ML5F5x4Y7xspQMhV4+/ra+Mur
         A97GgIVgJPIVti6EE015BFAgQjqfZs4S46jT3NRNRyo3KdDdKOAU5Sklch1PRQFP7zJo
         NnDCjLn1pJ1sbKjfyqaB4OZhm0S2xGP4ObqNTUD17sKJ+uNcXFzJRksmwiCN1nC+kTKl
         D23jdmKGqSL0jA2ho9oskeO5xjMJjG4sd4clOjYSkYDHFCte1OdVBsSM9/4KBR7PukSl
         kMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751336931; x=1751941731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91yySp7IEuhSE1PwOF3J2WsUjq77GATEHz2Vvz/SSnw=;
        b=HV7yiM7QnRLWXKJK0zhxOMf3C1/tj/ITdZX7CjO9iipT8s83IGL0aNHQ0D0fq0PAJ5
         XpatRpd5WwlQlabrpj39LVi3mngTWgpFKfAwU+pnJxIGV81SzUB6AOCy6jH/7XpP/FRx
         a7pGFivpxE6MNOt/KMU5PfhR3ICbpv1LMWlu9GHcgWrq7j8if66oIrDkA8KvSZ6h4wQe
         ryJfvLCi1hJc1kgBGh7i04kV8LBog9OToGNuC17MADyppVcoGYdXzqo3Yqb5isnFYu8R
         NP8ez70VM/9j96zL0CoMn10IJj+bdMSVfVSxQYBLEez00CtRYOd4JJA/G136KM6hqk+0
         DxKg==
X-Forwarded-Encrypted: i=1; AJvYcCWPzqtVJZnrHGPl0LCMmspIu1NhalXB+1x6eqELQi7TnBdBHU/au/51CFi1io56T130s6OnyDTGtU87s+XJAuA/@lists.infradead.org
X-Gm-Message-State: AOJu0YxWNsaNul5BPYSBiAl3HMQkD8QzmhTonSw4njITSBfv90MHwTXV
	0e1lrJZSi6pnAXYL/a5q8ma+G8bduLXL8bNP4x2sh3ozbQRlOvH25VpFw8TDLZ7aAq4DXKWIx2W
	Rpdn1oHIumtq8CXaAk0yK2Ih0Nr9y0/I=
X-Gm-Gg: ASbGnctismCTZuu+Xoj+EqmpUd64FzEBcBQJpWpX/orDPIck+nCg7ZsFJjKLJ3H6uUR
	rZPb0sbL5A8irvS+l7agm3SI8XGyYtCshgs1dzjy1sHn6DkYhqnzkwy9DdA8en443At/tD1A1/e
	WZSA1b1MGBwzgvfp01jcGFuZpgBk3qJl6H2jwZZuNow8w=
X-Google-Smtp-Source: AGHT+IEaK+Oqxa1UESMKPoud+tU+k8pmCnsDP4v/QP35UzAfFMMddZZHfS6lrrDcwsfSXwaF4LiN3WkQsGFbM229xa4=
X-Received: by 2002:a05:6e02:1c23:b0:3df:49b0:9331 with SMTP id
 e9e14a558f8ab-3df4ab56743mr192074945ab.4.1751336931069; Mon, 30 Jun 2025
 19:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com> <aGLBvXtSRlaKujqM@p14s>
In-Reply-To: <aGLBvXtSRlaKujqM@p14s>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 1 Jul 2025 10:28:33 +0800
X-Gm-Features: Ac12FXwmhVBFMgE6Fak7mzjMWtYs4A9XOu6UqBu7aKxFpRZeBK5SE4ED-1Fjy5k
Message-ID: <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_192851_967950_AAF5EC2D 
X-CRM114-Status: GOOD (  23.85  )
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

On Tue, Jul 1, 2025 at 1:05=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > Add call rproc_coredump_set_elf_info() to initialize the elf info for
> > coredump, otherwise coredump will report an error "ELF class is not set=
".
> >
> > Remove the DSP IRAM and DRAM segment in coredump list, because after
> > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 9b9cddb224b0..9e7efb77b6e5 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_ds=
p_rproc *priv)
> >               mem =3D rproc_mem_entry_init(dev, (void __force *)cpu_add=
r, (dma_addr_t)att->sa,
> >                                          att->size, da, NULL, NULL, "ds=
p_mem");
> >
> > -             if (mem)
> > -                     rproc_coredump_add_segment(rproc, da, att->size);
> > -             else
> > +             if (!mem)
>
> Flag rproc->recovery_disabled is never set to true, meaning that since th=
is
> driver was introduced, some kind of recovery was available.

Actually since this driver was introduced, the recovery can't work.
We didn't test the recovery function before. sorry for the mistake.

>
> I worry that your work will introduce regression for other users.  Daniel=
 and
> Iuliana, once again have to ask you to look at this patchset.
>
> Thanks,
> Mathieu
>
> >                       return -ENOMEM;
> >
> >               rproc_add_carveout(rproc, mem);
> > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platform_de=
vice *pdev)
> >               goto err_detach_domains;
> >       }
> >
> > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > +
> >       pm_runtime_enable(dev);
> >
> >       return 0;
> > --
> > 2.34.1
> >
>

