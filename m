Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C0AC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMKoioqZr7ds/fOTAujDoUrXMaVezYGFa+z1dllvQ88=; b=XlJt8oNtkVMBrWLDcDe2DvYfFi
	aJyvHX6jonZ/odrpmOFv1dREIQxjp+BXn74t0YAIt191u31+InQ7iiavLavV3VKDZqMAfEDGIJlJ6
	YnutBHu3cY3a8I3a2zTXGGgxKwtZmXGWXZ3LLe1TSR2RqZystH1qaNn6XUaEoV+qKnVBnKIDfXl1l
	A1Y3PW5A6MhchzDJPg4gh8wbjPJzT+liHK/NZoh4hOsdcv9FbYVwBd1L3K8mep1bF/mxJwEnov4ZS
	q993V80YtKKSBgRyJWshANBkcnZGdgboyeFlm0dPnEVu1NRkGJIxYkou8Y7TORMY+i3s0mjHMQiDi
	24vEQBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhBbj-00000002D3U-1lpH;
	Wed, 30 Jul 2025 18:32:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhBYP-00000002CeA-38zB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 18:29:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ED1B1BF7;
	Wed, 30 Jul 2025 11:29:19 -0700 (PDT)
Received: from [10.57.87.181] (unknown [10.57.87.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB6563F66E;
	Wed, 30 Jul 2025 11:29:24 -0700 (PDT)
Message-ID: <8f89490b-bac5-4297-a4a8-9e9c4a8f5ef5@arm.com>
Date: Wed, 30 Jul 2025 19:29:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>, Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com, mark.rutland@arm.com, urezki@gmail.com
References: <20250723161827.15802-1-dev.jain@arm.com>
 <aIpPsg1Kij8Knnjl@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aIpPsg1Kij8Knnjl@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_112929_826511_E3845828 
X-CRM114-Status: GOOD (  14.44  )
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

On 30/07/2025 18:00, Catalin Marinas wrote:
> On Wed, Jul 23, 2025 at 09:48:27PM +0530, Dev Jain wrote:

[...]

> 
>> +	 * mmap_write_lock/unlock in T1 be called CS (the critical section).
>> +	 *
>> +	 * Claim: The CS of T1 will never operate on a freed PMD table.
>> +	 *
>> +	 * Proof:
>> +	 *
>> +	 * Case 1: The static branch is visible to T2.
>> +	 *
>> +	 * Case 1 (a): T1 acquires the lock before T2 can.
>> +	 * T2 will block until T1 drops the lock, so pmd_free() will only be
>> +	 * executed after T1 exits CS.
> 
> This assumes that there is some ordering between unlock and pmd_free()
> (e.g. some poisoning of the old page). The unlock only gives us release
> semantics, not acquire. It just happens that we have an atomic
> dec-and-test down the __free_pages() path but I'm not convinced we
> should rely on it unless free_pages() has clear semantics on ordering
> related to prior memory writes.

I can understand how pmd_free() could be re-ordered before the unlock, but
surely it can't be reorded before the lock? I need to go unlearn everything I
thought I understood about locking if that's the case...


