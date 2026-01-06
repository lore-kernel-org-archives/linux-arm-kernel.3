Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F4FCE9D4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSHVH0NcbmFXfC67ZyrkvJzpkCxaWbhiloZMDl+hcNk=; b=GdgRIDD5/1OCfloBTXOxJt6mf0
	TAMFti8asdin7oRXDf7C03Ob61VJ29EPQ2ZL4v2k7oxvLI9etidMsGlYI4YShCkfRCXYM9fND5tlk
	DdGbFY1vYXHAQeD6EzS/dI5DczBuqMxLDlya27jR50DJApbu5CVrxB1TwZWncyvmLJ9pZWqF8/FIl
	9nlOKXEqp7Bh46jGmvhG55osvqNN96irRyZtbXd5XcpwfhKJKyxUHA315V+RYxypK1H4MAFdEVQs6
	hk8r4NbRdD9KFNjrFznKXJT5FG0YF9pc93CqHFqIFog2NvmQz+lm2qUZSBs7F/vmMREsnxirh+l83
	q+cvZJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8lO-0000000DNiA-3RkQ;
	Tue, 06 Jan 2026 15:14:26 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8lM-0000000DNhV-1KQF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:14:25 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlvpG2c3zzHnH4v;
	Tue,  6 Jan 2026 23:14:14 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id B759240539;
	Tue,  6 Jan 2026 23:14:18 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 15:14:17 +0000
Date: Tue, 6 Jan 2026 15:14:15 +0000
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
Subject: Re: [PATCH v2 41/45] arm_mpam: Add quirk framework
Message-ID: <20260106151415.00002119@huawei.com>
In-Reply-To: <20251219181147.3404071-42-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-42-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_071424_502587_1AE3267F 
X-CRM114-Status: UNSURE (   9.41  )
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

On Fri, 19 Dec 2025 18:11:43 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> The MPAM specification includes the MPAMF_IIDR, which serves to uniquely
> identify the MSC implementation through a combination of implementer
> details, product ID, variant, and revision. Certain hardware issues/errata
> can be resolved using software workarounds.
> 
> Introduce a quirk framework to allow workarounds to be enabled based on the
> MPAMF_IIDR value.
> 
> [ morse: Stash the IIDR so this doesn't need an IPI, enable quirks only
> once, move the description to the callback so it can be pr_once()d, add an
> enum of workarounds for popular errata. Add macros for making lists of
> product/revision/vendor half readable ]

Review comment that got left over? 

Otherwise looks fairly standard for quirk handling.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>


