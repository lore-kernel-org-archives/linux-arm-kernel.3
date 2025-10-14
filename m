Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8958ECCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 05:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgrxKYIuyb4cf8d6Kw/QEO1mOl+rpOs8+2xF6zyBwbI=; b=iQVeoN8yvmIzJuc2IP5pYFVZV3
	9CCve0aKg8WNL3lMc8PirpjR+4EDsOqgfOWp/dabZP/7zBHQa0yIDRdO87UZoQEyyTiUg03myOlaS
	KhEU7ILI6Gcug9Ko9xU2Nyt6xDlLbBBAH+aAjmD1wlgd+mPESj1rCLaJ/02ONyDD9PBG55UDt1Pku
	cCzuuHrKk8XY9FHeiaI4YjqQxWprYgux2lsQYkYN3Esdhyg31eGd3MlJqsMtRlImhHU1a81vtYCS0
	PfbOCQIxLlnNZDi69uwC28yIpzLEuO0EwisXMzweUBhrj6OJ4qt3+L0Iu7vefB2D4jC3ChGEK6acP
	O//tn0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Xzu-0000000FFUA-1fWw;
	Tue, 14 Oct 2025 05:54:58 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Xzp-0000000FFT5-2Owg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 05:54:57 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251014055448euoutp02d5e05952c7a135719524523a2cf85b31~uRdWhkFqv1439114391euoutp02t
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 05:54:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251014055448euoutp02d5e05952c7a135719524523a2cf85b31~uRdWhkFqv1439114391euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760421288;
	bh=KgrxKYIuyb4cf8d6Kw/QEO1mOl+rpOs8+2xF6zyBwbI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=AoNNOTWje9UdiRcES1n/LO/FyiHUuq1ECbVfCOGTMRHeZXTpTmmp/T7vb67c16J3t
	 16KE+6qpFaZmrohQBoB+huJWKp/mL8GyGTv4CTg41h0kifueBNE4xskov1w8se4bgv
	 zokyMswSZwnNg1dJsquVCFisW/OKNdh+y/K1vNxs=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251014055447eucas1p2c67687acd32add33c7bb253f94c46e0d~uRdWPkuq42592925929eucas1p2r;
	Tue, 14 Oct 2025 05:54:47 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251014055447eusmtip230ff3a2be12cab6c9753d94c32e4dd37~uRdVarDXi1545615456eusmtip2D;
	Tue, 14 Oct 2025 05:54:46 +0000 (GMT)
Message-ID: <f3fba346-6fdd-4b0e-9414-087a12772a6a@samsung.com>
Date: Tue, 14 Oct 2025 07:54:46 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/3] dma_mapping: Add auto cleanup support
To: Frank Li <Frank.Li@nxp.com>, Robin Murphy <robin.murphy@arm.com>, Dong
	Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>, Shawn
	Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251010-dmamap_cleanup-v1-0-ec5bc14e82c4@nxp.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251014055447eucas1p2c67687acd32add33c7bb253f94c46e0d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251010185046eucas1p26868b540b74a96e36943066216525bed
X-EPHeader: CA
X-CMS-RootMailID: 20251010185046eucas1p26868b540b74a96e36943066216525bed
References: <CGME20251010185046eucas1p26868b540b74a96e36943066216525bed@eucas1p2.samsung.com>
	<20251010-dmamap_cleanup-v1-0-ec5bc14e82c4@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_225455_016854_C263A197 
X-CRM114-Status: GOOD (  22.56  )
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

Hi

On 10.10.2025 20:50, Frank Li wrote:
> There are many below pattern
>
> 	fun()
> 	{
> 		...
> 		dma_map_single();
> 		if (dma_mapping_error)
> 			goto err1;
>
> 		dmaengine_prep_slave_single()
> 		if (...)
> 			goto err2
>
> 		dmaengine_submit()
> 		if (...)
> 			goto err3
>
> 		wait_for_completion_timeout()
> 		if (...)
> 			goto err4
>
> 	err4:
> 	err3:
> 	err2:
> 		dma_umap_single();
> 	err1:
> 	}
>
> Use cleanup can simple error handle like guard(), such as guard(mutex).
> or __free(kfree) = kmalloc.
>
> But dma_umap_single() need more argurements. So situation below complex.
>
> It need pack argurments list into structure.
>
> 	#define __DEFINE_GUARD_CLASS(_name, _return_type, _list_class_fields)   \
> 	typedef struct {                                                \
> 	       	 _return_type ret;                                       \
> 	        bool    okay;                                           \
> 	        struct  {                                               \
> 	                __REMOVE(_list_class_fields);                   \
> 	        } args;                                                 \
> 	} class_##_name##_t;
>
> So save all arugments to it.
>
> __DEFINE_GUARD_CLASS(dma_map_single, dma_addr_t, (struct device *dev; void *ptr; size_t size; enum dma_data_direction dir)
> will expand to
>
> 	struct {
> 		dma_addr_t ret;
> 		bool	okay;
> 		struct {
> 			struct device *dev;
> 			void *ptr;
> 			size_t size;
> 			enum dma_data_direction dir;
> 		}
> 	}
>
> So cleanup function can use saved argurement.
>
> The above fun will be
>
> 	fun()
> 	{
> 		CLASS(dma_map_single, dma)(dev, ...);
>
> 		...
> 		if (...)
> 			return err;
> 	}
>
> if funtion return, which need keep map,
>
> 	submit()
> 	{
> 		dma_map_single();
> 		...
> 		dmaengine_submit();
> 		if (...)
> 			goto err1
> 		return;
>
> 	goto err1:
> 		dma_umap_single();
> 	}
>
> Macro retain_and_empty() will clean varible to avoid unmap.
>
>          ({                                  \
>                  __auto_type __ptr = &(t); typeof(t) empty= {};   \
>                  __auto_type __val = *__ptr; \
>                  __ptr->okay = 0;        \
>                  __val.ret;              \
>          })
>
> So
>
> 	submit()
> 	{
>         		CLASS(dma_map_single, dma)(dev,...;
>
> 	        ...
> 	        dmaengine_submit();
> 		if (...)
> 			return err;
>
> 		//before return;
>
> 		retain_and_empty(dma)
> 	}
>
> This series just show how to hanndle many agurement at resource alloc/free
> functions. Only show dma_map_single. If the over all method is acceptable.
> I will more define for dma mapping functions.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

This looks fine from the DMA-mapping API perspective. I think we should 
also get some feedback from Peter, who authored most of the __cleanup() 
based infrastructure, so I've added him to the recipients list.


> ---
> Frank Li (3):
>        cleanup: Add DEFINE_GUARD_ARGS_CLASS macro for resource alloc/free functions with multiple arguments
>        dma-mapping: Add auto cleanup support dma_map_single()
>        i2c: lpi2c: Use auto cleanup for dma_map_single()
>
>   drivers/i2c/busses/i2c-imx-lpi2c.c | 13 ++++---
>   include/linux/cleanup.h            | 73 ++++++++++++++++++++++++++++++++++++++
>   include/linux/dma-mapping.h        |  8 +++++
>   3 files changed, 87 insertions(+), 7 deletions(-)
> ---
> base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
> change-id: 20251008-dmamap_cleanup-d0a7f0525a3d
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


