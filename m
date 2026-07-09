Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AD9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCsAiNzXLnSt8Exj9eyYpp9m+fWK6alrT5RLyck+wvA=; b=NQABtRd+/1ltAU32M8Rvn1Gl19
	ZC5WuJORycTuXy/JdcEpCYAvj8PDgtQE7F3uc79W9fmv0+JWunllPyqra9502lVlkSXdkCPHfiy9M
	lh/tXgFA73xp6zON1n5ko1NhpkASr+IMDbSo/wBNKZQ41mSXkHbAEDTHR0it5w0heZYZGFfna8/sY
	d6aWN+z64sGPPxgPsRJa5GlqafdtxnmUKMy/j2RLItdwaLZlWV6BYtauO7fqtrTVm8DJklJu4T6K8
	E4lIbPaXP6XxEvq5Wpzst7ppcaphtdxNDlw1gNkCJlrhqdkuXYPIH6CdnXskrAl0wgEUWGBsnPY9L
	e6Z0YEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmo6-000000028gU-0rIL;
	Thu, 09 Jul 2026 11:20:42 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmo3-000000028bd-0YuC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:20:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jCsAiNzXLnSt8Exj9eyYpp9m+fWK6alrT5RLyck+wvA=;
	b=ylJoG4UFdghbxtYEvPIt/SfSw8mGuBQcMTt4Tlqb2OfSuD9eHH/TgZRibMa9NB7vu4msTQOzF
	J8BzA7tS2QoiFwlshvQd8dkJoP9SMNEuD9jc8X7CEJcxs/NSdYPK4Yb28fRY1Zd2pz5qWoW7Sof
	8k/JP/FTKSSGsiHQqdJPWkY=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gwsjd64CNz12LDl;
	Thu,  9 Jul 2026 19:11:49 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7030D2012A;
	Thu,  9 Jul 2026 19:20:28 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 19:20:25 +0800
Message-ID: <1350371d-db50-4c3d-adae-6657e2c0e3fc@huawei.com>
Date: Thu, 9 Jul 2026 19:20:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
To: Shrikanth Hegde <sshegde@linux.ibm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <tsbogend@alpha.franken.de>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <kees@kernel.org>,
	<nathan@kernel.org>, <linusw@kernel.org>, <ojeda@kernel.org>,
	<david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <menglong8.dong@gmail.com>, <oupton@kernel.org>,
	<yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>, <broonie@kernel.org>,
	<kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<thorsten.blum@linux.dev>, <chang.seok.bae@intel.com>,
	<tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <e0607dbe-4d55-4aee-8368-25110848bc09@linux.ibm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <e0607dbe-4d55-4aee-8368-25110848bc09@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_042039_643581_BAD73520 
X-CRM114-Status: UNSURE (   9.41  )
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



On 6/29/2026 12:04 PM, Shrikanth Hegde wrote:
> 
> 
> On 6/24/26 2:55 PM, Jinjie Ruan wrote:
>> Support for parallel secondary CPU bringup is already utilized by x86,
>> MIPS, and RISC-V. This patch brings this capability to the arm64
>> architecture.
>>
>> Introduce CONFIG_HOTPLUG_PARALLEL_SMT to avoid primary SMT threads
>> to boot first constraint.
>>
>> And add a 'cpu' parameter to update_cpu_boot_status() to allow updating
>> the boot status at a per-CPU granularity during parallel bringup.
>>
>> Rework the global `secondary_data` and `__early_cpu_boot_status` accessed
>> during early boot into per-CPU arrays to allow secondary CPUs to boot
>> in parallel.
>>
> 
> Shouldn't this be called CONFIG_BRINGUP_PARALLEL instead?
> Hotplug usually means disable/enable CPU at runtime.

According to my understanding, the parallelism here includes CPU bringup
and hotplug.



