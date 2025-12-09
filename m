Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04EAD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chihXVG1grslKlhqtyDeTTCAVhnswCdi/3J9t4kczWw=; b=vo9XYIEHuzPmbCb2KNesxneTRJ
	4C4kK6EE9nqJ/ZuO0+ZZ/zTw2ogMtNCVJ9+fBXrV49xqrMVPLF7+ivzJ4ctqhfOMDJHlxw+mC8njA
	s67oijZr6pFjBiWt7e4c6+6DML+tou5EmlhPuQJSdb/AiDwxcJ5x6h2adpVp+XDEHD9LwZwHTBaWX
	Umr1xyYFo5hbrMFW4X1/qGsMXfVKswBKPDQywgIJVEFczy4/55mHC4GegTP386cMT8PYED2YPl7or
	ox0zTrJmfRJgMyTnLUgWs+1oWJdBpuU0ydzrRBP/e7zaobWlrohPkxn+llWq1O9FzV+j26gkPD1ZC
	Kse9T46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzcb-0000000ES53-2Q9T;
	Tue, 09 Dec 2025 15:27:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzcZ-0000000ES4e-2WfN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 15:27:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9A4A43A63;
	Tue,  9 Dec 2025 15:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4E5C4CEF5;
	Tue,  9 Dec 2025 15:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765294042;
	bh=Qk5XDgE6MXmLTeeYkvpV1YDDQc5ljLwJoGzJoCWkSqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3X2WePYdApkKBFfJc6DqiuwwE40Y6BY9AFm/Pc/5cXIH/EOyBTtG9ToapPlS6KJP
	 mvZ+yS15dAB7uOvfhfwWA8ipT7r98zbsigloMq7Zxp+tAFruJeK0yLOY51rlk6GGWk
	 NTIbqaU9zA+bCv75XfzNG75tn/R0JpcWThSxI5LkmuS2kzAdjuxvWS3U1jBp6Hh/VK
	 SrIafMmhtAphWjy+nEVNlTMlKPaDky3oTp9adusestHZhkZj9ixReviHvARp3rxm5y
	 xdblATqFjnYFp46AiLkJZZDR8lToZVYvpAwM7M+XTbIBd50Bwh9Ujj74gEOubJJ/b9
	 2SGwBXvM1LYvw==
Date: Tue, 9 Dec 2025 09:27:20 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	m.szyprowski@samsung.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	arnaud.pouliquen@foss.st.com, geert+renesas@glider.be,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] remoteproc: imx_dsp_rproc: Fix multiple start/stop
 commands
Message-ID: <20251209152720.GA189083-robh@kernel.org>
References: <20251209140425.766742-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209140425.766742-1-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_072723_664791_12E841D7 
X-CRM114-Status: GOOD (  20.92  )
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

On Tue, Dec 09, 2025 at 04:04:25PM +0200, Daniel Baluta wrote:
> After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> functions for "memory-region"") following commands with
> imx-dsp-rproc started to fail:
>
> $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> $ echo start > /sys/class/remoteproc/remoteproc0/state
> $ echo stop > /sys/class/remoteproc/remoteproc0/state
> $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> -sh: echo: write error: Device or resource busy

So unlike Marek's case, the first time works. Can you confirm your 
region is fixed address?

> This happens because aforementioned commit replaced devm_ioremap_wc with
> devm_ioremap_resource_wc which will "reserve" the memory region with the
> first start and then will fail at the second start if the memory
> region is already reserved.
> 
> So prefer using devm_ioremap_wc as there is no easy way to undo
> devm_iormep_resource_wc manually.
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5130a35214c9..79d5c15319f3 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -709,10 +709,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		if (imx_dsp_rproc_sys_to_da(priv, res.start, resource_size(&res), &da))
>  			return -EINVAL;
>  
> -		cpu_addr = devm_ioremap_resource_wc(dev, &res);
> -		if (IS_ERR(cpu_addr)) {
> +		cpu_addr = devm_ioremap_wc(dev, res.start, resource_size(&res));

Best case this is reusing the same mapping and we just have unnecessary 
ioremap and iounmap calls and devm entries. Worst case, we get a new 
virtual mapping every time. IIRC, arm32 will reuse existing mapping, but 
arm64 does not. But that's 10+ years ago I looked into it.

Seems like devres is not the right lifetime. This should be just 
ioremap_wc() instead.

Rob

