Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392D5C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 19:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KRVwjnf5Gu74AF6Zl0ciz1iQ0kZ7/1mY4qiKdYpBHw=; b=m9Cy6E2iEQWx5Fm52CcLwUwsmB
	KYc5gSV4RAiqrYiY0SB6bXvYX/L/XWVEeaZoTGtma0EpA4QohjjJf+FXJjvEHhJLhV6xxzZPwZH4P
	NctThe6PmEDdH5UGm76/nCf94wkySPkd0muyt8eM2bF/EPHbq6R0kNQ3h4DKjwxBJ/bCGdtB3Ktf4
	rnP3X3wX8By8GMG3wvWl4heTJC+5DpIKtNxfJFfuAHyUrspz2S8GU10XlZiKIyNJISLfnyt+xVYvD
	swqJq76CAUXqbcezDvYlCuoSMQPgbPCXJoadYiNBJHJhfZRHO5FNEMa/yz6/R+c9NkR2FAxy3EOBQ
	ORA7r8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTn3F-00000003oxK-48Zo;
	Mon, 23 Jun 2025 19:41:57 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjAI-00000003Fad-30Mz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:33:00 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-313a188174fso3292528a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750692778; x=1751297578; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1KRVwjnf5Gu74AF6Zl0ciz1iQ0kZ7/1mY4qiKdYpBHw=;
        b=TSjpRKU4YfmMi/wQuoZoRrWcc/lmZju0ZOontCvrWti2sH8O1IaT3H+pbqb2ZVvtjf
         G10quT8n4L/iLJG2rK5gzA3KiM4gs1DCCyMNo/mB21kU8iaJUHE5MCvXup9AhyAY7mTv
         ZSvsyYfGutyt5ngoaxL6eb63+CYZR/IxwHvOGC0AHt/oVHOhwFNM1Vgr7rfXdo+hj1Pj
         98gpKkLVkq7EhzcQKmp0OIHRekxMSCv0Mrlm4OJBdBciLLN/RF8EXu4yPxcHFTjvx9+f
         Mi7gd1+dUvkXtlfp8vs/vRKzrvYzy31YESOD+k76x7aqbIoRef5+PIuR3k7PVP5cNAEN
         Q8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692778; x=1751297578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KRVwjnf5Gu74AF6Zl0ciz1iQ0kZ7/1mY4qiKdYpBHw=;
        b=v8XIUnUXTegKxCQdJgU1HS1Ms7G14D1lKIk4U+zgYug51V2JkGGxo/kcCk2hf8J7d9
         LFa8oP3YvcPlLjYSCMvPRVIxlmA1u19AW+QENboUX7k06uDKcUJsXW6Dc36681S1HdR9
         S44llrecyZ432BZeGQ6uNdTtHrQ18Tv2Vt5inLSNjX9t96v+rAx0oIDKTKfmi3Si09i+
         BnA0lGAGG1td6TOIGxZdlAeMgs7fN1Qz2wY2Zjcn4V8JXqJwIZchGPwVTwujxDZeTSJo
         ScKZiW/Q9bE2mthnaYl70FThrRaAhPDtS9DQTS+bs2ACQtw51sf618teTyQO7clc64yg
         HOqw==
X-Forwarded-Encrypted: i=1; AJvYcCUGPzBY8Arq2I+Ss9OjxyL2KiPG9rylibuwXivKcJWbSbrTDmxb+TooPwRXyEOraWgEQsHzy2EPz4ThrDwVluvE@lists.infradead.org
X-Gm-Message-State: AOJu0YyE5BZbqPmAJAd6/YAdIm95ixa1G+iBMhKFfKmjvAnP0zk4yBmY
	0LVFbtQicWx7Oz8TRCwAmSTLZL64QxVqX5AR/ksNAtB0vibve+ekLxGoVLAzMaVuv7I=
X-Gm-Gg: ASbGncvnWSqzVlarSS0T8vXLpZ4fCTRfZBmeaC1JzxPmpZkYPkF9Toib+kSh7JguspZ
	e9Abydo+GsbhGTRzRsV9h+wJhy0l6VCPVCp8TARKOcRvVlPvYsBc+idl6sywJIhQX/Nkybg/Ewv
	Pd2FWqgXzIatVKVGpTHMnAWJNbFTfu2kOdHXAn6e3Ek9Aimjrw0RCwvb2kYRaRtsyWo6u8IVSyu
	tLJ0k6kFeFe9STUtzl5wZTt3eC9TX38k1NdAU6O6J8mCxysfaPaSgwlNMIFgIe6Py51C8vzSyVo
	7hM2PhdmVXSIEOPkWo6B/qaaIwblBliaT/e9l01/5OcwAB7c/rFmN5Orbbxj6SCw
X-Google-Smtp-Source: AGHT+IGNVVPK2gkJtWTZs/pQbffW/A6+VZyFx1ATrRb4chkU190AUhzC35954VZWOOfCqbAJDEPO/A==
X-Received: by 2002:a17:90b:2e04:b0:30c:4bac:1da1 with SMTP id 98e67ed59e1d1-3159f52d0fbmr19149295a91.17.1750692777852;
        Mon, 23 Jun 2025 08:32:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a226f6fsm11220540a91.6.2025.06.23.08.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:32:57 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:32:54 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v5 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <aFlzpnT1yNGdWWkH@p14s>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617193450.183889-1-hiagofranco@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_083258_759594_3DB695BE 
X-CRM114-Status: GOOD (  23.45  )
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

On Tue, Jun 17, 2025 at 04:34:47PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> This patch series depends on Ulf's patches that are currently under
> review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> Without them, this series is not going to work.

Please resend this patchset when [1] and the work in patch 1/3 have been merged.

Thanks,
Mathieu

> 
> For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> started by the bootloader and the M core and A core are in the same
> partition, the driver is not capable to detect the remote core and
> report the correct state of it.
> 
> This patch series implement a new function, dev_pm_genpd_is_on(), which
> returns the power status of a given power domain (M core power domains
> IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> already powered on, the driver will attach to it.
> 
> Finally, the imx_rproc_clk_enable() function was also changed to make it
> return before dev_clk_get() is called, as it currently generates an SCU
> fault reset if the remote core is already running and the kernel tries
> to enable the clock again. These changes are a follow up from a v1 sent
> to imx_rproc [2] and from a reported regression [3].
> 
> [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> 
> v5:
> - pm_runtime_get_sync() removed in favor of pm_runtime_resume_and_get(),
>   checking the return value of it.
> - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove().
> - Fixed missing "()" in dev_pm_genpd_is_on description.
> - Updated dev_pm_genpd_is_on() function description to be explicit the
>   function reflects the current power status of the device and that this
>   might change after the function returns, especially if the genpd is
>   shared.
> 
> v4:
> - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> 
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> 
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> 
> v1:
> - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> 
> Hiago De Franco (3):
>   pmdomain: core: introduce dev_pm_genpd_is_on()
>   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
>     SCU
>   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> 
>  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
>  include/linux/pm_domain.h      |  6 +++++
>  3 files changed, 73 insertions(+), 7 deletions(-)
> 
> -- 
> 2.39.5
> 

