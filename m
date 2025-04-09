Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A74C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STjRVpgg0Yp0bRazVRJxjrVKHPO2bSZ4lShot4vAUzA=; b=1ezwLberexJkElcuiSDB3IdYkc
	or37LseKIAaYqFvPuzjsCWLnn+HQpRMy2Uw8BC5LyfCj0Iysimwcv1FShAQC5ks8p1ZsG0t3gSDtX
	1aoPtERn7GVBPgPAkyu/oBbwZogMzkQPG7RFEBJWTjlHpzriojvzSHysnmL5ufvEDsnY7xfyWTU7k
	5Yb0ZnFAro4365TGtTUFu51OGtzEX8bn+W25Y3vAPvAG0Q6KteDaGNoZTPuXkHzZfqbkuku1PLqW0
	ZbaH4lVQEJZKb9um+6WoIl2WhfAxn8IhTRtpCLltQQkSYCfEuLnjm+CZQ+l11UXnToKLo1qGiBaRJ
	lb97GlNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XWK-00000007iuT-18Wq;
	Wed, 09 Apr 2025 15:39:20 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XTp-00000007iLf-0uMj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 15:36:46 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id DC5202114D83;
	Wed,  9 Apr 2025 08:36:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DC5202114D83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744213004;
	bh=STjRVpgg0Yp0bRazVRJxjrVKHPO2bSZ4lShot4vAUzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mp2nvG161guzkA5jkhuWIpYyBT04WkL0edtyczcFZXoq8eK8Ezwe8HEmiBEcfvDCy
	 deajHxHYyWZU7h7pWiFKRJXXcUnyRylUnG5vNOAzszEOLLM9KKKiWnfuRP81BheV+I
	 WY2pVGQeqqiyxm/f+Q6cp3ADRSs3IuXWn24zdJDY=
Message-ID: <d8876120-5478-4d2f-acad-b0a59261bbc5@linux.microsoft.com>
Date: Wed, 9 Apr 2025 08:36:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next 6/6] drivers: SCSI: Do not bounce-bufffer for
 the confidential VMBus
To: Christoph Hellwig <hch@lst.de>
Cc: aleksander.lobakin@intel.com, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, bp@alien8.de, catalin.marinas@arm.com, corbet@lwn.net,
 dakr@kernel.org, dan.j.williams@intel.com, dave.hansen@linux.intel.com,
 decui@microsoft.com, gregkh@linuxfoundation.org, haiyangz@microsoft.com,
 hpa@zytor.com, James.Bottomley@HansenPartnership.com,
 Jonathan.Cameron@huawei.com, kys@microsoft.com, leon@kernel.org,
 lukas@wunner.de, luto@kernel.org, m.szyprowski@samsung.com,
 martin.petersen@oracle.com, mingo@redhat.com, peterz@infradead.org,
 quic_zijuhu@quicinc.com, robin.murphy@arm.com, tglx@linutronix.de,
 wei.liu@kernel.org, will@kernel.org, iommu@lists.linux.dev,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250409000835.285105-1-romank@linux.microsoft.com>
 <20250409000835.285105-7-romank@linux.microsoft.com>
 <20250409105332.GB5721@lst.de>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <20250409105332.GB5721@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_083645_297834_2D706FA1 
X-CRM114-Status: GOOD (  13.05  )
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



On 4/9/2025 3:53 AM, Christoph Hellwig wrote:
> On Tue, Apr 08, 2025 at 05:08:35PM -0700, Roman Kisel wrote:
>> The device bit that indicates that the device is capable of I/O
>> with private pages lets avoid excessive copying in the Hyper-V
>> SCSI driver.
>>
>> Set that bit equal to the confidential external memory one to
>> not bounce buffer
> 
> Drivers have absolutely no business telling this.  The need for bounce
> buffering or not is a platform/IOMMU decision and not one specific to
> a certain device or driver.

Seemed to work although I cannot claim nothing is going to be broken
ever. It did appear from the code that one could have this per-device
bit.

As I understand, you're saying this is architecturally broken. Do you
think a broader set of changes would improve the implementation?

> 

-- 
Thank you,
Roman


