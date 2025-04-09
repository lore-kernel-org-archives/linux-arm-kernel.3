Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FDCC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 10:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRLQoLfX4dBY0RFzgSUciRtrxpTyIjMuikBO9TWoKQU=; b=owewzG+iLXA/fYKAAYra8CvHIb
	bik48kZt8s9Cil6HfYZoS288vcNYgAOJPwhCd+km1UEG55pWAUgMQDCu3HENTD6OLg6t3EUlSOPaf
	rMzhqt9pFiYCesjsgeUURgWtU9I+AEc9+oUSgjNc5MX4J8VOjJ8SyrNk0jnNN3pB/B2a6cJhB/6Wi
	nF1sTdTrzBxh5o4L/WbYBTKBkL7gfSzvikBo+RKI/mXbZNVSFJuZvrG3MFogV7kLwdE0s7LjT8ICi
	dkdXiMS0aed5SQ7zyfm8MDyrEntc0WJVYWkzbFWaDT+lgWk/m9dr6waLtP5+cL6agTKnYkMFAJIlz
	i0GJMf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2T87-00000006v5s-23rQ;
	Wed, 09 Apr 2025 10:58:03 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2T3o-00000006uKP-2HnA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 10:53:37 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id F3B5168BFE; Wed,  9 Apr 2025 12:53:32 +0200 (CEST)
Date: Wed, 9 Apr 2025 12:53:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: aleksander.lobakin@intel.com, andriy.shevchenko@linux.intel.com,
	arnd@arndb.de, bp@alien8.de, catalin.marinas@arm.com,
	corbet@lwn.net, dakr@kernel.org, dan.j.williams@intel.com,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	gregkh@linuxfoundation.org, haiyangz@microsoft.com, hch@lst.de,
	hpa@zytor.com, James.Bottomley@HansenPartnership.com,
	Jonathan.Cameron@huawei.com, kys@microsoft.com, leon@kernel.org,
	lukas@wunner.de, luto@kernel.org, m.szyprowski@samsung.com,
	martin.petersen@oracle.com, mingo@redhat.com, peterz@infradead.org,
	quic_zijuhu@quicinc.com, robin.murphy@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, iommu@lists.linux.dev,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	x86@kernel.org, apais@microsoft.com, benhill@microsoft.com,
	bperkins@microsoft.com, sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next 6/6] drivers: SCSI: Do not bounce-bufffer
 for the confidential VMBus
Message-ID: <20250409105332.GB5721@lst.de>
References: <20250409000835.285105-1-romank@linux.microsoft.com> <20250409000835.285105-7-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409000835.285105-7-romank@linux.microsoft.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_035336_724608_90475D12 
X-CRM114-Status: GOOD (  12.51  )
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

On Tue, Apr 08, 2025 at 05:08:35PM -0700, Roman Kisel wrote:
> The device bit that indicates that the device is capable of I/O
> with private pages lets avoid excessive copying in the Hyper-V
> SCSI driver.
> 
> Set that bit equal to the confidential external memory one to
> not bounce buffer

Drivers have absolutely no business telling this.  The need for bounce
buffering or not is a platform/IOMMU decision and not one specific to
a certain device or driver.


