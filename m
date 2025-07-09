Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A833BC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6DigU3ijEN37mFImpuvJY0cN+hiwAZNGwYyYKGr+K0=; b=2hIe6Zk0IFQvCokGNQAe9VjVFK
	mVriekpxQ/hFE09XX8ipo2aZugd/Ut+wNH5CwAV6bqMVyIze4RAthSa4r8OeuoOY9AdTkC/R7zupt
	SufriX8EPSA10sa3+dd7EAeajLJLjYQduVNmfsLy3pcG58u44PkzxjXs/Ewg0/dSsOLCTBQ+fp34Q
	Pp+GbuLlSARFme6QVIhwEM+oDhyfKtrWY5Lwhlc/RBk83ED7tQynXAsGL69qrpzAAiwk4ndERNTeP
	1KFzI1XQXxnxEGiL93EPln8SNV6O/rfa9bCGLW9LjIExtMWhGQfzM0IXsSN9Xv9gqE1173ACOHxBd
	EUxD0XVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXh3-00000009Jqv-49dk;
	Wed, 09 Jul 2025 16:30:49 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVr6-00000008zif-1IYn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:33:05 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso4836446b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752071583; x=1752676383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6DigU3ijEN37mFImpuvJY0cN+hiwAZNGwYyYKGr+K0=;
        b=fta+gB+dLtTLPsDiRpBuT72V8az2llJ+Zh2Tlaj82QkT72XwmM3Q0ME6AZHoKmra0y
         bLEeB6rOZd5Fv//vP0bTfkrPUvIHnT2fG+LVmB06ddQtqc8Gb1fQkuvnGZVF2w2ftsSl
         ZoSsfUSFZz2AbvTx/9JcYyI18q6l6k0zufvuDk8/cEnHz0qZ+0OHbix4tcDbguK7pZNx
         aeUKtnZMsgPB0SvkKhd4hyqgrdC6//ePI9M0GGG9ISltXgpZ5Yn460h02LKGZo8/U6lT
         rQrJt0UiSvMqMhEzskvTzN782EUuUPBsuPsfgYa8KZvTlqDdCyQjLZsJwGt2gv3nnypG
         irxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071583; x=1752676383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6DigU3ijEN37mFImpuvJY0cN+hiwAZNGwYyYKGr+K0=;
        b=WV6tgLqT7SUTE+Wwqyx83ygKRKEeRePXMlYaFhdJen/4XMscbFMLtihYKTTu/UqFbU
         hJs/y9MRp0UGt6Xcm2RpkWMiaLUXdo4VRIuTerE0X4//9b/+ZaokH0d7UNLPlcWixACJ
         QaPBifgIlvdCbZ0M0g6aYGw7cyA+Qn8qdvGhjYMvptnIGoQOCzfp8/a0EvLC1TYvnMV8
         zA+22/jLA0C9iKFoBOU+5HIpKTE0C93C8Bn7b1QvaXK3jJYNnD8LQOIUabJtGkV68Fbh
         N6pVaDixBiknVbob5aNoDT2bc2nkBUR4sW0MCG63MC8LvGxpQB/paQW/NdolaE+CupfI
         1yLA==
X-Forwarded-Encrypted: i=1; AJvYcCXLgG6jvbLipHwGI0z6v+FNt26r5Sjv/W6+KXQz55Bu7zzUvaxNtNx6yc5wRgfng7b86ww5PkvcpLM5g78xJhhR@lists.infradead.org
X-Gm-Message-State: AOJu0YzAC4Su6EigvfzbEYnYLaD6/eu6+Mqnqyq56VOOfULMuhARDqC/
	gJcMPSEO+o2AlMMD5PVbPlh2TEJhvO5OUvWmscoZmrL2DQNBLbHE2Ng4iGyX1ikk2sw=
X-Gm-Gg: ASbGncsiTbjWC5NWYXbWZHtD93W0VmtjOO3KXlB64vjx4KKEp3fvsqZzuBIMe9y0uES
	8S0WsoS9D36tsi848sA87axi87NUngXwqq5PzZdfwlbjdbokNPJG3qVPWVe13bmmxJg35K0G6+v
	3ipTG0IxNVO/BDLIaD3gkR5UBW5oJWAI2siK6BaMEPjwJRP1wdBhvxsUBH9BjibMQRjwvm4a2p1
	PIcyC/gUQXod+ODfP7uHaRuLHXUfV6U3kYZu1OqP5ZPW6311yReENbkEa9jUOGOHjETE3Nm5KD8
	e8hhEkQZmgC/+ndKhTe5eu6zXkVA3GxTSr7OJGCUNo2aWkXOxtZKP5Zemi3kpJZE
X-Google-Smtp-Source: AGHT+IHb9rJ94x6uyCZzHp4gJ6jJr9aNTPeUN/jkP+tdN5uFfkn31SfgFUorIkoUWVXUVDc9nNaEcg==
X-Received: by 2002:a05:6a00:1742:b0:74e:a560:dd23 with SMTP id d2e1a72fcca58-74ea669d187mr4911450b3a.21.1752071583252;
        Wed, 09 Jul 2025 07:33:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:433:ec07:c2cb:e3e8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38f879d040sm13455576a12.44.2025.07.09.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:33:02 -0700 (PDT)
