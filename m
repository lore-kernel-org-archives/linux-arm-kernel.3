Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3DEC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wg7dqcSt6yfLp94UU5Cr+hhthqJWmJ7c1cnnv4D4Hxg=; b=mLU+U0FA0OGTuLVx5QhK3bHhdI
	1TBIO8Q60lG89jEaYCLQRslFvvddkhJZJuy/bc9l+7M1WSxxvxl684B7G+lao/g08WaJin46+W+Ff
	zv7pwF9uc63bxZtZj+gWhvFv4oNUl5kugwpHcgI6j8e7dIQ8m797j78twMzefr6H30NdcUr19TIXk
	at1xpEvnh5YNMvtverPJMKdnU9xzWA4s2hIfVfTU50YlsdnVvwMvnPiZsguSAbFzRhdVWjecQggEg
	PMs1biQaMpXwZQRFqM1Y0ffDnaT2ybMz/oz60fjsbPR7hZgjrPervBDesOoB0MYz91LfuVX9gbv43
	dHJM85wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yzB-00000009jK9-38Cy;
	Tue, 08 Sep 2026 16:47:53 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yz9-00000009jJZ-1vtW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:47:52 +0000
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52ff0b7c98aso45751191cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788886069; x=1789490869; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wg7dqcSt6yfLp94UU5Cr+hhthqJWmJ7c1cnnv4D4Hxg=;
        b=K7UExBR8QalSiZdQDK3g1ckfrmVLS+E16tZ4PFdjcsDwilKr+rphkX3vBFnYE/yTg8
         GWI1LMBvkwUVZCEFKTKqLRptPffiAJOwO0hI0uAQuK0vDY/qzdVXMTJAJCsrWOmfEUFr
         nQadvSIGRuxkKkeUug9vtB6MPIyjdsR0tMKkWRv+Mc68pUGlxDccPsbibkZ0rsnAHWA1
         4MyKulBVoqvM8A6VhXc/PgIMbJBvyZBpLVk613RSM8/dAosCdv5HDM6XJv3W+pq+HJkJ
         6LRMczjb2/80upu6NibAc4PHu21MppTqTSyHQhes9/6fTroHpceFOEf6KB8TgZVIMiua
         miTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886069; x=1789490869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg7dqcSt6yfLp94UU5Cr+hhthqJWmJ7c1cnnv4D4Hxg=;
        b=lnlJLOa/uM5FJWCxi/r144tKCaqJkHmE9mo7P0zUJErnAuPYJK9uy+bOfoX3GVOXIK
         40WPXKgQODEghyN8OaJ4Z4DLLsQteQkJiAAKKcpB9oSFP5EDVHi7L/lrVnVfUMX+HxhL
         zV/k8Tzqz0EskkQKG/lFObbtC+m2W24YZDi38Zjt/chBmuCFWcfodtMrVCGxZQMnXoHq
         JZl066M/qAoBUEeUZfE6eb5rxc6XsNcQ0wKK2i59ZCTVikWNj9EkF7ykv3z+6GArA+tg
         03GPo693O174edPyhdorFfWQ4lC5zYRVx8m9NCb7EQrhu942YaTd9ZExYzzibD8pGNlO
         dv/g==
X-Forwarded-Encrypted: i=1; AKwUvBwg6BhPT1AL94kelYXdWyFgwuOqk3uGV3YL/9HKJswJ3MHwHUTjPsp5a28r5lWcQYfRN23CD31DIXsB4gjm0XBx@lists.infradead.org
X-Gm-Message-State: AFuF++m7m1M8uJhTLF4kYTc9HgsrbTfC4j7okfLAlam+yCkfkMlgtxH4
	RNeVTGneoukFLX9vTOxXOK4/Vf9GEpfy93G7GDlg1jHgMy5DV3Uv9+Z6Yue4xl8BhHI=
