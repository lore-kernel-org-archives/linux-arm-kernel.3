Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509C4F436B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8FO8PzF0PieyWhQwCeTDRN7VIBMniarhO6pmXOcNmE=; b=4WESOwMHNWBybM7+J0/n8AX00L
	QOyv/VQdkImGvPfaGmRWPJfRLpWtTD3gTLX+XCaPnCF/pEiEnqN/m4LnaHGUlAm5B5KzeVuPSPuAg
	QxG2Mar6FUDsI+egq3hYxvGGXWTAG09NK/o69n6Pxh4jqQbqbzAKXU5kogQw/fvWBg7bwf4uB9W8P
	nGF1O5IUg3L4JiBFtwWPHrIvT8/I0/fAUneY2MHHYjDoVfZCXv6DOe6q3M0bBvpb1Y7LjmYGZpbxj
	kNc8i9dbSzHaaR5qzEGBAk0LtJBEoAsl06utTQEWAu1f81jnIb4wRpDW6ZdMHwtv7O6zspqfDiJjr
	qGj/hJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlbZ-00000004Ejd-03Gn;
	Fri, 17 Apr 2026 15:59:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlbV-00000004EjG-3mnf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:59:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B11D1DB5;
	Fri, 17 Apr 2026 08:59:30 -0700 (PDT)
Received: from [10.57.63.31] (unknown [10.57.63.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 338A23F7D8;
	Fri, 17 Apr 2026 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776441575; bh=j8FO8PzF0PieyWhQwCeTDRN7VIBMniarhO6pmXOcNmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dKqzTM+j4F58kIlpCMfJfslXRAvTIV63Jvs8XKtFPmTHYNKP2Hv8L1yPWqACikmRb
	 b+TajA/SlxbTw4g2mMiYjf5eL8R/K3voQJzpqhOA7XvIo434idPxeQ4QAJe9tq+kr2
	 S45xgvtee1/IiZZgthWVd5FLYan71Tu1mwyJ2OjU=
Message-ID: <913002a5-e002-4001-ad19-037102d1f97d@arm.com>
Date: Fri, 17 Apr 2026 17:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/30] mm: Introduce kpkeys
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20260227175518.3728055-1-kevin.brodsky@arm.com>
 <20260227175518.3728055-2-kevin.brodsky@arm.com>
 <00b24db8-0063-48d6-8bc4-e8b670d8f0d5@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <00b24db8-0063-48d6-8bc4-e8b670d8f0d5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_085938_075085_40CC9941 
X-CRM114-Status: GOOD (  14.18  )
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

On 17/04/2026 16:37, David Hildenbrand (Arm) wrote:
> On 2/27/26 18:54, Kevin Brodsky wrote:
>> kpkeys is a simple framework to enable the use of protection keys
>> (pkeys) to harden the kernel itself. This patch introduces the basic
>> API in <linux/kpkeys.h>: a couple of functions to set and restore
>> the pkey register and macros to define guard objects.
>>
>> kpkeys introduces a new concept on top of pkeys: the kpkeys level.
>> Each level is associated to a set of permissions for the pkeys
>> managed by the kpkeys framework. kpkeys_set_level(lvl) sets those
>> permissions according to lvl, and returns the original pkey
>> register, to be later restored by kpkeys_restore_pkey_reg(). To
>> start with, only KPKEYS_LVL_DEFAULT is available, which is meant
>> to grant RW access to KPKEYS_PKEY_DEFAULT (i.e. all memory since
>> this is the only available pkey for now).
>>
>> Because each architecture implementing pkeys uses a different
>> representation for the pkey register, and may reserve certain pkeys
>> for specific uses, support for kpkeys must be explicitly indicated
>> by selecting ARCH_HAS_KPKEYS and defining the following functions in
>> <asm/kpkeys.h>, in addition to the macros provided in
>> <asm-generic/kpkeys.h>:
>>
>> - arch_kpkeys_set_level()
>> - arch_kpkeys_restore_pkey_reg()
>> - arch_kpkeys_enabled()
> Another thing: why not simply drop the "arch_" stuff from these helpers?

The first two are not meant to be directly called, they're the
arch-specific implementation of kpkeys_set_level() and
kpkeys_restore_pkey_reg(), and those generic functions handle some
generic logic.

arch_kpkeys_enabled() is directly used in generic code, so I suppose it
could be renamed to kpkeys_enabled()? It's actually implemented in an
arch header so I wasn't too sure about it.

- Kevin

