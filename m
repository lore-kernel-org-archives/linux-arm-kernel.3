Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DFBCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XOuo23n5fwaFPItZ1inGNCeclcLdyo6m47GTm6ZkMM=; b=ElquY0B3szkALvmyysfLZi6bM6
	ysA9aMcc7Ypf5n1b/7NljMFhYVT7Is59ORJQR5KVh0+PBiRznlCBfwJN24vBSQT0GVE3MkxkTADt3
	/1X4FPQGb12baEbgkFVe+5cQItgxP4U5ZLZo8Q2H5xAPM2JYRmDWEFOGR3Zw27H0eJOyDO9J0Eitc
	/LVWEvsLNeP6oeHRI17kEn7DnG58Jnw/yiqqgyxhKwxGMFmeKT13dHOxY/+K0jx2E2PSPyWS9+2Dj
	TKXuMR/Y5nAL5jlYo7KxA8IGeZeNrJPbxiEt7Zkptw65BsLJUM1TY11b8seNzPQrHA3mLTZyxPJmk
	bBy/CyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYkw-00000008V5u-0eqS;
	Tue, 16 Sep 2025 16:42:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYkt-00000008V5X-0jG7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:42:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 372A11063;
	Tue, 16 Sep 2025 09:42:02 -0700 (PDT)
Received: from [10.57.4.241] (unknown [10.57.4.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB5903F673;
	Tue, 16 Sep 2025 09:42:08 -0700 (PDT)
Message-ID: <8f426702-4897-4177-aeae-4fe2b7155fae@arm.com>
Date: Tue, 16 Sep 2025 17:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: Fix possible deadlock in coresight_panic_cb
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>
Cc: Sean Anderson <sean.anderson@linux.dev>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Linu Cherian <lcherian@marvell.com>,
 linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>
References: <20250912151314.3761026-1-sean.anderson@linux.dev>
 <20250915095820.GH12516@e132581.arm.com>
 <3e618117-96bd-44f3-bede-7cadfe0264dd@linux.dev>
 <20250916160027.GK12516@e132581.arm.com>
 <6fbd24b2-3315-45e6-bff2-2c39e899e8f5@arm.com>
 <20250916163840.GL12516@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250916163840.GL12516@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_094211_260090_79504421 
X-CRM114-Status: GOOD (  13.13  )
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

On 16/09/2025 17:38, Leo Yan wrote:
> On Tue, Sep 16, 2025 at 05:09:01PM +0100, Suzuki Kuruppassery Poulose wrote:
> 
> [...]
> 
>>>   From ea78dd22cbdd97f709c5991d5bd3be97be6e137e Mon Sep 17 00:00:00 2001
>>> From: Sean Anderson <sean.anderson@linux.dev>
>>> Date: Tue, 16 Sep 2025 16:03:58 +0100
>>> Subject: [PATCH] coresight: Fix possible deadlock in coresight_panic_cb()
>>>
>>> coresight_panic_cb() is called during a panic. It invokes
>>> bus_for_each_dev(), which then calls bus_to_subsys() and takes the
>>> 'bus_kset->list_lock'. If a panic occurs after the lock has been
>>> acquired, it can lead to a deadlock.
>>>
>>> Instead of using a common panic notifier to iterate the bus, this commit
>>> directly registers the TMC device's panic notifier. This avoids bus
>>> iteration and effectively eliminates the race condition that could cause
>>> the deadlock.
>>
>> Well, if you are going that far, why not register the notifier from
>> coresight-core ?
> 
> I have thought this but gave up.
> 
> When register a panic's notifier, it does not provide an argument for
> passing a private data. So the code below uses container_of() to convert
> notifier block pointer to the TMC driver data, as a result, the code is
> specific to TMC driver.

notifier_block in csdev ?


