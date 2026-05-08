Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4561CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 10:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6e0z9Fq3rKswkTRf1vtuOywIXadBc/5Ah9+zbapMCU=; b=RZ5jQOMuCZy7andaVK54I8v1wE
	lWs6X2QubPs3ciyIbw6ADYNSESg/MTR5YBYjV/CXtc49V4THMfjmI7CwMN5c3P7xB9FTHb1J7EnN0
	eu65OFhJI2bv/xrH+UonGd20fdTNBRGsv4BNhlzeGTi5LrBI3TZuHVeGcGlpHOTd/5+m29TWU+STz
	oYi2W+ORmgvCFWVbou6aly3scaUFP5P/dSLuIRCXpWz7iWf39Bj9mMnmXjoZN3HV0EI4U17oQ74/0
	wIl7pkgVtPs76wxK9g8uWo+QkfVl3aBmLfIsTX0IG30hndfkSVX8ow8t82mOsEk9sw4ZO0sgbnfBb
	VzgdReeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIEL-00000006Ca0-0rNC;
	Fri, 08 May 2026 10:14:49 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIEH-00000006CYJ-0DJq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 10:14:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=C6e0z9Fq3rKswkTRf1vtuOywIXadBc/5Ah9+zbapMCU=;
	b=mlqfXGjDyOprcq5nmRLPit/wOEgenglgNVHFK3NOu17/nwWnZiDNUx22T348cGpphJOGrhFtJ
	fOXes6jBxahks92vMwElvTaXKUtqsf1DyvCSQAujVp07gVGv/lCVqNXsrlqWstuD5XYvAIQaeJd
	93Z8DMg6k1x+Djr5CWzOO6E=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gBlCL2jyGzLlSC;
	Fri,  8 May 2026 18:06:54 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id F031D40572;
	Fri,  8 May 2026 18:14:27 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 May 2026 18:14:27 +0800
Message-ID: <86683f18-2d11-4e20-a3b3-736da89e8cf1@huawei.com>
Date: Fri, 8 May 2026 18:14:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] selftests/resctrl: Introduced linked list
 management for IMC counters
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260410093352.3988125-1-wuyifan50@huawei.com>
 <20260410093352.3988125-2-wuyifan50@huawei.com>
 <b1d3a653-79a5-44db-8d57-c052ae537823@intel.com>
 <e4a2b49a-0efe-4942-9683-9c9a5af1b12a@huawei.com>
 <4d600e39-686d-4f0f-8a74-6d55bffac70a@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <4d600e39-686d-4f0f-8a74-6d55bffac70a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_031445_736160_ED0057D8 
X-CRM114-Status: GOOD (  21.82  )
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

Hi Reinette

On 5/8/2026 12:13 AM, Reinette Chatre wrote:
>> Calling cleanup_read_mem_bw_imc() in the error exit path may be intended
>> to prevent resource leaks. However, this results in the function being called
>> repeatedly in both the error exit branch and test_cleanup().
> You are correct and calling it repeatedly is ok. When cleanup_read_mem_bw_imc() is
> called from test_cleanup() after a failure in parse_imc_read_bw_events() then it
> will find that the list is empty and just be a no-op. This is safe.
>
>> Is there any specific intention behind calling it in parse_imc_read_bw_events()?
> The motivation behind calling it in parse_imc_read_bw_events() is to not leave this
> memory allocated when this function fails. A function having a single responsibility
> is easier to use and maintain since a caller does not need to take into account that
> when the function fails it also needs to have additional responsibility to clean up
> the state left behind by it.
>
> There may be some patterns where caller needs to clean up after a failure but that is
> usually done in an obvious way where the caller_immediately_ does the cleanup on failure
> but here this dependency is well hidden in this implementation with test_cleanup() being
> called so far from parse_imc_read_bw_events(). This hidden dependency makes this code
> difficult to use and maintain.
>
>> Or should the cleanup be uniformly handled in test_cleanup()?
> Handling it only in test_cleanup() may work in current execution flow but if the code is
> ever re-factored this would result in a memory leak. It is not custom that callers need
> to clean up state when a function fails and since this allocation is buried deep within the
> execution flow I see this as a latent bug just waiting to be triggered.

Thank you for the detailed explanation. I understand the rationale now.

I will explicitly add cleanup calls in the error exit path in the next 
version.

Best regards,

Yifan



