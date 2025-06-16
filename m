Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5A6C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRYkbvCVxvcI/mg8yKgS8W1N0iZ7JRBV2UIynjIs8JQ=; b=DVPqKNauorBwZ4ihtt+IaIYCGB
	KjNdfAu07+PaJOXWD/n/yH9zaHmYKmibGy0VXMsacC1hMj0FCA9+gIfkao9FU99GUaMgKiOhx5ZcC
	MgpbMVhpO6MOTJ5pcxZCKvaVV+1v/UuZmvqAV/+5ZHmR9uw1IGZx6oTyq6thv00oVqdriq8uH5Bb4
	02BladQR2tbZpUcYjbyUpbQnLj4eATmQdZczfK466z0MiWkc4coEeppFl5MvFtnJIKfB5yS1T0o7f
	pFB7CyRm/tfGQFKfqcd5FrDRvFTqMNA7ASfS75IpD1aLl/lsuufx6i9XM6pMVqZSNGO5Hc8mcBOh5
	jV/3lNtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBj3-00000004pYK-0rri;
	Mon, 16 Jun 2025 15:26:21 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9f2-00000004VFd-0sXH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:05 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e8187601f85so3757410276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 06:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750079643; x=1750684443; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BRYkbvCVxvcI/mg8yKgS8W1N0iZ7JRBV2UIynjIs8JQ=;
        b=m141IPHGUGtfVtn1ibG9Wos7p9ssfJg6jmcNcqZ/kIigdeXAl5xviaaO+CePbCU6s2
         z8/xjUW79G5PVg0+CsKP2FEEy5ujfEWMQD5Xm6pS9A674zIrYQeO91TZkGL234R11425
         c7/sgGKxAow6xAGWcozawxMXdizQ6rTElRTVyMbjohhzCz9mXkXXihcug6CtEnbGkVz7
         621bh+2Q1OuR8+de+RZFrkodikCrrd3TUsL9JJoe0LanfCGBrJFXWAlNP9aRKW4thcBb
         h39CGQbDpLqIXGfpDDI2biDo2m2XuuSxCN7DYeNhg44rXBEHMBEJGQlNdKxrLMPoE1z9
         O6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079643; x=1750684443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRYkbvCVxvcI/mg8yKgS8W1N0iZ7JRBV2UIynjIs8JQ=;
        b=OBIOl9pO1moKjQpfBjQRrOB7lN9jRkE98Eruc5oUYnkjV8E0tohxbF7PTqE4Osqa1k
         DDgA+8mSnYCmPxQ3lG+DN0uoIjsFXyMpfuhJl7MEMJgXp9r9266TDnPJ7h0UQGiCx3Ms
         p7j6NMb3Efw2pC6sc1hymturtbAIidZ0ICG/wED7+Q8UFp8PDPIcttXjJYXn8hNRLRY9
         Op5F9qNlPYmJhiZcExC7LMbrXJRfTWH7pgZXFJVGdkaT5Fk7cFS+hh1B8vJXCxZS/rdk
         Ev7gp0Xo+81UT3WlyNb0Wh6ioM9hVCXMYDURNhVFqGsJpSs1C054HDER6conxwYISKHQ
         2pZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpJa3SNxdXb6QbSwZ8z5ahnStTBcMIx3Ahrpjl1upDg5zCiAcfCPDbNW4CqFnNopxnLaksElyNU6j6XEuI4Sno@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt46bBKZIUSFJfBOuvSj6yt3SXa7eKjL4lN5gj+DOM4YJ6ez7X
	LcQCqheLept0GmXmi9YU/tfx71mXl3gy7RtQ5/5ECqIchY4yjbTprz7hXhOSLV90LWQg5c225u+
	b9s7zqXbJnXC/7wtHtXvlLa9foosVIXzKrCk8I5ifZQ==
X-Gm-Gg: ASbGncslpLcRPIRJ3YNlQBHviiBOre1RF26qrNFoA6Oyc93AgOFuKIGMcHxFyfEGQRb
	Ju7UhpYgtibUtjbBLbKh+pVTBMbhkp3VA9rLscEiWmHTFQXwbx98yZilyPCQc3pcS9rnpyHEgIW
	24y3ojXMqw2hz3nPCwKqyGfQlLmg4eA7vLko4n40aVJ3DZ
