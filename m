Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B3CEC1E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbQJDXfJQp3l0owu271/9ErzB2CssEZ2WkwBrKRmRCk=; b=PqHUU9+WJkXZx610rkkSMQPnYa
	fN6RqqxdfKzNyxlt+QlYjmykwWDv/hnmO9lUEYkg22U9p+eyLkRLtsdJPPnDprzVCX5SGbb5FU2jT
	ySO5Ndn1PDuO8AzNY/5XOYTlpfQzxsJFRHmi9KKXbZAEiGeK22lBtcsCG38u2zHAutcE18TglChMD
	FOtoCaKQLDBGpj+CSu3n21Va2wINcmwLBGFPeYlhCYYocZWKisiMTSq2QW4rZnC0Hb+lkFci2ve/z
	iTBUltSaOd07JxrrlzPOYIz7LISem9LO4z5JLUCNWwrdfjISdsIovR8RvZgGUWuVVxhQr6U3L6rTV
	i7D9mPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnx3B-00000009o8Y-19ve;
	Thu, 05 Feb 2026 10:57:29 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnx37-00000009o7x-09bb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 10:57:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59ddb31ddcaso1079555e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 02:57:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770289043; cv=none;
        d=google.com; s=arc-20240605;
        b=KIUMMPsjOUjVXUV854zROYbH2hivl42XzV9SstQY4IUnAId+c0hj3y7KZizmbxObuy
         iyv607KTzWeXkFzzxPTHd8YrZQo6hUQut98gISTcFhYIF8jcr83J7iEavlCx5+knPifx
         idhl2frKzI8P1IBMbmpvSXGRAb7i0PPv3EBW5K+yhvKBs3TfP2MEaBgOm34ibrwhK2Ms
         9VG1gwK8ikgH2xV3VGHqFQgXtkmwA7FH2UjcdGzC3xbZS3Kyv76rxfBY4GvyUsqXHzjH
         5h4PIbvhGc2Kc+kddtUiOUII9md+EdOkzqYH8Kl4psDm7nllu5R5OcGimGku+XSJ9ymv
         MaIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UbQJDXfJQp3l0owu271/9ErzB2CssEZ2WkwBrKRmRCk=;
        fh=KQnbdQYNmWfnbTmaJYPfYxCPLdAQL1GFWrSEZ8BM4Ig=;
        b=XkYl6J8Ry8L6evbtobWUsYT+o5bZQDlTbZw1HuKk8CcghXQ3uSG93OpGDT6FzobxaB
         As0xBOZlvyQDqZw9rvBBTpd9X9K5OzCxUTKajVOQC1tmtPvmao9WhU7TMNXml8aGXGw3
         ZcFLQQAlGFKwGaO0FLR7Unihi8i3EizbJKVTi05Fm7WNog6BbBzF9tdoqid4UURRY0/R
         ZolEovC06kinE+xmk8wo3Bc5AlMXVY2x0WFURB2sPp62GUkuRQGF42wm0pAz9VuFVHU7
         ZOukQPEWyMfiwlEMiRKf6sRfizDLErvLYm0aXAgWkPsPYrozIBTNnQbBwoLV6cw3e135
         LrHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770289043; x=1770893843; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UbQJDXfJQp3l0owu271/9ErzB2CssEZ2WkwBrKRmRCk=;
        b=x5DmDEAYxqK4mbL+kpZF1zUC6vRzHpuG20HQyJim6YrX1du0+qKzzXzmuQuwLdIRes
         wZWSboZ0pDtfiJ9wOGPgh6ZlMNKpDkKp9r/JR6R7f8FGZ2+2atJ0VRVPJcGrTzm5MpYG
         BBRyct5NGMwGIXW0Su0wHiOXQx6EZE5ZajRh2UXwNzIq3zKtNyEu9KU6242RSU9LSR/6
         TqhXTxLb1M/fDCFS1sLE4zH9wK3BMNgS5o4pc68LaghJ2u+Rg8yLe4il6WvMoqEVJiWg
         yHoWvuJIj3MQM+1XCA0ZbeOJbeMHcH+mCluseZVGp4XuaNw/R+gyuAjrKrjqHAYOlObr
         jCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770289043; x=1770893843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbQJDXfJQp3l0owu271/9ErzB2CssEZ2WkwBrKRmRCk=;
        b=s46NKDQlWd/0Gak6aIjhxfBtpkP4HSnvpGX1lmRktFWRT0E/dPQ0lOX54V7Fwg3Ajl
         O2MDPmard+wiz4keB86Zdo6WRld/rdm/sVYCGOslaV4icJKRo89VynbCgjm8oa0nsRav
         DbSy4nT4IIs7KE91Pw8n8O+ZlsniEen2h5mKPFhvPHPMiVINb0ymuThaeCs0KKwZJ7Rp
         oRaN5WOGLNskVN1DMEqoo4wrOLpWLg4/9Kcmf94WJv7XzO3yRtAE3YnyFyQUk/oIOEAl
         KJmtHbXxmtTDPWw3JGAW+q3JCOExxVfr7JIPEDkja+Lb4CQftadFgAClyVDgFUveENM0
         Utjg==
