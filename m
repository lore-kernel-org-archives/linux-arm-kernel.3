Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D235AE6F084
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9g1CRCPxV0go/ERxSxLmjMTZlU4TJtp+tX3M9PS4Q4=; b=DroHaGtIh0Ob46gYH3ydyQ78KN
	9uxlatgQi1KHRMBi8r/c25YJRzhz6HcGEhjZCc8AHfEuIqVoQl1A0ry8XDR+Cy5gVp+xl5DikkMXt
	5UAa/9XZPA/rBxe4fLoLLFLAQkcc87EKDIwCUGFq5tbKQGc1qAIo16j6kpuMSp12tcRK8DjL7cf/J
	PjudNANmAld8YkMmecZUVvwPIMF0xIcpa79BJdZHxja9Atd4amZ2RBAsOynS/rJRxfiVKcv/iqWiq
	fJ+XibJy/8H2sN3RF0s94opMD0AYHGhg6Nu8z5A1Uzy7e3Oz+OAgxc9o3ZwSGys/Y+npLLe/Lsvz2
	ixzgRMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1Ds-0000000FQO2-1KdC;
	Tue, 23 Dec 2025 12:10:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1Do-0000000FQHx-0jgo
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Dec 2025 12:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e9g1CRCPxV0go/ERxSxLmjMTZlU4TJtp+tX3M9PS4Q4=; b=Gne3tBYDexp4+qVImz5ibHS6zR
	SReoo6NOKRmkekbP9toeFEfRji0Fb6BDCO7lP8DPv5hVgwQyjf7fZtNLhqQsz/jaewbE6z0IwPW8m
	OJydGHLd0q3BRSExwMndjpoc2Q9DYvbqiweNN/tWvr/7J1yFWUDJlE4NlRw4dMNqCqeBOKPGgNO0w
	dipSSEFiBOD7lLlrnrBuztOiAaLOf93x9eOHvzqp/f6K/+3yoW2RtviptHkvWOwYzUTvLMRYpu945
	al0Tr69pB6yupUHBym9FVyzUISx7JquX+cFpMJO7q/XmrHlfF12OrYRlyBI1sJ6tNJ61PD1OU9SVq
	g00QCp7w==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0MK-0000000GiVx-0QPb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:15:22 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dbDMx65qPzHnGkK;
	Tue, 23 Dec 2025 20:09:49 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id B2AF540571;
	Tue, 23 Dec 2025 20:10:26 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 23 Dec
 2025 12:10:25 +0000
Date: Tue, 23 Dec 2025 12:10:23 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Abaci Robot
	<abaci@linux.alibaba.com>
Subject: Re: [PATCH v2 02/45] arm_mpam: Remove duplicate linux/srcu.h header
Message-ID: <20251223121023.0000200e@huawei.com>
In-Reply-To: <20251219181147.3404071-3-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-3-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_111520_257132_354354F9 
X-CRM114-Status: UNSURE (   4.45  )
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

On Fri, 19 Dec 2025 18:11:04 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> ./drivers/resctrl/mpam_internal.h: linux/srcu.h is included more than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=27328
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Acked-by: James Morse <james.morse@arm.com>
> [BH: Keep alphabetical order]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

