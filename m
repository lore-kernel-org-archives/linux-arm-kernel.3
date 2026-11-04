Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819D6606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SRmW9EkO;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C6OJR5TU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TQnRvPeX0s11xwNIzy2fTv5gyAO1V6iutDNVwBAIQGw=; b=SRmW9EkO7uSkl6
	KmZXXFrwyB3vHBNbpVOfiHhPWicftOz/yuf8Gw7LRcGLpqwt2gUlcctDLnMc10Si7niQCjBDqiwgh
	8tB/C6GLrS0cnS7KPnz8Aj4c+ywiaM6eOuwUaGYvNiBSy5Cm38F0HItQSwmAqH/Cu8SuZva1lj4TB
	5ETAVU/Lf7HwDuyRP/g50bwsSwLc0PTcw8Qux1XE1+yyaXyC2j12uGRG1hGhw/y8nq+nhiUbWk9pp
	vI0ekp9Dkf1F9W/C4sWgfaHQl9tqkc32Df4kmO1o34qOoeZmKDsw3RAVOjCTzJll+nG3ar20HFm0k
	wglIU0GsGKzpUs8THmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeyg-00000006Fjj-1Vst;
	Wed, 04 Nov 2026 17:40:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeyd-00000006Fik-1Ie8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:40:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DDE81BB0;
	Wed,  4 Nov 2026 09:40:43 -0800 (PST)
Received: from [10.57.90.115] (unknown [10.57.90.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 158A03F673;
	Wed,  4 Nov 2026 09:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793814046; bh=+W72MjjHirhzVA/qDT+k2DAMSV2VvDQzAofbMpBBwSk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C6OJR5TUg1o9qDAz7haD+JUV0dWjrhETeV6oWpF8Z1Xl0ya74LmaqfHTaz7bpxff+
	 5PwdOYNd3un5lwbYrQrG7cslAkDMCC6/ni1jA2XCr0oALAWU14yhVn52MSttnogBJY
	 nGIlmpqVsdnM9KYCGjy44d0lfG2ZuSJiJzOHWycM=
Message-ID: <a2677ff9-e342-4f06-bf28-8f56aadb14a4@arm.com>
Date: Wed, 4 Nov 2026 17:40:42 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] irqchip/gic-v5: Fix misc IRS and ITS host driver
 issues
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Sashiko AI <sashiko-bot@kernel.org>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <aun2udtwaIo2RiRC@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <aun2udtwaIo2RiRC@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_094047_444424_6395023A 
X-CRM114-Status: GOOD (  18.22  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 03/11/2026 14:59, Lorenzo Pieralisi wrote:
> On Mon, Nov 02, 2026 at 01:32:53PM +0000, Sascha Bischoff wrote:
>> This series fixes issues in the GICv5 host IRS and ITS drivers.
>>
>> The ITS invalidation serialisation fix addresses Sashiko's report of a
>> race between event and device invalidation commands [1]. The other
>> patches correct IRS allocation and routing behaviour, serialise IRS
>> synchronisation, and fix ITS L1/L2 table selection, cache maintenance,
>> ACPI coherency handling, and resource cleanup.
>>
>> The IRS changes:
>> * Reject allocation of an SPI without an IRS, preventing a null-pointer
>>    dereference, and warn about low-quality firmware.
>> * Only program IRS_PE_CR0.DPS when 1-of-N routing is supported as this field
>>    is RES0, otherwise.
>> * Serialise IRS synchronisation requests, as the IRS ignores a request while
>>    an earlier one is still active.
>>
>> The ITS changes:
>> * Serialise event and device cache invalidations because both use the ITS's
>>    shared DIDR register, so concurrent writes are a bad idea!
>> * Select linear device and interrupt translation tables when one L2
>>    table covers the full ID space. Currently, this selects the wrong
>>    path, then the L1 table code rejects the attempt to create the
>>    table.
>> * Check the ACPI noncoherent flag with ACPI, rather than checking the
>>    DT's property.
>> * Correct cache-maintenance sizing after limiting the DeviceID width.
>> * Invalidate the device cache before freeing an ITT.
>> * Use firmware-node names in initialisation warnings.
>> * Release the reserved MMIO region if DT-based ITS initialisation fails.
>>
>> I've CC'd stable for the IRS/ITS locking fixes, the ITS table alloc
>> issue, and the ACPI coherency fix, as these are the most important
>> changes to backport.
>>
>> The series is based on v7.4-rc1. Thanks for taking a look!
> 
> Thank you for fixing these bugs Sascha.
> 

Absolutely no worries. One of those times where one pulls on a thread, 
and a few more things unravel than one expects :)

V2 incoming.

Thanks,
Sascha

> Lorenzo
> 
>>
>> Sascha
>>
>> [1] https://sashiko.dev/#/patchset/20261016155741.979985-1-sascha.bischoff@arm.com?part=11
>>
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> ---
>> Sascha Bischoff (10):
>>        irqchip/gic-v5: Reject SPIs not backed by an IRS
>>        irqchip/gic-v5: Only set IRS DPS when 1ofN routing is supported
>>        irqchip/gic-v5: Serialise IRS synchronisation requests
>>        irqchip/gic-v5: Serialise ITS invalidation commands
>>        irqchip/gic-v5: Use linear DT and ITT when L2 covers all IDs
>>        irqchip/gic-v5: Honour ACPI ITS noncoherent flag
>>        irqchip/gic-v5: Use firmware node name in ITS warning
>>        irqchip/gic-v5: Invalidate ITS device cache before freeing ITT
>>        irqchip/gic-v5: Clean the allocated linear device table size
>>        irqchip/gic-v5: Release ITS MMIO region on DT probe failure
>>
>>   drivers/irqchip/irq-gic-v5-irs.c   | 22 +++++++++++++++-------
>>   drivers/irqchip/irq-gic-v5-its.c   | 29 ++++++++++++++++++++++++-----
>>   drivers/irqchip/irq-gic-v5.c       |  9 +++++++++
>>   include/linux/irqchip/arm-gic-v5.h |  1 +
>>   4 files changed, 49 insertions(+), 12 deletions(-)
>> ---
>> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>> change-id: 20261102-host_gicv5_fixes-1eeea29d2ea4
>>
>> Best regards,
>> --
>> Sascha Bischoff <sascha.bischoff@arm.com>
>>


