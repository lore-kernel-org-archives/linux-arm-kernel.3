Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E52BCD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HgU7mWg+OYM/khRpscctpXiU736oqPRJWhggBdHhP8=; b=sYrojvFg4QOBGaZ3c85va8p7Aa
	tFPiOETEi9iB3qLWFGWiscvJFuDP0bNZvy3HzHChnawm6sB4TNtq+a0MryttSzuX+W2KyByr1fswL
	zeuoc3L78pzJCjFR1c4qbGffnc1/0gR2eU/KMDRpd6XvwZNYewJYl5p0DQoHGt5Le9fh9sl8ShQsb
	akuvF//aTjg+GxCVZbQRCFm4zz4IsVqL33A6d6AC7DdDzGpaEyQEJ/w8QbbR7TlXvfLoRB4I7Hk/g
	53tEUk8udkF4Ln5c6sVDPpKBS5wlmmvF0p0rOKpYs5mBWCH3It3Do3xtvwxolppC4OEapWBbsZfTe
	Pr9U0G/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTQJ-0000000AAkC-2FTX;
	Thu, 13 Nov 2025 09:15:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTQG-0000000AAjq-3gOd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:15:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E72F812FC;
	Thu, 13 Nov 2025 01:15:11 -0800 (PST)
Received: from [10.163.74.57] (unknown [10.163.74.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 066DD3F66E;
	Thu, 13 Nov 2025 01:15:15 -0800 (PST)
Message-ID: <116d9f13-b82a-4361-9a62-c0207da25576@arm.com>
Date: Thu, 13 Nov 2025 14:45:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] arm64/mm: Add remaining TLBI_XXX_MASK macros
To: linux-arm-kernel@lists.infradead.org
Cc: ben.horgan@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20251024040207.137480-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251024040207.137480-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_011520_983250_44604499 
X-CRM114-Status: UNSURE (   7.78  )
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

On 24/10/25 9:32 AM, Anshuman Khandual wrote:
> Add remaining TLBI_XXX_MASK macros. But before that drop one redundant
> 'level' trimming operation in __tlbi_level().
> 
> Changes in V2:
> 
> - Added KVM changes required to accommodate TLBI_TTL_MASK split
> - Updated the commit message
> 
> Changes in V1:
> 
> https://lore.kernel.org/all/20251021052022.2898275-1-anshuman.khandual@arm.com/
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org> 
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kvmarm@lists.linux.dev
> 
> Anshuman Khandual (2):
>   arm64/mm: Drop redundant 'level' range trimming in __tlbi_level()
>   arm64/mm: Add remaining TLBI_XXX_MASK macros
> 
>  arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++++++--------
>  arch/arm64/kvm/nested.c           |  8 +++++---
>  2 files changed, 23 insertions(+), 11 deletions(-)
> 

Gentle ping. Any updates or concerns regarding these changes ?

