Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF43CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1/7qz951QFpfVmLjYKwAHUwEETJuwr+EbTrOwLd4n8=; b=yOloRuRP4FtjS8Aqe9Q2rqiYk6
	43zQrLsPMIAFUjtOMPksoPgRPPFRGzX6l1S9nlFXNpeJ7q+Q7WmKeqxNy0K4sOruK0trYw9VLi6LY
	bZg+mG0P88/wparlGqfJe3dQ/yocku17B8SkzvkbvY5RkpAlZ0vSghyPD1910xxzXqXxcAwO22dOt
	1ivEEtFwzZzowBzo3jylN64in850K82vRBrqvVtLIs7nt5Ed7XzlRbm4Ya+jCeJJDz0EWH/S8CZQS
	OgjShLCSdEcVRcCf01ba9I7DqydPFnOrX1+PYlEmDsd4+kBcijCmaRziiM+PhFqHEHjMf7VNxu2y7
	uRVR0DEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQag-0000000DimP-2Ncm;
	Mon, 11 May 2026 13:22:34 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQad-0000000Dil6-3CiX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 13:22:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so1335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 06:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778505751; x=1779110551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1/7qz951QFpfVmLjYKwAHUwEETJuwr+EbTrOwLd4n8=;
        b=r2dHLFngi6Y+K2lYI4b04lU7IKtT5jU6RnzwjZzOaiwO6qY3HW8Qv7wrqmZbZI0ZRb
         xO3C/OgDGUmUlPmBF1eaXuHXW4fkzjkH03/AtOaYJVVjWTpVCfGddDEgBnk0kZnXbuRy
         6i02B7j7/9onzBTXxJvVVkOy2HaNCTgE3QgsIZsYdMwUzYhIuoC9tAP6vmazPgSvudUW
         /dPu3az/AfYo+qcPnVqd1KgSwBtjPS9QEqiffhzJbIGGZukMgIOvPWOF8KZmsOzVsIQO
         yRUQXNH59uWqfTOR8z1xKEc6619fNuYYlTUKRned6QgABa7wMp+r0nWB92ns8cA+YwEp
         fLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505751; x=1779110551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1/7qz951QFpfVmLjYKwAHUwEETJuwr+EbTrOwLd4n8=;
        b=CPRJkmbkRRK30kGtFMSgOSxFj84dhTPf2kvMHSzVNfl17jn7Tj79leYWfrAvQemkmq
         RSW8u+4gM6zeWyUIr+v6BxLpu5p68StuorQq/buxUg+Kl1Q1eC7LwEm255soR61ihUm1
         FU3i7S+uBC2cREyoyddqB0KYghBS+4Ap0Sz28nB0lYRsqXcyw2qR2F0Xcaod/pu8xhFI
         LgSxeobzo51c+YUvx6RkzymNLbXkENiFBvj99/3HJ2adZ+FSSDtSZurOwjsfdEbHqoLg
         /3+FJgQTbl7UCnQ103w1bSypuPvQT1tyPV5jXpn9IxP5pX8dP1lyKElTk2iMZWi315pg
         uo/w==
X-Forwarded-Encrypted: i=1; AFNElJ8rGXL7Epe0vV20jXW75M9/nBbTyaNs95ezzBfd6xrZcR8aiZIKlm3sO0r7KrPTYBJcWIwFyFmWIetK+y2BFFbv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8/gOir4VpC6Yi/EoykaB/Bnc/CQcmuN5MQ/PMnVKFqYs8Ib2c
	4k7akbqsYUGkMh+nIJJd+esDPehx9Oz6fFn2+oFCKMSNwNctIhM+RiQk8B+Nd4d7zw==
