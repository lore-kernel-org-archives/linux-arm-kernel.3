Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D46ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Wq0zL/Wc0Htkj+BfsfKHKvDwUIKed8MK8zTT8591bA=; b=u1YDsrL3IwokphabQslc81OIE0
	R7MXGCPlUE+DlboHoJJYiosKnj7/jCSfsiJUMsQICsJhu6LqCBOT9zFkL4+hhDKi2gQIrtGfKOFPG
	GNGvQt66uK5h8tD8IO9ZMFj9p2N19ANvtTtHJfFkDTzPVEWvCqw7W+iqJKWM0Op3Yza2IdRDyWp5T
	6LSkRL5glYloquoJOU+uS/v19mqk+YgmNqM/O6u0nRsnJCLwSWwoKOxxOK1IU1TpxT9OyxRZVOB8M
	Dn24cZXG5Fanh6HdjxZUjO4cdi3tsPPvjnqd7UQMGAMI/6Ob+jvLB4yWcvE0MSNdrfkyCN/d+bqIz
	VO8hAcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyC32-000000056pU-0oHw;
	Mon, 15 Sep 2025 16:27:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyC30-000000056on-1Vhg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:27:23 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-261682fdfceso16863445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 09:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757953641; x=1758558441; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Wq0zL/Wc0Htkj+BfsfKHKvDwUIKed8MK8zTT8591bA=;
        b=KvbFkSNtq7Frkfoz5sdqNrupxYTc5Z9i4OcdsgleKheZMxPgpdT4jz3pAyyp9JifFP
         0eA1iDErmFc4cXXN3wtxxz7z2rHNGB8jyyYDJETcJmYqKuJo8V6JobhN1YSZSwd4LrGz
         jk3D+WDuBIHssIOJOizfqpELdcrxBRrCh5x7K4iGrwr+PW9/q/c6+Sk9Yf32OBhr3mcs
         WNkP3vS35pGU5qLK7g9nzgyTc0Wjm9wrSg6L0uOIqKkFeDJbhIOOtwq1Cson25Mkshzh
         RE7qVuLIXCbZQeTjuJieVyqu7bVwx9BqFGLnN8jrK+sj+JkqGCpZYMqRS3J7bQHBL9b9
         qdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757953641; x=1758558441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Wq0zL/Wc0Htkj+BfsfKHKvDwUIKed8MK8zTT8591bA=;
        b=c37iwCGL3dLSD2EFhjF9P0NaNhDzm1LhiPy4FksvYzW8cseutuOKc5qzsTk1hO0es9
         Heq/KKHUwh8SbO+wfFjQxJxllAP4lnDdB7yrGa3eCo2mXDAAuTHNff70bZ2v4MOj2d6a
         QPZ/tAQ/uQNM5MocFPO2fMgarvVUizAQtfu3DTRNMLF1vY+HoxLxfWZqOKcrTMt/3QbV
         2N5y1euZpBIyIQGtwojQ7zG53/yZ6/4BZFRS9FOlEXCzjSkbTsbDkcUz2JR7qE+jkhMZ
         YxadhMvmjpE1YBn6s4kkqp5fecTfkBxG7WYPOYVSF6+eV6talxbckczrl8ETgWFAMDdr
         7rww==
X-Forwarded-Encrypted: i=1; AJvYcCUqRR3x4bF8YOeUFYa8GduXWiBdtk5VCgq5qVI53dnLFpcOOm+6xwKe2l2KrT5q1vLHIVlxKHgcUuLX4qFlE82/@lists.infradead.org
X-Gm-Message-State: AOJu0YxoNaE4SYRUPgnyDN3p6GgLaovMaKgCFMu0W/Z2EiIFSNJqK5Q/
	Ec02+DX27jMKzXWtz3iIYrcw6a5ppODI7OwoQc5GYrushiN2cDVWEZZSsbSUxeVpT/k=
