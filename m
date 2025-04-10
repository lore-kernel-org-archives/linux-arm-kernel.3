Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A22C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fItasrt1xt0TTY7vh/11OuH4pk8JEH3jjBBbRrAKEQA=; b=CSV8xtPc1DK0dvTfczIYmO/yk0
	Q0P/vZzizDgOYVnja17L6v7OUz1JsW1kSJAhaxsLUQBp34hzzTA27rAgFwlIkYnKw6KmA/yZTnxiP
	PegiHc21gIN5XklVSV8xCkaLwUsa7a8R539mUM/L0LUtLYW5KfImVlvbjF4wiXAuZ28V/snurXozS
	o5na/6PgRsH8HL9UMmXcfam+jIq5xDuq/JqlgIan4hJnd1GEUxi54g5ekIppVFUBoVFxYKuNXbVBX
	/iSkjfog2STPMdMQrso81bskCu6gu2lzT+OcTJx3XGzj9PKvf4JxTdnMNic2EH2cMFxroLdzpZ1DR
	BJ6zRdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mpj-00000009ebj-3YPF;
	Thu, 10 Apr 2025 08:00:23 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mEW-00000009WmU-43IX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 07:21:58 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id BD93D68BFE; Thu, 10 Apr 2025 09:21:50 +0200 (CEST)
Date: Thu, 10 Apr 2025 09:21:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: Robin Murphy <robin.murphy@arm.com>, aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
	catalin.marinas@arm.com, corbet@lwn.net, dakr@kernel.org,
	dan.j.williams@intel.com, dave.hansen@linux.intel.com,
	decui@microsoft.com, gregkh@linuxfoundation.org,
	haiyangz@microsoft.com, hch@lst.de, hpa@zytor.com,
	James.Bottomley@HansenPartnership.com, Jonathan.Cameron@huawei.com,
	kys@microsoft.com, leon@kernel.org, lukas@wunner.de,
	luto@kernel.org, m.szyprowski@samsung.com,
	martin.petersen@oracle.com, mingo@redhat.com, peterz@infradead.org,
	quic_zijuhu@quicinc.com, tglx@linutronix.de, wei.liu@kernel.org,
	will@kernel.org, iommu@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, x86@kernel.org, apais@microsoft.com,
	benhill@microsoft.com, bperkins@microsoft.com,
	sunilmut@microsoft.com, Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH hyperv-next 5/6] arch, drivers: Add device struct
 bitfield to not bounce-buffer
Message-ID: <20250410072150.GA32563@lst.de>
References: <20250409000835.285105-1-romank@linux.microsoft.com> <20250409000835.285105-6-romank@linux.microsoft.com> <0eb87302-fae8-4708-aaf8-d16e836e727f@arm.com> <0ab2849a-5c03-4a8c-891e-3cb89b20b0e4@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ab2849a-5c03-4a8c-891e-3cb89b20b0e4@linux.microsoft.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_002157_166028_95670551 
X-CRM114-Status: GOOD (  12.00  )
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

On Wed, Apr 09, 2025 at 09:44:03AM -0700, Roman Kisel wrote:
> Do you feel this is shoehorned in `struct device`? I couldn't find an
> appropriate private (== opaque pointer) part in the structure to store
> that bit (`struct device_private` wouldn't fit the bill) and looked like
> adding it to the struct itself would do no harm. However, my read of the
> room is that folks see that as dubious :)

We'll need per-device information.  But it is much higher level than a
need bounce buffer flag.


