Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4990910F2847
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqciCqleIMXMJj69G2Cs90TrxbSoh01TxPHC3DkiCoQ=; b=iQKf17V/kBzTbs4hi5IiHTJ7vx
	dMjrW1uvlRWNJgEoEhLoSxt/wh4ivKlaG/UT389yNtySMord+JGC85ANz+gLXVfAZYkH9B/Eyqi6C
	k0yskcz+uHEVuIym3kmWIjP+avPLII61t1q5D+FAZx4ugQf0UFFDEKas/zEV5FxfZKZyvXYW2PkZQ
	T5hVgW33j626kn8ukse1/UefH/juQp38UOriwzR8StGZufBDQFsQRbvtRR0saS1cuxeuII4Hp8N0e
	KUGNBSARVMFBK0rfSuVMJGX/FVIilUbFAYItH5mSNZRQiu/Hi244Yz4lmU+rPAAz6zYOcSoHZon8e
	+1+kslPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Mj-00000007iAu-41E4;
	Fri, 27 Mar 2026 15:44:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Mf-00000007iA5-0m1x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 15:44:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45FFF35E6;
	Fri, 27 Mar 2026 08:44:41 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4C313F99C;
	Fri, 27 Mar 2026 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774626287; bh=gYyaxvQ4I4LDpFFA8rjENTkcbOL6GQqU7RWhk1r/eV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WHeQx+2odybSQ9W+vmVFdjHEtHFJQiSxqT+I3tNHIzK45869BfJvc2bVpZBNd+HVf
	 EomQqhZjbSzRZzb7jU4NR7U8PS+3gLbRvhw6FGUm/VfFygEk2chAa/68+icUChKDgB
	 V+lEHEdMxfjJAS04EZbv0aM3fhyDhGljAeuM9o50=
Message-ID: <51b3ac37-0da6-4006-be1b-5fedcf24af0f@arm.com>
Date: Fri, 27 Mar 2026 15:44:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/40] arm_mpam: resctrl: Hide CDP emulation behind
 CONFIG_EXPERT
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-22-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260313144617.3420416-22-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084449_356776_37F5954D 
X-CRM114-Status: GOOD (  23.62  )
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

On 13/03/2026 14:45, Ben Horgan wrote:
> When CDP is not enabled, the 'rmid_entry's in the limbo list,
> rmid_busy_llc, map directly to a (PARTID,PMG) pair and when CDP is enabled
> the mapping is to two different pairs.

> As the limbo list is reused between
> mounts and CDP disabled on unmount this can lead to stale mapping and the
> limbo handler will then make monitor reads with potentially out of range
> PARTID.

Bother - I missed that!


> This may then cause an MPAM error interrupt and the driver will
> disable MPAM.

... and that's why it's not a problem on x86 because the RMID range is unaffected by CDP,
whereas MPAM works on a combined value.


> No problems are expected if you just mount the resctrl file system
> once with CDP enabled and never unmount it.

(guess how it was tested!)


> Hide CDP emulation behind CONFIG_EXPERT to protect the unwary.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Adding this ugliness in the hope of avoiding patch churn and extra
> reviewer work. I am looking into the resctrl changes needed to fix this.

Makes sense - people can still use this if they're aware of the limitation, and it sounds
like you've got a plan to fix it properly. We just don't want it enabled in distros until
then.


> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 903d1a0f564f..cab3e9ccb5c7 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -82,6 +82,18 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
>  	int cpu;
>  
> +	if (!IS_ENABLED(CONFIG_EXPERT) && enable) {
> +		/*
> +		 * If the resctrl fs is mounted more than once, sequentially,
> +		 * then CDP can lead to the use of out of range PARTIDs.
> +		 */
> +		pr_warn("CDP not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (enable)
> +		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
> +
>  	/*
>  	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>  	 * false on error and unmount.

Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

