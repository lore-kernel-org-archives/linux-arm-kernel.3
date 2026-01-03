Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42731FA374F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 10:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDXSZppGA43wphmZJyL9aJJ8iAZCIXmj8aHnH0wAQ/k=; b=HdljJ2QfftKFeZYkJHtU/P3FvO
	RZLYxBKr5BNCM+A44Rmgi4iYoJKhMqYWcQzlPEmOK9p3gWqMYYV4kv2X+e/bBXJ37XI/F9BeS05p4
	j/XB5m+uyhI/e91QpeeXxZsa8i11eq6lOBPA7xunuk5bMr6sODLYJwxxx2eVG6jX6kBUsm4tJPkgx
	2upANi7xZ+Ig7a9oGcv8Wl9vyak4JjDLc/5s5kCnySaJ9mnwk6aV2vUQR5wfXzQCPv7yGwCOEbXex
	6Sr6y1ofdctJFKPEqeyWXFsBiNsvdnmUXWqA8C//uekNpg3debFbsCQHbPLr3M1oUOlaTRUx55UBt
	3789zzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyTo-00000009BEc-2PSC;
	Sat, 03 Jan 2026 10:03:28 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyTm-00000009BE4-120j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 10:03:27 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59445ee9738so10106144e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 02:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767434604; x=1768039404; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bDXSZppGA43wphmZJyL9aJJ8iAZCIXmj8aHnH0wAQ/k=;
        b=lcZtTYTqclRpyGhhwnPYy1PdS6Tct/2kij3AjkMw/enz2GOwRwMz0FgMnvz/CLK9tz
         vRM0M/UDSXg27yryhoGLatLTsnnQuOURfkY/SGG/1g/PUV+6/aqFC4auOCd5A3WuOCP6
         rmBllADDyUJd6MHlbapTjsvbdYteSOIhJUj+3KV1iprXcLxQogiNxDNyoaQKmDNgDTop
         a97H8T1ZMpayBbsFWqT2wAmd9wmgpHKUbEGgZMAPt/fEG/iA2UtoFxNfi+NgOfcUEnyT
         HanXRjEv8soyh47dk2xtIV//oobXy1XgVWAkr7fcmsTRrQdZXR3zKjkUYWrY/Sptr0E6
         J14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767434604; x=1768039404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDXSZppGA43wphmZJyL9aJJ8iAZCIXmj8aHnH0wAQ/k=;
        b=HjT9+Rbtq7fBCE19nQQQphwqF/mlZNtHwJzE/Jwv2FxKOIPphghseUi5IvuNzIDuD6
         3sM/JFIbVdme6OHXhPNAuQ3+oENYOQt1ryWBRWjkZyhwKE06U2AzmAklbS2Kxk9RKeHB
         uLjKBWw2b1rvmLb1mgn2otzNDDwFuhWCCkmJbbat8INdxS/RpA2jqngBq3yW3x6K06ga
         ZBIGA/yxZoRAebhUOiXzqkZhf6ww5EmsoqwrF3S6Z0ku7nzX+UL6X8MHIYcLwx+DR2CN
         XI0n5KehYvyFCwMm9PEINXzidK+pbbtUjmjqiPwfHf/YSGjrWC55mV9r2a+f9gWoCvqS
         QZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCV4fi6w1SQfJa15+hxikKEBrTba3wPYY+UqJ2JqtHEcnW0s7Z5GxUmfxCmn6gktzAbZlpxg8bzpQW40Q5r9GEc3@lists.infradead.org
X-Gm-Message-State: AOJu0YxS4oeThIVN3srDjNAgQWxukeZyU1EtfHa+haWRkgo5ZGSJuj8Z
	Q9iSJRB4v926WjF/ssniXP+/3odTe8UFTpeT80qQRfcDzlelC0LjOISuJqsGgiZImby0PwgjY8a
	3+ZSCWDDNsYC2qQELWkLVuwnsKyoMansLcruVbN9UJw==
