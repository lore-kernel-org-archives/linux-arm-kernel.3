Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA70E87845
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2ttDn1w1QA2Cz+Z+5lpKBPVG/z+n2qwJYLNRD++3uA=; b=jIai62yLXQnTTMLr8Ch9kYnyCn
	J8dS7ojQsWynJR1FFJ5Fp9M36utnwDNw7yt4ghONSHwZwj/s764mt0MkHIAqL4MD1vm7D9cCThSie
	VtytWnUv8KmydAVOTZursr/dnApAPCfpsjgHMj8ILSta6WKdZXTUK2E/2InPieXwLAnoh/Rzv/8Mj
	zvp3KcUNXhNNjjfXi2QEULyLvAZMWma3CARzq2RvSNtrQdq/aZWZHEFI6QA6GnT6Xjm8mrRiYjNCG
	+wXoBX2NKgPBM0AdL/Sc3Fk9cST5J4aI/n8oOQx4PeymcN/nfzY5mPrRoQCpZYhpczDNMiZeOERmU
	a4lSAYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJGj-00000006wuR-3iwR;
	Tue, 03 Feb 2026 16:28:49 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJGh-00000006wu5-2n8G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:28:49 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c61343f82d7so2329329a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 08:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770136126; x=1770740926; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2ttDn1w1QA2Cz+Z+5lpKBPVG/z+n2qwJYLNRD++3uA=;
        b=q1JBU66hRyzihwM2ej3eHGuSk3yTq/9OSCuTxgYWUgdFe66tTOFAQ8iNTdsnhaTEOK
         4qN2CWcE5Jw8ApbLbujsjkcSJUMQiojk1syr9onW5PPnn1GNFbVjr2LUZd2FJzmSRjlm
         NIodmgtTWTjEOemPh0wWlgq/LbQvpKGgTDYTsFwZRkPgGBSdjoXTQJnAfGI81t1FMyky
         skh02khdIQDr7UhqaBhTwXu1jAnRV2aJ291qB1ppPkNlRHwAQb4ABupL2m0wRhbheAfy
         j5sME1zgNGTA/0m36tqv/PGbBi8xCfXDjq6vunJcEeJbV/faH6RvoQyM7rYr7k+Bqp+1
         W+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770136126; x=1770740926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2ttDn1w1QA2Cz+Z+5lpKBPVG/z+n2qwJYLNRD++3uA=;
        b=cYXutHltW51Y89hnmK1UKww82f1TQMfilgA3ix8JAK6stiUZ6TY4rzlArTptdSJzWH
         ifgXzlFyUwxn/E8UeyNYoeFx0zl/4jGgaKRZCyrJDUJEP2HxLsh1mDP6NhOOftzZzOed
         v1iUz7mLALTa2O9nMSD3yB/sOsSndhmLgax1gSqZZqFo7EqcjPDO2eI1vV/dTH+QI5St
         tZwY52WubJkAof5SNIKMxa18qL7pj5G6QUU6Lzs3R7qyM08wrvhDl+lvSvsBCtVoLEoe
         W5oiiZNN6M6e2uTlXqWU9dZFXJBWnWFaE1Edx9lWekDKDeAFZLNV9C1ml5GxGslTXZgf
         +wUg==
X-Forwarded-Encrypted: i=1; AJvYcCWwTmBq6+zaaeh4AOBgzoFpqiHwLdHdJ37FdqdOuUZrDo439Nlmu+oXhYPXpLaEZBtGHWKxjoq8mxu7rDmZgeFY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw634mqbcx/TRqmdN0SrHt2gGwlLRywE17DnphIh/kbuSNfznBp
	gPHhWP2OKSMhDghpAydZMJtEbiX4d6nevOwHfTBCWjNMAdGXmCaua/PBe/21bC466rXaDk0NH+c
	BX4MzbWw=
X-Gm-Gg: AZuq6aKNrxAHxdmrbIqmpzB/tvHp5VY4dz5RMheIKE5Y4KrL2ob8bcurPeXF/Ij9upI
	8nvQ1ELNkeoHLLsy/WI3iW6LWVUkr4qEl/pRkHUE/EukLerMQDGcxm7Bmt5i3VIhG/mVlwttc5E
	6OsrIbOJgvoaoxCrMU46UZPEuMeOkWDyUKSisbCJY5Z3VAJObMsVQAO03XM8b79/WmHbahLSE8v
	hRFk0Grm6fBPQbB4Xahh5Mym1vwUgi+GuTSLTzKFl+4sPMKFYvWXcUWdr6cPEWZXi03HZoVRC5c
	J+agvrUmqXjxkjUxHB2aSseygMPgRJus/V0TqOHWLDMceTaWn6IV0z49qDvHyTthIbHgHeZU2jD
	Gave7+XOJuOMkbWp8wkV6IluLQz8dNAB54T9q3Rb3YGoEk0fAgm2dUyzFnR5ow1lo1/EkzgscsD
	JhTKsDD0CukgVs
X-Received: by 2002:a17:902:f690:b0:2a0:e94e:5df6 with SMTP id d9443c01a7336-2a8d81818c8mr134926125ad.50.1770136125857;
        Tue, 03 Feb 2026 08:28:45 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:8fb0:b75b:356:3f2b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d57sm177851015ad.60.2026.02.03.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 08:28:45 -0800 (PST)
Date: Tue, 3 Feb 2026 09:28:42 -0700
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
Subject: Re: [PATCH v3] remoteproc: imx: Fix invalid loaded resource table
 detection
Message-ID: <aYIiOtUpTebzMZcd@p14s>
References: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_082847_706991_081351D1 
X-CRM114-Status: GOOD (  27.22  )
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

On Thu, Jan 29, 2026 at 09:44:48AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> resource table even when the current firmware does not provide one.
> 
> When the device tree contains a "rsc-table" entry, priv->rsc_table is
> non-NULL and denotes where a resource table would be located if one is
> present in memory. However, when the current firmware has no resource
> table, rproc->table_ptr is NULL. The function still returns
> priv->rsc_table, and the remoteproc core interprets this as a valid loaded
> resource table.
> 
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> there is no resource table for the current firmware (i.e. when
> rproc->table_ptr is NULL). This aligns the function's semantics with the
> remoteproc core: a loaded resource table is only reported when a valid
> table_ptr exists.
> 
> With this change, starting firmware without a resource table no longer
> triggers a crash.
> 
> Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Update patch subject and commit message using this one [1]
>   [1] https://lore.kernel.org/all/CANLsYkyrz+A1iEabGZ6rFybFo4=mM+TPVDRSckFB2YUS_7aKow@mail.gmail.com/
> - Link to v2: https://lore.kernel.org/r/20260127-imx-rproc-fix-v2-1-7288fcf74385@nxp.com
> 
> Changes in v2:
> - Per Mathieu, Check rproc->table_ptr, update commit log
> - Include R-b from Frank
> - Link to v1: https://lore.kernel.org/r/20260122-imx-rproc-fix-v1-1-36cc64369a40@nxp.com
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 375de79168a1c8d11b87ac1bd63774a3feac106d..f5f916d6790519360f446f063e09d018c5654953 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  
> +	/* No resource table in the firmware */
> +	if (!rproc->table_ptr)
> +		return NULL;
> +
>  	if (priv->rsc_table)
>  		return (struct resource_table *)priv->rsc_table;
>

Applied.

Thanks,
Mathieu
  
> 
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260122-imx-rproc-fix-e206f8e6e477
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

