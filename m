Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7A0C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw+usroP3NgOGNx1hpYdeiF4dmvyltKLfFB52iURL84=; b=fUp0wXvQebp2p8Ax7gMQQPXeGS
	QZQW0zuhixPOKLB00OH20W7ng9UpRWb8Odnx5T1l/0WDxIqYVDm+UoV8F00xYN3dAemuhPM59SonY
	iWE7B7Efa04Z9/0XJxdzDxaEEV2LL8A4LwzCrESZKMKxkr+2G5QIToJ5lSHPaY0RP1Ml1qPl0kS2T
	GtcGyrbDnyQxDni7g/am9zjNzcIOxHDgYBns7YnfqCiqDryGGUnpFRJIKqxMihc1Yw5RLCIKIVcN9
	hiVtYoO+jHOSLhe0zEo1QVCPVUr3zVOdHLGteUdTKvLOP20nG4B/nolVvUA8RfHLB3ew1BUSDgzTU
	iLVz3WVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKnE-0000000CcDe-29XT;
	Tue, 06 May 2025 16:05:16 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHX9-0000000BwNf-0qY8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:36:28 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-739be717eddso4465346b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746534986; x=1747139786; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fw+usroP3NgOGNx1hpYdeiF4dmvyltKLfFB52iURL84=;
        b=aJkcYU1pzE7p+3RkzxumFccfs6BGVGlJj8u3lLHW7NzU0+b+e6Iahpr3t6jxJ8KnlK
         zHAirXWeQh0RtmqHMmS8MfI8FtzOHD1NpP1AwGfEvT5xjLtAS1K7f7V1ANLJQWJ++cjv
         gvRGmPoQT9n8qFl7DN1bMI0eUra/peebn/1wwpFM55+fzi+lfk8n3zA95WLO1EehOMVP
         iBk0yFTaBRCHtX4abEqsCBjuCs7pBBslDeZ6fus0yVRPTVwon1Yw8sYgyky5rW4x8hla
         veDE+jrGGKq3dUdw7hg16S51ORSb57xQ03U4OCogoy7XIx9IIGFaJiTwtVcOci/FY9CV
         zd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534986; x=1747139786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw+usroP3NgOGNx1hpYdeiF4dmvyltKLfFB52iURL84=;
        b=xEZ2Ny1nwWNlLUR9FcvulkwRjZdac+kwYaeGpVGe9KwhGgbDTGfbKn6KvdNEHlQ5bQ
         tg4xlwpQT2N3gP6xrtLDzWo2h6iK2fywjFmZJQdI6Bfg2bxbO3LOEi7siBJ3fvpoNA1M
         x8rTjfGpjFQx5Fn2nTP3iOXQKsEDthF6qHCTGunqNzW84pJWypuRZpX0Zi6kzgAEGrn7
         N82JFzjeUb800+3/d7j25wTTHHOLTB5qDrhu4vHzRONDlFX/+Bq4v25BngsDH5eQ87rC
         6CyAHP+bU+KITs4hcql8HutNR3GHAvCdm1LDggPXAD6+yenM6kB7sxB7oBU0en1tdh3q
         SEFg==
X-Forwarded-Encrypted: i=1; AJvYcCWzRK2UEoyVbcU3tcfJuEf6coXwMe2lVkhjVs9BESV/59gGm++3kE6Gb/AB0ynEVFgd4RnkV0cs3PcaglBIaFpn@lists.infradead.org
X-Gm-Message-State: AOJu0YxBOv7GVJPPegcbgIWxszVPpnjTTFETzSg7KALL05SwSem6VPSF
	bJLa/u6M/R/eFm0WHlo7V8NjMdnmH8wLLR44XCPA8IfFB6hne9me
