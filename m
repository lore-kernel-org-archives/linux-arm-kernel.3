Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9D1C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJld41FLGATux1CROpwP/oYwrbdVUooAfqJNLsxMyhY=; b=gizZHu3EviqzCzj+zw55Bctso4
	io2uYiwy+oGlkK5fi8X+Jle72GcXJGUcla15IOrdgAX0Ki+GluT582CfKcCkQ00LhMNCQwutuDP4I
	erTeD/twhLo41bJ/O2+8qaTxQnQadqLjQJn/0FGkx4cM4hLHdkF953WM/JGktY5MJ1gf3/kSVRDIB
	RxKncqvXcg84D4gw5oluzd3QYCV6niBZbaIv9qvyRJYF7svGoWpL9VAZGzDq1GkT5pm6ZLPblzQeC
	ga7YuoB7rAhXik/7AjanWD+KLvMP+LP0Q9djZADRw3nktUd/nQzU+wS4BehE3pHy6kJSTb3Nqb6zz
	VzzYK3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YwU-00000006sGv-1cXP;
	Mon, 07 Sep 2026 12:59:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YwR-00000006sG3-1e9X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:59:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7758D1476;
	Mon,  7 Sep 2026 05:59:13 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4F033F7D8;
	Mon,  7 Sep 2026 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788785957; bh=fs6D9307+D5ofEdJVbGr/fE9RQA62x0tlXgWzmyLjRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u233w6RGdA63wnnNOM1ASAwHeUBU9au3b10Ya20EViUQr9/u/7lzCA0HCjc7gpO6l
	 NEj+i2bTMvaL5FGzTDGLjpvKlyE8gThWSFwbZdk8fIdt0fARLgl6r4RJnSkSzPa/ai
	 WUpyFueqgRTQ4D5MDkaI/ABLRrSN3tYBa86tkZXM=
Message-ID: <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
Date: Mon, 7 Sep 2026 13:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Andre Przywara <andre.przywara@arm.com>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260902143757.3469690-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_055919_473252_867E2611 
X-CRM114-Status: GOOD (  18.01  )
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

Hi Andre,

On 02/09/2026 15:37, Andre Przywara wrote:
> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
> error value.
> 
> Check the returned value for this error condition, before passing the
> value on to other code, which would hide the negative number in some high
> value in the unsigned type.
> 
> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

This looks good to me. Out of interest what led you to find this?

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> ---
>  drivers/resctrl/mpam_resctrl.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953ab..a5e661eff86d7 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>  /* Find the L3 cache that has affinity with this CPU */
>  static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>  {
> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +
> +	if (cache_id < 0)
> +		return -ENOENT;
>  
>  	lockdep_assert_cpus_held();
>  


