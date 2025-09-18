Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD02CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFt6YzhskfMz4G5ASFBcNJdSZpqtygY9kyuCw6Wbqgk=; b=00EoB/KECQQYqAMSC1A+uYYV8d
	Hbco28HzoxlziA6OSW028xEgls3v6GbmrdHGAdae4NiSHjJ28L7UJbYq+ufQ5JzpbrCKb1vx7Dake
	bRv3AqgTt0GlbJP2yQDRMqEoM8Twfh2ieMKkvNNrRGM2FASN582Lb6kD1AIis4wa4ACZMozJAjWC6
	COFN/AEGXp46bEjqNhnPikvpnb7Ny3jvq7jmttzMhfPdy5MP2b5h4UX8Ve7QGRmue8gkfaIjI0yfL
	llnfXGrc3lw8XqrBXoy/dynLPxevQq3SWMj2Znrrr8vDwJ4EtUXy0JvFw9zz8j+58cu4zFtK+RWgH
	2QKK19cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGLm-00000000JcJ-34DV;
	Thu, 18 Sep 2025 15:15:10 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGLh-00000000JX5-0JYj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:15:06 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-723ad237d1eso10826107b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758208504; x=1758813304; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OFt6YzhskfMz4G5ASFBcNJdSZpqtygY9kyuCw6Wbqgk=;
        b=ztk23syvwoaT8FTlWAq2aIPEypnFRx8wnLgGAwRIz66JzW1li+dWYtjCGEVGujwEqL
         5g+RKY9ikwNchM4/ycmVRqCc3u3AuoiZxdrYQNW2Z3exP3SIcb4mpxM3krsZq5d3GHfi
         1eO5P6LIdQlbCWxomVguosmvsZJXjfB+KjBbDClnfdTZvAVwSgtjNs8uvFKrWa7/tRKX
         lLGA/pStQSC2WYIepnvPeYmyUGDq3yYCZMq94hgWGKTU9B73P9+3emdCQIpV1yK4zxWN
         o2pAV9aSIbJQV43RMLDE3LzcFZJgF5xgL/v56Z8q+fnN3FCa1+3Azxfi7VsYX5rMKEdR
         34Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208504; x=1758813304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFt6YzhskfMz4G5ASFBcNJdSZpqtygY9kyuCw6Wbqgk=;
        b=v1FaKABPcyZok8YzXCUId/1lxG69eyOxvD0MCxTnO0fGe1ZJLx2WdAf3IGmmzyUTND
         jtN/zl/W77NmhDgGW7rBV+NacPkSY5auw3CasXKjYP3o9n20fDU1dyECJgCeG3U3GjPX
         pn8yfEsRL+BSjm00Mp1KK4f0WXwsE8vaQGigNNZfeBqZsGB0C2T2NdSHPD817SyahAyx
         p18TO0saMOvD/ptKgge4/6RPgwb52HFoUNe3usA/xw+phqvNvuRr+7xf7644R2D0yKfx
         v5UyC2RoLZN7VXB/CBvEEB1ESiGuegd0CotodTQm6Unnqa1VEmQHrKgabkbiC4MiTE4d
         q69A==
X-Forwarded-Encrypted: i=1; AJvYcCWa8jMxywwCG/hNJucSRkj27ratjOi9gZaCt20iy91nLq0FRPXXFCmMemGIsYoI8mX57c58U9hX8BkgKWXhDT0n@lists.infradead.org
X-Gm-Message-State: AOJu0YyIPLc/oQ+77ep/J537P9JjZZR1rE2Gh8N/JTXF82njhhyewgLj
	SLxBMOKVm9kBphzk/VyqG59/UFxGwFZ8UFy+lqnbhjVdOWRtVhj3/ztWo9SLBifR4O71sCrH2kI
	NEFL3roDDOC8Zd3hJxmpbO27t5yJjq1tmqm3WFm2eUQ==
X-Gm-Gg: ASbGncvzh30DWSB/f5e/7XZGV2iAr3KNQ6lFg3qLUmpBNw4a0BTVXdhzBPjK92t0e4Z
	CkF0BuVCqaqtzMRGnBHSOQbrO6O1myxa60GxBZo4zVvzOME0m2v8zuQZbHpqNGJ6x7hqd/MqlOB
	gMcMDI9s618TN14D0YAHkFcKDihX8orbhzVbkLLTQY0rRjcfQnBjE9a8d4glyhTuNKXxmStk8xC
	neKtLnnfn6UFdPaKCDtAQVf5lo=
X-Google-Smtp-Source: AGHT+IFWx6n1PzkYYp5utqUHYs3cajDfg2GyxSlUHuEjN16hnOdbRT6rrrmIdLRynF4h/+ErT5T1ASVcKks2d63Qrt8=
X-Received: by 2002:a05:690c:7281:b0:731:6570:132 with SMTP id
 00721157ae682-73891b87069mr62837047b3.35.1758208503588; Thu, 18 Sep 2025
 08:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-3-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-3-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:14:27 +0200
X-Gm-Features: AS18NWCdTZsclOkAHpdSQCQjKeMfCrt_EDcLieD3X8xYbm6A6ARROAgFxf2mSRY
Message-ID: <CAPDyKFq1Coz4rbdam01s3pOCDa=Et2ePmf7niLSgOdjCbnEANg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] usb: chipidea: ci_hdrc_imx: Set out of band wakeup
 for i.MX95
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_081505_140357_9BF28C98 
X-CRM114-Status: GOOD (  21.71  )
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

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> i.MX95 USB2 inside HSIOMIX could still wakeup Linux, even if HSIOMIX
> power domain(Digital logic) is off. There is still always on logic
> have the wakeup capability which is out band wakeup capbility.
>
> So use device_set_out_band_wakeup for i.MX95 to make sure usb2 could
> wakeup system even if HSIOMIX power domain is in off state.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 8 ++++++++
>  include/linux/usb/chipidea.h       | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index d7c2a1a3c2715967203b98c819fa864e06a00a32..a2b3f673dfc1183a02783bf6ef92f8570c6042cf 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -79,6 +79,10 @@ static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
>                 CI_HDRC_HAS_PORTSC_PEC_MISSED,
>  };
>
> +static const struct ci_hdrc_imx_platform_flag imx95_usb_data = {
> +       .flags = CI_HDRC_SUPPORTS_RUNTIME_PM | CI_HDRC_OUT_BAND_WAKEUP,
> +};
> +
>  static const struct ci_hdrc_imx_platform_flag s32g_usb_data = {
>         .flags = CI_HDRC_DISABLE_HOST_STREAMING,
>  };
> @@ -94,6 +98,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>         { .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
>         { .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
>         { .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> +       { .compatible = "fsl,imx95-usb", .data = &imx95_usb_data},
>         { .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
>         { /* sentinel */ }
>  };
> @@ -570,6 +575,9 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>
>         device_set_wakeup_capable(dev, true);
>
> +       if (pdata.flags & CI_HDRC_OUT_BAND_WAKEUP)
> +               device_set_out_band_wakeup(dev, true);
> +

Based on my comment in patch1, I think we should set this flag from
within a system suspend callback for the device in question.

[...]

Kind regards
Uffe

