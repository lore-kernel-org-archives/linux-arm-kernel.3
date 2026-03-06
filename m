Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29966FCC062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 20:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/ru0EOFkc3AcpS21XeyDwquZX7JMKMkovV4eRQ1jis=; b=kRn1ZZq3gJMrz9RvRrEQt4WAk/
	+QKmTgAFmppCxzDTuKvCLBI6WZ0sciM9hl5WvEP7Gc6Tq8JUOGf/XGVk0LiRW55EU4deQRX17CdEd
	2LBFhXrUL1FtEYVQ84kA02U7YGHqtLNVmJzAmOb5E7aey8xmDwRbXGrYGR9IfvVmjV5h8eExzxu6W
	hHzBUzYIHr6d5XhIJx8tu4Exa3yjZAnZ0ImeEWMhm4Rw1jZCBuiL75HslNz/WrK27rA0A3jKPASRz
	KMe1l+4DASWIinT5rdPmd5I6ztLzWdKm/sU82FG9ECQllP4WF1KEzWIQ4kyZrGwfamcL6OAV0cVzb
	HczklWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybgf-00000004TM0-0JtL;
	Fri, 06 Mar 2026 20:22:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybgc-00000004TLd-3AQm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 20:22:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ae3f822163so13525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 12:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772828534; x=1773433334; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N/ru0EOFkc3AcpS21XeyDwquZX7JMKMkovV4eRQ1jis=;
        b=T8IRbM0d3Q8xiTIaCGuxfJwKHvDU4X/OhIb2ZS8AiyICUyk9zfXQaji+QsV6sbBcyA
         zfWMYlLtyWU2u3GdeaD6AGwvWZ8MCfjBN1OQv4MPu6wCiClSMG3s02Q+gO/YI+Yc+dbb
         W1reHA7PdfDBRBQUpHnta+bzIP7l2f/QJsNwJzJhhUIrJ0FiyE523JaGoUKAbfk8beS/
         oF76kNsW//M4r7HEvYM+s4m7zfUG/ZpdlE+FrUYQCG3VLl7z/EY2m2SLXshlHfkAqHFf
         REglJuS66kkBbjSRIO27XcB0RNTz5K1G4oStJOxvV/Np9h70zkC6+MaLMEyR5bX5xjRH
         sL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772828534; x=1773433334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/ru0EOFkc3AcpS21XeyDwquZX7JMKMkovV4eRQ1jis=;
        b=fml30NR3k1QQ9VpmdbxbNJX/O+D42kJQVxEcncuI0HFIA1zms6dNSxLWV706Vofmbr
         rnGB/peSSZJF2WQAZ97jrzWIiwjfir1TXcN1/9BX4bGa3pVQr+1obB9JeVLzLth5LMAx
         V216xTWvASSrIvRp/dj/OCyR2xeXM/ccUqa3O2SrC4uToazT0doxRrwm1pmqRIPGlSeS
         vassY/rwUakSx4OXshbMLMQtdIKXuX+YEHDXGKcxT+XU5qnbveNyWSgexeFRPfVTvHl4
         bMHZodINBbaT2iLupesngQUayitvbbleZm9Pa8zElyv8jL+8AFXU4gaWq9vMHnzPH/Up
         YEUg==
X-Forwarded-Encrypted: i=1; AJvYcCWHJE1YgKEVKMRKZyH67rrj7956F+pFWGQswCLxUz5zfmEPBS0q4ZItXifPodufGK9J9OLG47wBfOHUTcUHvEkP@lists.infradead.org
X-Gm-Message-State: AOJu0YxJvdNBBvXEzMhugysiwDL1Ukr4/xIowVWX1ZDNjLNZxBzyQZQr
	XHOwmI8AK/zquiSVQdVSJWXVpbX1Xz5gBXZToR8rLlHBCna7lMQNiDA9x52jyDoQjw==
X-Gm-Gg: ATEYQzyhU9ZOYu7pap368FfQIx0oMlR6gZLYyJfyZ9FhSdV4pG6s4dkxRJHwp1BFcgP
	grD4a2cWeOkaNsq/l1DiXVCrXFmFV4U4OF/+UlCPpjcOYoCwhjqe3DiMCPwhJ4Fiva9QCWH7Ghm
	8w4DbEf6sbIbw77MWHK2/ZbEAE2BTVk5lsX87i+YcdyYxYJ22OhdeEGvRmQmgWemkFXxrvqmvkN
	YEeD4WbmaR8s3wnKuA6+xdsS4D42WrXM74/NgPeoPUPIpwofjkmkeLHK7VbOq1WsMnzz5InGbKs
	ISPecrnV2qsOVpVKYEHXFHiZ5FaNRoDRN8KHMYTZktSKSnUh05q0SHJfc3MTnT4ehhAUMxzGZVr
	b8mcgrmiMFTX+0K1UKzjLGGVRwQ++KZ+imi2Ey/fmfpuXjpkXk0B5tXXLHdEkLPHTj6eSsCcAET
	NXbyfk2Q0LUo1bgA5LqpvtXaLobU8Tw4dr/xjQAWT59mf2sEN/r2V+8cFd8A0Vcg==
