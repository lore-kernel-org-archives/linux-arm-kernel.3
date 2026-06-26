Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC3CCDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aU+ZVJWUFbXJl/s6q7mAYCg+DXSgYj0pnTTXwIBetJ4=; b=Xh/MMNpvrNXY8aQw/PrtbBIjo+
	bixHrTzISqbLZgR9X4ntPID2vMentY69bgqHH4pBysN/rXAcqlaEklszLFsz0Hh0Wy5Fv8nIt43QT
	AFYQjy39vs0ph//cbp8M+/w/YUgIrZ8TIqeF9U9OsWNuJpWq49bmeyvnkRJJYU2EZD1Dnxh9sJjZS
	KyTRphNLyCiG1y+7wmtL8cIZjhXwD11gvbM/+9RqzWK8EqtFZnRwv/hC9nTyNRSYsp/zLxLL3X1CN
	6Chpp2afoTNHgh/N8Ie5/F2gE20lSgPd0Y/XsGJM8MFD8DTvvcb9VWZ7k2fhMXu9RTxErNr362JAn
	hAUiYBpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd34d-0000000B0hF-2FEv;
	Fri, 26 Jun 2026 09:42:11 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd34a-0000000B0g7-1vAo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:42:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aU+ZVJWUFbXJl/s6q7mAYCg+DXSgYj0pnTTXwIBetJ4=;
	b=NAg6GSVVtYzuc0YRohXjHv7ZSKuSZqNCdXTDdce47xjtxRXyvyJhoLsHokEIPz+LoJluboskT
	YdVnVSSngJeTGiSGzR4LEhhB2j9S2b5krVQnGkH0P5UbMrvArAu0e0pBox2m+zUEqQuENg79hvL
	OYstE5ltzgBdFJX2CBarUp8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gmr7F12k7z1prLC;
	Fri, 26 Jun 2026 17:32:41 +0800 (CST)
Received: from kwepemo100012.china.huawei.com (unknown [7.202.195.139])
	by mail.maildlp.com (Postfix) with ESMTPS id B02B840571;
	Fri, 26 Jun 2026 17:41:49 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemo100012.china.huawei.com (7.202.195.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 26 Jun 2026 17:41:48 +0800
Message-ID: <593b5631-01ef-46ef-ba95-8ff8842bae4f@huawei.com>
Date: Fri, 26 Jun 2026 17:41:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] selftests/resctrl: Replace counter index
 references with pointers
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <zengheng4@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260522090540.444554-1-wuyifan50@huawei.com>
 <20260522090540.444554-3-wuyifan50@huawei.com>
 <77d30d2d-91db-456e-bf41-2cc31165bd2d@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <77d30d2d-91db-456e-bf41-2cc31165bd2d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo100012.china.huawei.com (7.202.195.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_024208_972626_64A2858C 
X-CRM114-Status: UNSURE (   7.36  )
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

Thanks for the review.

On 6/26/2026 6:14 AM, Reinette Chatre wrote:
> On 5/22/26 2:05 AM, Yifan Wu wrote:
>> Replace direct counter number references with pointers to remove the
>> dependency on fixed array indexing and enable the use of different
>> data structures for counter management.
>>
>> Signed-off-by: Yifan Wu<wuyifan50@huawei.com>
>> ---
> Please improve readibility here by moving the above two lines up while ensuring alignment with
> open parenthesis. Specifically:
> 	imc_counter->fd = perf_event_open(&imc_counter->pe, -1, cpu_no, -1,
> 					  PERF_FLAG_FD_CLOEXEC);
> ...
>
> With the style fixups:
> | Reviewed-by: Reinette Chatre<reinette.chatre@intel.com>
>
> Reinette

I will fix that.

Thanks,
Yifan


