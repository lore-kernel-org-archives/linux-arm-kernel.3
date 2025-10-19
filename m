Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34894CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 12:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbbqPCF8EZxspjJ0J8Cg+Ds28tVe/+l3WYsN8n3gDhI=; b=i9XQAAQUdhsbaU0FlciwmGV17d
	AUr6CGmY2U1mdVaJzoALsXxa33o3nB0cVdG0DkdL/z4T/afimZR928XfiXBHDlQ4/AE6Hle9iJ6Hk
	QvlGIDwk2sMTbdw2gMKC3InnIWCuV/0LbFKphV7qFhYaZklIlgbifbWOq36kHwdav0kH2uQ5Glt2c
	BTUIWgWxorzHUlvFHSe0xTWAIM+lKeMEQUPVNXN5kDqfNl//dexkdTjhTV1x/pmjKUYGyTk7NSwRc
	Y4o7BtdzhdmojdqDCp4IkZ1H9PWIV7DqEC4Xd9kqaEfA8OfzWl5a+f9YcWMiOkyrFYG4QK0MTuSWc
	7m0hQwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAS8C-0000000Az5z-0YJA;
	Sun, 19 Oct 2025 12:03:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAS89-0000000Az5X-0wcc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 12:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00A1943DA7;
	Sun, 19 Oct 2025 12:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E1AC4CEE7;
	Sun, 19 Oct 2025 12:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760875388;
	bh=UTBipG2N3uJpJm9CwyryseA7CzD9lAULhEu0lVKREpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ut2gTsCQ3+iJZn+/fMcxG+QwcudI+T/+SdV/g9L04YE8J/aT7g+tik43KBI/aM4Ce
	 OvkxaPFQpzusHz4sIecRNxkZDfZg4sDtS6z4vcPw7fSAM64VCdvwAOgWZaNDQkGMMp
	 W5MmUKVBh/KxiFr3mzAQYr5QwMSRafuvc8C6hBRxq54MIlNFE8OX/MupL6x21OpDRI
	 qqDSUkFvwLW5lJY/Elco/mfI4mioXCc+D/2yiB0gMYHUNZVS+cH0fEAZ5pjrAKRmDB
	 qO7k0vZi/Iqcwt57o6IBBGhj/BuzM1OWgK+GE0iZOVvQg4kEOm4PThfEW6Laj1UCBJ
	 X12WFpyJyDE/A==
Date: Sun, 19 Oct 2025 15:03:04 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Frank Li <Frank.Li@nxp.com>, Robin Murphy <robin.murphy@arm.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] dma_mapping: Add auto cleanup support
Message-ID: <20251019120304.GG6199@unreal>
References: <CGME20251010185046eucas1p26868b540b74a96e36943066216525bed@eucas1p2.samsung.com>
 <20251010-dmamap_cleanup-v1-0-ec5bc14e82c4@nxp.com>
 <f3fba346-6fdd-4b0e-9414-087a12772a6a@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3fba346-6fdd-4b0e-9414-087a12772a6a@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_050321_324285_634448D1 
X-CRM114-Status: GOOD (  28.44  )
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