X-Received: by 2002:a17:902:e84b:b0:2aa:d604:62f3 with SMTP id d9443c01a7336-2ae8ad1ceb3mr443415ad.10.1772828533274;
        Fri, 06 Mar 2026 12:22:13 -0800 (PST)
Received: from google.com (168.136.83.34.bc.googleusercontent.com. [34.83.136.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f7837bsm28280845ad.48.2026.03.06.12.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 12:22:12 -0800 (PST)
Date: Fri, 6 Mar 2026 20:22:08 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	bhelgaas@google.com, rafael@kernel.org, lenb@kernel.org, praan@google.com, 
	kees@kernel.org, smostafa@google.com, Alexander.Grest@microsoft.com, 
	kevin.tian@intel.com, miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <aas0dLwKmZyL_iOL@google.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <6416b7fe-0190-4c7b-9a62-5da7d5eea794@linux.intel.com>
 <20260306130006.GF1651202@nvidia.com>
 <aasmWvA-sqi0KJwO@google.com>
 <20260306194312.GL1651202@nvidia.com>
 <aasv1HYOKuuJyi1k@google.com>
 <20260306200321.GN1651202@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260306200321.GN1651202@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_122214_858375_04F337AA 
X-CRM114-Status: GOOD (  30.04  )
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

On Fri, Mar 06, 2026 at 04:03:21PM -0400, Jason Gunthorpe wrote:
>On Fri, Mar 06, 2026 at 07:59:33PM +0000, Samiullah Khawaja wrote:
>> On Fri, Mar 06, 2026 at 03:43:12PM -0400, Jason Gunthorpe wrote:
>> > On Fri, Mar 06, 2026 at 07:35:19PM +0000, Samiullah Khawaja wrote:
>> > > On Fri, Mar 06, 2026 at 09:00:06AM -0400, Jason Gunthorpe wrote:
>> > > > On Fri, Mar 06, 2026 at 11:22:52AM +0800, Baolu Lu wrote:
>> > > > > I believe this issue is not unique to the arm-smmu-v3 driver. Device ATC
>> > > > > invalidation timeout is a generic challenge across all IOMMU
>> > > > > architectures that support PCI ATS. Would it be feasible to implement a
>> > > > > common 'fencing and recovery' mechanism in the IOMMU core so that all
>> > > > > IOMMU drivers could benefit?
>> > > >
>> > > > I think yes, for parts, but the driver itself has to do something deep
>> > > > inside it's invalidation to allow the flush to complete without
>> > > > exposing the system to memory corruption - meaning it has to block
>> > > > translated requests before completing the flush
>> > >
>> > > Yes and currently the underlying drivers have software timeouts
>> > > (AMD=100millisecond, arm-smmu-v3=1second) defined which could timeout
>> > > before the actual ATC invalidation timeout occurs. Do you think maybe
>> > > the timeout needs to be propagated to the caller (flush callback) so the
>> > > memory/IOVA is not allocated to something else?
>> >
>> > No, definitely not, that's basically impossible, so many callers just
>> > can't handle such an idea, and you can't ever fully recover from such
>> > a thing.
>> >
>>
>> Agreed.
>> > > Or blocking translated requests for such devices should be enough?
>> >
>> > Yes, we have to fence the hardware and then allow the existing SW
>> > stack to continue without any fear of UAF from the broken HW.
>>
>> And this applies to software timeout also I think, since both have same
>> end result.
>
>Any situation where the ATC flush doesn't get a positive response from
>the HW must fence the HW before continuing to avoid UAF bugs.
>
>Obviously today we just succeed the flush anyhow and hope for the
>best, and I think that is a good starting point for VT-d. We need at
>least that to build anything more complex on to.
>
>Fencing the device also has to come with a full RAS flow to eventually
>unfence it, so I wouldn't do it in isolation.

But do you think doing the timeout logic without fencing would be good
enough? Currently VT-d blocks itself, until it gets an Invalidation
Timeout from HW, and system ends up in a hardlockup since interrupts are
disabled.

Are you concerned that if fencing is done without an RAS flow, the
device might not be able to detect the failure (if it really needs ATS
to work)?

I am thinking, we can do translated fence and timeout change for VT-d.
And the device can use existing RAS mechanism to recover itself. This
way we atleast make sure that caller of flush can reuse the memory/IOVAs
without UAFs.
>
>I would like the unfence to be done with a fresh domain attach (or
>re-attach I guess) that just rewrites the context entry with the
>correct one.

Agreed.
>
>For VT-d that probably also means it will need all the domain attach
>fixing we've talked about as a precondition too.
>
>Jason

