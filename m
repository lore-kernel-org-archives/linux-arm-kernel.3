Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C34C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhM9lMbzEMyKsQWUHtCjwG+SokjAeGT8KFW0b3yeE84=; b=riQTpO3AbgyigaSKdCVJTgGTfC
	RLeirq2epalbRl0KN3iorF1gt8ORxw7Dzs6/Rt4xtL+nRgWmkyljcmzEC+r6Caq8ucxdBN76GH976
	71kWYrWqem9h/mfpGHjrCM6UzCdOLYbwNs+krcUfCvVFcdfdCPt5YDw/hV38F8MqIfKbtwqVcRAKR
	YCbQfLvNAwGTFMgHp5/+TvzqXrLfazkZW2brya3fdyn1EGHL3radKmzfo7y5PQ/mBYk612pY2q4Jf
	XacV2heZpFVUpX508YQa1jLWZhVDVT3pkKJhYLA/o86nIe5suSQgnx8ZBuvnM3AdBEBs4G5tygO4/
	GA0anWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlohL-00000006vD7-3zW4;
	Mon, 20 Jul 2026 14:10:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlohJ-00000006vBw-3B6S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:10:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so6360087f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784556620; x=1785161420; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lhM9lMbzEMyKsQWUHtCjwG+SokjAeGT8KFW0b3yeE84=;
        b=I/5P8F9uPLDixcwAV2m8xlCqdfzvar6SIBI7Mzs77qUCDxHPqqxEd3vXE5pHkpfnLP
         9p/59P8lF5uY6EJgwohkWBalS5okIGW/OH/R5HMyIigGVMf9TOofoAUAxDOjb039ww4t
         /Q18LYUG425kgQEwRADoSVs5jowGYRHhlzbLckNAul0e6ty3I2Ro3qhH3NfdkcS31P2M
         GBVSb4dMA5h4RK2MlQJGSl5YPXxUCa8AIc7tUOSB7lWR1SMc4708pFKzkQ8Zq71PQ/yA
         r4UBzvOa5+ndclcRKowA1/dcV+Z9BVgi4rkr7m7UE/N6crElRpSCYVJetFdctMNvxXi7
         bF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556620; x=1785161420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhM9lMbzEMyKsQWUHtCjwG+SokjAeGT8KFW0b3yeE84=;
        b=o3/exqE05DJ8LuL1IXnxgDFi8F/nlilBQoGjlrWL+0fFI4XSQsxNBPuohuzrBZm6UT
         5UqAnu2V3uSSzTNWt75P8/t9lHKzY7qPLWk99EovowMR+X62qKg20APbdYzcnDb8ouhD
         u/5i/xZ/MYm12CUMOqXTotMkcI52TUz5vto/oKmOVUvp5iRDUgzhZf2bOVS/A7BtCOhE
         Iu6JVAJLwq/FSO6EXcVncY+c7ZcB9HTJb0zCWdtTCOxKZ0ZQc5uNaUHIbAtAqEHmmIsL
         ROMcNASCloAjWGOVz/EMrvVq92Drgs3uerEbYiFDDqLY6BRt4xeetDWUrx5TvKgzGNhy
         WZVA==
X-Forwarded-Encrypted: i=1; AHgh+RrgYXA8qTBKN2ChG1LS1tEZJcxjMJMGhsDrcAtRUvnyNgN1QlMCRu789v48iLTxA1WH+Hc2dBlnFil0DUN1+KSS@lists.infradead.org
X-Gm-Message-State: AOJu0YwHFI90Jz0P5iO+nC+9AXIGD8ATxq9JkkB5cGMULXJ/008tLUGP
	nRTPrkG9qsxex3u0ZxLAj4l5XFhYyAoa67+3ujM1wz+nIW/JyzxLeXupfa2fLX2Gng==
