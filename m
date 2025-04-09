Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C4CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjQX7nAQGu8VWkUrRyRpYAcZbBxisvkDjd3TARXNRv0=; b=JMdm8kwhUGQQMdYmVjQUW0qH2T
	N5939OkSjKUrUIoMSfjDjkUR5N39oIHtuw6nuPCH5SoVOjFtM3tuhCIhm/hL92PH2q8uoGocCRAwB
	F6TZi2RrV+WjjRuEuwcC+TXB8iGmogv9RM6o0LxZTfiTnJ+cvyTzGer8H2KRoaovzsc7LDSuG2UF2
	xAf9zjfktxBxFZHW74u+MV6eJLStBFGyYRBcsfrf4/pMiiHRrRRP3e2bxZPnnyu4iZ/inHmJhkno0
	RLH2cIAHb4QcDwYVKU/HO/ma9DF85zdi6Ihsbi6ifA9Icd5mek76jp7bk5VM/hyqZamxRv1pir8f3
	KYxHuZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XQ6-00000007hIL-1Hf7;
	Wed, 09 Apr 2025 15:32:54 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XKm-00000007gI4-3SbZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 15:27:26 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0A0262114D8A;
	Wed,  9 Apr 2025 08:27:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0A0262114D8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744212443;
	bh=UjQX7nAQGu8VWkUrRyRpYAcZbBxisvkDjd3TARXNRv0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HiVZXeJWF7w0t2l/4IF8J5ryv6/ZPUKUQ5aYykBziIutp4bcub2znNWPE/Y1Dh/Ge
	 wPcrUU54yJBi/OX2udWa8QfGVA5UwpUJ3rEDsQtkbu2LYD/m1xFmP6y1gt8crnOdXG
	 kECFhb2Vi1RaczcV6Pkxw/I1DktSimbBtg4Gwcdg=
Message-ID: <b56eef68-367d-4b7b-98c4-f5d1291d7993@linux.microsoft.com>
Date: Wed, 9 Apr 2025 08:27:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next 5/6] arch, drivers: Add device struct bitfield
 to not bounce-buffer
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
 <20250409000835.285105-6-romank@linux.microsoft.com>
 <20250409105229.GA5721@lst.de>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <20250409105229.GA5721@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_082724_899115_53480E5C 
X-CRM114-Status: GOOD (  11.49  )
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



On 4/9/2025 3:52 AM, Christoph Hellwig wrote:
> On Tue, Apr 08, 2025 at 05:08:34PM -0700, Roman Kisel wrote:
>> Bounce-buffering makes the system spend more time copying
>> I/O data. When the I/O transaction take place between
>> a confidential and a non-confidential endpoints, there is
>> no other way around.
>>
>> Introduce a device bitfield to indicate that the device
>> doesn't need to perform bounce buffering. The capable
>> device may employ it to save on copying data around.
> 
> I have no idea what this is supposed to mean, you need to explain it
> much better.

Thanks for reviewing! I'll fix the description.

> 

-- 
Thank you,
Roman


