Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B285DD1D46C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dhcuq9el8jXisrdDDPJhueutUdvIyETPBmEWgvOuRc0=; b=q5x425MESTQFJYSkucAR3SXWMB
	2DoPYMb1sk3xE17YdzXx2mPTqKXqs9rBXBKrq/OCsx4+a5gX+ARUtw1/dZu6KXWwJi2SS4mfxbz6q
	3eXlEVUvr7DI1iOINB8KDVuQY1yvvIc5Eu9ybs0PsVZa588N7CYAy8Y6j2nNUVS4dDr1qw39bwiFo
	tpjpz26RfslNdsuW92UAS7rvR7VO/flvs3Mx7mK6kk9vVCOOFZDXBCVur41IBxtplJE9WxXoiCCi3
	60R5WwyrV/EMJCRZeJKGoVrx4+Jdusi2KhClk6fGS9ykCoPcHbzWza7x4okuitZCRe0eBQVmfN/Qq
	txtKCteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdreS-0000000HTDN-3Xcq;
	Thu, 08 Jan 2026 15:10:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdreQ-0000000HTCd-3gMi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:10:16 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0f3f74587so28588515ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 07:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767885013; x=1768489813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhcuq9el8jXisrdDDPJhueutUdvIyETPBmEWgvOuRc0=;
        b=wbVVO0YnxK8/j6ezT92q04tNhijGZ6SznOaCMLJydTX9iTe0+mZpx/zG8xjiMHkfhs
         1KhD8G6xrNamLOsiqkneHffc5FY8+nMRy51tklCNpq+x04J1kwuHc8YiNXjKCB+dwiSz
         66mgsyLwjLdG2gUJjrTmKiaMMoIRDRc9AXKL5tSgzTYTr8YcyR+Xc2IOaSlJVePsFOkv
         TeeDJdycBWg6VrrMLR7xhvuw4KVnZ8ODfdCpTwpX+nam+OFzYwoJwJAz16C5IX4k50v0
         4DwMiqxFvNT+OPS6JT1OB+cRRVpxl/Bv6S/VH/OLAF5+EzaGTNqN905j0uvnwKEcUPlH
         s8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885013; x=1768489813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dhcuq9el8jXisrdDDPJhueutUdvIyETPBmEWgvOuRc0=;
        b=S4zlZoxnWTKyQdtJXRHfFht6dr/niYi70fNW4O4ODoYzr9FD1BYrJIU+dcCFeJxLU4
         iPU/966ZjdsNbZ/qdJWLZuO0FLLWx7YprwlAhl2QCk25PlMEVWDFRJdOuUzKt8brPzbA
         IN+XxSFJGP8R93mXRtMZCFrSyti64xYJ/b3RPWb79mPessp/IsmWDd8/wAG9J/bdFQ4h
         upHL+ctUl2jIDOrgoqfNQkGwHro5bw+dUFjY88LHO0yhlEPVa9sfs4ldbbbnEVJTiDjs
         oPw/G0cFCypYSh9ZpVxUSJUXvH5Ga0YqgrsHQKqsMmqIpyR2kChlyy/GDs2HGQKQ9U+9
         UleQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6HI7gK7y3QqfqX4VtDOavUq+g/c2nPGVo1bjdZBpYHgups9n8q5f7kJ0N4B7hMnTwZOrZqGDZH2Crfpg5owZ3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/hs3uZsVdiXLquUZZPjxtbBiuh7oeeVOi5dzyZIxSMbaieKW4
	/sZIcNxF+yQgxIqxn28hLsiCMYe7WXgXPZ8YApxK8aBeMr1pNKMEzLgiaS2qTDk3Als=
X-Gm-Gg: AY/fxX4rKXb7TKhiPHiQMw40iemAyb7goCtQWfq+71U+PrPtm7nngFTeIltMwfF4+0R
	MPt0bSZcWTmiMsdrxy1CywmbO4S7aXh5Rjoz2HL2CoMlp1DjCFN3XljIHHi5pGPlzGB0Satt6ku
	4jdOaZrHM88LB+4z6ZjMEIN1amM1l1ngwH6eLajBXsOifYm+U6CSHqw0lQy2oDEJNmorfG7uebE
	h3MCLnqtRxGWlfRnkvYdmHmXFP9cWg4FroiyZIAEbBIy7/SfhBEGTaJk5fS94gvAoKV05B8+D1x
	Fvmiw5BXp9cX/4Y6G0GvCL+r8m4LKfUaL45uyAR+/SlhDcEnUc5lJmt/MO1sG1rEG4Cjnsldtw+
	aSOc6KJyAMfnQAes38DnrjaE/boSOh9J5xjSjbAHTlU8m4kP4ken5YFwSOe5iiKcnFJjPe7/fXF
	1K87/CJAJktbCj5w==
X-Google-Smtp-Source: AGHT+IHdVQFm0LoRLpz5ffOipFREjXXoGNgUc0A0LwHWdii2Nr5bh8+R06mGKRoJf0I2Vwoi809Uig==
X-Received: by 2002:a17:902:e846:b0:2a1:39cd:7462 with SMTP id d9443c01a7336-2a3ee43892bmr52476395ad.8.1767885013214;
        Thu, 08 Jan 2026 07:10:13 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9a09:dd70:79df:b876])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c75sm83669855ad.35.2026.01.08.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:10:12 -0800 (PST)