X-Gm-Gg: Acq92OEfCdBrovgQRb8YxlD1bQNlRVLQ+k6DJQeqZc3kVybcCH2twSD10yDGKkmYbZP
	x8KmFFebCbImn8evDSdTMIsTcgG6y4EUkEpKt8OpGyfXrbc3cH2fE8DHUsjNBmsZRdL0N4QDBzM
	yIBbgkkmkM9XdXw6e4ORVj8EnW6Td9Ct8GZKcMkTpltrJjiUe0thvEQT1tqqnHPuH/228z47s43
	FW2k9FejmqDi3fLBi1ZeR4TgSjpVGGjAoEqs8uXCR5zDoM9CJmWyvn/ImL/wITGpMP0xLINuRTq
	VogMVLBbGbkWAvQy5QLZGOkTTCU/cQekVH0SwWZ6XNUjXAKQcDcU5oZI6RF4oSAJlUr9eP0Ykip
	snc/B45UtY/E4JxJ2nOKQJVAuTaOeSVttdzoRpJZ85jE2BMjy+d2LooMsNUJfogfm0i7cBvQtfC
	lRRK8MYcdV3mL7rF2gD75HLHtVwFFHVLc4j2Ltg2MKkaJeYYdmk8e3jJSTRO0OFMG7Nvzp
X-Received: by 2002:a17:903:986:b0:2b4:58ad:e987 with SMTP id d9443c01a7336-2bc786865femr3773475ad.17.1778505750279;
        Mon, 11 May 2026 06:22:30 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d26968sm102835425ad.16.2026.05.11.06.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:22:29 -0700 (PDT)
Date: Mon, 11 May 2026 13:22:23 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Enable Hardware Access and
 Hardware Dirty bits
Message-ID: <agHYDxuYyqzmAfy5@google.com>
References: <20260503135413.1108138-1-nicolinc@nvidia.com>
 <af0SdkjQOZxnnaQb@google.com>
 <20260508123550.GB9254@nvidia.com>
 <af3hWGp3etGOIdEn@google.com>
 <f31043cc-45dd-457f-8031-0cef51c9470e@arm.com>
 <af3ryl7G58D2GeWr@google.com>
 <4e129891-2f52-4bac-8e33-1fdde42fd29a@arm.com>
 <af7oyeleKFXpcIKu@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af7oyeleKFXpcIKu@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_062231_925685_203ACD3C 
X-CRM114-Status: GOOD (  22.06  )
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

On Sat, May 09, 2026 at 12:56:57AM -0700, Nicolin Chen wrote:
> On Fri, May 08, 2026 at 03:24:32PM +0100, Robin Murphy wrote:
> > On 2026-05-08 2:57 pm, Pranjal Shrivastava wrote:
> > > I see, so IIUC, you mean if IS_ENABLED(CONFIG_ARM64_HW_AFDBM) but CPU
> > > doesn't enable HTTU, it is perfectly safe to let the SMMU do HTT updates,
> > > Since the fault handlers are already expecting HW-triggered updates?
> > > 
> > > Which means our check would be something like:
> > > 
> > >     if (IS_ENABLED(CONFIG_ARM64_HW_AFDBM) {
> > >     	if (smmu->features & FEAT_HA)
> > > 	 ...
> > >     }
> > > 
> > > instead of cpu_has_hw_af()?
> > 
> > Hmm, looking closer, cpu_has_hw_af() is the thing which actually influences
> > mm behaviour (via arch_has_hw_pte_young and arch_wants_old_prefaulted_pte),
> > and that can still be false at runtime if ARM64_HW_AFDBM is enabled but any
> > CPU doesn't support HAFDBS, so perhaps you were right the first time :)
> 
> IIUIC, v2 should be:
> 
> +		/*
> +		 * Enable Hardware Access and Dirty updates (DBM) if supported by
> +		 * both the SMMU and the CPU. It is unsafe to enable SMMU's HTTU,
> +		 * if the CPU does not support it as it bypasses mm page aging.
> +		 */
> +		if (cpu_has_hw_af()) {

Ack, yes. IMO, this is the correct system-wide gate.

> +			if (master->smmu->features & ARM_SMMU_FEAT_HA)
> +				target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HA);
> +			if (master->smmu->features & ARM_SMMU_FEAT_HD)
> +				target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HD);
> +		}
> 

Thanks,
Praan

