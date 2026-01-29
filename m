Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1E5D61011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 13:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0truowzryH7wlizBZZo0nqF9JAtMd6wwNY0E8kTxdNI=; b=I7Lm2VA/cInxi4GfnhVTIxnlCs
	Gcx/xGgz7C0sVGAlhZ2SjdTRKsrHa7U45iTW6fErY6RtwMqn5jPXf1e3yo/a+Zen8QVXii/EEcgKX
	y/1/A6f7XAHMMoyQCsU0IpytTfc14L4vseYIAHr0GvS6ihN4rgfi6G6XCBzsZJ1VZ1Of9/glJtarz
	MD+BX01Jf1xxaUVOkkugU6kdMmU9ZSzQZ546bzGGX6XsCa4W4zVRKHKt+iy6ZfnEwyYZlca/Dn9yz
	F6ebqIIAEGytxqRcunsFIKHvFmmy5L8s6ouCMaVZurrT/YPEP37I2pmDvBptmu1CPn9nfRa+CZgF6
	UPt3xp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlS0e-000000009aO-1L3h;
	Thu, 29 Jan 2026 13:24:32 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlS0b-000000009ZA-1A2M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 13:24:31 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-64b9dfc146fso1830834a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:24:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769693067; cv=none;
        d=google.com; s=arc-20240605;
        b=TZGJ/3+ps85vCdqdJAiC8fwl2YQqx7Gy39IQdr9fM1TCc8X1afgcCqfNkvygPF2TgK
         zkZA2Lr7i1khU65SN6EBELnomdOSZ+uyA5KYxCDHNvQKLyIayeVl1MHa8R1Y/rhaDg6i
         bmB1tzegmFrpt1cTFohxujSGKPxGzeHwzteg0Vj3nbi3o5M1qK861UX/SFiSeK3WQll5
         D3AibiprbcC+Rq1MYttekr45tZexZ1r8ZJN93xv6Hvbk5dsZ+G7vifbcTFJila7Z0gt1
         xxldx4MofDe6UqXfcqEZCryQZdGtBUcgCtcgio4SMipyyPd95ZTB93QKDfKsbEjSKGcE
         h6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0truowzryH7wlizBZZo0nqF9JAtMd6wwNY0E8kTxdNI=;
        fh=z0+s7SWi7NCu70wDZOMAG7GC0ie/8ov359gUu80ycUQ=;
        b=Fb1zVHafY4xn6K0PuAfxoIp+JOxiRrX3omXaLPjyU4vQVpTxJUxI16isjIfZaHRpAw
         3zTv9oHGFDzGKDTJX8DMK1oMlhxUPczxQQd8u+kDc6RacWL+cS9HxR8nF/H3r8Eiyj4D
         C4IRTKjJPlQybudDdUaVGuts2UuWd+fi0AhVyeoS5b/o8G2tmydwYz+0vy98ZRS0nJMg
         1B3SCBjnIQ4Q3ZnvmIOWjCJj7ydGE6LRyPYMoMfnPz3fCIp7t69WaHg0GNAVdeGGzqsr
         Yrf6jn/viEq6ddqC0k1HqGuF0H7OfrJMJRir1Aqj/0y/P7DvB4QhGzOW62PHZHoua4zn
         BUlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769693067; x=1770297867; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0truowzryH7wlizBZZo0nqF9JAtMd6wwNY0E8kTxdNI=;
        b=d1+dkvvqQfRY2xwLsVFZ+w0+ZEE4S1ZooM92wwkBRdv9UsHEAR+ktsPRHyHJmRJTBY
         +BoYnlapfAi7XRmuajsCZtzrkoHCil7hRj34QN0iyaemvJGqPr6Hf1MjZNt4zAY9N35+
         wgLIZ9tBeZom0MNfVR+88SswScnHyshBcD4qeL8lKuBYhPnC2BtHLdSjs+mhiG+lOKxt
         f26bSbsjSN8bbJa6wG/HJgOUk3KtHl5SBk42iuc+zFE+Hq0An3JSmX8o5kzsHtHemr3K
         l2jrseqeqILhChgJZ1qGMN4qi2i8AyiXSbPIQLNrCmTjeteSc6CMknzr4exD0fBuhwCX
         e8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769693067; x=1770297867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0truowzryH7wlizBZZo0nqF9JAtMd6wwNY0E8kTxdNI=;
        b=KknWxqxyOQU38N9vBDs4kCn622Hz111ZJW4fc/j2IEwz/0gnQEXMgOeK+1yZjGSmtP
         fZyemeZGOn+HY3Cj63+RjaRtwRsxTLaaGgny1eJ3t8WAPdqKMsWlyzLUdW4AHICOwsYu
         wj/Lh6F3SaQfZc4/ZrVluvfhfO7ncqua1h4tY8hTK2JJZMQVUkbSEaazYKyMXaF+8E2B
         6/I6je44nRS7v0KO4V0/gFm89hbUPxoQpocUUy9WPNIQdsG8zUo6n11y+LQFRvWWDIqV
         Vgko/Sm3LtpPlHsCwwpv6fsEC/4ZYrb41ZCKZN26e7v2PYgr9WLwKNgid5Rha3SNJhMO
         A7dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVdH1wVlzqvxGOsJPjM6Ip3oli76q00k49HdUfh1nux7HNM2Pjp9+XGSG3SnijeIy8tTf6bBZavtLjSTKck/S4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1tpBHiqqjsWJkbdFk9uR0paIR4RpZm61qllaokbfjcibfagdh
	bVR8B8U+ozbx30idoJBXMs5QnNdLbE6+Q8gtRF+j7uSDU6MsZwtCkAAk6SCCNTFiBstIolrz+PX
	sw/LRy6kepQEEA9EqRumUq1QGVODaejpbU2lGt5z2Ow==
