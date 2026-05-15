Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E99CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z72wSJNyYtME5egB+TN5Z3aN3HcOFHG2wgqQPaKQrhU=; b=lUrR6OJCCVwgjqi0sG6b9uiniQ
	ftlbGgUD6levWRtDNr7/HanGG8wcElG/U9RmgYHpKgS2i4ztBRFqV+uRzcn2eDyu+lygusOW7p3h/
	VrO5b/d9t/h956DEeyyPfvKDPXTr7ZlrQKcgQb0EGymi6O8xo+0cC1Zi9p7cJXl1hQyNvLWmXFXyJ
	7VkBVuE/8+0m7F1m5Lzhc7iyFZuRE3PoiIBcNoETmqSkfqyfHQqn17Jm7tGkxi+DAsLIl8tM4zNVi
	X1i0IamArhZqT3VDtY2PryZZjWn4+6ulWoezMl8quWL1wBqaztnbLFfAhEH0rVPSNPQwYL47I5ift
	mQFGn++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNshz-00000008SYi-0fX2;
	Fri, 15 May 2026 13:36:07 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNshw-00000008SYB-1Qjv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:36:05 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8c92737a8d3so12518356d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778852163; x=1779456963; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z72wSJNyYtME5egB+TN5Z3aN3HcOFHG2wgqQPaKQrhU=;
        b=lAwUuzxTCCjjdJpKR7iC7Ozz/DqIXPWDWJbzmfyKkzWBPrB5JgfH+2dNMnK7vi1Wb3
         rtDXbogZkfrAgt0OC6/HJeaTZrc13XzAzlLOA8rg/aL961XyOZm7Hw/B37JUoOzG3tee
         UD5GQc1FSk1YmQTixn8pQrDnKylFkZrWwNJH/SC7Kh8DlRqd8EEF2hbX935S8AEwfGsW
         /tNiqFsquP7XvJcM9i8pWF2Lh80+DbJ5VMYBB5/IuYKx1lcz7UBDXaN+jnVZZvpNYsgB
         Rhnc0kaj/eQtIxnfH7V0m+AIKyv+q7whvCNMnjIhZ4ajtojm9NkRc9J1HVk25cZBMUhZ
         YP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778852163; x=1779456963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z72wSJNyYtME5egB+TN5Z3aN3HcOFHG2wgqQPaKQrhU=;
        b=Db/Vw4WCmRx1v6UAKOSrgvrPwZt2gOoCkNnVm+2vuudSRwls3HHZSWGoBupC8QRlpd
         vkbx6WYmTmDCkDFmcF1I6iBGuJPcRaHqR9AOV2WyzOgev5NAJPmV9tg7PlkdDmqulXoR
         MWzOkcqwNdYLqw1opKSeNmJ+MfLWW2D4rJgFSXEQYTkOaGPlLi44S852sC+76Xp5qTsi
         /kwQOzRfDKefcj7+uZgnc0BrhvcH7by95gChh3ue62c5KtovEt6m/TQzmRcrEZ6+8ivI
         dC1lq8hkF4I8opTIQJkIDQwhcLLzCzUCZIIXUqiVGxMvBzz/xZ0f4VoxWOO67TVq6I3A
         o9Vw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZQPfduZHwB8fXYok7jidw+F6Yyoflx9UHJE8RPCz3dhJ4uxCet/aAcnD+uMTldKCg9IEbKM1OU89bIfHJ+9qW@lists.infradead.org
X-Gm-Message-State: AOJu0YxwP86gKbAlL/kQssnJpc1XC8WftZ79qqGAEm/XPUhMwzCSyTjr
	RJNZGSmMJgLRKuW7rN/M9WOnegiOATK+bopQwhypp0BySakZ2hd2FzlTi6wYuhZBdxc=
X-Gm-Gg: Acq92OFec5X+Q3NvJkWQL0bxK2gmh1D8PirzT51fwJq5weGfnfLD6WHhQ+Tc6eqvyYb
	57Q5q8b0bdQpy84qIhicXn4g7702SOmowKvp/Y6FZBAsd3ePaGVTGhwviseaJ2DSYXxwvXvb9+8
	NkZ0J4h2k20neqlzdvCu/HMCwwSVzX1ci29eB+KrjR7lN1LcoYcFTi7w69tEF/lKVuMW0nJJxBx
	1vmpgEwDT54fOgCxO4iISUfJMu/tqjCGpzdjQZJVajR6RJCCfAJ4s9QeAT7xzhtl9g9fvxFxBPx
	92atZaxdN1xXoqi6e4DvoUxiba61mHcCEf4fwlg2MNppgB1FYLzhJauL7QhAiDizEC3KDQhGBR+
	1+YQoGv8YRhiRPwTAXNXzPNJukm0SwFF5iDvlvO3oLE0IjjLfohJZ1MAgoDccUD97OUN6kfzi2u
	8vRYbcZCBIipDP4s/17RzIbmteGnAYicsNfs0KGjynVuahCwzfc3E31UGvzLvbtFnEW2WKwvZbQ
	48WZw==
X-Received: by 2002:a05:6214:54c2:b0:8ba:b699:9e54 with SMTP id 6a1803df08f44-8ca0f69b454mr69231826d6.47.1778852163065;
        Fri, 15 May 2026 06:36:03 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c9093e62c5sm52289596d6.21.2026.05.15.06.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:36:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wNsht-00000007QFF-3spW;
	Fri, 15 May 2026 10:36:01 -0300
Date: Fri, 15 May 2026 10:36:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org
Subject: Re: [PATCH 1/3] iommu/io-pgtable-arm: Use consistent sizes for page
 allocation and freeing
Message-ID: <20260515133601.GF7702@ziepe.ca>
References: <20260513215203.3852661-1-smostafa@google.com>
 <20260513215203.3852661-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513215203.3852661-2-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_063604_381609_844391B2 
X-CRM114-Status: GOOD (  16.28  )
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

On Wed, May 13, 2026 at 09:52:01PM +0000, Mostafa Saleh wrote:
> At the moment we use alloc_size to allocate memory but then there
> is a logical error where we just size in the error and free path,
> which might be smaller.
> Also we size to do DMA-API operations, which is OK, but confusing.
> 
> Instead of this error-prone handling, just set size to alloc_size
> and use it everywhere.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

This is similar to how iommupt works, pt_top_memsize_lg2() rounds up
the top table size to the alignment minimum and we just dma map
flush/etc the larger size everwhere.

Jason

