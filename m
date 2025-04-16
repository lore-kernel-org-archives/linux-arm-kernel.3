Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F33EC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcpMumGdoFHZtKvc+1E9wdAtxOXmDaQb5hrTUP9KctU=; b=rWc+z6q1T8qoqFSOHtb8/UOX5P
	h83BaeDMEFhjiT8zWX1R9bHlzbfFZ1WUOaM/g16qHWmiHfChdT0my9cXwljbZj4s4epjyk+46RWkC
	3dTKe/bxXzUS+jfgaCpDkqNF7KP6XWlds/ToT8NqOYSfYwHm8EGtUS/kp5fHanEtuWijiti74HQAp
	mfgK7iqEgffFOcwJpG9J4oT8WMzFBRB1fAKE8XOqetFl6/IbPnt9Nkkw4fT9MZm7OvM4xa1CFQZiK
	4qglvyoGuJsF6Oh4X93yxzqGw+E0X1/R5Md4TJgpvTtDNhFxNDQOLodemnVeVExdNQOFX1Ny+scCU
	k8MBRLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52Uy-00000009blh-0k9q;
	Wed, 16 Apr 2025 13:08:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52T7-00000009bav-3ib8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 13:06:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FF9C1595;
	Wed, 16 Apr 2025 06:06:17 -0700 (PDT)
Received: from [10.57.43.31] (unknown [10.57.43.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979713F694;
	Wed, 16 Apr 2025 06:06:17 -0700 (PDT)
Message-ID: <3690bbfd-a426-4fa7-b2ae-5a665c4d5c7a@arm.com>
Date: Wed, 16 Apr 2025 14:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Remove checks for broken Cavium HW from the PI
 code
To: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Oliver Upton <oliver.upton@linux.dev>
References: <20250416123534.1108220-1-maz@kernel.org>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250416123534.1108220-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_060621_967406_CC11275F 
X-CRM114-Status: GOOD (  16.47  )
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

On 16/04/2025 13:35, Marc Zyngier wrote:

> Calling into the MIDR checking framework from the PI code has recently
> become much harder, due to the new fancy "multi-MIDR" support that
> relies on tables being populated at boot time, but not that early that
> they are available to the PI code. There are additional issues with
> this framework, as the code really isn't position independend *at all*.
>
> This leads to some ugly breakages, as reported by Ada.
>
> It so appears that the only reason for the PI code to call into the
> MIDR checking code is to cope with The Most Broken ARM64 System Ever,
> aka Cavium ThunderX, which cannot deal with nG attributes that result
> of the combination of KASLR and KPTI as a consequence of Erratum 27456.
>
> Rather than adding extra complexity for something that is actually
> a very dead horse, let's simply drop that check. On my own machine,
> the firmware doesn't provide a KASLR seed, preventing the pathological
> case to show up.
>
> And if someone does have a broken box that passes a seed to the kernel,
> "nokaslr" on the command-line is an easy enough workaround.
>
> Fixes: c8c2647e69bed ("arm64: Make  _midr_in_range_list() an exported function")
> Reported-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/3d97e45a-23cf-419b-9b6f-140b4d88de7b@arm.com
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Oliver Upton <oliver.upton@linux.dev>

Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Thanks for the fix ! I can confirm that it resolves all boot failures I 
was observing previously.
No instances of firmware seeding KASRL in the couple of machines I am 
testing either.

Regards,
Ada