X-Gm-Gg: AZuq6aJx5GEK0+UO51Re7pXzzLXMMNzzIS9m2D0T9UvIWQnDyOP9JjQpjI2OH+S0q61
	KAzb6Bwjqj1k1QMZkKO7o8Bz1uC0Cga3sRAl/j6T7LRKeVg2gM8HnhUuoXSTA+eN0wcW2pWi74J
	rSHw77YuEw5F4zOb2MT8YBosA9EkmJRcUQpEBoSTKp2L4EZDMjW7sK6NUKuLFwAy2JTwT4N1MRO
	PDgXviI8wB6+t2GeNXYBiWulKZYjaPABYEcasKmRmSPogXgvMh+E2iqVkrlkFSZdtpzUrB3+e23
	zH0KFFu2xWR7Ay8EL+dcr9Trt4vQuzCOjp8=
X-Received: by 2002:aa7:dad6:0:b0:658:ded:97c8 with SMTP id
 4fb4d7f45d1cf-658cb209a64mr1273909a12.9.1769693067077; Thu, 29 Jan 2026
 05:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-4-vincent.guittot@linaro.org> <aXtLsuOkMMryrUs4@horms.kernel.org>
In-Reply-To: <aXtLsuOkMMryrUs4@horms.kernel.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 29 Jan 2026 14:24:15 +0100
X-Gm-Features: AZwV_Qj34ALujTrAHxV7HbCKDsW1Vf0wOdcaUENF06tNDpMBNRYgeeOZo4BoYeU
Message-ID: <CAKfTPtB8xDB8qYUZwGnH+h94ww3+gSyOuZ+RL+zOh5tYGuu_HQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] phy: s32g: Add serdes xpcs subsystem
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
X-CRM114-CacheID: sfid-20260129_052429_465068_C5FC6155 
X-CRM114-Status: GOOD (  32.92  )
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

