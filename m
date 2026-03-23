Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA84EC01A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvPpRtGSHmPh2ch5WXgT4YRox0U7e/Twf6WZDwufkuc=; b=GOa7XNEHSiWCkNADLVNnj4G9aD
	Fq/0LV/KJw1bXF0xB4560WW3voa41eh9OrZjZyAuHqxOxKo0e51zjOgwEfdTPL2+Nr+Y3a5Gp33/2
	j84jARM4pMBb1FXglhewGpQASHd1hdoj51BhTJrzJZuhTUCUKLMcxj71db9PriUy2XaHNqYOXqfqC
	/UpeMiiVcwnEYN/xd2QLNverJ6f/WxxxJq+kTSL/WUuwpbX10lvb17XQlhKcwIjZSa+lvn+OK/yQC
	blZ+HvdM2erC+LZWiQvb+7Em2AJ0fCm58uHSlW2qvfIXPBDMZjg6Uo3H/ChbzWiDK8CvtUAK7xjJp
	qAbD3eWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bR8-0000000GMOS-0MBB;
	Mon, 23 Mar 2026 09:19:02 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bQz-0000000GMMe-0BRS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:18:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YvPpRtGSHmPh2ch5WXgT4YRox0U7e/Twf6WZDwufkuc=;
	b=aPM2gjUKW8ZRKxNj9JBqNXqrPaoQIgaGXP4M9ZVW0m2ARYbnTtOAqrUeGn8M7eKAAMXYPQ8Ac
	5at1w/uRAI1nDa2yiHhuhQV5vUt152rLWZDOR/vnFRVnat1m5vAoGTJrbehZKTEqY+RX6C/yLMe
	Ekan0/hvZj+1pPYzS1SErIA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4ffSBK2sTSzcb34;
	Mon, 23 Mar 2026 17:12:57 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F3B7404AD;
	Mon, 23 Mar 2026 17:18:45 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Mar 2026 17:18:44 +0800
Message-ID: <bf53579d-93c4-4d7a-b23e-2e0a37fc3803@huawei.com>
Date: Mon, 23 Mar 2026 17:18:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 5/9] selftests/resctrl: Refactor CPU vendor detection
 to use lookup table
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260304040334.765860-6-wuyifan50@huawei.com>
 <e72e0719-615a-470c-821e-dc02c81ef77f@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <e72e0719-615a-470c-821e-dc02c81ef77f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_021853_298252_CEF546F7 
X-CRM114-Status: UNSURE (   8.50  )
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

Hi Reinette,

On 3/13/2026 4:59 AM, Reinette Chatre wrote:
> Hi Yifan,
>
> On 3/3/26 8:03 PM, Yifan Wu wrote:
> ...
> This is very complex why not just https://lore.kernel.org/lkml/20260123044034.141247-2-tan.shaopeng@fujitsu.com/ ?
>
> Reinette
>
Fine, I will add support for ARM vendors based on the current 
implementation in the next version.

Regards,
Yifan Wu


