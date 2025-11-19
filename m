Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CD0CF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqgArqZqDLLZkxxlGxEl0Eyz/se4zZ6TXQ2QUXMksPc=; b=xflVqPRfpIToB0J5oUgMMEUScI
	bhV9O5pcsKBUwy5xIqDwwXIcV4mJUGVQLvnj4dzdh8Bpsy+QkwVrGMWnfKV5s+3fVT0bdiRHq5qI9
	TKYmVfr8jQIV1AlF4PG4uM83rZlNL3ejKYxrEO0V4Ocs9Gk7TKOn772tKIrdmWYSwO6yYsYtZXH8G
	DZ4svzWbKyTHezQvEtM8dU3464sqVzUInH5u9kdazG0EyNLTbzU5AIUBmlrMvfZuLKzMrUwiJbRcf
	137E1WTH5zYYfZ+cxyxVcRzbywDciAyE5Dmp02VJCW+oGx6jmQUMrU7bLViYkQtL8PM8uJTXKf9Jz
	Lauhxf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkxD-00000003gmu-2g8v;
	Wed, 19 Nov 2025 16:22:47 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkxB-00000003gmU-2geY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:22:46 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so6685853b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569364; x=1764174164; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SqgArqZqDLLZkxxlGxEl0Eyz/se4zZ6TXQ2QUXMksPc=;
        b=kUp6CEwAaNKSFuWHxwCxidFDNrFdfNaAYHMJmR3tRMl+z3iwADodaxHcJqKHt7UEf1
         qug2bp73/04yOpNPxjjBXcMomcQWLBvokVIRRz0SMkq2UlXbaI+ESSw5vVRpE3Yf9d4F
         RJkP/EW3aTE7GXhKX2vUXBhmLFs6EQCNxz7pWg0l363ij6E7RGdn2th6mkbBr2zjlvQI
         GeVXqDXMOzcsq9cp91GMNGWgUpIR/HCiAD33RdqB6VdbBFO2YibMBPbl/qKDJBg2g3mk
         N1hZ8z2vYUM2gxczIfPNfPAKBK7P1nLiBrOyvUbk5JT7/X/a1TktYijTqf0huzSm5xWt
         /gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569364; x=1764174164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqgArqZqDLLZkxxlGxEl0Eyz/se4zZ6TXQ2QUXMksPc=;
        b=iVIrHrWRqs7gJ5whBdazEVK2VZZBWwLGXzVQH1E/KugHQuizvqmk+ZiTOEUs2jrbd7
         +nirTO8dIiPhaKSpYdfq7l8dPdSJRyRAxq81/cIip4vqZJIWmrflir0XKrlv6SP1IIg7
         o3X1LEybl5k242D2B528YOfuc3L4zKjWvUOqtDNkoPbExUyyYaxHNjIjPEBXlIyyFPqE
         lp1E7RUPsXca8+rh4LzfbYfOdxErwH1kBARe3ysTQsx9JrGV4+XU/Uu/21d/Iz/8W3kX
         JCENJQ6PGFl1Trg/LQxwpGzAXjn6/iwh+pOpq6jDfEvqOl96ALmDscVc3U7IwQ7EQZQ5
         VEWg==
X-Forwarded-Encrypted: i=1; AJvYcCUlad4LYf5qM8HtxAuGJWP1lu7X7DmHZm9hd+z8eNs58F0FFqtzNdT7fwCdNTQMjW/MFyLqOIxcFXZUVgSnMbiS@lists.infradead.org
X-Gm-Message-State: AOJu0YylPn13wUYrKd2ZgcSpnbvlKSqiDGgS5ho/07yBnW2JlOibUgZN
	cnwoyuqjEpkAUpiLGhCLpgrr3sw0Fp6zJmeStDRTUML0i85yJnKGdJfgBzuc5d3u0RA=
