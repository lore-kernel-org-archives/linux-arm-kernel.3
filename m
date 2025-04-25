Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA6AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXs9FQjEaSP6AkNuUDmsL7Vk1LpHpl5rslliTD8xE54=; b=t1HDBrr8IuJdhpVRT7/JNxtf8O
	Iz5Iw4otHwAZjTPWQ2qrg2xGuEMfEmuaBEsoWOqe39S+qaHhJU7nNqL9kpewa2pbJg7yqHFh9rZnz
	i3yMMNXMfccCilNNTjXbgQUhOtF+ufk1EnOR6KNN0U+25/5bILJ1zGOvWU31jOZ+RT7NKQrK2tIjI
	XzYXQmRnAEbjfIw7uWZx6MBwtdsYtKtxTE+fqYOwYGEPiPiAfb7cghlR/g0X77bT8FQqnlXNW80a7
	LS0wdJrpftvMZeZoH0jgdszmZn1dj7qXRVmdFuMb5t132GzUnashdYMXGjzwPM4qH8vbTDlDTBdz8
	uzoAz4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MUJ-00000000KV0-239J;
	Fri, 25 Apr 2025 17:05:19 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LFK-000000005qF-0GMq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:45:47 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so3554582a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745595944; x=1746200744; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VXs9FQjEaSP6AkNuUDmsL7Vk1LpHpl5rslliTD8xE54=;
        b=xsGh00JGYOoIkTm/q38eBtNBUyeWKGpIYWPWJnc/pDG8i35sp+wum1WwoaFa+ngmSN
         r+fEqSWy9Rdq1Av8W8dStPdAUQWT7F92ey0GADOV5ulKRjNwtVmrAtX8aPoCPqocQZ4b
         sXnwR9o1Afz1Qpp+1A2obUnuzsPjYAHrS4K7OMUP/G67hm4/l1JRHPpLNW1w+bFxsezL
         GLDaqyKaguMjgh+nJIgL+efULXSlX4T90AS7ANexqzZrsSCYuTrNFNAWcwDoDciswiFc
         x17Z93w9zFmy7aBinXymRVGKQ5NANByIQ7ItAt1yd7WuybVTlhcnksIkVRPsLKxZ/PbH
         1PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595944; x=1746200744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXs9FQjEaSP6AkNuUDmsL7Vk1LpHpl5rslliTD8xE54=;
        b=hyTSFd7bQKIjc4uliD4hg8SEsKOdGNZ5O6OeOOFu9i1mECMJr87tp60SBE4IuDhnl8
         SSulJ/q3FxGY105ozgzHRVpB4Vu+JOGeNwHik8laQbYB2HaC8rrLdi4LtyaQTIb/3Ur0
         gJAwEnnAIdFVqsfbGoC8usmHcyqlq5Y5Ru/CszKu4ivObt8gInKCfJxeYgz8RmTiGiY9
         AHdyR/3FJqqoCVsh8PM8uogZqQX1aNxvzwhFnaB9JXDjT9TZuDodRXXNN1zfa5gJWMmD
         KyKpVQXJR4rihLsbGsZCBQglEotgQjkPztLsBdWeGgruTgUUc+AHIASTg5tSmycOIkab
         Cpfg==
X-Forwarded-Encrypted: i=1; AJvYcCWFSL/HCfYwQ7VIvWrERVt6pOKTpq2fYQPedY0iCdcF0xOl+5DE5chi6nEJRfbT6fCAfg5cV+K6d+Tj10GuVYFF@lists.infradead.org
X-Gm-Message-State: AOJu0YyynkhVxf2vC74KZTzyrKHSnioXZRPFmk66LWcBAd40dIEw3PCH
	Ah0yPST5baid4qUmVepl25KpklbyqDVd++9e4YEaL4zonKXewPeeJbaGdkry/YgSGxyALTJIpPy
	XlMKhvnxJs3GInYAg6cpS9qrEaTfb3C/njJ5mgQ==
