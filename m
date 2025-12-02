Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B512CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 07:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPpoNFpl7eB0GvuBmDhAiAASKV4l73/8/88UTe/zNAM=; b=cEu100r9cQOw6HmujbSO9Cv6rP
	yUKWBWJ3oRQhrGFziN5AHqjQL6k80zGn2Tbxa9jJzN451m3AhE0yIaq1agj9qRDLtpYjszGhQ8WUb
	zg0LkrVRj3Msm+g9CF7D10cEV3rC+VVeHAa+izYHEqvWMLo3FAaY0pnIOk0PZvtnTk9fJmfBwU8yl
	Q9n+CxIEG9ZOfvHzQhQMBGHBWr3CzmFeKd3pphf+uQD/8SS9BzFAE3xlKa92QEcvzB0m2FKznNPhh
	EPb/CNt/CgU27/OaEbHqFAwehQ5lrO63Nf7QBexVWhzRcDPnE/uqd0oNkMSIXx+d6yI8yvNXPyt7s
	6J1VQ28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLGU-0000000515n-1s9R;
	Tue, 02 Dec 2025 07:57:38 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLGP-00000005145-48qE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 07:57:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vQLGG-00054h-BS; Tue, 02 Dec 2025 08:57:24 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vQLGG-003Zr7-03;
	Tue, 02 Dec 2025 08:57:24 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vQLGF-001XiD-2n;
	Tue, 02 Dec 2025 08:57:23 +0100
Date: Tue, 2 Dec 2025 08:57:23 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pmdomain: imx93-blk-ctrl: convert to devm_* only
Message-ID: <20251202075723.myevt4wa2kpyehdd@pengutronix.de>
References: <20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de>
 <20251201-v6-18-topic-imx93-blkctrl-v1-2-b57a72e60105@pengutronix.de>
 <aS4ZpyhrJ1IpUCKv@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS4ZpyhrJ1IpUCKv@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_235734_843787_F63F9170 
X-CRM114-Status: GOOD (  34.15  )
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

On 25-12-01, Frank Li wrote:
> On Mon, Dec 01, 2025 at 06:12:06PM +0100, Marco Felsch wrote:
> > Some APIs used by this driver don't have devm_ helpers yet. Instead of
> > using the devm_add_action_or_reset() the current driver is based on hand
> > crafted error goto paths and a .remove() callback.
> >
> > Convert the driver to devm_ APIs only by making use of
> > devm_add_action_or_reset() and devm_pm_runtime_enable() to simplify the
> > release and error path.
> 
> Nit: I think keep this paragaph should be enough.

I can re-phrase it.

> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/pmdomain/imx/imx93-blk-ctrl.c | 64 +++++++++++++++--------------------
> >  1 file changed, 27 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> > index 2aa163aef8de4ee901b9cde76ce2aad246c8c08a..13b0de6dd689cf944e034f7666a4e97b0118e3bd 100644
> > --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> > +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> > @@ -188,6 +188,20 @@ static int imx93_blk_ctrl_power_off(struct generic_pm_domain *genpd)
> >  	return 0;
> >  }
> >
> ...
> >  static struct lock_class_key blk_ctrl_genpd_lock_class;
> >
> >  static int imx93_blk_ctrl_probe(struct platform_device *pdev)
> > @@ -256,10 +270,8 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
> >  			domain->clks[j].id = data->clk_names[j];
> >
> >  		ret = devm_clk_bulk_get(dev, data->num_clks, domain->clks);
> > -		if (ret) {
> > -			dev_err_probe(dev, ret, "failed to get clock\n");
> > -			goto cleanup_pds;
> > -		}
> > +		if (ret)
> > +			return dev_err_probe(dev, ret, "failed to get clock\n");
> >
> >  		domain->genpd.name = data->name;
> >  		domain->genpd.power_on = imx93_blk_ctrl_power_on;
> > @@ -267,11 +279,12 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
> >  		domain->bc = bc;
> >
> >  		ret = pm_genpd_init(&domain->genpd, NULL, true);
> > -		if (ret) {
> > -			dev_err_probe(dev, ret, "failed to init power domain\n");
> > -			goto cleanup_pds;
> > -		}
> > +		if (ret)
> > +			return dev_err_probe(dev, ret, "failed to init power domain\n");
> >
> > +		ret = devm_add_action_or_reset(dev, imx93_release_pm_genpd, &domain->genpd);
> > +		if (ret)
> > +			return dev_err_probe(dev, ret, "failed to add pm_genpd release callback\n");
> >  		/*
> >  		 * We use runtime PM to trigger power on/off of the upstream GPC
> >  		 * domain, as a strict hierarchical parent/child power domain
> > @@ -288,39 +301,17 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
> >  		bc->onecell_data.domains[i] = &domain->genpd;
> >  	}
> >
> > -	pm_runtime_enable(dev);
> > +	devm_pm_runtime_enable(dev);
> 
> Need check return value

Missed this one, thanks.

> >  	ret = of_genpd_add_provider_onecell(dev->of_node, &bc->onecell_data);
> > -	if (ret) {
> > -		dev_err_probe(dev, ret, "failed to add power domain provider\n");
> > -		goto cleanup_pds;
> > -	}
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to add power domain provider\n");
> >
> > -	dev_set_drvdata(dev, bc);
> 
> why remove dev_set_drvdata(dev, bc)

Because it's no longer needed, it was required due to the .remove()
callback. I wasn't sure if I should mention this within the commit
message. I'm going to add it to the commit message since you asked.

Regards,
  Marco

> 
> Frank
> > +	ret = devm_add_action_or_reset(dev, imx93_release_genpd_provider, dev->of_node);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to add genpd_provider release callback\n");
> >
> >  	return 0;
> > -
> > -cleanup_pds:
> > -	for (i--; i >= 0; i--)
> > -		pm_genpd_remove(&bc->domains[i].genpd);
> > -
> > -	return ret;
> > -}
> > -
> > -static void imx93_blk_ctrl_remove(struct platform_device *pdev)
> > -{
> > -	struct imx93_blk_ctrl *bc = dev_get_drvdata(&pdev->dev);
> > -	int i;
> > -
> > -	of_genpd_del_provider(pdev->dev.of_node);
> > -
> > -	pm_runtime_disable(&pdev->dev);
> > -
> > -	for (i = 0; i < bc->onecell_data.num_domains; i++) {
> > -		struct imx93_blk_ctrl_domain *domain = &bc->domains[i];
> > -
> > -		pm_genpd_remove(&domain->genpd);
> > -	}
> >  }
> >
> >  static const struct imx93_blk_ctrl_domain_data imx93_media_blk_ctl_domain_data[] = {
> > @@ -455,7 +446,6 @@ MODULE_DEVICE_TABLE(of, imx93_blk_ctrl_of_match);
> >
> >  static struct platform_driver imx93_blk_ctrl_driver = {
> >  	.probe = imx93_blk_ctrl_probe,
> > -	.remove = imx93_blk_ctrl_remove,
> >  	.driver = {
> >  		.name = "imx93-blk-ctrl",
> >  		.of_match_table = imx93_blk_ctrl_of_match,
> >
> > --
> > 2.47.3
> >
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

