Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7507C79FAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ll6PrgAoiDDXgANLDP3cZx3isVO5OMJZwuamNJ9se4Q=; b=teQdslAirThWx1PreTZImwS2Ru
	ps+ECBiPgkCMPp1Or+vSn/xVa6fuwGI2BJ9bz4QoR64YBDI8J99KRMsc3Dx4wi2b6ytDzfYgN8ofR
	Mgtrm9GyvwnInYMpH3VeGg4dz0wrI+JWMHKEaCnUlXfHMdA0px0gUclBclVERI13HBecreMvsG0Ij
	b8hNANeaqeiqH+nn8gDg3k5vlm2JjKt7boE1+kgA/BiNjku4xFW1Uz6JH6VWOfGJgzh+3YMQ4HCo9
	yOX+GsPYQJVlDGDk0xgm5R5Z+qiplO0W1hJbBLJ+VPrJD8CiNDgsBcqh4pwCHB/vya6LKxO5BRYfE
	OfAPVujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoG0-0000000BoZ7-0a2k;
	Mon, 05 Jan 2026 17:20:40 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoFx-0000000BoXS-1XdA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:20:39 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlLfQ55VmzJ467K;
	Tue,  6 Jan 2026 01:20:30 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id EAC694057E;
	Tue,  6 Jan 2026 01:20:30 +0800 (CST)
Received: from localhost (10.126.174.38) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 17:20:29 +0000
Date: Mon, 5 Jan 2026 17:20:27 +0000
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
Subject: Re: [PATCH v2 11/45] arm64: mpam: Initialise and context switch the
 MPAMSM_EL1 register
Message-ID: <20260105172027.0000113c@huawei.com>
In-Reply-To: <20251219181147.3404071-12-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-12-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.38]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_092037_551050_B997C5F6 
X-CRM114-Status: GOOD (  14.14  )
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

On Fri, 19 Dec 2025 18:11:13 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> The MPAMSM_EL1 sets the MPAM labels, PMG and PARTID, for loads and stores
> generated by a shared SMCU. Disable the traps so the kernel can use it and
> set it to the same configuration as the per-EL cpu MPAM configuration.
> 
> If an SMCU is not shared with other cpus then it is implementation defined
> whether the configuration from MPAMSM_EL1 is used or that from the
> appropriate MPAMy_ELx. As we set the same configuration for MPAM0_EL1,
> MPAM1_EL1 and MPAMSM_EL1 the resulting configuration is the same
> regardless.
Maybe tighten that last sentence up to talk about the matching fields
rather than the 'same configuration'.

Whole bunch of stuff in the first two that aren't in MPAMSM_EL1.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
LGTM
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