X-Gm-Gg: AR+sD1221/bKA2nPdWIcC+YVtR+0oPWnd3Yz0u5il45u6trWJ7ZQ6yGgL5Uranu56Cl
	iG5QCmatHMJI/ZNbB686IhpYLhJv/FbS4jSyKAnwDDQrlFv5W7x2mefLpfEGFRwkEjdK9sJzh++
	BuHj0W1PBqZzv+ia2hzfa+pgthYvZMtrfTX5HiQ9bxwWHELP/3Y6bFEe9PStUk4466FV7EubXgB
	4WgU0oIB42EjEzj/6yYvZt+owvK4zqrsc0/njLFvZm7CxEWgKD0XgW7bOGzBumd3f0rnfvwlxK5
	B2FiN9/ZFn0UrdCfMOPII/JEmcFNS5BPb4AqgVXIfV9URLxFc01T8i82OuKBlP4jh8D9kelxqq8
	CkrGiy+khUBD6/meJ/V5rJocV7GHYVyAVM2/+RVATDky22Dhin0zz5YlSCatqA517cT9ZsWzh8u
	sib6dgfTnhI2VLnjn1uurhXSuSBjr9MT7mdkn/QRbg
X-Received: by 2002:a05:6000:310d:b0:47f:7736:2a0c with SMTP id ffacd0b85a97d-47f77362b3bmr5764086f8f.14.1784556619210;
        Mon, 20 Jul 2026 07:10:19 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e52f81sm31185414f8f.9.2026.07.20.07.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:10:18 -0700 (PDT)
Date: Mon, 20 Jul 2026 15:10:14 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com, qperret@google.com
Subject: Re: [PATCH v2 18/18] KVM: arm64: Alloc simple_buffer_page using pKVM
 hyp allocator
Message-ID: <al4sRjt1S5R77cvT@google.com>
References: <20260706175415.2604046-1-vdonnefort@google.com>
 <20260706175415.2604046-19-vdonnefort@google.com>
 <CA+EHjTxRFSW=9fAYvikL2t48ykaiGp7O3Mg6ddXdtFZrmWWaGQ@mail.gmail.com>
 <al4q05rBGvJzi3Vl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al4q05rBGvJzi3Vl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_071021_814761_77CA7997 
X-CRM114-Status: GOOD (  20.07  )
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

On Mon, Jul 20, 2026 at 03:04:03PM +0100, Vincent Donnefort wrote:
> On Wed, Jul 15, 2026 at 04:07:05PM +0100, Fuad Tabba wrote:
> > On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > ...
> > 
> > > @@ -193,17 +211,8 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
> > >                 if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
> > >                         return false;
> > >
> > > -               /* Overflow bpages backing memory? */
> > > -               if (nr_bpages < rb_desc->nr_page_va)
> > > -                       return false;
> > > -
> > > -               if (cpu >= hyp_nr_cpus)
> > > -                       return false;
> > > -
> > >                 if (cpu != rb_desc->cpu)
> > >                         return false;
> > 
> > Sashiko flagged this. Nothing here bounds nr_page_va from below, so
> > with nr_page_va == 0 on every CPU the bpage size sums to 0.
> > hyp_alloc() still hands back a chunk, but bpages_backing_size is
> > stored as 0, so when init_mm() fails on nr_page_va < 3 the free path
> > takes its if (!size) return and never frees it. The host can repeat
> > it. Would validating nr_page_va >= 3 here work?
> 
> simple_ring_buffer_init_mm() already validates nr_page_va. And on error, we do
> seem to rollback properly and hyp_free().
> 
> So I don't believe there's anything to do here.

Ahhh no my bad! Sashiko's right. Because the size is 0... this will appear as
"unloaded" ...

Indeed perhaps the best check here is to make sure we have the minium
nr_page_va...

> 
> > 
> > I don't think the rest of Sashiko's note holds: the zero-size path
> > succeeds rather than hitting -ENOMEM. And it's only reachable from the
> > host kernel, not userspace.
> > 
> > Cheers,
> > /fuad

