Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D8AF36BA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 04:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYOr2TtMJdMZNyQWF4xJz8QKeocZDKNaSzxMtEjRG3s=; b=DIcPh5QgMB8EgSjzRFHheYhCG6
	+9xC2r20rHpfiiRU+o3Xpv1GGQYdMEuQHrhOTWXkiTo0YQe3ZQfb4AHJaD3ALzQhFGlZMPW5pHwqf
	63ZO0Z4QGZ0T3TpGH/6zROTQmnIdBcwSmdixUfYdinXVhsZydY4FjVgw2dxhvuYJQcsevkdGiNlkv
	KyNdojrA9SNYHC2X0J4IMzwBqdoS/j7fkPOybWLChqpu97Ck1LPIgVnOQG4rFIggPymWo3XVsR0+h
	d9ux97Qqx7vJL4Cik41W8jYjyLY1xiwFvw0ZiLfDYZREUzSicd4JGELiy+M7jglml99JX9ldwQFqn
	RZ//7Y6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3mv-0000000BbKL-0WSk;
	Fri, 10 Apr 2026 04:48:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3ms-0000000BbK0-3ehY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 04:48:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55C1A2008;
	Thu,  9 Apr 2026 21:48:03 -0700 (PDT)
Received: from [10.163.181.174] (unknown [10.163.181.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FB943FAF5;
	Thu,  9 Apr 2026 21:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775796489; bh=c3DJ+S2oOSvZXmmTi+zH6GgC1NLBeyFjVpTiXZLQF9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lRQRKKOooSviZJCJhlupFZkcTLD7CpeoH/yuz7wjC+oBayyPRnena/ZGpFkvAqcYg
	 O/mgWTpyTMw10Oe5L9uCW3To1refRX442FAOZ1q1Q9E7fUuKTSjWgWWVi72EG0vw8B
	 gOyQQ8SLJFDCzSqAz8sfORy6kITdqnvEZuRVQXko=
Message-ID: <8a3849cc-e6d3-4932-865f-476a137f891a@arm.com>
Date: Fri, 10 Apr 2026 10:18:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 05/16] arm64/mm: Convert READ_ONCE() as pmdp_get() while
 accessing PMD
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-6-anshuman.khandual@arm.com>
 <628a1d9b-cc16-4cf6-8c19-b6ed49af8492@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <628a1d9b-cc16-4cf6-8c19-b6ed49af8492@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_214810_975386_3B953ACF 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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



On 08/04/26 5:41 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 06:11, Anshuman Khandual wrote:
>> Convert all READ_ONCE() based PMD accesses as pmdp_get() instead which will
>> support both D64 and D128 translation regime going forward.
> 
> You should mention the move from pmdp_test_and_clear_young(), and why it
> is performed.

Sure will do that. Actually there as a build problem while accessing
pmdp_get() from pmdp_test_and_clear_young() while being inside the
header which necessitated this move.

> 
> Nothing else jumped at me :)
> 