On Thu, 29 Jan 2026 at 12:59, Simon Horman <horms@kernel.org> wrote:
>
> On Mon, Jan 26, 2026 at 10:21:58AM +0100, Vincent Guittot wrote:
>
> ...
>
> > diff --git a/drivers/phy/freescale/phy-nxp-s32g-serdes.c b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
>
> ...
>
> > +static void s32g_serdes_prepare_pma_mode5(struct s32g_serdes *serdes)
> > +{
> > +     u32 val;
> > +     /* Configure TX_VBOOST_LVL and TX_TERM_CTRL */
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MISC_CTRL_2);
> > +     val &= ~(EXT_TX_VBOOST_LVL_MASK | EXT_TX_TERM_CTRL_MASK);
> > +     val |= FIELD_PREP(EXT_TX_VBOOST_LVL_MASK, 0x3) |
> > +             FIELD_PREP(EXT_TX_TERM_CTRL_MASK, 0x4);
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MISC_CTRL_2);
>
> This is part of an AI Generated review.
> I have looked over it and I think it warrants investigation.
> For information on how to reproduce locally, as I did, please see [1].
>
>         The entire s32g_serdes_prepare_pma_mode5() function is ~70 lines of
>         magic numbers with zero explanation. These appear to be
>         hardware-specific PLL/PHY tuning parameters for 2.5G mode.

Unfortunately there is no additional information in the reference
manual other than
*step 4:
- Write 3h to EXT_TX_VBOOST_LVL.
- Write 4h to EXT_TX_TERM_CTRL

