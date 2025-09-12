Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC633CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjMjDYauzfTsJKjb8SaemJ0ni4qohCxq7JiaB8BO8WU=; b=zEajbPeLLxsYgmAcsfUCrw5Rt7
	T0KmIWbGj2/sMxZ8Ee2ZDpSRJ63m60alD+1g+cRCHF8RpfGy5opaX5Ja8MtTXUgS146NqJelqvPc7
	Oily0Gx+uXn3MQNLpVx2BZ4EX2sZK5Dp2qPZm0Czt6CDBbtC/rES46y0l9XKEZ8unZDaMoPguhFPC
	15wAMlmiz3C1990M5nN1YXpQHhH2SAmkzA266xEotykDXlOPsqGKIAaHe/1vO93eTBbF1k/nPBoP2
	mGhNusONXiJEnNwMggpnigInlDD/4O8c/M53tyRBobWAU3X0veFSeT7Y6TYK1Ntg8cxrF93SZ97xc
	er9DIzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2nc-00000009CnP-2EEe;
	Fri, 12 Sep 2025 12:22:44 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2nZ-00000009Cjp-1Sbr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:22:43 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cNYQb0Bswz6M4YB;
	Fri, 12 Sep 2025 20:19:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D6491402EF;
	Fri, 12 Sep 2025 20:22:32 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Sep
 2025 14:22:31 +0200
Date: Fri, 12 Sep 2025 13:22:29 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 20/29] arm_mpam: Allow configuration to be applied
 and restored during cpu online
Message-ID: <20250912132229.000044c7@huawei.com>
In-Reply-To: <20250910204309.20751-21-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-21-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_052241_680047_801F79B7 
X-CRM114-Status: GOOD (  17.92  )
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

On Wed, 10 Sep 2025 20:43:00 +0000
James Morse <james.morse@arm.com> wrote:

> When CPUs come online the MSC's original configuration should be restored.
> 
> Add struct mpam_config to hold the configuration. This has a bitmap of
> features that were modified. Once the maximum partid is known, allocate
> a configuration array for each component, and reprogram each RIS
> configuration from this.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
Trivial comments
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> +
> +static void mpam_init_reset_cfg(struct mpam_config *reset_cfg)
> +{
> +	memset(reset_cfg, 0, sizeof(*reset_cfg));

Might as well do the following and skip the memset.

	*reset_cfg = (struct mpam_config) {
		.features = ~0,
		.cpbm = ~0,
		.mbw_pbm = ~0,
		.mbw_max = MPAM...
		.reset_cpbm = true,
		.reset_mbw_pbm = true,
	};
> +
> +	reset_cfg->features = ~0;
> +	reset_cfg->cpbm = ~0;
> +	reset_cfg->mbw_pbm = ~0;
> +	reset_cfg->mbw_max = MPAMCFG_MBW_MAX_MAX;
> +
> +	reset_cfg->reset_cpbm = true;
> +	reset_cfg->reset_mbw_pbm = true;
> +}

> +static int mpam_allocate_config(void)
> +{
> +	int err = 0;

Always set before use. Maybe push down so it is in tighter scope and
can declare and initialize to final value in one line.

> +	struct mpam_class *class;
> +	struct mpam_component *comp;
> +
> +	lockdep_assert_held(&mpam_list_lock);
> +
> +	list_for_each_entry(class, &mpam_classes, classes_list) {
> +		list_for_each_entry(comp, &class->components, class_list) {
> +			err = __allocate_component_cfg(comp);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	return 0;
> +}


> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index b69fa9199cb4..17570d9aae9b 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -169,11 +169,7 @@ struct mpam_props {
>  	u16			num_mbwu_mon;
>  };
>  
> -static inline bool mpam_has_feature(enum mpam_device_features feat,
> -				    struct mpam_props *props)
> -{
> -	return (1 << feat) & props->features;
> -}
> +#define mpam_has_feature(_feat, x)	((1 << (_feat)) & (x)->features)

If this is worth doing push it back to original introduction.
I'm not sure it is necessary.

Jonathan




