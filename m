Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9645CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0q9jHEvyutbUqJNds5rNSupxxEZQmy/I4DCyfn2tFo=; b=c9+LrQtdSBSgLtHISy1UhbGjsy
	q+Dk+DyZohqdUITa6i30poTD4GgRkCTTxw2aiW28J8dW3/i9ch2Uukp3vjaM0s1beTCFFZwCBQknG
	lA0IxxM2bM6fxRG9MGZyRi4Q7sxB6tHejT4OZGdC6jy+WZ8lcMSMBj28w/22GrahYW5azHOkyCA4y
	MUOnwICefAlzJQYeHZDw3wgz/qQzoWILDlIEJoIRBHBOd/9AMzRzcv4+In5WkkgF9MUow5fpAWDD1
	/ivKPIpZB+z5RzmWbAm03dgTi9x5ma1ZnpDK/gCPVEDYtO3CzrDrUDOhXeWR9RncrwMdL6mM4mBHj
	CTvaVR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaEG-0000000E2Fe-3A7W;
	Wed, 03 Jun 2026 01:17:08 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaEE-0000000E2FH-1uC6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:17:07 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-915660e5b8eso331234485a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 18:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780449425; x=1781054225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+0q9jHEvyutbUqJNds5rNSupxxEZQmy/I4DCyfn2tFo=;
        b=UlxYctLi27kp0kO9nzbm8Luw/e2lcp6AT6kU9GQ6h7DwCDi9QQZY1NsEII5YRfKHWP
         TmlES7ppnVTQfmi3mtAsDVW3P5bh/KD26sriF2lfztIRMUs9NdU7zvL+JC+QW0MfRGXB
         /s/HUx2TvDlkmtan8UL9RWZdnLtomIVszwkEQR+/8N9qT/4JU2vTyYuEKvuqS6Q00/O5
         CFdBcNSoA76YBibx7+r5m/L+iKIGN01LfhxluDFq/INrRUfoq5Zs5IgP3VnhrBxW+GZY
         sQbbuzpnSfKR2VbaUrcRbxZ55cu/ChRdJ2gcm66ANtXSuTyoOvGlBakK28jBu8DZKCkP
         tYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780449425; x=1781054225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0q9jHEvyutbUqJNds5rNSupxxEZQmy/I4DCyfn2tFo=;
        b=JohdM7vDfcSZS1g83pipQH39D0U7AWlsTxodNsKekvcwEJVTsysLfWf3qQ9PyqBaU9
         vOZ/gImMhFpklXwnd6x/9YQuoh+X3bmaIKcFnfsZjMKYQ1kNKIauV3eSchoPgCbwnrbh
         eK9WaLNNXEiRM74TW2KeKhLW3xFiKldKHkfpBqfcHOFtT2Nqq4vsU+nkBV+I1cnstAAo
         8sfkWaCEm3rq9cgjErEmd4kdjMd9gmQfmcFyxJPEFJLRCWYsqGcoQrvsPlrjS4Banif0
         1DF74zZ0gfvxzJFOQUp0GZg0+lGZaYekVFKwpKZBlOc1UORZ5QStHqdLLq1jz1wK2skF
         9DWA==
X-Forwarded-Encrypted: i=1; AFNElJ9VyZuQP73sVzskxfKcjkL2Z/D2XXBbkGnrSllvkuoYBFqH8MYWNkNJlTPFqWzfa6K4poHg7w9A+0ZbVYOwYPmM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7D/zwnWcU4p6Ug5Zw26rWh9RM/sXsiHt/MYJjuGnsWgknRPMS
	YpKHUQM7tLPcOims3L1CNGZ8TACM1RlFVUPaRxi+vSjFTNgi0NdmHBmvvJRmeizIWgA=
X-Gm-Gg: Acq92OE1clt/D6PtfzE8WHtK2tbMDEIWU2khZqQOAAlrRSBjDMr521iYQcWn88DrlDc
	aZx/bz0GnSRCsXGRZs8ROXPx1rkuIzmVhL9Gwpq+vYMaGAusN29YC5ubzkc/J9IcxgwvYSa04O5
	w6M/fJp1rPWWrPCCJwvrPgCYOwqFBWzYIJYD2IveTJHgXw/dUbe1Naax2ngROIF6ItGDKhPUG+u
	q8MPHpjH+P8c4DahHUsL9yXY1TI3zJmGKhWytxnzCZLZ1i3kIpumzJJnN1i5hX3QCv1osrLXS7S
	Qxm+wFjBZxBQFWUsYjelVIGiXArfXqbbNnW4IGZapDgY96WlczY1An/cvO20TmAMpVKOn3951cJ
	VVKoY+Q8W+LfIiFZd78m1dxvUJeJLqP/CJZoTsTsJ91DiTv9Yv5EZZFQbFYWnE+MF4ltqXOjg7T
	bvy2YPA/dI2ny+9cSAqCjZ/KoWlq+YbRhlKff+ptF++UpRO6UqoaPO7q+jwxA6psb4DRnBZ+Ygb
	ow7BxWzr5zfP/cD
X-Received: by 2002:a05:620a:4455:b0:914:c788:761a with SMTP id af79cd13be357-9158a84f289mr254481885a.58.1780449425306;
        Tue, 02 Jun 2026 18:17:05 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a009fe7sm102378285a.8.2026.06.02.18.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:17:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUaEC-00000004yu4-0q6Q;
	Tue, 02 Jun 2026 22:17:04 -0300
Date: Tue, 2 Jun 2026 22:17:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: adrian.larumbe@collabora.com, airlied@gmail.com, alex@shazbot.org,
	baolu.lu@linux.intel.com, boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org, dwmw2@infradead.org,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	oliver.yang@linux.alibaba.com, robh@kernel.org,
	robin.murphy@arm.com, shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com, suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de, wei.guo.simon@linux.alibaba.com,
	will@kernel.org, xlpang@linux.alibaba.com,
	alikernel-developer@linux.alibaba.com
Subject: Re: [PATCH v2 11/30] iommu/mtk_iommu: implement iova_to_phys_length
Message-ID: <20260603011704.GT2487554@ziepe.ca>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-12-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602104637.1219810-12-guanghuifeng@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_181706_502120_26733440 
X-CRM114-Status: GOOD (  10.53  )
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

On Tue, Jun 02, 2026 at 06:46:18PM +0800, Guanghui Feng wrote:
> -	pa = dom->iop->iova_to_phys(dom->iop, iova);
> +	if (mapped_length)
> +		*mapped_length = 0;
> +
> +	pa = dom->iop->iova_to_phys_length(dom->iop, iova, mapped_length);
> +	if (pa == PHYS_ADDR_MAX)
> +		return PHYS_ADDR_MAX;

???

I guess lots of AI made this right? Please review the AI output for
the little slop things left over..

I saw enough unnecessary hunks, and goofy things like putting the
mapped_len zero in every driver instead of in the core caller.

That said it looks pretty close overall..

Jason

