Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59770FCEE80
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yURRrqrDYtGj24MNtCInEoXUFgqELZxV3L554k4yuAA=; b=CglH7Kobj+xjNQbogLjy6ONFVI
	QBCD3MFyJHHRY2dvbqa4b0ud+2A25h6ovNDcbLzoMJePJH1WVuknaO5dUnFm8Glb5vqgzfAN8LIkt
	WJIagsXxZxKw75Jc3DkQEZPHZKjy9APRFv8WmTOTojzwn5jwsqW1uGYsNg2S+Jma/SiPp76+lH8/s
	l/pSebuWetQZwZWEq5q2oz6qySY2qJ6/japcbxOZ+yt3BBfzaewuNCt76SizdKjNx2zCauRddRH0o
	qvbhKLjoGJF33ZYLkN0OGRXsuxQFcwUvZeRHkprOq2NN3+bvgKLrOTMHq2QEZXIudrLAHn02oV9Jy
	e4Selq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCqK-00000003tLS-0oxk;
	Wed, 25 Feb 2026 11:14:12 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCqH-00000003tKe-0KbK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:14:11 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fLX5G2kcpzHnH2q;
	Wed, 25 Feb 2026 19:13:22 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 2754940565;
	Wed, 25 Feb 2026 19:14:04 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 25 Feb
 2026 11:14:02 +0000
Date: Wed, 25 Feb 2026 11:14:01 +0000
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
	<zengheng4@huawei.com>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v5 26/41] arm_mpam: resctrl: Add monitor initialisation
 and domain boilerplate
Message-ID: <20260225111401.00004ccd@huawei.com>
In-Reply-To: <20260224175720.2663924-27-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
	<20260224175720.2663924-27-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_031409_428790_FDFC8913 
X-CRM114-Status: GOOD (  21.12  )
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

On Tue, 24 Feb 2026 17:57:05 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> Add the boilerplate that tells resctrl about the mpam monitors that are
> available. resctrl expects all (non-telemetry) monitors to be on the L3 and
> so advertise them there and invent an L3 resctrl resource if required. The
> L3 cache itself has to exist as the cache ids are used as the domain
> ids.
> 
> Bring the resctrl monitor domains online and offline based on the cpus
> they contain.
> 
> Support for specific monitor types is left to later.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> New patch but mostly moved from the existing patches to
> separate the monitors from the controls and the boilerplate
> from the specific counters.
> Use l3->mon_capable in resctrl_arch_mon_capable() as
> resctrl_enable_mon_event() now returns a bool.

Just one trivial comment on short line wrap. I'm not that fussed though so
I don't mind if you only tidy that up if doing a v6.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 29efcad163e6..c14e59e8586d 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c

> +static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
> +				     enum resctrl_event_id type)
> +{

...

> +
> +	/*
> +	 * num-rmid is the upper bound for the number of monitoring
> +	 * groups that can exist simultaneously, including the
> +	 * default monitoring group for each control group. Hence,
> +	 * advertise the whole rmid_idx space even though each
> +	 * control group has its own pmg/rmid space. Unfortunately,
> +	 * this does mean userspace needs to know the architecture
> +	 * to correctly interpret this value.
Trivial but that's an oddly short wrap.  Should be.
	 * num-rmid is the upper bound for the number of monitoring groups that
	 * can exist simultaneously, including the default monitoring group for
	 * each control group. Hence, advertise the whole rmid_idx space even 
	 * though each control group has its own pmg/rmid space. Unfortunately,
	 * this does mean userspace needs to know the architecture to correctly
	 * interpret this value.

The wonder of an email client with rulers :)

J
> +	 */
> +	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
> +
> +	if (resctrl_enable_mon_event(type, false, 0, NULL))
> +		l3->mon_capable = true;
> +
> +	return 0;
> +}