X-Gm-Gg: AY/fxX54hao1xmRgLvLtqrKSUd9ciTTusXpomMMGuoKoGYZH2MWL4xbw5TAvpGOR/H7
	Cz3ug8L08u7lepfrj+PRaVV7X/VUOPLPWUdjnbC/DB2U/JGwPqrto3zh2TNSfBxfZGMz5J0vVpa
	T6494SBcNCTFP1hyFloThK7HMSKsFNHHrcXgHxBbkWX5BGpeAU0k9UG6nU3Yi/b9uF78LWG0l6H
	VyGJiF0sjfGNkHXToMqG93fxXKOXiCFkne0Jc1L1Rusm3eDvwRh33Si6f9HM95ooZOGzsSo
X-Google-Smtp-Source: AGHT+IFKB5FPDCXC2bA+k7uKQBiw0br0n5E1yiLNSCnfVzhkAKxTdSHEp5ZWB2TbHk2W/He8NymlZBgfriNTTFeJlI0=
X-Received: by 2002:a05:6512:10cf:b0:59a:108a:31fa with SMTP id
 2adb3069b0e04-59a17d18076mr14943741e87.10.1767434604071; Sat, 03 Jan 2026
 02:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20251205015428.643-1-ming.qian@oss.nxp.com> <20251205015428.643-3-ming.qian@oss.nxp.com>
In-Reply-To: <20251205015428.643-3-ming.qian@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sat, 3 Jan 2026 11:02:48 +0100
X-Gm-Features: AQt7F2oMTRKk7t89Y9gE75MVMNztzWV9UDfi1TNNrPc77CmFOSHTt5sl2zwMryU
Message-ID: <CAPDyKFq2iWX-axxnKHisRHwKJqnyHYm5oM2_UKZaeQduKdYkFw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pmdomain: imx8m-blk-ctrl: Remove separate rst and
 clk mask for 8mq vpu
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_020326_316376_5BFE137C 
X-CRM114-Status: GOOD (  20.68  )
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

On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
>
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> For i.MX8MQ platform, the ADB in the VPUMIX domain has no separate reset
> and clock enable bits, but is ungated and reset together with the VPUs.
> So we can't reset G1 or G2 separately, it may led to the system hang.
> Remove rst_mask and clk_mask of imx8mq_vpu_blk_ctl_domain_data.
> Let imx8mq_vpu_power_notifier() do really vpu reset.
>
> Fixes: 608d7c325e85 ("soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> v3
> - Add some comments
> v2
> - Update commit message
>
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index 5c83e5599f1e..74bf4936991d 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -846,22 +846,25 @@ static int imx8mq_vpu_power_notifier(struct notifier_block *nb,
>         return NOTIFY_OK;
>  }
>
> +/*
> + * For i.MX8MQ, the ADB in the VPUMIX domain has no separate reset and clock
> + * enable bits, but is ungated and reset together with the VPUs.
> + * Resetting G1 or G2 separately may led to system hang.
> + * Remove the rst_mask and clk_mask from the domain data of G1 and G2,
> + * Let imx8mq_vpu_power_notifier() do really vpu reset.
> + */
>  static const struct imx8m_blk_ctrl_domain_data imx8mq_vpu_blk_ctl_domain_data[] = {
>         [IMX8MQ_VPUBLK_PD_G1] = {
>                 .name = "vpublk-g1",
>                 .clk_names = (const char *[]){ "g1", },
>                 .num_clks = 1,
>                 .gpc_name = "g1",
> -               .rst_mask = BIT(1),
> -               .clk_mask = BIT(1),
>         },
>         [IMX8MQ_VPUBLK_PD_G2] = {
>                 .name = "vpublk-g2",
>                 .clk_names = (const char *[]){ "g2", },
>                 .num_clks = 1,
>                 .gpc_name = "g2",
> -               .rst_mask = BIT(0),
> -               .clk_mask = BIT(0),
>         },
>  };
>
> --
> 2.52.0
>

