Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2504FFC9ED3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Itfyi6buFhW0nHsJ4qojlX1bMfsgLsC91Ah779lyCrk=; b=y91+TV8hZ0TJHCRvB3JUXIrGDB
	IJtcGzw35Pn7Q0kF7y8PQerS82ub6M9vU7cwR/2GRiGwEPdv3HK8h2yYONZWLGQ2D5t9AJBJs+Ezo
	lfPG5P216b6Dr4uB7UuKf/ruKxpmxA1KsvGM3M+OozlPVA7splApwRto5+bHR9gFOBt43FaSoiZZ9
	8U+hn8zVhzUwAGca66ghX85MuHaK0Ncu5pVV9deUvEUZTHBp43+/FW9lNau5+ViQs90pw36XykzOx
	e0NRongbHEXeov08p0DreMcTjSxlsJtXxps1AQK917Db2rqUQzp6K94JARed6sgRcrlj6tr+i2JrX
	DFIPdFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynya-00000005332-24UH;
	Sat, 07 Mar 2026 09:29:37 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynyV-0000000532e-1OWC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 09:29:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Itfyi6buFhW0nHsJ4qojlX1bMfsgLsC91Ah779lyCrk=;
	b=Fs11xKyQ7nYIUgH7UvxH6gth0KfIDoXe3uaHwUa+hP2mJzVZJigFyib1O/8y8bMWZ9PynqOJq
	LeDP3LD9iI2HZWoHuWR/+AH7FhJ+VYRsBva+lTGdx7OXB8Qp3JRCwAsF1AfzAwAczndgMMb+Si9
	peMQSuEjhf5GAUkAIcxM3i4=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fSdCD6B2Rz12LCy;
	Sat,  7 Mar 2026 17:24:40 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 971AB40561;
	Sat,  7 Mar 2026 17:29:15 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 7 Mar 2026 17:29:13 +0800
Message-ID: <96ffc81d-3f37-7f48-f9f4-6a58da3e0f99@huawei.com>
Date: Sat, 7 Mar 2026 17:29:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 31/41] arm_mpam: resctrl: Add resctrl_arch_rmid_read()
 and resctrl_arch_reset_rmid()
Content-Language: en-US
To: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>
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
	<linux-doc@vger.kernel.org>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <20260224175720.2663924-32-ben.horgan@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <20260224175720.2663924-32-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_012932_042245_B9DA571A 
X-CRM114-Status: GOOD (  15.11  )
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

Hi Ben,

On 2026/2/25 1:57, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl uses resctrl_arch_rmid_read() to read counters. CDP emulation means
> the counter may need reading in three different ways. The same goes for
> reset.
> 
> The helpers behind the resctrl_arch_ functions will be re-used for the ABMC
> equivalent functions.
> 
> Add the rounding helper for checking monitor values while we're here.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---

[...]

> +
> +static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
> +			     enum mpam_device_features mon_type,
> +			     int mon_idx, u32 closid, u32 rmid, u64 *val)
> +{
> +	if (cdp_enabled) {

While reviewing the resctrl limbo handling code, I noticed a issue in
__check_limbo() that could lead to premature RMID release when CDP is
enabled.

In __check_limbo(), RMIDs in limbo state undergo L3 occupancy checks
before being released. This check is performed via
resctrl_arch_rmid_read(), on arm64 MPAM, which relies on the cdp_enabled
state to determine to check which PARTID.

The concern arises in the following scenario: Filesystem is mounted with
CDP enabled. During normal operation, some RMIDs enter limbo. On umount,
cdp_enabled is reset to false. __check_limbo() may then run and perform
L3 checks with cdp_enabled = false. This could cause RMIDs to be
incorrectly released from limbo while still effectively busy after
remount.

Apologies for not providing a ready-made fix in this email. However,
I would appreciate to hear the community's thoughts on this issue.


> +		u64 code_val = 0, data_val = 0;
> +		int err;
> +
> +		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
> +				 CDP_CODE, closid, rmid, &code_val);
> +		if (err)
> +			return err;
> +
> +		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
> +				 CDP_DATA, closid, rmid, &data_val);
> +		if (err)
> +			return err;
> +
> +		*val += code_val + data_val;
> +		return 0;
> +	}
> +
> +	return __read_mon(mon, mon_comp, mon_type, mon_idx,
> +			  CDP_NONE, closid, rmid, val);
> +}
> +
> +/* MBWU when not in ABMC mode, and CSU counters. */
> +int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
> +			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
> +			   void *arch_priv, u64 *val, void *arch_mon_ctx)
> +{
> +	struct mpam_resctrl_dom *l3_dom;
> +	struct mpam_component *mon_comp;
> +	u32 mon_idx = *(u32 *)arch_mon_ctx;
> +	enum mpam_device_features mon_type;
> +	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
> +
> +	resctrl_arch_rmid_read_context_check();
> +
> +	if (eventid >= QOS_NUM_EVENTS || !mon->class)
> +		return -EINVAL;
> +
> +	l3_dom = container_of(hdr, struct mpam_resctrl_dom, resctrl_mon_dom.hdr);
> +	mon_comp = l3_dom->mon_comp[eventid];
> +
> +	switch (eventid) {
> +	case QOS_L3_OCCUP_EVENT_ID:
> +		mon_type = mpam_feat_msmon_csu;
> +		break;
> +	case QOS_L3_MBM_LOCAL_EVENT_ID:
> +	case QOS_L3_MBM_TOTAL_EVENT_ID:
> +		mon_type = mpam_feat_msmon_mbwu;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return read_mon_cdp_safe(mon, mon_comp, mon_type, mon_idx,
> +				 closid, rmid, val);
> +}
> +


Best regards,
Zeng Heng

