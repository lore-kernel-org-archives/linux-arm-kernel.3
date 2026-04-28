Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F81CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtKZrl1ncUKjpwUZZLwbMETV3BCwK5wjjxZI3moEtBQ=; b=VSOooy1V7JOjxBeoTR3H7kSwoI
	t2fY7LJGK8MP6sAaypDqgj7jbV2a/qWj6NcddNd33RTX/qP17irV0j/wku59UYuLzKtLa2c+YiBJS
	Q9ZEGsLr3WRUjH0RPBo93ggrC7C9an+RNED3xhsn5EZtHzUVyoKiRA3X6tK2wFjSXGkGfrL7sSJ3E
	lnjo3O4W8gUiI3JdO41+TW5rWFQZ3hEF1mBIXPnr1ikfjHjoBoVGM1zlTQokTEoEwYTgylm1cM9nK
	6fFkwmF3oaWnVrVyEvRDKP3FAgIeA48TvM1utuEP6rAdlUYvPehnyzDy9+O8jrafP+3JfIDvJiIoh
	QlFfWHYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmTi-000000022Ya-0gO1;
	Tue, 28 Apr 2026 17:44:10 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmTf-000000022Xr-04c1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 17:44:08 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8f0579401c4so778418685a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777398245; x=1778003045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RtKZrl1ncUKjpwUZZLwbMETV3BCwK5wjjxZI3moEtBQ=;
        b=STZUGqBJ09UeEXlFA93Zc8QUQRuBRLKkX9whEasTl1FiZsHmQloXYgNx6NENWkwhBY
         C+xbbxhWYBu9So/58qbIU+dGWpHs7CIi9T1grvHQfUfMtGGmWKwgm6QeNr31K8qFKOo5
         8sepSXa2ltaSGJEgkpg2YNx9hRfrlQ/nCvExOPXy/GFClxiizE0o16mjhCoQCoMJRyJc
         s6EdvSCgHjZgjMi3SHcI98vf6kuIZuB9FBYlZ2Fo5Pna5OSNASLQIQoHOK1ORXNds/6q
         p/YHDmxbsbr+a/wd9+iG5DI6Wv6HghzOGl5AtUoo4CvSmHM+SF/b4KdlRxF1ec+OsYkX
         OyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777398245; x=1778003045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtKZrl1ncUKjpwUZZLwbMETV3BCwK5wjjxZI3moEtBQ=;
        b=ZZOFyYjDJm6qNNMSMtAOtErGbLU/PGi1OhkLwwZ5ylNMhKhKnI8htYYoKC3AnetRM2
         pUUtAqXskR7jBtQDNOOMhKLeZH+5yhYBwl0rpKSFWUd7zODX51C5keAuIxn4gdpEEBtA
         myjNWUBFxgisFCxldPi5uEHGaeO5ogbC00307J2Y/qt+ehvbK36Bq8ZskF6e3b2e/tVO
         m202JbnWnG/rq7Ooihmj8AbK8qinKGc5m5JID63wCulvZ+/o3ClsIUvDVjFlbJkFin4O
         DA/D8427w3zZIjDNOEb4Y/Uj49wxPKQP8vFQXyjuVAywF8/jp2dL+8TO2NVBJs3+D03t
         /WqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MswyKrqkuYOvJQGa9R2oic4pBvAoPUZIkPTTnivdBLyEmp2wKsh2u7Sk73zxXMBYkGlTOXNHJidn6wphsWlbQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyIPPAWXBktMZX5Nfi0HZ4ZuA0mURwAFQmXoGSW7vK5ADW27C/U
	3VmkV+24gUd0NxUC45DLuZF0bOGFbrjMLMddTGjH62hlU8BREaGCKFNLJ0pfNmwyvZY=
X-Gm-Gg: AeBDiet29VPNPSgsdKaz0ipl9BXKcOxn2OjVMrRiazTxNDYrcs2687xXYcwV5gVElLP
	z1vZMfu5OkFVS61vhuvwtGjeHZ1/TgUSP9Zl0aYLzqqD+4nFS7SY8m9ytP2TUuHBdSbNB8eakZf
	Y3Wn1iZc2VzGIJaPf86KLqRAOcR5ltuWw/vqRpiSk95aTYi7Zt8Sr4VnS+L55KeaE3rAQw+O1R6
	4BhzNGu2vdVo/OLqxY9TvKOy2KXPlA/PrfbLoBmYOETJ0l88yEI5uQ03gTpoFW7+JaKCJfaEP+x
	tgzzGf9ui7oQ242mCR5aV9Y7k/PPdKdz7XNdibjbE0szrk/yewBbVukq2LBFZSMviIIJnV8UWCJ
	+peipZK9LbZ3Q8Q+OfkU77p6ErhbZk+STJZh8WdN52k+YDuULygY6+hyuVLfDaccSBPbUYJRtAP
	5WAGR65x3VgW5k6JBC7Fh6FMZ+HTdjc8RAxfPadeVrhRfEnXZRfb5pwMhfbHNWx49l1ZvrAuaZX
	kF4l2O8j27XtAos
X-Received: by 2002:a05:620a:6ccc:b0:8ea:c7a8:5072 with SMTP id af79cd13be357-8f7d6e43f26mr522395085a.8.1777398244779;
        Tue, 28 Apr 2026 10:44:04 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c87acaacsm247411785a.43.2026.04.28.10.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:44:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHmTb-0000000C6wg-3fSo;
	Tue, 28 Apr 2026 14:44:03 -0300
Date: Tue, 28 Apr 2026 14:44:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Cc: Joonwon Kang <joonwonkang@google.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org,
	nicolinc@nvidia.com, praan@google.com, kees@kernel.org,
	amhetre@nvidia.com, Alexander.Grest@microsoft.com,
	baolu.lu@linux.intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
Message-ID: <20260428174403.GK849557@ziepe.ca>
References: <20260424085339.3503582-1-joonwonkang@google.com>
 <e9de1b01-d075-487d-a00a-e2420b909f69@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9de1b01-d075-487d-a00a-e2420b909f69@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_104407_081544_DF38785A 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 28, 2026 at 10:38:37AM -0700, Easwar Hariharan wrote:
> process address space, and would break the DSA<->IAA kind of interaction where the
> device drivers can communicate the PASID among each other to operate on the same
> process address space. 

That is not part of the Linux model...

Each device has to get its own SVA and it must use the returned PASID,
not just invent one from someplace else.

Jason

