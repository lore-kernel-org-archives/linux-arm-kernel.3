Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B273BC83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzPxoOt7/PDx3OAhuOXlHFSJAQjWmG/j7qKRio0DXig=; b=fV6iJ0G0Dfi/04cY1WuEvVtKy9
	4Z+rcGLn9gPT9u88Qv9fqL6t4PDJgEnJPzL+u5dmmSIsLKSlY9eL5HpszbRNyEp/fcqWWnx5/IWf0
	xUEiZe4jRo3RK43umlVbbNiS8rEBoqhB7gqKElIx8KUZdVxmN0gTJIOQK46XEN/I+3YyG7NEL/2qR
	2Lyiy2l1NWEp2l1juIiSAlq3Y2oxmVEkX9p+6d8qam3kb0bubOc/M7Hkz9tQN4AoiHlQMBLN7vg5V
	SGzEUh2HDlycyCgeFyiIE3lCIYAU9Fm5EZuS82aKS8yiPYDl+CXcxj81u8GiE8cxYJPkSDXNI64zp
	xBWtJIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwZl-00000008K3u-2mGY;
	Wed, 02 Jul 2025 12:28:33 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvx3-00000008C50-3mvq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 11:48:35 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-86efcef9194so242053139f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 04:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751456913; x=1752061713; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzPxoOt7/PDx3OAhuOXlHFSJAQjWmG/j7qKRio0DXig=;
        b=O5x15Www9gLRliLi4EauYnfagbGC4h/oW8N4KX6Is0R+0x/IDO4K42DjutMVumE05V
         lg2UaO+xgEOOQHAEL9XGcTn1n99HP2G4TJoRRI2qZWxh3HayfaNbi3pPYKyyU5Z02293
         8gOGeWR1nKUIzW+0yrX39YEPx2Q5AjgNwLEEz4VGPQUqu4EKyIw3lMpSMFor1AkuVGOw
         7yC1ZUtwWvbTQt+YQNfbt0YOO5v3VKBTD1zZKGXjx0zDxlOf94/2BNglcHcL1H0fN88P
         D47df8WLp0YGEfOE4VhFtaK4b/twT9pEkZkaJvJqyAEk3AH0sPWHh6HUETb1oDO9j4hu
         Kl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456913; x=1752061713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzPxoOt7/PDx3OAhuOXlHFSJAQjWmG/j7qKRio0DXig=;
        b=Tw6G8vR9KUu6/s8pU8pR70pHzCmxE13klhLD84e6+Z86fgVSGIDfeRFU7ubcozREWY
         sEXs2hy7UYiNrfRuQHnEZe4628Ldwr0voUlYylqhdJAq0yvLQ5TwySGOID+FWAl3KWFV
         tVHJzcYva+fg1gkCaPZE0S8Dh0w+3LpGid2xk6z6fZgvsX541Ow5XS57nHtf0Cz/DvdV
         AuMyhi7SlvpU0kCXEvqGgTWo/kagln5uqz0Tggd6UJopj0AIgcXjhO7VOpp9E3NgnNng
         MNOVMEtOEAjHNvL+4M4x4oBnMKeC3Gs0yI+MawKdK+KbHBK/8xQJq4kyTqAXlvZDR0T3
         0kiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHGIgANf1qjl96M4esh3KAzJetQg2FrUTovE+uE+nCA5FjupT1dnC/JhoHgLUTz4v6nAe/p33XGr3MEe9tPuKR@lists.infradead.org
X-Gm-Message-State: AOJu0YwqkyqugSLam5VyQXfyGSvrTfJ1+qmzVcT/i3RLuzdLRbS0Jx8b
	JQsXT+12hDwY7AYKTIDQc2GeRmlM+VSUd0cvYWd2zKRMZyno+ouqckVg9RZuKojvLb2ypa0Z2gZ
	shI0WKv2VHal5q8mBLhUxUI5C6XZ/7T0=
X-Gm-Gg: ASbGncuPlAk3po9ncE+Wd4IlI9kc6PBYe6BIM8C/tZLjNnX6BTzpLnCVWHlUlyaN47f
	vJw0LYW32B0Ysd057jQjPnNo7zHedDpSFgkZRt5vHqKkSNH+aZo3KVZfnwRa9Y41GS+owVtdwzy
	lvIyB+pP7DYxl3z+0nuJz4xFDtBwXUD4MZMWIsvPyxUlpRDhZE+8VPeQ==
