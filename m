Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F735C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/USx7FyrAAP0KVFJIR3S9nGQoNXd7rpnvG6sRwEcjk=; b=iiZ8LGpXU3Vq6o2fDUtuWXLA54
	L5xPKS7V3MiszBFnsNS80e/JHKqt+8XJa7kY2m5dWG0iYCmdF9YsB8rFZzcDRIRF2aVVkJrfsV5Cg
	KFjtx2FlOcN6wjIAhSab/6x/Qwc6ugs4kpMtQ6tuDQc6S3X0TLKzDeBhpcXL6OadtFLkVs7lEmi8b
	y+k5P1Jk8FAAdd3DpECVamBsmiUhEaeHS0gSz7hn+2yR8xT9IibkfB/6Ti3Zmr9W2rs84BMubavax
	4I3lV7u6k8wPutPu5wxRaqZ/mJIDmI3OaHebSxEN99LK125Tw7UDc6NkVyaNQS2CCvXgmwbtlD+Jy
	pAyf53/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uRf-0000000B88V-40aL;
	Thu, 10 Apr 2025 16:08:03 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tdK-0000000AysB-3yw5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 15:16:08 +0000
Received: from [10.137.184.60] (unknown [131.107.159.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id EA497203B86C;
	Thu, 10 Apr 2025 08:16:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EA497203B86C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744298161;
	bh=b/USx7FyrAAP0KVFJIR3S9nGQoNXd7rpnvG6sRwEcjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pPUwqlOBrIErhRnMenQuuETY6McFAU1X0L10gqqB+/k7VCThivMB270N9MVPVqKZv
	 OKxIXSvIKMZxOqZulERNSc4wZJRTLL80Ml0pDUeMCwWwOhmkq4niN8+MWNU6gCLoNP
	 iRC71M6wjwxVnS1zZO8WpZAJaxORmPm0mctceOLU=
Message-ID: <e169cb52-8f2d-4ac5-b667-87c3357c11a7@linux.microsoft.com>
Date: Thu, 10 Apr 2025 08:16:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next 5/6] arch, drivers: Add device struct bitfield
 to not bounce-buffer
To: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>, aleksander.lobakin@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
 catalin.marinas@arm.com, corbet@lwn.net, dakr@kernel.org,
 dan.j.williams@intel.com, dave.hansen@linux.intel.com, decui@microsoft.com,
 gregkh@linuxfoundation.org, haiyangz@microsoft.com, hpa@zytor.com,
 James.Bottomley@HansenPartnership.com, Jonathan.Cameron@huawei.com,
 kys@microsoft.com, leon@kernel.org, lukas@wunner.de, luto@kernel.org,
 m.szyprowski@samsung.com, martin.petersen@oracle.com, mingo@redhat.com,
 peterz@infradead.org, quic_zijuhu@quicinc.com, tglx@linutronix.de,
 wei.liu@kernel.org, will@kernel.org, iommu@lists.linux.dev,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com, Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
 <20250409000835.285105-6-romank@linux.microsoft.com>
 <0eb87302-fae8-4708-aaf8-d16e836e727f@arm.com>
 <0ab2849a-5c03-4a8c-891e-3cb89b20b0e4@linux.microsoft.com>
 <20250410072150.GA32563@lst.de>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <20250410072150.GA32563@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_081603_026131_C8760111 
X-CRM114-Status: GOOD (  11.18  )
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



On 4/10/2025 12:21 AM, Christoph Hellwig wrote:
> On Wed, Apr 09, 2025 at 09:44:03AM -0700, Roman Kisel wrote:
>> Do you feel this is shoehorned in `struct device`? I couldn't find an
>> appropriate private (== opaque pointer) part in the structure to store
>> that bit (`struct device_private` wouldn't fit the bill) and looked like
>> adding it to the struct itself would do no harm. However, my read of the
>> room is that folks see that as dubious :)
> 
> We'll need per-device information.  But it is much higher level than a
> need bounce buffer flag.
> 

I see, thanks for the explanation!

-- 
Thank you,
Roman