X-Forwarded-Encrypted: i=1; AJvYcCUoyf+2gdKehT+6XyogKcfMJmHlu13iyhgdUew92JrZiJrqEVYlvle92sTU1gpmGkTJDImxYN25JTpLqeLtNnSR@lists.infradead.org
X-Gm-Message-State: AOJu0YyBagK3wCMFGECWZ3xIoS8rpqXPb1VGmi+MzL/saNRv7cMxh/zu
	2sODnpamekuOZTlYyuYjmCbtAgsErCVv/5ZC3IjXb1EwNgAe6E1kpwXKEi3gPjm6qMRGoXhOzUG
	/fBvOBN1Now/fxRAVCgXMuSABx/stVv9/Pjf/A9P1Ug==
X-Gm-Gg: AZuq6aItsuz/4Ml5m+ddJSqAekaRpKA+rfC20zuWk143HzHsidZAWMeX8yLAiPST3Gs
	1zPIDfiE482WIrWTk3p44XmNek2nx5xaoDGtBgO2vPepB4X7bF9U16XJyeA7uhF7ed3AI5hcalj
	ciTgRSPd8KI5y94cC5cMQ6XBDev8Zwh6qFnD109u2mMRBxeyZYtTWnatd/ZwNmxaUq2a8gV89W1
	7y3ojhPA8LJkBdBe2p7qeTdMSrXFqFLIeKi+kmB0TN+SlBY/60QThGtY4C7izet/Z8Mt1zS
X-Received: by 2002:ac2:5691:0:b0:59e:4095:8ac4 with SMTP id
 2adb3069b0e04-59e40958afdmr326028e87.9.1770289042830; Thu, 05 Feb 2026
 02:57:22 -0800 (PST)
MIME-Version: 1.0
References: <20260204111142.2147646-1-xu.yang_2@nxp.com> <20260204111142.2147646-2-xu.yang_2@nxp.com>
In-Reply-To: <20260204111142.2147646-2-xu.yang_2@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Feb 2026 11:56:46 +0100
X-Gm-Features: AZwV_Qh83Z_dpPdJhPeihOR5dVWzbbZZkHZdMTDNgM3o1uPYj_8fR3Ht0j6JmE0
Message-ID: <CAPDyKFpzygoVuDNV1fYN+zfzFHfoXzJCddydNfRvUN9KuxSX5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: imx8mp-blk-ctrl: keep usb phy power
 domain on for wakeup
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, peng.fan@nxp.com, jun.li@nxp.com, 
	rafael.j.wysocki@intel.com, a.fatoum@pengutronix.de, ping.bai@nxp.com, 
	shawnguo@kernel.org, l.stach@pengutronix.de, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_025725_097046_E174C02B 
X-CRM114-Status: GOOD (  20.25  )
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

On Wed, 4 Feb 2026 at 12:10, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> USB remote wakeup need its PHY on, so add USB PHY power domain on active
> flag.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied for fixes and by amending the commit message a little bit to
make it clearer, thanks!

I also added a fixes/stable tag, the same that we used for patch 1.

Kind regards
Uffe


>
> ---
> Changes in v2:
>  - add flag to block control related power domain
> ---
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index 56bbfee8668d..8fc79f9723f0 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -53,6 +53,7 @@ struct imx8mp_blk_ctrl_domain_data {
>         const char * const *path_names;
>         int num_paths;
>         const char *gpc_name;
> +       const unsigned int flags;
>  };
>
>  #define DOMAIN_MAX_CLKS 3
> @@ -265,10 +266,12 @@ static const struct imx8mp_blk_ctrl_domain_data imx8mp_hsio_domain_data[] = {
>         [IMX8MP_HSIOBLK_PD_USB_PHY1] = {
>                 .name = "hsioblk-usb-phy1",
>                 .gpc_name = "usb-phy1",
> +               .flags = GENPD_FLAG_ACTIVE_WAKEUP,
>         },
>         [IMX8MP_HSIOBLK_PD_USB_PHY2] = {
>                 .name = "hsioblk-usb-phy2",
>                 .gpc_name = "usb-phy2",
> +               .flags = GENPD_FLAG_ACTIVE_WAKEUP,
>         },
>         [IMX8MP_HSIOBLK_PD_PCIE] = {
>                 .name = "hsioblk-pcie",
> @@ -724,6 +727,7 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
>                 domain->genpd.name = data->name;
>                 domain->genpd.power_on = imx8mp_blk_ctrl_power_on;
>                 domain->genpd.power_off = imx8mp_blk_ctrl_power_off;
> +               domain->genpd.flags = data->flags;
>                 domain->bc = bc;
>                 domain->id = i;
>
> --
> 2.34.1
>

