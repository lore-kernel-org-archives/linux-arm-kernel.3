Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37524105F784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHwYA1W1IQi+TgYZi6GrR6X4lMBE3zhq0tACs7lCsMY=; b=t0OIWdNXAbcNdnGdC1JvMh6AnL
	XVEnJEDOQYnemOspNbMCn+FPCXo88uedkrpyF75JgAXtySFbiQRJMGI4owbrtztNS5SuUcUZq9LSu
	5a0z18XV5KnriIpGNJ1wKKtYX2QoHWM1TlTlv4bRaI+PxFElsXOH1k4Ew81GWhWN4TaK1WBlhZr4F
	jzfWludK3cRD3k9iImbz+zi/Qm2MSTKY6RdIB8VSr5+lgnYjRd+PMRNCNbDBbPtTMPpZfK6Iz1u3B
	oX3Z1MRJ+ujWar6oSF+JhqhdtzWqjpufaCRnG0EXb6N2YbPopnGvxUkGDgDMYTSkGBIG7F4uOvwnv
	wdxNq8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z8j-0000000HQJP-0aiM;
	Fri, 13 Mar 2026 09:49:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z8g-0000000HQIB-18d0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:49:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA84443B0C;
	Fri, 13 Mar 2026 09:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3000C2BC86;
	Fri, 13 Mar 2026 09:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773395341;
	bh=oAgFwrScPql2AWiBscKgibXmMr5JSzF2SqWNp5f2qZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kTw1ztA3KdCSP6Mv215qu8SBoPDb5oJ/cwv4S7mrqECq33qLuVHX/kyqNV3+oUyjF
	 nG+oU4DcMcQt+fXw6U7b1T0x6YE0K2N8AYSLzHhpMQzmRL0cQ7paognxx6gFHGHLtE
	 pmWm4TygnnqMZwLMLUVhNBuhGp4m/5On8thpLrkKqLHe6xQh3UcFgLF/vOFnUoR8kO
	 27KkcAsLYKGaRAA9dvTNKpYfOIbTNJHmiXU3tKiy6GxVI/sy2JcpxFPElSJOl4HdnL
	 xAH63oGiBMy+hHpuZF5TZtYENpYXxJgnGPVkigzqijfmLIhLSrOakYngzhFkQa6Xlt
	 VPhmZddj+fQaQ==
Message-ID: <7e0425c2-debe-448a-a5f9-26039de71db5@kernel.org>
Date: Fri, 13 Mar 2026 10:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qe: Fix potential NULL pointer dereference in
 qe_reset()
To: Wang Jun <1742789905@qq.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, gszhai@bjtu.edu.cn, 25125332@bjtu.edu.cn,
 25125283@bjtu.edu.cn, 23120469@bjtu.edu.cn
References: <tencent_770FE404794D670E2ACDFA144EFDA35AC305@qq.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <tencent_770FE404794D670E2ACDFA144EFDA35AC305@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_024902_348121_283D9A76 
X-CRM114-Status: GOOD (  17.96  )
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



Le 10/03/2026 à 13:11, Wang Jun a écrit :
> [Vous ne recevez pas souvent de courriers de 1742789905@qq.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The function qe_reset() uses qe_immr without checking if it is NULL,
> which could happen if ioremap() failed earlier. Add a NULL check and
> perform ioremap() if needed; if it still fails, print an error and
> return to avoid crashing the system.

I don't understand what you are trying to say here. What you say is 
already what qe_reset() does: it does a NULL check and performs 
ioremap() when it is NULL:

	if (qe_immr == NULL)
		qe_immr = ioremap(get_qe_base(), QE_IMMAP_SIZE);

You are adding a second NULL check and return early from qe_reset(). But 
it doesn't really fix the problem because qe_immr is used in many other 
places so you are just delaying the problem.

What needs to be done is that if qe_immr remap fails, all drivers 
depending on it don't get probed.

> 
> Signed-off-by: Wang Jun <1742789905@qq.com>
> ---
>   drivers/soc/fsl/qe/qe.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index 70b6eddb867b..6dcfa340970a 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -86,8 +86,13 @@ static phys_addr_t get_qe_base(void)
> 
>   void qe_reset(void)
>   {
> -       if (qe_immr == NULL)
> +       if (qe_immr == NULL) {
>                  qe_immr = ioremap(get_qe_base(), QE_IMMAP_SIZE);
> +               if (qe_immr == NULL) {
> +                       pr_err("QE: cannot remap IMMR\n");
> +                       return;
> +               }
> +       }
> 
>          qe_snums_init();
> 
> --
> 2.43.0
> 


