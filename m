Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0380EC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+gbguBFKXfSpjf/gN8iCO7iVT7YM1v5J/bh+qAGVa0=; b=Po56V6v6YcyvO5/o5dWzEuWuFg
	A0wMcuwRcfj84aPvKGPhTekXpjB8qK2bsiQ7Nmjx0fDIVWrfVdnLAppOxIjT0SN+VnI+EnUmwM4gw
	bmBpDIaGJScj1JGcmv/el4CXCbFFs8qtIDunP7m64ToQnSy98SO0W3q+GnUGIV45Ob4Ft4oDING4N
	+GvoBihbGhqcT9cOrrFA2DNVbD13ZXxbLR9U/KLxYVYGtdL3ZLbTuu/XisQ2t8BRRhkzQYwIcUFwL
	9PnJ94DpnoNYmHt1nx3Pjk6uxO/HtNg7T2FrXf4ZxvRt9o4pDpJf4cZVKmZD0JpZAyPSEI0fRzhIV
	FwvRMQ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9C1-0000000Emrn-31D6;
	Fri, 27 Jun 2025 13:32:37 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8ag-0000000EhMm-126t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:54:03 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4a58d95ea53so23143581cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 05:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751028841; x=1751633641; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0+gbguBFKXfSpjf/gN8iCO7iVT7YM1v5J/bh+qAGVa0=;
        b=luR2nqEvtvAe9DZviRo62GQSkVkVSz5f3YAzCBy3LEKCCfodeECocCZ6vFK0u+mTdo
         X2SBKgMYTr9V+/b2ax8YboIiCGMA2dC7Zy/UZ5UEFq3hoLPcz2LOLx0VOeAE0w1TsLVu
         s7lD8eMPEPsjvIer/wJ3m3Z/fURiSSUHa0OzDMv3GoeFl2cioPXd+IDxHDsl8r4CkBKV
         DBwbASltUetVrlOiVgAj4xR/AJJrUxp9qcRKd5N340XTNpT0MkSDaPLwQj2hzdldOZH0
         W86AyTGs4Yv4lK+oB6Pv1z/FBAAwQGJBDbERG0ojfd1cw+ymHTyJG0KQkaaabH437hI4
         B6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028841; x=1751633641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+gbguBFKXfSpjf/gN8iCO7iVT7YM1v5J/bh+qAGVa0=;
        b=aE4N3lXQ7oqwi2UnDKKMVZhMOLygeVYFk0GaibJQQvlY4Gk6Aqq89E1wLqhE94eNGN
         5CihUtxja1453U4RJI+EYLalmSE4QZ06x+4ucZovZZDHFN9z335szcss9AOUzJTQWPT8
         5ZEoIfO6VQtcBi0DlJe39JpIDsTB7ChA85XCf5OOuNSnAc9pNw7/Fa/rabhqrTz7lwsi
         huTC7xQgIVFh7+kzbYPtixQaBuNIX1JX4NP6WZ8LjR2pzrOCxqNu1HemXAVFq6Qpi5MV
         bK+SyhbK7oFKN0rsp7/aUjOaoB7GxkIwzPPW0v/4nA5byetzwvoZRULhuEeKtRG6llcb
         WbgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtn/VCvscDaoHdt5+avP3SALKGI4MUz8XuNu/KAJuH4o0Eoc4HRqNOsA3A7tkl/HF7wg71Facyo0urySCJwDig@lists.infradead.org
X-Gm-Message-State: AOJu0Yxahplg9P57WkZ+uYVaMeo3uM+q5ZzkMs8PxmIn3kjzQb9A6KAC
	Ev4FP3AAov+DxCyfowJOiscB4WAwZfnvmMZ8xPWjEdestPRnK10QhHAE
X-Gm-Gg: ASbGncsLW81MoNMyfvU2dP85IJ0GfDSoo+SqNVrl/JGzr28gDU7L9NQEn05nT0UMUmz
	ThkitLWliLMiLE1QLQQKumjLEGxcYMN4i76wY3+8UFiPpKr2jbl/ObryHNU876Kw+hWN7zH+LtV
	sRiWsXRtUk6eHgd7RbMpBg4WTtdb8odJ7ihpsYCx76mSpX1/fDGUWwlYNoTkyJInyvEzxQ0OEqM
	7seu44MPjgRqpgpT9GBPw15z7KS0x3ptcucNoV6CWTwEQSuC0ZIy5j9b0NS+pxGY/O5Jqc/KhJN
	uDNn1QdEkEzHLqdhJGIY5UJVwNZEbnbK0XjKAgiKU2s1lF9NZy5/YFAv0H9a
X-Google-Smtp-Source: AGHT+IETveSWoXC/08GsXfLK3MH9fUuvjqdK0l7+CppsFqhkxU9gg79wiKfc6Glf1WTlwpf/BCm4jg==
X-Received: by 2002:a05:622a:4112:b0:494:7043:8a2 with SMTP id d75a77b69052e-4a7f2e86617mr128632811cf.16.1751028840824;
        Fri, 27 Jun 2025 05:54:00 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc5a3b92sm11378121cf.76.2025.06.27.05.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:53:59 -0700 (PDT)
Date: Fri, 27 Jun 2025 09:53:53 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <20250627125353.2wuozc5in2ijnbi3@hiagonb>
References: <20250626215911.5992-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626215911.5992-1-hiagofranco@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_055402_285416_B13E416E 
X-CRM114-Status: GOOD (  21.91  )
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

On Thu, Jun 26, 2025 at 06:59:08PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> This patch series depends on Ulf's patches that are currently under
> review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> Without them, this series is not going to work.
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

Sorry I missed the reviewed by from Peng, I will be fixing this in the
next revision today.

Best regards,
Hiago.

> 
> v6:
> - Added "reviewed by" from Ulf and Bjorn.
> - Fixed and improved commit descriptions of patches 2 and 3.
> - Improved the comment inside imx_rproc.c file.
> v5:
> - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> v4:
> - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
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

