Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE3C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 06:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gw8sdwn9YrXcMgcEnLjH8QAQ34Io25gnkj7H5SzHvaI=; b=BDROxhrJS3JtmZ52X0t2y3+UuF
	DQBnuGUWAqJsX00VRwVkikMXzpkqvrK2WU84DIn8aC9gbwOzMuAAUcdgPwGT2rFX/ZiswqlMlRNqE
	R0hYsiQm7FXwlAw8QB/bboGZ8wm/PBX8vX4Ubb605fbffrU5YN6Dyr6lx6dOilANzr/KdwOsfKl5S
	qYfRZ4wkHsoL79um9zu7KIvNdI83oD4l+sY7TvxLEmmRN7toSiS+UYP/NOxsTiFDeyIsTewrdnWCe
	LTR93kVcwqBUKH5vtl9guyJXh2v9dkV72ntWTZK50KV+pERWoqUy9JBQdS1VKct98pIYQwRfVswhH
	ONHMYxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJSu-0000000B5di-3YAA;
	Mon, 10 Aug 2026 06:26:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJSp-0000000B5cA-3XY6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 06:26:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B86D14BF;
	Sun,  9 Aug 2026 23:26:16 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E8813F632;
	Sun,  9 Aug 2026 23:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786343180; bh=OfL0WTLW/+L+9SOhGAZ+WsKn8S9p1RbiZA2iTbPILpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSWa+KHo0QF1RysLWpqEJRGXCq3QKskqxkvb8PNtZqzQXvwzMeJkP78ki3VPRcJ0n
	 fn7E5lvb2CMfiU0bgTJK8zFJyjX2SA2KvHtdZAWQmZFMfUEPJk+fnnbIqgE/dHThnB
	 GzdFU3Yu7UrZGa8txrnWxwIXBo3tJ1TZHC5CN6Zs=
Date: Mon, 10 Aug 2026 08:26:07 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: seanwang1 <seanwang1@lenovo.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sumit Gupta <sumitg@nvidia.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Xuewen Yan <xuewen.yan@unisoc.com>
Subject: Re: [PATCH] arm64: topology: fix arch_cpu_idle_enter()
Message-ID: <anlu_3eDiRLG6liF@arm.com>
References: <20260807135216.9919-1-seanwang1@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807135216.9919-1-seanwang1@lenovo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_232624_002631_F0093F71 
X-CRM114-Status: GOOD (  20.07  )
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

On Fri, Aug 07, 2026 at 09:52:16PM +0800, seanwang1 wrote:
> arch_cpu_idle_enter() directly calls amu_scale_freq_tick() to update
> arch_freq_scale when CPU enters idle state. This bypasses the sft_data
> pointer check that topology_clear_scale_freq_source() relies on.
> 
> As a result, even after calling topology_clear_scale_freq_source() with
> SCALE_FREQ_SOURCE_ARCH to disable AMU-based frequency scaling, the
> arch_freq_scale value can still be modified by AMU counters when the
> CPU goes idle through the arch_cpu_idle_enter() path.
> 
> Fix by replacing the direct amu_scale_freq_tick() call with
> topology_scale_freq_tick(), which is the generic interface for updating
> frequency scale and properly respects the sft_data pointer state.
> 
> Co-developed-by: Xuewen Yan <xuewen.yan@unisoc.com>
> Signed-off-by: Sean Wang <seanwang1@lenovo.com>
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---
>  arch/arm64/kernel/topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index b32f13358fbb..f617ef5c9903 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -176,7 +176,7 @@ void arch_cpu_idle_enter(void)
>  	/* Kick in AMU update but only if one has not happened already */
>  	if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
>  	    time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))
> -		amu_scale_freq_tick();
> +		topology_scale_freq_tick();
>  }
That actually changes semantics here. This path is strictly AMU-oriented and
topology_scale_freq_tick is a dispatcher that does not really care about the
actual source of the scale info. So it would be best if this could verify
whether AMUs are the current source and call a tick only then, bailing out
otherwise.

---
BR
Beata
>  
>  #define AMU_SAMPLE_EXP_MS	20
> -- 
> 2.25.1
> 

