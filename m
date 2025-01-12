Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD02E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 12:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16i8/HmQrvop6Wq90czxPGnG6F8sVpZRlEdmEypLhGg=; b=CL33bdBDrZ2GoT4eAkG63i2HKQ
	P/CQPUPZkA2ZEiZyMRaNQjJtEHELaOfE7zA8Rw/o+6gKb+xML4C3+c8Q85dixhDCRCmwE8bCs+jnY
	LL26tdf2eB/jLGxRFJbwzyCz8rCPJ9NwYcRQgRgUBTOd0aQEfpu442Xa8StykIsTk7+Qqz3d38qNG
	liTKz1/K/AZKQB3mTLXSnDSGWaciveFvrimT6+SMykfkk3AAClYF7nhPapSJjyOvhmiDi5caUWyLm
	5POEr99u+4we5AQMHEkdaw1TwQhiRMD6xIIP2C8+CNb1bSSbhxOLulARMDSzLspML38NoJdWg7d7Z
	pUV4npWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWxE1-00000002gPz-1Qit;
	Sun, 12 Jan 2025 12:37:53 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWxCh-00000002gIk-1q27
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 12:36:33 +0000
Message-ID: <ac947d88-750e-4058-aa3e-b539a09b89d0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736685386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=16i8/HmQrvop6Wq90czxPGnG6F8sVpZRlEdmEypLhGg=;
	b=XOzJkVkQ3/t6r0eAnc340BPC0gjMQa4eBTcCWyH8oWtCQ9H2vQXZNjYlnUcN2zqXW2jUy6
	9gHXwt9PRG05mv3Ho85bgnhhzaMCTLGf/pHyTsgp29lIqr+qupcNfngaijyVQpxGHRpCOJ
	F8tlJzh2UtZzKfU+iLqQ8R7FIFsS0Ps=
Date: Sun, 12 Jan 2025 20:35:32 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] net: stmmac: sti: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "'David S . Miller'" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109155842.60798-1-rgallaispou@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250109155842.60798-1-rgallaispou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_043631_838742_FF4B6A0A 
X-CRM114-Status: GOOD (  18.83  )
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


在 1/9/25 23:58, Raphael Gallais-Pou 写道:
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
>
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

LGTM!


Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng

> ---
> Changes in v2:
>    - Split serie in single patches
>    - Remove irrelevant 'Link:' from commit log
>    - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-5-c7d4c4856336@gmail.com
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
> index eabc4da9e1a9..de9b6dfef15b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
> @@ -313,7 +313,6 @@ static void sti_dwmac_remove(struct platform_device *pdev)
>   	clk_disable_unprepare(dwmac->clk);
>   }
>   
> -#ifdef CONFIG_PM_SLEEP
>   static int sti_dwmac_suspend(struct device *dev)
>   {
>   	struct sti_dwmac *dwmac = get_stmmac_bsp_priv(dev);
> @@ -333,10 +332,9 @@ static int sti_dwmac_resume(struct device *dev)
>   
>   	return stmmac_resume(dev);
>   }
> -#endif /* CONFIG_PM_SLEEP */
>   
> -static SIMPLE_DEV_PM_OPS(sti_dwmac_pm_ops, sti_dwmac_suspend,
> -					   sti_dwmac_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(sti_dwmac_pm_ops, sti_dwmac_suspend,
> +						  sti_dwmac_resume);
>   
>   static const struct sti_dwmac_of_data stih4xx_dwmac_data = {
>   	.fix_retime_src = stih4xx_fix_retime_src,
> @@ -353,7 +351,7 @@ static struct platform_driver sti_dwmac_driver = {
>   	.remove = sti_dwmac_remove,
>   	.driver = {
>   		.name           = "sti-dwmac",
> -		.pm		= &sti_dwmac_pm_ops,
> +		.pm		= pm_sleep_ptr(&sti_dwmac_pm_ops),
>   		.of_match_table = sti_dwmac_match,
>   	},
>   };

