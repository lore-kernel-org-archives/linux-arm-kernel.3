Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1E8CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 06:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZXssrWO4VNoRsonbFVHKtNwsTR5/H1t40KyaHBjVhQ=; b=VMGKTM9sT1t81qMuFl67MXIZ4h
	cXyuOCbyktNbtTJziJfZgAvvWMDGkVBjLb/No11qC1UqLLaelaP2jHnvzKpIosNVzvab4eHiwiUW/
	oEe/+4RqMWp+ZDln1ruyx4vUagcnk9zuVOF2St689WLjOr375kKCV9Spmv0ypixA1enqqzwSJbQlO
	Q/2rYqsgq87cWjvsoD8uMJnZ/SHYcoRwWVzge2mCH32O/wsjI6/qKNr0RysqxajzG2JFcNmi6DdQj
	Nt4ACFyWazVHlOfyHPXA8s4Se+HtPyB+Ygdz7x7qhCaIexgGGNJGbELFccFHT1T80rje4lUVY3x00
	JDF3pVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhj5y-00000001QuO-1URo;
	Mon, 19 Jan 2026 06:50:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhj5t-00000001Qtr-3r37
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 06:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768805432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZXssrWO4VNoRsonbFVHKtNwsTR5/H1t40KyaHBjVhQ=;
	b=V0tpcc2alhvurgSf2oPyESnZzSQRYReC5Upf9zsSqYbUULAYGMjbla6uWShlCn8t5NT4Nj
	T4OCVbGP5KEb0lPKEBKSx3i1LChybpVNysQ0z7XMxhCTxhhcxe9AV1sDLupHhrcu/T2r/P
	iksdmJu9pIJUHMlzWOF7By3AGC22Hs8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-y5YhrYSHOfifByk-yB5lZQ-1; Mon, 19 Jan 2026 01:50:30 -0500
X-MC-Unique: y5YhrYSHOfifByk-yB5lZQ-1
X-Mimecast-MFC-AGG-ID: y5YhrYSHOfifByk-yB5lZQ_1768805429
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1f79d6afso44657055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 22:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768805429; x=1769410229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZXssrWO4VNoRsonbFVHKtNwsTR5/H1t40KyaHBjVhQ=;
        b=NFeHSjdI93nYzMr4ZRSvubfTESZyhqJ6K6txKjcI4n1s508qkpJf/NymSlg2gCk8sL
         mjlwFhZ3+6Z6J24FQcyii37+g+9yIQePjiVgjmslF6KpAIVxwdKN9k3sCeklluXhaUMl
         j8X60tAXFOVH2YDK9U1aGnkGz/VyR1R6eO9xESjenfPFpJrzwXciXJs5FKLpYTuPMgjB
         /Nk4EgwhNwF8CbnmhOLL6JWHoxEEqh2IbbW7FCqwp3BKP1X4XqhyFZBeABgs8a+ls0cb
         qnwq+o1KT2472mDXkw973IUsBNTiKfsPlBrAq8N927bgUcLmLHJUFe43YvQJzAnkpImx
         TFfg==
X-Forwarded-Encrypted: i=1; AJvYcCW+5gPnpDyTkhRpgfn7O/z8yrdWPFS8Gxv/rAQrT5Q+MJVR4v4lKXfSzfEHxD2uP9x2N/PPlyIZRk+S7RLsvpnN@lists.infradead.org
X-Gm-Message-State: AOJu0YzNproL+KH49Le6g+5Lo+FYIhgQK9OZo3NBlQqpmX3Yzn1MP9p0
	fWs0AEiq0As/0fMMIQHLzHd0qDbwwkUAKySDnjtI1a70pkfX8ok+sutD98CSLqIGooqVfDXeDep
	TK8XmBRz3RZjIEC6ZE1xezy06UHl9OKdc89FtogMfe7FjZZ8PDv+rSNF6FV20Ih6UvLa9pozSyk
	HL
X-Gm-Gg: AZuq6aK+2rKPwUbUAGCmDICMft/N/yHp1LnvbtSV1jMgCIaHcWDD2KJSV+g1dFza1cZ
	Yqp+JwAbMC5+l8NMqUhWEvAiPloqqR47VTpPPMVC6gOjd+DmYjly3pftelGdpTSG7sDAcIvoXgA
	Zx67ycsYBIVjHAgxaiBtdIrn0F46i6zrNTtOB+ifdhu3uGhOF/mAIzBIOKBqytszMPI5Cu4ii0+
	f/vQX2foIauk74XKKwQbuwDM3TMJRFLxj8P/EzeICg70UPY9ZzPb+vzM+uJc3sOmVEetVno8/lh
	ZDo4t82HNgBv1YRIkp6cElm7IsLSWwCuX+fTX28BWznQHm/EQx18oP/OBi7wdVElyGAWYQ+oA4d
	ff6oVPoww1yc=
