Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D40CDC192
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGNIGQVB/nPaK6VTlLDB7Fc6lF6dnUzczd56TbN/izI=; b=QHvNonl0uzOUa7C/sH/ODKCo6l
	QBiuiUGqm//JWHO2JpMjzrxbdqmZQ4E0HQlHyZyxoieD+b6HB9riAZ+QzuhCUkzC/c1BcuKkko9NO
	0VTagtXRSdzMDzdl+N8zVHawAhWofq4HiLcMnU2Bh5DGPxVHtWWCIzq/RV2YyrLozw8S360fLJvrh
	3w01v4pfSiWc5FjolcSMsHyPJYOXTGEK4eb+3Ee8K/YawHZnp2DRNl46Dl6UjgAfhBnKPACjDcla9
	W7Aygp3t3UKdFCj7H/omKm/K2v2AV7BFvFIsRvfCx/siTM/RwJJeVXZUVjqtEPpRsyZ0O8s2bMp2Y
	tVZ38/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6D8-0000000D06O-1A6M;
	Tue, 06 Jan 2026 12:30:54 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6D2-0000000D04y-48Sb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:30:52 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlr9W422czJ46qH;
	Tue,  6 Jan 2026 20:30:39 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E6BD40086;
	Tue,  6 Jan 2026 20:30:41 +0800 (CST)
Received: from localhost (10.48.155.65) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 12:30:39 +0000
Date: Tue, 6 Jan 2026 12:30:37 +0000
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
Subject: Re: [PATCH v2 26/45] arm_mpam: resctrl: Add kunit test for control
 format conversions
Message-ID: <20260106123037.000039d0@huawei.com>
In-Reply-To: <20251219181147.3404071-27-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-27-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.155.65]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_043049_310591_83BAD6C4 
X-CRM114-Status: GOOD (  16.33  )
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

On Fri, 19 Dec 2025 18:11:28 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: Dave Martin <Dave.Martin@arm.com>
> 
> resctrl specifies the format of the control schemes, and these don't match
> the hardware.
> 
> Some of the conversions are a bit hairy - add some kunit tests.
> 
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> [morse: squashed enough of Dave's fixes in here that it's his patch now!]
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
I took a fairly quick look at these and they seem sane.
Very valuable to have these tests.

Trivial stuff below and a request to carry the reference over to the
code rather than just having it in the tests.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> diff --git a/drivers/resctrl/test_mpam_resctrl.c b/drivers/resctrl/test_mpam_resctrl.c
> new file mode 100644
> index 000000000000..d0615aa7671c
> --- /dev/null
> +++ b/drivers/resctrl/test_mpam_resctrl.c

> +/*
> + * Mysterious inscriptions taken from ARM DDI 0598D.b,
> + * "Arm Architecture Reference Manual Supplement - Memory System
> + * Resource Partitioning and Monitoring (MPAM), for A-profile
> + * architecture", Section 9.8, "About the fixed-point fractional
> + * format" (exact percentage entries only):

This is the reference I'd like alongside the conversion code.

> + */
> +static const struct percent_value_case percent_value_cases[] = {
> +	/* Architectural cases: */
> +	{   1,  8,    1 },	{   1, 12,  0x27 },	{   1, 16,  0x28e },
> +	{  25,  8, 0x3f },	{  25, 12, 0x3ff },	{  25, 16, 0x3fff },
> +	{  35,  8, 0x58 },	{  35, 12, 0x598 },	{  35, 16, 0x5998 },
> +	{  45,  8, 0x72 },	{  45, 12, 0x732 },	{  45, 16, 0x7332 },
> +	{  50,  8, 0x7f },	{  50, 12, 0x7ff },	{  50, 16, 0x7fff },
> +	{  52,  8, 0x84 },	{  52, 12, 0x850 },	{  52, 16, 0x851d },
> +	{  55,  8, 0x8b },	{  55, 12, 0x8cb },	{  55, 16, 0x8ccb },
> +	{  58,  8, 0x93 },	{  58, 12, 0x946 },	{  58, 16, 0x9479 },
> +	{  75,  8, 0xbf },	{  75, 12, 0xbff },	{  75, 16, 0xbfff },
> +	{  88,  8, 0xe0 },	{  88, 12, 0xe13 },	{  88, 16, 0xe146 },
> +	{  95,  8, 0xf2 },	{  95, 12, 0xf32 },	{  95, 16, 0xf332 },
> +	{ 100,  8, 0xff },	{ 100, 12, 0xfff },	{ 100, 16, 0xffff },
> +
This blank line doesn't add anything.

> +};
> +
> +static void test_percent_value_desc(const struct percent_value_case *param,
> +				    char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE,
> +		 "pc=%d, width=%d, value=0x%.*x\n",
> +		 param->pc, param->width,
> +		 DIV_ROUND_UP(param->width, 4), param->value);
> +}


