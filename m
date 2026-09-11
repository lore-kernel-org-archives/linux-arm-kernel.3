Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B4DC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPlgI6itf/jQAT/aGqHZlGQ1rbaMbhD6LnTalkOaXRQ=; b=XjHLshiflcqQ7lUPSBqGOZ82Gu
	sjvVYh7iseeLBk5bh1z0gMqUnrRB7l4XsgZSkWrsbV0OCtGzeZxqMT6cd27ShYOoxLssh3ZAIKSBc
	ECqhcFx002M4tLAd17QxzeWE8zE5XGrCZP/PDXv+/R+xLpuXc4tAOlJbK14pBHEiqJiB57Gv6Q2iE
	UHmU+Jv12RxXOl8+VS0wkLEazvTmeR3A7JAjiXhq1IM16AOV2n9OmHrSB70EEki4mie1d3dQvASmK
	Hs1eacv2nd2qP+ntYyEomxP4VfPP/HBPOw9XqWqiVRXJra81hUOBkMG//zw5S98N8uBpGYgzyxoYQ
	broZnXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wUx-0000000G73B-152p;
	Fri, 11 Sep 2026 08:20:39 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wUr-0000000G725-2zG3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:20:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UPlgI6itf/jQAT/aGqHZlGQ1rbaMbhD6LnTalkOaXRQ=;
	b=VUXwpXLPX3wlAPyKd9HP3OrmXW/ey4+zvbJbIX499s4n/+IXiH0dkVEQr5TrMy2E3XAeziUBI
	RR1vctPY0rEiuDKk8KSfefyOOHQNi1FOLtB6ohyZdvDu1rfdf/aZquVFDwQ4S7mK7uJu0FiGKWR
	iGRHUTDuyAd1BdWFcR4o6Lo=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hh6dd0TMyzKm5t;
	Fri, 11 Sep 2026 16:09:25 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 476474056C;
	Fri, 11 Sep 2026 16:20:24 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 11 Sep 2026 16:20:22 +0800
Message-ID: <66752c5a-8bdf-4895-b692-585ccfce3b01@huawei.com>
Date: Fri, 11 Sep 2026 16:20:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/40] KVM: arm64: Make MPAMSM_EL1 accesses UNDEF
To: Ben Horgan <ben.horgan@arm.com>
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
	<zengheng4@huawei.com>, <linux-doc@vger.kernel.org>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-6-ben.horgan@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260313144617.3420416-6-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_012034_081173_84B4D444 
X-CRM114-Status: GOOD (  10.48  )
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



在 2026/3/13 22:45, Ben Horgan 写道:
> The MPAMSM_EL1 register controls the MPAM labeling for an SMCU, Streaming
> Mode Compute Unit. As there is no MPAM support in KVM, make sure MPAMSM_EL1
> accesses trigger an UNDEF.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Remove paragraph from commit on allowed range of values
> ---
>  arch/arm64/kvm/sys_regs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 1b4cacb6e918..0edd655934a9 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3376,6 +3376,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  
>  	{ SYS_DESC(SYS_MPAM1_EL1), undef_access },
>  	{ SYS_DESC(SYS_MPAM0_EL1), undef_access },
> +	{ SYS_DESC(SYS_MPAMSM_EL1), undef_access },

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +
>  	{ SYS_DESC(SYS_VBAR_EL1), access_rw, reset_val, VBAR_EL1, 0 },
>  	{ SYS_DESC(SYS_DISR_EL1), NULL, reset_val, DISR_EL1, 0 },
>  


