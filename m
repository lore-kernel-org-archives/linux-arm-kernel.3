Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44D3C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxkvsrSL+5JDtGQsAevbH9zmJ4Ly3BiCGEDd5Aq9Bn8=; b=QEidReR/t3VtoqThs9okVd6Hmz
	k3qbCa/SDAGlVqj9ggDGE4eqWAWBqdWJ6AVL1Mh6txnBio0MdDTudn1aQuIiXck7A2NJy8JBRv65s
	dBEhA9e1sVQDqPvodyY5i3qATM2B5U/wNTkoajJeJrZCF9M5CNN93DpxuQNiCLKgfVvCc0dA92lvP
	wqpRPgqPie3pGhhXPewB561BdyzlSaq92/iJfShbIoakMkLLLA8ZJZuDlWW+gLjpwlZTCBycQe9O6
	2Ond+6kPf6uBEoRa3Zt55y6YXIQbcSqvZsL8Xb2lnEBtgvGy/jBL/nPbQyy6e6QezSowawfmK9dlY
	3nHEzPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzW-0000000CTG0-2B0V;
	Thu, 03 Jul 2025 20:57:10 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLbB-0000000Bm8Z-0m7N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:11:42 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ae223591067so939474966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555499; x=1752160299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxkvsrSL+5JDtGQsAevbH9zmJ4Ly3BiCGEDd5Aq9Bn8=;
        b=Ja6gQX6lNZlX23wuNjU4iwvsTiV6TSqUXiY6TEr6NBjDSBWFuCfhYAs/HEK754yKPi
         CfdmbyLfbCWZ0YCfTB8O63uFsGZePTqtC33Q41Ghv0/b9AW3Rs1eDxiBcrreWB//rqn7
         a62QTs86aYTvKapXmxFLH3rkV5XsZhjYjrEzcNgxmztvUUBj5Op+l3MzCod87yz3xD0d
         faXG7EdynBmZ+x2adbfcwRRoLrEMlYHZK2UvJQPUl7AY5bAFqTCLdZnJFjVdjH1IBY8P
         MVmERnLM0NoKrUR7chnXTEdZ+fgLJZb/OynWwPrJ6M7TP2TiMS+v54td7CYw7P+0zBtD
         F9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555499; x=1752160299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxkvsrSL+5JDtGQsAevbH9zmJ4Ly3BiCGEDd5Aq9Bn8=;
        b=LrkKdtoEdYW9N6OLD580Q972mitsQkx+jQSYfbRd+zV/9XoTywEG69Ix+/Mi0TpEJd
         v936ya2za52a1zhBxoopHd+1Dzxdgp782R7Oxhk5yifEwyWGrsARDx7dJW0WSKpAT7N+
         uU6KUkglbLkHfqy02lERfGw1oaQ8FCz0wnLFU4DYpw+jw1bCUFsRdQ15+NoXIT/VRBCq
         3hYQmwSW2aUFnVBexMr+c62tb9zPqa4QfTsS+ej1EycI1DBbvt0+JV2YC2iyKS+K71Ph
         yvYeCwkTihfE6sUzM63ypnk11IciDFKUmnfYMAZZishZvQhDiLbzD1eKgtQCH25YrI1X
         Sf0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVlQxEfkzgVba2vDJG+0HDGd3Sicc7oOBP4aOf1Ko0TmfcLT6d5hHGd8YhO2b87IAK8o1jW1NEicU5f5LxjxD+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6Bc72FvR4/qTxj7EzBp/1PJWslSRUYgLPHFW9Xs7EwX4X/Fa2
	D3KGaFTfCaUg3vKWsieIW8dmjqkO48aauY+slgNVnQOAB5A6WHsmjwWPTcG72fI2pgk=
X-Gm-Gg: ASbGncsAYBblRQxxwqWZMnN4LLLl39VuRHljpu8qAFPXFSwik3m5sFr+vAG+CEVcZgH
	ocMTl+NJhHrJ/7Hk9aNsSYmSUVUKSkIaDvHZEeoQ9EqvG1/dYVOPImAEufBc4b8umithymeYhof
	yP0qyjyL9bM+sK8xz/EYhBPgs1T0CnVUWL/U5I8USde0XzGG9NqhS9ZctgMOGCyXAK+KCKg7bVk
	+9fTp1eZ6CYogjtF3DNY03WO8s40H27GiFK4Qyzf85B0is0jPUgcGvEetAaeISEvyLf650Aq9p9
	PkRvAeyFQc6wMdqGtyqNJaWBI1hBZvr3BEotlFpLpseuGit/LYhvumklDxU=
X-Google-Smtp-Source: AGHT+IHdpH0Sd2LIExCI7zlJsSgp4lqg2r2dh7poJIycXB81JioP7FOT54h9vFTuZ+M/bEMSFmF3pw==
X-Received: by 2002:a17:907:72c4:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-ae3d84f7aa3mr410481766b.36.1751555499231;
        Thu, 03 Jul 2025 08:11:39 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831b3e29sm11077956a12.42.2025.07.03.08.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:11:38 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:11:36 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 2/5] clk: imx95-blk-ctl: Fix synchronous abort
Message-ID: <aGadqB5pP6DjNuRH@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-2-b378ad796330@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-2-b378ad796330@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081141_227009_598A4D43 
X-CRM114-Status: GOOD (  14.28  )
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

On 25-07-03 11:40:21, Peng Fan wrote:
> From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> 
> When enabling runtime PM for clock suppliers that also belong to a power
> domain, the following crash is thrown:
> 
> ---
> Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : clk_mux_get_parent+0x60/0x90
> lr : clk_core_reparent_orphans_nolock+0x58/0xd8
> Call trace:
>  clk_mux_get_parent+0x60/0x90
>  clk_core_reparent_orphans_nolock+0x58/0xd8
>  of_clk_add_hw_provider.part.0+0x90/0x100
>  of_clk_add_hw_provider+0x1c/0x38
>  imx95_bc_probe+0x2e0/0x3f0
>  platform_probe+0x70/0xd8
> 
> Enabling runtime PM without explicitly resuming the device caused
> the power domain cut off after clk_register() is called. As a result,
> a crash happens when the clock hardware provider is added and attempts
> to access the BLK_CTL register
> 
> Fix this by using devm_pm_runtime_enable() instead of pm_runtime_enable()
> and getting rid of the pm_runtime_disable() in the cleanup path.
> 
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

