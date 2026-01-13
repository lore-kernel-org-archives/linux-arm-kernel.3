Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AEACF45DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PI5xQ+NoqYIjb3KOKML9F7jb10pn/S4ggDnlT6YNrI=; b=bT9+Nx7/ZkOanYeAhNtdV9IpNu
	nEpnJxhbfM4vPXp0USwu/r53JYOUf7iwt56cQPOp8rEj9zW2vV51GGX932mVq864rUhUpSt4t7VUE
	iOomouTfb1vf4yEULQOrhrUmMZCmgptNOtk218x4mWgDoIm1LTz+wr/Rk6265M52d4jwNfi724YFF
	FznlNnSmfGgpSQujXs/QWq+zwi6nx4xgse/ny4kFopb5kE2hnZTqE8lUDH2XF08+7u0cYq5kahODq
	A92cV/iPbii7TSsdtN6KxJbk2OYeeE0ZPIPAG2b3j3G8CfeGTEBZs57L/lPQqQZK2MoFvErfz4ZXb
	7s0v22wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffsS-00000007JIW-39Gk;
	Tue, 13 Jan 2026 15:00:12 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffsM-00000007JDi-0Hkw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:00:08 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4drC8D3vV4zHnGgf;
	Tue, 13 Jan 2026 22:59:40 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id AA80840539;
	Tue, 13 Jan 2026 22:59:58 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 13 Jan
 2026 14:59:57 +0000
Date: Tue, 13 Jan 2026 14:59:55 +0000
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
Subject: Re: [PATCH v3 25/47] arm_mpam: resctrl: Add kunit test for rmid idx
 conversions
Message-ID: <20260113145955.00005ed7@huawei.com>
In-Reply-To: <20260112165914.4086692-26-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
	<20260112165914.4086692-26-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_070006_415755_A7A839F4 
X-CRM114-Status: GOOD (  16.51  )
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

On Mon, 12 Jan 2026 16:58:52 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> As MPAM's pmg are scoped by partid and RDT's rmid are global the
> rescrl mapping to an index needs to differ.
> 
> Add some tests for the MPAM rmid mapping.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
I'm not sure this particular test brings a massive amount of value, but
I'm not one to object to more tests!

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/resctrl/test_mpam_resctrl.c | 49 +++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/resctrl/test_mpam_resctrl.c b/drivers/resctrl/test_mpam_resctrl.c
> index b93d6ad87e43..a20da161d965 100644
> --- a/drivers/resctrl/test_mpam_resctrl.c
> +++ b/drivers/resctrl/test_mpam_resctrl.c
> @@ -296,6 +296,54 @@ static void test_percent_to_max_rounding(struct kunit *test)
>  	KUNIT_EXPECT_LE(test, 4 * num_rounded_up, 3 * total);
>  }
>  
> +struct rmid_idx_case {
> +	u32 max_partid;
> +	u32 max_pmg;
> +};
> +
> +static const struct rmid_idx_case rmid_idx_cases[] = {
> +	{0, 0}, {1, 4}, {3, 1}, {5, 9}, {4, 4}, {100, 11}, {0xFFFF, 0xFF},
> +};
> +
> +static void test_rmid_idx_desc(const struct rmid_idx_case *param, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "max_partid=%d, max_pmg=%d\n",
> +		 param->max_partid, param->max_pmg);
> +}
> +
> +KUNIT_ARRAY_PARAM(test_rmid_idx, rmid_idx_cases, test_rmid_idx_desc);
> +
> +static void test_rmid_idx_encoding(struct kunit *test)
> +{
> +	u32 orig_mpam_partid_max = mpam_partid_max;
> +	u32 orig_mpam_pmg_max = mpam_pmg_max;
> +	const struct rmid_idx_case *param = test->param_value;
> +	u32 idx, num_idx, count = 0;
> +
> +	mpam_partid_max = param->max_partid;
> +	mpam_pmg_max = param->max_pmg;
> +
> +	for (u32 partid = 0; partid <= mpam_partid_max; partid++) {
> +		for (u32 pmg = 0; pmg <= mpam_pmg_max; pmg++) {
> +			u32 partid_out, pmg_out;
> +
> +			idx = resctrl_arch_rmid_idx_encode(partid, pmg);
> +			/* Confirm there are no holes in the rmid idx range */
> +			KUNIT_EXPECT_EQ(test, count, idx);
> +			count++;
> +			resctrl_arch_rmid_idx_decode(idx, &partid_out, &pmg_out);
> +			KUNIT_EXPECT_EQ(test, pmg, pmg_out);
> +			KUNIT_EXPECT_EQ(test, partid, partid_out);
> +		}
> +	}
> +	num_idx = resctrl_arch_system_num_rmid_idx();
> +	KUNIT_EXPECT_EQ(test, idx + 1, num_idx);
> +
> +	/* Restore global variables that were messed with */
> +	mpam_partid_max = orig_mpam_partid_max;
> +	mpam_pmg_max = orig_mpam_pmg_max;
> +}



