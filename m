Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697F0CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 03:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TK0Ooz++M6ADTeqrK3RvYBVcHOibgpzwEbnFPIpXtyg=; b=KhHqakxYbzeXzzTeDEoRNXnjWv
	/hPjB5pP3eBAO4+tKFPiq4JzHSz3ElwJ4HyN1KFleRN7nFwL4NVZK/qS+rbK2iI7vj2etVwg8HKmk
	wsrAtpJe72VAxIj4Wy+yxig3t8/E/cmB5aFfjMgO5lMAcLSfpRVfmCjRqvri0SAJSU9KUKo1SWITs
	0nTBDF5eaIKZpuehoOOvhzDfZc6dhm6aWqBqF4/y+giF5RKeLEkMpw4fJB42A44EgAxT3uABzQ+Hs
	U6q7FN9LnjK64RKTlao8QsglXioYk6+7zcNA3US1eHMZx4Ip5XuRQc+mP6vhClT4xqUYIPDEQmOww
	WkoWYZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSnbV-00000006fwA-0KbJ;
	Fri, 29 May 2026 03:09:45 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSnbS-00000006fvO-2VZQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 03:09:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780024177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TK0Ooz++M6ADTeqrK3RvYBVcHOibgpzwEbnFPIpXtyg=;
	b=rPW2L/AwIYHoiWPp2eOwE0adHHwnFnOKbGhcWqGIMYN5aqkat2mrGz4RqBT4mgPHOoKR/b
	ZlE0dx4rkYNhcztLXz5+G/x9mfCdx/BjU9xVDTgp6qacNPe3uEONvKerIPhutbo1UvuEGS
	AoYMONqZpJtbsaFd0uo/gZtTNsBzZwo=
From: Lance Yang <lance.yang@linux.dev>
To: yang@os.amperecomputing.com,
	dave.hansen@intel.com,
	jannh@google.com
Cc: xueyuan.chen21@gmail.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev
Subject: Re: [RFC PATCH 1/3] mm: make persistent huge zero folio read-only
Date: Fri, 29 May 2026 11:09:15 +0800
Message-Id: <20260529030915.37767-1-lance.yang@linux.dev>
In-Reply-To: <c0f9a811-0286-4e1c-8790-8e31d95e5819@os.amperecomputing.com>
References: <c0f9a811-0286-4e1c-8790-8e31d95e5819@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_200942_850720_09A4F9E0 
X-CRM114-Status: GOOD (  11.22  )
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


On Thu, May 28, 2026 at 11:43:40AM -0700, Yang Shi wrote:
>
>
>On 5/27/26 9:20 AM, Jann Horn wrote:
>> On Wed, May 27, 2026 at 5:55 PM Dave Hansen <dave.hansen@intel.com> wrote:
>>> On 5/26/26 20:56, Xueyuan chen wrote:
>>>> +config READONLY_HUGE_ZERO_FOLIO
>>>> +     bool "Map the huge zero folio read-only in the direct map"
>>>> +     depends on PERSISTENT_HUGE_ZERO_FOLIO
>>>> +     depends on ARCH_HAS_READONLY_HUGE_ZERO_FOLIO
>>>> +     help
>>>> +       The persistent huge zero folio is shared globally, and nothing
>>>> +       should ever change its contents after initialization.
>>>> +
>>>> +       When supported, mark the folio read-only in the direct map so such
>>>> +       writes trigger a fault instead of silently corrupting the zero contents.
>>>> +
>>>> +       If the permission change is not supported, the kernel keeps using
>>>> +       the writable persistent huge zero folio.
>>> I vote for no Kconfig options here. Why? This adds "security" with
>>> _basically_ no extra runtime cost. The runtime cost is, what, usually
>>> one kernel TLB invalidation during boot?
>> Plus potentially a bit more TLB pressure from losing a huge PUD in the
>> linear map, IDK how much we care about that.
>
>This shouldn't be a big issue on ARM64. The most ARM64 machines have 
>linear mapping mapped with PTE if rodata is on. Some machines with 
>BBML2_NOABORT support have linear mapping mapped with PUD/PMD, but those 
>machines typically have large memory, having 512 PMDs instead of 1 PUD 
>shouldn't be a noticeable issue IMHO.

Cool! Thanks Dave, Jann, Yang!

Yeah, that sounds reasonable. No need for another Kconfig option here;
one less knob for people to care about :D

For arm64, I think Yang has it:

1) Without BBML2_NOABORT, rodata=on already forces the linear map down
to PTEs, so nothing really changes there for most machines.

2) With BBML2_NOABORT, this may cost us 512 PMDs instead of one PUD for
that. I don't expect that to be noticeable either ;)

So let's drop the option in the next version.

Cheers, Lance