X-Gm-Gg: AYBFou2ixeJUYu1K4peGf4O4mAc0UpJq2p1FQqevWyJ9MiBRLc/MUCIW/ntRbGxmhcE
	Gv1H8srH7LPoSC0X7pdwVR2ode+5QsoPVHxzh/oBFy4ZPYUhQ+f0IsWeGH+gjlNg8lnIS67YBTR
	MXTePLF9Bmlu5Um27J4bObcD085xn3PAVytzPb8shPiM+S0xg0i7dUNBZuVK9zNdmJc5E0ndyu5
	DMThxpxQ0V1mfx5ByxfLXwi6M6Pknk0XAfxOUSpTmhtLVvENiNpiuWUVauoige+/OkJ8IwdyY2I
	QbMG89lCiO6gXGur0skFy7ncbNpwPXm9oo8NZIimt8JapvFAfrbczlugEp27mPqCSLIZ/U4Lz3P
	hlTYPqpqbLjEAZ7GcWWwaQ8Oxj03qERNaVZ6G5dvyAqJgKrqskqKBokNgsh2mhPGVoFaH0jycK2
	f2c59kkdqVVXWYtMetQGT0fS48ckDsSF7t2eJ6BbCQTfI1WkNyT9RjAEIPTCTd04kYfS+go0v9n
	f9q8UYHxMGycLNc4n+Zl3HqlNdndgv9Fo0wE3tYxDw98g==
X-Received: by 2002:a05:622a:258a:b0:530:430f:630a with SMTP id d75a77b69052e-53054a1f457mr350385211cf.48.1788886069109;
        Tue, 08 Sep 2026 09:47:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a908sm117296241cf.4.2026.09.08.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:47:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x3yz5-0000000ECD9-00Dk;
	Tue, 08 Sep 2026 13:47:47 -0300
Date: Tue, 8 Sep 2026 13:47:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
Message-ID: <20260908164746.GC2543240@ziepe.ca>
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
 <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
 <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
 <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
 <CAE2F3rAeq_CPeaDxuh40v41v2f=68oD2TqK9DYSPKz9F74kqeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE2F3rAeq_CPeaDxuh40v41v2f=68oD2TqK9DYSPKz9F74kqeg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_094751_551017_90F06168 
X-CRM114-Status: GOOD (  28.17  )
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

On Tue, Sep 08, 2026 at 09:36:35AM -0700, Daniel Mentz wrote:
> > > That said, install_leaf() is shared by other callers that reach it through
> > > ops->map_pages() directly, without going through iommu_pgsize(). panthor_vm_map_pages()
> > > (drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_pgtable_ops via
> > > alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consumer, but does its
> > > own chunking with a local get_pgsize() that only ever returns SZ_4K or SZ_2M, with no
> > > notion of the 64K/32M CONT boundaries. That can hand install_leaf() exactly the mixed
> > > iova=paddr=0x1000, pgcount=34 shape in a single call (panfrost's map loop uses the same
> > > get_pgsize() and hits the same case). So the prefix/aligned-group/suffix handling in
> > > install_leaf() is still needed for that path.
> >
> > Maybe other people can chime in here, but I feel, from an API
> > perspective, we should have only one way to make of use iopgtable. I
> > think we should just mandate that users honor the updated value for
> > pgtbl_cfg.pgsize_bitmap (and pgtbl_cfg.ias) after the
> > alloc_io_pgtable_ops() call and then choose page sizes appropriately.
> > Otherwise, we end up with two pieces of code in the kernel solving the
> > same problem. panthor_mmu won't be able to take advantage of the
> > contiguous bit until it gets updated accordingly, and that's ok.
> 
> On this note, I want to point out that I tried something similar in
> 2025 (see https://lore.kernel.org/linux-iommu/20250430231924.1481493-1-danielmentz@google.com/).
> The feedback I received from Jason at the time was:
> 
> "Wouldn't it be better to use the pgsize_bitmap and rely on the core
> code to indicate that a contiguous page size is being used, so it can
> trivially set the PTE bit without doing all this extra work?"

Still think this is right, Panthor is not using it well if it doesn't
jump through all the hoops. Probably there should be an general entry
point for map/unmap that does the right stuff for the DRM drivers to
call.

Jason

