Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1559DFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=814xa8seFs15bj3a4vxXUsxq6BSSUZsJ1eCZuSdGtu8=; b=hwvCGMRBu+zwegw/QRbfGljsZE
	OfPsQNwA5F/zGU8D329OnJy2qog4SNQtWkSIFVzQS3NCiNrL1BiwESZGgj+IqWhs5WmsGcRc4tAEF
	rvC9PfoUASP0VqaR+JhYRh2qURulDtBtxCSdxd0uTmccHEHvzzemCWWUHWSd/hEDP/NkCmcRlgUei
	moDWrGbmixBkbK7msK4uRwMLWDlA3JqERYerqHcPwO+2Cqqtc/PNGDY57/WTYydu6iORX9hKAq3S7
	joScDkzM858dgz03bbrEy7XIRpVqGitjy/pUNJkwil/chqrY2bGTBV46j9ETp0+S9FiM0IUDhLVmd
	5GOZK+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsQ5-0000000D9lK-0rZ9;
	Mon, 04 May 2026 12:29:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsQ2-0000000D9kj-27rT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 12:29:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso198795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777897740; x=1778502540; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=814xa8seFs15bj3a4vxXUsxq6BSSUZsJ1eCZuSdGtu8=;
        b=UWUrY/HzsBN4lyqLUhLfTgE1OZdeLSJ9sx47s2LsSvt3hTc73Vp8lbzLDFz9hL64vo
         r/YM7w4lXsYaF5tvmfuUrD/aIQ0Ql5KWgMp30XbtAhipAlo2ZuPTS+mojJppahDU3J/8
         /nGnLq8omf4Mv2IYrPaPizj1Jb12g71WaOogs5ysn0/vaXSUev6OXBdkUCPCgLx/A9jd
         6qK4hwDzSGbplGbZO7pdu9+3LZc0nmh3RqMevYfysUqislIky5TpEGoFXwTdGBoqXRiF
         ZovS2gd29WgpEiMCqknmOxzmAkrufzUeFpkylJzQ1mKGKIxqwHSpkiFkuUxE2jtvdKLD
         yEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777897740; x=1778502540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=814xa8seFs15bj3a4vxXUsxq6BSSUZsJ1eCZuSdGtu8=;
        b=SNGgsdEwZN9N80dU1/FsOyZi4B/kZ5UhzDroQT4yN9rgJhOfBWrMGdccGmchMldEQP
         oerLn3MEX9JK3OifOekRiC2SMetXpTxZtP8D5AkHbcIEYxx5Da5DAucwNCn6Tjlr3NYJ
         W9FczNYotcmUMKiZ3QuYt9YzYsqXIaljASnNpDkvvF4CxHYMXkfgfaCg1N+9ORmdLouS
         4w7ijry+kJg6qV/RwaZfoT1Gv0XrV7IGRh+XUXVVwKZkM+0u1ittIGmfLSOcd4yUoJdn
         2sRlYULx60we872wCN4OP2XPgNp2AXBzmsYZsmGgMsUzVCFqUI93kneuz5sjUNdU6rRo
         0shg==
X-Gm-Message-State: AOJu0YwY47JSHwhvlSJr8PAAuVOUICL4qKTuzQ/yslXlxR4Vh9Kq2nsL
	6NONemwUecGgIU4h1e0mJisPF/qNzz1xk+ICd25SgQsjcUXa/AYpOe0hnIBhYwatFw==
