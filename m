Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A15D232D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 03:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Td4RsK7CWz0wGv8RlhRHVePEqykvscOGnUjIqYpdWXE=; b=Pjsq3ytdmTvEbD/CKFgrSp3Eix
	4IEoTwe/IoGgqWgO34nYgFjgvpbxh1CTNi1MgUw/aJlNrdk9mkxQAB5vH1OPmtV+KIMonDGOuoDmh
	1C43VZYbxWORRT9ciRkwzJKpWrB5QxdIwbt8uM98mAbq3Re2CAQJzumGIas0nUh+omb505li49Uyu
	AMtlDBE1HMO/ppf59ACc326hKIOnzhpjzJsWAaosvJ5FTz841rK+teatgh8my7tdc25VO24HC1K7G
	BSnz2ndikDWgsnn5wZd2rIefPMz5tNQv+dKUBdZmed9qyqoesCumL0i1xcry+4KD1qaZYOZITIDUk
	MMRCn6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve3Rd-00000001Cka-08ew;
	Fri, 09 Jan 2026 03:45:49 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve3RX-00000001CiH-287J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 03:45:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Td4RsK7CWz0wGv8RlhRHVePEqykvscOGnUjIqYpdWXE=;
	b=f22OE+b1dV2Mq491uS22OBl91IE0jaAmzuoGrGG1HQrC2PkODeR7UoNErHluN81G2A9KVSIzO
	lpgJFIN2NFwl8az/d2EAbTrdruXsICMXQdgNSiuCH3JCBJdvZV2RtqM/zMYVVLXmdfFtF8vQyzd
	uteXvOFqPUxp2eIrcCb7XMw=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dnSJb6Jfdz12LhH;
	Fri,  9 Jan 2026 11:42:23 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E7F140363;
	Fri,  9 Jan 2026 11:45:27 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 9 Jan
 2026 11:45:25 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <jonathan.cameron@huawei.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <ben.horgan@arm.com>,
	<carl@os.amperecomputing.com>, <catalin.marinas@arm.com>, <corbet@lwn.net>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<joey.gouly@arm.com>, <kobak@nvidia.com>, <kvmarm@lists.linux.dev>,
	<lcherian@marvell.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <maz@kernel.org>, <oupton@kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <suzuki.poulose@arm.com>,
	<tan.shaopeng@fujitsu.com>, <will@kernel.org>, <xhao@linux.alibaba.com>,
	<wangkefeng.wang@huawei.com>, <zengheng4@huawei.com>
Subject: Re: [PATCH v2 18/45] arm_mpam: resctrl: Implement resctrl_arch_reset_all_ctrls()
Date: Fri, 9 Jan 2026 11:45:06 +0800
Message-ID: <20260109034506.1176234-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260105175154.00002041@huawei.com>
References: <20260105175154.00002041@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_194545_267666_F5BC9EAB 
X-CRM114-Status: GOOD (  14.18  )
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

> From: James Morse <james.morse@arm.com>
> Date: Fri, 5 Dec 2025 21:58:32 +0000
> Subject: [PATCH v2 18/45] arm_mpam: resctrl: Implement resctrl_arch_reset_all_ctrls()
>
> We already have a helper for resetting an mpam class and component.  Hook
> it up to resctrl_arch_reset_all_ctrls() and the domain offline path.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c  |  6 +++---
>  drivers/resctrl/mpam_internal.h |  7 +++++++
>  drivers/resctrl/mpam_resctrl.c  | 15 +++++++++++++++
>  3 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index bc4f1c80eab..d32e8700245 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -353,6 +366,8 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
>
>  		ctrl_dom_empty = true;
>  		if (exposed_alloc_capable) {
> +			mpam_reset_component_locked(dom->ctrl_comp);
> +
>  			ctrl_d = &dom->resctrl_ctrl_dom;
>  			ctrl_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
>  			if (ctrl_dom_empty)

mpam_cpu_offline() already directly calls mpam_reset_ris() to reset the
MPAM MSC that is about to go offline. So why here still need
mpam_resctrl_offline_cpu() to invoke mpam_reset_component_locked(),
which ends up calling mpam_reset_ris() again?

Please point it out if I might have overlooked anything, thank you.


Best Regards,
Zeng Heng

