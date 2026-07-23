Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B14DC44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HixnQA3D1zRULVvBB/jeOOlU4aEEUieqrpIsljYruxo=; b=1mfqyjARZFiG4BKHU/uzvYVbei
	wIS0fSImV2ZwM6/DO8TlDeVL6X0IgC0C4wylxHrk8DCShir0c0OJZxoFXQtisaclZSWNVLJ6YROKd
	EP2heFn9hYZUtB0KwX4wqa4GRpE7ehXdYeVtRqq9Lm0ZZLZ6nyGht47i0x2+FNxTKGrpkZtMii3lX
	8TH5qGerTkXfyoIYFitA74e7S8V0GV1MWIU6ugGbg2PI1iP3hhXW9rapXCcCBBZou+K3CrqJh+cUk
	nVLaa66wH//RMjQOAdmMqaRC9SfMcoAMAr4dueJC6jfOJ9PmoMbjl5YEt3rCGlTgAYJ40orS0+Uje
	0VnjI25A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmQT-0000000DVc9-3exa;
	Thu, 23 Jul 2026 05:56:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmQQ-0000000DVbi-3fWC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 05:56:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C26761595;
	Wed, 22 Jul 2026 22:56:46 -0700 (PDT)
Received: from [10.163.164.40] (unknown [10.163.164.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6B183F66F;
	Wed, 22 Jul 2026 22:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784786210; bh=KcTgjcA70uHRnfNgnpW+62gzgY1lyZt3T5+9Cc8aQjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uMlYCK/ZZIGP3HbtRNdq+Fm0VXtKTnfAr36S56S1rMUqVyuneRX2WrHTtJqGoqkw4
	 Ip+fLIXXW1O/dm9yAuhGb640Ed+ZCxFgn4py8b1G2AXme6UxLvXttA8l4C0rrzP2V7
	 7FIrTRK3FzlsdIreST9KI2TdioJgmYwOnypgakJ4=
Message-ID: <70e8596f-7316-4cc9-90e8-ff06a94c4616@arm.com>
Date: Thu, 23 Jul 2026 11:26:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: smp: distinguish secondary CPUs that hang after
 reaching head.S
To: Jinjie Ruan <ruanjinjie@huawei.com>,
 Naman Jain <namjain@linux.microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Fuad Tabba <fuad.tabba@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Pengjie Zhang <zhangpengjie2@huawei.com>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>
References: <20260722113044.1835365-1-namjain@linux.microsoft.com>
 <6e13c10f-ccc2-48c3-bf8a-d65133a33e17@huawei.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <6e13c10f-ccc2-48c3-bf8a-d65133a33e17@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_225655_214854_D56FA7CC 
X-CRM114-Status: GOOD (  11.66  )
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



On 23/07/26 8:19 AM, Jinjie Ruan wrote:
> 
> 在 2026/7/22 19:30, Naman Jain 写道:
>> When a secondary CPU fails to come online, __cpu_up() falls back to
>> __early_cpu_boot_status, but boot status 0x0 is ambiguous: it cannot
>> distinguish a CPU that never executed head.S (firmware/hypervisor never
>> dispatched it, so it never ran a single instruction) from one that
>> entered head.S, started executing, and then got stuck somewhere in kernel
>> bring-up. Add a change to let us tell those two cases apart, which
>> narrows down where to look when a CPU goes missing during boot.
> I previously encountered this issue when debugging the parallel startup
> of ARM64 secondary cores. It is difficult for the kernel to determine
> whether the secondary core is hung in the firmware or whether it has not
> executed a single instruction. So I think this motive is reasonable.

Why should kernel determine the difference here ? Would not the firmware
know if it has started any secondary CPU for the kernel which must have
come inside head.S ? If the cpu gets hung inside firmware while starting
up then the debug responsibilities belong there instead.

Still wondering what's the rationale for this change.

