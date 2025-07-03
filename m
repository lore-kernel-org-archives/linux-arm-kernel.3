Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A972CC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 09:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQxlXjimiWOLNlkmt82ETYNH1B4xm8nZuHa4F1eDm+Q=; b=Sz3H4IrQGcZBcmabbB5XF5ETaQ
	Om8knDfRMD36qCm23aVqvwVRiAtr9stmavBINqw4x4XbDdHPUVy2F1YoyHE9/jJLkhoiG+fkGTQOB
	cun9mgEqJQLEhjcjqlb7np49jVHUKchaiy52U5tYX59ky+f6xgS13acdI+0ZzFI1aZe7oyKSnNZXC
	1VlacH1LqQjwW0xdP7dBO6sVKD2/JcJqIWF7u30ivwr8gGNyW2bMyfiMzlpr6y6w2d4MqZ5J8fUuM
	jyj2DhdaMe0kOhqlNH2NGh6+VFbSyewR/seeaRvZgxZNHSPat+t6Df11FmbnuC4Axb6bl8McXUMmr
	U2NE1sAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGO7-0000000AqkV-20uW;
	Thu, 03 Jul 2025 09:37:51 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGC1-0000000AoaU-2hDU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 09:25:22 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3de2b02c69eso31859795ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 02:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751534720; x=1752139520; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQxlXjimiWOLNlkmt82ETYNH1B4xm8nZuHa4F1eDm+Q=;
        b=EDN+BfkBv38f+tgfCVxkXaz4Qmw5xAjVdDgIX4WOspq86UYxX+3IrTbCToEcxMDq6j
         Lq4Sh0OXP/PN1OR79sAnbI7m9sxl3E+ovrnrap/Ivl1z/mkkF4XzTuRo/e2n2o45X7Sw
         y5oJeRxyUlBwFvqHIoBJgm/zSnVJS8fLVT0ze6VnCGcZ0+mbeXqs+E59r/bygmDBCRWe
         cmFEabKnCyD7ha+0qXR32+UdHhr3wLSH5fgDC+LxntPGTpwSwM5L3dEfSHplJ9KjNUyz
         XNlPyVxe71c0/zIDDeOCUfNefIUU0pWS2DUlNECNn0JMWuy7QQ70RCB4QNDhCrOhP0Xu
         5izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534720; x=1752139520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQxlXjimiWOLNlkmt82ETYNH1B4xm8nZuHa4F1eDm+Q=;
        b=nwAtzVssCnXA7qK63wEFxB5HzR6bXSp6MegYQ+DX7XvYhDfELy+GXvSk+AxrQuGGhj
         9glRz5hwfRSYRfIZ8UHgIHE52hnCR6wqas36WoO01yywG7dN0aUiCWuBuNzThK4iRO1V
         QYFGMURrjXyeOKewKSKM5qekZpZ+H/HN9ePsJw4IWV6SeYeyb/lECI9HfBTSMYgZRSjQ
         QDz90/dhu2Rw/oOMj7Dkqwm7/mEMviSYsk/C87TgWC9yJbPKhxBX+2lNt7MshT9cvvgZ
         /ndzyyYQeG11zK7A0xZA8aBzOtXewxcidq+0/nFtyS+YVqKkTIH5wPp+Vt49gtJiYt0c
         qkXw==
X-Forwarded-Encrypted: i=1; AJvYcCUvcVjEPP8BDSJB8/6lKuSXAXoM7r6UlEpaj6OcK8NMyPIoiSJ9BQzyefaEaXZbU6vpNzuUFf1CZckcTbLK+At1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn9u11HjnTosOj8UwqiLcq/LMGopgSIcAOKSmkRYb9PuKGXL+f
	RO0sDHwgz37/ipUxiWSeDz3qC3n0UBPg2VimILeYREU2EYkgLaFLDcf4BkTFofOt7Upiv3yzg4m
	oXMUGrGdUR4ZK3xhwv6B/5dPTHIsdJOs=
X-Gm-Gg: ASbGncuWtqTKpGJfSNnUWKdPwK/6M9KiPDRXFyzzRxDBiXJ7tEhtsg+dKNz2Yn+XCUa
	h5+1DHAifoERKBxztxS9D1hUW09njaxolkFC4iPxlG9+KBoqHDPnbpuN1BGdjPbiEJb/alAucDd
	DQNhJbaxoXO3LM71XQsYz2yUWEVujgdkJMv9nW+aHrWHg=
X-Google-Smtp-Source: AGHT+IExz9aStPQQU5jTE1Po0AQPZakEiqsbSsJKe7wO8kX4S2jJmJUZEYtD2nu7s7tlGuCMRGGTZawMXfUO2V+vIVY=
X-Received: by 2002:a05:6e02:2183:b0:3df:4024:9402 with SMTP id
 e9e14a558f8ab-3e05494a935mr73959465ab.8.1751534720124; Thu, 03 Jul 2025
 02:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com> <aGLBvXtSRlaKujqM@p14s>
 <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
 <aGP-ZVuhBdd1GPLe@p14s> <CAA+D8ANtw1xTg7OQOFoDeQcdp05Eo9Uo1t=MKcGjtkSYfJqBVw@mail.gmail.com>
 <CAA+D8AP+RPJpY_=8WjSXoV_VB=9hP0NnFGjjUQHXcoDoz3fgfA@mail.gmail.com>
