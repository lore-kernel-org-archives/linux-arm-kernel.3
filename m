Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1288AC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxl0JlscOt8KvBg6at78h4KSNocazniOg7vaWLLKYPA=; b=I4w3bPtpUUIGYS8ZqY/M5+wJ1G
	/YcLdQSh5Kb5FumK/hVD53y0iM59BII53IK1zdNxD4/jadkZ3t2M+gU4EDSEbu2K2Z7SedrC0haYL
	57cn9xS1uEnMg/OdSE6nfV/mhPiwJUnp1Xzkz55dACEO9yw/ImwhsAcbGvSLezocY0ScF03VfuwM9
	8aHCLq9cRMLTtJs9/2NvaooFvcPk2GUozF0f1TemY+Tgws18kiLK/rK5/QR78KcAksEL1svSHZpFi
	EtNX19Sp3kW6O8ocZIZdnJ2EbuUlEiGTy2Mp7sSU0yqdpX5Xjl+ZwXvJomCK2Uzvyjg10Y3DRidb6
	/nRHWBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMyR-0000000D8az-1xQ9;
	Fri, 21 Aug 2026 10:59:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMyO-0000000D8aW-3bag
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:59:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E96351596
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 03:59:37 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8E5613F66F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787309981; bh=18vtLRzZ/1AiNuoaGkYSc9RUHIiM1aUgGl3jXeV3I1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRjnpHVx4jjWv9L4CB5YDru1BZffUfi4xnAygWZh/SoytOMW3JT6FQ45Olp/Namt2
	 x2A5Qy5LPGn5CAMUbm1/mEujDWmM/AvqgLnM8ELc869eoR1OI2ro2Eq409U8Kff13Q
	 Tg23Ip3l/tU/qScrwQODE1RdOXnIBTQnQoEJe+Uk=
Date: Fri, 21 Aug 2026 11:59:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: versatile: clock: Make sure clk_init_data is
 fully initialized
Message-ID: <aogvlFKhqzwyEwhY@e142607>
References: <cover.1787239869.git.geert+renesas@glider.be>
 <66afbce10c485164340a3947885cdf4217a4ee2d.1787239869.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66afbce10c485164340a3947885cdf4217a4ee2d.1787239869.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_035944_933039_85DAE4B4 
X-CRM114-Status: GOOD (  21.97  )
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

On Fri, Aug 21, 2026 at 10:52:24AM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> Compile-tested only.
> ---
>  arch/arm/mach-versatile/spc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
> index 7c3191aa3e12d1f3..d3f84819532fa498 100644
> --- a/arch/arm/mach-versatile/spc.c
> +++ b/arch/arm/mach-versatile/spc.c
> @@ -522,7 +522,7 @@ static struct clk_ops clk_spc_ops = {
>  
>  static struct clk *ve_spc_clk_register(struct device *cpu_dev)
>  {
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	struct clk_spc *spc;
>  
>  	spc = kzalloc_obj(*spc);
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

