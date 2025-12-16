Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972BDD5E156
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h71K1XWglBsgaSI5guXNEKLcJzvNUsuD2MB4zZoEpwU=; b=cFX+2DQkbVTA61t3FGIQjHrE1g
	LrYIA0jJhnoiXomKDDE02ExFe8CmfYNCKZj5uj5ptC7XAZY1M22I2rtljQ/PWdki4FJhVtjBYFKMB
	v7dqLFqWbw5LfGqizjRW8VZr6+Q4urvmG6UHMIdSPYW1Rhdb7Zv/q8s7ePZRPE9auF8ePzjqiCoWN
	GFVxRwQdHpikJqaFCPi+QPGnd0LZQV3vupz773YZ5ckB0H21g5uw5brBm+Rp9A2Gy7xBFu9YjN5DN
	HOjvq9KFZ6rsMP/TGlwymf4FbviBcJJYzHCP3P6g7fgOHYHaq9AVU82CQ3jPOdgERaDhQT5QqdRet
	eHXJwLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVQh-00000005IQo-2SdE;
	Tue, 16 Dec 2025 13:49:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVQf-00000005IPZ-2GkK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Dec 2025 13:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h71K1XWglBsgaSI5guXNEKLcJzvNUsuD2MB4zZoEpwU=; b=lXDTVPekqetuCPPFmAyZJ2Xqxd
	FycQPhcBlOyN/Dxttay2NHIgJzznd6jj0ECgj3hA1tppkuAT4FCdwKtBmP7jw2pA6liB5jcIdOHXy
	Y4OSpnpuv4qXk7elP0YnAo5U4GjdTx06zCDDd47JEIww1Ahn1ZsUITiRrtBrnERnulG3mOqRngscj
	RGYroidSm58ot+JBWKczv4vQcRYHiixB1/aMY7HvbjTKBgLoP9fZPD/PnZZOOHavgVGzkPvVqEvbr
	XxWgCQqWIEJxZJ2YLbG/hx5MBEDrDtQ87RHmnK5ZHk+k5x+d5X7beQYSCB726+ZYg+7M8iDOHcxnS
	C//0HGAw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUZ9-00000004pNF-0f91
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 12:54:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 023F4FEC;
	Tue, 16 Dec 2025 05:49:15 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF4C13F73B;
	Tue, 16 Dec 2025 05:49:18 -0800 (PST)
Message-ID: <6c652963-eda0-416b-b1b3-98c5313ed5fc@arm.com>
Date: Tue, 16 Dec 2025 13:49:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/38] arm_mpam: resctrl: Add CDP emulation
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-14-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-14-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_125411_553004_FC6E8A51 
X-CRM114-Status: GOOD (  25.25  )
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

Hi James,

On 12/5/25 21:58, James Morse wrote:
> Intel RDT's CDP feature allows the cache to use a different control value
> depending on whether the accesses was for instruction fetch or a data
> access. MPAM's equivalent feature is the other way up: the CPU assigns a
> different partid label to traffic depending on whether it was instruction
> fetch or a data access, which causes the cache to use a different control
> value based solely on the partid.
> 
> MPAM can emulate CDP, with the side effect that the alternative partid is
> seen by all MSC, it can't be enabled per-MSC.
> 
> Add the resctrl hooks to turn this on or off. Add the helpers that
> match a closid against a task, which need to be aware that the value
> written to hardware is not the same as the one resctrl is using.
> 
> Update the 'arm64_mpam_global_default' variable the arch code uses
> during context switch to know when the per-cpu value should be used
> instead.
> 
> Awkwardly, the MB controls don't implement CDP. To emulate this, the
> MPAM equivalent needs programming twice by the resctrl glue, as
> resctrl expects the bandwidth controls to be applied independently for
> both data and isntruction-fetch.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> CC: Ben Horgan <ben.horgan@arm.com>
> CC: Amit Singh Tomar <amitsinght@marvell.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  arch/arm64/include/asm/mpam.h  |   1 +
>  drivers/resctrl/mpam_resctrl.c | 115 ++++++++++++++++++++++++++++++++-
>  include/linux/arm_mpam.h       |   3 +
>  3 files changed, 118 insertions(+), 1 deletion(-)
> 
[...]
>  
> @@ -272,6 +369,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>  int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>  			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
>  {
> +	int err;
>  	u32 partid;
>  	struct mpam_config cfg;
>  	struct mpam_props *cprops;
> @@ -311,7 +409,22 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>  		return -EINVAL;
>  	}
>  
> -	return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
> +	/*
> +	 * When CDP is enabled, but the resource doesn't support it, we need to
> +	 * apply the same configuration to the other partid.
> +	 */
> +	if (mpam_resctrl_hide_cdp(r->rid)) {
> +		partid = resctrl_get_config_index(closid, CDP_CODE);
> +		err = mpam_apply_config(dom->ctrl_comp, partid, &cfg);
> +		if (err)
> +			return err;
> +
> +		partid = resctrl_get_config_index(closid, CDP_DATA);
> +		return mpam_apply_config(dom->ctrl_comp, partid, &cfg);

This is indeed awkward. As we are programming twice, if instruction and
data use b/w equally then the MB setting will be as if it was double.
However, if we halved the configured value, and most of the bandwidth
was for data, then it would be as if it was halved. For controls where
the actual parts are chosen, rather than just the size then this
programming twice will work as expected. Therefore, I think your chosen
policy is the least surprising and I'll keep this as is.

> +
> +	} else {
> +		return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
> +	}
>  }
[...]

Thanks,

Ben


