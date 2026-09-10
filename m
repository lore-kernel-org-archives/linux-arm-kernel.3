Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFC2C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hvvqi1F7OSg7axX83WRLceC1+q3SHWfcWgXiSTOssgU=; b=2h6RQYxFoukb1Sm6YYr2V5S300
	1Ox5+BTScCKFwHmV/p0qQDHZxUePkAG4fa3Baf4UahEFdEthZff8sKbbJJUo/hZKerMc/GBmdDi4K
	ojPbgeAh3kg24kQ0e4XAY/gqWOW1OHS2CkLVB3V/L+257b2nAYh1fZkP4VHTrdiv9+m+F40vxeT8a
	SkERJBbswHf9U9ytKY+GhQlfbiqyE4qbvSndR/QW/ec1JD6/p2wmTACglmSQB17QMPVLYnMdqcLO1
	5PakQv/E95/mDq6Zb+qrVkuntcISh1AAqukFbLRG2Sbkt07bNXK+KQ6v+6Q3MrBGBO8h6ZzrnizVa
	cxevj7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yan-0000000DZES-1l4c;
	Thu, 10 Sep 2026 06:49:05 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yal-0000000DZE6-2feH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:49:04 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874aso857050f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022942; x=1789627742; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hvvqi1F7OSg7axX83WRLceC1+q3SHWfcWgXiSTOssgU=;
        b=evHfb9t4y0zLorJSFG3cZsxfXKNEcr4AhWhNKebCAz8sI8leiq11qVpZ14Qk2glyQr
         ASg8bP/9S738+V0aXWmYc/LxY7ye8NLAQqduXEVtW+1m0O9+2xSqQaHBXbpQwT0JKPbR
         2NpaXcLg8X74zLoyQ8pL37SZ8Xuz0T4JSp5SbQpeW2aP7L0TD+IRrr3OYOMJJpkiGSzd
         fCR/MrkUMMldAL9tFwp0wa7aQ2nj/E/9VBB5Qwz5xWValn04BoIiyejkpL9ViayPDDg7
         CJgjBx2BwjBKk2+Yve16u59s9ROEmATmUWFefL2ReZ34OFERR30KBdtMdrtZbtW+Ufmu
         fJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022942; x=1789627742;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvvqi1F7OSg7axX83WRLceC1+q3SHWfcWgXiSTOssgU=;
        b=OCWWXae/pKu5g8deQ1YYXZoJmDNhIfGRQP9UH2ewUUaLCyNq3+Xzx9pzJK7gYPjmXB
         xspDYDkXKxBz5/Smu/tqc5eJiBg8tGyN51QboWYiJPxxYhC9eP+lSkGBjPgdjkoguwVj
         LlTm8TtWkOTo005IEGZs4kf3HyOZBRcGrAaWpbTnKeiOfPY8kbVhYvS+SX0D5B1/ldh7
         NJAA6rClGZXTq4zl0byGDd+5p9OH3KHHOzjWzVBLG/fD+r4gU6MdTuUiA75jy0kNRyxZ
         9t44bUW+1/7znxucgqXWq49vVkENtW73C4uBE12bNbBZfEfCpPXhKCJRee/WI6RyyoCt
         Xh7g==
X-Forwarded-Encrypted: i=1; AKwUvBzPmrXEXiyBAneJaFsnq6baD34iVaVPVFdwKY7fuGrQdNYVyVQ/IkgNDyAzHVxp3XzZ62JAc+wHBkfxs4tiL1ee@lists.infradead.org
X-Gm-Message-State: AFuF++l29ziczsw77vketyAnoKc88lX/cug6eTvOCPNWgYDuDMCVIOpn
	GIP49NurTVfihIBzfJI3J3Q+/rXaEfH+fz9nBEF/qV/nn33RDPSWKwg+
X-Gm-Gg: AYBFou0SYeNrhfq1fP+GhOg2YaYQqwwT7MLZg6n9UVNVgMacKF8bZS3LGEpu6YcIpGQ
	I3yN14rmQYufmRaUpw0BkzBIv0eromCSnaJrG4ajO+Sp30sVNYVQ1fEdq8h1mooS0XgaXZtP3OT
	bVUQdXgQhP8IhcJ9r+gDWzsE05dmpaJ+a+lgw144JVCdyORd+z7omiPoR3YvI7ye2800gwL2wgl
	5LqMll2/EbswnPkDukRrsvOEFV9JSUT/P3zazSq4zzZ4egQYnbAf25irqlSZRtcF/FalUO0GRwM
	sZeXuumsvWKQI0dhVsGRaY86FZipNLwA6oDp9S2L+rTGsH1ViYURFkBzSBXmBJ1wi//1U9VT9j+
	iU1nCdeaoJCBoJ/3dwd2/F8ud2L5GkrFCcGxrxgzsV0U+ed1COhEAjY9GoS4ifY7cAE0MfLHn6+
	Ydzxk8RP866Cddty94U3LDJc/1UW07wq3nrCXVC3BNRTIfwfS4hMIltbDxd71CI1DkHYFx5DCbR
	y2DHORxg9gxrDekWkx5/rj3hTWYzu8KF4tb8jDTpdLnksP346Gs6JcCdtph+KELiIV8sPDofsZD
	T4Vs+AdP4b1BekdybyWNx/+wMSGfubbzQVNz9uhtnMbaBdGlw/HaU1yhh5TJTkVFk4FRoPpBMzc
	aAA==
X-Received: by 2002:a05:6000:4555:b0:486:e5f7:89c5 with SMTP id ffacd0b85a97d-486e5f78d16mr666488f8f.1.1789022941516;
        Wed, 09 Sep 2026 23:49:01 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm37240838f8f.37.2026.09.09.23.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:49:01 -0700 (PDT)
Date: Thu, 10 Sep 2026 08:48:58 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: preserve DMA_FROM_DEVICE buffer contents
Message-ID: <aqJR7M11iFmK4_pi@gmail.com>
References: <20260910063620.17768-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910063620.17768-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_234903_684639_42F4E633 
X-CRM114-Status: GOOD (  10.65  )
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

On Thu, Sep 10, 2026 at 08:36:18AM +0100, Karl Mehltretter wrote:
> This series prevents a DMA_FROM_DEVICE map from discarding CPU-written
> buffer contents on non-coherent 32-bit ARM. It is based on
> v7.3-rc1-324-g986c24e0fe44.

> Karl Mehltretter (2):
>   ARM: dma-mapping: preserve DMA_FROM_DEVICE buffer contents
>   ARM: dma-mapping: flush FROM_DEVICE buffers on legacy backends
> 

Adding Linus at his current email address.

Sorry for the noise.

Karl

