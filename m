Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01277C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WsTGWxVnSc0KtrZO8pZRE2QxEimJ5VHS+fEe/s67Mc=; b=KqiYTgFf4OlXyd0AMNQb7ry5cM
	Uwh8Ep7llqSO7luVjhLMQB3/81LuQH7Y8ZTot6edBrhlONssTEYos1B02JsVMwFYsRIpMcgj5WE75
	dGEFfmD3hKaFsZQ7vWdTg1v+9nk8R2JtxV6+Z8sQ1XC+bOoAhOXig0Ke4GTbLnn0tpNnOG6uLjQx4
	zIa9zt8sBlp8MY9I0AvDrxfj/vJP0WcUyi7d/pQ2gDtOI+OiNDACT93ss+1WGXE6W1FPPdcauL9Hq
	rwwoT/UFy63wCSrAAjb7fDT7A+rp+UpUGk6znquJgu1Xgc59mgcEv3uhOvwzZso+snQdkmyjdmFf2
	zPAJaV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8y7-000000025gw-18W0;
	Wed, 26 Aug 2026 08:26:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8y4-000000025gH-0dkM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:26:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86300176A;
	Wed, 26 Aug 2026 01:26:39 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFEB73F7D8;
	Wed, 26 Aug 2026 01:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787732803; bh=ffC2F63al/Ef4j0Fsqvq/nU7950u0pWRTQY2EH1H4VU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ZC8GM8fDR7M8D3wHsts2j8AaJEydieWRKVP/M3m4CnifF1ZDE6S0lE2RAVi9JFwJ0
	 /ccpoUH4fpT7dy1sqWgVzFl5uGlz5Ksi/9s37MKsx8h9C4qLYM42+QDKNqKNStIrPS
	 ZKekhtKJHE1MtkX2XZtkNmQ9bf8aXbKJ4zHErBUc=
Message-ID: <30d29c7a-3d66-498f-9777-8dadbb0a4584@arm.com>
Date: Wed, 26 Aug 2026 09:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] selftests/arm64: Treat KSM merge_across_nodes as
 optional
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>, Yeoreum Yun
 <yeoreum.yun@arm.com>, Mark Brown <broonie@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
 <20260825111929.2882324-3-usama.anjum@arm.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260825111929.2882324-3-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_012644_236811_A045E6F6 
X-CRM114-Status: GOOD (  12.50  )
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



On 25/08/2026 12:18, Muhammad Usama Anjum wrote:
> The MTE KSM test requires write access to KSM sysfs but does not check
> that it is running as root. It also unconditionally saves, enables and
> restores the merge_across_nodes attribute. The kernel only creates this
> attribute when CONFIG_NUMA=y, so a non-NUMA kernel prints the following
> message three times even though every KSM subtest passes:
> 
>   # ERR: missing /sys/kernel/mm/ksm/merge_across_nodes
> 
> Skip the test when it is not running as root. Check that the optional
> attribute is readable and writable, treating ENOENT as its expected
> absence on non-NUMA kernels and skipping the test for other access
> failures. Only save, enable and restore the attribute when it is
> available.
> 
> Check MTE availability before the privilege and sysfs checks so systems
> without MTE retain the existing feature-unavailable skip result.
> 
> This preserves the existing behavior on NUMA kernels without requiring
> NUMA or reducing KSM coverage on single-node systems.
> 
> Fixes: f981d8fa2646 ("kselftest/arm64: Verify KSM page merge for MTE pages")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

...

