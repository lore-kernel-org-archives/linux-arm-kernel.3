Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74215CEE33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajw2E1NL4+ilWTTz+HJjdJlqtmBwlpNjA2J8C3gJWjo=; b=QmyGz0tV94jKBItkmdpcXY6PYA
	IhWsst4A/zH/db196JupcIq0KqQtysQbCEum4gdpl89bp78KwtPNFj/beRXts7pbFciYw1grC8Ood
	LpnjctxkDsgbdT7jpJzOZOH0h8eaJQGRLZzwMPUC1yGtlON5FZA7K1izSk7Pe41NCQaEkEjc/sbNp
	MmFWfqiO17eWUjrSiV5XdxFPr0UOuoHy5ve64sAUSMdrTwrz3rx5/TSLQcowBW/9NuY5AEKjmY/4y
	2vERyktXp49s/DQYdufCZMm8xAlUfr7aqvP8J2Lp48IcQ3XAhX/Vb6wTB222vO4MAaq2I+QOEaC8l
	La2OSJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOnE-00000000lgq-2VNz;
	Tue, 18 Nov 2025 16:43:00 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOnA-00000000lgQ-1X9S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:42:59 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-297dc3e299bso55400885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763484175; x=1764088975; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ajw2E1NL4+ilWTTz+HJjdJlqtmBwlpNjA2J8C3gJWjo=;
        b=aXbW2/jzv5cO457oXgYXhR2v2ZvyFyLfywBRgJISYpV/3+y9i27hNcW69HZbSXgEGG
         AJ/0sMd2B8NDAIAg52eSp8N0/ra5AQpQ1eh6q0OcyTR5MTPtia2gDFq50lGmvZr3fQdD
         A/qy07g8WLCerreyrRgcgPCoJz+1FSnLo9qwq8j1PpeZFno7z5PB6QxfeS7/DC0ssWUA
         IME0C7JdER8nuRfALaHBc7yfkmj6oE6RQasX5eNkKN4MBEUwjdxcMG2/IiX9+lh3I8lQ
         oOeL5pXK+YOTEDYs1tLVsBw8pGbW6FGAU6SIMSjJS6qRMhvgjRBiBqvyVjtKORiDwd+e
         stkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763484175; x=1764088975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajw2E1NL4+ilWTTz+HJjdJlqtmBwlpNjA2J8C3gJWjo=;
        b=Eg6rRwHTBhINNb29RWIU6U6cxmRnkhByPmgv/0OLEcJYT1KBv3cb+9I5zvJUzbnI53
         8v3cdgRiv/Oan8leGqEPFCD+/RyBTJAY4c7B5plQmaEzKit3sAG7MpVWwiEtPAVkMXJ0
         L/6T5+B+gqBQSkbEfArUDYllxQ5QYa+jpB1bkNnTt3YSpYrMJZwuiZ/YXkKFVnBhgJvR
         2POd2WnOivgB6Ul8JpQPUNI3hSG+jZX+W5eMxfYyY6rUiRieixsrxe2ZahvhwPGaqLo6
         MBhPhvLSxhbabw79mWwjIlxI7zNOQIx52cn3ekEb7ReAwxRjU2CHQY0B3phD8/jWqvYc
         nWzg==
X-Forwarded-Encrypted: i=1; AJvYcCW3/FfQj1R/o5DPNV3PQ7QIOcGtBuL7fp9UCl2fqI0Q2xwtjH46k1VTLnsU+e6StJMXQUNGVVjZaEHvftMu+wje@lists.infradead.org
X-Gm-Message-State: AOJu0Ywapahg1lQ1fy7PXAx0RSYu0DJzmC4XAZciiGns6bV6saabUraC
	iYABI517mC7W4sM4oWjRSZ2RRsIexQ8YSEmpVnbxf+0kb7pVxdiB9Qwu1jfdjoC8SZA=
X-Gm-Gg: ASbGncufvuUI54fZfAkYEn8WSJJ85DNVTsBn57JO6zpxhM4u02LTYIP7LOvZHA2vHke
	ZcV7VmDVPQW/agPAjfGPUkz8h/ECuPn/3AwpvK0K2gXmwqflVspesLOTHujYiXFW8a7lM/ekQZm
	cRHqp+QT8tQQCAxmjFLX+wV+iF52hS0pIHNlOz9TMb5oIoPLiPzcv2K6DVlyQRuHcwuzzO1n6wk
	0f3pCkNFPnwMkdqvOFGKk135B5G0C9L+U4quQWJ+z1caGaw4glNhAI0Dw4HwOFRV7zoZHC9R/JC
	H6TVxowA9k9Kug2/adsJ22NQUkSGGUzB6pqULTVJECoozSxXPnAtFy5ArSDAlfSLHpGUEVTuPXH
	xJrkuyRfog9xhBhePwmdV08wMuSNWiJhtt8A4vlOLXFlGdYqucWux6KzCN0FPY5BfpR26zks7CQ
	YT8j+px8nX2orHHA==
X-Google-Smtp-Source: AGHT+IFHZInbopaXHrcms/mL2ZLWLLFWIrlmSWjRDYQeHFfnq14u/a3jqiLWEErsYjmSVeHRv2ntAw==
X-Received: by 2002:a17:903:247:b0:298:efa:511f with SMTP id d9443c01a7336-2986a733395mr195293315ad.39.1763484175459;
        Tue, 18 Nov 2025 08:42:55 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5650:f012:168c:76e0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2beb34sm179110845ad.76.2025.11.18.08.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:42:54 -0800 (PST)
Date: Tue, 18 Nov 2025 09:42:51 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 11/11] remoteproc: imx_rproc: Remove enum
 imx_rproc_method
Message-ID: <aRyiC2m5z9M_vPOc@p14s>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
 <20251111-imx-dsp-2025-11-11-v3-11-d05dcba737fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-11-d05dcba737fa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084256_930446_544C6D4C 
X-CRM114-Status: GOOD (  17.70  )
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

On Tue, Nov 11, 2025 at 09:41:22AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There is no user of enum imx_rproc_method after moved to ops based
> method. Remove it.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.h | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 6a7359f05178a937d02b027fe4166319068bd65c..1b2d9f4d6d19dcdc215be97f7e2ab3488281916a 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -15,13 +15,6 @@ struct imx_rproc_att {
>  	int flags;
>  };
>  
> -/* Remote core start/stop method */
> -enum imx_rproc_method {
> -	IMX_RPROC_NONE,
> -	/* Through ARM SMCCC */
> -	IMX_RPROC_SMC,
> -};
> -
>  /* dcfg flags */
>  #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
>  #define IMX_RPROC_NEED_CLKS		BIT(1)
> @@ -42,7 +35,6 @@ struct imx_rproc_dcfg {
>  	u32				gpr_wait;
>  	const struct imx_rproc_att	*att;
>  	size_t				att_size;
> -	enum imx_rproc_method		method;
>  	u32				flags;
>  	const struct imx_rproc_plat_ops	*ops;
>  };

After all this cleanup, please remove the goto statements in
imx_dsp_rproc_{start,stop}(), as it was done for imx_rproc_{start,stop}().

This set can get in the next merge window if you send me another revision by
tomorrow.

Thanks,
Mathieu

> 
> -- 
> 2.37.1
> 

