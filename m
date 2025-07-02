Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0E2C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 07:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlKXcUS3jg408kymTooqcQurJM+0HaAxwssjdjwXTBw=; b=Kr+VKOFSsJES2W9bMUOWlM6gQv
	4aor7zCcfP9dNZxfZk47pWCPp19HXPhqGcRuqLoNtR1sCIfgK1KPqhMNcZzvbRV1xhfY0/oBztjX+
	kF9AZuBa3zVTRsY3tS36pTTczVerVLsEbhypb0UP4x/5CtSBxz+9YX3V+vzrwJeB4ZHMNOffNKX61
	oV7txZ8WrqK/bjgE87BPSgaKeQNgYtNxYiBq3HamjhbQpAMyccv28FFGE0fUFmywzLuJuouKp9XvB
	3yGP/mM8HKBfZRNBuU80nUUScQlOoD1gryejko3Yfu0hx34RKkKyC4znHs7PyaDmSM9vW1KBxvI0q
	gHZdGDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWroX-00000007UX1-2uCP;
	Wed, 02 Jul 2025 07:23:29 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrm4-00000007U7u-3yHx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 07:20:58 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3de18fde9cfso22743535ab.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 00:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751440856; x=1752045656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlKXcUS3jg408kymTooqcQurJM+0HaAxwssjdjwXTBw=;
        b=GSgwIILGpR7tK5zlO75Ddorc0wHBcHZTMOBMTW5fn6ynhd7Pq3kRTKTQRVkcyAYBYS
         cR7JC/nFbp1k8oIIfiqptZuBiQbdYBRbuFwO9VKYZ2VUDlTqz1nomJFwryo14y7kHrWK
         L92/sAPfSZOERvL8WxG972HPPbwwSHpW2SrYAeVmv/AXBBVP90gCwGAUsnfMOlGMC7BZ
         i26A5Pse5y9z6yYiFYfnvRL74f4MrInWiR8A9l4Yqc2pzmFwcPMFdbI6x67JnIQDMWIU
         f72/TAUlaZFQ9atIapSMzfbMmxbIBSAcATiq22aKZstx6zFsSOx5GmuNbLQsYKt9lpor
         ll/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440856; x=1752045656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlKXcUS3jg408kymTooqcQurJM+0HaAxwssjdjwXTBw=;
        b=qgnCotASEQt+CxX09j9CpEqEjex4CRHh8oNIhxMADY3h4fM74nyHNXj8/jeGDRKjF/
         gyNGeHCuEKN7bX+gBy2TB0CWYZLuavIzUJkAN1/RQ3zMmkAlqbIq40meE4nyU6/cPY8l
         sWIVJTZXCSg2NCFmz+xzW7hQ6Gm3H5Xxaa33/+AlM+/xUcBDmgdFDy5YbOuJBT9tNyLe
         OJw2AZmv33IpQedHFjPyrOxfry3oIK76hGNq3Ww/vei4UeqZOP1KYYeMQbRmSVItOIDM
         pyedH1hz9J3S7Qvz1gcWic5469BzYy8ecw7loVCoMwACZxiKtlGqiQUvQOxie3mMLFb3
         XFbA==
X-Forwarded-Encrypted: i=1; AJvYcCVhaOG7zJsqQqOha3iN9BLPMTW8qvHd2HDntayyBhbVsN/znTfs4Tv+ptsQRlCcFRuOfpaJteHN3iTSj4IGUT+S@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0Bi2ztj3B5EFl66ttZ6LeWdBJkuEl9mk1B+2mY7ZXSmQJDZUW
	3P1166t0RPLLd3DG1+tnvDS8SFr8cAvYO2WrinsiGZ0p55FatrfFdkVqfZY/df6DmKmt764ZofF
	PSBDMBBlSlwzjHZYMHtVVSO7xDjst9yg=
