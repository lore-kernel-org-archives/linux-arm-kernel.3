Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4ECC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgsqfI4UMPdAKy09BfAtIYj/ju7Uvf0+W/vr1pDeSmE=; b=pgPYrGSWWQMKaX3NpJcCmH8Afg
	bR6KQeT4AOzNrEmIv2C/iom/9qBNl9edXqcoUR2s+0MMOLLdLYhAlCpej3MpVbZGFG83xNAzc8kf9
	ATzbAkBJjkIcHaxqjECPgHItLAoDKY1om1e+tk4tWjdfM8uPps7YARH4b3WTD2usOOWbmv9MuWs+P
	jh9tj0JhGAhGAQGKUtLxR43rQaKraSK1eJEmn0u5EtPWFP56n+HTY7Ww+tJ1Fpfmlc9UOrBOsQVVy
	YlW8d4MFHH1wjRge3pyqwjagLgcsnvJvIDF+BS0ln4Zf+SDMWUn65hEZeNVm/+wZZTestXUvaG+p2
	7vckJUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bbb-00000007EOP-1R4i;
	Mon, 07 Sep 2026 15:49:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bbY-00000007EO4-1l7h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:49:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8D891476;
	Mon,  7 Sep 2026 08:49:47 -0700 (PDT)
Received: from [10.57.6.26] (unknown [10.57.6.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 634F93F7B4;
	Mon,  7 Sep 2026 08:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788796191; bh=NgsqfI4UMPdAKy09BfAtIYj/ju7Uvf0+W/vr1pDeSmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X8PrVsr7qSGJqrvABBYQzM/DbPiLBfiIRsoRicV7kmHmDk4fvFg6Gl0y2kzAN0Etz
	 Ea7Gi8wO+37xss8GQ8X/AtXdULivI4RHRx1t2vIjhRBNjqhWUfYrjRpUJ+dijf2Dy4
	 Yv9O0nkLGvLbp7EhNWeac5e0DU5XWNx23239QUAw=
Message-ID: <3f6e7678-0784-4ac1-acb4-b128887803c5@arm.com>
Date: Mon, 7 Sep 2026 17:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 01/25] mm: Introduce kpkeys
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-1-743ad31b2c8f@arm.com>
 <178877845406.3691569.6930315020588094755.b4-review@b4>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <178877845406.3691569.6930315020588094755.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_084956_638371_7F72802C 
X-CRM114-Status: GOOD (  16.75  )
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

On 07/09/2026 12:54, Mike Rapoport wrote:
> Hi Kevin,
>
>> kpkeys is a simple framework to enable the use of protection keys
>> (pkeys) to harden the kernel itself. This patch introduces the basic
>> API in <linux/kpkeys.h>: a couple of functions to enter/leave a
>> kpkeys context and macros to define guard objects.
>>
>> kpkeys introduces a new concept on top of pkeys: the kpkeys context.
>> Each context is associated with a set of permissions for the pkeys
>> managed by the kpkeys framework. kpkeys_enter_context(ctx) sets
>> those permissions according to ctx, and returns the original kpkeys
>> state (typically the arch-specific pkeys register) that is later
>> restored by calling kpkeys_leave_context(). To start with, only
>> KPKEYS_CTX_DEFAULT is available, which is meant to grant RW access
>> to KPKEYS_PKEY_DEFAULT (i.e. all memory since this is the only
>> available pkey for now).
>>
>> The underlying representation of each kpkeys context is entirely
>> architecture-specific. Support for kpkeys must be explicitly
>> indicated by selecting ARCH_HAS_KPKEYS and defining the following
>> functions in <asm/kpkeys.h>:
>>
>> * arch_kpkeys_enter_context()
>> * arch_kpkeys_leave_context()
>> * arch_supports_kpkeys()
>>
>> Additionally, <asm/kpkeys_types.h> must define struct arch_kpkeys_state,
>> which typically provides storage for the pkeys register.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>
>> diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
>> new file mode 100644
>> index 0000000000000..eac522f552141
>> --- /dev/null
>> +++ b/include/linux/kpkeys.h
>> @@ -0,0 +1,104 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef _LINUX_KPKEYS_H
>> +#define _LINUX_KPKEYS_H
>> +
>> +#include <linux/bug.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/kpkeys_types.h>
>> +
>> +/**
>> + * KPKEYS_GUARD_NOOP() - define a guard type that does nothing
> Nit: I'd suggest to drop "define" from all the descriptions, they would
> read better without it IMHO.

Fair enough, but if we say just "a guard type that does nothing" is it
clear that this is a macro defining a type, and not a type itself?

- Kevin

