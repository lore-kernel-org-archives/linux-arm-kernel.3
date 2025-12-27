Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32449E8FDD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2ok+ix3vEQ6p5c36SdDS0HeFCDLTm2fYHCT0RbXVgI=; b=Zw5yGHPJD/H1hF
	+lFR/rrNSGvpKDEZocYH/9Xb2FxiO87XsSvpeQ0TQSd7wHyB7IQdf6/yYshZarfQDN0vrDQkfYFzU
	UU/cNoiQKTqPjWTyhdVW9l5yyR2ux+tt6jXK7Z1r6cIt6xJC76DDTzK2RcnFGSo9VrfKW1aMPqxtF
	wk+RUlVDeRkQXdSaVP5hxjd1WIaxuXnIbgjwpe4v37ui3HB/n45h4DU+UfrK/6HWjYpx94sw+yaGg
	f5aqs5CXTL0h4RlxtRl5CdduHm02z5g4dIlf2oitEtUYUjNeB4OW3VqjSj78RluZUjWX5CyOY0+1W
	+VlDPuBl0ehUYwMIZshA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZPOU-00000001nY7-2ulQ;
	Sat, 27 Dec 2025 08:11:22 +0000
Received: from [113.46.200.227] (helo=canpmsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZPOQ-00000001nXg-0IAq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 08:11:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=J2ok+ix3vEQ6p5c36SdDS0HeFCDLTm2fYHCT0RbXVgI=;
	b=H+9fkiU4frIcdc48Rhq3gZIW9YLvewGIxSr6lK0OzkR2t7LpkPTg90khcCKpmNQFOk+3lpw7/
	CTjWkiXUUyy8P54arcb6LyzBEkbeZHourDgwCJ/JpAus18orA7CYYKaPp5wuVo77owvqM0PZ8RQ
	P+dvufmSQ5nH36V91PM9rVk=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4ddZpg0R0ZznTW4;
	Sat, 27 Dec 2025 16:07:39 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id B5B61405AD;
	Sat, 27 Dec 2025 16:10:49 +0800 (CST)
Received: from [10.174.178.24] (10.174.178.24) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 27 Dec 2025 16:10:48 +0800
Message-ID: <6aa59eae-2632-7e4d-ff6b-565fe5c2649f@huawei.com>
Date: Sat, 27 Dec 2025 16:10:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/45] arm_mpam: Add KVM/arm64 and resctrl glue code
Content-Language: en-US
To: James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-26-ben.horgan@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <20251219181147.3404071-26-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.24]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_001118_921192_7231B40F 
X-CRM114-Status: GOOD (  13.03  )
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
Reply-To: 20251219181147.3404071-1-ben.horgan@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> One major departure from the previous snapshot branches referenced in the
> base driver series is that the same MPAM setting are used for kernel-space
> and user-space. That is, MPAM1_EL1 is set to the same value as MPAM0_EL1
> rather than keeping the default value. The advantages of this are that it
> is closer to the x86 model where the closid is globally applicable, all
> partids are usable from user-space and user-space can't bypass MPAM
> controls by doing the work in the kernel. However, this causes some
> priority inversion where a high priority task waits to take a mutex held by
> another whose resources are restricted by MPAM. It also adds some extra
> isb(). I would be interested in opinions/data on the policy for MPAM in
> kernel space, i.e how MPAM1_EL1 is set.

Another advantage is that, given the small size of the L2 cache,
frequent switching of MPAM configurations between kernel and user modes
can cause cache-capacity jitter, making it difficult to isolate
interference from noisy neighborhood.

However, in addition to the issues mentioned above, updating the
MPAM1_EL1 configuration also exposes interrupt handling to the MPAM
settings of the current task.

I still agree with the current modification of setting MPAM1_EL1 to the
same value as MPAM0_EL1. However, the ARM MPAM hardware supports more
flexible configuration schemes than x86 RDT and another approach is also
worth considering: Software can let a control group choose whether
kernel mode follows the user mode MPAM settings, or whether the kernel
mode configuration is delegated to the default control group, though
this may change the existing user interface.


Best Regards,
Zeng Heng