In-Reply-To: <CAA+D8AP+RPJpY_=8WjSXoV_VB=9hP0NnFGjjUQHXcoDoz3fgfA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 3 Jul 2025 17:24:57 +0800
X-Gm-Features: Ac12FXwGsyCT-FrKcuI-KzJt0SyzwBQ-E9tIqBn9TSAoTP3Lnf3fS8E6YzQ5JhE
Message-ID: <CAA+D8ANdfOr=iyJQqE9_k+JUCRin2KXOVf9zL6BVxRrV0REvqQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250703_022521_684503_C69DD4D3 
X-CRM114-Status: GOOD (  42.93  )
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

On Wed, Jul 2, 2025 at 7:48=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Wed, Jul 2, 2025 at 3:20=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
> >
> > On Tue, Jul 1, 2025 at 11:27=E2=80=AFPM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> > > > On Tue, Jul 1, 2025 at 1:05=E2=80=AFAM Mathieu Poirier
> > > > <mathieu.poirier@linaro.org> wrote:
> > > > >
> > > > > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > > > > Add call rproc_coredump_set_elf_info() to initialize the elf in=
fo for
> > > > > > coredump, otherwise coredump will report an error "ELF class is=
 not set".
> > > > > >
> > > > > > Remove the DSP IRAM and DRAM segment in coredump list, because =
after
> > > > > > stop, DSP power is disabled, the IRAM and DRAM can't be accesse=
d.
> > > > > >
> > > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > > ---
> > > > > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remot=
eproc/imx_dsp_rproc.c
> > > > > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struc=
t imx_dsp_rproc *priv)
> > > > > >               mem =3D rproc_mem_entry_init(dev, (void __force *=
)cpu_addr, (dma_addr_t)att->sa,
> > > > > >                                          att->size, da, NULL, N=
ULL, "dsp_mem");
> > > > > >
> > > > > > -             if (mem)
> > > > > > -                     rproc_coredump_add_segment(rproc, da, att=
->size);
> > > > > > -             else
> > > > > > +             if (!mem)
> > > > >
> > > > > Flag rproc->recovery_disabled is never set to true, meaning that =
since this
> > > > > driver was introduced, some kind of recovery was available.
> > > >
> > > > Actually since this driver was introduced, the recovery can't work.
> > > > We didn't test the recovery function before. sorry for the mistake.
> > >
> > > Let me see if I get this right:
> > >
> > > (1) Almost 5 years ago you sent me a driver with code you did not tes=
t.
> >
> > Driver was tested but missed the recovery/coredump function.
> >
> > > (2) It took all this time to realize and fix the problem.
> >
> > I just realized that the recovery/coredump is one of the functions supp=
orted
> > by remoteproc.
> >
> > > (3) I should trust that, this time, you have tested your code.
> >
> > recovery/coredump has been tested.
>
> I am not sure if we must power off dsp in .stop() and power on dsp in .st=
art().
> because I see such comments in remoteproc_core.c
>         /* power up the remote processor */
>         ret =3D rproc->ops->start(rproc);
>
>         /* power off the remote processor */
>         ret =3D rproc->ops->stop(rproc);
>
> So I moved pm_runtime_get_sync() to .start() and pm_runtime_put_sync()
> to .stop()
> in this patchset.
>
> previously we called pm_runtime_get_sync() in .prepare(),
> pm_runtime_put_sync() in
> .unprepare().
> If we can keep the power on/off in .prepare()/.unprepare.  maybe we
> can refine the
> .load function which is to move .reset to .load(),  then we can reduce
> the code change
> and not need to change the coredump scope.
>
> Before I test this idea I'd like to have your opinion about this.
> Thanks.

Today I tested this method, it looks good, the code change is smaller.
I will send v2 for reviewing.
Thanks.

>
> Best regards
> Shengjiu Wang
> >
> > Best regards
> > Shengjiu Wang
> >
> > >
> > > Did I understand all that correctly?
> > >
> > > >
> > > > >
> > > > > I worry that your work will introduce regression for other users.=
  Daniel and
> > > > > Iuliana, once again have to ask you to look at this patchset.
> > > > >
> > > > > Thanks,
> > > > > Mathieu
> > > > >
> > > > > >                       return -ENOMEM;
> > > > > >
> > > > > >               rproc_add_carveout(rproc, mem);
> > > > > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct pla=
tform_device *pdev)
> > > > > >               goto err_detach_domains;
> > > > > >       }
> > > > > >
> > > > > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA)=
;
> > > > > > +
> > > > > >       pm_runtime_enable(dev);
> > > > > >
> > > > > >       return 0;
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > > > >

