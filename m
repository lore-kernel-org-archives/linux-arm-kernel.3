Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400F1CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDAemr4/lmLhb7KTewKWDzn1cjfqOTzFv/5msg8t3TY=; b=blyxCvcm7DA4o/QWEM5pel2hZj
	BngP6I683CFjyzvhqjuaIxJFvo4sm6RmJCTA7WpoW/EBUQ4l05BvRm/h3tHCuH7WZ8cS8MRFadLfG
	MS+v1kQPQNJob6L6vZ4zhSEmY+ijQWOYYQftPZwbuNqQi1dchjHbdIekCSsbTP1RuzDjK3hsV6jS9
	Ri31B8z9plZpYDWLo/RoyHolzDbxzibS5cdIPwga8TGKN93X8rRBSeBvic8BGc5MPGsRfoZo5H2xE
	JDyRurJu2HP145M4orzVlNlpYSI58vuR/Jtfd5009j5dF9e5EF0muv2bFRQZ+H56FFLi0KUn1MpyX
	xHRSa9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyC3s-000000056zS-2Ev0;
	Mon, 15 Sep 2025 16:28:16 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyC3p-000000056yb-3dct
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:28:15 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-765936cbdfeso41092686d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 09:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757953692; x=1758558492; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDAemr4/lmLhb7KTewKWDzn1cjfqOTzFv/5msg8t3TY=;
        b=oz6WctMivEEtF6aAZ1j1+nJsDVX0KBHsukoUY2Uik0EYisddlxIip5GpuEAQ/ZwTsU
         SNWVNlvoby1Fh6xKssA0aiPCjrs+ClFtCe/dWgf74pvU648Ry/KN3wQvtuUeCxuNU+qF
         ubNpReoQEpeB/0Yv6y8cgKBdU71Iq8oIuuNtrdmzFN8W6YjUzaKyFRffn0xfdz7lnNtw
         xWQUNBwnnQcIoCfx/2Br7CblRBs3RPKh1ypgSp/MMPQbEUctu+Jc/s6Y28DZoEnv3xj8
         in9q03BbvKG1BnTPRpVwzoRuCU2EdvvQhWWl476iacckxlCrkY/Ser0UshQyZoIr5sFD
         ip1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757953692; x=1758558492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDAemr4/lmLhb7KTewKWDzn1cjfqOTzFv/5msg8t3TY=;
        b=VdYOSz9MpxL9WG4zro/2VMWIjFyjlFY+9RcDvm0fIfQpcG6KG/9dJkOS+7CYlAjuwO
         4B29LvW0MN0OQ2SwakSaySVfyCJwWvOXqO6VoJNJPX8ZF9FzE+RAjpksD5OCZZWA0/Mw
         xh/+yOVu/U4rCb38iQ9DDRCsFVrEy4cxd75f/jhcGUjkpq1ArULrqMBjNLJfifO/+Ima
         zqowjDMarr+LdvP46JIJ9Q73IJ/rkwXynGxowjL1SRrMvIAtiPoahOrex+ttqxfRNm9L
         zaN5986AWw342FdbP9pNuVGs8i6g/BmIHiItWH/x8JJf7hKYfqcSdiSabVQ0SlrKqtEX
         cnCw==
X-Forwarded-Encrypted: i=1; AJvYcCUdF3eptCz11x/t7FwAkg+mLQbnE+BF0lruywdLSxR8v0/WY0db+kToWSK95gBEwefxJQ0sfvlnsXGO84wx/AC8@lists.infradead.org
X-Gm-Message-State: AOJu0YxjekWYV4Id1jF8VX5zp8voclEZk9zsV8EqrdbjTRIvR8wP6dUc
	02YmIIWNcTn/zaIRL2I671uaWKcm0ESFExkia3eYMaA12lp/ubybZT3FIcakGxFY+eE=
X-Gm-Gg: ASbGnct7Er5YPd1owp5z82Ke3EbAFcOPmw0Xu5dIqKJ+d7GVczQAFgSZwawz6W799N3
	Jd9Y3PRgqAYU3+oebLims5w2ldIbyVn+SQWPxqYfUe9ZGeLDel93KIkhTToeGVantV6l4zz8yda
	dvBOb1MIslsAXzMoABFdWRRQZWfuF78/TpTY7zKzpaWahHifqILPlnQl6+TKYZX+oufesQQi+k6
	B0t48eVSQOjfXxrQ7k4n/spgsUxfsjKsgSwgVSr+fCO6JqYIdoxNnXeNnY92qxVEyXDzU4LoSXh
	oPfHenJVELuMVzZRtV80aONIyRa8iUX1Aju3Gv7VqaWz5Wh0gPNEiSrWBn2WHT9DIKtynmr22yh
	g/jKGubDmUCOS6+3o4Q==
X-Google-Smtp-Source: AGHT+IHXUa+XyZ1S/pis0/NjQwmdYj7V5DxWg4goJxyPrDTodTnzzzbHD2bc6ZPRF/QWzQoUXXlmuQ==
X-Received: by 2002:a05:6214:21e7:b0:784:4f84:22e9 with SMTP id 6a1803df08f44-7844f84232emr43875496d6.18.1757953692165;
        Mon, 15 Sep 2025 09:28:12 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-76e576ee0fcsm55860646d6.69.2025.09.15.09.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:28:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyC3m-00000004TCU-1UNv;
	Mon, 15 Sep 2025 13:28:10 -0300
Date: Mon, 15 Sep 2025 13:28:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: will@kernel.org, robin.murphy@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	yangyicong@huawei.com, wangzhou1@hisilicon.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com, fanghao11@huawei.com,
	jonathan.cameron@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH 0/2] iommu: Add io_ptdump debug interface for iommu
Message-ID: <20250915162810.GI882933@ziepe.ca>
References: <20250814093005.2040511-1-xiaqinxin@huawei.com>
 <20250902161028.GC184112@ziepe.ca>
 <f2720f17-5e81-4f69-aaf5-791b47973178@huawei.com>
 <20250910141547.GD882933@ziepe.ca>
 <bb4c3f0b-06da-46e6-9769-efe3dc00e9fb@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb4c3f0b-06da-46e6-9769-efe3dc00e9fb@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_092814_063308_C5C1E2BA 
X-CRM114-Status: GOOD (  24.56  )
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

On Thu, Sep 11, 2025 at 10:08:55PM +0800, Qinxin Xia wrote:
> 
> 
> On 2025/9/10 22:15:47, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Wed, Sep 10, 2025 at 11:20:08AM +0800, Qinxin Xia wrote:
> > > Ok, I see, my colleague Wang Zhou also released a version of io_ptdump
> > > a long time ago, which is implemented in smmu debugfs. Will recommends that
> > > io_ptdump be implemented in a way similar to CPU page table dump. Using
> > > debugfs to expose the data and using format-specific callbacks to implement
> > > specific data dumps, I'll talk to him about this as well.
> > 
> > I feel we should have a iommu subsystem debugfs and per-iommu_domain
> > directories to dump the page tables.
> > 
> > The smmu debugfs can report what iommu_domains each STE/CD is
> > referencing.
> > 
> > This also needs RCU freeing of page table levels as a locking
> > strategy.
> 
> Thanks, I'll add RCU in the next version, but there's some
> confusion,

Please don't, RCU is quite complicated, I don't really want to see
attempts to retrofit it into the existing page table code. This is why
I've said debugging like this needs to go along with the new iommu pt
work to consolidate the page table code.

> Do you
> mean to create a directory for each domain? like：
> 
> /sys/kernel/debug/io_page_tables/domain_xxxx (xxxx=domain addr)

Something like this could be a reasonable option.

> tree domain_xxxx like:
> domain_xxxx
> └── group x
> │ └── device

Though I would probably not include this information..

> └── DebugFS file: /sys/kernel/debug/io_page_tables
> └── Operation: Reading this file triggers the entire debug information
> collection process

I don't think we want to dump every page table in the system in one
file.

> Do you mean that the interface in io-pgtable-arm.c is directly invoked
> during the process of obtaining page table information without passing
> through arm-smmu-v3.c?

Yes, this is what iommu pt brings.

Jason

