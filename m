Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AB9D61014
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 13:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iesfD+1e0XJcSwTx9KNwWz9DxCNf+/Vb7CeNYX6bJos=; b=wIWaCOppTV96svPPS462wWdAiY
	Cm8numWg0+WPQn1zclQMNjZ6BsNFfOqbbwIHJZj0/6cpb9tWcxdp95xo99mJwzlo7C0QVrSHmyzNh
	VTZeXkX7yJSB9iPnWxfWNZk+OTsN3bvm9B7STwWUHnPkFq5R/LMZJ8OiXOSnqjL5oQCa8ao2bAqvG
	MRF0J0m6o2eVBDqAQhHuvYTot5jx/pP/07FqLpflupmb81P4LQ7Z6FONiSQUVi3KKpU1djnOkxdma
	TbDiHJe8nJ2w7GXNku5I5TtzrlaGcnhvAEw1tlCZKS0meS2t6vd6ccl0FuRHdLW6DBXwf3vQr9Gt8
	pP/0gjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlReM-000000007xn-1A7d;
	Thu, 29 Jan 2026 13:01:30 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlReJ-000000007x1-2RTo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 13:01:29 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-65807298140so1566756a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:01:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769691685; cv=none;
        d=google.com; s=arc-20240605;
        b=fZ2fYwfs+py08VT+xnvSFYeNOG/QMLLWngy9/qf/6lHR7MTNhlP1cSpQsFytAmg/Wg
         Qyxzk4KUokZaEUeU99ZiRcK/lfKJDAMoxkD50BywvXwmpNu0UoX+OsGonJxGqk0FwcpN
         14QVf5Bes69z8hmXWAhcs9pPAYwk2BnYFZ8me1cu9b0gkHg1JNZH8LfLf4KjzTjFnz6j
         YMxcTc01R3WdTL3GzXsVjaV+P2rXonRGtESCSwa4u3e206amp1UpfWmCZ8xduHMLIOCt
         2Nk6ziPqZfI74EAm01I0cokiXUXSwvcL+4+3e2VW+oedjOrN4GqwlNQsHJM+7zjIvP1e
         n0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iesfD+1e0XJcSwTx9KNwWz9DxCNf+/Vb7CeNYX6bJos=;
        fh=x5akmyoeJNSoJrGWpIi5+8aKZRea1Dlmi5Zplej0qjA=;
        b=Bx1Jf4eqEPDscTgqNzto0NnWmiA6Snooi/dYtZ6I5qQl8JwF0PC/l2KPLmAI83jrkJ
         78zd0iiMe9/doMwNtP1FAhhqmZ1399WGv7ugZm+k7gw/rp/h/5+amTIjQ9kVhkhrtRXX
         2GUf01Be4lQuRzjL5b0iwEDVYT1qhG3utMc1BCFJXu1/VvM2DFWz9a44I5OQVVVtGFds
         JDztTBx8AqmnqX70SgrWaOwu8zfEYYb241F1q2M4XvZz4JPd8zJZE+e+ESCm1FyZuaPT
         b+c91Vy4dhflw0EnDpYaBvfa29tL9u8/0ZAaDc6dBjsd9ILfdn1pAesTAnguVdqYtmpX
         lzng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769691685; x=1770296485; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iesfD+1e0XJcSwTx9KNwWz9DxCNf+/Vb7CeNYX6bJos=;
        b=BO9rOqrvThVoZ8UAnaPamU8OiGuzBB8upN5rizU16Khl9uLlO30psgk1nwjEA07VWd
         ptR36rngAENedSl7gzEL5/b8KpVxoGwocBiOz/9FWTfP4jZnLzHBilicuL92rr4Sk04/
         uZMjrKGgGXdjFUA+mywjMFNYJ0HjqDaYVNgbQATbOfO9HNnBx+VkSO7QUmZrlRFB4k2n
         luTuPtLXXhPddPLE7l8OodX4bpnDVjhRcagkN4L2P7DIOFEVuaZAAyHL7hm1XHa6XKlw
         VC4EIMqL4Wt6KSo3xAEV4ju8zWuiqlFZFUCNK1wKxLXlB39gBQMLJQuOImFVyULisw1x
         SE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769691685; x=1770296485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iesfD+1e0XJcSwTx9KNwWz9DxCNf+/Vb7CeNYX6bJos=;
        b=cXzhFIruGf95Rm1rHFt5rwhBmbQtMmmyWj5W00JMVY600Qx6SVUE03EOzKRPKaHFCT
         mybRs79eOV+0mWXJMmkDIcVWRWOusiII1xWIJfpy9y3wbWOpYfhb79HsCxjfDD+M3MDX
         VggRAotxwkmtvGCwS3mL7I0G1wxgvL80ct73vPe+WTe0zqzfhS4/HburG1ig2L7ajurb
         RTmghgozcMEwkxe7fPCSXL3pYqP4z0EFh7vXa63KvR1a1mJLIxnQZYYZs1ogyTD1PT0V
         fJkqhAPU14EpC0K+p5OMkxhoV0rycc/dcnEZ9xs9ZO/w4cDDj/ohVP7BJDLPjbiJQMfW
         cFpw==
