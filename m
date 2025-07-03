Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1119AC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBHUELeShaDsr042UH3FpVBn+V9zul7LrFKtD883WnM=; b=3TStgwbVC89vQxlReDWPmJ3A7z
	CGMSEEr00c/oXBSYjxqw7wFxFD5yxLfmvYNOCZgZdkwML/B/JPxdNJKT9tt+p7LAWP2vxRukFA6rn
	jFY9mEOZVnmvpPkRTc878KmdJZ7rMcRgxBklkCf5rCHvF89fPEmdj5NMBfBYkXLW4srepCIv4cD6v
	CtZZ0cyk4rkMoFm4nDea0dy89OD+m4HDVvCPbSZJ8SEEctgcnKT1C+sUI9vQgbKkOaNzd/Cix4yYc
	JlcMkxvcZ/gM/HlgpSGKHFIzJTuTBe9aXzvY/kY/yvZ0epORAQ5V9hC6DAGsEXyzWOqqMyeMA297l
	kjsoyNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR2O-0000000CXeT-362d;
	Thu, 03 Jul 2025 21:00:08 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXN3a-0000000C2H4-1isN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:45:07 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so81811a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751561105; x=1752165905; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GBHUELeShaDsr042UH3FpVBn+V9zul7LrFKtD883WnM=;
        b=MFr+BwYQymndIr59liObvcthpK2+NJGrZeZ0lf1DO7KBBCjZdWLkkpb6LIxBpdhS45
         /fhL5PU7j/Drwxy3v/kft8BMBrOxywZKkuaMiq/SHbC4wIhWdpFgrRHEkZ889m1jEwpg
         MsRkRcNOc9utQ+rFuC8yeCHeygf32BJs9wEfWCHHyuKkvRQZmzekwZdfiQaE7mjFZ3mN
         Cfmwm2FEW/rZAhiI7O3Caaf7lmw0tCaONRPDozcLw+EpEluVx1w7DuXFM/bwKylN/PHS
         GcWnBqUJIDDhZt9iC4rvEoBvMS9fnQZ4FBCbh63aIeB0oSqGK0208CtaC+Aw57uX28KP
         V4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751561105; x=1752165905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBHUELeShaDsr042UH3FpVBn+V9zul7LrFKtD883WnM=;
        b=dMQez37xOoMNcWFwCVqER2xXO27S1oY/B+qeDC4/bEIobFHA5RMbBuJitJzfZbpLDe
         B12YnQmhQk5oASCmAt8Nxx45QJPuD971qirsYfERB1mO4sGJmaR8ztGSTLMORBhi1lO2
         VHq6GDjxH3LmcUU3M0b2vT8HXB4vcpH6xP0fdYZqnu141ONhRENr5UztsUrMqsYcGHb/
         OexaBmmhzFFhFFz4FpxSjfoc+VRSFee2dsVwQhqpyAgYJjii/LJf6orzaNd4MEMOmrrL
         i2JNxiChhcplH4eTV2LZhrdqNb1EG7JpYxRLeaCe3R6GXi3c1aVH8n6ch2rRR+Ku+UAa
         YY2w==
X-Forwarded-Encrypted: i=1; AJvYcCVQO0XPJyQpiNc2PligVZuXYNqXkOuoRCUzrKRkrDTrVSdgVwbdM7SlR3tnxPxdl9zS5VVu0nzX3zfL/9MBqPHI@lists.infradead.org
X-Gm-Message-State: AOJu0YwAJs47eXXT4EOaj12JFvds3AyBlj+o8gUWimA5K3Lu62zCIsuy
	Lgjliis3Yef8MYiKWHrwk4TzUkWabIZ4qqJn2tKG1IMc9cuXA29osZmoGXN6NOdOFp0=
X-Gm-Gg: ASbGnctZR0+2yFBt7BwBa0cuyZ++L8+/iayZidwBndi3seEMNCPax074ibtj+aA0KXd
	461QIfUzmP0rQr0E94A+geVEHzyKdtGQR9HQzOpsPYUZP5Gi2zgGfeJaB++/pHn1lBkGd/dNadm
	bJ/P1AHYa2ruJlfySUpqI1hvcFRI79l8CRO0gMwDLa5ljI31Zm7J++wQFnuqYNmwUovVY2tlVy9
	mNttkkH1YTXeZerlfq7nJmt7sPREsB+09uK0Zd6Yz5AQV9qyWYDgpHSbA14Ot50b9UTKERwJtOJ
	MrsybxKOSUgSMMQEPD/2KL3Ejg8VY1nYPEZfZ5YtElJmBLzcni2kdAR326pf5KEp
X-Google-Smtp-Source: AGHT+IHypldJuULZ325ar/a9F5r+ljoB/YMqxQ3fIIAWryPfaK7GDkJ6OJPyeHAhWYcOOLtHPwQMtA==
X-Received: by 2002:a05:6a21:339a:b0:220:8b24:ab97 with SMTP id adf61e73a8af0-22409d1b38cmr5899440637.16.1751561105008;
        Thu, 03 Jul 2025 09:45:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5ee3:4bef:2dc:d1f7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee749366sm74601a12.74.2025.07.03.09.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 09:45:04 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:45:01 -0600
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
Subject: Re: [PATCH v7 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <aGazjaJQXl03HUJE@p14s>
References: <20250629172512.14857-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629172512.14857-1-hiagofranco@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_094506_453736_3CEAF82C 
X-CRM114-Status: GOOD (  21.20  )
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

Hi Hiago,

Many thanks for re-working the changelog and comments in this patchset, things
are much clearer now.  

Thanks,
Mathieu

On Sun, Jun 29, 2025 at 02:25:09PM -0300, Hiago De Franco wrote:
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
> 
> v7:
> - Added Peng reviewed-by.
> v6:
> - https://lore.kernel.org/all/20250626215911.5992-1-hiagofranco@gmail.com/
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

