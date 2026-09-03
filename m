Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646EBC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 02:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVN/t+XSNYs/CadwXWQbUuePw0/c921JxlXaR/ty2BA=; b=S041Z9RcHYgaKbubIWWtWM8Xbg
	koeBiomPyOIBW5WRE0haaq2pePUCeNvcDjfMjk3Xc8BaceW3yPpDA93TACeCoDBqLsqbbOQXTc1Dg
	OB/6R1nMdfhTisN8WOiJ0gMg6R0BxFbpuYP2nQHc7BtPPSt/p5H+SW+hfMd1xX6A01LJUBQHolabh
	Yso33UGp4Z/AM4rpsgy6H2oWuVVUyciYVzDp0wWH9t5AGRhi1rhhBXzOe1N9vm310yLAwnYAmRAYx
	/DJUDesZhTI7yqNLtdmS1SrCHp9xz1n4q6NqFmZB7TS+PRbwP40zpasEX2TNeJCaJ/MsJURkQMgmm
	TZ6c4tXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1x5J-0000000GCaT-05JB;
	Thu, 03 Sep 2026 02:21:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1x5G-0000000GCZS-1B42
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 02:21:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 574131682;
	Wed,  2 Sep 2026 19:21:38 -0700 (PDT)
Received: from [192.168.20.93] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4668E3F7D8;
	Wed,  2 Sep 2026 19:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788402102; bh=FiSTVRTvLii3uBnQ9AyVG9QwTLdsozK2xfhFwWzvOvI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LkNTOb+RbqNHZjP+X+7uXUJ+qS/6Yb4OpkLD8uq20t7hu/Sml7oMppqyqVkWQoG5t
	 pEKhP0LUA4FL+fJh+feRl/RF81t08kV/rCP9RV4/KghW2Qw5tDSYr3NgadQbv8eLc+
	 JDPR8KzvsCx6yYFh6WVjzN5RUf5YnMNe2FP0xjyw=
Message-ID: <d11026b0-1faf-4de1-b562-f6e46e60ef92@arm.com>
Date: Wed, 2 Sep 2026 21:21:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Use __u128 in arm64 UAPI headers
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 David Matlack <dmatlack@google.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Andreas Grapentin <gra@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Dave Martin
 <dave.martin@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Marc Zyngier <maz@kernel.org>
References: <20260626141730.5976-1-will@kernel.org>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20260626141730.5976-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_192146_448698_25A90E99 
X-CRM114-Status: GOOD (  18.54  )
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

Hi,

On 6/26/26 9:17 AM, Will Deacon wrote:
> Hi folks,
> 
> This is version two of the patch I previously sent here:
> 
>    https://lore.kernel.org/r/20260619130835.5678-1-will@kernel.org
> 
> I even briefly queued that version up, but it exploded spectacularly
> when building the kselftests for arm64 [1] [2]. So the only change since
> v1 is the addition of a preliminary patch that adds the '__u128' typedef
> to the private copy of linux/types.h used by the tools/ directory.
> 
> I plan to take this all via the arm64 tree unless anybody objects.

This seems to be creating a interesting situation that the follow-on 
commit:
10a47fb67340 tools: linux/types.h: Add 128-bit integer types for arm64 
UAPI structures

Is missing from older kernel tooling/etc, which means the tools that end 
up pulling this header in won't build on machines running 7.3 kernel 
headers.

AKA, build/install master, switch back to an older branch and discover 
say bpftool won't build anymore.



Thanks,


> 
> Cheers,
> 
> Will
> 
> [1] https://lore.kernel.org/r/202606240441.7eZ1TIRM-lkp@intel.com
> [2] https://lore.kernel.org/r/ajvGS7UBpWzJtzkw@sirena.org.uk
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
> Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> Cc: David Matlack <dmatlack@google.com>
> Cc: Steffen Eiden <seiden@linux.ibm.com>
> Cc: Andreas Grapentin <gra@linux.ibm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dave Martin <dave.martin@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> 
> --->8
> 
> Will Deacon (2):
>    tools: linux/types.h: Add 128-bit integer types for arm64 UAPI
>      structures
>    arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers
> 
>   arch/arm64/include/uapi/asm/ptrace.h     | 12 ++++++------
>   arch/arm64/include/uapi/asm/sigcontext.h |  6 +++---
>   tools/include/linux/types.h              |  5 +++++
>   3 files changed, 14 insertions(+), 9 deletions(-)
> 