X-Forwarded-Encrypted: i=1; AJvYcCVaE+iDKOl+hxyxp6hS1LANUH7/NN3D01oYnqdsJ0IhB8zasQ6j3lJkfTMn56dm5nylPdg0Bz+YTxVQXifPn7cB@lists.infradead.org
X-Gm-Message-State: AOJu0YxMehVkV6Sok741SWgVx0ccj5yHu7t9tznI7ytgN1Yi7HS7TxLY
	xtbvhN49U5jlF6TGBKRa/lltrP1dhNF9DCqhS708OgFiAHWBekS5MzE39ryGhqIr/8CoYJ/aVfB
	GFByyw0WBxUrIQapqldXhZRTVryDQujOsYe9IxAsNHA==
X-Gm-Gg: AZuq6aL5ZzN3SwlQamPgKECCRexpgtu7vWw7Hv0OtFKUGh2c37LR3G0ALZEC76t4DvO
	QTQQ9vjHinYJfPurHhZ+mWkTl5Bc+MBU93sfvRuYxs16PvLqYU1lIrdYvUn4c6muhT3ZdXFH3YC
	KZEXAWFE3pRtFTbFTDM1WJe4HHaOMqLq/GuUkLx5oKvLfEkSRWffYGTg5SvdZ6wjc1/n5rDZeED
	W636Tbtww4DeSthx5koB4/513kEm69moBQaHY/D2A8wWw45x2bQ1PWRUXrgrKXz0kDuFpnDgx+5
	6Buv7mWDBan9K8Bx9vHN/2ri
X-Received: by 2002:a05:6402:2711:b0:658:1eee:8a40 with SMTP id
 4fb4d7f45d1cf-658a600eeb3mr6025005a12.2.1769691684890; Thu, 29 Jan 2026
 05:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-3-vincent.guittot@linaro.org> <aXsuRTZUUnw0kdzV@horms.kernel.org>
In-Reply-To: <aXsuRTZUUnw0kdzV@horms.kernel.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 29 Jan 2026 14:01:13 +0100
X-Gm-Features: AZwV_QjS9ru6SWfw3DDchF_hxWLgsNEurVnBwt9Mvn_TEdB82tA-dgIWwcajOmY
Message-ID: <CAKfTPtDfnpzq2CB-isVzvh1ZCWo7kit9KRJvVGoU1C3zZTgdXw@mail.gmail.com>
Subject: Re: [PATCH 2/4] phy: s32g: Add serdes subsystem phy
To: Simon Horman <horms@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com, 
	p.zabel@pengutronix.de, linux@armlinux.org.uk, ghennadi.procopciuc@nxp.com, 
	bogdan-gabriel.roman@nxp.com, Ionut.Vicovan@nxp.com, 
	alexandru-catalin.ionita@nxp.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_050127_684951_F20536F8 
X-CRM114-Status: GOOD (  37.71  )
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

On Thu, 29 Jan 2026 at 10:54, Simon Horman <horms@kernel.org> wrote:
>
> On Mon, Jan 26, 2026 at 10:21:57AM +0100, Vincent Guittot wrote:
>
> ...
>
> > diff --git a/drivers/phy/freescale/phy-nxp-s32g-serdes.c b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
> > new file mode 100644
> > index 000000000000..8336c868c8dc
> > --- /dev/null
> > +++ b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
> > @@ -0,0 +1,569 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/**
> > + * SerDes driver for S32G SoCs
> > + *
> > + * Copyright 2021-2026 NXP
> > + */
> > +
> > +#include <dt-bindings/phy/phy.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
>
> Hi Vincent, all,
>
> I think that you also need:
>
> #include <linux/iopoll.h>
>
> So that read_poll_timeout() is declared.
> Else this patch causes a transient build failure
> (for x86_64 allmodconfig)

ok, i will add it