X-Gm-Gg: ASbGncuwgwMIXFkR0rZfRL0xrS3EatU7GyXy5PJuAVkayqeiOBELml6DzkH96XDbJ/Z
	AfrmmKbrCmiX1OqqElqZgCkuFOVQdwmUtbGU8BcYQV/ms+AYW+tsmzpcaFZemzM8ArA5vxa3dNE
	p9VsrhBH7RYazJdcc70teLUHI1vkYF0tjghoa+T2u834A+6PHvnfwOHrORQHRAfpUqUl9f8COrV
	QUw0FhBrq6dMcbdrpPRilQpaEh/M1wgn/9vq9LrAcudjqBUf67rPRwBEPeXBb23q/iclvxC4LMq
	AQzlD9G6nxq9QswX+JLqvQ40kEicsM2haoy6pTO+tKPrr4rYPoEQxpPYUyXSPLYABIQOc0raSp7
	HFJ1qHZ/8egsjL0CajWikXLqe+GMn9N1GciC4ZF37ECsTOnzIU3KZfTIWt8RNMlDxVGRNTCdyRM
	9leEceW6MMYyh+mhho/ELZoKv8dpsuk4L3Yw==
X-Google-Smtp-Source: AGHT+IH31zRCUDSkqS9JLKhdPK0Ywp1tQqr2PiZwav0DNP7t0zDxlTNym5N+G+H44epmJz9G3i3bdg==
X-Received: by 2002:a17:903:41c1:b0:262:3e45:4c88 with SMTP id d9443c01a7336-2623e454f01mr114037935ad.18.1757953641028;
        Mon, 15 Sep 2025 09:27:21 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:67c:a85d:f066:9008])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267a1d2eccdsm22392055ad.97.2025.09.15.09.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:27:20 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:27:18 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] remoteproc: imx_proc: Simplify driver by removing
 the switch-case
Message-ID: <aMg-Zg6juddLZwfO@p14s>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_092722_408400_D7ADA561 
X-CRM114-Status: GOOD (  19.56  )
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

On Wed, Sep 10, 2025 at 03:11:44PM +0800, Peng Fan wrote:
> This patchset serves as a preparing patchset for i.MX95 support.
> 
> The current code logic is complicated, with mix the usage of switch-case
> and if-else.
> 
> To simplify the code logic:
>  Introduce struct imx_rproc_plat_ops to wrap platform start,stop,detect_mode.
>  Each imx_rproc_dcfg data structure is assigned a ops pointer.
>  The common imx_rproc_{start,stop}() directly invokes the plat ops, no
>  need the switch-case.
>  mmio/smc/scu_api ops are included.
>  No functional changes.
> 
> Thanks to Daniel and Frank for the help.
> 
> Test on i.MX8MM for MMIO ops, i.MX8MP for SMC ops, i.MX8QM for SCU-API ops.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Simplify the if/else in patch 6 per Frank and Mathieu
> - Add R-b from Daniel and Frank.
> - Link to v1: https://lore.kernel.org/r/20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com
> 
> ---
> Peng Fan (6):
>       remoteproc: imx_rproc: Introduce start/stop/detect_mode ops for imx_rproc_dcfg
>       remoteproc: imx_rproc: Move imx_rproc_dcfg closer to imx_rproc_of_match
>       remoteproc: imx_rproc: Simplify IMX_RPROC_MMIO switch case
>       remoteproc: imx_rproc: Simplify IMX_RPROC_SCU_API switch case
>       remoteproc: imx_rproc: Simplify IMX_RPROC_SMC switch case
>       remoteproc: imx_rproc: Clean up after ops introduction
> 
>  drivers/remoteproc/imx_rproc.c | 449 +++++++++++++++++++++++------------------
>  drivers/remoteproc/imx_rproc.h |   7 +
>  2 files changed, 265 insertions(+), 191 deletions(-)

I have applied this set.

Thanks,
Mathieu

> ---
> base-commit: 3e8e5822146bc396d2a7e5fbb7be13271665522a
> change-id: 20250908-imx-rproc-cleanup-6f3b546b9fdf
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

