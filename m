Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3FFC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OMCAEKXt9Na5TVEs/wllXz+LY/w4SZyrDL1epmaZEU=; b=VzQk6CcoJDTbbNJ78uUdWfpVIV
	EoKecM6V7EInP6TFdY6HzizYaJt6XpaPr1WwjMoZhWspojhR7xnWUMAz+Gasim3LZ37fcegCetwsz
	pmWoTGXf78qmUt4kcqgLiRstwwayqhCFyqylp+tehleId4atFiiY5926lju2SMzwbhOVMhlYdZL9w
	icq744JuHxzzF5TyHdxEmQEpT1Sl1FbXe+rKtbnX3Bwdo088q7kqlk1Hwro36QOzSS+R7d2JeimJs
	MPioqLDprDpc472HV2lMywDve6Ky83k5ygBnqRi8EoW1CXhFZJYOlFwiWM+9MB+vQQYaj0St5R+d1
	EC+KnEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCy8q-00000000KuE-2zlU;
	Thu, 08 May 2025 10:06:12 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCy6s-00000000KhN-3aD7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:04:12 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e75607f50e5so768040276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746698649; x=1747303449; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+OMCAEKXt9Na5TVEs/wllXz+LY/w4SZyrDL1epmaZEU=;
        b=bQfswa36ddTZnPMSH9SaYPJsTlPwou48mkl3/dg2uk0CHle2MkAQoN7T1hG3y8qJkS
         hnPUYqsI8QlP4GDNttR7GKjODU4xzZTAM0FdMaF6VCYzKTFxW09a8MwckovpqE4+7XTR
         9v1/PcMvgxHx3IpKPpGoF8ECyox0fbpA5b6XpGf3dgZwAcCZ17CrgYRibmuj8WjNmDDD
         L+n14EOS3J/Xf8l7E2Pt6F5yHu462zLYqaqfjP10zCmLE/uzJbiUew5F3p7gsPs4iSoW
         Q3vZxiWykv0+3CoO2OL4msEa20AmAUr6HPXyb81xvsjAmea/GWjWw9jRNj8aJ/k8xeTa
         hcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698649; x=1747303449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OMCAEKXt9Na5TVEs/wllXz+LY/w4SZyrDL1epmaZEU=;
        b=q91Igfo7Tg75LNSoN2jwg7cLmeqVLVvRBbYXFfYezTuwaN6oiA7/0244S1Hpvr3CN+
         cLj7fqWU/aXficMQZuL2bWmQlR7rVn1BKnPtuk7UOV/kHN25est2IbXlGGe/sizu4VcD
         pD3ZRaYOksllyaf02nE+vzzUPg8pezgC8mPSrIGji4whtnUVZ2oR9cnR4REbWGAeHqGn
         DbsNYHrYXdPrtmuG9GIydpcFrqd5tAuTOI8b0OE2KJAkWN1K/y9NC6uIHs6nZWKqhGGF
         IXY/ikk1QCbvZ/I6L3pvv3iktqwFDYmWRJ89k7rM0wm74qPCFJXtnW5SeX2WZ9FO8D5M
         DiJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6fMZLkyBgR1cSMp2xlo19nAEYiD5BSKOhtUkAjfzpMvcV5iv7V4JNtV2K2HfEGBZ0DAoL1og/rp6OFo3SAhOK@lists.infradead.org
X-Gm-Message-State: AOJu0YwhEMHrZFRLcAfVXgGr53rY6mX6iGJ1KgDaJBBAXtkdPC/zaLtW
	HbSIbNlrEvf/fP94T05cw7LQTfRX5Fpo6qAvk/WE9A9bP87gIdhMhP30UuLFWCQC7gtOa37+cHU
	SKJc4+IoO1lwYNXxjuI9xusiu3MZN1A52bObT7A==
X-Gm-Gg: ASbGnctb0Ka7qN1kyIPFFnlUNLRgyKDxpgaHnI8NMQJ5faVzy0qDnr/p8EF+/j+Id9B
	794D0rRS6eHQjA/sahIl5YWj5IT3RCPXcAQ/46RddGlyVk0czYueFsWdLy3PzXF6+yV3ek+RYEb
	dii5uwKM7DHtMjqClqdZRtMNY=
X-Google-Smtp-Source: AGHT+IEe4zp5EUGAPH2midu3NVbyBycrHIpRT+XUkbdIdzvQqiRxX8Kp0ZBPTG8H9R5eDjAreGEn66s7Qu9eZSe/884=
X-Received: by 2002:a05:6902:2b0d:b0:e78:f1e2:8f25 with SMTP id
 3f1490d57ef6-e78f1e2907amr1705899276.0.1746698649338; Thu, 08 May 2025
 03:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
In-Reply-To: <20250507160056.11876-4-hiagofranco@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 12:03:33 +0200
X-Gm-Features: ATxdqUFUvDJo4SEFGQh5UV_w7ICgnExMVykRp0SMxPXtgTPPo6OOJoK0tLhcWVM
Message-ID: <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_030410_906483_7AA2C6F1 
X-CRM114-Status: GOOD (  25.67  )
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

On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> When the remote core is started before Linux boots (e.g., by the
> bootloader), the driver currently is not able to attach because it only
> checks for cores running in different partitions. If the core was kicked
> by the bootloader, it is in the same partition as Linux and it is
> already up and running.
>
> This adds power mode verification through the SCU interface, enabling
> the driver to detect when the remote core is already running and
> properly attach to it.
>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> ---
> v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> suggested.
> ---
>  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..9b6e9e41b7fc 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
>                                 return -EINVAL;
>
> +                       /*
> +                        * If remote core is already running (e.g. kicked by
> +                        * the bootloader), attach to it.
> +                        */
> +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> +                                                               priv->rsrc_id);
> +                       if (ret < 0)
> +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> +                                       priv->rsrc_id, ret);
> +
> +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> +                               priv->rproc->state = RPROC_DETACHED;
> +
>                         return imx_rproc_attach_pd(priv);

Why is it important to potentially set "priv->rproc->state =
RPROC_DETACHED" before calling imx_rproc_attach_pd()?

Would it be possible to do it the other way around? First calling
imx_rproc_attach_pd() then get the power-mode to know if
RPROC_DETACHED should be set or not?

The main reason why I ask, is because of how we handle the single PM
domain case. In that case, the PM domain has already been attached
(and powered-on) before we reach this point.

>                 }
>
> --
> 2.39.5
>

Kind regards
Uffe

