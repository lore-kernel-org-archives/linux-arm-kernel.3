Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6FFEDB7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pbEohc5Niu60PblepQCUfh299ojI2iXvDbw4RvhELg=; b=Aipt50w6YVq9L0yZU/H3YQ5Uto
	VNfP0pPWvtuM/3TT6F8U2ceLxVWbq4f0FZHeVGfDafw6lF6hXulvJJbwqVLSO1MEU6oRGlxC8vws2
	5oARd0f8vPWOh42LdxeENifRsJS6WWNx2aQqhL84l8VNi2boya98PyVNVXorK/S5KedCc0OL26Uk2
	0B97rOEMwA69WURFjAxlzci0qfXdjKgtxj1/xzBUV/F7VukCnNpxhBFnfWjtXTMuwScZug7vVD/K1
	kIOmPjpZvkzNdO+GuCYtG3I/Hc7u2uMGe2lbPRtdJSuPukXtq5EEUqmd8NSTdXnFf8PD/LREfNpP4
	4lWRggJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3Qo-00000006GiW-2ujK;
	Tue, 07 Apr 2026 10:13:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3Qm-00000006Ghw-1oO4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:13:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D5061BB2;
	Tue,  7 Apr 2026 03:13:05 -0700 (PDT)
Received: from [10.57.87.42] (unknown [10.57.87.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B2DD3F641;
	Tue,  7 Apr 2026 03:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775556790; bh=u6k7KReiIMT35ffIgZho6g6CodialPIJRfoN0WPK8T8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BWNVh6ANFtw0ueWu9yyum/s4AQLzADYVEGNe1bxpMRtjve3MThvdmz4uAY0F2iy4R
	 4PJrXK6QtuNLXqjAhnWeXyLIfgZSsfwLCKBML6k8kvo+BXcXRP0C3FTBqeV+daqvc2
	 bQkJZMH+IaAC4mVQ55h9T0x8Df47exrCEMB2Hmc4=
Message-ID: <bc4a0246-33bb-443e-a885-a31b24d4a022@arm.com>
Date: Tue, 7 Apr 2026 11:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com> <ac7VD4Z85nS30GCp@arm.com>
 <ac-W9oNM_O5RTtaf@arm.com> <beacee23-c177-47a1-b8b5-743844b617a8@arm.com>
 <adTPFrlVCEt-hioX@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <adTPFrlVCEt-hioX@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_031312_616210_6B12760A 
X-CRM114-Status: GOOD (  24.94  )
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

On 07/04/2026 10:32, Catalin Marinas wrote:
> On Tue, Apr 07, 2026 at 09:43:42AM +0100, Ryan Roberts wrote:
>> On 03/04/2026 11:31, Catalin Marinas wrote:
>>> On Thu, Apr 02, 2026 at 09:43:59PM +0100, Catalin Marinas wrote:
>>>> Another thing I couldn't get my head around - IIUC is_realm_world()
>>>> won't return true for map_mem() yet (if in a realm). Can we have realms
>>>> on hardware that does not support BBML2_NOABORT? We may not have
>>>> configuration with rodata_full set (it should be complementary to realm
>>>> support).
>>>
>>> With rodata_full==false, can_set_direct_map() returns false initially
>>> but after arm64_rsi_init() it starts returning true if is_realm_world().
>>> The side-effect is that map_mem() goes for block mappings and
>>> linear_map_requires_bbml2 set to false. Later on,
>>> linear_map_maybe_split_to_ptes() will skip the splitting.
>>>
>>> Unless I'm missing something, is_realm_world() calls in
>>> force_pte_mapping() and can_set_direct_map() are useless. I'd remove
>>> them and either require BBML2_NOABORT with CCA or get the user to force
>>> rodata_full when running in realms. Or move arm64_rsi_init() even
>>> earlier?
>>
>> I'd need Suzuki to comment on this. As I said in the other mail, I was treating
>> this like a pre-existing bug. But I guess linear_map_requires_bbml2 ending up
>> wrong is a problem here. I'm not sure it's quite as simple as requiring
>> BBML2_NOABORT with CCA as we still need can_set_direct_map() to return true if
>> we are in a realm.
> 
> can_set_direct_map() == true is not a property of the realm but rather a
> requirement. 

Yes indeed. It would be better to call it might_set_direct_map() or something
like that...

> In the absence of BBML2_NOABORT, I guess the test was added
> under the assumption that force_pte_mapping() also returns true if
> is_realm_world(). We might as well add a variable or static label to
> track whether can_set_direct_map() is possible and avoid tests that
> duplicate force_pte_mapping().

I'm not sure I follow. We have linear_map_requires_bbml2 which is inteded to
track this shape of thing; if we have forced pte mapping then the value of
can_set_direct_map() is irrelevant - we will never need to split because we are
already pte-mapped. But if can_set_direct_map() initially returns false because
is_realm_world() incorrectly returns false in the early boot environment, then
linear_map_requires_bbml2 will be set to false, and we will incorrectly
short-circuit splitting any block mappings in split_kernel_leaf_mapping().

I think we are agreed on the problem. But I don't understand how tracking
can_set_direct_map() in a cached variable helps with that.

> 
> This won't solve the is_realm_world() changing polarity during boot but
> at least we know it won't suddenly make can_set_direct_map() return
> true when it shouldn't.

But is_real_world() _should_ make can_set_direct_map() return true, shouldn't
it? If we are in realm-world, we need to be able to flip the NS_SHARED bit on
parts of the linear map. So if we are in realm-world, we _might_ need to update
he direct map and that's what can_set_direct_map() is supposed to tell us.



