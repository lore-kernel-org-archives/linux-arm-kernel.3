Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F35BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTFqZaE5WeXzEFHRWSBbenebslM+9RuyFvHTxQmSgMQ=; b=LocD6barakuppOn+xKe/Pz8NXL
	IZsyGegP2Zda6do4W6fAPQ5LTVPKUtSxnA9mwyTUT38UjMHmJA5xblcligjrGctIa0fmU7YPyc79i
	EKt0QELBC+9uYwLuY+JA1XXOjF3yvOAg7lxSxnvFmPoF9Ri1k0+dMUNn9p9IlhBBJkdA1mP2+rgVB
	RdfYIVqDe49aZ0hyN3OHhPSkbX6cX82+0g8nSL93b2jpNPWjRKVeBAaePuyiiJzc3oeLRk7fYB07R
	pl8Ky54KghF9v8UmHHpSewBG9p+UjyLJ0cKs27dZxsWd3eqSVpNflTXJBnn91QjEolb4uRu3iG6Xi
	A4g3WLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Hz-0000000H1We-2kjq;
	Thu, 03 Sep 2026 10:03:23 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Hw-0000000H1Vs-3Hmr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:03:21 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a623987d32so3553177a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788429799; x=1789034599; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTFqZaE5WeXzEFHRWSBbenebslM+9RuyFvHTxQmSgMQ=;
        b=H8mR0vPtIjVwWHbFvMenZnH3mlV45j+SNg23Qlfy723GfAIng9+sgU3so6TPttKy34
         OwWR+V4u8iCaAoZ+mJfwpraXVc8RCvlqpm6u3dzKmEVVbgf2MZ2mU/ptZC8O65PyQWo9
         iFbCGp+YotF3Z8mYLECyl5fPEEtYMSw79v9/UhKnx+Pi7UMfAi4W2265sfVkVzomn2Wv
         U97qyf97Z+g33XmO/Whq6uD2mkaVuw/bLtzCdYc3UZigGQq0oARduvQekZ1LWqtbYLm0
         KW8Qql4shRrL9+kCsgnjfu5YoN0kDOHL1LtIwTIfTmPngebrMa1o6/6MCS4FV/CYZD7V
         9LLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429799; x=1789034599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTFqZaE5WeXzEFHRWSBbenebslM+9RuyFvHTxQmSgMQ=;
        b=PU1tBiMlpFk2qfqppoc+v457aoF5vdpALdrb2oMGEAgcngxY+bKsj6FXySUrY1whNd
         w3hcuFngwsJwhZs1nS8C7CcAwhBpqLO0fq8y8NY7X1DCqwx8NvOaXT4ztki/NT11pH+T
         OcbY82v6lAPkHWEBfDbu9fyNxpWGEPMQbjJ0gtlo2JEUsjwJ4hHPn1A6AOWhZ+ehKWSw
         6K8fibO9eWnVHe/nHMPQsXblX2XI4kJ3zr7VqkniVTQvfINUG7Pmg1ase1zCVvliyGro
         d44VZ5dSJ7lWVxNGbI6wwvUVqxaTCtdR90A63pRBjUKX9VPdXvZ2PWhQYWrOmG9PLibf
         Cnkg==
X-Forwarded-Encrypted: i=1; AKwUvBz7bi1kE83u2vKztdy5q9+ENi/xAvE/GXC0VDxCvSq776OQy7ZC4rN8VvMign/pUYu1gkiwVUcndtSwubfKHv4u@lists.infradead.org
X-Gm-Message-State: AFuF++n3K+liN2bgoDMb+yvaUuVeCuXFF5zHaRXq52c3Ga0ri6HuPSwh
	LIXpcdY2b1bf35Ty6LJ5JS0wqgCJIvc4ehHS0W+OHafnANYZu7Kf9AR7Acbgy7a33IT0ujUxQ4U
	YbAs27w==
X-Gm-Gg: AYBFou0EoIeH/mokqNHrriwcGAcdKy/CXVxs0aS+1apNlAqQhqQADi6fERU54rzBZnl
	+m5m+d5+zVgk67XPSEQWO087TGFBV+s1YsgffkfVw0sEoPhPJhBEmgqRMuRfFvXXCbxDW6QVnup
	UamDe67KCsxJ5bI/nvS7/c9eHysAlCkSrC+dZVYm8NwOavxbW/u1z/+SrT/ot1+4LTsT+C77Tvu
	KSHmAvphWxuJaq4z/Uyve4FrDrOPH7O6fw4wJOISsA6w1htzi1esPqgguZ/zPSYXTinCGpgxZcO
	Dxg/1IAaj6vnqDI3e72XyeAETry/lTBig1akinn+DWEZkXAyL3oA6Xo3fhsShSC64lSwunZt7R5
	TyeX6liRVGtSb+TWrZL//ejw/kBIywpqccjyaHhDCoKbdTOZEacyITrNFZFw3r6y1D9nvmnksXM
	gzStDvWSW04ckbUrvnzuFmKzBek1mFgrQ+NCRYEeLFbWdg0Mja/yV53oGrmpUAr7SE0+0Ofo/Lz
	MNegNU9kXFWZ/XLSQ==
X-Received: by 2002:a05:6402:1ed1:b0:6a5:f4f4:5c0e with SMTP id 4fb4d7f45d1cf-6a6829afd97mr6824116a12.14.1788429798174;
        Thu, 03 Sep 2026 03:03:18 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8b47f7sm2104420a12.9.2026.09.03.03.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:03:16 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:03:12 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Rob Herring <robh@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
Message-ID: <aplF4NaoFk73d-c5@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-3-vdonnefort@google.com>
 <20260902172436.GB1440252-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902172436.GB1440252-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_030320_858459_2D655927 
X-CRM114-Status: GOOD (  16.52  )
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

On Wed, Sep 02, 2026 at 12:24:36PM -0500, Rob Herring wrote:
> On Wed, Sep 02, 2026 at 11:47:04AM +0100, Vincent Donnefort wrote:
> > Keeping last-level mappings is interesting on some architectures as it
> > allows mapping/unmapping pages from the kernel direct map without the
> > risk of splitting blocks which, under the break-before-make rule, may
> > trigger page-faults the kernel can't handle.
> > 
> > Add an "ll-map" property for reserved-memory regions. When set, it
> > splits the underlying memblock and sets the MEMBLOCK_LLMAP flag.
> 
> Where is this documented? Any DT property must have a schema.

Ack.

> 
> Though I'm not thrilled about more flag properties. Handling all the 
> combinations of properties has proven to be painful. Can this be implied 
> from the compatible string instead?
> 
> Rob

We need this before the kernel direct map has been created (paging_init()).

I would have moved that directly into the driver lend_pool.c, but then it is
probed too late (unflatten_device_tree()).

-- 
Vincent