>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/of_address.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/processor.h>
> > +#include <linux/reset.h>
> > +#include <linux/units.h>
>
> ...
>
> > +static int s32g_serdes_phy_set_mode_ext(struct phy *p,
> > +                                     enum phy_mode mode, int submode)
> > +{
> > +     struct s32g_serdes *serdes = phy_get_drvdata(p);
> > +
> > +     if (mode == PHY_MODE_PCIE)
> > +             return -EINVAL;
>
> This is part of an AI Generated review.
> I have looked over it and I think it warrants investigation.
> For information on how to reproduce locally, as I did, please see [1].
>
> [1] https://netdev-ai.bots.linux.dev/ai-local.html
>
>   This returns error if mode IS PHY_MODE_PCIE, but this is a PCIe PHY!
>   This looks like a typo. Should be !=.

yes don't know what happened here but it should be !=

>
> > +
> > +     if (!is_pcie_phy_mode_valid(submode))
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Do not configure SRIS or CRSS PHY MODE in conjunction
> > +      * with any SGMII mode on the same SerDes subsystem
> > +      */
> > +     if ((submode == CRSS || submode == SRIS) &&
> > +         serdes->ctrl.ss_mode != 0)
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Internal reference clock cannot be used with either Common clock
> > +      * or Spread spectrum, leaving only SRNSS
> > +      */
> > +     if (submode != SRNS &&  !serdes->ctrl.ext_clk)
> > +             return -EINVAL;
> > +
> > +     serdes->pcie.phy_mode = submode;
>
> The AI review also suggested that it may be unsafe
> to set the submode after s32g_serdes_phy_power_on()
> has been called. And that there is nothing preventing that.
>
> TBH, I am unsure if either of those statements are true.
> But it seems worth validating with you.

yes, the usual pattern is :
- phy_set_mode_ext()
- then phy_power_on()
but I can add an additional check

>
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +static int s32g_serdes_get_ctrl_resources(struct platform_device *pdev, struct s32g_serdes *serdes)
> > +{
> > +     struct s32g_serdes_ctrl *ctrl = &serdes->ctrl;
> > +     struct device *dev = &pdev->dev;
> > +     int ret, idx;
> > +
> > +     ret = of_property_read_u32(dev->of_node, "nxp,sys-mode",
> > +                                &ctrl->ss_mode);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to get SerDes subsystem mode\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (ctrl->ss_mode > S32G_SERDES_MODE_MAX) {
> > +             dev_err(dev, "Invalid SerDes subsystem mode %u\n",
> > +                     ctrl->ss_mode);
> > +             return -EINVAL;
> > +     }
> > +
> > +     ctrl->ss_base = devm_platform_ioremap_resource_byname(pdev, "ss_pcie");
> > +     if (IS_ERR(ctrl->ss_base)) {
> > +             dev_err(dev, "Failed to map 'ss_pcie'\n");
> > +             return PTR_ERR(ctrl->ss_base);
> > +     }
> > +
> > +     ctrl->rst = devm_reset_control_get(dev, "serdes");
> > +     if (IS_ERR(ctrl->rst))
> > +             return dev_err_probe(dev, PTR_ERR(ctrl->rst),
> > +                                  "Failed to get 'serdes' reset control\n");
> > +
> > +     ctrl->nclks = devm_clk_bulk_get_all(dev, &ctrl->clks);
> > +     if (ctrl->nclks < 1)
> > +             return dev_err_probe(dev, ctrl->nclks,
> > +                                  "Failed to get SerDes clocks\n");
>
> If devm_clk_bulk_get_all returns 0 then this value will
> be passed to dev_err_probe(). And 0 will, in turn be returned by
> dev_err_probe() and this function. However, that will be treated
> as success by the caller, even though this is an error condition.
>
> Perhaps something like this is more appropriate if ctrl->nclks
> must be greater than 0. (Completely untested!)
>
>         if (ctrl->nclks < 1) {
>                 ret = ctrl->nclks ? : -EINVAL;
>                 return dev_err_probe(dev, ret,
>                                      "Failed to get SerDes clocks\n");
>         }
>
> Flagged by Smatch.

okay

>
> ...
>
> > +static int s32g_serdes_parse_lanes(struct device *dev, struct s32g_serdes *serdes)
> > +{
> > +     int ret;
> > +
> > +     for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> > +             ret = s32g2_serdes_create_phy(serdes, of_port);
> > +             if (ret)
> > +                     break;
> > +     }
> > +
> > +     return ret;
>
> Perhaps it cannot occur.
> But if the loop above iterates zero times,
> then ret will be used uninitialised here.

should not but will fix it

>
> Also flagged by Smatch.
>
> > +}
> > +
> > +static int s32g_serdes_probe(struct platform_device *pdev)
> > +{
> > +     struct s32g_serdes *serdes;
> > +     struct device *dev = &pdev->dev;
> > +     int ret;
> > +
> > +     serdes = devm_kzalloc(dev, sizeof(*serdes), GFP_KERNEL);
> > +     if (!serdes)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, serdes);
> > +     serdes->dev = dev;
> > +
> > +     ret = s32g_serdes_get_ctrl_resources(pdev, serdes);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = s32g_serdes_get_pcie_resources(pdev, serdes);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = s32g_serdes_parse_lanes(dev, serdes);
> > +     if (ret)
> > +             return ret;
>
> The I review also says:
>
>   The probe function calls s32g_serdes_init() which enables clocks,
>   configures hardware, and deasserts reset. However,
>   s32g_serdes_parse_lanes() creates PHY providers via
>   devm_of_phy_provider_register().
>
>   Problem: PHY consumers can start calling PHY ops (like power_on) as soon
>   as the provider is registered, but the hardware isn't initialized until
>   s32g_serdes_init() runs afterward. This creates a race window.
>
>   Recommendation: Move s32g_serdes_init() before s32g_serdes_parse_lanes().

I will look at this more deeply but part of s32g_serdes_init() needs
lanes to be parsed for configuring clock

>
> > +
> > +     ret = s32g_serdes_init(serdes);
> > +
> > +     return ret;
>
> nit: This could be more succinctly written as:

fair enough

>
>         return s32g_serdes_init(serdes);
>
> > +}
>
> ...

