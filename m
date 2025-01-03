Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5999E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1YRhiBcjzePAFHkv66VCQ/BK2Y0AMCZi/UgyHe1DBM=; b=L8a+s+8zB4DlA72fes/5UwnDPa
	O659VB6V5VFL/hwWMWJBeSa7jRsAvFiGIxFnPAPe9pz8o0tNyMAawLxnXZGh8ROELQ4w04pMHhsh4
	gxqQiqucVhrU3NyAF8kkdVeybFYhex8FxBxxrPJudqrCTYxYQkwBkPQE8HaNuCheW3LAfAf/B89uy
	2GrS/OEzkZRCiA3KmsOBmVWXyvzOOAmg0Vhp5TxlSYl6Nc+YRHMRzz6ncEvB2CK67Yh6CRq7loyq1
	WQpXYkuIDxo7fSiGFl7zF53fmI52uyYocWBH94JLkoA9xfqpa4nXYP/Mgj2pDi3NdSt6+0aIMmGxk
	8Of9qEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjvG-0000000DKrF-021T;
	Fri, 03 Jan 2025 15:49:14 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTju3-0000000DKjc-2q96
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 15:48:00 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6dd049b5428so103633986d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 07:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1735919278; x=1736524078; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x1YRhiBcjzePAFHkv66VCQ/BK2Y0AMCZi/UgyHe1DBM=;
        b=bjgXQ9/lROwsQAldrAf2Vc2VbZYJVIp9OTHEbkQtL8qnuM1EdadJ4LgT/lsyBrkW01
         aEsj51NR1zimtDkmucUbBqSmqxTQHXKvSsEOsLXZ+dLQAJAtK7of4b/chzvVtd82psGo
         C8QUhhACE7m+Bgme8cGDLOxRLwHyiTP6vAx0r0DZUzXhFeYPgRxeZMEtPjLXxmqgwaXZ
         mQmgG7zSNUDlCfiryPx97vyRcljPrdBvM6J8Aq8e/1hCLS+hGg8oDyIoEs7p/DGNNaWf
         kTwycYZYGEq2gOTVGlnV6CsjzSmemQQc2imk2drY6llNwB8s+cwv3iBM5eP6VsDA4Ybw
         A2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735919278; x=1736524078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1YRhiBcjzePAFHkv66VCQ/BK2Y0AMCZi/UgyHe1DBM=;
        b=qkhkBTPQZMkqB9IOuHf0ABBE0OyhDsGJDy1GLFQBWZzBEnegzmGIq4M12sdb8+do6X
         8GCZ8MrUQXn8GicK42zZQUozc6qMtaDcwJ1t6nKRjtmb4amZ0NG0wR71Fxq2VRIqIGK0
         UkQZBxxY9+xT9CSfV8ce5ywgK2BPrdv3WEuBSS20WWTKii1hgpwn2aZJF4FyKtvEAbwI
         HfnKkkkss1DqdJ+cnmNo1ao1gzCqPHhTDTzqN5vauwqWi7KkDwWljQmudoOl5j5tR9ER
         4++7Y6V2zr9n1YjHeTx51VV5p05/+lUp1x7m2iEa2ub0OdKNlnhjI33khcLq1hoJNreu
         KtjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSeArwGrwd+yj5y8SBa2E9xwe6qXyDz1AZrllM4rSa89soTbNi8seaL3p63IMrj+1/J1naPOe6SAzNA/ZZXYM3@lists.infradead.org
X-Gm-Message-State: AOJu0YwnZhhm4zQi8YyXOovFfPA+UzYVJrg399xZpyzNqL6Ed7Cie3BM
	JiHJX4PyBibM6gY6N7IAAZox0600ubVHQRXYsU+Hh47xAfyMp8va3ZWyDTcdzbk=
X-Gm-Gg: ASbGnctjvLcaagolVS5QjZBEKKrC9TWXweKxBEOlsPG/5MDlzBrDdepBOKFI+CRB7OY
	RiTozi8OU9e4di0Trb8YqEzhjSmamO9GlZf2ACbvJQIMWM5RIjuU4jikFLsqs2tteXx27iuUsBF
	0gtg6mnZ1PrncUgq0c7VtonDx7ZuYzl/onfO8ISaxIiRTpTeaY8iLO9fOR8lEF9muYb5tElfmps
	vhKlA7kanAo00tYLEmoLgSDchwMgGrmeUV5FA2rTXT9bWzkmrApSpZrfeLNdqiy1Uy1jGrVXb7i
	wcGIyvCm++HOvEqO2GrFD0KoFqu3ig==
X-Google-Smtp-Source: AGHT+IHsMKKIkxQ7rcmRTm1VnxBXPwiUOd3sAui5NPCMrkirqlLHWMPVy74SUV1oTWvKIM353GCAdg==
X-Received: by 2002:a05:6214:1314:b0:6d9:2e0c:56c9 with SMTP id 6a1803df08f44-6dd23308374mr932119066d6.9.1735919278451;
        Fri, 03 Jan 2025 07:47:58 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd31faa052sm120006416d6.9.2025.01.03.07.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:47:57 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tTju1-00000000jEE-0Nuy;
	Fri, 03 Jan 2025 11:47:57 -0400
Date: Fri, 3 Jan 2025 11:47:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	robdclark@gmail.com, joro@8bytes.org, jean-philippe@linaro.org,
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com,
	tabba@google.com, danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 55/58] drivers/iommu: Add deferred map_sg
 operations
Message-ID: <20250103154757.GG26854@ziepe.ca>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-56-smostafa@google.com>
 <ce4c8db4-4895-426b-8d9d-97dc5d74fbc4@arm.com>
 <Z2Qshft8lQjI-x7c@google.com>
 <20250102201831.GB26854@ziepe.ca>
 <Z3gDuPe5C1Uj7y4m@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3gDuPe5C1Uj7y4m@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_074759_713412_B4E0680B 
X-CRM114-Status: GOOD (  11.93  )
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

On Fri, Jan 03, 2025 at 03:35:20PM +0000, Mostafa Saleh wrote:

> An alternative approach as Robin suggested, is to treat all iommu_map as sg map,
> and when the driver gets the iotlb_sync_map() call it can just issue the hypercall,
> however this call only provides the IOVA range, which requires extra work or locking
> as mentioned in the thread, and as Robin mentioned s390 doing something similar,
> I was highlighting that in their driver, this call only notifies the hypervisor
> about an IOVA and not an actual pv map as pKVM, so it much simpler in their case.

Oh, that is much clearer, maybe incorporate some of that into the
commit message.

We are going in a general direction of trying to make the fast dma
mapping path not require sg, so adding sg specific optimizations to
the low level driver is not good.

Batching the hypercalls in the gather and then flushing to execute the
batch seems more reasonable.

You could probably work on advancing this infrastructure separately
via virtio-iommu..

Jason

