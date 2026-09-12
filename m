Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0290DC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 06:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EB250JlF6h4Nml+6sYEobeY/gwdRlUb4QTBCsN0GJs=; b=HKzYyrrdHhvV4a3wMrlCKFSlQt
	I8IUTi8pgrUhNSqFeln4rF83TPGJMnm48nZxh9K2MSfTZa9K9TZaoe/djn5BT134D1zwr1r9cZvSe
	nR/mgA97sqUuvLf5JQet3NnBs9ntUwfQQwRV3xF07pphgMpE/o3NSOBIzyR6SiZqccsE22aa+VhGc
	CPVBG0tLPzzD+gJcMoz3rVn7KC46VuEfUR2cT4cifTaQ5JU9eNFx8VOYdEr5GvAK9XzB/8S3NkBC0
	sCVQlAEkSU/3e0bInqG7n3njLixujKWqMBu/xBNL0qYR8x/sDlTq82oOUOUO83lH/Zt869QJ3fEUk
	zPuZDUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hds-00000000cwE-0GyM;
	Sat, 12 Sep 2026 06:55:16 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hdp-00000000cvt-35D4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 06:55:15 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso2612235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 23:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196112; x=1789800912; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8EB250JlF6h4Nml+6sYEobeY/gwdRlUb4QTBCsN0GJs=;
        b=k7gImHYSiDiN9GY25r4sid0A9QVu4aBFSQUmLOtBDFhjsUT19fAl+YmGew6123VE+L
         vYViZayniwp7OFfj5qAEWKiC7mcu6FEbeXQg8PkgY54yxBdwGGwKkq8RCQ1GGsGWGwsT
         HNBZkrKkc4dSLPucUyfa4l27qu5U009vwYOi7vh/pPMqLvgn/Fu1W80xcONcbNzT0R3h
         xtYyV3wpg5zgFk/vnO51OUtWn7pnO9Fb3TLaWZdq+MrcysuO8P5MxfTizYAOprim15lv
         nhDx/EbH0fisUYMWDTG9uKp0xXjQ7LjgD5u5Z1NMgRA2Y9gHkHMk6qdymQKITRXiYqQH
         ZbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196112; x=1789800912;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EB250JlF6h4Nml+6sYEobeY/gwdRlUb4QTBCsN0GJs=;
        b=FfPcmmzGU01G5EidwvMzzlN7vDtFeIGPJAfX5FHvXm1TEpSOWRAJZNccQi4syXdLCO
         BCjWjCOUXM4o77qsn7BeUclGlA4+taXh57ncc1UXBd+xPM0gXnErIG7TrU9rNBoWI50b
         UY/z8hYcLB4GfYRbZU9RdVUI6l+UAOd3sItmQoGaDuIVSamvbvm374A8anXyRVfd0uls
         VjZKmVGP8b79tdaQHDLBywsBZlt2Wn8gfa7oOuEnkBfhk/dYjOgO1IhhRYkd5hhWyVef
         +lqwrvcfHeszIlVc0qxpnlajD357YN9KTOmXuKpHd3D8SHk/3o7+gAPRlws7L/p8P6Hk
         iwXg==
X-Forwarded-Encrypted: i=1; AKwUvBz3Cib2H+oTU4W1V/4tNEVjeq7c+OE0l83nQdnHtrsvC5rcUEu//BTNBYFtNN3APVUnDMT6QLo6Ab7TdIC8XE9C@lists.infradead.org
X-Gm-Message-State: AFuF++lbjRoD3/kiGh+IdxxofBYJo3N5bo4MuLtuR56HbYRi1t5NJfPb
	G5799+hauo0KUN8/djbduzBSWOSSMLtukr1olSDqhfs+T4/o98EHP2IA1xITrAbk
X-Gm-Gg: AYBFou1ZrZRoxB6UaB9kHKvWUOSVa+0gQYDyOx9lXM02mNINr/7b82KVAX2UWwEqAWd
	bxw+RBKd3grzwKZUq5BecEZmemPjVo4dt16wW9kQf3DKbMNdVLjEZfl3hhJ9DN+kvzo3osppeI1
	enraOFpiaGGV83ziCCfacosjWWsjx44dfF3qxbL+4yM4cQ3c6wy8S3EtH0EjW6O/8cqRvPM+8GI
	QpzSWpxdFV2n+KKAMhFXCi5vqFl8pNDooVjyoL7aFjY8fjA+SMmbD7bc9irP88XasLwh0ajULTE
	OGW+7vRz1f3gSVfZ7LBa/Fyb7B+tfbnoaMvAtEREUSU/Gd8c8ryRFb7mlRCU9u9DHtBfCKs1u44
	nOShRthEzUEyndOF0TfMHwkEeTxEUjnz29nztxcRtDUe4y0VpQ3gx2Fy7ENCF7135nOzoJ3Rgx5
	uu7qehejDMPqSGIyGq21mRiIe0WjMV64tk558VO58/kHiaQHYkQ0QfcObSZJHsI7izueBpjLyGR
	MrIqeo4IGGh/VfucQWw3tDN0z0NCY86xvOPTt9W5/f1jwct2fryhJK238OuaEixa9soS6i6MZNK
	hA1SrDtlQ9s8nXDbzYtMPJibLpy6p5qJU6zo6Q11nMpSuUAOJ9hfOXEOra2V1VikNON8fTWyWNm
	+vBmQCx75xJA=
X-Received: by 2002:a05:600c:3492:b0:49c:fa21:1c8c with SMTP id 5b1f17b1804b1-49e6cc233aemr12337045e9.33.1789196111526;
        Fri, 11 Sep 2026 23:55:11 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm145786115e9.2.2026.09.11.23.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:55:11 -0700 (PDT)
Date: Sat, 12 Sep 2026 08:55:08 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dma-mapping: flush FROM_DEVICE buffers on
 legacy backends
Message-ID: <aqT2kBGIQJLWEqkf@gmail.com>
References: <20260910063620.17768-1-kmehltretter@gmail.com>
 <20260910063620.17768-3-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910063620.17768-3-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_235513_783142_1891A867 
X-CRM114-Status: GOOD (  10.68  )
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

On Thu, Sep 10, 2026 at 08:36:20AM +0100, Karl Mehltretter wrote:
> The legacy write-back cache backends invalidate DMA_FROM_DEVICE buffers
> when ownership passes to the device. A plain invalidate can discard dirty
> CPU cache lines. If the device writes only part of the buffer, untouched
> bytes can expose memory contents older than those present at the handoff.

Sashiko flagged unused *_dma_inv_range helpers in its dashboard review
of this patch [1].

I can remove the unused invalidate helpers in a separate cleanup patch in
v2.

[1] https://sashiko.dev/#/patchset/20260910063620.17768-1-kmehltretter@gmail.com

Thanks,
Karl