Date: Thu, 8 Jan 2026 08:10:10 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aV_I0iGYt1lxEIUw@p14s>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
 <20251218-imx95-rproc-2025-12-18-v5-4-b56a27d4158f@nxp.com>
 <aV6ow9dGUNaPDqZg@p14s>
 <aV+HEAzwNSOCUx88@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV+HEAzwNSOCUx88@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_071014_931177_01D797CF 
X-CRM114-Status: GOOD (  39.20  )
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

On Thu, Jan 08, 2026 at 06:29:36PM +0800, Peng Fan wrote:
> Hi Mathieu,
> 
> On Wed, Jan 07, 2026 at 11:41:07AM -0700, Mathieu Poirier wrote:
> >On Thu, Dec 18, 2025 at 01:17:38PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> ...
> >> +/* Linux has permission to handle the Logical Machine of remote cores */
> >> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
> >> +
> >
> >This should be named IMX_RPROC_FLAGS_SM_LMM_CTRL.
> 
> Fix in V6.
> 
> >
> >>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
> >>  static void imx_rproc_free_mbox(void *data);
> >>  
> ...
> >> +static int imx_rproc_sm_lmm_start(struct rproc *rproc)
> >> +{
> >> +	struct imx_rproc *priv = rproc->priv;
> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >> +	struct device *dev = priv->dev;
> >> +	int ret;
> >> +
> >
> >A comment is needed here to say that if the remoteproc core can't start the M7,
> >it will already be handled in imx_rproc_sm_lmm_prepare()
> 
> Add in V6:
>         /*
>          * If the remoteproc core can't start the LM, it will already be

The remoteproc core starts a remote processor, which in this case is the M7.
I'm not sure why you are referring to the logical machine (LM).


>          * handled in imx_rproc_sm_lmm_prepare().
>          */
> 
> >
> >> +	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> >> +	if (ret) {
> >> +		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> >> +			dcfg->lmid, dcfg->cpuid, ret);
> >> +		return ret;
> >> +	}
> >> +
> >>  
> ...
> >> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> >> +{
> >> +	struct imx_rproc *priv = rproc->priv;
> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >> +	int ret;
> >> +
> >
> >>>>>>>>>>>>
> >
> >> +	/*
> >> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
> >> +	 * to start/stop rproc LM, then if rproc is not in detached state,
> >> +	 * prepare should fail. If in detached state, this is in rproc_attach()
> >> +	 * path.
> >> +	 */
> >> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> >> +		return rproc->state == RPROC_DETACHED ? 0 : -EACCES;
> >
> ><<<<<<<<<<<
> >
> >        if (rproc->state == RPROC_DETACHED)
> >                return 0;
> >
> >        if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> >                return -EACCES;
> >
> ><<<<<<<<<<<
> 
> Update in v6 with your code snippets.
> 
> >> +
> >> +	/* Power on the Logical Machine to make sure TCM is available. */
> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> >> +	if (ret) {
> >> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int imx_rproc_prepare(struct rproc *rproc)
> >>  {
> >>  	struct imx_rproc *priv = rproc->priv;
> >> @@ -980,6 +1078,93 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
> >>  	return 0;
> >>  }
> >>  
> >> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> >> +{
> >> +	struct imx_rproc *priv = rproc->priv;
> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >> +	struct device *dev = priv->dev;
> >> +	int ret;
> >> +
> >> +	/*
> >> +	 * Use power on to do permission check. If rproc is in different LM,
> >> +	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> >> +	 */
> >
> >Two things here:
> >(1) This whole comment describes what this function does rather than what the
> >code is doing in the next few lines.  As such it needs to be moved above the
> >function declaration.
> >(2) We know the M7 is in a different LM, otherwise "dcfg->lmid == info.lmid" in
> >imx_rproc_sm_detect_mode() and we would not be here.  As such the comment is
> >wrong.  The only thing this code is doing is check if the remoteproc core is
> >responsible for the M7 lifecycle.
> 
> Update in v6:
> /* Check whether remoteproc core is responsible for LM lifecycle */

Same comment as above.

> static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> 
> >
> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> >> +	if (ret) {
> ...
> >> +
> >> +
> >
> >>>>>>>>>>>>
> >
> >> +	/* rproc was started before boot Linux and under control of Linux, directly return */
> >> +	if (started) {
> >> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >> +		return 0;
> >> +	}
> >> +
> >> +	/* else shutdown the LM to save power */
> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> >> +	if (ret) {
> >> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >
> ><<<<<<<<<<<
> >
> >        /* Shutdown remote processor if not started */
> >        if (!started) {
> >	        ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> >	        if (ret) {
> >		        dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> >		        return ret;
> >	        }
> >        }
> >
> >	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >
> ><<<<<<<<<<<
> 
> Thanks for your code snippets. Update in v6.
> 
> >
> >This patchset would be a lot easier to digest if you had split the support for
> >CPU and LMM protocols in diffent patches.
> 
> I appreciate your detailed review and the code snippets you provided. Please
> let me know if you'd prefer that I split the support for LMM
> and CPU into separate patches in v6, or keep them combined as they are.

Please split.

> 
> Thanks,
> Peng.

