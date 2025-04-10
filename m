Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF5AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 23:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBiekUdIFmCYXVIVV+7WWzU3nvigAruofoH1gZDVt3E=; b=lwPTfr1QEzxnWkCeAOeGa2pN51
	aD0odJeNjJIeMGI1XB0qhpiWqgcboNfU8GrFSG3uov2DCUhf/z9Amcl4/bZIsCZt2YgLpD8PNX7m5
	gky70NE14L4w2kaa2VfA1EoZfk9iQjl6zBmDUg9iu5Axfws1hvNAMMF7fqZNYXO6MCNb2LMH1tD1c
	XHDxnBK7yNPbagUZCuLWrvVWFwBLhHXZlC9N+zUCbAGDb2gnwjMnUounQWUrEH+r7tB0jYSsm1CWu
	GjqbXXrgw6J1cRjg5/VzOpviDNbVDP8HmeG4/fQaZzIqfIDKV7iUhDmDCgr/kvoes7VwOaWjBf3Sy
	st1DDt/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31bf-0000000C5E7-0sH1;
	Thu, 10 Apr 2025 23:46:51 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Zr-0000000C54u-3TdX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 23:45:01 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c55500cf80so118522485a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 16:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744328698; x=1744933498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBiekUdIFmCYXVIVV+7WWzU3nvigAruofoH1gZDVt3E=;
        b=A6ajED3S77vexLAukqYhEnVSukFr/+3DJ1IX9NkZojmZUyEXZMKUxZURGpDM2uFuGj
         88KdwfIMaJZ6ru/HbWn0jDJLGf1AZ/Zk5GUzgXPWb647pO0FA+6vNWspY5tJzzvP11gR
         OcCHu/8xuJZ75Vh5RiZecrPEf3dbTHtLzcqvXB24b5bXerlorQorqjyLcdgfqk34Hn3C
         NVLKqs5Lr/mgM9npV6+owo/upSGNuldIu7FkY9Ia7BFWR+iDLCiGKOITg857M7qvaylt
         ogBizqUeycvXJmLxmfsxKgIGFmTHDUEMBgh/jLy+lwmvl10wG7JEpXPcD9JgTgcQCOXQ
         hpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328698; x=1744933498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBiekUdIFmCYXVIVV+7WWzU3nvigAruofoH1gZDVt3E=;
        b=tEYK9qtmlCkTOzfcjfuUoOnorNmkv+ATXhMGYp4VmJ1W+vGL5ZXFVKAvF6irBr/C3U
         axUItyle8ekLYqgVje7Py92kVI7NMYKsTy4HVLyEgwDGFl5KWvh185KB9R1oXv/WRK7r
         shFxvc/sIAZywZVQklBZ/YTsQJ3kVfvZbnz57OIohdfzVskC/cUyrD5iz41N4UaX9Jtr
         4GFRa9Sj7jwNBTPnAW/M2vPEUwfLWlsVwi59VuF/akVELnyN36TiAnbbUGLeb+k6t9Ye
         5DWmdddpYoOMoPyGC38WMZCqwiF6ihbhr8GwGNXbigx0tnfVibUDzFdhmAXLl6PuEuoC
         MIOA==
X-Forwarded-Encrypted: i=1; AJvYcCUCuHI0EfSL6XbMWBIlKwgN9vxqBuWpODXKyxpRLkscJidQCC8kP8V0z/YEn/aOLqCeWDoyfzCbu/89a1Y6o4yd@lists.infradead.org
X-Gm-Message-State: AOJu0YwjocC9oYynZ4tnxl508NT3cBg64elZM1qc5hM7urIjKeojC9+b
	2mWu5RQ9PSfCgi4iFzBIYpApdOccWvBtqXpBLoiL6tQQs5cYQOHcraNBdTp6D/U=
