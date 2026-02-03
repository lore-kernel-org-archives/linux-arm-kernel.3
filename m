Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF7FE8305D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzMuEZYMn/hj9SYdAXLTnPBjRskZLNxUP6ZIZEqwunk=; b=nCETSPuyAYdCS0ejj0P0G3/4u9
	nfCo1Xk4TssHdowAPwa56TU3yUb0pyLXnrb9PYXwPJQKwZp2t9EgUex+HiAEptq5O0VNSDiZ1HFjH
	NnMq2yHfr+lTSCY2zL+9MotCNorxRRRKh+DUieTTAOrzbdbvIDk/SxwjdcFblEy5yiopD/2WfgyiA
	zorQYfM/nQkwJ5m9sGuaodtQ4xSReMie2YiuFGtPzaPkx6IbAJxi2gvVPq3b5hiiE+mn7t+lT6bcV
	BJDcsHgZq+79rsZ+LjEoP0Of+gwbDCqeIlwFXc+e/P+qOqLU6uymUoIRK9f3+hJhvN2P/joDe30+K
	IZu95obQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBBc-00000006GB9-22oV;
	Tue, 03 Feb 2026 07:51:00 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBBZ-00000006GAo-3ZfZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 07:50:58 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-12460a7caa2so8078378c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 23:50:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770105056; cv=none;
        d=google.com; s=arc-20240605;
        b=HtSH3QihcBb236KAo1i5zm2AMozNPob7qGOw1tORCMJHiRLfMzR28riN0LaCHupUGO
         zI4LKAR2PiaxeogTI4SsQY38DazKgARlaxFIvSV0M6f+vFJFVgkKL1dPYNNxuKsVu9Bi
         llnYzxz/E2U4YpHq6Soi/7y6LL/XPS/bg+HUIM23J134Ncmu4Dtq7ZIc8cGIIVljqZyN
         8YBLiGYOGnl6kE9ZMWki+da6ky3xFrLSoOpObcj1up+lCMPwKsHTFl4dEymOTSq8oWNY
         veG6uv5jxr9AjOqnYurIjyjsTLe6vzNNqDkTYDLcrTcRMZWwIYHuUwIW18Oos2FlG9Mo
         7EQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzMuEZYMn/hj9SYdAXLTnPBjRskZLNxUP6ZIZEqwunk=;
        fh=V57RlLG0WLRruI0EVLqCse1OIKubRRbaMUQ+zseqPCs=;
        b=G2kTOZERbd2INBRu9s2oWw0AcWRDt2b7h0pC5Uhxm/kaYDYHmSJupQL36v0pHLcoJs
         +g/yPOhfjNHRt44Iq89KP27FCj17QCwbGarmc3270Jbx6TmMGjGVi2RIa7GfFLb81Ebe
         rgx3+7DK1vylS30JnWzxDIW2TesmN2g9t0JUhsC3ERxQUw+4P+3+dCSOGUktTfyhwNDH
         KDgCdqUjUgJ0NQPy/jEzT9+Or/zLIv74+uJO3XqLhNJmp/wqGyeN/6ldqvGi1uSLpMOU
         aQFTAne5kdZCK4F+Eka5FberxXkO0KU/ehI4JumTigBVyP+zMiZk9xmM6zO0ORZzyAz1
         W3yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770105056; x=1770709856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzMuEZYMn/hj9SYdAXLTnPBjRskZLNxUP6ZIZEqwunk=;
        b=iZdBUgFPUgQPBPtifYhExzk1kqCbWo36e5FHIKDSOIlrjdPDi8YcXdC6G95vBcPRs8
         Dur/gpAHs5QUq27M/lZR8wr0lWjfQnx35Rb8VrpySy9ZalE8ZvsAZZbDCvazMdIQhlQr
         SOc3lQniUSWp53qA7Vnzqq0CiYBcnkzo+VlU2LFQULwYkMKkHGLQyYS0qn9jYUvBiEVr
         4JDua2k9Kcw6KXd30sg22odkJhzQJbLLFs+CWx+hk4oyfYNpXnlDdvU+5srRIbNPahVp
         akRnqQ5YVJAgjg/maRNqkN2weY2TFJdG1V3jk1Sk8M6AxzomSpMJe3CWMOAVG/yU8Jha
         Sxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770105056; x=1770709856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dzMuEZYMn/hj9SYdAXLTnPBjRskZLNxUP6ZIZEqwunk=;
        b=PRc7JkKfS8haAuz5k3hgQo2t6rMq/Aa/N1STbVO8Y+sBTn/INrQdrTFsKa7CduEDdW
         WE7F9wmKD4CB9A09uPT5PbVSEVP5L8AwRYcwZzCNguyU9IIofhIao/gnQsX6bDkuHbvY
         KuzZwbKh5QoTLkFlnWBwNNhOu6wuyvkyEEvBnL2FhMv6nCnBSpxxp7bH09k5xXisvJQu
         g0EYuG/02g75F+7JMLKtizPZFsbCPuJlBsDWe5UwxQknuLykcz7qtG1zALOWdt7sbXGi
         2dWtMb+pYAbVuGUlODoqfhB4KqBTD4YQXFLITzEcdWfIEAhWN9makAqweMBRsRxbY79n
         PrHw==
