Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3CEC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CXvm0asyjuCXRychYSJFJO4VoOdyWy5Yi9fJ25FM5I=; b=kSlRAdsAXF1sRKEoYEq4fzw/D5
	zfmjqAuE8RkMH8JwhW1lk1a2I01ql3c8K4WR0bBpNK7EIwv4c3G8P+N8LFoyvXi7NH00BQQl8WDSG
	7lA54Sa1ebMgFSIvL5lWTaeDkix3W3wUPMV+yCAamnzVl2Gmja7uQy6g0BVOcewCn1q/zg6IicJ4g
	xt+yR+Ca0uwQCets0CqhQqAIs5BxeAxWRvMgy5VwF17/fK2PyThnp/mpkjw1Ff7WhPUV+tgDQYLp7
	iqlYl1VRPngD0emhy/77JGnsyVPhCtg2cfeJUnYFGe51RIisQdFjXZWP/O05Yf9Jh4T4LItdY+Li7
	UUDeE1AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXJV-00000009pJq-1pXk;
	Wed, 22 Jan 2025 09:46:21 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXHN-00000009oyr-2Zca
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 09:44:10 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50M9htoK172235
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 03:43:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737539035;
	bh=/CXvm0asyjuCXRychYSJFJO4VoOdyWy5Yi9fJ25FM5I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Mzs2Y4XhKusIzEiAqCPAnXddqVzi5DzB7CnvubIxuB+s4XRfToNZQNhlWwulDiHe/
	 3tu8br2IB4TNVHjK/D/LlaI+Ykjk0emzsv9qgJA2bLy2SUxZP6p8PKXAFdS+81CJzl
	 FUtK9BmxgaQbwiRFAkuBxQv39GuBPda/AKBvaipY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50M9ht97022072
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 03:43:55 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 03:43:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 03:43:54 -0600
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50M9hmO2086940;
	Wed, 22 Jan 2025 03:43:49 -0600
Message-ID: <b2413460-ec8b-4c77-99b8-4c32b262439a@ti.com>
Date: Wed, 22 Jan 2025 15:13:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mfd: syscon: Allow syscon nodes without a "syscon"
 compatible
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
        Arnd
 Bergmann <arnd@arndb.de>,
        Pankaj Dubey <pankaj.dubey@samsung.com>,
        Heiko
 Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla
	<sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Peter Griffin <peter.griffin@linaro.org>,
        Will McVicker
	<willmcvicker@google.com>,
        John Madieu <john.madieu.xa@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        "Kumar, Udit" <u-kumar1@ti.com>
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
 <20241217-syscon-fixes-v2-3-4f56d750541d@kernel.org>
Content-Language: en-US
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <20241217-syscon-fixes-v2-3-4f56d750541d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_014409_747685_B74A3F80 
X-CRM114-Status: GOOD (  32.17  )
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

Hi Rob,

On 17/12/24 23:41, Rob Herring (Arm) wrote:
> of_syscon_register_regmap() was added for nodes which need a custom
> regmap setup. It's not really correct for those nodes to claim they are
> compatible with "syscon" as the default handling likely doesn't work in
> those cases. If device_node_get_regmap() happens to be called first,
> then of_syscon_register() will be called and an incorrect regmap will be
> created (barring some other error). That may lead to unknown results in
> the worst case. In the best case, of_syscon_register_regmap() will fail
> with -EEXIST. This problem remains unless these cases drop "syscon" (an
> ABI issue) or we exclude them using their specific compatible. ATM,
> there is only one user: "google,gs101-pmu"
> 
> There are also cases of adding "syscon" compatible to existing nodes
> after the fact in order to register the syscon. That presents a
> potential DT ABI problem. Instead, if there's a kernel change needing a
> syscon for a node, then it should be possible to allow the kernel to
> register a syscon without a DT change. That's only possible by using
> of_syscon_register_regmap() currently, but in the future we may want to
> support a match list for cases which don't need a custom regmap.
> 
> With this change, the lookup functions will succeed for any node
> registered by of_syscon_register_regmap() regardless of whether the node
> compatible contains "syscon".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>   - Fix logic when a syscon is found in list to not return an error
> ---
>   drivers/mfd/syscon.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index bfb1f69fcff1d3cd35cf04ccd4c449e7d0395c79..226915ca3c93dcaf47bdd46b58e00e10e155f952 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -171,9 +171,12 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
>   			break;
>   		}
>   
> -	if (!syscon)
> -		syscon = of_syscon_register(np, check_res);
> -
> +	if (!syscon) {
> +		if (of_device_is_compatible(np, "syscon"))
> +			syscon = of_syscon_register(np, check_res);
> +		else
> +			syscon = ERR_PTR(-EINVAL);
> +	}

Earlier the above check was only in syscon_node_to_regmap() , but now 
the users of device_node_to_regmap() also undergoes this check and there 
are few drivers in tree which uses device_node_to_regmap() without 
having "syscon" in compatible, likely those drivers need to be fixed, 
but this patch breaks all those drivers now, atleast the below drivers 
are affected and all TI platforms fail to boot due to this:

drivers/soc/ti/k3-socinfo.c
drivers/mux/mmio.c ("reg-mux" users)
drivers/clk/keystone/syscon-clk.c

All the above drivers fail due to the above check for syscon compatible.

What is the recommended solution to fix this?

Thanks and Regards,
Vaishnav

>   	mutex_unlock(&syscon_list_lock);
>   
>   	if (IS_ERR(syscon))
> @@ -238,9 +241,6 @@ EXPORT_SYMBOL_GPL(device_node_to_regmap);
>   
>   struct regmap *syscon_node_to_regmap(struct device_node *np)
>   {
> -	if (!of_device_is_compatible(np, "syscon"))
> -		return ERR_PTR(-EINVAL);
> -
>   	return device_node_get_regmap(np, true);
>   }
>   EXPORT_SYMBOL_GPL(syscon_node_to_regmap);
> 

