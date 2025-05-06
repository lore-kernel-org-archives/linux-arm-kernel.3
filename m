Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B32C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUMMAqzLfeU2BhLtLW4k1zZhIkqrr7YldwnF+3gqRqE=; b=y7YkfH42dOFaW96PZCzZnX2uYn
	grBOfK4b3a1Op873NEJi1DJRYpR/4cv2SHBaaLgPjNn/jE1mPLSIkgn1HM4UVCtkC9h/SKYSp6w9t
	xCXEGIurqBvLCChsO12y7h/Kre22Xzjb0lMKrh2q5pPB8UY6ON+9GBtjvTtxo+eJDghdFnpmxtb7q
	O6ikE4LBGqkDE/zqUTyLK8V9spOIDTTqeNqiqE29seBudoj/EaH35xTlC7JyuQvM2ze/S721f8FHV
	vGj+Lk+zDcnXxuLY9bysSREpvJ/xdri/SSkdeLyUpuCGO7glLvXtqRMK8zLnBA35a75VY+aUXI5l5
	pfzbDJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNe8-0000000DC10-0VsL;
	Tue, 06 May 2025 19:08:04 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCK70-0000000CTVD-1fJU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:21:40 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22c33e4fdb8so59176805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746544897; x=1747149697; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LUMMAqzLfeU2BhLtLW4k1zZhIkqrr7YldwnF+3gqRqE=;
        b=kzrR94OUMerUIcQcXCfrrnXSlZQH9V7khHtyem/tqR7+g3pqDLh+a2FsMiJ6U/uzmL
         8asP2Q1soCZAGl+FhSxL0LlylZwDQ/+TG4S/8UTaNdo6HCg03WaX0bMWAjWYK2B/+OzD
         JyblZRfKD7QvYfpBxc/5rUacxR8NxzfTuHMYBMfsUOX+WgncJxirgKrj0bp3iUi4FUNj
         BZ9hPtcAt4ORUCUhqh0YP9OHpFz5EEOjkgWgvE4uuMuGeeyDdfMfUwmicOKOOxBd4Y//
         IhbQwq6GApn7fgGriC3QnXdfN9cf8Wy6Eftkp5zbM47tVjpTH9pSFy5O1leuOASSfOJ6
         E3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544897; x=1747149697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUMMAqzLfeU2BhLtLW4k1zZhIkqrr7YldwnF+3gqRqE=;
        b=k3DAA6+B9e2OL4XHHwop5XfmbAj8Uf3akHm2vnXirhdRfL0Wq2fN7+XYgjQcHx/+V3
         EEW4Q0IMZevAVJc/SXRy1PQV37fKYZkgfAYLc7j6DCvuVP3U9moL1VepOHiki4Xsp2un
         BlEPUMx4BIOLW8iGV9WvlD36BEn6R8NRQRgV14z+gXO4XSQFaVIqjaxorSFqp+aUBfai
         rSPZ30nORT1Kb7NKfhIb+ABKuVrHpD/r6t3R0JkD8Btk/XuvDcUxYDpUv8xx5FYdkF+F
         MQAO5qFNU/KMrNe5ctbxIQcaaUVl95GpALVl5ihk7EGhgj6UqcPLz3aMfPdkl9zJqFYR
         lPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyw2ZGn/sEmIzim4i5NW4zExDH69sZuoLqYo+5JNeoRkoDthiyMvsK5PDaTfcDgncrcggSazdWgRa3vSxZzXHN@lists.infradead.org
X-Gm-Message-State: AOJu0YyxsHG5r0e1ooJ2pxEMpbVALJ3cWa85MyN8sPFJR7ZNz5v5lBdJ
	eMq7cna5gDG+M56SNbXGTjYx5tLpuBeXU2YKn2GCd9Tg06kO3f8X9tdmDQLhwb4=
X-Gm-Gg: ASbGnctFIXGaOCAbuH4O1DcCw2GdMu0m+yxqxS4PjTgVSqPEjyL3LDODB51kll1tSRc
	pTelqtmo1C1pP3kYdgCPjqQA8fLdQMtIH40iZvDjdzSlOUkZdce4BT4krIoVO0NDhLBExGKquXW
	gtFbr07Rb2vo0MxCv88+xXTwT+dF5g75kNXerGV0ZzBOTjRMbRHumSbyBVhWgqmHVXhRaNc0tzc
	aoCfZOFsvY7d+8vsZLfg5IHERWyEC8tTYYDjVYEhUoIE95snXTPhBTtImN2VYn2FEktWWHwl/6x
	+19TgQRYje5W1yYoUWi9IBYJR5OayWb0TuJYywNnJg==
