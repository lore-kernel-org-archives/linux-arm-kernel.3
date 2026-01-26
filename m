Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A326AD19503
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKR5exgvtJ4nN+wmy7UGkJjcYwJf1VIP0gn7pcEz2lI=; b=YMnV3VWhzKxCnzAOaXj6qujjsU
	ZP/VYiNmiILxwmkntRF1GgvzIT5vnUAOoySoknF0x85B87WLGil9PoAre5SlV530TKc94RTmME7P3
	n/OjC9PWncmVctemOa3HbjWw9qDyUObmnCbt5g6fCVZk6V1LxntJAJVd4Uge7N0ir8izGFsZr9Ghh
	/dV13HMMDxwvNLyD3JFQ4ryc2QirxNzEOZrHslSiQZRxJx8niWf0h2sFGeKCiie+VgdV1DuZx+W1c
	oQv9JrQ87XMwsNIkfyepKwEPbbmNtyJ5b5lQPOdIhR92WnXjPuuzCqnr4KfNN4hgU7nJMDJBKOxBf
	gLhEJwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPmb-0000000Ctb0-2QKR;
	Mon, 26 Jan 2026 16:49:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPmZ-0000000CtaN-2H8k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:49:44 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a12ebe4b74so46099575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769446182; x=1770050982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKR5exgvtJ4nN+wmy7UGkJjcYwJf1VIP0gn7pcEz2lI=;
        b=AvMqMienFv+RbSDdlsRG0i+Pfy6E+XPyk59dfd68TpzzaRU6fspJuiMhlt4j2Mnzmc
         2TcbQsmPH2JzuWgz11xgE6TFhvNTQrM8LSwnMGkJDmUOaJbLlfnrhRq9LALa4uvUZi5M
         z1kdmtD++S6KGrhKWvPLUbKLEaoxCJqGqTDLfLgHKmsimLjSkR27l1/elgEVWjVqoe3i
         8OVlsdhnWvVc/BrZgr4lA4d4UYVrPYrhpEDUBx1ds+M3xzk9KKXU3y8+fS3TDz7cNDnQ
         sGJ8TunFUVEaGKho/cbOhsfgCwFyjs6MJ64s7wUPFwdJ0XqpJqchvweFrJA8O52w7NHw
         /0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769446182; x=1770050982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKR5exgvtJ4nN+wmy7UGkJjcYwJf1VIP0gn7pcEz2lI=;
        b=PhL0DFbK38DRg+kKWBdvHPdu/Xh6ZASeDhsG6h+urUZ3lrhDwSdBBmO1PdKlvbQ6Xi
         APAVj5TXT1rq/rjRURRlHhnA35DiqrmmLln8sStU4+sUSfQgDD7fe9wYyFKXXnAowxyq
         J5kEpsUr2h9q2RkvjHOfJTmXMdpcnprk2ngH3ZiOjgcuXV6Lw/Yptig3NZDjjD3+cwvN
         469fZuWkgCu6IjomslklpPwUzvwrUS/80OxwVLUTdOo9v7sSCIY/CjigTjNHZ/Ay9qQH
         MJHJtKtF+cBBFC006tOWU4MVfujEMKGsBpIneCt8gUnkhx5kQPXIy3k3krU/HdmcSeJ0
         E12w==
X-Forwarded-Encrypted: i=1; AJvYcCX8aVt4wZj++WMH7jHHjf0CNkXo5WAjGIY82VMk9TJCzCTmsQSqyRjT/5jPzamXfwxgHM6gPRymVJWqYxG0RXCl@lists.infradead.org
X-Gm-Message-State: AOJu0YzUJfRsiF+tVDhjW+Dr26PESbSbzkUCmoYZwp1YahV30eiIGgl+
	BdkkbeCN+fF3rGOz6YzcXkhpRF87N0G2STOrK1wpedgsTwsymBb7BPzstkSc2iprmrk=
X-Gm-Gg: AZuq6aLoqxhiYSvDXmgR2OTAtgVTgTBWCw861CfpKqc2B+AVfoR6+GyCbhuFeh6+f38
	xuLAW0D55AP6FRalcBRZd2n9BW28LXDulUTirh2NsI3XfUe1SXI2kpCcyxj6vEi99V9v0VINb48
	Zb70KCyePyXbIGRUgVF8xDRbevt54sUeWmXk1oKRZ3T5YXUBD0mWcqVAszJ9s13bkp8kLK3Zlbt
	+aT01PsuxamRVz3JRTFk6nbaK/xGiY2oh5FZU/53dosFLN32SQS4l4teVy5ZV6XuCfMfROC6hsX
	SAk1P3lMCIY1Qm03V+hqLFmNJQhOsZM2CzgVuUSUNzbsDztKSPSP2TMlYlfTyPeMs2xTatCV1jI
	9fzyPOSyPLl+4xoCrnm04bNdTlquAQhri6/QgKwD9/3zVMrkRZvZtFTI1E9qtuMUtPxEXRwPXOk
	+6fgrAyCk46VAyZg==
X-Received: by 2002:a17:903:11c3:b0:2a2:caca:35d2 with SMTP id d9443c01a7336-2a845224d47mr49945825ad.16.1769446182265;
        Mon, 26 Jan 2026 08:49:42 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:6260:7bcf:7e2d:fa8d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcdb8csm94531115ad.31.2026.01.26.08.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:49:41 -0800 (PST)
Date: Mon, 26 Jan 2026 09:49:39 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_rproc: Not report loaded resource table
 when none
Message-ID: <aXebIztkPihBsLRK@p14s>
References: <20260122-imx-rproc-fix-v1-1-36cc64369a40@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-imx-rproc-fix-v1-1-36cc64369a40@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_084943_597152_5D1C4C78 
X-CRM114-Status: GOOD (  27.96  )
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

Good day,

On Thu, Jan 22, 2026 at 11:24:43AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When starting a firmware without a resource table after previously running
> one that had a resource table, imx_rproc_elf_find_loaded_rsc_table() may
> incorrectly return a valid device memory pointer (priv->rsc_table).

priv->rsc_table is not NULL if the DT has a "rsc-table" entry, indicating that
_if_ there is a resource table in memory, that's where it should be.  Function
imx_rproc_elf_find_loaded_rsc_table() is buggy so the narrative about a
previously running FW with a valid resource table can be dropped.

> 
> In this case rproc->cached_table is NULL because the current firmware does
> not contain a resource table, but the remoteproc core still interprets the
> non-NULL return value as a loaded resource table and attempts to memcpy()
> from rproc->cached_table, leading to a NULL pointer dereference and kernel
> panic.
> 
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> there is no cached resource table for the current firmware. This ensures
> that a loaded resource table is only reported when a valid cached_table
> exists, which matches the remoteproc core expectations.
> 
> This issue can be reproduced by:
>   1) start a firmware with a resource table
>   2) stop the remote processor
>   3) start a firmware without a resource table
> 
> With this change, starting a firmware without a resource table no longer
> causes kernel dump.
> 
> Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 375de79168a1c8d11b87ac1bd63774a3feac106d..cf044b385b58fe1e17d0fc440c243d76ecf020ae 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  
> +	/* No resource table in the firmware */
> +	if (!rproc->cached_table)
> +		return NULL;
> +

I think rproc->cached_table should be kept for internal remoteproc core usage
only.  Please use rproc->table_ptr.

Thanks,
Mathieu

>  	if (priv->rsc_table)
>  		return (struct resource_table *)priv->rsc_table;
>  
> 
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260122-imx-rproc-fix-e206f8e6e477
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

