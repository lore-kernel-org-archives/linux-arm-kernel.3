Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A05C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 20:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K90Il37InTLHDiGSg0tsiskLfB/NteUqcslmDJ4TlzI=; b=uhMtea3XxYb5NRnzM6bCrub3Ib
	qNovAF8A3Ea4fEH9q9HGknx1kGYA4BUA3UO/JGJpkKZ30vBWspU3g42WMDw7t1mlCtIDeLcJNsi/J
	q2FubZ/y/9ZRBbv01MCRZDVwCyKNS1X5Y91KsUysAw7PnJ7GbRMpX5PgMRN85x1yoErNl2d5eBBS1
	s5x/yC6QkOX0ytKeHz+gj+xBsX2EM+nkdNtK7swMU9ZoE5I2ufmsubFOGGnmrGYQVL7ako9X+uRgf
	xqfLvkG6cGxbJOwhCe8hdrbrV0Fi/rfgLf43cHa52tTwiNhH+pcX2yo77fSdZ1nIq29HmXxOuPlK8
	xp7QD2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OTt-0000000CmIu-1ryy;
	Wed, 09 Sep 2026 20:01:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OTq-0000000CmHl-1Q5j;
	Wed, 09 Sep 2026 20:01:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB42B1570;
	Wed,  9 Sep 2026 13:01:07 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAF703F7B4;
	Wed,  9 Sep 2026 13:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1788984071; bh=rNi5YhSEeETSE5FQBog3k1r0aviOJOf+s/njOtyxBZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HnL3iTWUzI5pHllYz6CCHmcPV3JTw+s6qzHZZToyX8cY0TBKM130vVtUdiL2JwN+G
	 /8IMNBhLGf6IMvg5JAecf3/j2SujtIhDOIUmv1SnU6JOhvLB1iobKgEx/gCGbaofGy
	 u6UNzBwtszGomEhOE5GTTi+QO1cB/EndPZx3QVr4=
Message-ID: <c5367968-0e0d-4583-8ac9-efb3bb5b2983@foss.arm.com>
Date: Wed, 9 Sep 2026 15:01:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Shadow Stack Locking Semantics between arch's
To: Mark Brown <broonie@kernel.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: Jesse Huang <jesse.huang@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-api@vger.kernel.org,
 dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com, debug@rivosinc.com,
 andrew@sifive.com, kito.cheng@sifive.com
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
 <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
 <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
 <0ef9f4ab-4c9f-4089-bed3-f7726ec97804@foss.arm.com>
 <522bcf96-499c-491b-aaf0-34e6bbd42929@sirena.org.uk>
Content-Language: en-US
From: Bill Roberts <bill.roberts@foss.arm.com>
In-Reply-To: <522bcf96-499c-491b-aaf0-34e6bbd42929@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_130114_509692_A9B7A598 
X-CRM114-Status: UNSURE (   9.68  )
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

>>>> unsigned long locked = 0x2; // Kernel Task State -> LOCK WRITE
>>>> unsigned long cur_val = 0x3; // Kernel Task State -> WRITE and SHADOWSTACK
>>>> ENABLED
>>>> unsigned long new_val = 0x0; // Userspace Feature Change via syscall ->
>>>> DISABLE
>>>> | x86-64 | risc-v | arm64 |
>>>> | ---------- | -------- | --------- |
>>>> | Works  | Fails  | Fails     |
>>> I would not have expected that combination to work at all with the
>>> prctl() (as opposed to arch_prctl()) interface TBH, if you've locked
>>> write on you shouldn't be able to disable it.  The reason that works on
>>> x86 at the minute is that for x86 you can only change one bit at a time
>>> so the new value when disabling is effectively 0x2, not 0x0.
>> Yes, this is exactly what I am pointing out. Implementation aside, is that
>> the behavior we want?
> It seems more helpful to support changing more than one bit at once.
+ Rick in "to", I want him to weigh in as well.

I think we're still miscommunicating.  The issue is, that in the current
interface for x86 via arch_prctl, which is one bit at a time, the explicit
locking of write can be undone via turning off the shadow stack. Should
that succeed, or should that fail since it implicitly turns off write? 
Should
we preserve that as we port to prctl? Should we change that in x86
arch_prctl, was that intended?


