Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2511CE9D47
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poajMRtzNqXN0/OFZBzqHWaUqx6JsyM0CCmYUHKaozE=; b=yfFX2MGI3Rnf0a6GymIhII3XxG
	lyGwvbypNBTtLih5M27Vfh++vAnVcJLDjfDd293Oqy/EQrwX0VU8tNhf2iVNxp1b6o4Ne+1ml6MOy
	60BY/3h7rZvjTLQUpYwHgUtPqN9vNzEFyBE21pfkhcafeSLki+sRMZ6SO90J1StqzmMTO35HE3xSp
	TGHhMqlVUGEIhpwGp8PASyeoHi48uDey+uEED/GZVzm4fz11fCMhSMU7TOKwMG4JXt9hn+DixZ6la
	6eKFHD9dIOyBm9s+9NWMVf5HUNpPF5fjQzpx7PEhFXHHAhXw24xDcLTjB/wYnsS4MvbKahb8wqOXZ
	NDtvnjjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8mb-0000000DNrV-0jYs;
	Tue, 06 Jan 2026 15:15:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8mS-0000000DNqk-0yQO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:15:39 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlvqc4LHPzJ46dX;
	Tue,  6 Jan 2026 23:15:24 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 545DB40570;
	Tue,  6 Jan 2026 23:15:26 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 15:15:24 +0000
Date: Tue, 6 Jan 2026 15:15:23 +0000
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
Message-ID: <20260106151523.00004778@huawei.com>
In-Reply-To: <20260106151415.00002119@huawei.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-42-ben.horgan@arm.com>
	<20260106151415.00002119@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_071534_097367_C77E4AE7 
X-CRM114-Status: GOOD (  12.81  )
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

On Tue, 6 Jan 2026 15:14:15 +0000
Jonathan Cameron <jonathan.cameron@huawei.com> wrote:

> On Fri, 19 Dec 2025 18:11:43 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
> > From: Shanker Donthineni <sdonthineni@nvidia.com>
> > 
> > The MPAM specification includes the MPAMF_IIDR, which serves to uniquely
> > identify the MSC implementation through a combination of implementer
> > details, product ID, variant, and revision. Certain hardware issues/errata
> > can be resolved using software workarounds.
> > 
> > Introduce a quirk framework to allow workarounds to be enabled based on the
> > MPAMF_IIDR value.
> > 
> > [ morse: Stash the IIDR so this doesn't need an IPI, enable quirks only
> > once, move the description to the callback so it can be pr_once()d, add an
> > enum of workarounds for popular errata. Add macros for making lists of
> > product/revision/vendor half readable ]  
> 
> Review comment that got left over? 
Ah. I see, it's just change log for what James did.  Seem enough to add
a co-developed to me and maybe just leave this info under the ---?
> 
> Otherwise looks fairly standard for quirk handling.
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> > 
> > Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Signed-off-by: Ben Horgan <ben.horgan@arm.com>  
> 


