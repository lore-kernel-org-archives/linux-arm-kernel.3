Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE09BCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 02:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45Oce1pquAJ/ph1CD+IV4tnCpI3/A8JF18u5iSlgQ6E=; b=DlQ2lgLBEEUUO4RqcNIIhD99BN
	6hxhqSzKZkONWOW08tBCNLSf4n6Qh/tzZkAXxmYdWT/0HRQ6VSFxbJVICb9gGeFOUCO/TID60yn+8
	gDzufbjrvTbOW9gd37+wU8a9z/73Ls5RojCIS5vNkGb/UikKb33OiobWwssgKTK4BbF9ZFFIJ1DFH
	cKTNQ+MLnlZZxC6zNqhGZ6ofCn4BKAkkChGcftm0pue2I62DmkszejPYcXJXd/O/QM6+5xT/R+YIT
	Hin7c+7aSvuXjkpn37W0BWbnkOck2e3vgTCyYvh8c2yFDgwb/ThoD/7J+UtllIDix4eDSNggIdFn7
	lGPcrA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPrr-00000004xhv-1SlD;
	Thu, 28 May 2026 01:49:03 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPrn-00000004xgj-43f3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 01:49:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=45Oce1pquAJ/ph1CD+IV4tnCpI3/A8JF18u5iSlgQ6E=;
	b=P5Aj2Foka2SXI/yWFmcQVzF1p22oxugSORQnKUOEP2x/dor1NhdJJ2UqHztZg+IzD5lNnLkD7
	5iAOY8EZvz3CY7St37xpVMSCCQbk4aBRWwKUpA6Q83biZWzrZZsG2hUVYFKd1vk51mhoNjSqyP9
	SJTzAkrZV3rzV1MmnO2piEg=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gQq2N5whqzKm98;
	Thu, 28 May 2026 09:41:00 +0800 (CST)
Received: from kwepemj100016.china.huawei.com (unknown [7.202.194.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 5C43E40571;
	Thu, 28 May 2026 09:48:49 +0800 (CST)
Received: from [10.174.177.15] (10.174.177.15) by
 kwepemj100016.china.huawei.com (7.202.194.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 28 May 2026 09:48:48 +0800
Message-ID: <e9a85c2f-d720-40a7-90f8-e999e4f0dc22@huawei.com>
Date: Thu, 28 May 2026 09:48:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <mawupeng1@huawei.com>, <bp@alien8.de>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, <tanxiaofei@huawei.com>, <linuxarm@huawei.com>,
	<liuyonglong@huawei.com>
Subject: Re: [PATCH v2] ACPI: APEI: Handle repeated SEA error storms
To: <hejunhao3@h-partners.com>, <rafael@kernel.org>, <tony.luck@intel.com>,
	<guohanjun@huawei.com>, <mchehab@kernel.org>, <xueshuai@linux.alibaba.com>,
	<jarkko@kernel.org>, <yazen.ghannam@amd.com>, <jane.chu@oracle.com>,
	<lenb@kernel.org>, <linmiaohe@huawei.com>
References: <20260527082707.2013499-1-hejunhao3@h-partners.com>
From: mawupeng <mawupeng1@huawei.com>
In-Reply-To: <20260527082707.2013499-1-hejunhao3@h-partners.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.15]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemj100016.china.huawei.com (7.202.194.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_184900_612238_92F86A7A 
X-CRM114-Status: GOOD (  13.68  )
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



On 周三 2026-5-27 16:27, Junhao He wrote:
> When hardware memory corruption occurs and a user process accesses the
> corrupted page, the CPU triggers a Synchronous External Abort (SEA).
> The kernel invokes do_sea() to handle the exception, which calls
> memory_failure() to handle the faulty page.
> 
> Scenario 1: Memory Error Interrupt First, then SEA
> The page is already poisoned by the memory error interrupt path. The
> subsequent SEA handler sends a SIGBUS to the task, which accesses the
> poisoned page. This flow is correct.
> 
> Scenario 2: SEA first, then memory error interrupt (problematic scenario)
> If a user task directly accesses corrupted memory through a PFNMAP-style
> mapping (e.g., devmem), the page may still be in the free-buddy state when
> SEA is handled. In this case, memory_failure() will poison the page without
> invoking kill_accessing_process(), and then takes the free-buddy recovery
> path.
> 
> After the CPU returns to the task context, the task re-enters the SEA
> handler due to the same access. However, ghes_estatus_cached() suppresses
> all subsequent entries during the 10-second window, preventing
> ghes_do_proc() from being called. This suppression blocks the
> MF_ACTION_REQUIRED-based SIGBUS delivery, causing the kernel to fail to
> kill the task immediately. Consequently, the process keeps re-entering
> the SEA handler, leading to an SEA storm. Later, the memory error
> interrupt path also cannot kill the task, leaving the system stuck in
> this repeated loop.
> 
> The following error logs are explained using the devmem process:
>   NOTICE:  SEA Handle
>   [Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 9
>   [Hardware Error]: event severity: recoverable
>   [Hardware Error]:   section_type: ARM processor error
>   [Hardware Error]:    physical fault address: 0x0000001000093c00
>   [T54990] Memory failure: 0x1000093: recovery action for free buddy page: Recovered
>   [ T9955] EDAC MC0: 1 UE Multi-bit ECC on unknown memory
>            (page:0x1000093 offset:0xc00 grain:1 - APEI location: ...)
>   NOTICE:  SEA Handle
>   NOTICE:  SEA Handle
>   ...
>   ...        ---> SEA storm
>   ...
>   NOTICE:  SEA Handle
>   [ T9955] Memory failure: 0x1000093: already hardware poisoned
>   ghes_print_estatus: 1 callbacks suppressed
>   [Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 9
>   [Hardware Error]: event severity: recoverable
>   [Hardware Error]:   section_type: ARM processor error
>   [Hardware Error]:    physical fault address: 0x0000001000093c00
>   [T54990] Memory failure: 0x1000093: already hardware poisoned
>   [T54990] 0x1000093: Sending SIGBUS to devmem:54990 due to hardware memory corruption
> 
> To resolve this, return an error when encountering the same SEA again.
> The subsequent SEA handler invocation uses arm64_notify_die() to send a
> SIGBUS signal to the task, which terminates the process and prevents it
> from re-entering the handler loop.
> 
> Signed-off-by: Junhao He <hejunhao3@h-partners.com>

Reviewed-by: Wupeng Ma <mawupeng1@huawei.com>


