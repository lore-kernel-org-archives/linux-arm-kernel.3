Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06F5CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwzE4WvS1tturD3icBf4rnhXP8uxns5EKACf2ikgZYY=; b=nQBklBPlhxvuChebKCYtFrEBRk
	W27BgnPIrE8LpRi3Hrv7FgvOf/gjgB9umDxChCW4DXpWeIa2yNmGPHG7yJoCkbrDkZKf8PZiHcVur
	TQFR6sn94vOUFa87ATKFjeMOk3TeKZX7eLfdekwa8nkHAEYTv6JdHxhgSa6wSjeuwrMRCM6e9uBSf
	jdmgIoT6tG751V3YFMA5UEr2HoTmgLZAAdVgd2PNcfqIxChC2HODzr8N8vFDDCpZsY6ThCKCZjMPq
	NHnD2VVoCZoTnAr5lukS11pSJp0X3HqIwi0/4todK+29TCHVkPU8uT03BQMFKCA9+DZtWttFzG84E
	Na9uixtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtRN-0000000EpWm-3Gtr;
	Mon, 18 May 2026 08:35:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtRM-0000000EpWR-0Onm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 08:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KwzE4WvS1tturD3icBf4rnhXP8uxns5EKACf2ikgZYY=; b=o5eKkHSbpP1XbegE7UaZi2w3mQ
	RHp891ebWVijbJcwrT5Oxo55LSUF9u8IcJ3keO/id4OwFZeDG9jmjXZCoADdkHYP902AsYZtLwhXK
	TZxYY/jgZds7HgEmoNiPBdmBpiFfvvcxuVKECJXhBGMaIVf5xI4tx/S4+aleOarVGtcD4VEg/8oye
	xwM9VsGNndaXdznr//dFQO+d11COUZbjHVnh3adim+xRAbA13POBDGor5KIli+SbaeVi9/iWmp3u0
	ZIlmIfmQiYMzy1KDeFwDsbsqjHLYFeoVJS9Sqf0rnp0JglBx+A7Xfu0b3B2T1D1I3g+EHSieKbzDM
	u4I7BboA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtRI-0000000AP1Y-1Zfr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:35:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43d7e23defbso991010f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 01:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1779093302; x=1779698102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KwzE4WvS1tturD3icBf4rnhXP8uxns5EKACf2ikgZYY=;
        b=lpjnr9bILVciDZkZBCM2SgfiJwKdPEb7wmTVtml69FId00Ploybc43/7x3qysYtsv9
         rjWvpScICFS07pNN2Jug9fztmGOGpDJn9DOjl5HyuW8xtviEih2ib8XLDKdvtSVg59rP
         ZNaTgU3eGR183yYH3Nn3IJraEw5Vtq+UhAM+iaYs13B9XSZj+/Y4mh/Frzjw41K/ecZ/
         wt1JauJGFA1R8LQHDqH+gk4oan0nr6yRrzoP5bdSDpWRoV3mUsqAtTcR3WC88EI6Xcko
         zJ6nAnNUXY11ySe8b+p8KQX6YkBl0a6UFNbGmFt21ogkDrvZvubA2b7MPrYlRonHtUJL
         tiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093302; x=1779698102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwzE4WvS1tturD3icBf4rnhXP8uxns5EKACf2ikgZYY=;
        b=IQ7s4NXZgVMAAh+WosFWv8PyUxOouhVKYx4W7C4dpbjFLreTVL6SO/UpS42MlcHi0n
         CNXhd65dicnFCo5kTMDpeZEn+7BLLaq9Fux7xSodt6vf+LYK6g6JxuD3mmonXey2F6YU
         8TSbrNQiO9q5unXhBINFQXJVvQnhaW904I/dl8s5wNGiEwmk4H8kC8dvNW3re5YlBJUG
         tOeAKlJiQiXWMAM/kB8IECEFhZNl2dRzN4ACeXHIjP3z8vQbG5c84FR0ANPVc/lC5r5x
         8JBSHzJpltBEpDIcI2tVX2HVyOpE1wE7p28jIa7MTQ3J7GSIj7aNMCPmmcmKFPVrodeN
         xv6w==
X-Forwarded-Encrypted: i=1; AFNElJ90ovRSbV9YWmUwJoyaj7KJ9dC3nvFtM/FUOdoGnBVU2IUEDl/p3LXf4V0xa8RGdAgFsvsKxunssyxd44+zbre1@lists.infradead.org
X-Gm-Message-State: AOJu0YzCcCMcRu4882vCAYxcr2GhQe1Jf14CQjh3MR0Kg5VulKGJBU0A
	T3emL7sCMwM+sffz/aM4m3pwGX3EFFS+PpkTs0XxgQS8l62xmXUtw3OWhbVGvQ15YzQ=
X-Gm-Gg: Acq92OE+JbWlVEiqK2OyctkvKf7CPdC60DaX9b7ZhryKKyd215/Gbc0Iqc9Xyc0ctRw
	elhqHT403HfPsaYBozsJH0Bu5oXFXyLrxLw4ax+oYcLLISyh8QHPrRpk5DMkgBKzA96r4o4UtV1
	Yc5b4B+oue6Q70sWle6ZHDHeo9QgG4qsyOVd8rwcPNvOiTpJ6GGVijL3V2uG4M0Cn+FLQgl9KOC
	YDYXGGaw0Mi+Pe7HJOBIfmTxT4f3DWGbTUB4xYuW08t+8KSSU1tml68JRJpuWtVx510J7+yyje4
	M6T2A9o1nxem6UFFLo7iAfslZvOqGOQYDqbsO/n6gtJoLCbaPNLrMbhQpCWYC3qwNBKbdEBGf8z
	EADOV7Rtrj9bnrm3DzucS22QKchLt6dkJiXa5rQH/zs4d2UUsb8rE3aMpOAdC7L8Pe7E7WtmKxs
	9zqexJhaleIcOR8AY9NdWZxxPFe/gK5wK23ilDWhVLANdd
X-Received: by 2002:a05:6000:2083:b0:43f:ea04:dcc7 with SMTP id ffacd0b85a97d-45e5c5f277emr23023553f8f.24.1779093301850;
        Mon, 18 May 2026 01:35:01 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm35354787f8f.37.2026.05.18.01.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:35:01 -0700 (PDT)
Date: Mon, 18 May 2026 10:34:57 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Mostafa Saleh <smostafa@google.com>, Petr Tesarik <ptesarik@suse.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 00/13] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <agrPHNClrdRvzOFI@FV6GYCPJ69>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <agldl4XQLKAtyLty@FV6GYCPJ69>
 <yq5amrxxxh0h.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5amrxxxh0h.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_093504_912293_BC449BE4 
X-CRM114-Status: GOOD (  10.27  )
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

Mon, May 18, 2026 at 10:23:58AM +0200, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> Tue, May 12, 2026 at 11:03:55AM +0200, aneesh.kumar@kernel.org wrote:
>>>This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
>>>dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
>>>are handled consistently.
>>>
>>>Today, the direct DMA path mostly relies on force_dma_unencrypted() for
>>>shared/decrypted buffer handling. This series consolidates the
>>>force_dma_unencrypted() checks in the top-level functions and ensures
>>>that the remaining DMA interfaces use DMA attributes to make the correct
>>>decisions.
>>
>> FWIW, the patchset in general looks good to me. I tested this with my
>> system_cc_shared dmabuf flow, works flawlessly.
>>
>> Thanks!
>>
>Thanks, Can I add
>
>Tested-by: Jiri Pirko <jiri@resnulli.us>

Tested-by: Jiri Pirko <jiri@nvidia.com>

Thanks.

