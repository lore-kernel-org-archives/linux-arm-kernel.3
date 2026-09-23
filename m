Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340D4C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=; b=SQJNSECGAQaQOj0mFaL2TkB4o0
	Wmil7yy2NjCwIbZ6PbTdikrNC7fdHrbPAPr2WHlr/rkuMrIVGdAuzWJgfa6cZDkKzqj+6uKvhVNhH
	CzbjXno6SiEox50Sy8pt6I9iEpD6egV2b0ycI8iKMgBNh6BbDLnAUwtowMMRpMpxBxjDOt9uOy2wK
	AddD/Assrwyz0xW4EofeEogLsUNhf5vxVIb+pLk5v09akHSJgMdnIwRPtm1eDurJg9pB6+vgVrBya
	eCSBbGoaqqCiVP5SEdehUeDuKWg1IL0YQ3hs1HUgccyWkQn0esNGkNLpPi3VCuFfO6PCfyrz9zp7Q
	m8bswc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MaU-00000008KFT-2f1y;
	Wed, 23 Sep 2026 13:00:38 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MaR-00000008KEq-1e47
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:00:36 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33bfb26865fso728313eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790168434; x=1790773234; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=;
        b=F8h0XMJ8ErWWTStUyFXASGtGI6VeYp/FRBevsh6uHaNQUvCmFuDiPaM/f7TGKhnyII
         8k3aBxUK+mbkuYVBE/4DSMfGrMgg0FdC4sYg1d2j0F6U8ICHj54+//RmxaRczR7uV3du
         rvtJgdeVZ2U3jQpfI7mr8x74DO7K0qghjE7IfojBtNlr9GRtPRQNg4ns6+tSTs9aPBF3
         SA6P9Ry9p9upvBJw6HvCzWxWc6jzR0PWwAVbB1fX/8SAT9be7m7sek6qmYGp1G9Y95oD
         /6tNmSNFjOiR1PYp5Af6vWzxpIJj+FxCQO2+j7t14mJfC5GCAX+KtVFs0mIUr33c/W97
         /gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168434; x=1790773234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=;
        b=hNYAlcIrV87/Y75Ec8WvCpVJMZk0/8lM5An2itmjrAV5kfxwmxqTqtKpukYML3iyWV
         oHq1cwmXnva6oITnxdX1q/D/vXCq27dgxqJ5MXkTF/e9OlXbPMRhBrC0p1MIl9Yx1N6Q
         xNRCWrLoMBQ0JIkrzRx6WrrFkNvAm/HyFDEGa9XNSk9kLVrGL590ye7bENT3nPvoIBav
         f4TQlEYvF4eWKFYSRGpbrC9Sh7HpidbpOHr8+DjnwxeMSGsp0RVvAdsGFXtkzM3AqpAd
         mwpDrKUOCIPjaJ97F4qUirlqJ11XWDMXLm7z5MW+1dHvyqiObQYdoQGiR0hYt67OCnGE
         pIqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDjCxbihyPIV7fEidHoJ43MzxwSaMZFzVUD7t/8IAmuf9W6aY89eTIykyQut5/cVTDkfHaA19w2TspvGbufjHl@lists.infradead.org
X-Gm-Message-State: AFuF++lNU3yuhQKb+Fc7wk1J/K5G92V0KYscTNqXS5G4WLI6xFmH7U2T
	+mt4m2DBVgdFotOhGPkqoIjLc2njXpTWHK3CP1q3l6TyqJiWWYBKej2NCcdEtCcOnVs=
X-Gm-Gg: AYBFou0eJGuXsgxUqtHRVkP0iTAMMIJU5Yhsjd7p6VUqEFHJ6Jn6DbZaPlZjGG1urvM
	kp1rOinw4BhHbk/HWypFGCOzxKS2FPwhuifCvykkomCD1CxRBI4kUWfqqxTMVJSL+FdvmfFSzEN
	QaCaR8vumqUymCBsi7LYiJ6eDlELMc2fHBE+Ip9gIHNszPBRijfhncnrCjEinvnBRDCXZSx1yZX
	oUcoMuyHTvXvWjnCX1GbZoWm6VE0d/nXaeGDd65JST5UXTLXl9vGdIwCXepBYhxJz797ZvomzsY
	U6eFRCltygyfFAsKNlB955Iip58n2E0VNZU+qxm85lwpyI6CgKZiPxHsFdNvAzmODYFtsJscTBi
	svnZVb32EKm++TZHLP3uRLBzKZiM4RfDM5uRbIez/OOnIwHchNWHVslQ5/ejZx9bWrb/+COHmRa
	79XYlwFPmyMxBBQ+mkza32Jg4hJF+C8uOycEefmt9uo/SI36xewpkT3OU=
X-Received: by 2002:a05:7300:7949:b0:31e:b832:be with SMTP id 5a478bee46e88-33e8c24a34bmr2627336eec.10.1790168434062;
        Wed, 23 Sep 2026 06:00:34 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96358e2bsm6859478eec.16.2026.09.23.06.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:00:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9MaO-0000000DYPQ-01dr;
	Wed, 23 Sep 2026 10:00:32 -0300
Date: Wed, 23 Sep 2026 10:00:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923130031.GE1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOfD6syXOgQhZYA@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_060035_635857_0002995A 
X-CRM114-Status: GOOD (  14.23  )
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

On Wed, Sep 23, 2026 at 10:42:39AM +0100, Catalin Marinas wrote:

> On pKVM, we want set_memory_decrypted() to zero the buffer
> before the host can access it (I guess currently relying on __GFP_ZERO
> allocations). Since no cryptographic encryption takes place, there's not
> much point in memset'ing again after the operation as the content was
> already zeroed.

It sounds like this a pkvm unique thing, since RMM always makes the
memory hidden, pkvm flow should do it too. Either inside its guest
set_memory_decrypted() or inside the hypervisor like RMM.

Hypervisor doing it is the right place, hypervisor always needs to
ensure guest memory is cleansed whenever the guest gives it up. Either
via a private to shared, unmap or just exiting.

> I don't think cc_make_shared() has the right information on how to
> safely and efficiently do the zeroing. That's only known to the
> set_memory_* backend. So you'd have to propagate the flag down.

+1

Jason