X-Forwarded-Encrypted: i=1; AJvYcCUDeO4Iwq++ivfnM58bdbXyAHfMLMH+tIxi7A0g4fQ5Q+aTjK5k/MC34PmCFGyNai7j6QZGgcVES5TqzbdwNvWL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbsbu7m7frinAmwjLE88zSKsBqzItghJ+KSDDWkaUeCGsuLc2L
	9kkdEfTo7XJtyzvFZ+C8yALMeBcGsll7sBZQjouT5bytdFplBEmh2u1teOyxIQ3+dnsRKUFKpZR
	EHeMNqWcVCr9EhNcU6naYDMTntn2xWCE=
X-Gm-Gg: AZuq6aILAnjMRl9jCgRzoyi+6CA4vRmhu8gHgIngbQteY+xgtEF22z3Zh4vY6nC+3em
	Hz6J26EqeH2Wl3PalGuF/j5H02DC6odbSbL/OnmhPqw8AU9my8ay2uvIX7YY+jKeSO5SIWBgVB8
	IlT2pT0A0KdhDOFglqEicf08K5SNjt4tHxLUcVM2LGYLVE95rTZlHhFlvOiD9Mt+ONty8iNfEsk
	rqnvdN5leD3mXMGulCAqQHqHjGYIeffwWFmGepfC4J6FwA4RSKgaVO9qSAHMbBll27Bl7QOkKUZ
	XD7REAwT61hPZ5RrYndxzOPGnx7hYWVji9RpsIy2aY4yE5A36xRzb2ezNcroxSt/VUFogGDBEfE
	vHd59SCsM7w==
X-Received: by 2002:a05:7022:41e:b0:124:9e46:82fb with SMTP id
 a92af1059eb24-125c1010d65mr5955626c88.38.1770105056409; Mon, 02 Feb 2026
 23:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
 <CAEnQRZA-nMai9-CEdMqnr2drqBRXXPOKE3a+_3j4S_=x-bM0pQ@mail.gmail.com> <aYDN6X0WVT9nV8fg@p14s>
In-Reply-To: <aYDN6X0WVT9nV8fg@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 09:53:38 +0200
X-Gm-Features: AZwV_Qi4gqYVwTTFEPdJsETuT6WyCitJtTK7rW3QVszmKRnozagvutFj3QflZ74
Message-ID: <CAEnQRZBVhijvq0VRTKXpW7va2Dxprzz-cnvvj=z90FPXRK+TSA@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx: Fix invalid loaded resource table detection
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Frank Li <frank.li@nxp.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_235057_900820_3799EFC9 
X-CRM114-Status: GOOD (  36.01  )
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

On Mon, Feb 2, 2026 at 6:16=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Thu, Jan 29, 2026 at 06:02:21PM +0200, Daniel Baluta wrote:
> > On Thu, Jan 29, 2026 at 3:45=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nx=
p.com> wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> > > resource table even when the current firmware does not provide one.
> > >
> > > When the device tree contains a "rsc-table" entry, priv->rsc_table is
> > > non-NULL and denotes where a resource table would be located if one i=
s
> > > present in memory. However, when the current firmware has no resource
> > > table, rproc->table_ptr is NULL. The function still returns
> > > priv->rsc_table, and the remoteproc core interprets this as a valid l=
oaded
> > > resource table.
> > >
> > > Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table()=
 when
> > > there is no resource table for the current firmware (i.e. when
> > > rproc->table_ptr is NULL). This aligns the function's semantics with =
the
> > > remoteproc core: a loaded resource table is only reported when a vali=
d
> > > table_ptr exists.
> > >
> > > With this change, starting firmware without a resource table no longe=
r
> > > triggers a crash.
> > >
> > > Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook fo=
r find_loaded_rsc_table")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Changes looks good to  me >
> >
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc=
 *rproc, const struct firmware *
> > >  {
> > >         struct imx_rproc *priv =3D rproc->priv;
> > >
> > > +       /* No resource table in the firmware */
> > > +       if (!rproc->table_ptr)
> > > +               return NULL;
> >
> > I wonder if we can make this change generic because it should happen
> > on other platforms also.
> >
> > Maybe something like this:
> >
> > remoteproc: core: Only copy loaded table when valid
> >
> > Copy resource table in memory only when:
> > * the current loaded firmware provides one
> > AND
> > * there is an explicit request to have the rsc table copied in memory
> > via rsc-table
> >
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1281,7 +1281,7 @@ static int rproc_start(struct rproc *rproc,
> > const struct firmware *fw)
> >          * that any subsequent changes will be applied to the loaded ve=
rsion.
> >          */
> >         loaded_table =3D rproc_find_loaded_rsc_table(rproc, fw);
> > -       if (loaded_table) {
> > +       if (rproc->cached_table && loaded_table) {
>
> But we would be doing the check for rproc->table_ptr twice (->table_ptr a=
nd
> ->cached_table should be the same).  The way it is currently writting for=
ces
> vendor specific implementation of rproc_elf_find_loaded_rsc_table() to do=
 the
> right thing.
>
> The merge window has been pushed by a week, giving me an opportunity to m=
erge
> this patch.  Should I do that or should we continue discussing the best
> approach?

Let's go with Peng's approach:

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>

