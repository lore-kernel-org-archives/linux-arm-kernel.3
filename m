Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8087EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DxJPiqMcvrzGL10QGudBV9bSQqDtgQOj5kiwOcu8Xg=; b=tbFJ+C+ZdzZOmgC8gpvYHlX9Jw
	PGU6hX4Sf/J1HEhmC3aOflfrNxKPDQh/DMV1JEK7DowQcnkAzU1T2wBddoLOINY0tSuVuypqRQOR0
	II1BrJc8Y544D+RPCC93W+NabqWgPz+sGpjrjegcVTNENcJSGQN0JjpgPxrwtEt+UKvPEdZ0Yf0KE
	bLRKyiONKN71qLmd6ImK2tqPTIbWFcfryhlLuivTwtSYOHGzNDod5sFJjvEvO4xQHRba0c1qJ3OYt
	evPNM6rDmhdiVWWAdJnam7lwyidso7FOeizNWalfUWpH2qpVZTVXForlUXohXC0UjAL3OEk/seDCT
	kLxJNO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mrV-00000009etu-13VH;
	Thu, 10 Apr 2025 08:02:13 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mGW-00000009XDO-2SMp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 07:24:02 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7F56568C4E; Thu, 10 Apr 2025 09:23:54 +0200 (CEST)
Date: Thu, 10 Apr 2025 09:23:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Roman Kisel <romank@linux.microsoft.com>,
	Robin Murphy <robin.murphy@arm.com>, aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
	catalin.marinas@arm.com, corbet@lwn.net, dakr@kernel.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	gregkh@linuxfoundation.org, haiyangz@microsoft.com, hch@lst.de,
	hpa@zytor.com, James.Bottomley@hansenpartnership.com,
	Jonathan.Cameron@huawei.com, kys@microsoft.com, leon@kernel.org,
	lukas@wunner.de, luto@kernel.org, m.szyprowski@samsung.com,
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
Message-ID: <20250410072354.GB32563@lst.de>
References: <20250409000835.285105-1-romank@linux.microsoft.com> <20250409000835.285105-6-romank@linux.microsoft.com> <0eb87302-fae8-4708-aaf8-d16e836e727f@arm.com> <0ab2849a-5c03-4a8c-891e-3cb89b20b0e4@linux.microsoft.com> <67f703099f124_71fe2949e@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f703099f124_71fe2949e@dwillia2-xfh.jf.intel.com.notmuch>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_002400_765094_48FA5767 
X-CRM114-Status: GOOD (  13.68  )
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

On Wed, Apr 09, 2025 at 04:30:17PM -0700, Dan Williams wrote:
> > Thanks, I should've highlighted that facet most certainly!
> 
> One would hope that no one is building a modern device with trusted I/O
> capability, *and* with a swiotlb addressing dependency. However, I agree
> that a non-shared swiotlb would be needed in such a scenario.

Hope is never a good idea when dealing with hardware :(  PCIe already
requires no addressing limitations, and programming interface specs
like NVMe double down on that.  But at least one big hyperscaler still
managed to build such a device.

Also even if the periphal device is not addressing limited, the root
port or interconnect might still be, we've seen quite a lot of that.