X-Gm-Gg: ASbGnct957A0XwJD02KBmXGumAEZLMdBY86wcvIlQcpEBK7hxypPr7j/+hZF2bNHLxi
	4T0/5RZhbDC1NyqxX5m1X5IxnYed1iZw2YsMJNg5+XEciAJRI5IgvyAYwC3sFHNtKdNc9taJ61o
	jfhNf6J/NH4PrA3J5IFuNkSx7bl2FpXibgzeSbGv1cwVk=
X-Google-Smtp-Source: AGHT+IFHgMa8Mngls2xpKyZO5bXtEpSnlalV27UKMs8KgtahvMNmHCQIvV4/VqDTKCW7KQqdACPzThHXTAdqppHtWsk=
X-Received: by 2002:a05:6e02:1a61:b0:3e0:4f30:c951 with SMTP id
 e9e14a558f8ab-3e0549c655bmr22307415ab.14.1751440855622; Wed, 02 Jul 2025
 00:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com> <aGLBvXtSRlaKujqM@p14s>
 <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com> <aGP-ZVuhBdd1GPLe@p14s>
In-Reply-To: <aGP-ZVuhBdd1GPLe@p14s>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 2 Jul 2025 15:20:34 +0800
X-Gm-Features: Ac12FXxqvi6u6raIhWimY1G1UCrc7Xt2DJUxgPMKdt9-02GjFtqtqI7XWKxLVQE
Message-ID: <CAA+D8ANtw1xTg7OQOFoDeQcdp05Eo9Uo1t=MKcGjtkSYfJqBVw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250702_002056_985468_4B7902AE 
X-CRM114-Status: GOOD (  32.18  )
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

On Tue, Jul 1, 2025 at 11:27=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> > On Tue, Jul 1, 2025 at 1:05=E2=80=AFAM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > > Add call rproc_coredump_set_elf_info() to initialize the elf info f=
or
> > > > coredump, otherwise coredump will report an error "ELF class is not=
 set".
> > > >
> > > > Remove the DSP IRAM and DRAM segment in coredump list, because afte=
r
> > > > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remotepro=
c/imx_dsp_rproc.c
> > > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct im=
x_dsp_rproc *priv)
> > > >               mem =3D rproc_mem_entry_init(dev, (void __force *)cpu=
_addr, (dma_addr_t)att->sa,
> > > >                                          att->size, da, NULL, NULL,=
 "dsp_mem");
> > > >
> > > > -             if (mem)
> > > > -                     rproc_coredump_add_segment(rproc, da, att->si=
ze);
> > > > -             else
> > > > +             if (!mem)
> > >
> > > Flag rproc->recovery_disabled is never set to true, meaning that sinc=
e this
> > > driver was introduced, some kind of recovery was available.
> >
> > Actually since this driver was introduced, the recovery can't work.
> > We didn't test the recovery function before. sorry for the mistake.
>
> Let me see if I get this right:
>
> (1) Almost 5 years ago you sent me a driver with code you did not test.

Driver was tested but missed the recovery/coredump function.

> (2) It took all this time to realize and fix the problem.

I just realized that the recovery/coredump is one of the functions supporte=
d
by remoteproc.

> (3) I should trust that, this time, you have tested your code.

recovery/coredump has been tested.

Best regards
Shengjiu Wang

>
> Did I understand all that correctly?
>
> >
> > >
> > > I worry that your work will introduce regression for other users.  Da=
niel and
> > > Iuliana, once again have to ask you to look at this patchset.
> > >
> > > Thanks,
> > > Mathieu
> > >
> > > >                       return -ENOMEM;
> > > >
> > > >               rproc_add_carveout(rproc, mem);
> > > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platfor=
m_device *pdev)
> > > >               goto err_detach_domains;
> > > >       }
> > > >
> > > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > > > +
> > > >       pm_runtime_enable(dev);
> > > >
> > > >       return 0;
> > > > --
> > > > 2.34.1
> > > >
> > >

