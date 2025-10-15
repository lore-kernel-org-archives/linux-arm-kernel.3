Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCB4CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILwpaE+T5XpzmGXk5vDJm+k5n9Pb/8cfvXWouFnzCso=; b=TKghwEjns5TY+7QR1PqnxO90Dh
	AUEIrjJH6m2vgj71+lOb4Se0dEwVHKx1QUSdm5+6CLIbm+lrkGa9BfAOEA5gvhmJwOfLFRtWutwXl
	nnMrqS3OLrmT9lXcDuF8wA5hAfri7/EFEg5DeBHvpaqXjhulNnZQD+dYFD8ynUsTzEWkmNhY0OCsC
	hPX+GKyH+C2cc0BU9Jb9rLyg8fzwo9CnibB/9fAEKvMUW15qBMoYOkoaLJY7DrwLAn/+fkplX+UjA
	aGNtDV70NHCPbrTznmufz1BSLgzEMwcYbcoOuchcCQXCzYblk620fW/xz2PZVj2Hta6cISdM185a3
	GRGH+2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v938j-000000022ws-1AGZ;
	Wed, 15 Oct 2025 15:10:09 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v938g-000000022wQ-1Y17
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 15:10:07 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-7960d69f14bso53265596d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 08:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1760541003; x=1761145803; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ILwpaE+T5XpzmGXk5vDJm+k5n9Pb/8cfvXWouFnzCso=;
        b=k7geZ5KCcSRoq50E9KwiSQoIKAaSfRPlr/E3wuVctIaKeUKYMgvdoBrjzT0iCPFl29
         oLRa/RuqYn3UGf7ikqYSgtg9y5LIDbxVcL1tT/unSU9foZAc/CHFEdSsQRcfb1Tj8exu
         A5hogDQhOS6+0ESMuRgi/j1R6WowYXMFIqSzPB5/hzJnxCbOADwjfj1XLCpJFPuXuDoH
         ENIw1ugkZfjDwQ3am782XCTPMJocvgpIXxBGFJH6+NQWiRuYzyP1JKb/Wme9Ig7n/B+B
         vaxzJSh8cnlowoDy5RouJUU/06feIVa6+OcUE7jrpFnXFfyPRnXM5RaZ0CXS0eqF4YXt
         hYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760541003; x=1761145803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILwpaE+T5XpzmGXk5vDJm+k5n9Pb/8cfvXWouFnzCso=;
        b=H0T70ILaGVIrwr8SvvhaY2daEMmJALx7PLdUFtlG5ib92drbWrWLyKcT3D1csg3DCU
         CTBVnGTtVYwOMrL7+3YppHkVt17be6dPLNmDHi/FDSxgZ9yeZqMb6y7ETn7+4BKtiukD
         EOFihR6yehPSbdo643+XbVQptPXXPDAaUG/L6dRXcTDGgRGVKUwZVfX8UHjtkFw3wdgD
         RZKzJb+SHkplhfNSHk76SvWGvr3KBvNqBKLce8qqoBqfOZotOjtdFEvc/fKzrR8d31JD
         Jl/ZtNuni5VwsIrwC+1iGPF+0WWvBwDHycbAevEP3WdFiCR5IwJJir6oMx2WYndIeeLW
         4OYg==
X-Forwarded-Encrypted: i=1; AJvYcCW9EkI4m6iq6uh2ogej2/H/TLmgbw3B2K7xRp6RtKS9bn19fIZdr/qAOlP8Sb3fOntzqzsvkhkxpwDN+1MpyAa/@lists.infradead.org
X-Gm-Message-State: AOJu0YwTqjejycNF/1tGv9sEpzcA/8NjqBtBBnmz4BFj4V6WFnXz1vMf
	GPBSrG1joWZLE+zsiN4BqTvvju+BJ8pAN5UHfoElo42xbGxeIfroPJlqdu8TnfX6OkQ=
X-Gm-Gg: ASbGncsqy6/4um+ZNW2pIqMNYwId+Hpw/DHRY5aZ4fLtO9J9LZtz84zuRa5te7DpkYk
	lSYAwjd+99p+yqLwvaNDz+l7ZTxbUtS/ERpiNUFAEV1mQqnYq/GK4HQM0BvtHmgxHWaTGOhPBtX
	fHY7oy3Vb0DZRn8GpvLqUdbWQytuZbrgXDmTPylFyooMXBk3UZryjOUTp2KQ1X3SpcPTOvA/q/o
	ElzxhAjN+djlZMY2ybfXe33wyZU4nuOWtBgx/s87uZgGQNQHsaoKDrLbKziAyuZQK1f2DNGMfHh
	ozqBTZuHEOcRBymnC4SJnVTU8wbGdBJgpP0DHLNfuVmHCS4xDbLhLaatrkFNPwY/6EgGk8cYKMe
	axCqe2m5Uu3GBH+g=
X-Google-Smtp-Source: AGHT+IGT/kELmEXYXPGlJfuB2PbHSRRnqIl4KI4SjW2i78+LYVAn+gH5X+YwxfAWjMG/wVMJe0rtQQ==
X-Received: by 2002:ac8:5885:0:b0:4b7:9581:a211 with SMTP id d75a77b69052e-4e6eace7e6cmr385756551cf.24.1760541003496;
        Wed, 15 Oct 2025 08:10:03 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e881c577e6sm20528841cf.7.2025.10.15.08.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:10:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v938c-0000000HRP6-0a8o;
	Wed, 15 Oct 2025 12:10:02 -0300
Date: Wed, 15 Oct 2025 12:10:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v5 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <20251015151002.GH3938986@ziepe.ca>
References: <20250929155001.3287719-1-smostafa@google.com>
 <20250929155001.3287719-5-smostafa@google.com>
 <86ca3918-4992-41a2-894f-f1fd8ce4121f@arm.com>
 <aO9vI1aEhnyZx1PL@google.com>
 <b48193a4-a37b-41ba-b4ba-8b5c67d812bd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b48193a4-a37b-41ba-b4ba-8b5c67d812bd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_081006_434024_72310F56 
X-CRM114-Status: GOOD (  17.45  )
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

On Wed, Oct 15, 2025 at 02:51:15PM +0100, Robin Murphy wrote:
> On 2025-10-15 10:53 am, Mostafa Saleh wrote:
> > > Conversely, this is infrastructure, not an actual test of expected
> > > io-pgtable behaviour, so I think just:
> > > 
> > > 	cfg.iommu_dev = kunit_device_register(test, "io-pgtable-test");
> > > 	if (IS_ERR(cfg.iommu_dev))
> > > 		return;
> > > 
> > > (it doesn't return NULLs either)
> > > 
> > 
> > Yes, I was not sure about this one, when checking the code base, every test
> > handles kunit_device_register() failure differently, this seemed the
> > most strict one so I used it, I will update that in the next version.
> 
> Yeah, my impression is that those have likely been copied from the
> lib/kunit/ code where it is actually testing its own API. I've now sent a
> patch for the example in the docs...

I think any failure to run the test should be reported, either with an
err or a skip. Tests that didn't do anything and silently report
success are not a good design.

Looking at the existing users I see alot are in init functions, so
they propogate an error code and fail the init.

And the rest inside tests do something like this:

	dev = kunit_device_register(test, dev_name);			
	KUNIT_ASSERT_FALSE_MSG(test, IS_ERR(dev);
			       "Cannot register test device\n");

Jason