On Tue, Oct 14, 2025 at 07:54:46AM +0200, Marek Szyprowski wrote:
> Hi
> 
> On 10.10.2025 20:50, Frank Li wrote:
> > There are many below pattern
> >
> > 	fun()
> > 	{
> > 		...
> > 		dma_map_single();
> > 		if (dma_mapping_error)
> > 			goto err1;
> >
> > 		dmaengine_prep_slave_single()
> > 		if (...)
> > 			goto err2
> >
> > 		dmaengine_submit()
> > 		if (...)
> > 			goto err3
> >
> > 		wait_for_completion_timeout()
> > 		if (...)
> > 			goto err4
> >
> > 	err4:
> > 	err3:
> > 	err2:
> > 		dma_umap_single();
> > 	err1:
> > 	}
> >
> > Use cleanup can simple error handle like guard(), such as guard(mutex).
> > or __free(kfree) = kmalloc.
> >
> > But dma_umap_single() need more argurements. So situation below complex.
> >
> > It need pack argurments list into structure.
> >
> > 	#define __DEFINE_GUARD_CLASS(_name, _return_type, _list_class_fields)   \
> > 	typedef struct {                                                \
> > 	       	 _return_type ret;                                       \
> > 	        bool    okay;                                           \
> > 	        struct  {                                               \
> > 	                __REMOVE(_list_class_fields);                   \
> > 	        } args;                                                 \
> > 	} class_##_name##_t;
> >
> > So save all arugments to it.
> >
> > __DEFINE_GUARD_CLASS(dma_map_single, dma_addr_t, (struct device *dev; void *ptr; size_t size; enum dma_data_direction dir)
> > will expand to
> >
> > 	struct {
> > 		dma_addr_t ret;
> > 		bool	okay;
> > 		struct {
> > 			struct device *dev;
> > 			void *ptr;
> > 			size_t size;
> > 			enum dma_data_direction dir;
> > 		}
> > 	}
> >
> > So cleanup function can use saved argurement.
> >
> > The above fun will be
> >
> > 	fun()
> > 	{
> > 		CLASS(dma_map_single, dma)(dev, ...);
> >
> > 		...
> > 		if (...)
> > 			return err;
> > 	}
> >
> > if funtion return, which need keep map,
> >
> > 	submit()
> > 	{
> > 		dma_map_single();
> > 		...
> > 		dmaengine_submit();
> > 		if (...)
> > 			goto err1
> > 		return;
> >
> > 	goto err1:
> > 		dma_umap_single();
> > 	}
> >
> > Macro retain_and_empty() will clean varible to avoid unmap.
> >
> >          ({                                  \
> >                  __auto_type __ptr = &(t); typeof(t) empty= {};   \
> >                  __auto_type __val = *__ptr; \
> >                  __ptr->okay = 0;        \
> >                  __val.ret;              \
> >          })
> >
> > So
> >
> > 	submit()
> > 	{
> >         		CLASS(dma_map_single, dma)(dev,...;
> >
> > 	        ...
> > 	        dmaengine_submit();
> > 		if (...)
> > 			return err;
> >
> > 		//before return;
> >
> > 		retain_and_empty(dma)
> > 	}
> >
> > This series just show how to hanndle many agurement at resource alloc/free
> > functions. Only show dma_map_single. If the over all method is acceptable.
> > I will more define for dma mapping functions.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> This looks fine from the DMA-mapping API perspective. I think we should 
> also get some feedback from Peter, who authored most of the __cleanup() 
> based infrastructure, so I've added him to the recipients list.

I may represent minority here, but patch "i2c: lpi2c: Use auto cleanup
for dma_map_single()" looks completely unreadable after this change.

It is perfectly valid to use __cleanup() for simple and scoped things
like kmalloc, but DMA API is much complicated than that.

Thanks

> 
> 
> > ---
> > Frank Li (3):
> >        cleanup: Add DEFINE_GUARD_ARGS_CLASS macro for resource alloc/free functions with multiple arguments
> >        dma-mapping: Add auto cleanup support dma_map_single()
> >        i2c: lpi2c: Use auto cleanup for dma_map_single()
> >
> >   drivers/i2c/busses/i2c-imx-lpi2c.c | 13 ++++---
> >   include/linux/cleanup.h            | 73 ++++++++++++++++++++++++++++++++++++++
> >   include/linux/dma-mapping.h        |  8 +++++
> >   3 files changed, 87 insertions(+), 7 deletions(-)
> > ---
> > base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
> > change-id: 20251008-dmamap_cleanup-d0a7f0525a3d
> >
> > Best regards,
> > --
> > Frank Li <Frank.Li@nxp.com>
> >
> >
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
> 

