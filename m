Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE2BC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=; b=Jr7S9BY+4/plCE+fwamoii3Ska
	V3rJYChZ8R8eRqME75yoylpzpaoSHEx6EBD4xrAps+g9jZiGbP61ilTHCOzXc2zIaLSp1gVAOV20L
	xoQrWtdSV8LPXulilKo2NibuXOySwFaOmTPQBE7ylYbPGA8r1hAlewI8Y5wo/h4oBknjtN4d8F/Xv
	LWUE4LctZdwF6LyYIO7rKkK7sJN69YbymMpv1TqGcQnqh6RqT0SuTuj8O+Oc5ffuFqHxyFXTHZNFo
	/ZuqEwG1A4x+e8ZXOwX4ShSPODbtLHPEAPIlKzyTRXzqomdQwggNqmKFDVWd3cbl5tnjxa1uDUzbs
	Rz+8SCxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94GX-00000006C4e-3YOC;
	Tue, 22 Sep 2026 17:26:49 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94GV-00000006C4E-0UWx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:26:48 +0000
Received: by mail-oi2-x11.google.com with SMTP id 46e09a7af769-80a71781323so141797a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 10:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790098005; x=1790702805; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=;
        b=Eg9oBtm7390Fkyddq8HLDt03rrygeGf6vZ1MPk7ZryOqFd2IIc5GObkBA1vYQfNXCS
         /Jz0TNumWoMvjHnNglxUUFCvobrwJQEebqVeXFcuZ7NMu0Jk1jOMyzlsOBoQelJPFWHb
         CFnWXNyNzGnxlCPtZYM+bXkNK8FXMkLeQmpE1qCCr5QGm63fuvmYcBGW5ZM8TPaxMEkM
         Iy7XGOO0hr8ONx0LbvdFsIsAZuGbWHHJ05sLzWEbopcPkdpb5tvmNh+ydS1VsLIz49qq
         KuLeqvH7gJvPKwhR+a2HD4om5EBbnChoQPn5d3lExNNPzwaa6FjgJZz7QHisz93mezZy
         68yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098005; x=1790702805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=;
        b=ub+W0PrPiyKgPnETgDO8BDysvEdwY/fc0PEFoddyJ0WEAsqUevuNMdDCGEWuHy+NoV
         ANcpMXy2mUjFUR6/ucyUouLVxj1dvWcp96D8i05fIArIEZB8YUh1sD5AyviGG09pfn8+
         /vHHqK5ymRP1X5w88/9ChURzuu+VaI2SbfpJveA0wXsdAAM1ou3Lh76mzmLtxhV/2rHt
         FKmN5fGoEc+U13FO7mD/ZOOEUsbAn9rH6fkGrO7lHZ5adQ33TY8uhVX6bKq+It4bRx7b
         l5mcLKXD9zBnofa6lvnKPKHPM/AqtnTdX4xDmX3t4j2LLNaA+Ew5Ht4I4jMk/Rf10jGH
         j6Tw==
X-Forwarded-Encrypted: i=1; AKwUvByM9GnpJRkv2vi5nqHaEBrW6s55K1bSZjGXo6fW1lR5V582m0+46p3UdkwCF9MOxgoS+ZyfbzzQrNVa3iJQToSB@lists.infradead.org
X-Gm-Message-State: AFuF++k7LIBKAI6qjLQR4XbTCvxhzMMWR7H4yrgwNiQLDL8Dh62e5V87
	AWAcGtyPdwsxgPxyXArUqf1esHk4flPt0f/CxdGP8U5xfoYtMp3lWqVD9TRyOuz/pVU=
X-Gm-Gg: AYBFou0fjoN2V4F03eFehBzWKsEsg/4XiXmotfLcC7A+4/lLCF/aJsKB4+9rQiF0wMH
	3MeFCooy5gSus+mhUZam1Ks593+yUxPuN5Hc/AhztImHRSRoNajW2dWy96FiIGNXKpVufigNjb1
	ypUIEwSMTbj8r5pOFwd0l//JYAxQv/aUfGOgjO+CThIO+X8O+FNTkKjuwcr4vkoVL4JUZyLPNCr
	uUzEAyJcW6pS9HV90Q0Ce9EWMB/vg0scESO007xs9B/iH7/DcSWq836CnNXc8REyrrpbBMNsUMH
	Ceuy8F+yAX5S39l82drLiEiA0uWHUAYQ7lwBupnrfWnVrZmxzReVr6uslvo6MdXrGtnpggaeCf4
	l0CKbldD+2BNlgE6E3eLckZ7PsBQWxOXjbISmL/H6HvcYyWhaI6LvoaAvaptZwdOXaF3sYzktBd
	Ppfxu61K+FTED0OW3VBxj3JwoBlzpS5mrdBAWxF+SdWpGn
X-Received: by 2002:a05:6830:82ee:b0:7e9:e488:3bce with SMTP id 46e09a7af769-815f0071c0bmr324985a34.6.1790098005310;
        Tue, 22 Sep 2026 10:26:45 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603fc79dcsm103564a34.14.2026.09.22.10.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:26:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x93id-0000000AWlt-1Oeu;
	Tue, 22 Sep 2026 13:51:47 -0300
Date: Tue, 22 Sep 2026 13:51:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
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
Message-ID: <20260922165147.GD1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKsFofudnTYpXj1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_102647_247673_CC3863C6 
X-CRM114-Status: GOOD (  10.72  )
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

On Tue, Sep 22, 2026 at 05:25:58PM +0100, Catalin Marinas wrote:
> Does the memset() post sharing logic work for pKVM as well? If nothing
> clears it, we have a small window where guest data is leaked to the
> host.

Same question for RMM? Or did they define that the RMM zeros on these
transitions?

Jason