Date: Wed, 9 Jul 2025 08:33:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 2/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aG59nOSfMuFbJvoK@p14s>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-2-699031f5926d@nxp.com>
 <aG1IIk42q8OmGsQH@p14s>
 <20250709090231.GB14535@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709090231.GB14535@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073304_355147_E3DF45D1 
X-CRM114-Status: GOOD (  45.87  )
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

On Wed, Jul 09, 2025 at 05:02:31PM +0800, Peng Fan wrote:
> Hi Mathieu,
> 
> On Tue, Jul 08, 2025 at 10:32:34AM -0600, Mathieu Poirier wrote:
> >Good day,
> 
> Thanks, good day.
> 
> >
> >On Wed, Jun 25, 2025 at 10:23:28AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> >> one Cortex-M7 core. The System Control Management Interface(SCMI)
> >> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> >> Manager(SM) includes vendor extension protocols, Logical Machine
> >> Management(LMM) protocol and CPU protocol and etc.
> >> 
> >> There are three cases for M7:
> >>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
> >>  (2) M7 in a separate Logical Machine that Linux can control it using
> >>      LMM protocol
> >>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
> >>      using CPU protocol
> >> 
> >> So extend the driver to using LMM and CPU protocol to manage the M7 core.
> >>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
> >>    has System Manager.
> >>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
> >>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
> >>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
> >>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
> >>    Whether using CPU or LMM protocol to start/stop, the M7 status
> >>    detection could use CPU protocol to detect started or not. So
> >>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
> >>    status of M7.
> >>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
> >>    the M7 LM is under control of A55 LM.
> >>
> >
> >Thanks for the context, it really helps.
> 
> Glad that helps.
> 
> >
> 
> [....]
> 
> >> @@ -592,6 +637,38 @@ static int imx_rproc_prepare(struct rproc *rproc)
> >>  		rproc_add_carveout(rproc, mem);
> >>  	}
> >>  
> >> +	switch (dcfg->method) {
> >> +	case IMX_RPROC_SM:
> >> +		if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
> >> +			break;
> >> +		/*
> >> +		 * Power on the Logical Machine to make sure TCM is available.
> >> +		 * Also serve as permission check. If in different Logical
> >> +		 * Machine, and linux has permission to handle the Logical
> >> +		 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> >> +		 */
> >> +		ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> >> +		if (ret == 0) {
> >> +			dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
> >> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >
> >This is set all the time imx_rproc_prepare() is called - isn't there a way to
> >set it once at initialisation time?
> 
> Yeah. Moving this to probe path should be ok, such as in imx_rproc_detect_mode.
> The drawback is M7 logical machine will be left in powered up state if
> moving to probe path before user starts M7 LM. Leaving in here means M7 logcal
> machine will be only powered up when user does
> "echo start > /xx/remoteproc-y/state", but needs to set
> IMX_RPROC_FLAGS_SM_LMM_AVAIL flags each time do preparing.
> 
> If you prefer moving this logic to probe, I could give a try to move
> to imx_rproc_detect_mode which is probe path.
> 
> How do you think?

Just leave it where it is.

Mathieu

> 
> >
> >> +		} else if (ret == -EACCES) {
> >> +			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> >> +			/*
> >> +			 * If remote cores boots up in detached mode, continue;
> >> +			 * else linux has no permission, return -EACCES.
> >> +			 */
> >> +			if (priv->rproc->state != RPROC_DETACHED)
> >> +				return -EACCES;
> >> +		} else if (ret) {
> >> +			dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
> >> +			return ret;
> >> +		}
> >> +
> >> +		break;
> >> +	default:
> >> +		break;
> >> +	};
> >> +
> >
> >Please put this in a function and get rid of the switch{}.
> 
> ok. Fix in v4
> 
> >
> >>  	return  0;
> >>  }
> >>  
> >> @@ -911,13 +988,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> >>  	struct regmap_config config = { .name = "imx-rproc" };
> >>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >>  	struct device *dev = priv->dev;
> >> +	struct scmi_imx_lmm_info info;
> >>  	struct regmap *regmap;
> >>  	struct arm_smccc_res res;
> >> +	bool started = false;
> >>  	int ret;
> >>  	u32 val;
> >>  	u8 pt;
> >>  
> >>  	switch (dcfg->method) {
> >> +	case IMX_RPROC_SM:
> >> +		/* Get current Linux Logical Machine ID */
> >> +		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> >> +		if (ret) {
> >> +			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> >> +			return ret;
> >> +		}
> >> +
> >> +		/*
> >> +		 * Check whether remote processor is in same Logical Machine as Linux.
> >> +		 * If no, need use Logical Machine API to manage remote processor, and
> >> +		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
> >> +		 * If yes, use CPU protocol API to manage remote processor.
> >> +		 */
> >> +		if (dcfg->lmid != info.lmid) {
> >> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
> >> +			dev_info(dev, "Using LMM Protocol OPS\n");
> >> +		} else {
> >> +			dev_info(dev, "Using CPU Protocol OPS\n");
> >> +		}
> >> +
> >> +		scmi_imx_cpu_started(dcfg->cpuid, &started);
> >
> >Function scmi_imx_cpu_started() returns a value that is not taken into account.
> >
> >> +		if (started)
> 
> I will update to "if (started || ret)" in v4, with ret assigned the return
> value of scmi_imx_cpu_started.
> 
> Thanks,
> Peng