X-Gm-Gg: ASbGncsXYF1721YTMyL8I5n6b0iEuDUEMUXCME5WGNnrd2OgYpv1sUMz56xkWjTuHbn
	eQi+iYzIFZ5fcbcNmWyO5C8rYTtOz/1vw+XCkjuGyUr8wwdjja8UYLaRgvfToqw3gk6MDRTMEei
	oURR/mb7sPUnDWf8OXUaeRQAxY9XAbP+nQ6AUwWIz6azBaloA01x9X66IfZhRkEQ4u3F8UuQ6Ri
	XaPAiBiwZJJcbPsn0xQVowwpYpMT3V28AJ99Xp2Kx5lWyTsTsoVvj38ehbnZuc/mbmenk2h0nOQ
	AtEPM4m9p/NZKAS1Mc2SeNFgqCxClbqUpK9IGC0=
X-Google-Smtp-Source: AGHT+IELVS4lhs43iILfpwkhJE1qzvUcBDpCZPSr8G03kGFiX1zF+uJrHmJifYxOzwmCsKQfm2eOFA==
X-Received: by 2002:a05:6a00:1d21:b0:736:32d2:aa8e with SMTP id d2e1a72fcca58-74091a1ee5emr3278160b3a.6.1746534986102;
        Tue, 06 May 2025 05:36:26 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7ad6csm9089557b3a.17.2025.05.06.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:36:25 -0700 (PDT)
Date: Tue, 6 May 2025 09:36:19 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/3] remoteproc: imx_rproc: skip clock enable when M-core
 is managed by the SCU
Message-ID: <20250506123619.egobussm6b74imso@hiago-nb>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
 <20250505154849.64889-2-hiagofranco@gmail.com>
 <20250506043835.GB24259@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506043835.GB24259@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_053627_243902_71DA1E05 
X-CRM114-Status: GOOD (  29.22  )
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

Hi Peng,

On Tue, May 06, 2025 at 12:38:35PM +0800, Peng Fan wrote:
> On Mon, May 05, 2025 at 12:48:47PM -0300, Hiago De Franco wrote:
> >From: Hiago De Franco <hiago.franco@toradex.com>
> >
> >For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> >before Linux starts (e.g., by the bootloader) and it is being managed by
> >the SCU, the SCFW will not allow the kernel to enable the clock again.
> >This currently causes an SCU fault reset when the M-core is up and
> >running and the kernel boots, resetting the system.
> >
> >Therefore, add a check in the clock enable function to not execute it if
> >the M-core is being managed by the SCU.
> >
> >This change affects only the i.MX8X and i.MX8 family SoCs, as this is
> >under the IMX_RPROC_SCU_API method.
> 
> I would rewrite as below: "
> 
> For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> by the bootloader, M-core and Linux are in same SCFW(System Controller
> Firmware) partition, so linux has permission to control M-core.
> 
> But when M-core is started, the SCFW will automatically enable the clock
> and configure the rate, and any users that wanna to enable the clock
> will get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
> gets failure because clk_prepare_enable returns failure. Then
> the power domain of M-core is powered off when M-core is still running,
> SCU(System Controller Unit) will get a fault reset, and system restarts.
> 
> To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
> because SCFW automatically enables and configures the clock.
> "
> 
> You may update if you wanna.
> 
> >
> >Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >Suggested-by: Peng Fan <peng.fan@oss.nxp.com>
> 
> -> peng.fan@nxp.com

Thanks for the review, I will update the suggestions on a v2. Meanwhile,
I will wait a little bit for other feedbacks.

> 
> Thanks,
> Peng
> 
> >---
> > drivers/remoteproc/imx_rproc.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >index 74299af1d7f1..627e57a88db2 100644
> >--- a/drivers/remoteproc/imx_rproc.c
> >+++ b/drivers/remoteproc/imx_rproc.c
> >@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> > 	struct device *dev = priv->dev;
> > 	int ret;
> > 
> >-	/* Remote core is not under control of Linux */
> >-	if (dcfg->method == IMX_RPROC_NONE)
> >+	/* Remote core is not under control of Linux or it is managed by SCU API */
> >+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> > 		return 0;
> > 
> > 	priv->clk = devm_clk_get(dev, NULL);
> >-- 
> >2.39.5
> >

Cheers,
Hiago.

