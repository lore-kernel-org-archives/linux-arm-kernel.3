Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47475C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9WgnNk8hsJqucJXyV7OVTWvviSo1PzyLdaWKwbmS6M=; b=cAWK5DmWT2aNUrAE6ppAtuM+fO
	UpGy6Z9R8Eq0NAnZpKgAs6TUSLRv3x2Yu/1M77tTAJJVUY9wBRQ7hhFzKRSfDLpsCMWpErbG6n8O6
	za+k6c2La+4ysYas7UMG+CiMEvIqQ+bMeDiNMpDeS3FJuvifphpEUfCQKG7hQLmKnbZDVjW2348K7
	xfV2AjqHDEux4uavPjb2o64sINVSrg3li4Hi1D2bqFat5Exl/CuvvAKqop/Ci6Z1VgV6JDHzbBMst
	FmMnvLQbqeiHER8tlIRxvbxdM8REMsSW81gg2XOFg+a+nChPOBlcfItRtjxcb1okjXIU2nu8ZmlrQ
	1e7kkoHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhoZ-00000003bd3-127l;
	Mon, 10 Mar 2025 18:25:23 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trhmu-00000003bVN-2yz9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 18:23:42 +0000
Received: from localhost (unknown [10.10.165.14])
	by mail.ispras.ru (Postfix) with ESMTPSA id 6D5F140CE18B;
	Mon, 10 Mar 2025 18:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 6D5F140CE18B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1741631012;
	bh=J9WgnNk8hsJqucJXyV7OVTWvviSo1PzyLdaWKwbmS6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDQAMiwKnUsInpKrImOsgUADu1a87Mys1J5sBBz/s9yCHBo5sX+KP2t2K5NH2zzB2
	 /etkaY7/rdkKB5LfEDmDk35MoABlNOzSRqfwSokrrq7wCplaB3wMEQV7VnzlZcb2er
	 WardCxs7Xv7IvNb/G1zhCdGQwviVFEbBGtIltczo=
Date: Mon, 10 Mar 2025 21:23:32 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Sebastian Reichel <sre@kernel.org>, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: chipidea: ci_hdrc_imx: disable regulator on
 error path in probe
Message-ID: <lbsj2h2zut3eafu5vy6ysuv4y7xjuqtemovqtg3lzuyhp6fjbl@4xwikb3bxl7k>
References: <20250309175805.661684-1-pchelkin@ispras.ru>
 <20250309175805.661684-3-pchelkin@ispras.ru>
 <Z8781hzSKJ5P0gBe@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z8781hzSKJ5P0gBe@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_112341_253412_58BBFC63 
X-CRM114-Status: GOOD (  26.41  )
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

On Mon, 10. Mar 10:53, Frank Li wrote:
> On Sun, Mar 09, 2025 at 08:57:58PM +0300, Fedor Pchelkin wrote:
> > Upon encountering errors during the HSIC pinctrl handling section the
> > regulator should be disabled.
> >
> > After the above-stated changes it is possible to jump onto
> > "disable_hsic_regulator" label without having added the CPU latency QoS
> > request previously. This would result in cpu_latency_qos_remove_request()
> > yielding a WARNING.
> >
> > So rearrange the error handling path to follow the reverse order of
> > different probing phases.
> 
> Suggest use devm_add_action() to simple whole error handle code.

I'll try with that in v2 then, thanks for suggestion.

> 
> >
> > Found by Linux Verification Center (linuxtesting.org).
> 
> I think this sentense have not provide valuable informaiton for reader.

Well, that's a line which the organization rules specify to put into
every bugfix patch found on its behalf. I must follow these rules.

Btw, you can find this in the changelogs of many other commits existing
in the main kernel tree:

$ git shortlog --grep="linuxtesting.org" --group=format:""
 (859):
      kernel/range.c: fix clean_sort_range() for the case of full array
      Staging: pohmelfs/dir.c: Remove unneeded mutex_unlock() from pohmelfs_rename()
      USB: usb-gadget: unlock data->lock mutex on error path in ep_read()
      ...

> 
> Frank
> 
> >
> > Fixes: 4d6141288c33 ("usb: chipidea: imx: pinctrl for HSIC is optional")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index 619779eef333..3f11ae071c7f 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -407,13 +407,13 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  				"pinctrl_hsic_idle lookup failed, err=%ld\n",
> >  					PTR_ERR(pinctrl_hsic_idle));
> >  			ret = PTR_ERR(pinctrl_hsic_idle);
> > -			goto err_put;
> > +			goto disable_hsic_regulator;
> >  		}
> >
> >  		ret = pinctrl_select_state(data->pinctrl, pinctrl_hsic_idle);
> >  		if (ret) {
> >  			dev_err(dev, "hsic_idle select failed, err=%d\n", ret);
> > -			goto err_put;
> > +			goto disable_hsic_regulator;
> >  		}
> >
> >  		data->pinctrl_hsic_active = pinctrl_lookup_state(data->pinctrl,
> > @@ -423,7 +423,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  				"pinctrl_hsic_active lookup failed, err=%ld\n",
> >  					PTR_ERR(data->pinctrl_hsic_active));
> >  			ret = PTR_ERR(data->pinctrl_hsic_active);
> > -			goto err_put;
> > +			goto disable_hsic_regulator;
> >  		}
> >  	}
> >
> > @@ -432,11 +432,11 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >
> >  	ret = imx_get_clks(dev);
> >  	if (ret)
> > -		goto disable_hsic_regulator;
> > +		goto qos_remove_request;
> >
> >  	ret = imx_prepare_enable_clks(dev);
> >  	if (ret)
> > -		goto disable_hsic_regulator;
> > +		goto qos_remove_request;
> >
> >  	ret = clk_prepare_enable(data->clk_wakeup);
> >  	if (ret)
> > @@ -526,12 +526,13 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  	clk_disable_unprepare(data->clk_wakeup);
> >  err_wakeup_clk:
> >  	imx_disable_unprepare_clks(dev);
> > +qos_remove_request:
> > +	if (pdata.flags & CI_HDRC_PMQOS)
> > +		cpu_latency_qos_remove_request(&data->pm_qos_req);
> >  disable_hsic_regulator:
> >  	if (data->hsic_pad_regulator)
> >  		/* don't overwrite original ret (cf. EPROBE_DEFER) */
> >  		regulator_disable(data->hsic_pad_regulator);
> > -	if (pdata.flags & CI_HDRC_PMQOS)
> > -		cpu_latency_qos_remove_request(&data->pm_qos_req);
> >  	data->ci_pdev = NULL;
> >  err_put:
> >  	if (data->usbmisc_data)
> > --
> > 2.48.1
> >

