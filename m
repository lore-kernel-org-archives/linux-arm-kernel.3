Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F08C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZHhNZflcpTf7gpMtfLnrd+b6TKn7wbbrgvwwdWjf0M=; b=iqt12c2Vix094ZuGfbgawxfo4w
	2BkTy7OBBkLPmHKz68ngtYOboRplKrloK+nNIO8jhEdrRppU3Ot3KHwKdtVT9BABUUiNePxVHYsuZ
	KRNYxIBz8fXYWtO5ItEpXx7H/k0JL434WE4LLZEEvhHsB0Lde/b0cM52MoLiSAI0e+JLMferROLaB
	Sucnqt5fhuI1p29dD0l/Qlus3F5qx/hTDQn4xG0BxzsqfxPHhrOTUaqyMAAvs0jKq5ZFqi1HfuH+z
	iuHVUGF+1oQRO9POm6LGUYBCQqIDhMRkCjraSGFwl+8E7MVCiwxkpBu+MjNZ6t05yBhD6aCyBLige
	1XODHKlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bpy-0000000F5sp-0Nhd;
	Fri, 18 Sep 2026 16:53:22 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bpu-0000000F5rC-0qz4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:53:20 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-93a135ffb08so129365285a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789750397; x=1790355197; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZHhNZflcpTf7gpMtfLnrd+b6TKn7wbbrgvwwdWjf0M=;
        b=TNDYzmTvQbzR8wVj6TxiSFwvFYujWuxaJIs3awvpItzVucpICm9RDCzAyOzB4grka4
         pvoSJUQuJTtxeBIrqMmuPixrFJ2v03dkXBFOQa7adeCO6bA3xfYNMF9IRJHdT2r0ojEL
         +DlnI1zq47YWtjffl93/j9yRbB4s1vLfMSmSFZskrqKgML8w7JgfFCwVovT3aCR4Hkh9
         vLEpxvVLncNTmZ5RvEp0VxM3Fl0Gswo3FMV/YK/+rpb62Z2IZOwMfxy7QT2mKmG3gFo6
         FxhVvkPu+54QvQiHNQBq0tKJGEYuQ/vAEDAe+dA6A6WWzkhD+KEYL0jQW7C+xfy9O0SV
         OtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750397; x=1790355197;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xZHhNZflcpTf7gpMtfLnrd+b6TKn7wbbrgvwwdWjf0M=;
        b=oqtC/yhYSc6YjnaQ+rNcYyC9IzdxUdj5NWbYOd7pbczw4sAfurW/ojKPyJU1e71mwX
         NLEw16X+6x7m7GXr6QkUWqVEGYnd9NN2YVYU1EeXQz2x7UsrRc56N+w0ooTXIRDTwt9E
         PmVWEvyCuz3JZOl/IUqKrmnyrV/0nHpxRfWXwwKNZkn4KhgxtCpvwjAaQn8s5mcAx2Gt
         NiCFnlWKhAqTArJ4dKWq0gwPeizi2pR6/JkmYD7ppKY4Ffs8ljh5utIlSwPJ7816A9FR
         goeAavVBpjo8NXdQ1eX2rhlgZapaZdgBhCDMbK7c4I8Jxs2L67Dh2WiOvZsUe2md3i6O
         lRlg==
X-Forwarded-Encrypted: i=1; AKwUvBy14xRtPLFNuABNjgGD+m704I8JJvPKUT1eEFIqOvgLmjqQK3GXSKavsfEcVIXC91xPBXzZo4QRHff3MqCcN2OE@lists.infradead.org
X-Gm-Message-State: AFuF++lQw1RQ0C/ET1ctnC2q0uPLZYmUc9pKD2cDCPRYM/ZZBjVYal1h
	yLQRs3Y/VpPP4DWlIXdAUAnnk2kZ1djAwMSiNFQlE5NIeSH6ClWeUyMfHvSLCB5EGNc=
X-Gm-Gg: AYBFou3nlN+wgY8H/hxyMGoMx+88YYbL4CKPcyRtX/vej3YAJykTYvEsCt085/Iso3d
	VOxjkaDe8UQBdiJr+zD6zWeM9pfj5fCCLQ6+GlOssQgBI2oP+5fuycFYodvQ0Lt/7Wb814jVgrx
	9rybivfTk86FNiymPqwrVydewbYusdUDqFlwbOfofF9di4BF9LC6tXHiN8ucSiPx3s7Wt6c8XYm
	cMeQ5YLet4zL2yWxrvF3+i1Re+2qPc3L8xFax9Mtsr+CshGCor93HAc3FgOPY+ti2MQCKCodXKY
	lGg2za4kqW36FI1ISmKaA3Ukm+NWGXxf/ML2ZtfAX46yJPeTGIwmEMGeRWVc4NHshmvO8++SUrJ
	asGJzXGQSTqS796YtPtYCgwCiWmp4EgT5/c8aYpLnzLAzSRPN1ONeTKC6nfBPYdt1ERNkY0dUVU
	JZn3NPuX7YXTU0CrjluLNOFUBPo5TBATPR03BJZNSXtYsRKm18LAw/j5AkzMiEWu8NTPvfN1+P0
	15eWT+Gjnh4N9tbHx8AOWWpD8ox1y3XQd8xfaFFXCZqqoQ04kT80GMB
X-Received: by 2002:a05:620a:1a17:b0:939:ee44:36bf with SMTP id af79cd13be357-93bdc72000dmr495588285a.29.1789750396680;
        Fri, 18 Sep 2026 09:53:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a60f21sm68476d6.19.2026.09.18.09.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:53:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7bpr-00000001yyx-21Yo;
	Fri, 18 Sep 2026 13:53:15 -0300
Date: Fri, 18 Sep 2026 13:53:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260918165315.GF11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095318_383118_2F9C4D4D 
X-CRM114-Status: GOOD (  11.48  )
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

On Fri, Sep 18, 2026 at 05:39:55PM +0200, Christian König wrote:

> > Arch code can figure out how to do it. If some ARM configs only give
> > order 4 folios or whatever then dmabuf heap doesn't care.
> 
> The fundamental problem is that DMA allocations are highly
> architecture and device specific while Linux memory allocation APIs
> are generic.

This isn't a dma allocation, this is a memory allocation.

We made things so the CC shared folios are DMA mappable through the
DMA API. From the heap perspective the only difference is passing an
additional DMA_ATTR_CC_SHARED when DMA mapping the folio.

Jason