X-Google-Smtp-Source: AGHT+IEw1dzWm4QIwYZ3nobQC6Sl0JTwXZBOf8R8fgqREreP3zTUiwJZ1QMMnvhYh5RwfOmvgp90q36ljwFt6u6cKug=
X-Received: by 2002:a92:c244:0:b0:3dd:d155:94cb with SMTP id
 e9e14a558f8ab-3e0549795b6mr28666715ab.7.1751456912803; Wed, 02 Jul 2025
 04:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com> <aGLBvXtSRlaKujqM@p14s>
 <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
 <aGP-ZVuhBdd1GPLe@p14s> <CAA+D8ANtw1xTg7OQOFoDeQcdp05Eo9Uo1t=MKcGjtkSYfJqBVw@mail.gmail.com>
In-Reply-To: <CAA+D8ANtw1xTg7OQOFoDeQcdp05Eo9Uo1t=MKcGjtkSYfJqBVw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 2 Jul 2025 19:48:12 +0800
X-Gm-Features: Ac12FXxpIvbzeFcwinOMXn9TEBzcrnmh0tjz9irrB5pa_wug2azkcr5nRrXHUhc
Message-ID: <CAA+D8AP+RPJpY_=8WjSXoV_VB=9hP0NnFGjjUQHXcoDoz3fgfA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250702_044833_944929_C8EC3483 
X-CRM114-Status: GOOD (  38.93  )
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

On Wed, Jul 2, 2025 at 3:20=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Tue, Jul 1, 2025 at 11:27=E2=80=AFPM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> > > On Tue, Jul 1, 2025 at 1:05=E2=80=AFAM Mathieu Poirier
> > > <mathieu.poirier@linaro.org> wrote:
> > > >
> > > > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > > > Add call rproc_coredump_set_elf_info() to initialize the elf info=
 for
> > > > > coredump, otherwise coredump will report an error "ELF class is n=
ot set".
> > > > >
> > > > > Remove the DSP IRAM and DRAM segment in coredump list, because af=
ter
> > > > > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > ---
> > > > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remotep=
roc/imx_dsp_rproc.c
> > > > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct =
imx_dsp_rproc *priv)
> > > > >               mem =3D rproc_mem_entry_init(dev, (void __force *)c=
pu_addr, (dma_addr_t)att->sa,
> > > > >                                          att->size, da, NULL, NUL=
L, "dsp_mem");
> > > > >
> > > > > -             if (mem)
> > > > > -                     rproc_coredump_add_segment(rproc, da, att->=
size);
> > > > > -             else
> > > > > +             if (!mem)
> > > >
> > > > Flag rproc->recovery_disabled is never set to true, meaning that si=
nce this
> > > > driver was introduced, some kind of recovery was available.
> > >
> > > Actually since this driver was introduced, the recovery can't work.
> > > We didn't test the recovery function before. sorry for the mistake.
> >
> > Let me see if I get this right:
> >
> > (1) Almost 5 years ago you sent me a driver with code you did not test.
>
> Driver was tested but missed the recovery/coredump function.
>
> > (2) It took all this time to realize and fix the problem.
>
> I just realized that the recovery/coredump is one of the functions suppor=
ted
> by remoteproc.
>
> > (3) I should trust that, this time, you have tested your code.
>
> recovery/coredump has been tested.

I am not sure if we must power off dsp in .stop() and power on dsp in .star=
t().
because I see such comments in remoteproc_core.c
        /* power up the remote processor */
        ret =3D rproc->ops->start(rproc);

        /* power off the remote processor */
        ret =3D rproc->ops->stop(rproc);

So I moved pm_runtime_get_sync() to .start() and pm_runtime_put_sync()
to .stop()
in this patchset.

previously we called pm_runtime_get_sync() in .prepare(),
pm_runtime_put_sync() in
.unprepare().
If we can keep the power on/off in .prepare()/.unprepare.  maybe we
can refine the
.load function which is to move .reset to .load(),  then we can reduce
the code change
and not need to change the coredump scope.

Before I test this idea I'd like to have your opinion about this.
Thanks.

Best regards
Shengjiu Wang
>
> Best regards
> Shengjiu Wang
>
> >
> > Did I understand all that correctly?
> >
> > >
> > > >
> > > > I worry that your work will introduce regression for other users.  =
Daniel and
> > > > Iuliana, once again have to ask you to look at this patchset.
> > > >
> > > > Thanks,
> > > > Mathieu
> > > >
> > > > >                       return -ENOMEM;
> > > > >
> > > > >               rproc_add_carveout(rproc, mem);
> > > > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platf=
orm_device *pdev)
> > > > >               goto err_detach_domains;
> > > > >       }
> > > > >
> > > > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > > > > +
> > > > >       pm_runtime_enable(dev);
> > > > >
> > > > >       return 0;
> > > > > --
> > > > > 2.34.1
> > > > >
> > > >

