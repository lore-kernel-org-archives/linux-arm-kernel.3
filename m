Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EE7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOXPh/dzcMCOBeutexVH3r7jDjAJmKX4ORLdOy5mjHs=; b=jrHAfjLaewJQwxZQYIzibf0feQ
	V/hMBCb3bvB4b/uk2MtlAfbXf+6MOUgg0kBKV72eks3A+jqrbwqu+aT8WEpb2kAd3Sz/5PFSwMB1C
	vJ5U5lI6LgOg4yhQyaBj0t15kNdiRnOF+DeQe7sin9VgO2iVkljIJxwelekQIi7YQQF1l6JBPfse7
	srtszpXU28c5oAl6Z9Rt/diY1r9RNs3Q7YLj0wq5bvFeYuCzQ5oVtwnPll1mosu/KjXe7UKIJS0Sh
	6WBUjacf5Xz0geGkmy1jvi3jjtKwdPt1XtlGXKboOBpwsrJb8wP4+4kkjjDep4VdChk9UIwKx1VmE
	24apU1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBac-00000008W01-10YL;
	Mon, 13 Jul 2026 08:00:34 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBaU-00000008Vyt-459i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:00:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lOXPh/dzcMCOBeutexVH3r7jDjAJmKX4ORLdOy5mjHs=;
	b=JH0fzRUX7nn0ujDAg0ZSSPUujBOFr4H33PuaY6kgCUdkLjg00IaB08VAbRscBKLjbLsUQTwlD
	d2e4FJTxRf9Sq2VrNVVXOJk8IXQYz0NwC5w0aKlfv6AM5IqFilCd71vhniNMjbMO2zo66MhI0Qy
	gQLLVUYGYs8xSEs/jPb2Uz0=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gzF430Vchz1cyTD;
	Mon, 13 Jul 2026 15:50:59 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B2DD1402AB;
	Mon, 13 Jul 2026 16:00:14 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 16:00:14 +0800
Message-ID: <8caccf2a-950b-411f-a5ff-a9bf70bd7926@huawei.com>
Date: Mon, 13 Jul 2026 16:00:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 32/36] arm64: suspend: Always initialise PSTATE.ALLINT
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-33-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-33-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_010027_506402_222DEF2C 
X-CRM114-Status: GOOD (  15.10  )
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



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> PSTATE.ALLINT is always set to the inverse of SCTLR_ELx.SPINTMASK,
> regardless of the value of SCTLR_ELx.NMI. SCTLR_ELx.NMI is initialised
> to 0 by default, so PSTATE.ALLINT does not cause any interrupt
> masking. With upcoming FEAT_NMI support, SCTLR_ELx.NMI will be set as
> part of the enable sequence.
> 
> However, during CPU suspend/resume, we reinitialise PSTATE to
> INIT_PSTATE_EL1. INIT_PSTATE_EL1 currently does not set
> PSR_ALLINT_BIT, but SCTLR_ELx.NMI is restored from the saved
> value. Since all exceptions are masked during CPU suspend/resume,
> avoid a state where SCTLR_ELx.NMI is restored to 1 but PSTATE.ALLINT
> is clear, since that would permit an NMI during resume.
> 
> Include PSR_ALLINT_BIT in INIT_PSTATE_EL1 so PSTATE.ALLINT is always
> set.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/ptrace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index 096d85d75bd7..ab1cf7669140 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -17,7 +17,7 @@
>  #define CurrentEL_EL2		(2 << 2)
>  
>  #define INIT_PSTATE_EL1 \
> -	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL1h)
> +	(PSR_ALLINT_BIT | PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL1h)

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  #include <linux/irqchip/arm-gic-v3-prio.h>
>  


