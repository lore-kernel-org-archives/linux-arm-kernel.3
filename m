Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC41CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 14:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQh8GUR3BeJxb5Disg+M3ANy8pAn0cbKyg9qtGciff4=; b=Smv2TvlsFPOzafRYjUZero9sMR
	sj1UeHhJpCUs9lfUIQaf5e6lJT7uuYKcWIyLAGX9GZMQzDaNXqlTRz2BVMlE3Mbq4ki7oq3s06auv
	j9lV7MoDdUuynSkgDjz/7b0I1uN7e4uBWhZ57EiJRCn01QPJusELp2S4MKHbKVnq+QHJz24bUeedO
	XdfiPdBu9C+vXJNv40kYBHDBrs9SwXRf95JYTYIF/BjlXcN6G1S9wqQNlEdpIH6x0N5n4MDZnWYF2
	Djb06e+L9I6YLPmdkr8WxKKpqtjFFQL8bH/EyL0yVUpE2CRSyEPUGsz6U50QZNTFZC+EyWb34kBVD
	H7rwL5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0q5-000000061bw-3KeT;
	Tue, 11 Mar 2025 14:44:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0nU-000000060wB-1O0k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 14:41:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7BA5152B;
	Tue, 11 Mar 2025 07:41:42 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 673CE3F694;
	Tue, 11 Mar 2025 07:41:27 -0700 (PDT)
Date: Tue, 11 Mar 2025 14:41:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <tglx@linutronix.de>,
	Sudeep Holla <sudeep.holla@arm.com>, <peterz@infradead.org>,
	<mpe@ellerman.id.au>, <linux-arm-kernel@lists.infradead.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<pierre.gondois@arm.com>, <dietmar.eggemann@arm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>, <sshegde@linux.ibm.com>
Subject: Re: [PATCH v12 0/4] Support SMT control on arm64
Message-ID: <Z9BLlOgL3RFLCFnz@bogus>
References: <20250311075143.61078-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311075143.61078-1-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_074132_411353_F999789A 
X-CRM114-Status: GOOD (  12.89  )
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

On Tue, Mar 11, 2025 at 03:51:39PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> The core CPU control framework supports runtime SMT control which
> is not yet supported on arm64. Besides the general vulnerabilities
> concerns we want this runtime control on our arm64 server for:
> 
> - better single CPU performance in some cases
> - saving overall power consumption
> 
> This patchset implements it in the following aspects:
> 
> - Provides a default topology_is_primary_thread()
> - support retrieve SMT thread number on OF based system
> - support retrieve SMT thread number on ACPI based system
> - select HOTPLUG_SMT for arm64
> 
> Tests has been done on our ACPI based arm64 server and on ACPI/OF
> based QEMU VMs.
> 
> Change since v11:
> - Remove the check and warning for heterogeneous platform as suggested and discussed

IIUC, the ask was not to remove it completely but to allow single
threaded and same number of threads in all the multi-threaded CPUs.
Anyways that is not a must, we can just stash max_smt_thread_num value
before updating with max and see if it changes from one value to another
with value != 1. It can be done later when we want to warn such systems
if they appear in the future and we can't support them. For now, it looks
fine.

-- 
Regards,
Sudeep