X-Google-Smtp-Source: AGHT+IG9qR+Bw2uygv8xQSXKT77iYKR8E4JwPxPN+b6XzkhfQ8z4EFuMOu2q9YdcGCpJtb1y5nY+aw==
X-Received: by 2002:a17:902:d40b:b0:22e:4a2e:8ae7 with SMTP id d9443c01a7336-22e4a2e9073mr19297995ad.22.1746544897093;
        Tue, 06 May 2025 08:21:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fc7c:b927:d229:c0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232224sm75295875ad.253.2025.05.06.08.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:21:36 -0700 (PDT)
Date: Tue, 6 May 2025 09:21:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/3] remoteproc: imx_rproc: skip clock enable when M-core
 is managed by the SCU
Message-ID: <aBoo_p1KlmOieJ50@p14s>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
 <20250505154849.64889-2-hiagofranco@gmail.com>
 <20250506043835.GB24259@nxa18884-linux>
 <20250506123619.egobussm6b74imso@hiago-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506123619.egobussm6b74imso@hiago-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_082138_444994_EC52BF5B 
X-CRM114-Status: GOOD (  33.35  )
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

On Tue, May 06, 2025 at 09:36:19AM -0300, Hiago De Franco wrote:
> Hi Peng,
> 
> On Tue, May 06, 2025 at 12:38:35PM +0800, Peng Fan wrote:
> > On Mon, May 05, 2025 at 12:48:47PM -0300, Hiago De Franco wrote:
> > >From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > >For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> > >before Linux starts (e.g., by the bootloader) and it is being managed by
> > >the SCU, the SCFW will not allow the kernel to enable the clock again.
> > >This currently causes an SCU fault reset when the M-core is up and
> > >running and the kernel boots, resetting the system.
> > >
> > >Therefore, add a check in the clock enable function to not execute it if
> > >the M-core is being managed by the SCU.
> > >
> > >This change affects only the i.MX8X and i.MX8 family SoCs, as this is
> > >under the IMX_RPROC_SCU_API method.
> > 
> > I would rewrite as below: "
> > 
> > For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> > by the bootloader, M-core and Linux are in same SCFW(System Controller
> > Firmware) partition, so linux has permission to control M-core.
> > 
> > But when M-core is started, the SCFW will automatically enable the clock
> > and configure the rate, and any users that wanna to enable the clock
> > will get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
> > gets failure because clk_prepare_enable returns failure. Then
> > the power domain of M-core is powered off when M-core is still running,
> > SCU(System Controller Unit) will get a fault reset, and system restarts.
> > 
> > To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
> > because SCFW automatically enables and configures the clock.
> > "
> > 
> > You may update if you wanna.
> > 
> > >
> > >Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > >Suggested-by: Peng Fan <peng.fan@oss.nxp.com>
> > 
> > -> peng.fan@nxp.com
> 
> Thanks for the review, I will update the suggestions on a v2. Meanwhile,
> I will wait a little bit for other feedbacks.
>

I suggest you go ahead with a v2 - I have a fair amount of patches to review and
my time to do so is currently very limited.

> > 
> > Thanks,
> > Peng
> > 
> > >---
> > > drivers/remoteproc/imx_rproc.c | 4 ++--
> > > 1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > >diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > >index 74299af1d7f1..627e57a88db2 100644
> > >--- a/drivers/remoteproc/imx_rproc.c
> > >+++ b/drivers/remoteproc/imx_rproc.c
> > >@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> > > 	struct device *dev = priv->dev;
> > > 	int ret;
> > > 
> > >-	/* Remote core is not under control of Linux */
> > >-	if (dcfg->method == IMX_RPROC_NONE)
> > >+	/* Remote core is not under control of Linux or it is managed by SCU API */
> > >+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> > > 		return 0;
> > > 
> > > 	priv->clk = devm_clk_get(dev, NULL);
> > >-- 
> > >2.39.5
> > >
> 
> Cheers,
> Hiago.

