Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED443CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xALkElOdfyu9/f8jsAg0AI/2/yERUZaFQ9NIUKO7cmY=; b=VSw7bvuG0fFuXxNqMaORqubrKO
	amn6XZZNuob/9j4cTTzzL5RTZXoHDdu3Yrr6KybLfGY1nFRDwnPPBOAXjrtKmrNKEqgDh98jhr04u
	d/cQnnhOiYwiMBk7ITUCWBMUf21mIfH/fYcrQh3MsQt7pnhfxEY13vaAHmqN0xBWKufnc4Oxtt4p0
	k8agEwOZxpF/ggwaay/Zx06M/eLD6A6UIGIm7SKV0BAzZJomYLHtk5GrXLmT9aAnzWQisqJeIZenD
	RRhMI504II6i+WXP9ZjCGLi4qlJkPfvzN7hSJoTAiZUI10XBxAiS3cKBWAd7VEA1SjgcOz+2onKRh
	Zqb4FjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvW3Z-0000000FCXg-0Esv;
	Mon, 08 Sep 2025 07:12:53 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvW0k-0000000FBhh-1gar
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:10:00 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cKydW2lj9zdchP;
	Mon,  8 Sep 2025 15:05:19 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id DC2671402C8;
	Mon,  8 Sep 2025 15:09:50 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Sep 2025 15:09:50 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Sep 2025 15:09:49 +0800
CC: <yangyicong@hisilicon.com>, <sudeep.holla@arm.com>,
	<james.clark@linaro.org>, <robh@kernel.org>, <anshuman.khandual@arm.com>,
	<jonathan.cameron@huawei.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH v2 0/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT
 cores
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20250820084534.28037-1-yangyicong@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <43f0325e-4199-a0e4-eeba-b726a6acbda4@huawei.com>
Date: Mon, 8 Sep 2025 15:09:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250820084534.28037-1-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_000958_603256_8D60FAFD 
X-CRM114-Status: GOOD (  10.62  )
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

On 2025/8/20 16:45, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> This patchset fixed CPU_CYCLES counting on SMT system. CPU_CYCLES can use
> PMCCNTR_EL0 which will count the hardware processor clock rather than the
> PE clock (ARM DDI0487 L.b D13.1.3) on SMT cores which fails the users
> expectation as CPU_CYCLES (0x0011) is defined to count on each PE cycles.
> Fix this by avoid using PMCCNTR_EL0 on SMT cores when counting CPU_CYCLES.
> 
> Changes since v1:
> - remove redundant comment and add tags on Patch 1/2
> - detect the SMT implementation during PMU probe rather than runtime
> Link: https://lore.kernel.org/linux-arm-kernel/20250812080830.20796-1-yangyicong@huawei.com/
> 
> Yicong Yang (2):
>   perf: arm_pmuv3: Factor out PMCCNTR_EL0 use conditions
>   perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
> 
>  drivers/perf/arm_pmu.c        |  3 +++
>  drivers/perf/arm_pmuv3.c      | 39 +++++++++++++++++++++++++++++++++--
>  include/linux/arch_topology.h | 11 ++++++++++
>  include/linux/perf/arm_pmu.h  |  1 +
>  4 files changed, 52 insertions(+), 2 deletions(-)
> 

