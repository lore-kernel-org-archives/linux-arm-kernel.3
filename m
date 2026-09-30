Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2854BCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPDK1RjqVTTBwaQmns3VDkFuMdVJQ9yvuvr1V4jsZtU=; b=iPdKnJymn0hfUZit8mDVgBbYq+
	nd8R3qp8addB6pTS7Bsmo9vNWOWfzru0A3K1JtSJqpdkFUZAvGmECEhK0AhAA8CyQzo9aLRtrVFQ/
	Ek2vcOiBkSsfrlnxVsUSfirDbc1hBLiyvOfjYazNny1K4RDChuC4aqX54Yn4moj0BO7QEL1CUv4Za
	zXFq6a1aUYQHG9qPwsNyx0ASTHqAxayxI/NEWEVIx/Une6r/1cmoWTKshaqut1QEHrp2SIHzN77LO
	CkxENd4VXZvD0OQANR7VUzYAJqCJfO9McMX8qkZYV2LPBSrQnRV0lwP5dLbaFqEJ11EjRPJ7PtJ3/
	/zC+SpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Ge-00000007COU-0mYC;
	Wed, 30 Sep 2026 20:51:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1GX-00000007CMx-2gU9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:51:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C20E143D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:50:56 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45CF33F85F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790801459; bh=o6JsEQle2TgBGXyra/fkAAW50pTRLJXiPJdy1imZk68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=di2qgt1+E0o5tFCdR9GyLVt19Eyo1cbUiJV/sElqoiBz33UMZrpxqirTsZ6AtXW3g
	 BNHdCs9rPgrgTosipiK4/G8FlHd8tG4CcH45jpIg5R7AXG8blb3F6+huAGgtlkReBy
	 8tf2RSnfVryFaCtZGlwiYYQr81EcyV7min1j48kg=
Date: Wed, 30 Sep 2026 21:50:51 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Weigang He <geoffreyhe2@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: vexpress: fix device_node refcount leak in
 vexpress_smp_dt_prepare_cpus()
Message-ID: <ar12K0NGkuO9_XK_@e142607>
References: <20260925173252.933705-1-geoffreyhe2@gmail.com>
 <20260925173252.933705-3-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925173252.933705-3-geoffreyhe2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_135101_727532_D1A999D0 
X-CRM114-Status: GOOD (  24.07  )
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

On Sat, Sep 26, 2026 at 03:32:52AM +1000, Weigang He wrote:
> vexpress_smp_dt_prepare_cpus() obtains a reference to the SCU device
> node via of_find_matching_node() and passes it to of_iomap(), but never
> calls of_node_put() on it. of_iomap() does not take ownership of the
> node, so the reference is leaked. The function is the .smp_prepare_cpus
> hook invoked once from the __init SMP bring-up path, so this is a
> one-shot leak of a single refcount during boot, with no functional
> impact.
> 
> Annotate scu with the __free(device_node) cleanup attribute so the
> reference is released when the function returns.
> 
> Found while reviewing a CodeQL report for vexpress_flags_set() on the
> same SMP bring-up path.
> 
> Fixes: d2606f81d563 ("ARM: vexpress: Simplify SMP operations for DT-powered system")
> Assisted-by: LLM codeql
> Signed-off-by: Weigang He <geoffreyhe2@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> 
> Notes:
>     Compile-tested only (ARCH=arm multi_v7_defconfig, W=1). Not tested on
>     hardware; I have no Versatile Express board.
>     
>     The CodeQL query behind this report was synthesized with LLM assistance,
>     and the fix and changelog were drafted with LLM assistance; I have
>     reviewed them.
> 
>  arch/arm/mach-versatile/platsmp-vexpress.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-versatile/platsmp-vexpress.c b/arch/arm/mach-versatile/platsmp-vexpress.c
> index 1ee3c45e71c99..b810ad50b98ce 100644
> --- a/arch/arm/mach-versatile/platsmp-vexpress.c
> +++ b/arch/arm/mach-versatile/platsmp-vexpress.c
> @@ -61,8 +61,8 @@ static const struct of_device_id vexpress_smp_dt_scu_match[] __initconst = {
>  
>  static void __init vexpress_smp_dt_prepare_cpus(unsigned int max_cpus)
>  {
> -	struct device_node *scu = of_find_matching_node(NULL,
> -			vexpress_smp_dt_scu_match);
> +	struct device_node *scu __free(device_node) =
> +		of_find_matching_node(NULL, vexpress_smp_dt_scu_match);
>  
>  	if (scu)
>  		scu_enable(of_iomap(scu, 0));
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

