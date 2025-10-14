Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E7DCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ir76BHl669cEuMaEpM03W9flQt3ajXteIgC+QNdmFc=; b=za9LizaGs06SOlynifReKouwQm
	RGJJq2ouF8vXSI8bAhAFo233cvpnGzh3JjGjiJRJju7RQU03Ut+6IG1ZSpcov/raNSpc+BrQiIOlZ
	vvnod0+WEqOaMd18DACf2xJdr8P8d1NkJNsUdb6RBPWn32IGpFrxdWlcgjA+xILSbuGf7ItVMA29D
	Lo5XHMfl41exN07+PapVl8L/Of2QAdsfZii+ptH2HMCHzI6uTfAbryg1qqJomeBD3zQRK3siy9HZG
	pO+yDeFqZyC7ItoM51oEA4m6a8E3auOQg4e9uzigYVE4NQ4ZgDWZdXVghkw7v0ttNwPoOyPs4tf9t
	pYOb84hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8goV-0000000Go5R-3sJb;
	Tue, 14 Oct 2025 15:19:47 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8goT-0000000Go4A-2IlA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:19:46 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so4915273b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760455183; x=1761059983; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ir76BHl669cEuMaEpM03W9flQt3ajXteIgC+QNdmFc=;
        b=cqLhgmc48ucwWTKOqCgvwOcnCn3kGN0OyYuDWx4lO6qCgQbJlMFyvBPsmo25l1fOvP
         t5MsU5nmXZr+2XA0+zYxLZxOa4DW9wdPPgJYzfSQHgT8tWksz7Ttng3cqw2nCgR5DAcd
         UaiBL5DHpPWW0YuIaWehllUZqT3j99ccDPPA/7MXFsQFVrLMQu2ymX+XL1tMHewocaBv
         kgaLiRHGqHUGRR2qL2jLCDyjxvfPQcnoSA8tmBvWrUvaXu5/ZJf4mUdDKgIgc8yk57S2
         +O7XUNWvMOi8V5qFJxqeo9NkeE94D1Jq/Q5U+2CkEOVh6zoa/T0enhn7LO2IG8lwtH8D
         RuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455183; x=1761059983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ir76BHl669cEuMaEpM03W9flQt3ajXteIgC+QNdmFc=;
        b=Vg340Gqkpg9qH+eSFn/VmHSt32N/3XiFz8+7L9fwwd1RR+9pBLue+aOEPTI6kWJLmI
         pTyTWEVKy2ylS0Wv6z5c+3N3Snfx/AAwE1pX9OgV/gNulYamqyaKEHTq3EgpL68wTrqY
         583WFxOY+xhQGCC+mgrQD3ZecAh6tSr5/gxVPBdntedg+52IzI3Xie8U0/2sMED/JsB2
         ldgV20scJpOo/y04ULUcksrB5B5xeHU83P2qNj5iSvxirpBOgHTwJivOv5QkFL9oi8tj
         QNzbbUWd59/rrsH15qZwn+kYdV1H6qAzXKBwEdjzmI+b0tMHKAk6ZNqV9qMbuP0YGjfJ
         4vVw==
X-Forwarded-Encrypted: i=1; AJvYcCUiNERnMff97m9yw2dK8ypJiH2anqXo+Fk1VC3agLVy41ZZ+6MBcgVrvujIBemIuKJr6yV4c2e1IvT8Gw1DAgyh@lists.infradead.org
X-Gm-Message-State: AOJu0YyL9DplQM4CjZAnkS+GW3e3alkieaPCfWn/vR8qhMpAoi9qHEhy
	8O5M08I1luCgtqCKtqxqpBFNJmACVWl4AKYSfkImsmG6Vpx2hRyX9X3qxyAvQy21Ea4=
X-Gm-Gg: ASbGnctKCBflVnA0NH792jlk+5PFMxffImc9baYZknpPH4Nlu/QabOpxLre183yedsX
	uKgFMeWHPBP7+wh5+/7SQ6o/h3bRPko+EGA9hML85L2IARhqrwSEq0kztUPxzxW/QmKLr7i7Ksh
	C8sBjV2z9ORxrhEVNECZHQ6kp0KgqelFZ2R+GHOpdSQNlmAG7leLge3biupDR7AYImMEcfebpfg
	ptRRU+jfQfTBcAFAfabeiZYHz91r7VUqWz651jHyDHWPSh7qbjavaK10+9+8p/56zJguvOqdCFZ
	Fz8IJq8sqgVxlHB+rwo639WSCFjxGGhY9oSy9b7/4cMfqDioOgsY4zhg4zop3qRvuYyEo3U0mni
	OsiqPO2dHqXSkK6vqP35jGHyGZH2Z0d/SR8Hq8bypLMk5PmYh
X-Google-Smtp-Source: AGHT+IFyB19tBrRI78lBip24cgwJen4HE5EwQh3gPEKFeov+dsUsLURXmK6mh2xyEaOoeOtVoeTxeQ==
X-Received: by 2002:a05:6a20:734b:b0:2e2:3e68:6e61 with SMTP id adf61e73a8af0-32da820723dmr32624654637.16.1760455182842;
        Tue, 14 Oct 2025 08:19:42 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:68ce:31e8:3a83:30af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9932edsm15282751b3a.73.2025.10.14.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:19:42 -0700 (PDT)
Date: Tue, 14 Oct 2025 09:19:40 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Message-ID: <aO5qDExs3j8k5cjf@p14s>
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_081945_608986_03E2816B 
X-CRM114-Status: GOOD (  23.74  )
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

On Fri, Sep 26, 2025 at 08:33:14PM +0800, Peng Fan wrote:
> Tested on
> i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.
> 
> Retested all the patches for V3 on above platforms. And pass build
> with patch incremental applied with ARM64 defconfig. pass build for
> imx_v6_v7_defconfig with all patches applied.
> 
> This is the 2nd series to cleanup the driver.
> 
> Patch 1:
> Fix the runtime usage. This is not critical bug fix, so it could be
> defered to 6.18.
> 
> Patch 2-6:
> Use devres managed API to cleanup the error handling path and remove path.
> 
> Thanks to Ulf for the suggestion on the runtime PM fix in patch 1.
> Thanks to Daniel and Frank for the internal reviewing.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Follow Ulf's suggestion to address the runtime PM in patch 1, and add
>   Ulf's suggested-by tag. I dropped Frank and Daniel's tag in patch 1.
> - With the changes in patch 1, the remove() is kept, then there are very
>   minor conflicts when picking remaining patches in V2, so I still keep
>   R-b tag from Frank and Daniel for patch 2-6.
> - Link to v2: https://lore.kernel.org/r/20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com
> 
> Changes in v2:
> - Address a build warning in patch 4/6
> - Add R-b from Frank and Daniel
> - Link to v1: https://lore.kernel.org/r/20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com
> 
> ---
> Peng Fan (6):
>       remoteproc: imx_rproc: Fix runtime PM cleanup and improve remove path
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
>       remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
>       remoteproc: imx_rproc: Use devm_rproc_add() helper
> 
>  drivers/remoteproc/imx_rproc.c | 100 +++++++++++++++++++----------------------
>  1 file changed, 47 insertions(+), 53 deletions(-)

I have applied this set.

Mathieu

> ---
> base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> change-id: 20250926-imx_rproc_v3-a50abed3288a
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