X-Received: by 2002:a17:902:fc86:b0:295:9db1:ff3a with SMTP id d9443c01a7336-2a7188fc362mr96351245ad.28.1768805429478;
        Sun, 18 Jan 2026 22:50:29 -0800 (PST)
X-Received: by 2002:a17:902:fc86:b0:295:9db1:ff3a with SMTP id d9443c01a7336-2a7188fc362mr96351035ad.28.1768805429090;
        Sun, 18 Jan 2026 22:50:29 -0800 (PST)
Received: from [10.72.112.128] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dbed7sm85660715ad.63.2026.01.18.22.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 22:50:28 -0800 (PST)
Message-ID: <5c79d642-cd95-4c6b-9eeb-bd055719ca91@redhat.com>
Date: Mon, 19 Jan 2026 14:50:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/47] arm64: mpam: Add cpu_pm notifier to restore MPAM
 sysregs
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-10-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-10-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LKcc_Uv7ygdLuw6-yzU8OYgT4BJcA02PeCIWXdmdTMs_1768805429
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_225035_069451_620C9E3C 
X-CRM114-Status: GOOD (  22.28  )
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> The MPAM system registers will be lost if the CPU is reset during PSCI's
> CPU_SUSPEND.
> 
> Add a PM notifier to restore them.
> 
> mpam_thread_switch(current) can't be used as this won't make any changes if
> the in-memory copy says the register already has the correct value. In
> reality the system register is UNKNOWN out of reset.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   arch/arm64/kernel/mpam.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 

One question below...

> diff --git a/arch/arm64/kernel/mpam.c b/arch/arm64/kernel/mpam.c
> index e6feff2324ac..dbe0a2d05abb 100644
> --- a/arch/arm64/kernel/mpam.c
> +++ b/arch/arm64/kernel/mpam.c
> @@ -4,6 +4,7 @@
>   #include <asm/mpam.h>
>   
>   #include <linux/arm_mpam.h>
> +#include <linux/cpu_pm.h>
>   #include <linux/jump_label.h>
>   #include <linux/percpu.h>
>   
> @@ -13,12 +14,41 @@ DEFINE_PER_CPU(u64, arm64_mpam_current);
>   
>   u64 arm64_mpam_global_default;
>   
> +static int mpam_pm_notifier(struct notifier_block *self,
> +			    unsigned long cmd, void *v)
> +{
> +	u64 regval;
> +	int cpu = smp_processor_id();
> +
> +	switch (cmd) {
> +	case CPU_PM_EXIT:
> +		/*
> +		 * Don't use mpam_thread_switch() as the system register
> +		 * value has changed under our feet.
> +		 */
> +		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
> +		write_sysreg_s(regval, SYS_MPAM1_EL1);
> +		isb();
> +
> +		write_sysreg_s(regval, SYS_MPAM0_EL1);
> +
> +		return NOTIFY_OK;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +static struct notifier_block mpam_pm_nb = {
> +	.notifier_call = mpam_pm_notifier,
> +};
> +
>   static int __init arm64_mpam_register_cpus(void)
>   {
>   	u64 mpamidr = read_sanitised_ftr_reg(SYS_MPAMIDR_EL1);
>   	u16 partid_max = FIELD_GET(MPAMIDR_EL1_PARTID_MAX, mpamidr);
>   	u8 pmg_max = FIELD_GET(MPAMIDR_EL1_PMG_MAX, mpamidr);
>   
> +	cpu_pm_register_notifier(&mpam_pm_nb);

Need we ensure MPAM capability exists in the hardware before the notifier is registerred?
Otherwise, mpam_pm_notifier() can accesses SYS_MPAM0_EL1 and SYS_MPAM1_EL1 system registers
which may not supported by the hardware.

>   	return mpam_register_requestor(partid_max, pmg_max);
>   }
>   /* Must occur before mpam_msc_driver_init() from subsys_initcall() */

Thanks,
Gavin