X-Gm-Gg: ASbGncsuFVtv9oj5BBS+ewYSwWI5pzeRjQpSabQOMpO0PC3cBDDiDQTDeKpD4YdREdV
	nmbWzG0Fxt24dEW0rUTH88ArutJnJAScQIYEHv03/pTSe0Ip/oOsncC0TTQ0ZT1mTCWaqkjGp8n
	EXXWxLpxGSBL7aHHlNuj6Ha5dWwUqcCmnOgAOesS366OykG07bClcxUmG3
X-Google-Smtp-Source: AGHT+IFXUbwR8lWOZRe6i8l4qlKEaAy0lQrqMm3qm7cct6CH/tyqA5l2fVQXchZfGfEONa/1rSun0UddIdjxj4mkjSo=
X-Received: by 2002:a05:6402:3490:b0:5e0:8c55:536 with SMTP id
 4fb4d7f45d1cf-5f722673509mr2375476a12.4.1745595943758; Fri, 25 Apr 2025
 08:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s> <20250423192156.b44wobzcgwgojzk3@hiago-nb>
In-Reply-To: <20250423192156.b44wobzcgwgojzk3@hiago-nb>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 25 Apr 2025 09:45:32 -0600
X-Gm-Features: ATxdqUHU3-XEnukdUIRYxREV00XSdPXJg99nk4e8g7abiVI9-VXjzJzYla2eMME
Message-ID: <CANLsYky2OyrVLqm5JWOQaFhR3Fxt0d_p_HG4-F1o-Tnh=OP3dA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with devm_clk_get_optional()
To: Hiago De Franco <hiagofranco@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	linux-remoteproc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_084546_105838_47A1B5BA 
X-CRM114-Status: GOOD (  39.15  )
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

On Wed, 23 Apr 2025 at 13:22, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> Hi Mathieu,
>
> On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
> > Good morning,
> >
> > On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > The "clocks" device tree property is not mandatory, and if not provided
> > > Linux will shut down the remote processor power domain during boot if it
> > > is not present, even if it is running (e.g. it was started by U-Boot's
> > > bootaux command).
> >
> > If a clock is not present imx_rproc_probe() will fail, the clock will remain
> > unused and Linux will switch it off.  I think that is description of what is
> > happening.
> >
> > >
> > > Use the optional devm_clk_get instead.
> > >
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 74299af1d7f1..45b5b23980ec 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> > >     if (dcfg->method == IMX_RPROC_NONE)
> > >             return 0;
> > >
> > > -   priv->clk = devm_clk_get(dev, NULL);
> > > +   priv->clk = devm_clk_get_optional(dev, NULL);
> >
> > If my understanding of the problem is correct (see above), I think the real fix
> > for this is to make the "clocks" property mandatory in the bindings.
>
> Thanks for the information, from my understanding this was coming from
> the power domain, I had a small discussion about this with Peng [1],
> where I was able to bisect the issue into a scu-pd commit. But I see
> your point for this commit, I can update the commit description.
>

If commit 4f6c9832613b breaks on your platform then it should be reverted.

> About the change itself, I was not able to find a defined clock to use
> into the device tree node for the i.MX8QXP/DX, maybe I am missing
> something? I saw some downstream device trees from NXP using a dummy
> clock, which I tested and it works, however this would not be the
> correct solution.
>

If we make the clock optional, what guarantees do we have that the
clock the M4 is sharing with other devices won't be switched off?  To
me a clock needs to be defined in the device tree and referenced in
the remote processor bindings.

Thanks,
Mathieu

> [1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
>
> Cheers,
> Hiago.
>
> >
> > Daniel and Iuliana, I'd like to have your opinions on this.
> >
> > Thanks,
> > Mathieu
> >
> > >     if (IS_ERR(priv->clk)) {
> > >             dev_err(dev, "Failed to get clock\n");
> > >             return PTR_ERR(priv->clk);
> > > --
> > > 2.39.5
> > >

