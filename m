Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F7BC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:CC:To:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=03IN9psW58OLBjVCpdH9xLQcWCxa5MxX7iOqlW/8RHs=; b=DWPOupsc6JniGO/NDA8/9QGg+P
	sim2u8J7EPFhJxGJzQGeyC70SDKfuIwTT5OJ4YO4LcG+OSzua5oaCIXv3jS9I+ORqfIbzJNHcdlIa
	sIJTVmIqnWX17k2x6kYtfl9woEelsHVVyzJ+9QOtfe1Bza9/+HHBT5ayUbzOjb8afcJBuQ9vk4kAE
	/hsIiBNffQ/BQ/dQM7lMsbKAD+dc/Gj2/oBuJPmTExahv2+ZUHfHdmQVX/P0jWgBpMmegTw1NcAWe
	wpnXzaoVPa4bjchpKUTgpe5RI5Jfga/fEkee6G8orNX9m9KROMetLTyIj3ig2HftQC3xetoh6ocn9
	3+8Y2YiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2b4-0000000Bqcq-2AGz;
	Wed, 15 Jan 2025 12:34:10 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2Zn-0000000BqPl-2VFk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 12:32:53 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YY51N2D3wz22lFl;
	Wed, 15 Jan 2025 20:30:16 +0800 (CST)
Received: from kwepemh200008.china.huawei.com (unknown [7.202.181.115])
	by mail.maildlp.com (Postfix) with ESMTPS id 03DA7180042;
	Wed, 15 Jan 2025 20:32:39 +0800 (CST)
Received: from [10.174.176.125] (10.174.176.125) by
 kwepemh200008.china.huawei.com (7.202.181.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Jan 2025 20:32:37 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: [Question] Call trace occurs occasionally when a rollback is
 performed upon CPU online timeout
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>, Gavin Shan <gshan@redhat.com>, James Morse
	<james.morse@arm.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>, Douglas Anderson
	<dianders@chromium.org>, Puranjay Mohan <puranjay@kernel.org>, Luchunhua
	<luchunhua@huawei.com>
CC: "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, "wanghaibin.wang@huawei.com"
	<wanghaibin.wang@huawei.com>, Zenghui Yu <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>
Message-ID: <8ec1a40a-61a6-d8f3-074d-6cc8697f261d@huawei.com>
Date: Wed, 15 Jan 2025 20:32:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.125]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh200008.china.huawei.com (7.202.181.115)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_043252_001021_56FF4A85 
X-CRM114-Status: UNSURE (   9.53  )
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

Hi all,

I have a question about CPU online/offline. In the following test 
scenario, various tasks(iperf,fio,sve,...) are executed in a VM with 6 
vCPUs. At the same time, repeat online/offline operations on two of the 
vCPUs through /sys/devices/system/cpu/cpuX/online. After running for 
many hours,some calltrace will appear in the guest.
The first, WARN_ON_ONCE(test_bit(KTHREAD_SHOULD_PARK, &kthread->flags)) 
is triggered.
> Call trace:
> kthread_park+0xd0/0xdc
> takedown_cpu+0x4c/0x140
> cpuhp_invoke_callback+0x160/0x6e0
> _cpu_up+0x1a4/0x200
> cpu_up+0xbc/0x100
> cpu_device_up+0x20/0x30
> cpu_subsys_online+0x4c/0xb0
> device_online+0x7c/0xa0
> online_store+0xd0/0xe0
> dev_attr_store+0x20/0x34
> sysfs_kf_write+0x4c/0x5c
> kernfs_fop_write_iter+0x130/0x1c0
> new_sync_write+0xec/0x18c
> vfs_write+0x214/0x2ac
> ksys_write+0x70/0xfc
> __arm64_sys_write+0x24/0x30
> invoke_syscall+0x50/0x11c
> el0_svc_common.constprop.0+0x68/0x164
> do_el0_svc+0x34/0xcc
> el0_svc+0x20/0x30
> el0_sync_handler+0xb8/0xc0
> el0_sync+0x160/0x180

The second, BUG_ON(!irqs_disabled() && !IS_ENABLED(CONFIG_PREEMPT_RT)) 
is triggered.
> Call trace:
> irq_work_run_list+0x64/0x70
> smpcfd_dying_cpu+0x24/0x34
> cpuhp_invoke_callback+0x160/0x6e0
> _cpu_up+0x1a4/0x200
> cpu_up+0xbc/0x100
> cpu_device_up+0x20/0x30
> cpu_subsys_online+0x4c/0xb0
> device_online+0x7c/0xa0
> online_store+0xd0/0xe0
> dev_attr_store+0x20/0x34
> sysfs_kf_write+0x4c/0x5c
> kernfs_fop_write_iter+0x130/0x1c0
> new_sync_write+0xec/0x18c
> vfs_write+0x214/0x2ac
> ksys_write+0x70/0xfc
> __arm64_sys_write+0x24/0x30
> invoke_syscall+0x50/0x11c
> el0_svc_common.constprop.0+0x68/0x164
> do_el0_svc+0x34/0xcc
> el0_svc+0x20/0x30
> el0_sync_handler+0xb8/0xc0
> el0_sync+0x160/0x180

According to my analysis, the root cause of the question is because the 
vCPU online times out, but in fact the vCPU was successfully online. 
Rollback is performed due to timeout. During the rollback, the 
secondary_start_kernel is still executing, resulting in the above call 
trace. So is this a bug? If so, how should it be repaired?

The reason for the timeout has not been found. It is suspected that it 
is caused by excessive task pressure. If you have other ideas, please 
point them out.

Thanks,
Kunkun Jiang