X-Gm-Gg: ASbGncvl91VqxShsMCquMFVcU024ePxJl00RkxnQKAfIeZLBnvRF88x3Xsb9Hv+TtAS
	h/s++zAS9awb4GbFT13f/dpvB7YJiliRj9bIk489lF7i4qhMxXDJMo388mppVQEOXLG55RUvKZy
	eps6x0NQhHJWwQvWIOL4vlEZ5XpHatd44a6syljTGg4efGHZ7qPR2IvJfr3TQLvDwnaJ9aPGvdX
	FWZuCzpEUIt6Lkl1Hbj9yh77ZetegN0iXXy+z9WuI3bgkP9q/iUkCiWIUQWA4vngo8lzx2zji+F
	I+eeqcGEgk7azeEN7CBRyIQQ6bzxevH7sVXMae6YceJPJX8IF5qKy0fc58aESC04sgfS8Prt7/i
	RTpJ9h21aQrhsYOUlHLc=
X-Google-Smtp-Source: AGHT+IH4fTle0lZ5BXeT1W/Tk1EOzJKOHLxPsiVRzXbPb/Lh5qnqWIfCqkylbYRbJ/h5OGn56sXdfg==
X-Received: by 2002:a05:620a:4141:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7c7af1137f6mr129267485a.38.1744328698540;
        Thu, 10 Apr 2025 16:44:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8969f1asm169263385a.59.2025.04.10.16.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:44:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u31Zp-00000000N4j-0j3F;
	Thu, 10 Apr 2025 20:44:57 -0300
Date: Thu, 10 Apr 2025 20:44:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Roman Kisel <romank@linux.microsoft.com>,
	Robin Murphy <robin.murphy@arm.com>, aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
	catalin.marinas@arm.com, corbet@lwn.net, dakr@kernel.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	gregkh@linuxfoundation.org, haiyangz@microsoft.com, hpa@zytor.com,
	James.Bottomley@hansenpartnership.com, Jonathan.Cameron@huawei.com,
	kys@microsoft.com, leon@kernel.org, lukas@wunner.de,
	luto@kernel.org, m.szyprowski@samsung.com,
	martin.petersen@oracle.com, mingo@redhat.com, peterz@infradead.org,
	quic_zijuhu@quicinc.com, tglx@linutronix.de, wei.liu@kernel.org,
	will@kernel.org, iommu@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, x86@kernel.org, apais@microsoft.com,
	benhill@microsoft.com, bperkins@microsoft.com,
	sunilmut@microsoft.com, Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH hyperv-next 5/6] arch, drivers: Add device struct
 bitfield to not bounce-buffer
Message-ID: <20250410234457.GB63245@ziepe.ca>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
 <20250409000835.285105-6-romank@linux.microsoft.com>
 <0eb87302-fae8-4708-aaf8-d16e836e727f@arm.com>
 <0ab2849a-5c03-4a8c-891e-3cb89b20b0e4@linux.microsoft.com>
 <67f703099f124_71fe2949e@dwillia2-xfh.jf.intel.com.notmuch>
 <20250410072354.GB32563@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410072354.GB32563@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_164459_867622_14B7EB2A 
X-CRM114-Status: GOOD (  19.35  )
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

On Thu, Apr 10, 2025 at 09:23:54AM +0200, Christoph Hellwig wrote:
> On Wed, Apr 09, 2025 at 04:30:17PM -0700, Dan Williams wrote:
> > > Thanks, I should've highlighted that facet most certainly!
> > 
> > One would hope that no one is building a modern device with trusted I/O
> > capability, *and* with a swiotlb addressing dependency. However, I agree
> > that a non-shared swiotlb would be needed in such a scenario.
> 
> Hope is never a good idea when dealing with hardware :(  PCIe already
> requires no addressing limitations, and programming interface specs
> like NVMe double down on that.  But at least one big hyperscaler still
> managed to build such a device.
> 
> Also even if the periphal device is not addressing limited, the root
> port or interconnect might still be, we've seen quite a lot of that.

Still it would be very obnoxious for someone to build a CC VM platform
where CC DMA devices can't access all the guest physical memory in the
CC address map :\

Keeping in mind that that the CC address map is being created by using
the CPU MMU and the CPU IOMMU so it is entirely virtual and can be
configured to match most problems the devices might have.

Too much memory would be the main issue..

IMHO I wouldn't implement secure SWIOTLB until someone does such a
foolish thing, and I'd make them do the work as some kind of pennance
:P

Jason

