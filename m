Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83E0C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 00:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVQkha02xf9SMmtYT1jV9HNI/f56xB5GG/vabKlGDf4=; b=wwF2lqLwyiXgTMdwE1yFgLyEB6
	NsMQ86sWVT/qddqKUAk5572n4wEp7p3qRsrWKh0LHuIYrSfTg5+JNLmlqFbmtHg1WQMxGnTvivSbx
	T16nn4Ag5SRvk3c7mq1qs6Td4zND/HZLmAsmkLytX3zyV6WjAXfwizkQaupStGpqrbx8mcMIQThp6
	fTjAHvGqYQl0yftgbPwbZMVUZ1TjmvbGCk/0L63aeWFuNtPG5DjC2jCwQquW8VEHNUtD05Ah0u4Q2
	7YA+mK+QteZ8GApZC7RHdVW4s3bMtCW/br7bvVdbH76NivSvcZL/PFsDN6I6oU/oL8Dej12d1W8ZZ
	Usd86uhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRKD-0000000EWrZ-03is;
	Thu, 29 May 2025 00:40:49 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRHx-0000000EWL2-3JGf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 00:38:34 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6fac8c5b262so1422856d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 17:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748479108; x=1749083908; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sVQkha02xf9SMmtYT1jV9HNI/f56xB5GG/vabKlGDf4=;
        b=jojGDOSm2GWrYdVQHkt7zpbCQwbcIthIMMEwaMrRe+w+ZzbImrYun1WmMBG02qXJoo
         n7SxUiFTipiAnmPCslmYr9E58hk0DJuP+M2cBoKl667+mUgDB4NnnwNRY86SbyngPfZJ
         ZNBP4rX7Cn1FwIJtkQP7V52xzMPJE60nIqXPMIPxQsMX5HkLVZor5BJoT243FuhO4/BT
         Teth5iyWnytBzU1Jqzn7AIXxMLx7qJEfLUuToc+G3wuJLnjOWxrKHzUxSYMEJ8AFHoZe
         0ry5B5xlTTlqTzlbX9zNXu1nxhK2fzvFQVwjx+zoacH4Wm5cU+T5clYtT1LRIcKyxIAb
         RCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748479108; x=1749083908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVQkha02xf9SMmtYT1jV9HNI/f56xB5GG/vabKlGDf4=;
        b=Chn9Z83dj5CGXetXACYuDCu6Srqk9DxYXR4RA5FmyRarQo0gc2yEk0KU0O0IBjct/H
         ddhIw88xnjH8gQzVMKYcCqOfmlWruSdtvI3QGyaDBBurFm5SeBqhg12vsf7jHXgsiaXG
         oVHbLegl0WqLL8wUgTtYCtfughBfEgakR1HowQXMogw1kHUjCKR1qwE6SnLJdqIMZWvh
         +MmrKOGGClltKNmYJMi+ixS2Ri1X8NKsJ129idRck6O8HLLb7Vdt2A7VhoR4UALsN92s
         wGR4CkJos/hTYPYlfsI/JShbQEApPtlEHYVgv/vc6vxfQrtqQDiHahCpEV3i7+33tePm
         QeSA==
X-Forwarded-Encrypted: i=1; AJvYcCWkZtCC9a1viS/Y9GIIhhjrVRX2Om8AZQsEfLpKZ0TjTYS09BvLIVJbFRYoG9y4VLMvqZuWs1qVhjYY/a5kgD2R@lists.infradead.org
X-Gm-Message-State: AOJu0YyPjXXb05znowhV6GLLNc+HltHa3S2HxbYbpLB3l+2hvn9jOEsP
	oxD+6pEe8NlvFlvSNEQ2bFxYeLNMB9RBnaooa+U5ZrX/wAyILmRuD5ikmqs2s5SAqBA=
X-Gm-Gg: ASbGncudcwXaRgPh2SD4azO+Eyz7QmZZyldY4tLjz76l98/gvw+7pdlWSa495CMvBPS
	o+62hIHryh06ao3Psrbmi3BtzkARFUT9qLl6Gkrf5WJdsxnWWpN8Fy4dayJ8xTZDOh5rr5ZkypC
	RlOWzFBwFxs29SHeWFp2P7r39W9KMWWNWporju7eCQMVlT1ZpNf0tPAXDw2zc5n1MXY7kCE/5J/
	XyqV7yadWFJwucf9Gn3spWqyKnMaEXo5zF84HNiw/gbXds/+/yWSxodjYA7PZDMXsr7rz2zjvF9
	hICoqt2k0BZsnM+zH0M18TjzaVvUY/emTUxwGN4T8/quNrAcrCaZqtAtLO/2DToeJnJGt2DXUza
	fXCezzwLhI7VRPLJ57GSZvlfzNbI=
X-Google-Smtp-Source: AGHT+IGrrQU6seLehXMngMNgswY4d6WsTh2X0qCSzttXJecRsw5bF1myMzmOuM/dLs2M8hI+8CLE1g==
X-Received: by 2002:a05:6214:234e:b0:6fa:c85a:20c0 with SMTP id 6a1803df08f44-6fac85a2328mr4035616d6.28.1748479107982;
        Wed, 28 May 2025 17:38:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d337aesm2521866d6.8.2025.05.28.17.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 17:38:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uKRHu-00000000qmU-32Wy;
	Wed, 28 May 2025 21:38:26 -0300
Date: Wed, 28 May 2025 21:38:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250529003826.GA192517@ziepe.ca>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
 <20250410230008.GA6905@ziepe.ca>
 <67fff12d.650a0220.208c7c.d69dSMTPIN_ADDED_BROKEN@mx.google.com>
 <20250416181759.GF493866@ziepe.ca>
 <20250520224224.GA16365@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250525190703.GD12328@ziepe.ca>
 <20250527205428.GA14019@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250528000425.GC146260@ziepe.ca>
 <68379171.170a0220.191ee0.8d6bSMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68379171.170a0220.191ee0.8d6bSMTPIN_ADDED_BROKEN@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_173829_934401_710F38FC 
X-CRM114-Status: GOOD (  15.70  )
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

On Wed, May 28, 2025 at 03:42:55PM -0700, Jacob Pan wrote:

> > All IOVA that the platform cannot DMA from should be reported in the
> > reserved_regions file as "reserved". You must make your platform
> > achieve this.
> > 
> Just to double confirm, the expected reserved region should be marked as
> "direct" instead of "msi", right?

I don't know, it depends what is wrong with this platform.

"msi" is the SW_MSI region created by the iommu driver, ignore it.

"reserved" should be from the DT and it says "my platform is broken,
this IOVA doesn't work, don't use it"

"direct" is something entirely different, it also should come from the
DT and it says "must be mapped 1:1 (iova:physical) at all times" which
usually means some FW or other component is controlling the device and
doing DMA using that physical memory space which is unknown to the OS.

Both cases would interfere with the MSI so if the DT/ACPI declares
such regions that overlap with the SW_MSI address then Linux should
select another SW_MSI address.

From a linux perspective "reserved" just ignores those IOVA spaces
while "direct" sets up 1:1 translations there. So FW using direct
incorrectly could become a security problem.

Jason

