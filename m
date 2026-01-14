Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511E4D31A14
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLNh2wA/PXAzn5iAOzhN43zmPYjTGCcMX1amUvUYELw=; b=YPAfdmAA+YRSLYBxDRDaxSAUrI
	+z1c9DVgVx9X4Mn0KasIMeKFWUDlWL3jTI26nM7bZh05P0SkrExKqvuGrq0kVUVc/wp58lrceGNqN
	0YODKXEfKL2m9gmJBLtmzpysa9t6vmORlSSvoo2n9mtv0Lpwt867fF4zM9z6+EiKrrBYxpI3zi14m
	TPYEbPve2779oUBDHsze/PDyoo6vmxkuZCWZdoAz0OQ4UPsiVc30el4Nu9in3jJwTdatD7ur6Y6/k
	gYh0G+oQMWpHCGps4nHYqAROcbcshZdVCSu7NI3JikGFX81qhxWZOm4NGGRY/KgAt+xzodXMDvWh6
	AtVhGQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfujs-000000089Zw-1VtD;
	Wed, 14 Jan 2026 06:52:20 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfujp-000000089ZC-2DfV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 06:52:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tLNh2wA/PXAzn5iAOzhN43zmPYjTGCcMX1amUvUYELw=;
	b=cAeCk5aSt31IFJZVOgpRVLQd5E4a4/SD9DTZ8Zil5w1wDc9RLEHtPYlgfO5rtdQfw9QVQp4Il
	9T/BCYndRyvQ34KwYERbF8Ca4Zmc0bn7+Vxdqc6MP87Yh3iEMWWQat/juVEltnU6BBYYJ3tWn7h
	vinYn2O43UlvcRKNXbFIk+o=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4drcCW4JrZz12LKT;
	Wed, 14 Jan 2026 14:48:55 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id DA5EC4056B;
	Wed, 14 Jan 2026 14:51:55 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 14 Jan
 2026 14:51:54 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <james.morse@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<catalin.marinas@arm.com>, <corbet@lwn.net>, <dave.martin@arm.com>,
	<david@kernel.org>, <dfustini@baylibre.com>, <fenghuay@nvidia.com>,
	<gshan@redhat.com>, <joey.gouly@arm.com>, <jonathan.cameron@huawei.com>,
	<kobak@nvidia.com>, <kvmarm@lists.linux.dev>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<maz@kernel.org>, <oupton@kernel.org>, <peternewman@google.com>,
	<punit.agrawal@oss.qualcomm.com>, <quic_jiles@quicinc.com>,
	<reinette.chatre@intel.com>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<suzuki.poulose@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<sunnanyong@huawei.com>, <zengheng4@huawei.com>
Subject: Re: [PATCH RESEND v2 0/45] arm_mpam: Add KVM/arm64 and resctrl glue code
Date: Wed, 14 Jan 2026 14:51:49 +0800
Message-ID: <20260114065149.1108631-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_225218_146608_916ABFAA 
X-CRM114-Status: GOOD (  18.84  )
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

> From: Ben Horgan <ben.horgan@arm.com>
> Date: Fri, 19 Dec 2025 18:11:02 +0000
> Subject: [PATCH v2 00/45] arm_mpam: Add KVM/arm64 and resctrl glue code
>
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

At the LPC resctrl micro-conference, Babu also mentioned the PLZA proposal
as an attempt to address the issues raised above. Seems like no clear
interface was presented yet. Wait to see what new interface that solution
will introduce.

One last thing, please add me to the CC list for future MPAM patch series.
I'll provide timely testing on my local aarch64 environment and review
feedback. Thanks.


Best Regards,
Zeng Heng

