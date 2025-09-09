Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE044CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVLj0bANMxYtosO9hq5/TMwAsIqDs60jYjPA2Xsu5JA=; b=mbEeLQYt4A2Ds86p7rSWY7wL4a
	a8R1dqTWa8NPu+tE3wXPqwWR3Qhk+sSo5Ffi6qXsstoI89SuvPdbFsg84HMcBn8h9a6v8hCCUYpTa
	m2nf3LMwMISkAYh3MV41qMRx5SqlVqMJmbsALs88y9YYoHWu3Lk99McvC5WVdjbzZ7N09yB6j/fWS
	0fN7Cp8/wX4ajft9lnECmOgAgmw21Yr4/kR+5jfRk4YaU1hmtp72PfRNpbpHqZHtKSuG/McwLb2ka
	cnyo9ErK3xtSkANDQj4TjZ+AgezeiZb86cCu8V4badPFEV2BtHtG03cc3oriMxi1RnoiX6eKrjg23
	O+jEXIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1ys-00000008sSw-0Szp;
	Tue, 09 Sep 2025 17:18:10 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvy8G-00000007IK5-1F0K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:11:38 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cLkds31l0z1R96G;
	Tue,  9 Sep 2025 21:08:17 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 948CB14022E;
	Tue,  9 Sep 2025 21:11:19 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 9 Sep 2025 21:11:19 +0800
Received: from [10.67.120.218] (10.67.120.218) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 9 Sep 2025 21:11:18 +0800
Subject: Re: [PATCH v3 0/3] Coresight TMC-ETR some bugfixes and cleanups
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>, <leo.yan@arm.com>
References: <20250818080600.418425-1-hejunhao3@huawei.com>
CC: Junhao He <hejunhao3@huawei.com>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<yangyicong@huawei.com>, <prime.zeng@hisilicon.com>
From: hejunhao <hejunhao3@h-partners.com>
Message-ID: <80b5a705-19bc-452c-dd46-911deb60cdbd@h-partners.com>
Date: Tue, 9 Sep 2025 21:11:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20250818080600.418425-1-hejunhao3@huawei.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.218]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_061136_524768_3C111E3B 
X-CRM114-Status: GOOD (  14.08  )
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

a gentle ping...


On 2025/8/18 16:05, Junhao He wrote:
> This patchset builds upon Yicong's previous patches [1].
>
> Introducing fix two race issues found by using TMC-ETR and CATU, Two
> cleanups found when debugging the issues.
>
> [1] https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-1-yangyicong@huawei.com/
>
> ---
> Changes in v3:
>   - Patches 1: Additional comment for tmc_drvdata::etr_mode. Update
>   comment for tmc_drvdata::reading with Jonathan's Tag.
>   - Patches 2: Replace scoped_guard with guard with Jonathan's Tag.
>   - Patches 2: Fix spinlock to raw_spinlock, and refactor this code based
>   on Leo's suggested solution.
>   - Patches 3: change the size's type to ssize_t and use max_t to simplify
>   the code with Leo's Tag.
> Link: https://lore.kernel.org/linux-arm-kernel/20250620075412.952934-1-hejunhao3@huawei.com/
>
> Changes in v2:
> - Updated the commit of patch2.
> - Rebase to v6.16-rc1
>
> Junhao He (1):
>    coresight: tmc: refactor the tmc-etr mode setting to avoid race
>      conditions
>
> Yicong Yang (2):
>    coresight: tmc: Add missing doc including reading and etr_mode of
>      struct tmc_drvdata
>    coresight: tmc: Decouple the perf buffer allocation from sysfs mode
>
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 110 ++++++++----------
>   drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
>   2 files changed, 53 insertions(+), 59 deletions(-)
>


