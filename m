Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E74FCE9D45
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWghdRrWj9kCzThi4EPap+XQ0a7gUUMchEalFZFSs0M=; b=Vy2pF9HeLzugVDSLKMgVarGh52
	grA4ghV1D7YIcjVk71C8yE7UZgC6r6HECuqS56FC1abpaNJommDRaxWIyi3dDKO0YPXy+uq1ecreg
	kRbIpNEYl3SnYeVePb6NG4oc2olzSB+MbJoAYP3bM513tqt76QaXWzkzw/XID3TSNNNYfznAs2NCG
	pk+L7vfVDPXrrofvWFk/SCV9cIRfjifKySWezTR0yiOnOhL40o1vbYrxTKWP/wDPErw4pqW1dXuzt
	BWhAT2CkXlFCRJeIZ/bDK27r9Y1PLe+ShqPQkUzlTVefXND8GszK0KX+iE1rD/qrW1Z/S0EBPcuTu
	CqZqzPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8rF-0000000DOCV-1QeT;
	Tue, 06 Jan 2026 15:20:29 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8r9-0000000DOBc-2XXz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:20:27 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlvxB4gfBzJ469c;
	Tue,  6 Jan 2026 23:20:14 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 636E640086;
	Tue,  6 Jan 2026 23:20:16 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 15:20:14 +0000
Date: Tue, 6 Jan 2026 15:20:11 +0000
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
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>
Subject: Re: [PATCH v2 43/45] arm_mpam: Add workaround for T241-MPAM-4
Message-ID: <20260106152011.000047ba@huawei.com>
In-Reply-To: <20251219181147.3404071-44-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-44-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_072025_242123_E501794F 
X-CRM114-Status: GOOD (  18.66  )
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

On Fri, 19 Dec 2025 18:11:45 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> In the T241 implementation of memory-bandwidth partitioning, in the absence
> of contention for bandwidth, the minimum bandwidth setting can affect the
> amount of achieved bandwidth. Specifically, the achieved bandwidth in the
> absence of contention can settle to any value between the values of
> MPAMCFG_MBW_MIN and MPAMCFG_MBW_MAX.  Also, if MPAMCFG_MBW_MIN is set
> zero (below 0.78125%), once a core enters a throttled state, it will never
> leave that state.
> 
> The first issue is not a cocern if the MPAM software allows to program
concern

> MPAMCFG_MBW_MIN through the sysfs interface. This patch ensures program
> MBW_MIN=1 (0.78125%) whenever MPAMCFG_MBW_MIN=0 is programmed.
> 
> In the scenario where the resctrl doesn't support the MBW_MIN interface via
> sysfs, to achieve bandwidth closer to MW_MAX in the absence of contention,
MBW_MAX

> software should configure a relatively narrow gap between MBW_MIN and
> MBW_MAX. The recommendation is to use a 5% gap to mitigate the problem.
> 
> [ morse: Added as second quirk, adapted to use the new intermediate values
> in mpam_extend_config() ]
> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241
> Handling when reset_mbw_min is set
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 +
>  drivers/resctrl/mpam_devices.c              | 59 +++++++++++++++------
>  drivers/resctrl/mpam_internal.h             |  1 +
>  3 files changed, 46 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 4e86b85fe3d6..b18bc704d4a1 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -248,6 +248,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | T241 MPAM       | T241-MPAM-4     | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
>  +----------------+-----------------+-----------------+-----------------------------+