X-Google-Smtp-Source: AGHT+IGi/aEqL6Rh0/QFbFi5llqcB5Z+A4DQiJChk6fNONAKpDZLCVOKHVzGhfBOvJ/fA1gHl6Xt6hW+mpx8lzQMNck=
X-Received: by 2002:a05:6902:150d:b0:e7f:682f:9536 with SMTP id
 3f1490d57ef6-e822acb5383mr11988415276.46.1750079642672; Mon, 16 Jun 2025
 06:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250602131906.25751-1-hiagofranco@gmail.com> <20250602131906.25751-2-hiagofranco@gmail.com>
 <iuotfsnaft3623lchzop6sbu5ox56scdr57uia56qm6ummcvzt@yisczcdzbc3b> <20250612173132.ixgctqijtd33vnmb@hiago-nb>
In-Reply-To: <20250612173132.ixgctqijtd33vnmb@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Jun 2025 15:13:26 +0200
X-Gm-Features: AX0GCFuvpjxjHJP5wI9sLNmiJuYGa1YHq-TFuFSLYi0hAhYmQqrk1asShtl7yPE
Message-ID: <CAPDyKFoHHMv1MUnT-ZUTDiwZdMChq1KooQxnNDx=eettpoTAGA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] pmdomain: core: introduce dev_pm_genpd_is_on
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_061404_249545_2E40496B 
X-CRM114-Status: GOOD (  35.37  )
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

On Thu, 12 Jun 2025 at 19:31, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Wed, Jun 11, 2025 at 10:32:28AM -0500, Bjorn Andersson wrote:
> > On Mon, Jun 02, 2025 at 10:19:03AM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > This helper function returns the current power status of a given generic
> > > power domain.
> > >
> >
> > Please correct me if I'm wrong, but this returns the momentary status of
> > the device's associated genpd, and as genpds can be shared among devices
> > wouldn't there be a risk that you think the genpd is on but then that
> > other device powers it off?
>
> I am not fully familiar with the genpd's, so my knowledge might be
> limited, but I think this is correct, if the genpd is shared.
>
> >
> > > As example, remoteproc/imx_rproc.c can now use this function to check
> > > the power status of the remote core to properly set "attached" or
> > > "offline" modes.
> >
> > I presume this example works because there is a dedicated, single usage,
> > genpd for the remoteproc instance?
>
> Peng might correct if I am wrong, but yes, I believe this is correct.
>
> >
> > >
> > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > v4: New patch.
> > > ---
> > >  drivers/pmdomain/core.c   | 27 +++++++++++++++++++++++++++
> > >  include/linux/pm_domain.h |  6 ++++++
> > >  2 files changed, 33 insertions(+)
> > >
> > > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > > index ff5c7f2b69ce..bcb74d10960c 100644
> > > --- a/drivers/pmdomain/core.c
> > > +++ b/drivers/pmdomain/core.c
> > > @@ -758,6 +758,33 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
> > >  }
> > >  EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
> > >
> > > +/**
> > > + * dev_pm_genpd_is_on - Get device's power status
> >
> > Functions in kernel-doc should have () prefix
>
> Thanks, I will correct this is next patch version.
>
> >
> > > + *
> > > + * @dev: Device to get the current power status
> > > + *
> > > + * This function checks whether the generic power domain is on or not by
> > > + * verifying if genpd_status_on equals GENPD_STATE_ON.
> > > + *
> >
> > If my understanding is correct, I'd like a warning here saying that this
> > is dangerous if the underlying genpd is shared.
>
> I believe this is correct, maybe Peng or Ulf can also comment here, but
> if that is the case then I can update the comment.

Good point!

I would not say that it's "dangerous", while I agree that we need to
extend the comment to make it really clear that it returns the current
power status of the genpd, which potentially may change beyond
returning from the function and especially if the genpd has multiple
consumers.

[...]

Kind regards
Uffe