X-Gm-Gg: AeBDieujO7Jy97ROEN3eduG78O5YNsPb+kMzq1xQwtYiD+ihKu7Qx9q3gndgI7bHQSh
	U0ogyqX0ehZzfBPdXbQaHRgXhO/LvTXZbhVYtwPsbMDcrNNKcHDqQZc+kIcK5wRqEGUfRaxET4h
	yh2VB08fMGffOJbyHvRJz+FaHTbwohiXFRePfcdU5blI3dEBZS/MdJQcEn4hdVFm1KDNwhMMA9W
	trdf+EXjH1nqU0bSulMOAVHtcPHo3ngzILgJG3zvTVDA0eA7lqtm3aMiQ+Eps6Lpxiu/qiduLFj
	JSzojD8cL6oPmYAcndatsref0KqD0WLyZI/Y/p1dc6mJcdqZPA5heSUqu03UHh+bu8W2O4whRLT
	yUlpkHUAGK4pK3EQh7NCSvdZP5mIn9/ekiKAuf/9MirLxqj5AObsDHpAvkhr9of9/Jwdc2c1rh1
	RXqzTBkPh1pAa9xPYplIqplI/KQzRmZC+GNHq69XzPePU3vECDk8+dLGcEwuFkxMqXNE+FNcec3
	IddPA==
X-Received: by 2002:a05:600c:8717:b0:475:d905:9f12 with SMTP id 5b1f17b1804b1-48a98102ba3mr3204765e9.4.1777897740070;
        Mon, 04 May 2026 05:29:00 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44b638ac434sm21945298f8f.36.2026.05.04.05.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:28:59 -0700 (PDT)
Date: Mon, 4 May 2026 12:28:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <afiRB3e3o0G1oZvY@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <20260501130006.GF6912@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260501130006.GF6912@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_052902_584674_6F348868 
X-CRM114-Status: GOOD (  24.19  )
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

On Fri, May 01, 2026 at 10:00:06AM -0300, Jason Gunthorpe wrote:
> On Fri, May 01, 2026 at 11:19:10AM +0000, Mostafa Saleh wrote:
> > Create a page-table for the IOMMU that shadows the host CPU stage-2
> > to establish DMA isolation.
> 
> Is there a reason you can't just use the CPU S2 for the iommu?
> 
> ie the CCA RMM is doing that, it is how ARM imagined this stuff would
> work.
> 
> Once you start supporting DMA like this you have no choice but to keep
> a fully populated at all times S2 around, why not use that for the CPU
> too to avoid faults?
> 
> I guess there is a reason, but maybe explain in the commit message?
> 
> It sure would be simpler, you wouldn't have to mess with iopgtable at
> all...

Sharing the page table is tricky, this is something I have been thinking
about and my plan was to work on it after this series as it has some
constraints and would require core KVM changes.

So far this is the list of requirements/changes needed share the
stage-2 page table (besides the obvious: same page table format,
granularity, endianness...)

1) HW BBM is not supported in the hypervisor page table, that’s
   because it can generate TLB conflict aborts, which the hypervisor
   can not handle because of the limited syndrome information.
   We can rely on FEAT_BBML3 which was newly introduced to work
   around that, it’s quite niche and not supported in KVM yet or
   have an allow list similar to the kernel
   (as in cpu_supports_bbml2_noabort()) which also limits the number
   of CPUs that can run this.

2) Handling page faults, devices must be able to stall and let the
   hypervisor handle the page fault (which has to proxy through the
   kernel as the hypervisor doesn’t handle interrupts), this includes
   also IO page faults which are hard to get right from the HW which
   and may lead to system stability issues or lockups.
   Alternatively, we can pin the stage-2 pages, that would require some
   hypercalls, hacks to the driver/IOMMU API and possibly new semantics
   in the DMA-API for IDENTITY devices as they will still need to pin
   the pages as they are actually in stage-2 translation and not bypass.

3) SMMUv3 must be coherent.

4) Support BTM/DVM for TLB invalidation, otherwise some hooks are
   still required (although not io-pgtable-arm)

This is not the complete list, I am sure I will run into more issues
when prototyping this.

IMO, 1, 2 are the most tricky parts. It's more work and runs on very
limited systems, However, it can be implemented as an optimization)
which is my plan.

I am not sure how CCA deals with that, I’d expect they have a lot of
constraints on CPUs/SMMUs and DMA capable devices on those systems.

Thanks,
Mostafa

> 
> Jason

