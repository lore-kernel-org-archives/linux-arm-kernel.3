Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75707C5B574
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMNxsOBgRLiRtNEbZR+RBGoAu6lXQrIeFDnqZH/I5Ag=; b=xNWoOHHPXNEZ31OBz6FIUqpgAi
	OaEpUeRvPgS+D3c2G2Bp3eobKaahO6LPzRBUC32+aaLlCjXYlVcj2jWgmcjjyZbJ3z399mFHM0hFh
	cvbhVjX26DCaamgf1UpKX01H2KKnRD5xxrYjgW1beuywuCnwSndU27vLJDZLLBNjSBJsTVb5kahIc
	KQpIbtdI7R0EOZEzAHI8YN3c8C5I+1T0MFHAMCvDiRNUeRvi6KpUUUPQQ7HPE3SNQyc3BO+OLFb3J
	i6gQVtCZvi3cxCM5o/LXNFH/eW8blV7VQ2mlDsQOSw0Ty7fvqAMHC8t3yaO7zCXplGImQwyL7AqkJ
	ocsInWBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wth9f-0000000DXyC-2jzG;
	Tue, 11 Aug 2026 07:44:11 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wth9c-0000000DXxo-0JcM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 07:44:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NMNxsOBgRLiRtNEbZR+RBGoAu6lXQrIeFDnqZH/I5Ag=;
	b=sOkh+vz6SXoEioykK9obZ/PcIqLGZUFimF95mbpW307bSjfAxqJtdj9B0iVnA6LJPFqF2hedf
	Evp1C8QXm+udiTZ+h4CLc+ZQr/lvqr5+GemHytSNnlLKIpawxIkh/bJVyu/Ahn42sVGDUoot0uh
	rLgYEj+XYuVxz3ej29zmm78=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hK3K74mDjz1T4Fq;
	Tue, 11 Aug 2026 15:34:03 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 88EBC4057F;
	Tue, 11 Aug 2026 15:43:52 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Aug 2026 15:43:51 +0800
Message-ID: <1694f91a-1f0a-4e25-94c8-3885c4560eea@huawei.com>
Date: Tue, 11 Aug 2026 15:43:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 13/45] arm64: process: Use helper to check
 exception state
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-14-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-14-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_004408_300959_837BCD80 
X-CRM114-Status: GOOD (  14.32  )
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



在 2026/7/28 0:34, Vladimir Murzin 写道:
> debug_switch_state() explicitly checks the hardware exception state
> for both the pseudo-NMI and non-NMI paths. The expected state matches
> the NOIRQ_CONTEXT exception context introduced alongside the exception
> masking helpers and state checkers.
> 
> Use the helper instead of open-coding these checks.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/process.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 581f80e9b9b7..0fd09136d398 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -51,6 +51,7 @@
>  #include <asm/exec.h>
>  #include <asm/fpsimd.h>
>  #include <asm/gcs.h>
> +#include <asm/interrupts/common_flags.h>
>  #include <asm/mmu_context.h>
>  #include <asm/mpam.h>
>  #include <asm/mte.h>
> @@ -703,25 +704,7 @@ void update_sctlr_el1(u64 sctlr)
>  
>  static inline void debug_switch_state(void)
>  {
> -	if (system_uses_irq_prio_masking()) {
> -		unsigned long daif_expected = 0;
> -		unsigned long daif_actual = read_sysreg(daif);
> -		unsigned long pmr_expected = GIC_PRIO_IRQOFF;
> -		unsigned long pmr_actual = read_sysreg_s(SYS_ICC_PMR_EL1);
> -
> -		WARN_ONCE(daif_actual != daif_expected ||
> -			  pmr_actual != pmr_expected,
> -			  "Unexpected DAIF + PMR: 0x%lx + 0x%lx (expected 0x%lx + 0x%lx)\n",
> -			  daif_actual, pmr_actual,
> -			  daif_expected, pmr_expected);
> -	} else {
> -		unsigned long daif_expected = DAIF_PROCCTX_NOIRQ;
> -		unsigned long daif_actual = read_sysreg(daif);
> -
> -		WARN_ONCE(daif_actual != daif_expected,
> -			  "Unexpected DAIF value: 0x%lx (expected 0x%lx)\n",
> -			  daif_actual, daif_expected);
> -	}
> +	arm64_debug_exc_context(NOIRQ_CONTEXT);

Hi Vladimir,

After taking another look, I have a small suggestion:

if you postpone the introduction of arm64_debug_exc_context() and
arm64_debug_exc_hwstate() from the previous patch to this one, the code
review will be easier.

Best regards,
Jinjie

>  }
>  
>  /*