>
> Please consider using #defines, to give values names.
>
> ...
>
> > +static int s32g_serdes_init_clks(struct s32g_serdes *serdes)
> > +{
> > +     struct s32g_serdes_ctrl *ctrl = &serdes->ctrl;
> > +     struct s32g_xpcs_ctrl *xpcs = &serdes->xpcs;
> > +     int ret, order[2], xpcs_id;
> > +     size_t i;
> > +
> > +     switch (ctrl->ss_mode) {
> > +     case 0:
> > +             return 0;
> > +     case 1:
> > +             order[0] = 0;
> > +             order[1] = XPCS_DISABLED;
> > +             break;
> > +     case 2:
> > +     case 5:
> > +             order[0] = 1;
> > +             order[1] = XPCS_DISABLED;
> > +             break;
> > +     case 3:
> > +             order[0] = 1;
> > +             order[1] = 0;
> > +             break;
> > +     case 4:
> > +             order[0] = 0;
> > +             order[1] = 1;
> > +             break;
> > +     default:
> > +             return -EINVAL;
>
> AI review also flags that s32g_serdes_get_ctrl_resources() ensures that
> ss_mode is <= 5.  So this check is unnecessary.

okay but providing a default seems a good practice

>
> > +     }
> > +
> > +     for (i = 0; i < ARRAY_SIZE(order); i++) {
> > +             xpcs_id = order[i];
> > +
> > +             if (xpcs_id == XPCS_DISABLED)
> > +                     continue;
> > +
> > +             ret = s32g_xpcs_init_plls(xpcs->phys[xpcs_id]);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (ctrl->ss_mode == 5) {
> > +             s32g_serdes_prepare_pma_mode5(serdes);
> > +
> > +             ret = s32g_xpcs_pre_pcie_2g5(xpcs->phys[1]);
>
> Also from the AI review:
>
>         In mode 5, code directly accesses xpcs->phys[1] without checking if
>         it was created. If XPCS1 wasn't created for some reason (DT
>         misconfiguration, probe failure), this NULL dereferences.

I will add a check

>
> ...
>
> > @@ -460,6 +741,41 @@ static int s32g2_serdes_create_phy(struct s32g_serdes *serdes, struct device_nod
>
> ...
>
> > +             xpcs = devm_kmalloc(dev, sizeof(*xpcs), GFP_KERNEL);
> > +             if (IS_ERR(xpcs)) {
> > +                     dev_err(dev, "Failed to allocate xpcs\n");
> > +                     return -ENOMEM;
> > +             }
>
> AI review also flags:
>
>         devm_kmalloc() returns NULL on failure, not an error pointer.
>         This check will never trigger.

okay

>
> [1] https://netdev-ai.bots.linux.dev/ai-local.html
>
> > +
> > +             xpcs_ctrl->phys[port] = xpcs;
> > +
> > +             xpcs->an = of_property_read_bool(dev->of_node, "nxp,xpcs_an");
>
> AI review flags that nxp,xpcs_an is not part of the binding.

That's a leftover that should be removed

>
> ...
>
> > +struct phylink_pcs *s32g_serdes_pcs_create(struct device *dev, struct device_node *np)
> > +{
> > +     struct platform_device *pdev;
> > +     struct device_node *pcs_np;
> > +     struct s32g_serdes *serdes;
> > +     u32 port;
> > +
> > +     if (of_property_read_u32(np, "reg", &port))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     if (port > S32G_SERDES_XPCS_MAX)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     /* The PCS pdev is attached to the parent node */
> > +     pcs_np = of_get_parent(np);
> > +     if (!pcs_np)
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     if (!of_device_is_available(pcs_np)) {
> > +             of_node_put(pcs_np);
> > +             return ERR_PTR(-ENODEV);
> > +     }
> > +
> > +     pdev = of_find_device_by_node(pcs_np);
> > +     of_node_put(pcs_np);
> > +     if (!pdev || !platform_get_drvdata(pdev)) {
> > +             if (pdev)
> > +                     put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
> > +
> > +     serdes = platform_get_drvdata(pdev);
>
> Also from the AI review:
>
>         On success, the function gets a reference to pdev but never
>         releases it. This leaks a device reference every time a MAC driver
>         calls s32g_serdes_pcs_create().

will fix it

>
> > +
> > +     return &serdes->xpcs.phys[port]->pcs;
>
> Also from the AI review:
>
>         The check port > S32G_SERDES_XPCS_MAX allows port=2,
>         but array only has indices 0 and 1.
>
> Also I'm not seeing bounds checking on port in s32g2_serdes_create_phy
> which uses port as an index for the same array both directly and indirectly
> via s32g_serdes_xpcs_init().

will add it

>
> ...
>
> > diff --git a/drivers/phy/freescale/phy-nxp-s32g-xpcs.c b/drivers/phy/freescale/phy-nxp-s32g-xpcs.c
>
> ...
>
> > +static int s32g_xpcs_regmap_reg_read(void *context, unsigned int reg,
> > +                                  unsigned int *result)
> > +{
> > +     struct s32g_xpcs *xpcs = context;
> > +     u16 ofsleft = (reg >> 8) & 0xffffU;
> > +     u16 ofsright = (reg & 0xffU);
> > +
> > +     writew(ofsleft, xpcs->base + ADDR1_OFS);
> > +     *result = readw(xpcs->base + (ofsright * 4));
> > +
> > +     return 0;
> > +}
> > +
> > +static int s32g_xpcs_regmap_reg_write(void *context, unsigned int reg,
> > +                                   unsigned int val)
> > +{
> > +     struct s32g_xpcs *xpcs = context;
> > +     u16 ofsleft = (reg >> 8) & 0xffffU;
> > +     u16 ofsright = (reg & 0xffU);
> > +
> > +     writew(ofsleft, xpcs->base + ADDR1_OFS);
> > +     writew(val, xpcs->base + (ofsright * 4));
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct regmap_config s32g_xpcs_regmap_config = {
> > +     .reg_bits = 16,
> > +     .val_bits = 16,
> > +     .reg_read = s32g_xpcs_regmap_reg_read,
> > +     .reg_write = s32g_xpcs_regmap_reg_write,
> > +     .wr_table = &s32g_xpcs_wr_table,
> > +     .rd_table = &s32g_xpcs_rd_table,
> > +     .max_register = 0x1F80E1,
> > +};
>
> AI review also flags that s32g_xpcs_regmap_reg_read and
> s32g_xpcs_regmap_reg_write do not protect against concurrent access.

but regmap framework should

>
> ...

