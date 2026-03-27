Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8032710F2847
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUEZks4x/9zrB6DR0cw2vj0qgVoIUSANY0gtCLSKC4c=; b=tVIFRQZC4x4eiUQyBdtCEi05yt
	SBxClLf7tDkHYKc0sdvsERZxhsq5/cwN5d20e2urar5d9/9kq2O12M06UzjM1FNkxN/mus5ur6RhW
	QsTZ8KkD+r4pZO7FJQ6NYYV4XAimLNFFxvTANmcCeYHgZc+ArddktWtRf13/ZlnyQT/jWmvpkqxrV
	dsasu/0mWeZBnrV/09z0e8dS1RxSTTiGsOb/iairbo6xlzoblZSMS+74aH9d92/2hE4+1gYAYYFh3
	pSHebkgfVyy/ol4Zhg/5riW6vEGXaXkDQ8g35+zGLQHMJ05js2GTDgKZNEZAtUjvra05mjkeo+OcZ
	zcDlHIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69MH-00000007i5W-2hKg;
	Fri, 27 Mar 2026 15:44:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69MF-00000007i4Z-1uYc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 15:44:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABB1535E4;
	Fri, 27 Mar 2026 08:44:16 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C4633F99C;
	Fri, 27 Mar 2026 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774626262; bh=ktCsuITkeBYilevOVUYsMJKfPzlsaPL+Amy1bQke5kQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QyKOD02ap3u6W0HbwKNpGZxnINnj6qVEp2p7uv3a3Fbsc95R3+VymLXigUBrkseEP
	 66iVYo4HbjOhXgWFZUmxrbCmpWhzgHdUBm7zivEV1qoyHRTqLfG3l+e4yKoJj/eRen
	 vbE+gNflv7Hy7rdOr8+juVXYGnqeX8keDHaqzW5I=
Message-ID: <4be15244-f39e-45ba-86c2-a447d98fe1c4@arm.com>
Date: Fri, 27 Mar 2026 15:44:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/40] arm64: mpam: Initialise and context switch the
 MPAMSM_EL1 register
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
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-12-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260313144617.3420416-12-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084423_542430_FEB065D4 
X-CRM114-Status: GOOD (  20.20  )
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
> The MPAMSM_EL1 sets the MPAM labels, PMG and PARTID, for loads and stores
> generated by a shared SMCU. Disable the traps so the kernel can use it and
> set it to the same configuration as the per-EL cpu MPAM configuration.
> 
> If an SMCU is not shared with other cpus then it is implementation
> defined whether the configuration from MPAMSM_EL1 is used or that from
> the appropriate MPAMy_ELx. As we set the same, PMG_D and PARTID_D,
> configuration for MPAM0_EL1, MPAM1_EL1 and MPAMSM_EL1 the resulting
> configuration is the same regardless.
> 
> The range of valid configurations for the PARTID and PMG in MPAMSM_EL1 is
> not currently specified in Arm Architectural Reference Manual but the
> architect has confirmed that it is intended to be the same as that for the
> cpu configuration in the MPAMy_ELx registers.

Reviewed-by: James Morse <james.morse@arm.com>


> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
> index 0747e0526927..6bccbfdccb87 100644
> --- a/arch/arm64/include/asm/mpam.h
> +++ b/arch/arm64/include/asm/mpam.h
> @@ -53,6 +53,8 @@ static inline void mpam_thread_switch(struct task_struct *tsk)
>  		return;
>  
>  	write_sysreg_s(regval | MPAM1_EL1_MPAMEN, SYS_MPAM1_EL1);
> +	if (system_supports_sme())
> +		write_sysreg_s(regval & (MPAMSM_EL1_PARTID_D | MPAMSM_EL1_PMG_D), SYS_MPAMSM_EL1);

Doing it here saves a surprise later.


>  	isb();
>  	/* Synchronising the EL0 write is left until the ERET to EL0 */

(down here would have been the alternative)


Thanks,

James