X-Gm-Gg: ASbGncsDQylG32MaklI3BxuV68QcNoCpsfvQ0047vgfCRbvXe/pEEhh4KuthRWfjRWB
	efFax7x3vehKQl1/VwJ488AAk8gwl/Nn1fpaOFXGf3V7tF5+fjw+wXoeIs02s/20VeVuN2b+2+e
	qhAOdDKPS+N0kgu+dV7MNTzeqpyx2CR21a4D2m+X8AMxsSHaG12cXyaNrFczqFhGfjqSgt5zzin
	4X17v67iDFSzfFd4b1lP6YBbkQUc4TI5ZP0ufE81iyM+M48jDvCKtzAVihp/K5U36G1r47+uM5o
	XxBTVmstOv22o3x6wtw3BMnfADLUWWiAKPik7RZeeyysnpUiZm9hhD2Su/tC2TTb4H6rzEUAG0p
	ApojNFeHk5GDLtrXrCrKH/oVAY4kRycXU6EdunHYntY8adyNKxhj3kD6Wl2BgQoBse67Zb0O+iH
	h3Cft4QNA7jAf+2g==
X-Google-Smtp-Source: AGHT+IHuSIrZBCiLgca0WU1DQj7ineP68uKwSXumgVfu9Fe9sbAmM4VWuP+tv6PTaJCg3+0A1H698w==
X-Received: by 2002:a05:6a00:812:b0:7ad:9e8a:1f72 with SMTP id d2e1a72fcca58-7c29c492acamr4056626b3a.14.1763569364343;
        Wed, 19 Nov 2025 08:22:44 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:f8d9:9ae3:90a2:d39e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ba611682cfsm17088879b3a.26.2025.11.19.08.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:22:43 -0800 (PST)
Date: Wed, 19 Nov 2025 09:22:40 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 00/12] remoteproc: imx_dsp_rproc: Refactor to use new
 ops and remove switch-case logic
Message-ID: <aR3u0F7FTZUgxCQ6@p14s>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_082245_708249_8A0C3858 
X-CRM114-Status: GOOD (  20.26  )
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

On Wed, Nov 19, 2025 at 12:21:45PM +0800, Peng Fan (OSS) wrote:
> This patchset aligns imx_dsp_rproc with the cleanup and modernization
> previously applied to imx_rproc.c. The goal is to simplify the driver by
> transitioning to the new ops-based method, eliminating the legacy
> switch-case logic for a cleaner and more maintainable design.
> 
> Patches 1–5: General cleanup, including code simplification and adoption
>              of the devres API.
> Patches 6–10: Transition to the new ops-based approach, removing the
>               switch-case structure.
> Patch 11: Remove the obsolete enum imx_rproc_method.
> Patch 12: Cleanup goto based logic.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v4:
> - Collected R-b and T-b
> - Address the build warning in patch 1
> - Add a new patch 12 to cleanup the goto based logic
> - Link to V3: https://lore.kernel.org/imx/20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com/
> 
> Changes in v3:
> - Collected R-b
> - Simplify commit log for patch 4 per Frank.
> - Link to V2: https://lore.kernel.org/all/20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com/
> 
> Changes in v2:
> - Collected R-b
> - Patch 3: Update commit per Frank/Daniel
> - patch 8: Use priv->dsp_dcfg->dcfg to avoid adding "const struct imx_rproc_dsp_dcfg *dsp_dcfg"
> - Link to v1: https://lore.kernel.org/linux-remoteproc/CAEnQRZAOTFw=sBppHTYQAdfDBuNqkqk6gVO4FyP0EBsva3Oi+Q@mail.gmail.com/T/#m27c93af9fb1e7fdeb0766bdbffbaae39d79eefab
> 
> ---
> Peng Fan (12):
>       remoteproc: imx_dsp_rproc: simplify power domain attach and error handling
>       remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
>       remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
>       remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mode errors
>       remoteproc: imx_dsp_rproc: Drop extra space
>       remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_rproc_dcfg
>       remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER switch case
>       remoteproc: imx_rproc: Remove enum imx_rproc_method
>       remoteproc: imx_dsp_rproc: simplify start/stop error handling
> 
>  drivers/remoteproc/imx_dsp_rproc.c | 353 +++++++++++++++++++------------------
>  drivers/remoteproc/imx_rproc.h     |  14 --

I have applied this set.

Thanks,
Mathieu

>  2 files changed, 186 insertions(+), 181 deletions(-)
> ---
> base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
> change-id: 20251119-imx-dsp-2025-11-19-fa99d7c84c91
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

